package cc.coopersoft.construct.fire.service;

import cc.coopersoft.common.business.BusinessDescription;
import cc.coopersoft.common.construct.corp.CorpProperty;
import cc.coopersoft.construct.fire.Application;
import cc.coopersoft.construct.fire.model.CheckSubItem;
import cc.coopersoft.construct.fire.model.FireCheck;
import cc.coopersoft.construct.fire.model.FireCheckInfo;
import cc.coopersoft.construct.fire.model.template.SubItemTemplate;
import cc.coopersoft.construct.fire.repository.CheckSubItemRepository;
import cc.coopersoft.construct.fire.repository.SubItemTemplateRepository;
import lombok.extern.slf4j.Slf4j;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.Assert.*;


@RunWith(SpringRunner.class)
@SpringBootTest(classes = Application.class)
@ContextConfiguration(classes = {BusinessService.class, MockRemoteService.class})
@Slf4j
@FixMethodOrder(MethodSorters.JVM)
public class BusinessTest {

    @Autowired
    private BusinessService businessService;

    @Autowired
    private FireCheckBusiness fireCheckBusiness;

    @Autowired
    private SubItemTemplateRepository repository;

    private static long bizId;

    @Test
    public void testCreate(){

        FireCheckInfo checkInfo = new FireCheckInfo();
        checkInfo.setProjectCode(1);


        FireCheck check = new FireCheck();
        check.setInfo(checkInfo);
        check.setCorp(1l);

        FireCheck result = businessService.createBusiness(check, BusinessDescription.Source.Inside);
        bizId = result.getId();
        assertEquals(result.getInfo().getProjectCode(),1l);

        assertEquals(result.getReports().size(),1);

    }

    @Test
    public void testTrust(){
        fireCheckBusiness.search(1l,null,null, null);
    }

    @Test
    public void testPrepare(){

        FireCheckInfo checkInfo = new FireCheckInfo();
        checkInfo.setProjectCode(2);


        FireCheck check = new FireCheck();
        check.setInfo(checkInfo);
        check.setCorp(1l);

        businessService.prepareBusiness(check);
    }

    @Test
    public void testITem(){

        SubItemTemplate item = repository.findById(38l).orElseThrow();
        log.debug(item.getContents().toString());
    }

}
