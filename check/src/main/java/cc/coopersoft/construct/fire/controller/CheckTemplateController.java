package cc.coopersoft.construct.fire.controller;


import cc.coopersoft.construct.fire.model.template.ItemTemplate;
import cc.coopersoft.construct.fire.model.template.SubItemTemplate;
import cc.coopersoft.construct.fire.model.template.TableTemplate;
import cc.coopersoft.construct.fire.service.CheckTemplateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping(value="template")
public class CheckTemplateController {

    private final CheckTemplateService checkTemplateService;

    @Autowired
    public CheckTemplateController(CheckTemplateService checkTemplateService) {
        this.checkTemplateService = checkTemplateService;
    }

    @RequestMapping(value = "/" , method = RequestMethod.GET)
    public List<TableTemplate> fireCheckTemplate(){
        return checkTemplateService.template();
    }

    @RequestMapping(value = "/table/add", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.CREATED)
    public TableTemplate addTableTemplate(@Valid @RequestBody TableTemplate tableTemplate){
        return checkTemplateService.addTable(tableTemplate);
    }

    @RequestMapping(value = "/table/edit/{id}", method = RequestMethod.PUT)
    @ResponseStatus(HttpStatus.OK)
    public String editTableTemplateName(@PathVariable("id") long id, @Valid @RequestBody TableTemplate tableTemplate){
        return String.valueOf(checkTemplateService.editTableName(id,tableTemplate.getName()).getId());
    }

    @RequestMapping(value = "/table/delete/{id}", method = RequestMethod.DELETE)
    @ResponseStatus(HttpStatus.OK)
    public String deleteTableTemplate(@PathVariable("id") long id){
        checkTemplateService.deleteTable(id);
        return String.valueOf(id);
    }

    @RequestMapping(value = "/table/order/{id}", method = RequestMethod.PATCH)
    @ResponseStatus(HttpStatus.ACCEPTED)
    public void orderTableTemplate(@PathVariable("id") long id,
                                   @RequestParam(name = "before", required = false)Optional<Long> before){
        checkTemplateService.orderTable(id,before);
    }

    @RequestMapping(value = "/item/add", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.CREATED)
    public ItemTemplate addItemTemplate(@Valid @RequestBody ItemTemplate itemTemplate){
        return checkTemplateService.addItem(itemTemplate);
    }

    @RequestMapping(value = "/item/edit/{id}", method = RequestMethod.PUT)
    @ResponseStatus(HttpStatus.OK)
    public String editItemTemplateName(@PathVariable("id") long id, @Valid @RequestBody ItemTemplate itemTemplate){
        return String.valueOf(checkTemplateService.editItemName(id,itemTemplate.getName()).getId());
    }

    @RequestMapping(value = "/item/delete/{id}", method = RequestMethod.DELETE)
    @ResponseStatus(HttpStatus.OK)
    public String deleteItemTemplate(@PathVariable("id") long id){
        checkTemplateService.deleteItem(id);
        return String.valueOf(id);
    }

    @RequestMapping(value = "/item/order/{id}", method = RequestMethod.PATCH)
    @ResponseStatus(HttpStatus.ACCEPTED)
    public void orderItemTemplate(@PathVariable("id") long id,
                                    @RequestParam(name = "before", required = false)Optional<Long> before){
        checkTemplateService.orderItem(id,before);
    }

    @RequestMapping(value = "/sub/add", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.CREATED)
    public SubItemTemplate addSubItemTemplate(@Valid @RequestBody SubItemTemplate sub){
        return checkTemplateService.addSubItem(sub);
    }

    @RequestMapping(value = "/sub/edit/{id}", method = RequestMethod.PUT)
    @ResponseStatus(HttpStatus.OK)
    public String editSubItemTemplate(@PathVariable("id") long id, @Valid @RequestBody SubItemTemplate sub){
        return String.valueOf(checkTemplateService.editSubItem(id,sub).getId());
    }

    @RequestMapping(value = "/sub/delete/{id}", method = RequestMethod.DELETE)
    @ResponseStatus(HttpStatus.OK)
    public String deleteSubItemTemplate(@PathVariable("id") long id){
        checkTemplateService.deleteSubItem(id);
        return String.valueOf(id);
    }

    @RequestMapping(value = "/sub/order/{id}", method = RequestMethod.PATCH)
    @ResponseStatus(HttpStatus.ACCEPTED)
    public void orderSubItemTemplate(@PathVariable("id") long id,
                                     @RequestParam(name = "before", required = false)Optional<Long> before){
        checkTemplateService.orderSubItem(id, before);
    }
}
