package cc.coopersoft.construct.fire.service;

import cc.coopersoft.construct.fire.Application;
import cc.coopersoft.construct.fire.model.FireCheckInfo;
import com.fasterxml.jackson.core.JsonProcessingException;
import lombok.extern.slf4j.Slf4j;
import org.junit.FixMethodOrder;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = Application.class)
@ContextConfiguration(classes = {ReportService.class})
@Slf4j
@FixMethodOrder(MethodSorters.JVM)
public class KnowTest {

    @Autowired
    private ReportService reportService;

    @Test
    @Ignore
    public void testReportUpload(){
//        FireCheckInfo fireCheck = new FireCheckInfo();
//        fireCheck.setId(667234786523764l);
//        fireCheck.setCorp(99l);

//        log.debug(reportService.applyReport(fireCheck).getId());
    }


    public void mapJsonTest() throws JsonProcessingException {

//        FireProject p = new FireProject();
//        p.setName("测试");
//        p.setTypeLevel(11);
//        p.setArea(new BigDecimal("8900"));
//
//        ObjectMapper mapper = new ObjectMapper();
//
//        try {
//            String s = mapper.writerWithView(FireProject.Title.class).forType(FireProject.class).writeValueAsString(p);
//            log.info(s);
//            Map<String,Object> m = mapper.readerFor(Map.class).readValue(s);
//
//            m.put("custome", "dddd");
//            s = mapper.writerFor(Map.class).writeValueAsString(m);
//
//            log.info(s);
//        } catch (JsonProcessingException e) {
//            log.error("convert business description error!", e);
//            throw new IllegalStateException("convert business description error!",e);
//        } catch (IOException e) {
//            log.error("convert business description error!", e);
//            throw new IllegalStateException("convert business description error!",e);
//        }





        int size = 96 ;

        int k = 1;
        for (int i = 1 ; i <= 16 ; i++){
            System.out.print( (k++) + "(黄)\n" + (k++) + "(红)\n" + (k++) + "(红)\n" + (k++) + "(绿)\n" + (k++)  + "(绿)\n"+ (k++)  +"(绿)\n");
        }
    }
}
