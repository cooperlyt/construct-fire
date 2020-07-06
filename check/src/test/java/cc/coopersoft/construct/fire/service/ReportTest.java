package cc.coopersoft.construct.fire.service;

import cc.coopersoft.common.report.PdfReport;
import cc.coopersoft.common.report.QrCodeHelper;
import cc.coopersoft.common.report.TextMarkHelper;
import cc.coopersoft.construct.fire.Application;
import cc.coopersoft.construct.fire.common.EnumData;
import cc.coopersoft.construct.fire.model.BuildCheck;
import cc.coopersoft.construct.fire.model.FireCheckInfo;
import cc.coopersoft.construct.fire.model.ProjectCorp;
import com.github.wujun234.uid.UidGenerator;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfWriter;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.StringUtils;
import org.junit.FixMethodOrder;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.*;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = Application.class)
@ContextConfiguration(classes = {ReportService.class, MockRemoteService.class})
@Slf4j
@FixMethodOrder(MethodSorters.JVM)
public class ReportTest {

    @Autowired
    private BusinessService businessService;

    @Resource
    private UidGenerator defaultUidGenerator;

    @Autowired
    private TestCorpRepository testCorpRepository;

    private static final Logger logger = LoggerFactory.getLogger(ReportTest.class);

    public static void sampleReport(OutputStream os, String qr, String markText, String templateName, Object data) {
        com.itextpdf.text.Document document = new Document(PageSize.A4);
        Rectangle rectPageSize = new Rectangle(PageSize.A4);//横打
        document.setPageSize(rectPageSize.rotate());
        try {
            PdfWriter writer = PdfWriter.getInstance(document, os);
            writer.setEncryption(null, null, PdfWriter.ALLOW_PRINTING, PdfWriter.STANDARD_ENCRYPTION_128);
            if (StringUtils.isNotBlank(markText)){
                writer.setPageEvent(new TextMarkHelper(markText));
            }

            writer.setPageEvent(new QrCodeHelper(qr) );
            PdfReport.loadTemplate(writer,document,templateName,data);
        } catch (DocumentException var7) {
            var7.printStackTrace();
        }
    }




    @Test
    @Ignore
    public void TestReport(){
//        Optional<ProjectCorp> joinCorp = testCorpRepository.findByIdCodeAndIdProjectId(Long.valueOf(2201),Long.valueOf(2020052201));
//        FireCheck fireCheck = businessService.fireCheck(Long.valueOf(2020052201)).get();
//        fireCheck.setId(Long.valueOf(defaultUidGenerator.getUID()));
//        fireCheck.getBuilds().iterator().next().getInfo();
//        if (fireCheck.getBuilds()!=null && fireCheck.getBuilds().size()>0){
//            for(BuildCheck buildCheck:fireCheck.getBuilds()){
//                logger.debug(buildCheck.getInfo().getName());
//
//            }
//
//        }
//        Map<String, Object> data = new HashMap<>();
//        data.put("fireCheck", fireCheck);
//        data.put("org", "东港市住房和城乡建设局");
//        data.put("word", "DG");
//        data.put("joinCorp",joinCorp.get());
//        data.put("enumData", EnumData.values());
//        data.put("sheckTables", fireCheck.getItems());
//        data.put("joinCorps",fireCheck.getProject().getCorps());
//        List<String> testList = new ArrayList<>();
//        testList.add("test1");
//        testList.add("test2");
//        data.put("testArray", testList);
//
//        FileOutputStream fileOutputStream = null;
//        try {
//            Files.deleteIfExists(Paths.get("D:\\report\\test.pdf"));
//            fileOutputStream = new FileOutputStream("D:\\report\\test.pdf");
//            sampleReport(fileOutputStream, Long.toString(fireCheck.getId()), "东港市住房和城乡建设局", "completedContractsRecodApply.ftl", data);
//            File file = new File("D:\\report\\test.pdf"); // 创建文件对象
//           // Desktop.getDesktop().open(file);
//        } catch (FileNotFoundException e) {
//            e.printStackTrace();
//        } catch (IOException e){
//            System.out.println("delete text err");
//        }finally {
//            IOUtils.closeQuietly(fileOutputStream);
//        }


    }

}
