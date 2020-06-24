package cc.coopersoft.construct.fire.service;

import cc.coopersoft.common.business.BusinessDescription;
import cc.coopersoft.common.business.BusinessKey;
import cc.coopersoft.common.business.define.DocumentDefine;
import cc.coopersoft.common.cloud.schemas.WeedFsResult;
import cc.coopersoft.common.construct.project.Project;
import cc.coopersoft.construct.fire.model.Report;
import org.springframework.web.client.RequestCallback;

import java.util.List;

public interface RemoteService {

    Project.Default project(long code);

    long startBusiness(String define, long id, BusinessDescription.Description description);

    WeedFsResult uploadTemplateReport(String qr, String markText, String templateName, Object data);

    WeedFsResult uploadReport(RequestCallback requestCallback);

    Long initBusinessDocuments(long corp, long id, String define);

}
