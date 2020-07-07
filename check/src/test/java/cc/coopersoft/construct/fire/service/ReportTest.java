package cc.coopersoft.construct.fire.service;

import cc.coopersoft.common.construct.corp.CorpProperty;
import cc.coopersoft.common.construct.project.BuildInfo;
import cc.coopersoft.common.construct.project.ProjectRegInfo;
import cc.coopersoft.common.data.GroupIdType;
import cc.coopersoft.common.data.PersonIdType;
import cc.coopersoft.common.report.PdfReport;
import cc.coopersoft.common.report.QrCodeHelper;
import cc.coopersoft.common.report.TextMarkHelper;
import cc.coopersoft.construct.fire.Application;
import cc.coopersoft.construct.fire.common.EnumData;
import cc.coopersoft.construct.fire.model.*;
import cc.coopersoft.construct.fire.repository.FireCheckRepository;
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
import java.math.BigDecimal;
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

    @Autowired
    private FireCheckRepository fireCheckRepository;

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
    public void CreateFireCheckInfo(){
        Long id = Long.valueOf(2020052201);

        FireProject project = new FireProject();
        project.setId(id);
        project.setName("项目名称");
        project.setAddress("项目地址");
        project.setProperty(ProjectRegInfo.Property.BIG);
        project.setType(ProjectRegInfo.Type.APPENDAGE_STORE);
        project.setLandArea(new BigDecimal(111111.00));
        project.setImportantType(ProjectRegInfo.ImportantType.CITY);
        project.setCorpTags("CorpTags");
        project.setModifyFit(true);
        project.setModifyWarm(true);
        project.setModifyUse(true);
        project.setPutMoney(new BigDecimal(123345));


        ProjectCorp projectCorp = new ProjectCorp();
        ProjectCorp.JoinCorpPK joinCorpPK1 = new ProjectCorp.JoinCorpPK();
        joinCorpPK1.setCode(defaultUidGenerator.getUID());
        joinCorpPK1.setProject(project);
        joinCorpPK1.setProperty(CorpProperty.Developer);
        projectCorp.setId(joinCorpPK1);
        projectCorp.setLevel(1);
        projectCorp.setName("开发单位");
        projectCorp.setGroupIdType(GroupIdType.COMPANY_CODE);
        projectCorp.setGroupId("营业执照编号");
        projectCorp.setContacts("负责人");
        projectCorp.setTel("1333344444");
        projectCorp.setContactsId("负责人ID");
        projectCorp.setOwnerName("法人姓名");
        projectCorp.setOwnerIdType(PersonIdType.MASTER_ID);
        project.getCorps().add(projectCorp);

        FireCheckInfo fireCheckInfo = new FireCheckInfo();
        fireCheckInfo.setId(id);
        fireCheckInfo.setContracts("负责人");
        fireCheckInfo.setTel("13333333333");
        fireCheckInfo.setInRandom(true);
        fireCheckInfo.setDesignFile("设计审查意见书");
        fireCheckInfo.setDesignFileDate(new Date());
        fireCheckInfo.setConstructFile("建筑工程施工证明许可证文件编号");
        fireCheckInfo.setConstructFileDate(new Date());
        fireCheckInfo.setPart(false);
        fireCheckInfo.setConclusion("验收结论");
        fireCheckInfo.setSpecial(true);
        fireCheckInfo.setQualified(true);
        fireCheckInfo.setProject(project);
        project.setCheck(fireCheckInfo);


        ProjectBuildInfo projectBuildInfo = new ProjectBuildInfo();
        projectBuildInfo.setId(defaultUidGenerator.getUID());
        projectBuildInfo.setName("楼幢名称");
        projectBuildInfo.setStructure(BuildInfo.Struct.STEEL);
        projectBuildInfo.setOnCount(11);
        projectBuildInfo.setUnderCount(2);
        projectBuildInfo.setHeight(new BigDecimal(111.00));
        projectBuildInfo.setLandArea(new BigDecimal(3233.00));
        projectBuildInfo.setOnArea(new BigDecimal(34343));
        projectBuildInfo.setUnderArea(new BigDecimal(123123.00));
        projectBuildInfo.setLength(new BigDecimal(250));


        BuildCheck buildCheck = new BuildCheck();
        buildCheck.setId(defaultUidGenerator.getUID());
        buildCheck.setRating(1);
        buildCheck.setDanger(1);
        buildCheck.setCode(buildCheck.getId());
        buildCheck.setOpinion("buildChecky意见");
        buildCheck.setProperty(FireCheckInfo.UseProperty.DAN);
        buildCheck.setPass(false);
        buildCheck.setInfo(projectBuildInfo);
        projectBuildInfo.setCheck(buildCheck);
        buildCheck.setCheck(fireCheckInfo);
        fireCheckInfo.getBuilds().add(buildCheck);

        ModifyWarmCheck modifyWarmCheck =new ModifyWarmCheck();
        modifyWarmCheck.setId(defaultUidGenerator.getUID());
        modifyWarmCheck.setType(ModifyWarmCheck.Type.A);// 枚举米有
        modifyWarmCheck.setLayers("10cne");
        modifyWarmCheck.setPart("保温部位");
        modifyWarmCheck.setMaterial("保温材料");
        modifyWarmCheck.setCheck(fireCheckInfo);
        fireCheckInfo.setWarm(modifyWarmCheck);

        ModifyFitCheck modifyFitCheck = new ModifyFitCheck();
        modifyFitCheck.setId(defaultUidGenerator.getUID());
        modifyFitCheck.setArea(new BigDecimal(123.00));
        modifyFitCheck.setLayers("10fit");
        modifyFitCheck.setPart(ModifyFitCheck.PART.CELL);
        modifyFitCheck.setCheck(fireCheckInfo);
        fireCheckInfo.setFit(modifyFitCheck);

        UseChange useChange = new UseChange();
        useChange.setId(defaultUidGenerator.getUID());
        useChange.setProperty(FireCheckInfo.UseProperty.FULL);
        useChange.setOldUse("OLD_USE");
        useChange.setCheck(fireCheckInfo);
        fireCheckInfo.setUseChange(useChange);

        StoreSquareCheck storeSquareCheck = new StoreSquareCheck();
        storeSquareCheck.setId(defaultUidGenerator.getUID());
        storeSquareCheck.setArea(new BigDecimal(111233.00));
        storeSquareCheck.setName("存储物名称");
        storeSquareCheck.setCheck(fireCheckInfo);
        fireCheckInfo.setSquare(storeSquareCheck);

        StoreTinCheck storeTinCheck = new StoreTinCheck();
        storeTinCheck.setId(defaultUidGenerator.getUID());
        storeTinCheck.setName("储罐名称");
        storeTinCheck.setLocation("储罐位置");
        storeTinCheck.setArea(new BigDecimal(9999.00));
        storeTinCheck.setType(StoreTinCheck.Type.DRY);
        storeTinCheck.setLayout(StoreTinCheck.Layout.HALF);
        storeTinCheck.setCheck(fireCheckInfo);
        fireCheckInfo.setTin(storeTinCheck);

        FireCheck fireCheck = new FireCheck();
        fireCheck.setId(fireCheckInfo.getId());
        fireCheck.setInfo(fireCheckInfo);
        fireCheck.setStatus(FireCheck.Status.Running);
        fireCheck.setApplyTime(new Date());
        fireCheck.setRegTime(new Date());
        fireCheck.setNoAcceptType(FireCheck.NoAcceptType.LESS_FILE);
        fireCheck.setMemo("情况说明");
        fireCheck.setOpinion("意见");
        fireCheck.setType(FireCheck.Type.First);
        fireCheck.setCorp(projectCorp.getCode());


        fireCheckRepository.save(fireCheck);

    }


    @Test
    @Ignore
    public void TestReport(){
        Optional<ProjectCorp> joinCorp = testCorpRepository.findByIdCodeAndIdProjectId(Long.valueOf(2201),Long.valueOf(2020052201));
        FireCheck fireCheck = businessService.fireCheck(Long.valueOf(2020052201)).get();
        Map<String, Object> data = new HashMap<>();
        data.put("fireCheck", fireCheck);
        data.put("org", "东港市住房和城乡建设局");
        data.put("word", "DG");
        data.put("joinCorp",joinCorp.get());
        data.put("enumData", EnumData.values());
        data.put("sheckTables", fireCheck.getInfo().getItems());
        data.put("joinCorps",fireCheck.getInfo().getProject().getCorps());
        List<String> testList = new ArrayList<>();
        testList.add("test1");
        testList.add("test2");
        data.put("testArray", testList);

        FileOutputStream fileOutputStream = null;
        try {
            Files.deleteIfExists(Paths.get("D:\\report\\test.pdf"));
            fileOutputStream = new FileOutputStream("D:\\report\\test.pdf");
            sampleReport(fileOutputStream, Long.toString(fireCheck.getId()), "东港市住房和城乡建设局", "completedContractsRecodApply.ftl", data);
            File file = new File("D:\\report\\test.pdf"); // 创建文件对象
            // Desktop.getDesktop().open(file);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e){
            System.out.println("delete text err");
        }finally {
            IOUtils.closeQuietly(fileOutputStream);
        }



    }

}
