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
            line-height:25px;
        }
        .underline{
            text-decoration:underline;
        }
    </style>
</head>


<body>

<div class="page" >
    <div class="hTitle"><p><strong>${org}</strong></p></div>
    <div class="hTitle"><p><strong>建设工程竣工验收消防备案检查意见书</strong></p></div>
    <div class="right"><p>东住建消竣查字(${word})第${fireCheck.id?string["0"]}号</p></div>
    <div><p><strong class="underline">${joinCorp.name!}</strong>：</p></div>


    <div class="text"><p>我部门对你单位申报的<strong class="underline">${fireCheck.info.project.name!}</strong>（备案文号及工程信息）进行了竣工验收消防备案抽查，经审查资料及现场抽查测试，意见如下：</p></div>
   <#assign h=true>
    <#if fireCheck.info.builds?exists && (fireCheck.info.builds?size>0)>
      <#list fireCheck.info.builds as build>
          <#if build.pass?exists && build.pass == true>
             <p class="text">${build.opinion!}</p>
              <#assign h=false>
          </#if>
     </#list>
    </#if>
    <#if h == true>
        <p class="text">${fireCheck.opinion!}</p>
    </#if>
    <p class="text" >综合评定消防验收结论：合格。此结论仅对当日验收所涉及的系统及设施情况负责。</p>
    <p class="text" >该工程如需扩建、改建(含室内外装修、建筑保温、用途变更)的，应当依法建设工程消防设计审查机构申请施工图设计文件审查或备案；属于公众聚集场所的，投入使用、营业前应向消防部门作出符合消防安全标准的承诺。</p>
<#--    <#list testArray as test>-->
<#--        ${test}-->
<#--    </#list>-->

    <table border="0" width="100%" >
        <tr>
            <td></td>
            <td class="right" style="font-size: 110%" height="50px">
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



</body>

</html>
