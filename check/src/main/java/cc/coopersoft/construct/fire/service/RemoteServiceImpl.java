package cc.coopersoft.construct.fire.service;

import cc.coopersoft.common.business.BusinessDescription;
import cc.coopersoft.common.cloud.schemas.WeedFsResult;
import cc.coopersoft.common.construct.corp.Corp;
import cc.coopersoft.common.construct.project.Project;
import cc.coopersoft.common.report.PdfReport;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.client.HttpMessageConverterExtractor;
import org.springframework.web.client.RequestCallback;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.reactive.function.client.WebClient;
import reactor.core.publisher.Mono;

import static org.springframework.security.oauth2.client.web.reactive.function.client.ServletOAuth2AuthorizedClientExchangeFilterFunction.clientRegistrationId;



@Service
@Slf4j
@RefreshScope
public class RemoteServiceImpl implements RemoteService {

    @Value("${report.address}")
    private String reportServerAddress = "";

    private final WebClient webClient;

    public RemoteServiceImpl(WebClient webClient) {
        this.webClient = webClient;
    }

    @Override
    public Mono<Project.Default> project(long code) {
        return webClient
                .get()
                .uri("http://construct-project-cache/data/project/{code}",code)
                .attributes(clientRegistrationId("master-extend-cer"))
                .retrieve()
                .bodyToMono(Project.Default.class);
    }

    @Override
    public Mono<Long> startBusiness(String define, long id, BusinessDescription.Description description) {
        return webClient
                .post()
                .uri("http://camundasvr/adapter/fire/start/{define}/{id}", define, id)
                .contentType(MediaType.APPLICATION_JSON)
                .body(Mono.just(description),BusinessDescription.Description.class)
                .attributes(clientRegistrationId("master-extend-cer"))
                .retrieve()
                .bodyToMono(String.class)
                .map(Long::parseLong);
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
    public Mono<Long> initBusinessDocuments(long id, String define) {
        return webClient
                .post()
                .uri("http://camundasvr/manager/doc/define/{define}/{id}/init",define, id)
                .attributes(clientRegistrationId("master-extend-cer"))
                .retrieve()
                .bodyToMono(String.class)
                .map(Long::parseLong);

    }


}
