<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="Content-Style-Type" content="text/css"/>
    <title></title>
    <style type="text/css">
        body {
            font-family: pingfang sc light;
            font-size: 110%;
        }
        .right{
            text-align: right;
            width: 90%;
        }
        .hTitle {
            text-align: center;
            width: 100%;
            font-size: 180%;
        }
        .text{
            text-indent: 2em;
            line-height: 20px;
        }
        .underline{
            text-decoration:underline;
        }
        .
    </style>
</head>


<body>
<#if fireCheck.info.builds?exists && (fireCheck.info.builds?size>0)>
    <#assign i=0,j=0/>
    <#list fireCheck.info.builds as buildcount>
        <#if buildcount.pass?exists && buildcount.pass == false>
            <#assign i=i+1 />
        </#if>
    </#list>
<#list fireCheck.info.builds as build>
<#if build.pass?exists && build.pass == false>
    <#assign j=j+1/>
<div class="page" >
    <div class="hTitle"><p><strong>${org}</strong></p></div>
    <div class="hTitle"><p><strong>建设工程消防验收意见书</strong></p></div>
    <div class="right"><p>东住建消验字(${word})第${fireCheck.id?string["0"]}号</p></div>
    <div><p><strong class="underline">${joinCorp.name!}</strong>：</p></div>


    <div class="text"><p>我部门对你单位申报的<strong class="underline">${fireCheck.info.project.name!}</strong>楼幢幢名称：<strong class="underline">${build.info.name!}</strong>（工程信息）进行了消防验收（受理凭证文号：<strong class="underline">${fireCheck.info.applyFile!}</strong>
            地点：<strong class="underline">${fireCheck.info.project.address!}</strong>，建筑层数：地上<strong class="underline">${build.info.upCount!}</strong>层、地下<strong class="underline">${build.info.underCount!}</strong>
            层，建筑高度：<strong class="underline">${build.info.height!}</strong>米，建筑面积:地上：<strong class="underline">${(build.info.onArea?string('#.000'))!}</strong>，
            地下：<strong class="underline">${(build.info.underArea?string('#.000'))!}</strong>平方米，使用性质：
            <#if (enumData)?exists>
                <#list enumData as enumItem>
                    <#if enumItem.type == "ProjectType" && enumItem.code ==fireCheck.info.project.type>
                        <strong class="underline">${enumItem.desc!}</strong>
                    </#if>
                </#list>
            </#if>

            。经审查材料及现场抽查测试，意见如下：
        </p></div>

    <#if build.opinion??>
        <p class="text">${build.opinion!}</p>
    <#else>
        <p class="text">${fireCheck.opinion!}</p>
    </#if>

    <p class="text">综合评定消防验收结论：不合格。此结论仅对当日验收所涉及的系统及设施情况负责。</p>
    <p class="text">你单位应对此次验收发现的问题进行整改并进一步组织有关单位进行自验，自验合格后重新申请消防验收，验收合格后方可投入使用。</p>
    <p class="text">如对上述存在异议，应在收到本意见书之日起六十日内向 东港市人民政府申请行政复议，或者在六个月内依法向东港市人民法院提起行政诉讼。</p>

    <table border="0" width="100%" >
        <tr>
            <td></td>
            <td class="right" style="font-size: 110%" height="30px">
                <p>东港市住房和城乡建设局</p>
            </td>
        </tr>
        <tr>
            <td></td>
            <td  style="font-size: 110%" align="right" height="30px">
                <p> ${.now?string("yyyy")}年${.now?string("mm")}月${.now?string("dd")}日</p>
            </td>
        </tr>
        <tr>
            <td style="font-size: 110%" width="35%" height="30px">
                建设单位签收：
            </td>
            <td style="font-size: 110%" align="right" height="30px">

            </td>
        </tr>
        <tr>
            <td style="font-size: 110%" width="35%" height="30px">

            </td>
            <td style="font-size: 110%" align="right" height="30px">
                <p>年 &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;月&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;日&nbsp; &nbsp; &nbsp; &nbsp;</p>
            </td>
        </tr>

        <tr>
            <td colspan="2" style="font-size: 110%" align="center" height="30px">
                <p>一式二份，一份交建设单位，一份存档。</p>
            </td>
        </tr>
    </table>

</div>
</#if>
    <#if j lte i-1>
        <span style="page-break-after:always;"></span>
    </#if>
</#list>
</#if>


</body>

</html>
