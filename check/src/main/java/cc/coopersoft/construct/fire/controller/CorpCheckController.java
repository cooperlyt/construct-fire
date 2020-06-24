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

    private static final String TRUST_ROLE_PREFIX = "T_";

    private boolean hasCorpRole(long corp){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        return authentication.getAuthorities().stream()
                .map(GrantedAuthority::getAuthority)
                .map(res -> {if (res.startsWith("ROLE_"))  return res.substring(5);  else return res; }) // Strip "ROLE_"
                .collect(Collectors.toSet()).contains(TRUST_ROLE_PREFIX + corp);
    }

    @RequestMapping(value = "/{corp}/review/{projectCode}", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.CREATED)
    @JsonView(FireCheck.CreateResult.class)
    public FireCheck review(@PathVariable("corp") long corp, @PathVariable("projectCode") long projectCode){
        return businessService.reviewBusiness(corp,projectCode);
    }

    @RequestMapping(value = "/{corp}/prepare/{projectCode}", method = RequestMethod.GET)
    @JsonView(FireCheck.CreateResult.class)
    public FireCheck getPrepare(@PathVariable("corp") long corp,@PathVariable("projectCode") long project ){
        if (hasCorpRole(corp)){
            return businessService.getPrepare(corp,project).orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
        }else{
            throw new ResponseStatusException(HttpStatus.NOT_ACCEPTABLE);
        }
    }

    @RequestMapping(value = "/{corp}/del/{id}", method = RequestMethod.DELETE)
    public String delPrepare(@PathVariable("corp") long corp,@PathVariable("id") long id){
        if (hasCorpRole(corp)){
            businessService.delPrepare(corp, id);
            return String.valueOf(id);
        }else{
            throw new ResponseStatusException(HttpStatus.NOT_ACCEPTABLE);
        }
    }

    @RequestMapping(value = "prepare", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.CREATED)
    @JsonView(FireCheck.CreateResult.class)
    public FireCheck prepare(@Valid @RequestBody FireCheck check){
        if (hasCorpRole(check.getCorp())){

            return businessService.prepareBusiness(check);
        }else{
            throw new ResponseStatusException(HttpStatus.NOT_ACCEPTABLE);
        }
    }

    @RequestMapping(value = "/{corp}/{id}/run", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.CREATED)
    @JsonView(FireCheck.CreateResult.class)
    public FireCheck runPrepare(@PathVariable("corp") long corp, @PathVariable("id") long id){
        if (hasCorpRole(corp)){
            return businessService.runPrepareBusiness(corp,id);
        }else {
            throw new ResponseStatusException(HttpStatus.NOT_ACCEPTABLE);
        }
    }

    @RequestMapping(value = "/{corp}/{id}/details", method = RequestMethod.GET)
    @JsonView(FireCheck.Details.class)
    public FireCheck fireCheck(@PathVariable("corp") long corp ,@PathVariable("id") long id ){
        if (hasCorpRole(corp)){
            FireCheck check = businessService.fireCheck(id).orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
            check.getInfo().getProject().getCorps().stream().filter((c) -> c.getCode() == corp).findFirst().orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_ACCEPTABLE));
            return check;
        }
        throw new ResponseStatusException(HttpStatus.NOT_ACCEPTABLE);

    }

    @RequestMapping(value = "/{corp}/checks", method = RequestMethod.GET)
    @JsonView(FireCheck.Summary.class)
    public List<FireCheck> search(@PathVariable("corp") long corp,
                                  @RequestParam(value = "my", required = false) Boolean my,
                                  @RequestParam(value = "key", required = false) String key,
                                  @RequestParam(value = "status", required = false) FireCheck.Status status ){
        if (hasCorpRole(corp)){
            return fireCheckBusiness.search(corp,my,key,status);
        }else{
            throw new ResponseStatusException(HttpStatus.NOT_ACCEPTABLE);
        }

    }


    @RequestMapping(value = "/{corp}/project/{code}/status", method = RequestMethod.GET)
    public String projectFireCheckStatus(@PathVariable("corp") long corp,
                                         @PathVariable("code") long projectCode){
        if (hasCorpRole(corp)){
            return businessService.projectFireCheckStatus(projectCode).name();
        }else {
            throw new ResponseStatusException(HttpStatus.NOT_ACCEPTABLE);
        }
    }


    @RequestMapping(value = "/{corp}/check/{id}/tables", method = RequestMethod.GET)
    public List<CheckTable> getCheckTable(@PathVariable("corp") long corp,
                                          @PathVariable("id") long id){
        if (hasCorpRole(corp)){
            return fireCheckBusiness.getCheckTable(corp,id);
        }else {
            throw new ResponseStatusException(HttpStatus.NOT_ACCEPTABLE);
        }
    }

    // power lower  valid business status is prepare and corp in business

    @RequestMapping(value = "/{corp}/check/{id}/count", method = RequestMethod.PATCH)
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void setCheckCount(@PathVariable("corp") long corp,
                              @PathVariable("id") long id,
                              @RequestBody int count){
        if (hasCorpRole(corp)){
            fireCheckBusiness.setCheckCount(id,count);
        }else{
            throw new ResponseStatusException(HttpStatus.NOT_ACCEPTABLE);
        }

    }

    @RequestMapping(value = "/{corp}/check/{id}/description", method = RequestMethod.PATCH)
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void setCheckContentDescription(@PathVariable("corp") long corp,
                                           @PathVariable("id") long id,
                                           @RequestBody @Size(max = 32) String description){
        if (hasCorpRole(corp)){
            fireCheckBusiness.setCheckContentDescription(id,description);
        }else{
            throw new ResponseStatusException(HttpStatus.NOT_ACCEPTABLE);
        }

    }

    @RequestMapping(value = "/{corp}/check/{id}/part", method = RequestMethod.PATCH)
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void setCheckContentPart(@PathVariable("corp") long corp,
                                    @PathVariable("id") long id, String part){
        if (hasCorpRole(corp)){
            fireCheckBusiness.setCheckContentPart(id,part);
        }else{
            throw new ResponseStatusException(HttpStatus.NOT_ACCEPTABLE);
        }

    }

    @RequestMapping(value = "/{corp}/check/{itemId}/{contentId}/qualified", method = RequestMethod.PATCH)
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void setCheckContentQualified(@PathVariable("corp") long corp,
                                         @PathVariable("itemId") long itemId,
                                         @PathVariable("contentId") long contentId,
                                         @RequestBody boolean qualified){
        if (hasCorpRole(corp)){
            fireCheckBusiness.setCheckContentQualified(itemId, contentId, qualified);
        }else{
            throw new ResponseStatusException(HttpStatus.NOT_ACCEPTABLE);
        }
    }
}
