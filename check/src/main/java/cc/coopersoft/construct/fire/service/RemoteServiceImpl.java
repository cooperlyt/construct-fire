package cc.coopersoft.construct.fire.service;

import cc.coopersoft.common.business.BusinessDescription;
import cc.coopersoft.common.cloud.schemas.WeedFsResult;
import cc.coopersoft.common.construct.project.Project;
import cc.coopersoft.common.report.PdfReport;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.security.oauth2.client.OAuth2RestTemplate;
import org.springframework.stereotype.Service;
import org.springframework.web.client.HttpMessageConverterExtractor;
import org.springframework.web.client.RequestCallback;
import org.springframework.web.client.RestTemplate;


@Service
@Slf4j
public class RemoteServiceImpl implements RemoteService {

    @Value("${report.address}")
    private String reportServerAddress = "";

    private final OAuth2RestTemplate oAuth2RestTemplate;

    public RemoteServiceImpl(OAuth2RestTemplate oAuth2RestTemplate) {
        this.oAuth2RestTemplate = oAuth2RestTemplate;
    }

    @Override
    public Project.Default project(long code) {
        ResponseEntity<Project.Default> restExchange = oAuth2RestTemplate.exchange(
                "http://construct-project-cache/data/project/{code}",
                HttpMethod.GET, null,Project.Default.class,code);
        return restExchange.getBody();
    }

    @Override
    public long startBusiness(String define, long id, BusinessDescription.Description description) {

        ResponseEntity<Long> restExchange = oAuth2RestTemplate.exchange(
                "http://camundasvr/adapter/fire/start/{define}/{id}",
                HttpMethod.POST, new HttpEntity<>(description),Long.class, define, id);
        Long result = restExchange.getBody();
        if (result == null){
            throw new IllegalStateException("business not create");
        }
        return result;
    }

    private WeedFsResult executeReportUpload(RequestCallback requestCallback) {
        SimpleClientHttpRequestFactory requestFactory = new SimpleClientHttpRequestFactory();
        requestFactory.setBufferRequestBody(false);
        final RestTemplate restTemplate = new RestTemplate();

        final HttpMessageConverterExtractor<WeedFsResult> responseExtractor =
                new HttpMessageConverterExtractor<>(WeedFsResult.class, restTemplate.getMessageConverters());

        return restTemplate.execute(reportServerAddress, HttpMethod.POST, requestCallback,responseExtractor);
    }

    //String name, boolean failReport,
    public WeedFsResult uploadTemplateReport( String qr, String markText, String templateName, Object data){

        //log.debug("upload report :" + name + " to :" + reportServerAddress);
        final RequestCallback requestCallback = request -> {
            request.getHeaders().setContentType(MediaType.APPLICATION_PDF);
            PdfReport.sampleReport(request.getBody(),qr,markText,templateName,data);
        };
        WeedFsResult response = executeReportUpload(requestCallback);
        log.debug("upload result " + response);
        return response;
    }

    //String name,boolean failReport,
    public WeedFsResult uploadReport( RequestCallback requestCallback){
        return executeReportUpload(requestCallback);
    }

    @Override
    public Long initBusinessDocuments(long corp, long id, String define) {
        ResponseEntity<Long> restExchange = oAuth2RestTemplate.exchange(
                "http://camundasvr/trust/doc/{corp}/define/{define}/{id}/init",
                HttpMethod.POST, null ,Long.class, corp,define, id);
        Long result = restExchange.getBody();
        if (result == null){
            throw new IllegalStateException("init fail!");
        }
        return result;
    }


}
