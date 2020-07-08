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
<#if fireCheck.info.builds?exists && (fireCheck.info.builds?size>0)>
    <#assign i=0,j=0/>
    <#list fireCheck.info.builds as buildcount>
        <#if buildcount.pass?exists && buildcount.pass == true>
            <#assign i=i+1 />
        </#if>
    </#list>
    <#list fireCheck.info.builds as build>

        <#if build.pass?exists && build.pass == true>
            <#assign j=j+1/>
            <div class="page" >
                <div class="hTitle"><p><strong>${org}</strong></p></div>
                <div class="hTitle"><p><strong>特殊建设工程消防验收不予受理凭证</strong></p></div>
                <div class="right"><p>（文号:${fireCheck.id?string["0"]})</p></div>
                <div><p><strong class="underline">${joinCorp.name!}</strong>：</p></div>


                <div class="text"><p>根据《中华人民共和国建筑法》《中华人民共和国消防法》《建设 工程质量管理条例》《建设工程消防设计审查验收管理暂行规定》等有关规定，你单位于<strong class="underline">${fireCheck.applyTime?string("yyyy年MM月dd日")}</strong>申请<strong class="underline">${fireCheck.info.project.name!}</strong>(楼幢幢名称:<strong class="underline">${build.info.name!}</strong>)建设工程
                        (地址:<strong class="underline">${fireCheck.info.project.address!}</strong>;建筑面积:地上:<strong class="underline">${(build.info.onArea?string('#.000'))!}</strong>;地下:<strong class="underline">${(build.info.underArea?string('#.000'))!}</strong>平方米;建筑层数:地上<strong class="underline">${build.info.onCount!}</strong>层、地下<strong class="underline">${build.info.underCount!}</strong>
                        层，建筑高度:<strong class="underline">${build.info.height!}</strong>米，使用性质:
                        <#if (enumData)?exists>
                            <#list enumData as enumItem>
                                <#if enumItem.type == "UseProperty" && enumItem.code ==build.property>
                                    <strong class="underline">${enumItem.desc!}</strong>
                                </#if>
                            </#list>
                        </#if>
                        )消防验收，并提交了下列材料
                    </p></div>

                <#assign notSelect="">
                <#if fireCheck.files?exists>
                    <#list fireCheck.files?sort_by("id")  as  file>
                        <#if file.pass == true>
                            <p style="line-height: 20px">√ ${file_index + 1}.${file.name}</p>
                        <#else>

                            <p style="line-height: 20px">× ${file_index + 1}.${file.name}</p>
                            <#assign notSelect = notSelect + ((file_index+1)?string("number"))+"   "/>
                        </#if>
                    </#list>
                </#if>
                <p class="text" style="line-height: 25px"> 经审查，存在以下情形，不予受理。□1.依法不需要消防验收；□2.依法不属于本部门管辖，应当向有关单位申请；√3.提交的上列第
                    <strong class="underline">${notSelect!}</strong>项材料为不合格材料。</p>



                <table border="0" width="100%" >
                    <tr>
                        <td></td>
                        <td  style="font-size: 110%" align="center" height="50px">
                            <p>（印章）</p>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td  style="font-size: 110%" align="center" height="30px">
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
                        <td style="font-size: 110%" align="center" height="30px">
                            <p>年 &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;月&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;日</p>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2" style="font-size: 110%" align="center" height="30px">
                            <p>备注：本凭证一式两份，一份交建设单位，一份存档</p>
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
