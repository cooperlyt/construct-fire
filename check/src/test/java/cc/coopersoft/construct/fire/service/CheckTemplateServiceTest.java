package cc.coopersoft.construct.fire.service;

import cc.coopersoft.construct.fire.Application;
import cc.coopersoft.construct.fire.model.template.TableTemplate;
import lombok.extern.slf4j.Slf4j;
import org.junit.FixMethodOrder;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.converter.json.Jackson2ObjectMapperBuilder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Optional;

import static org.junit.Assert.*;


@RunWith(SpringRunner.class)
@SpringBootTest(classes = Application.class)
@ContextConfiguration(classes = {CheckTemplateService.class})
@Slf4j
@FixMethodOrder(MethodSorters.JVM)
public class CheckTemplateServiceTest {

    @Autowired
    private CheckTemplateService checkTemplateService;

    @Autowired
    private Jackson2ObjectMapperBuilder mapperBuilder;



    @Test
    @Ignore
    public void tableTest() {

        TableTemplate tab = new TableTemplate();
        tab.setName("1");
        checkTemplateService.addTable(tab);
        tab = new TableTemplate();
        tab.setName("2");
        TableTemplate t2  = checkTemplateService.addTable(tab);
        tab = new TableTemplate();
        tab.setName("3");
        checkTemplateService.addTable(tab);
        tab = new TableTemplate();
        tab.setName("4");
        checkTemplateService.addTable(tab);tab = new TableTemplate();
         tab.setName("5");
        TableTemplate t5 =  checkTemplateService.addTable(tab);
        tab = new TableTemplate();
        tab.setName("6");
        TableTemplate t6 =  checkTemplateService.addTable(tab);

        assertEquals(checkTemplateService.template().size(), 6);

        t6 = checkTemplateService.editTableName(t6.getId(), "6m");


        assertEquals(t6.getName(), "6m");

        checkTemplateService.deleteTable(t6.getId());

        assertEquals(checkTemplateService.template().size(), 5);

        checkTemplateService.orderTable(t5.getId(), Optional.of(t2.getId()) );

        assertEquals(checkTemplateService.template().get(2).getName(), "5");


        for(int i =0 ; i< 800 ; i++ ){
            long id2 = checkTemplateService.template().get(2).getId();

            long id4 = checkTemplateService.template().get(4).getId();

            checkTemplateService.orderTable(id4, Optional.of(id2) );
        }


    }
}