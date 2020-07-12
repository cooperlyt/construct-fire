package cc.coopersoft.construct.fire.service;

import cc.coopersoft.common.construct.corp.CorpProperty;
import cc.coopersoft.common.construct.project.BuildInfo;
import cc.coopersoft.common.construct.project.ProjectRegInfo;
import cc.coopersoft.common.data.GroupIdType;
import cc.coopersoft.common.data.PersonIdType;
import cc.coopersoft.common.report.PdfReport;
import cc.coopersoft.common.report.QrCodeHelper;
import cc.coopersoft.common.report.TextMarkHelper;
import cc.coopersoft.construct.fire.Application;
import cc.coopersoft.construct.fire.common.EnumData;
import cc.coopersoft.construct.fire.model.*;
import cc.coopersoft.construct.fire.repository.FireCheckRepository;
import com.github.wujun234.uid.UidGenerator;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfWriter;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.StringUtils;
import org.junit.FixMethodOrder;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.io.*;
import java.math.BigDecimal;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.*;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = Application.class)
@ContextConfiguration(classes = {ReportService.class, MockRemoteService.class})
@Slf4j
@FixMethodOrder(MethodSorters.JVM)
public class ReportTest {

    @Autowired
    private BusinessService businessService;

    @Autowired
    private FireCheckRepository fireCheckRepository;

    @Resource
    private UidGenerator defaultUidGenerator;

    @Autowired
    private TestCorpRepository testCorpRepository;

    @Autowired
    private ReportService reportService;

    private static final Logger logger = LoggerFactory.getLogger(ReportTest.class);

    public static void sampleReport(OutputStream os, String qr, String markText, String templateName, Object data) {
        com.itextpdf.text.Document document = new Document(PageSize.A4);
//        Rectangle rectPageSize = new Rectangle(PageSize.A4);//横打
//        document.setPageSize(rectPageSize.rotate());
        try {
            PdfWriter writer = PdfWriter.getInstance(document, os);
            writer.setEncryption(null, null, PdfWriter.ALLOW_PRINTING, PdfWriter.STANDARD_ENCRYPTION_128);
            if (StringUtils.isNotBlank(markText)){
                writer.setPageEvent(new TextMarkHelper(markText));
            }

            writer.setPageEvent(new QrCodeHelper(qr) );
            PdfReport.loadTemplate(writer,document,templateName,data);
        } catch (DocumentException var7) {
            var7.printStackTrace();
        }
    }


