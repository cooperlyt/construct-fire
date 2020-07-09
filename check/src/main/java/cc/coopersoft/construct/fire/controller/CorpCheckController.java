package cc.coopersoft.construct.fire.controller;

import cc.coopersoft.construct.fire.model.CheckTable;
import cc.coopersoft.construct.fire.model.FireCheck;
import cc.coopersoft.construct.fire.service.BusinessService;
import cc.coopersoft.construct.fire.service.FireCheckBusiness;
import com.fasterxml.jackson.annotation.JsonView;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import javax.validation.Valid;
import javax.validation.constraints.Size;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping(value="attach")
public class CorpCheckController {

    private final BusinessService businessService;

    private final FireCheckBusiness fireCheckBusiness;

    public CorpCheckController(BusinessService businessService, FireCheckBusiness fireCheckBusiness) {
        this.businessService = businessService;
        this.fireCheckBusiness = fireCheckBusiness;
    }

    @RequestMapping(value = "/review/{projectCode}", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.CREATED)
    @JsonView(FireCheck.CreateResult.class)
    public FireCheck review(@RequestParam("org") long corp, @PathVariable("projectCode") long projectCode){
        return businessService.reviewBusiness(corp,projectCode);
    }

    @RequestMapping(value = "/prepare/{projectCode}", method = RequestMethod.GET)
    @JsonView(FireCheck.CreateResult.class)
    public FireCheck getPrepare(@RequestParam("org") long corp,@PathVariable("projectCode") long project ){

        return businessService.getPrepare(corp,project).orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));

    }

    @RequestMapping(value = "/del/{id}", method = RequestMethod.DELETE)
    public String delPrepare(@RequestParam("org") long corp,@PathVariable("id") long id){
        businessService.delPrepare(corp, id);
        return String.valueOf(id);
    }

    @RequestMapping(value = "prepare", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.CREATED)
    @JsonView(FireCheck.CreateResult.class)
    public FireCheck prepare(@RequestParam("org") long corp,@Valid @RequestBody FireCheck check){
        check.setCorp(corp);
        return businessService.prepareBusiness(check);
    }

    @RequestMapping(value = "/{id}/run", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.CREATED)
    @JsonView(FireCheck.CreateResult.class)
    public FireCheck runPrepare(@RequestParam("org") long corp, @PathVariable("id") long id){
        return businessService.runPrepareBusiness(corp,id);
    }

    @RequestMapping(value = "/{id}/details", method = RequestMethod.GET)
    @JsonView(FireCheck.Details.class)
    public FireCheck fireCheck(@RequestParam("org") long corp ,@PathVariable("id") long id ){
        FireCheck check = businessService.fireCheck(id).orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
        check.getInfo().getProject().getCorps().stream().filter((c) -> c.getCode() == corp).findFirst().orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_ACCEPTABLE));
        return check;
    }

    @RequestMapping(value = "/checks", method = RequestMethod.GET)
    @JsonView(FireCheck.Summary.class)
    public List<FireCheck> search(@RequestParam("org") long corp,
                                  @RequestParam(value = "my", required = false) Boolean my,
                                  @RequestParam(value = "key", required = false) String key,
                                  @RequestParam(value = "status", required = false) FireCheck.Status status ){
        return fireCheckBusiness.search(corp,my,key,status);
    }


    @RequestMapping(value = "/project/{code}/status", method = RequestMethod.GET)
    public String projectFireCheckStatus(@RequestParam("org") long corp,
                                         @PathVariable("code") long projectCode){
        return businessService.projectFireCheckStatus(projectCode).name();
    }


    @RequestMapping(value = "/check/{id}/tables", method = RequestMethod.GET)
    public List<CheckTable> getCheckTable(@RequestParam("org") long corp,
                                          @PathVariable("id") long id){

        return fireCheckBusiness.getCheckTable(corp,id);
    }

    // power lower  valid business status is prepare and corp in business

    @RequestMapping(value = "/check/{id}/count", method = RequestMethod.PATCH)
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void setCheckCount(@RequestParam("org") long corp,
                              @PathVariable("id") long id,
                              @RequestBody int count){
        fireCheckBusiness.setCheckCount(id,count);
    }

    @RequestMapping(value = "/check/{id}/description", method = RequestMethod.PATCH)
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void setCheckContentDescription(@RequestParam("org") long corp,
                                           @PathVariable("id") long id,
                                           @RequestBody @Size(max = 32) String description){
        fireCheckBusiness.setCheckContentDescription(id,description);
    }

    @RequestMapping(value = "/check/{id}/part", method = RequestMethod.PATCH)
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void setCheckContentPart(@RequestParam("org") long corp,
                                    @PathVariable("id") long id, String part){
        fireCheckBusiness.setCheckContentPart(id,part);
    }

    @RequestMapping(value = "/check/{itemId}/{contentId}/qualified", method = RequestMethod.PATCH)
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void setCheckContentQualified(@RequestParam("org") long corp,
                                         @PathVariable("itemId") long itemId,
                                         @PathVariable("contentId") long contentId,
                                         @RequestBody boolean qualified){
        fireCheckBusiness.setCheckContentQualified(itemId, contentId, qualified);

    }
}
