package cc.coopersoft.construct.fire.service;

import cc.coopersoft.common.business.BusinessDescription;
import cc.coopersoft.common.business.BusinessKey;
import cc.coopersoft.common.construct.corp.CorpProperty;
import cc.coopersoft.common.construct.project.BuildRegInfo;
import cc.coopersoft.common.construct.project.Project;
import cc.coopersoft.construct.fire.model.*;
import cc.coopersoft.construct.fire.model.template.TableTemplate;
import cc.coopersoft.construct.fire.repository.FireCheckRepository;
import cc.coopersoft.construct.fire.repository.TableTemplateRepository;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.wujun234.uid.UidGenerator;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.RandomUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.*;

@Service
@Slf4j
public class BusinessService {

    public enum ProjectFireCheckStatus{
        None,
        PartQualified,
        Qualified,
        Unqualified,
        RUNNING,
    }


    private static final String FIRE_CHECK_BUSINESS_DEFINE = "FIRE_CHECK";

    private static final String BUSINESS_CORP_SEARCH_CATEGORY = "CORP";
    private static final String BUSINESS_PROJECT_SEARCH_CATEGORY = "PROJECT";

    private final RemoteService remoteService;
    private final FireCheckRepository fireCheckRepository;
    private final ReportService reportService;
    private final TableTemplateRepository tableTemplateRepository;

    @Resource
    private UidGenerator cachedUidGenerator;

    public BusinessService(RemoteService remoteService,
                           FireCheckRepository fireCheckRepository,
                           ReportService reportService, TableTemplateRepository tableTemplateRepository) {
        this.remoteService = remoteService;
        this.fireCheckRepository = fireCheckRepository;
        this.reportService = reportService;
        this.tableTemplateRepository = tableTemplateRepository;
    }

    public ProjectFireCheckStatus projectFireCheckStatus(long code){
        if (fireCheckRepository.existsByStatusAndInfoProjectCode(FireCheck.Status.Running,code)) {
            return ProjectFireCheckStatus.RUNNING;
        }else if (fireCheckRepository.existsByInfoSpecialIsFalseAndInfoQualifiedIsFalseAndStatusAndInfoProjectCode(FireCheck.Status.Unqualified,code)){
            return ProjectFireCheckStatus.Unqualified;
        }else if (fireCheckRepository.existsByInfoPartIsFalseAndStatusAndInfoProjectCode(FireCheck.Status.Qualified,code)){
            return ProjectFireCheckStatus.Qualified;
        }else if (fireCheckRepository.existsByInfoPartIsTrueAndStatusAndInfoProjectCode(FireCheck.Status.Qualified,code)) {
            return ProjectFireCheckStatus.PartQualified;
        }else{
            return ProjectFireCheckStatus.None;
        }
    }

    @Transactional
    public void fileCheck(long id , List<CheckFile> files){
        FireCheck check = fireCheckRepository.findById(id).orElseThrow();
        files.forEach(file -> {
            file.setId(cachedUidGenerator.getUID());
            file.setCheck(check);
        });
        check.getFiles().clear();
        check.getFiles().addAll(files);
        fireCheckRepository.save(check);
    }

    @Transactional
    public void buildOpinion(long id, List<BuildCheckOpinion> opinions){
        FireCheck check = fireCheckRepository.findById(id).orElseThrow();
        check.getInfo().getBuilds().forEach(build -> {
            opinions.forEach(opinion -> {
                if (opinion.getCode() == build.getCode()){
                    build.setOpinion(opinion.getOpinion());
                    build.setPass(opinion.getPass());
                }
            });
        });
        fireCheckRepository.save(check);
    }


    public Optional<FireCheck> fireCheck(long id){
        return fireCheckRepository.findById(id);
    }


    public Optional<FireCheck> getPrepare(long corp, long project ){
        return fireCheckRepository.findByCorpAndStatusAndInfoProjectCode(corp,FireCheck.Status.Prepare, project);
    }

    @Transactional
    public void delPrepare(long corp, long id){
        fireCheckRepository.deleteByCorpAndStatusAndId(corp, FireCheck.Status.Prepare,id);
    }

    @Transactional
    public FireCheck prepareBusiness(FireCheck check){

        if (fireCheckRepository.existsByCorpAndStatusAndInfoProjectCode(check.getCorp(), FireCheck.Status.Prepare, check.getInfo().getProjectCode())){
            throw new IllegalArgumentException("has prepare");
        }
        check.setType(FireCheck.Type.First);
        check.setStatus(FireCheck.Status.Prepare);
        check.setApplyTime(new Date());

        create(check);
        addCheckTable(check.getInfo());
        remoteService.initBusinessDocuments(check.getCorp(),check.getId(),FIRE_CHECK_BUSINESS_DEFINE);

        reportService.applyReport(check);

        return fireCheckRepository.save(check);
    }