    @Test
    @Ignore
    public void CreateFireCheckInfo(){
        Long id = Long.valueOf(2020052201);

        FireProject project = new FireProject();
        project.setId(id);
        project.setName("项目名称");
        project.setAddress("项目地址");
        project.setProperty(ProjectRegInfo.Property.BIG);
        project.setType(ProjectRegInfo.Type.APPENDAGE_STORE);
        project.setLandArea(new BigDecimal(111111.00));
        project.setImportantType(ProjectRegInfo.ImportantType.CITY);
        project.setCorpTags("CorpTags");
        project.setModifyFit(true);
        project.setModifyWarm(true);
        project.setModifyUse(true);
        project.setPutMoney(new BigDecimal(123345));
        project.setArea(new BigDecimal(111110000.00));


        ProjectCorp projectCorp = new ProjectCorp();
        ProjectCorp.JoinCorpPK joinCorpPK1 = new ProjectCorp.JoinCorpPK();
        joinCorpPK1.setCode(id);
        joinCorpPK1.setProject(project);
        joinCorpPK1.setProperty(CorpProperty.Construct);
        projectCorp.setId(joinCorpPK1);
        projectCorp.setLevel(1);
        projectCorp.setName("施工单位");
        projectCorp.setGroupIdType(GroupIdType.COMPANY_CODE);
        projectCorp.setGroupId("营业执照编号");
        projectCorp.setContacts("负责人");
        projectCorp.setTel("1333344444");
        projectCorp.setContactsId("负责人ID");
        projectCorp.setOwnerName("法人姓名");
        projectCorp.setOwnerIdType(PersonIdType.MASTER_ID);
        project.getCorps().add(projectCorp);


        ProjectCorp projectCorp2 = new ProjectCorp();
        ProjectCorp.JoinCorpPK joinCorpPK2 = new ProjectCorp.JoinCorpPK();
        joinCorpPK2.setCode(id);
        joinCorpPK2.setProject(project);
        joinCorpPK2.setProperty(CorpProperty.Developer);
        projectCorp2.setId(joinCorpPK2);
        projectCorp2.setLevel(2);
        projectCorp2.setName("建设单位");
        projectCorp2.setGroupIdType(GroupIdType.COMPANY_CODE);
        projectCorp2.setGroupId("建设单位营业执照编号");
        projectCorp2.setContacts("建设单位负责人");
        projectCorp2.setTel("1333355555");
        projectCorp2.setContactsId("负责人ID");
        projectCorp2.setOwnerName("建设单位法人姓名");
        projectCorp2.setOwnerIdType(PersonIdType.MASTER_ID);
        project.getCorps().add(projectCorp2);

        ProjectCorp projectCorp3 = new ProjectCorp();
        ProjectCorp.JoinCorpPK joinCorpPK3 = new ProjectCorp.JoinCorpPK();
        joinCorpPK3.setCode(id);
        joinCorpPK3.setProject(project);
        joinCorpPK3.setProperty(CorpProperty.FireCheck);
        projectCorp3.setId(joinCorpPK3);
        projectCorp3.setLevel(3);
        projectCorp3.setName("技术服务机构");
        projectCorp3.setGroupIdType(GroupIdType.COMPANY_CODE);
        projectCorp3.setGroupId("技术服务机构营业执照编号");
        projectCorp3.setContacts("技术服务机构负责人");
        projectCorp3.setTel("1333355555");
        projectCorp3.setContactsId("负责人ID");
        projectCorp3.setOwnerName("技术服务机构法人姓名");
        projectCorp3.setOwnerIdType(PersonIdType.MASTER_ID);
        project.getCorps().add(projectCorp3);

        ProjectCorp projectCorp4 = new ProjectCorp();
        ProjectCorp.JoinCorpPK joinCorpPK4 = new ProjectCorp.JoinCorpPK();
        joinCorpPK4.setCode(id);
        joinCorpPK4.setProject(project);
        joinCorpPK4.setProperty(CorpProperty.Supervisor);
        projectCorp4.setId(joinCorpPK4);
        projectCorp4.setLevel(3);
        projectCorp4.setName("工程监理");
        projectCorp4.setGroupIdType(GroupIdType.COMPANY_CODE);
        projectCorp4.setGroupId("工程监理营业执照编号");
        projectCorp4.setContacts("工程监理负责人");
        projectCorp4.setTel("1333357775");
        projectCorp4.setContactsId("负责人ID");
        projectCorp4.setOwnerName("工程监理法人姓名");
        projectCorp4.setOwnerIdType(PersonIdType.MASTER_ID);
        project.getCorps().add(projectCorp4);

        ProjectCorp projectCorp5 = new ProjectCorp();
        ProjectCorp.JoinCorpPK joinCorpPK5 = new ProjectCorp.JoinCorpPK();
        joinCorpPK5.setCode(id);
        joinCorpPK5.setProject(project);
        joinCorpPK5.setProperty(CorpProperty.Design);
        projectCorp5.setId(joinCorpPK5);
        projectCorp5.setLevel(3);
        projectCorp5.setName("设计单位");
        projectCorp5.setGroupIdType(GroupIdType.COMPANY_CODE);
        projectCorp5.setGroupId("设计单位执照编号");
        projectCorp5.setContacts("设计单位负责人");
        projectCorp5.setTel("1333359995");
        projectCorp5.setContactsId("负责人ID");
        projectCorp5.setOwnerName("设计单位法人姓名");
        projectCorp5.setOwnerIdType(PersonIdType.MASTER_ID);
        project.getCorps().add(projectCorp5);


        FireCheckInfo fireCheckInfo = new FireCheckInfo();
        fireCheckInfo.setId(id);
        fireCheckInfo.setContracts("负责人");
        fireCheckInfo.setTel("13333333333");
        fireCheckInfo.setInRandom(true);
        fireCheckInfo.setDesignFile("设计审查意见书");
        fireCheckInfo.setDesignFileDate(new Date());
        fireCheckInfo.setConstructFile("建筑工程施工证明许可证文件编号");
        fireCheckInfo.setConstructFileDate(new Date());
        fireCheckInfo.setPart(false);
        fireCheckInfo.setConclusion("验收结论");
        fireCheckInfo.setSpecial(true);
        fireCheckInfo.setQualified(true);
        fireCheckInfo.setProject(project);
        fireCheckInfo.setProjectCode(project.getId());
        project.setCheck(fireCheckInfo);


        ProjectBuildInfo projectBuildInfo = new ProjectBuildInfo();
        projectBuildInfo.setId(defaultUidGenerator.getUID());
        projectBuildInfo.setName("楼幢名称");
        projectBuildInfo.setStructure(BuildInfo.Struct.STEEL);
        projectBuildInfo.setOnCount(11);
        projectBuildInfo.setUnderCount(2);
        projectBuildInfo.setHeight(new BigDecimal(111.00));
        projectBuildInfo.setLandArea(new BigDecimal(3233.00));
        projectBuildInfo.setOnArea(new BigDecimal(34343));
        projectBuildInfo.setUnderArea(new BigDecimal(123123.00));
        projectBuildInfo.setLength(new BigDecimal(250));


        BuildCheck buildCheck = new BuildCheck();
        buildCheck.setId(defaultUidGenerator.getUID());
        buildCheck.setRating(1);
        buildCheck.setDanger(1);
        buildCheck.setCode(buildCheck.getId());
        buildCheck.setOpinion("buildChecky意见");
        buildCheck.setProperty(FireCheckInfo.UseProperty.DAN);
        buildCheck.setPass(true);
        buildCheck.setInfo(projectBuildInfo);
        projectBuildInfo.setCheck(buildCheck);
        buildCheck.setCheck(fireCheckInfo);
        fireCheckInfo.getBuilds().add(buildCheck);

        ModifyWarmCheck modifyWarmCheck =new ModifyWarmCheck();
        modifyWarmCheck.setId(defaultUidGenerator.getUID());
        modifyWarmCheck.setType(ModifyWarmCheck.Type.A);// 枚举米有
        modifyWarmCheck.setLayers("10cne");
        modifyWarmCheck.setPart("保温部位");
        modifyWarmCheck.setMaterial("保温材料");
        modifyWarmCheck.setCheck(fireCheckInfo);
        fireCheckInfo.setWarm(modifyWarmCheck);

        ModifyFitCheck modifyFitCheck = new ModifyFitCheck();
        modifyFitCheck.setId(defaultUidGenerator.getUID());
        modifyFitCheck.setArea(new BigDecimal(123.00));
        modifyFitCheck.setLayers("10fit");
        modifyFitCheck.setPart("CELL,WALL");//用逗号分隔
        modifyFitCheck.setCheck(fireCheckInfo);
        fireCheckInfo.setFit(modifyFitCheck);

        UseChange useChange = new UseChange();
        useChange.setId(defaultUidGenerator.getUID());
        useChange.setProperty(FireCheckInfo.UseProperty.FULL);
        useChange.setOldUse("OLD_USE");
        useChange.setCheck(fireCheckInfo);
        fireCheckInfo.setUseChange(useChange);

        StoreSquareCheck storeSquareCheck = new StoreSquareCheck();
        storeSquareCheck.setId(defaultUidGenerator.getUID());
        storeSquareCheck.setArea(new BigDecimal(111233.00));
        storeSquareCheck.setName("存储物名称");
        storeSquareCheck.setCheck(fireCheckInfo);
        fireCheckInfo.setSquare(storeSquareCheck);

        StoreTinCheck storeTinCheck = new StoreTinCheck();
        storeTinCheck.setId(defaultUidGenerator.getUID());
        storeTinCheck.setName("储罐名称");
        storeTinCheck.setLocation("储罐位置");
        storeTinCheck.setArea(new BigDecimal(9999.00));
        storeTinCheck.setType(StoreTinCheck.Type.DRY);
        storeTinCheck.setLayout(StoreTinCheck.Layout.HALF);
        storeTinCheck.setCheck(fireCheckInfo);
        fireCheckInfo.setTin(storeTinCheck);
        FireCheck fireCheck = new FireCheck();
        fireCheck.setId(fireCheckInfo.getId());
        fireCheck.setInfo(fireCheckInfo);
        fireCheck.setStatus(FireCheck.Status.NoAccept);
        fireCheck.setApplyTime(new Date());
        fireCheck.setRegTime(new Date());
        fireCheck.setNoAcceptType(FireCheck.NoAcceptType.LESS_FILE);
        fireCheck.setMemo("情况说明");
        fireCheck.setOpinion("意见");
        fireCheck.setType(FireCheck.Type.First);
        fireCheck.setCorp(projectCorp.getCode());

        for (int i=1;i<10;i++){
            CheckFile checkFile = new CheckFile();
            checkFile.setId(i);
            checkFile.setName("文件名文件名文件名文件名文件名文件名文件名-"+i);

            checkFile.setCheck(fireCheck);
            if (i/2 == 0) {
                checkFile.setPass(true);
            }else {
                checkFile.setPass(false);
            }
            fireCheck.getFiles().add(checkFile);
        }


        fireCheckRepository.save(fireCheck);

    }


