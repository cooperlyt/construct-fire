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
            line-height: 30px;
        }
        .underline{
            text-decoration:underline;
        }
        .
    </style>
</head>


<body>

<div class="page" >
    <div class="hTitle"><p><strong>${org}</strong></p></div>
    <div class="hTitle"><p><strong>建设工程消防验收申请受理通知书</strong></p></div>
    <div class="right"><p>东住建消验受(${word})字第${fireCheck.id?string["0"]}号</p></div>
    <div><p><strong class="underline">${joinCorp.name!}</strong>：</p></div>
    <div class="text"><p>根据《中华人民共和国消防法》第十三条及相关规定，你单位<strong class="underline">${fireCheck.applyTime?string("yyyy年MM月dd日")}</strong>申请的建设工程（地址：<strong class="underline">${fireCheck.info.project.address!}</strong> ）消防验收，提供了下列材料： </p></div>
    <#if fireCheck.files?exists>
        <#list fireCheck.files?sort_by("id")  as  file>
            <#if file.pass == true>
                <p style="line-height: 30px">√ ${file_index + 1}.${file.name}</p>
            <#else>
                <p style="line-height: 30px">× ${file_index + 1}.${file.name}</p>
            </#if>


        </#list>
    </#if>
    <p class="text">经审查，申请符合规定，予以受理。自受理消防验收申请之日起二十个工作日内开展消防验收，并出具消防验收意见。依法需要听证、检验、检测、鉴定的，所需时间不计算在内。</p>
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
            <td>

            </td>
        </tr>

        <tr>
            <td>

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
<#--    <p>jfreechart</p>-->
<#--    <div>-->
<#--        <img src="${scatterUrl}" alt="散点图" width="700" height="600"/>-->
<#--    </div>-->
</div>

<#--<span style="page-break-after:always;"></span>-->
<#--<div class="page">-->
<#--    -->
<#--</div>-->


</body>

</html>