    @Transactional
    public FireCheck runPrepareBusiness(long corp, long id){
        FireCheck check = fireCheckRepository.findById(id).orElseThrow();
        if (check.getCorp() != corp){
            throw new IllegalArgumentException("not apply corp");
        }
        if (fireCheckRepository.existsByStatusAndInfoProjectCode(FireCheck.Status.Running,check.getInfo().getProjectCode())){
            throw new IllegalArgumentException("project is in check!");
        }

        if (fireCheckRepository.existsByInfoSpecialIsFalseAndInfoQualifiedIsFalseAndStatusAndInfoProjectCode(FireCheck.Status.Unqualified,check.getInfo().getProjectCode())){
            throw new IllegalArgumentException("project need review !");
        }


        check.setStatus(FireCheck.Status.Running);

        int randomInt = RandomUtils.nextInt(100);
        check.getInfo().setInRandom(randomInt < 10);

        return createBusinessFlow(check,BusinessDescription.Source.Outside);
    }

    @Transactional
    public FireCheck createBusiness(FireCheck check, BusinessDescription.Source source){
        check.setType(FireCheck.Type.First);
        check.setStatus(FireCheck.Status.Running);
        create(check);

        reportService.applyReport(check);
        return createBusinessFlow(check, source);
    }

    private FireCheck reviewBusiness(long corp, FireCheck origin){
        origin.getInfo().getProject().getCorps().stream().filter(c -> c.getCode() == corp).findFirst().orElseThrow(() -> new IllegalArgumentException("corp not in project"));
        FireCheck check = new FireCheck();
        check.setCorp(corp);
        check.setApplyTime(new Date());
        check.setId(cachedUidGenerator.getUID());
        check.setType(FireCheck.Type.Review);
        check.setInfo(origin.getInfo());
        reportService.applyReport(check);
        return check;
    }

    @Transactional
    public FireCheck reviewBusiness(long projectCode){
        if (fireCheckRepository.existsByStatusAndInfoProjectCode(FireCheck.Status.Running,projectCode)){
            throw new IllegalArgumentException("project is in check!");
        }
        FireCheck origin = fireCheckRepository.findByInfoSpecialIsFalseAndInfoQualifiedIsFalseAndStatusAndInfoProjectCode(FireCheck.Status.Unqualified,projectCode).orElseThrow();

        FireCheck check = reviewBusiness(origin.getCorp(), origin);
        check.setStatus(FireCheck.Status.Running);
        return createBusinessFlow(check,  BusinessDescription.Source.Inside);

    }

    @Transactional
    public FireCheck reviewBusiness(long corp, long projectCode){
        if (fireCheckRepository.existsByStatusAndInfoProjectCode(FireCheck.Status.Running,projectCode)){
            throw new IllegalArgumentException("project is in check!");
        }
        FireCheck origin = fireCheckRepository.findByInfoSpecialIsFalseAndInfoQualifiedIsFalseAndStatusAndInfoProjectCode(FireCheck.Status.Unqualified,projectCode).orElseThrow();

        FireCheck check = reviewBusiness(corp, origin);

        check.setStatus(FireCheck.Status.Prepare);
        return fireCheckRepository.save(check);
    }

    private void addCheckTable(FireCheckInfo check){
        for(TableTemplate tableTemplate: this.tableTemplateRepository.findAll()){
            check.getItems().add(new CheckTable(check,tableTemplate));
        }
        for(CheckTable table: check.getItems()){
            table.setId(cachedUidGenerator.getUID());
            for (CheckItem item: table.getItems()){
                item.setId(cachedUidGenerator.getUID());
                for(CheckSubItem subItem: item.getItems()){
                    subItem.setId(cachedUidGenerator.getUID());
                    for(CheckContent content: subItem.getContents()){
                        content.setId(cachedUidGenerator.getUID());
                    }
                }
            }
        }
    }

    private FireCheck createBusinessFlow(FireCheck check, BusinessDescription.Source source){

        check.setApplyTime(new Date());

//        check.getReports().add(reportService.applyReport(check));
//        if (!check.getInfo().getItems().isEmpty())
//            check.getReports().add(reportService.applyItemsReport(check));


        FireCheck result = fireCheckRepository.saveAndFlush(check);

        //  start business process
        BusinessDescription.Description description = new BusinessDescription.Description();

        description.setDescriptionMap(descriptionCheck(result));
        description.setTags(tagCorps(result));
        description.setKeys(checkKeys(result.getInfo()));

        description.setSource(source);
        BusinessKey corpKey = new BusinessKey(BUSINESS_CORP_SEARCH_CATEGORY);
        for(ProjectCorp corp: result.getInfo().getProject().getCorps()){
            corpKey.addKey(String.valueOf(corp.getCode()));
        }
        description.getBusinessKeys().add(corpKey);

        description.getBusinessKeys().add(new BusinessKey(BUSINESS_PROJECT_SEARCH_CATEGORY,String.valueOf(result.getInfo().getProjectCode())));


        Long id = remoteService.startBusiness(FIRE_CHECK_BUSINESS_DEFINE,result.getId(),description).block();

        if (id == null ||  !id.equals(result.getId()) ){
            throw new IllegalStateException("business id error!");
        }
        return result;
    }




