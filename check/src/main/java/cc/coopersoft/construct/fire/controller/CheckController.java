package cc.coopersoft.construct.fire.controller;

import cc.coopersoft.common.business.BusinessDescription;
import cc.coopersoft.construct.fire.model.BuildCheckOpinion;
import cc.coopersoft.construct.fire.model.CheckFile;
import cc.coopersoft.construct.fire.model.FireCheck;
import cc.coopersoft.construct.fire.model.Report;
import cc.coopersoft.construct.fire.service.BusinessService;
import cc.coopersoft.construct.fire.service.FireCheckBusiness;
import com.fasterxml.jackson.annotation.JsonView;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import javax.validation.Valid;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping(value="manager")
public class CheckController {

    private final BusinessService businessService;

    private final FireCheckBusiness fireCheckBusiness;

    public CheckController(BusinessService businessService, FireCheckBusiness fireCheckBusiness) {
        this.businessService = businessService;
        this.fireCheckBusiness = fireCheckBusiness;
    }

    @RequestMapping(value = "/apply", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.CREATED)
    @JsonView(FireCheck.CreateResult.class)
    public FireCheck createByApply(@Valid @RequestBody FireCheck check){
        return businessService.createBusiness(check, BusinessDescription.Source.Inside);
    }

    @RequestMapping(value = "/review/{code}", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.CREATED)
    @JsonView(FireCheck.CreateResult.class)
    public FireCheck createReview(@PathVariable("code") long projectCode){
        return businessService.reviewBusiness(projectCode);
    }

    @RequestMapping(value = "/check/{id}", method = RequestMethod.GET)
    @JsonView(FireCheck.Details.class)
    public FireCheck fireCheck(@PathVariable("id") long id){
        return businessService.fireCheck(id).orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }

    @RequestMapping(value = "/search" , method = RequestMethod.GET)
    @JsonView(FireCheck.Summary.class)
    public Page<FireCheck> search(@RequestParam(value = "status", required = false) Optional<FireCheck.Status> status,
                                  @RequestParam(value = "page", required = false) Optional<Integer> page,
                                  @RequestParam(value = "key", required = false) Optional<String> key,
                                  @RequestParam(value = "sort", required = false) Optional<String> sort,
                                  @RequestParam(value = "dir", required = false) Optional<String> dir){
        return fireCheckBusiness.search(status,page,key,sort,dir);
    }

    @RequestMapping(value = "/check/{id}/file",method = {RequestMethod.POST, RequestMethod.PUT})
    @ResponseStatus(HttpStatus.CREATED)
    public String fileCheck(@PathVariable("id") long id , @Valid @RequestBody List<CheckFile> files){
        businessService.fileCheck(id,files);
        return String.valueOf(id);
    }

    @RequestMapping(value = "/check/{id}/opinion",method = {RequestMethod.POST, RequestMethod.PUT})
    @ResponseStatus(HttpStatus.CREATED)
    public String buildOpinion(@PathVariable("id") long id , @Valid @RequestBody List<BuildCheckOpinion> opinions){
        businessService.buildOpinion(id, opinions);
        return String.valueOf(id);
    }

    @RequestMapping(value = "/check/{id}/reports", method = RequestMethod.GET)
    public List<Report> reports(@PathVariable("id") long id){
        return fireCheckBusiness.reports(id);
    }

    @RequestMapping(value = "/project/{code}/status", method = RequestMethod.GET)
    public String projectFireCheckStatus(@PathVariable("code") long projectCode){
        return businessService.projectFireCheckStatus(projectCode).name();
    }

//    @RequestMapping(value = "/check/{id}/tables", method = RequestMethod.GET)
//    public List<CheckTable> fireCheckTable(@PathVariable("id") long id){
//        return businessService.checkTables(id);
//    }


}
