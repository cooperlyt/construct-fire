package cc.coopersoft.cloud.business.document.controller;


import cc.coopersoft.cloud.business.document.model.BusinessDocument;
import cc.coopersoft.cloud.business.document.model.BusinessFile;
import cc.coopersoft.cloud.business.document.service.DocumentService;
import cc.coopersoft.cloud.business.services.BusinessService;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import javax.validation.Valid;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@RestController
@RequestMapping(value="/trust/doc")
public class TrustController {

    private final DocumentService documentService;

    private final BusinessService businessService;


    public TrustController(DocumentService documentService, BusinessService businessService) {
        this.documentService = documentService;
        this.businessService = businessService;
    }

    @RequestMapping(value = "/{id}/list", method = RequestMethod.GET)
    public List<BusinessDocument> businessDocuments(@RequestParam("org") long corp , @PathVariable("id") long id){

        return documentService.businessDocuments(id);

    }


    @RequestMapping(value = "/{docId}/edit", method = {RequestMethod.PUT, RequestMethod.POST})
    public BusinessDocument editDocument(@RequestParam("org") long corp,
                                         @PathVariable("docId") long docId,
                                         @Valid @RequestBody BusinessDocument businessDocument){
        return documentService.editDocument(docId, businessDocument);

    }

    @RequestMapping(value = "/{id}/add", method = RequestMethod.POST)
    public BusinessDocument addDocument(@RequestParam("org") long corp,
                                        @PathVariable("id") long id,
                                        @Valid @RequestBody BusinessDocument document){
        if (!businessService.existsBusiness(id)){
            return documentService.addDocument(id, document);
        }else{
            throw new ResponseStatusException(HttpStatus.NOT_ACCEPTABLE);
        }
    }


    @RequestMapping(value = "/{id}/del", method = RequestMethod.DELETE)
    public String delDocument(@RequestParam("org") long corp,@PathVariable("id") long id){
        documentService.delDocument(id);
        return String.valueOf(id);
    }


    @RequestMapping(value = "/file/{id}/del", method = RequestMethod.DELETE)
    public String delFile(@RequestParam("org") long corp,@PathVariable("id") String id){
        documentService.delFile(id);
        return id;

    }

    @RequestMapping(value = "/file/{id}/order", method = {RequestMethod.PUT, RequestMethod.POST})
    public String orderFile(@RequestParam("org") long corp,@PathVariable("id") String id, @RequestParam(name = "before", required = false) Optional<String> before){
        documentService.orderFile(id,before);
        return id;
    }


    @RequestMapping(value = "/{id}/file/add", method = RequestMethod.POST)
    public BusinessFile addFile(@RequestParam("org") long corp,@PathVariable("id") long id, @Valid @RequestBody BusinessFile file){
        return documentService.addFile(id,file);
    }



}