    private void create(FireCheck check){
        if (fireCheckRepository.existsByStatusAndInfoProjectCode(FireCheck.Status.Running,check.getInfo().getProjectCode())){
            throw new IllegalArgumentException("project is in check!");
        }

        if (fireCheckRepository.existsByInfoSpecialIsFalseAndInfoQualifiedIsFalseAndStatusAndInfoProjectCode(FireCheck.Status.Unqualified,check.getInfo().getProjectCode())){
            throw new IllegalArgumentException("project need review !");
        }

        check.setId(cachedUidGenerator.getUID());


            check.getInfo().setId(check.getId());
            if (check.getInfo().isSpecial()){
                check.getInfo().setInRandom(true);
            }else{
                int randomInt = RandomUtils.nextInt(100);
                check.getInfo().setInRandom(randomInt < 10);
            }


        check.getInfo().setQualified(false);


        Project.Default project = remoteService.project(check.getInfo().getProjectCode()).block();

        if (project == null || !project.isEnable()){
            throw new IllegalArgumentException("project not found or is disabled!");
        }
        check.getInfo().setProject(FireProject.instance(check.getInfo(),project));

        check.getInfo().getProject().getCorps().stream().filter(corp ->
                corp.getCode() == check.getCorp()
        ).findFirst().orElseThrow(() -> new IllegalArgumentException("corp not in project"));

        for(BuildCheck buildCheck: check.getInfo().getBuilds()){
            buildCheck.setId(cachedUidGenerator.getUID());
            buildCheck.setInfo(project.getBuilds()
                    .stream()
                    .filter((b) -> b.getCode() == buildCheck.getCode())
                    .findAny()
                    .map(BuildRegInfo::getInfo)
                    .map((build) -> ProjectBuildInfo.builder()
                            .id(buildCheck.getId())
                            .name(build.getName())
                            .landArea(build.getLandArea())
                            .structure(build.getStructure())
                            .onCount(build.getOnCount())
                            .underCount(build.getUnderCount())
                            .onArea(build.getOnArea())
                            .underArea(build.getUnderArea())
                            .height(build.getHeight())
                            .check(buildCheck)
                            .build()).orElseThrow());
        }


    }

    private Map<String,Object> descriptionCheck(FireCheck check){
        ObjectMapper mapper = new ObjectMapper();

        try {
            String info = mapper.writerWithView(FireProject.Title.class).forType(FireProject.class).writeValueAsString(check.getInfo().getProject());
            Map<String,Object> result = mapper.readerFor(Map.class).readValue(info);


            result.put("applyType",check.getType());
            result.put("inRandom",check.getInfo().isInRandom());
            result.put("special", check.getInfo().isSpecial());

            for(ProjectCorp corp: check.getInfo().getProject().getCorps()){
                if (corp.getCode() == check.getCorp() ){
                    result.put("applyCorp",corp.getName());
                }
                if (CorpProperty.Developer.equals(corp.getProperty()) ){
                    result.put("developer",corp.getName());
                }
            }


            return result;

        } catch (IOException e) {
            log.error("convert business description error!", e);
            throw new IllegalStateException("convert business description error!",e);
        }
    }




    private Map<String,String> tagCorps(FireCheck check){
        Map<String,String> result = new HashMap<>();
        for(ProjectCorp corp: check.getInfo().getProject().getCorps()){
            result.put(corp.getName(),check.getCorp() == corp.getCode() ? "Primary" : "Basic");
        }
        return result;
    }

    private String checkKeys(FireCheckInfo check){
        String keys = String.valueOf(check.getProjectCode());

        keys = keys.trim() + " " + StringUtils.defaultIfBlank(check.getApplyFile(),"");
        keys = keys.trim() + " " + StringUtils.defaultIfBlank(check.getConstructFile(),"");
        keys = keys.trim() + " " + StringUtils.defaultIfBlank(check.getFireFile(),"");
        keys = keys.trim() + " " + StringUtils.defaultIfBlank(check.getContracts(),"");
        keys = keys.trim() + " " + StringUtils.defaultIfBlank(check.getTel(), "");
        keys = keys.trim() + " " + StringUtils.defaultIfBlank(check.getProject().getName(),"");
        keys = keys.trim() + " " + StringUtils.defaultIfBlank(check.getProject().getAddress(),"");
        keys = keys.trim() + " " + StringUtils.defaultIfBlank(check.getProject().getCorpTags(), "");

        return keys;
    }



}
