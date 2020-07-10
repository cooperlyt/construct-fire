<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:link="http://www.w3.org/1999/html">
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
            font-size: 140%;
        }
        .text{
            text-indent: 2em;
            line-height: 30px;
        }
        .underline{
            text-decoration:underline;
        }
    </style>

</head>

<body>

<div class="page" >
    <div class="hTitle"><p><strong>${org}</strong></p></div>
    <div class="hTitle"><p><strong>建设工程竣工验收消防备案材料补正通知书</strong></p></div>
    <div class="hTitle"><p><strong>材料补正通知书</strong></p></div>
    <div class="right"><p>东住建消竣备补字(${word})第${fireCheck.id?string["0"]}号</p></div>
    <div><p><strong class="underline">${joinCorp.name!}</strong>：</p></div>
    <div class="text"><p>根据《中华人民共和国消防法》第十三条及相关规定，你单位<strong class="underline">${fireCheck.applyTime?string("yyyy年MM月dd日")}</strong>申请的建设工程（地址：<strong class="underline">${fireCheck.info.project.address!}</strong> ）消防验收，提供了下列材料： </p></div>
    <#assign notSelect="">
    <#if fireCheck.files?exists>
        <#list fireCheck.files?sort_by("id")  as  file>
            <#if file.pass == true>
                <p style="line-height: 30px">√ ${file_index + 1}.${file.name}</p>

            <#else>
                <p style="line-height: 30px">× ${file_index + 1}.${file.name}</p>
                <#assign notSelect = notSelect + ((file_index+1)?string("number"))+"   "/>
            </#if>


        </#list>
    </#if>
    <p class="text" style="line-height: 30px"> 经审查，备案材料不符合规定，需要补正上列第<strong class="underline">${notSelect!}</strong>项材料，请在五个工作日内补正并备案，逾期不备案的，住房和城乡建设主管部门将依法处罚并确定该工程为检查对象；如已投入使用，你单位应当将工程停止使用。
    </p>

<#--    <#list testArray as test>-->
<#--        ${test}-->
<#--    </#list>-->

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
                <p> ${.now?string("yyyy年MM月dd日")}</p>
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