    @Test
    @Ignore
    public void TestReport(){
//        this.CreateFireCheckInfo();
//        FireCheck fireCheck = businessService.fireCheck(Long.valueOf(2020052201)).get();
//        Optional<ProjectCorp> joinCorp = testCorpRepository.findByIdCodeAndIdProperty(fireCheck.getId(),CorpProperty.Developer);
//
//        Map<String, Object> data = new HashMap<>();
//        fireCheck.getInfo().getFit().setPart("");
//        data = reportService.officialReportData(fireCheck);

//        data.put("fireCheck", fireCheck);
//        data.put("org", "东港市住房和城乡建设局");
//        data.put("word", "DG");
//        data.put("joinCorp",joinCorp.get());
//        if (fireCheck.getInfo().getFit()!=null && fireCheck.getInfo().getFit().getPart()!=null){
//            data.put("packEnumDataList",EnumData.selectPackEnumData(fireCheck.getInfo().getFit().getPart().split(",")));
//        }else{
//            data.put("packEnumDataList",EnumData.selectPackEnumData(null));
//        }
//
//
//        data.put("enumData", EnumData.values());
//        data.put("sheckTables", fireCheck.getInfo().getItems());
//        //data.put("joinCorps",fireCheck.getInfo().getProject().getCorps());
//        List<String> testList = new ArrayList<>();
//        testList.add("test1");
//        testList.add("test2");
//        data.put("testArray", testList);
//
//        FileOutputStream fileOutputStream = null;
//        try {
//            Files.deleteIfExists(Paths.get("D:\\report\\test.pdf"));
//            fileOutputStream = new FileOutputStream("D:\\report\\test.pdf");
//            sampleReport(fileOutputStream, Long.toString(fireCheck.getId()), "东港市住房和城乡建设局", "specialControlAcceptance.ftl", data);
//            File file = new File("D:\\report\\test.pdf"); // 创建文件对象
//            // Desktop.getDesktop().open(file);
//        } catch (FileNotFoundException e) {
//            e.printStackTrace();
//        } catch (IOException e){
//            System.out.println("delete text err");
//        }finally {
//            IOUtils.closeQuietly(fileOutputStream);
//        }



    }

}
