package cc.coopersoft.construct.fire.service;

import cc.coopersoft.common.business.BusinessDescription;
import cc.coopersoft.common.cloud.schemas.WeedFsResult;
import cc.coopersoft.common.construct.corp.CorpProperty;
import cc.coopersoft.common.construct.project.*;
import cc.coopersoft.common.data.GroupIdType;
import cc.coopersoft.common.data.PersonIdType;
import cc.coopersoft.construct.fire.model.Report;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RequestCallback;
import reactor.core.publisher.Mono;

import java.util.Date;

@Service
@Primary
@Slf4j
public class MockRemoteService implements RemoteService {

  @Override
    public Mono<Project.Default> project(long code) {

        JoinCorpInfo corpInfo = new JoinCorpInfo();
        corpInfo.setGroupId("test");
        corpInfo.setGroupIdType(GroupIdType.COMPANY_CODE);
        corpInfo.setLevel(1);
        corpInfo.setName("test company");
        corpInfo.setOwnerIdType(PersonIdType.GA_ID);
        corpInfo.setOwnerName("test owner");

        JoinCorp<JoinCorpInfo> corp = new JoinCorp<>();
        corp.setInfo(corpInfo);
        corp.setCode(1);
        corp.setProperty(CorpProperty.Developer);
        corp.setOutLevel(false);


        BuildInfo buildInfo = new BuildInfo();
        buildInfo.setName("test");
        buildInfo.setStructure(BuildInfo.Struct.BRICK);

        BuildRegInfo<BuildInfo> buildRegInfo = new BuildRegInfo<>();
        buildRegInfo.setCode(003);




        ProjectRegInfo info = new ProjectRegInfo();
        info.setName("test Project");
        info.setAddress("test address");
        info.setType(ProjectRegInfo.Type.CIVIL_HOUSE);
        info.setProperty(ProjectRegInfo.Property.NEW);
        info.setImportantType(ProjectRegInfo.ImportantType.NORMAL);




        Project.Default result = new Project.Default();
        result.getBuilds().add(buildRegInfo);

        result.getCorps().add(corp);
        result.setInfo(info);
        result.setCode(code);
        result.setEnable(true);


        log.debug("return mock project");
        return  Mono.just(result);
    }

    @Override
    public Mono<Long> startBusiness(String define, long id, BusinessDescription.Description description) {
        log.debug("mock start business");
      log.debug(description.getKeys());

        return Mono.just(id);
    }

    @Override
    public WeedFsResult uploadTemplateReport(String qr, String markText, String templateName, Object data) {
        WeedFsResult result =  new WeedFsResult();

        result.setFid("dd");
        result.setMime("unkonw");
        result.setSize(1);

        return result;
    }

    @Override
    public WeedFsResult uploadReport( RequestCallback requestCallback) {
        WeedFsResult result =  new WeedFsResult();

        result.setFid("dd");
        result.setMime("unkonw");
        result.setSize(1);

        return result;
    }

    @Override
    public Mono<Long> initBusinessDocuments(long corp, long id, String define) {
        return Mono.empty();
    }

}
