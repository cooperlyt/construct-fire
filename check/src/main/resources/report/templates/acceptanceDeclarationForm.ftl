<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="Content-Style-Type" content="text/css"/>
    <title></title>
    <style type="text/css">
        body {
            font-family: pingfang sc light;
            font-size: 100%;
        }
        .right{
            text-align: right;
            width: 100%;
        }
        .tword{
            text-align: center;
            font-size: 80%;
        }
        .hTitle {
            text-align: center;
            width: 100%;
            font-size: 200%;
        }
        .hTitle2 {
            width: 100%;
            font-size: 150%;
        }.text{
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
    <div class="hTitle" height="180px"><p></p></div>
    <div class="hTitle"><p><strong>建设工程消防验收申报表</strong></p></div>
    <div class="hTitle" height="100px"><p></p></div>
    <div class="hTitle2" style="text-indent:8em;"><p>工程名称:<label class="underline">${fireCheck.info.project.name!}</label></p></div>
    <div class="hTitle2" height="50px"><p></p></div>
    <div class="hTitle2" style="text-indent:8em;"><p>建设单位:<label class="underline">${joinCorp.name!}</label>（印章）</p></div>
    <div class="hTitle" height="50px"><p></p></div>
    <div class="hTitle2" style="text-indent:8em;"><p>填表日期:<label class="underline">${fireCheck.applyTime?string("yyyy年MM月dd日")}</label></p></div>
    <div class="hTitle" height="400px"><p></p></div>
</div>





<div class="page" >
    <div class="right"><p>业务编号：${fireCheck.id?string["0"]}号</p></div>

    <div style="text-align:center;clear: both" >
        <table style="margin:auto; width:100%;font-size: 90%" border="0.2" cellspacing="0">
            <tr align="center" valign="middle">
                <td width="10%" height="40px">建设单位</td>
                <td width="36%" colspan="2">${joinCorp.name!}</td>
                <td width="12%">法定代表人/主要负责人</td>
                <td width="15%">${joinCorp.ownerName}</td>
                <td width="12%">联系电话</td>
                <td width="15%">${joinCorp.tel!}</td>
            </tr>
            <tr align="center" valign="middle">
                <td width="10%" height="40px">工程名称</td>
                <td width="36%" colspan="2">${fireCheck.info.project.name!}</td>
                <td width="12%">联系人</td>
                <td width="15%">${joinCorp.contacts!}</td>
                <td width="12%">联系电话</td>
                <td width="15%">${joinCorp.tel!}</td>
            </tr>
            <tr align="center" valign="middle">
                <td width="10%" height="40px">工程地址</td>
                <td width="36%" colspan="3">${fireCheck.info.project.address!}</td>
                <td width="12%" colspan="1">使用性质</td>
                <#if (enumData)?exists>
                    <#list enumData as enumItem>
                        <#if enumItem.type == "ProjectType" && enumItem.code ==fireCheck.info.project.type>
                            <#assign pType = enumItem.desc>
                        </#if>
                    </#list>
                </#if>
                <td width="15%" colspan="2">${pType!}</td>


            </tr>
            <tr align="center" valign="middle">
                <td width="10%" height="40px">类  别</td>
                <#if (enumData)?exists>
                    <#list enumData as enumItem>
                        <#if enumItem.type == "ProjectProperty" && enumItem.code ==fireCheck.info.project.property>
                            <#assign pproperty = enumItem.desc>
                        </#if>
                    </#list>
                </#if>

                <td width="36%" colspan="4">
                    ${pproperty!}
                    <#if fireCheck.info.project.modifyFit?? && fireCheck.info.project.modifyFit == true>
                        <input type="checkbox" checked="true" />√装修
                    </#if>
                    <#if fireCheck.info.project.modifyWarm?? && fireCheck.info.project.modifyWarm == true>
                        <input type="checkbox" checked="true"/>√建筑保温
                    </#if>
                    <#if fireCheck.info.project.modifyUse?? && fireCheck.info.project.modifyUse == true>
                        <input type="checkbox" checked="true"/>√改变用途
                    </#if>
                </td>

                <td width="12%">受理类别</td>
                <td width="15%"></td>
            </tr>
            <tr align="center" valign="middle">
                <td width="20%" height="40px" colspan="4">
                    <table table style="margin:auto; width:100%;font-size: 100%;padding: 0;" border="0" cellspacing="0" >
                        <tr>
                            <td width="60%" height="40px" style="border-right:2px;font-size: 80%">施工图审查机构出具的综合审查合格书、技术咨询报告等审查意见文号</td>
                            <td width="40%">${fireCheck.info.designFile!}</td>
                        </tr>
                    </table>
                </td>
                <td width="20%" colspan="1">审核日期</td>
                <td width="20%" colspan="2">${(fireCheck.info.designFileDate?string("yyyy年MM月dd日"))!}</td>
            </tr>
            <tr align="center" valign="middle">
                <td width="20%" height="40px" colspan="4">
                    <table table style="margin:auto; width:100%;font-size: 100%;padding: 0;" border="0" cellspacing="0" >
                        <tr>
                            <td width="60%" height="40px" style="border-right:2px;font-size: 90%">建筑工程施工许可证明文件编号</td>
                            <td width="40%">${fireCheck.info.constructFile!}</td>
                        </tr>
                    </table>
                </td>
                <td width="20%" colspan="1">审核日期</td>
                <td width="20%" colspan="2">${(fireCheck.info.constructFileDate?string("yyyy年MM月dd日"))!}</td>h
            </tr>

            <tr align="center" valign="middle">
                <td width="10%" height="40px">单位类别</td>
                <td width="36%" colspan="2">单位名称</td>
                <td width="12%">资质等级</td>
                <td width="15%">法定代表人/主要负责人</td>
                <td width="12%">联系人</td>
                <td width="15%">联系电话</td>
            </tr>
            <#if (joinCorps)?exists>
                <#list joinCorps ? sort_by("property") as corp>
                    <tr align="center" valign="middle">
                        <#if corp.property == "Design">
                            <td width="10%" height="40px">设计单位</td>
                            <td width="36%" colspan="2">${corp.name!}</td>
                            <#if (enumData)?exists>
                                <#list enumData as enumItem>
                                    <#if enumItem.type == "IDesign" && enumItem.code==(corp.level?string)>
                                        <#assign corplevel = enumItem.desc>
                                    </#if>
                                </#list>
                            </#if>
                            <td width="12%">${corplevel!}</td>
                            <td width="15%">${corp.ownerName}</td>
                            <td width="12%">${corp.contacts!}</td>
                            <td width="15%">${corp.tel!}</td>
                        </#if>
                        <#if corp.property == "Construct">
                            <td width="10%" height="40px">施工单位</td>
                            <td width="36%" colspan="2">${corp.name!}</td>
                            <#if (enumData)?exists>
                                <#list enumData as enumItem>
                                    <#if enumItem.type == "IConstruct" && enumItem.code==(corp.level?string)>
                                        <#assign constructlevel = enumItem.desc>
                                    </#if>
                                </#list>
                            </#if>
                            <td width="12%">${constructlevel!}</td>
                            <td width="15%">${corp.ownerName}</td>
                            <td width="12%">${corp.contacts!}</td>
                            <td width="15%">${corp.tel!}</td>
                        </#if>
                        <#if corp.property == "Supervisor">
                            <td width="10%" height="40px">监理单位</td>
                            <td width="36%" colspan="2">${corp.name!}</td>
                            <#if (enumData)?exists>
                                <#list enumData as enumItem>
                                    <#if enumItem.type == "ISupervisor" && enumItem.code==(corp.level?string)>
                                        <#assign supervisorlevel = enumItem.desc>
                                    </#if>
                                </#list>
                            </#if>
                            <td width="12%">${supervisorlevel!}</td>
                            <td width="15%">${corp.ownerName}</td>
                            <td width="12%">${corp.contacts!}</td>
                            <td width="15%">${corp.tel!}</td>
                        </#if>
                    </tr>
                </#list>
            </#if>
            <tr align="center" valign="middle">
                <td width="100%" height="40px" colspan="7">
                    <table table style="margin:auto; width:100%;font-size: 90%;padding: 0;" border="0" cellspacing="0" >
                        <tr align="center" valign="middle">
                            <td width="20%" height="40px" style="border-right:2px" colspan="2">单体建筑名称</td>
                            <td width="10%" style="border-right:2px">结构类型</td>
                            <td width="10%" style="border-right:2px">耐火等级</td>
                            <td width="10%" style="border-right:2px">地上层数</td>
                            <td width="10%" style="border-right:2px">地下层数</td>
                            <td width="10%" style="border-right:2px">建筑高度（m）</td>
                            <td width="10%" style="border-right:2px">占地面积（m2）</td>
                            <td width="10%" style="border-right:2px">地上建筑面积（m2）</td>
                            <td width="10%">地下建筑面积（m2）</td>
                        </tr>

                        <#list fireCheck.info.builds as build>
                            <tr align="center" valign="middle">
                                <td width="20%" height="40px" style="border-right:2px;border-top:2px" colspan="2">${build.info.name!}</td>

                                <#if (enumData)?exists>
                                    <#list enumData as enumItem>
                                        <#if enumItem.type == "ProjectStruct" && enumItem.code==build.info.structure>
                                            <#assign bStruct = enumItem.desc>
                                        </#if>
                                    </#list>
                                </#if>
                                <td width="10%" style="border-right:2px;border-top: 2px;">${bStruct!}</td>
                                <#if (enumData)?exists>
                                    <#list enumData as enumItem>
                                        <#if enumItem.type == "Rating"  && enumItem.code==(build.rating?string)>
                                            <#assign bRating = enumItem.desc>
                                        </#if>
                                    </#list>
                                </#if>
                                <td width="10%" style="border-right:2px;border-top: 2px;">${bRating!}</td>

                                <td width="10%" style="border-right:2px;border-top: 2px">${build.info.upCount!}</td>
                                <td width="10%" style="border-right:2px;border-top: 2px">${build.info.underCount!}</td>
                                <td width="10%" style="border-right:2px;border-top: 2px">${build.info.height!}</td>
                                <td width="10%" style="border-right:2px;border-top: 2px">${(build.info.landArea?string('#.000'))!}</td>
                                <td width="10%" style="border-right:2px;border-top: 2px">${(build.info.onArea?string('#.000'))!}</td>
                                <td width="10%" style="border-top: 2px">${(build.info.underArea?string('#.000'))!}</td>
                            </tr>
                        </#list>

                        <#if fireCheck.tin?exists>
                        <tr align="center" valign="middle">
                            <td width="1%"  style="border-right:2px;border-top: 2px" rowspan="3">油罐</td>
                            <td style="border-right:2px;border-top: 2px" height="40px" colspan="1">设置位置</td>
                            <td style="border-right:2px;border-top: 2px" colspan="4">${fireCheck.tin.location!}</td>
                            <td style="border-right:2px;border-top: 2px" colspan="2">总容量（m3）</td>
                            <td style="border-top: 2px" colspan="2">${fireCheck.tin.area!?string('#.000')}</td>
                        </tr>
                        <tr align="center" valign="middle">
                            <td width="12%" style="border-right:2px;border-top: 2px" height="40px" colspan="1">设置型式</td>
                            <#if (enumData)?exists>
                                <#list enumData as enumItem>
                                    <#if enumItem.type == "TinType"  && enumItem.code==fireCheck.tin.type >
                                        <#assign bTinType = enumItem.desc>
                                    </#if>
                                </#list>
                            </#if>
                            <td width="88%" style="border-top: 2px" colspan="8">${bTinType}</td>
                        </tr>

                        <tr align="center" valign="middle">
                            <td style="border-right:2px;border-top: 2px" height="40px" colspan="1">储存形式</td>
                            <#if (enumData)?exists>
                                <#list enumData as enumItem>
                                    <#if enumItem.type == "Layout"  && enumItem.code==fireCheck.tin.layout >
                                        <#assign bLayout = enumItem.desc>
                                    </#if>
                                </#list>
                            </#if>
                            <td style="border-right:2px;border-top: 2px" colspan="3">${bLayout}</td>
                            <td style="border-right:2px;border-top: 2px" colspan="2">储存物质名称</td>
                            <td style="border-top: 2px" colspan="3">${fireCheck.tin.name!}</td>
                        </tr>

                        <#else>
                            <tr align="center" valign="middle">
                                <td width="1%"  style="border-right:2px;border-top: 2px" rowspan="3">油罐</td>
                                <td style="border-right:2px;border-top: 2px" height="40px" colspan="1">设置位置</td>
                                <td style="border-right:2px;border-top: 2px" colspan="4"></td>
                                <td style="border-right:2px;border-top: 2px" colspan="2">总容量（m3）</td>
                                <td style="border-top: 2px" colspan="2"></td>
                            </tr>
                            <tr align="center" valign="middle">
                                <td width="12%" style="border-right:2px;border-top: 2px" height="40px" colspan="1">设置型式</td>
                                <td width="88%" style="border-top: 2px" colspan="8">浮顶罐（□外   □内）   □固定顶罐   □卧式罐
                                    球形罐（□液体 □气体） 可燃气体储罐（□干式  □湿式） □其他
                                </td>
                            </tr>

                            <tr align="center" valign="middle">
                                <td style="border-right:2px;border-top: 2px" height="40px" colspan="1">储存形式</td>
                                <td style="border-right:2px;border-top: 2px" colspan="3">□地上    □半地下    □地下</td>
                                <td style="border-right:2px;border-top: 2px" colspan="2">储存物质名称</td>
                                <td style="border-top: 2px" colspan="3"></td>
                            </tr>
                        </#if>
                        <#if fireCheck.square?exists>
                        <tr align="center" valign="middle">
                            <td width="3%" style="border-right:2px;border-top: 2px;border-bottom: 2px">堆场</td>
                            <td style="border-right:2px;border-top: 2px;border-bottom: 2px" height="40px" colspan="1">储  量</td>
                            <td style="border-right:2px;border-top: 2px" colspan="3">${fireCheck.square.area?string('#.000')}</td>
                            <td style="border-right:2px;border-top: 2px" colspan="2">储存物质名称</td>
                            <td style="border-top: 2px" colspan="3">${fireCheck.square.name!}</td>
                        </tr>
                        <#else>
                            <tr align="center" valign="middle">
                                <td width="3%" style="border-right:2px;border-top: 2px;border-bottom: 2px">堆场</td>
                                <td style="border-right:2px;border-top: 2px;border-bottom: 2px" height="40px" colspan="1">储  量</td>
                                <td style="border-right:2px;border-top: 2px" colspan="3"></td>
                                <td style="border-right:2px;border-top: 2px" colspan="2">储存物质名称</td>
                                <td style="border-top: 2px" colspan="3"></td>
                            </tr>
                        </#if>

                        <#if fireCheck.warm?exists>
                            <tr align="center" valign="middle">
                                <td width="20%" colspan="2" rowspan="2" style="border-right:2px;border-bottom: 2px" >□建筑保温</td>
                                <td width="20%" colspan="2" style="border-right:2px;border-top: 2px" height="40px">材料类别</td>
                                <#if (enumData)?exists>
                                <#list enumData as enumItem>
                                    <#if enumItem.type == "WarmType"  && enumItem.code==fireCheck.warm.type >
                                        <#assign PWarmType = enumItem.desc>
                                    </#if>
                                </#list>
                                </#if>
                                <td width="20%" colspan="2" style="border-right:2px;border-top: 2px" >${PWarmType}</td>
                                <td width="20%" colspan="2" style="border-right:2px;border-top: 2px" height="40px" >保温层数</td>
                                <td width="20%" colspan="2" style="border-bottom: 0px;border-top: 2px">${fireCheck.warm.layers!}</td>
                            </tr>
                            <tr>
                                <td width="20%" colspan="2" style="border-right:2px;border-top: 2px" height="40px">使用性质</td>
<#--                                <#if (enumData)?exists && fireCheck.property?exists>-->
<#--                                    <#list enumData as enumItem>-->
<#--                                        <#if enumItem.type == "UseProperty"  && enumItem.code==fireCheck.property>-->
<#--                                            <#assign PUseProperty = enumItem.desc>-->
<#--                                        </#if>-->
<#--                                    </#list>-->
<#--                                    <td width="20%" colspan="2" style="border-right:2px;border-top: 2px" >${PUseProperty}</td>-->
<#--                                    <#else>-->
<#--                                        <td width="20%" colspan="2" style="border-right:2px;border-top: 2px" ></td>-->
<#--                                </#if>-->
                                <td width="20%" colspan="2" style="border-right:2px;border-top: 2px" ></td>
                                <td width="20%" colspan="2" style="border-right:2px;border-top: 2px" height="40px">原有用途</td>
                                <td width="20%" colspan="2" style="border-top: 2px">${fireCheck.info.oldUse}</td>
                            </tr>
                        <#else>
                            <tr align="center" valign="middle">
                                <td width="20%" colspan="2" rowspan="2" style="border-right:2px;border-bottom: 2px" >□建筑保温</td>
                                <td width="20%" colspan="2" style="border-right:2px;border-top: 2px" height="40px">材料类别</td>
                                <td width="20%" colspan="2" style="border-right:2px;border-top: 2px" >□A    □B1     □B2</td>
                                <td width="20%" colspan="2" style="border-right:2px;border-top: 2px" height="40px" >保温层数</td>
                                <td width="20%" colspan="2" style="border-bottom: 0px;border-top: 2px"></td>
                            </tr>
                            <tr>
                                <td width="20%" colspan="2" style="border-right:2px;border-top: 2px" height="40px">使用性质</td>
                                <td width="20%" colspan="2" style="border-right:2px;border-top: 2px" ></td>
                                <td width="20%" colspan="2" style="border-right:2px;border-top: 2px" height="40px">原有用途</td>
                                <td width="20%" colspan="2" style="border-top: 2px"></td>
                            </tr>
                        </#if>


                        <#if fireCheck.fit?exists>
                            <tr>
                                <td rowspan="3" colspan="2" style="border-right:2px;border-top: 0px">□装修工程</td>
                                <td colspan="2" width="20%" style="border-right:2px;border-bottom: 2px;border-top: 2px" height="40px">装修部位</td>

                                <#if (enumData)?exists>
                                    <#list enumData as enumItem>
                                        <#if enumItem.type == "PART"  && enumItem.code==fireCheck.fit.part >
                                            <#assign bPART = enumItem.desc>
                                        </#if>
                                    </#list>
                                </#if>

                                <td colspan="6" width="80%" style="border-right:0px;border-bottom: 2px;border-top: 2px">${bPART!}</td>

                            </tr>
                            <tr>
                                <td colspan="2" width="20%" style="border-right:2px;border-bottom: 0px" height="40px">装修面积（m2）</td>
                                <td colspan="2" width="30%" style="border-right:2px;border-bottom: 0px" >${fireCheck.fit.area!?string('#.000')}</td>
                                <td colspan="2" width="20%" style="border-right:2px;border-bottom: 0px" height="40px">装修层数</td>
                                <td colspan="2" width="30%" width="20%" style="border-bottom: 0px">${fireCheck.fit.layers!}</td>
                            </tr>
                            <tr>
                                <td colspan="2" width="20%" style="border-right:2px;border-top: 2px" height="40px">使用性质</td>
                                <td colspan="2" width="30%" style="border-right:2px;border-top: 2px" ></td>
                                <td colspan="2" width="20%" style="border-right:2px;border-top: 2px" height="40px">原有用途</td>
                                <td colspan="2" width="30%" width="20%" style="border-top: 2px"></td>
                            </tr>
                        <#else>
                            <tr>
                                <td rowspan="3" colspan="2" style="border-right:2px;border-top: 0px">□装修工程</td>
                                <td colspan="2" width="20%" style="border-right:2px;border-bottom: 2px;border-top: 2px" height="40px">装修部位</td>
                                <td colspan="6" width="80%" style="border-right:0px;border-bottom: 2px;border-top: 2px">□顶棚 □墙面 □地面 □隔断 □固定家具 □装饰织物 □其他</td>

                            </tr>
                            <tr>
                                <td colspan="2" width="20%" style="border-right:2px;border-bottom: 0px" height="40px">装修面积（m2）</td>
                                <td colspan="2" width="30%" style="border-right:2px;border-bottom: 0px" ></td>
                                <td colspan="2" width="20%" style="border-right:2px;border-bottom: 0px" height="40px">装修层数</td>
                                <td colspan="2" width="30%" width="20%" style="border-bottom: 0px"></td>
                            </tr>
                            <tr>
                                <td colspan="2" width="20%" style="border-right:2px;border-top: 2px" height="40px">使用性质</td>
                                <td colspan="2" width="30%" style="border-right:2px;border-top: 2px" ></td>
                                <td colspan="2" width="20%" style="border-right:2px;border-top: 2px" height="40px">原有用途</td>
                                <td colspan="2" width="30%" width="20%" style="border-top: 2px"></td>
                            </tr>
                        </#if>



                    </table>
                </td>
            </tr>
            <tr align="center" valign="middle">
                <td colspan="7" with="100%" >
                    <table table style="margin:auto; width:100%;font-size: 100%;padding: 0;" border="0" cellspacing="0" >
                        <tr>
                            <td width="100%" style="border-bottom: 2px;font-size: 150%" height="40px" colspan="4">竣 工 验 收 情 况</td>
                        </tr>
                        <tr>
                            <td width="35%" style="border-right:2px;border-bottom: 2px" height="40px">验收内容</td>
                            <td width="15%" style="border-right:2px;border-bottom: 2px" >验收情况</td>
                            <td width="30%" style="border-right:2px;border-bottom: 2px" height="40px">验收内容</td>
                            <td width="20%" style="border-right:0px;border-bottom: 2px" >验收情况</td>
                        </tr>

                        <tr align="left" valign="middle">
                            <td width="35%" style="border-right:2px;border-bottom: 2px" height="40px">□建筑类别</td>
                            <td width="15%" style="border-right:2px;border-bottom: 2px" ></td>
                            <td width="30%" style="border-right:2px;border-bottom: 2px" height="40px">□室内消火栓系统</td>
                            <td width="20%" style="border-right:0px;border-bottom: 2px" ></td>
                        </tr>
                        <tr align="left" valign="middle">
                            <td width="35%" style="border-right:2px;border-bottom: 2px" height="40px">□总平面布局</td>
                            <td width="15%" style="border-right:2px;border-bottom: 2px" ></td>
                            <td width="30%" style="border-right:2px;border-bottom: 2px" height="40px">□自动喷水灭火系统</td>
                            <td width="20%" style="border-right:0px;border-bottom: 2px" ></td>
                        </tr>
                        <tr align="left" valign="middle">
                            <td width="35%" style="border-right:2px;border-bottom: 2px" height="40px">□平面布置</td>
                            <td width="15%" style="border-right:2px;border-bottom: 2px" ></td>
                            <td width="30%" style="border-right:2px;border-bottom: 2px" height="40px">□其他灭火设施</td>
                            <td width="20%" style="border-right:0px;border-bottom: 2px" ></td>
                        </tr>
                        <tr align="left" valign="middle">
                            <td width="35%" style="border-right:2px;border-bottom: 2px" height="40px">□消防水源</td>
                            <td width="15%" style="border-right:2px;border-bottom: 2px" ></td>
                            <td width="30%" style="border-right:2px;border-bottom: 2px" height="40px">□防烟排烟系统</td>
                            <td width="20%" style="border-right:0px;border-bottom: 2px" ></td>
                        </tr>
                        <tr align="left" valign="middle">
                            <td width="35%" style="border-right:2px;border-bottom: 2px" height="40px">□消防电源</td>
                            <td width="15%" style="border-right:2px;border-bottom: 2px" ></td>
                            <td width="30%" style="border-right:2px;border-bottom: 2px" height="40px">□安全疏散</td>
                            <td width="20%" style="border-right:0px;border-bottom: 2px" ></td>
                        </tr>
                        <tr align="left" valign="middle">
                            <td width="35%" style="border-right:2px;border-bottom: 2px" height="40px">□装修防火</td>
                            <td width="15%" style="border-right:2px;border-bottom: 2px" ></td>
                            <td width="30%" style="border-right:2px;border-bottom: 2px" height="40px">□防烟分区</td>
                            <td width="20%" style="border-right:0px;border-bottom: 2px" ></td>
                        </tr>
                        <tr align="left" valign="middle">
                            <td width="35%" style="border-right:2px;border-bottom: 2px" height="40px">□建筑保温</td>
                            <td width="15%" style="border-right:2px;border-bottom: 2px" ></td>
                            <td width="30%" style="border-right:2px;border-bottom: 2px" height="40px">□消防电梯</td>
                            <td width="20%" style="border-right:0px;border-bottom: 2px" ></td>
                        </tr>
                        <tr align="left" valign="middle">
                            <td width="35%" style="border-right:2px;border-bottom: 2px" height="40px">□防火分区</td>
                            <td width="15%" style="border-right:2px;border-bottom: 2px" ></td>
                            <td width="30%" style="border-right:2px;border-bottom: 2px" height="40px">□防爆</td>
                            <td width="20%" style="border-right:0px;border-bottom: 2px" ></td>
                        </tr>
                        <tr align="left" valign="middle">
                            <td width="35%" style="border-right:2px;border-bottom: 2px" height="40px">□室外消火栓系统</td>
                            <td width="15%" style="border-right:2px;border-bottom: 2px" ></td>
                            <td width="30%" style="border-right:2px;border-bottom: 2px" height="40px">□灭火器</td>
                            <td width="20%" style="border-right:0px;border-bottom: 2px" ></td>
                        </tr>
                        <tr align="left" valign="middle">
                            <td width="35%" style="border-right:2px;border-bottom: 2px" height="40px">□火灾自动报警系统</td>
                            <td width="15%" style="border-right:2px;border-bottom: 2px" ></td>
                            <td width="30%" style="border-right:2px;border-bottom: 2px" height="40px">□其他：</td>
                            <td width="20%" style="border-right:0px;border-bottom: 2px" ></td>
                        </tr>
                        <tr align="left" valign="middle">
                            <td width="35%" style="border-right:2px;border-bottom: 0px" height="40px">□消防工程验收结论</td>
                            <td width="65%" style="border-right:0px;border-bottom: 0px" colspan="3"></td>

                        </tr>

                    </table>
                </td>

            </tr>

            <tr>
                <td colspan="7" with="100%" >
                    <div style="text-align:left;clear: both" >
                        <table table style="margin:auto; width:100%;font-size: 100%;padding: 0;" border="0" cellspacing="0" >
                            <tr align="left" valign="top">
                                <td width="50%" height="15px"  style="border-right:2px;"></td>
                                <td width="50%"></td>
                            </tr>
                            <tr align="left" valign="top">
                                <td width="50%" style="border-right:2px;border-bottom: 2px;text-indent: 2em" height="145px">&nbsp;&nbsp;&nbsp;消防工程验收结论：</td>
                                <td width="50%" style="border-right:0px;border-bottom: 2px;text-indent: 2em" >&nbsp;&nbsp;&nbsp;其他需要说明的情况：</td>
                            </tr>
                            <tr>
                                <td width="50%" style="border-right:2px;border-bottom: 2px" height="180px">
                                    <div style="clear: both" >
                                        <table table style="margin:auto; width:100%;font-size: 100%;padding: 0;" border="0" cellspacing="0" >
                                            <tr align="left">
                                                <td height="15px" colspan="2"></td>
                                            </tr>
                                            <tr align="left">
                                                <td height="15px" style="text-blink:2em;">&nbsp;&nbsp;&nbsp;设计单位确认：</td>
                                                <td ></td>
                                            </tr>
                                            <tr style="text-align: left" align="left">
                                                <td height="60px" colspan="2"></td>
                                            </tr>
                                            <tr align="center" valign="top" >
                                                <td></td>
                                                <td height="40px">（设计单位印章）</td>
                                            </tr>
                                            <tr align="right" valign="top">
                                                <td></td>
                                                <td height="50px">&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日</td>
                                            </tr>

                                        </table>
                                    </div>
                                </td>
                                <td width="50%" style="border-right:0px;border-bottom: 2px" >
                                    <div style="clear: both" >
                                        <table table style="margin:auto; width:100%;font-size: 100%;padding: 0;" border="0" cellspacing="0" >
                                            <tr align="left">
                                                <td height="15px" colspan="2"></td>
                                            </tr>
                                            <tr align="left">
                                                <td height="15px">&nbsp;&nbsp;&nbsp;施工单位确认：</td>
                                                <td ></td>
                                            </tr>
                                            <tr style="text-align: left" align="left">
                                                <td height="60px" colspan="2"></td>
                                            </tr>
                                            <tr align="center" valign="top">
                                                <td></td>
                                                <td height="40px">（施工单位印章）</td>
                                            </tr>
                                            <tr align="right" valign="top">
                                                <td></td>
                                                <td height="50px">&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日</td>
                                            </tr>

                                        </table>
                                    </div>

                                </td>
                            </tr>
                            <tr>
                                <td width="50%" style="border-right:2px;border-bottom: 0px" height="180px">
                                    <div style="clear: both" >
                                        <table table style="margin:auto; width:100%;font-size: 100%;padding: 0;" border="0" cellspacing="0" >
                                            <tr align="left">
                                                <td height="15px" colspan="2"></td>
                                            </tr>
                                            <tr align="left">
                                                <td height="15px" style="text-blink:2em;">&nbsp;&nbsp;&nbsp;监理单位确认：</td>
                                                <td ></td>
                                            </tr>
                                            <tr style="text-align: left" align="left">
                                                <td height="60px" colspan="2"></td>
                                            </tr>
                                            <tr align="center" valign="top" >
                                                <td></td>
                                                <td height="40px">（监理单位印章）</td>
                                            </tr>
                                            <tr align="right" valign="top">
                                                <td></td>
                                                <td height="50px">&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日</td>
                                            </tr>

                                        </table>
                                    </div>
                                </td>
                                <td width="50%" style="border-right:0px;border-bottom: 0px" height="150px">
                                    <div style="clear: both" >
                                        <table table style="margin:auto; width:100%;font-size: 100%;padding: 0;" border="0" cellspacing="0" >
                                            <tr align="left">
                                                <td height="15px" colspan="2"></td>
                                            </tr>
                                            <tr align="left">
                                                <td height="15px">&nbsp;&nbsp;&nbsp;建设单位确认：</td>
                                                <td ></td>
                                            </tr>
                                            <tr style="text-align: left" align="left">
                                                <td height="60px" colspan="2"></td>
                                            </tr>
                                            <tr align="center" valign="top">
                                                <td></td>
                                                <td height="40px">（建设单位印章）</td>
                                            </tr>
                                            <tr align="right" valign="top">
                                                <td></td>
                                                <td height="50">&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日</td>
                                            </tr>

                                        </table>
                                    </div>

                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>


        </table>
    </div>

    <span style="page-break-after:always;"></span>
    <div class="page">



        <div class="hTitle"><p><strong>说    明</strong></p></div>
        <div class="text"><p><strong>1.此表由建设单位填写并加盖印章，申报表涉及多页，需要加盖骑缝章，没有单位印章的，应由其负责人签名。填表前请仔细阅读《中华人民共和国消防法》及相关规定，确知享有的权利和应尽的义务。建设工程竣工验收情况涉及多家设计单位、施工单位、监理单位的，各单位均应予以确认。</strong></p></div>
        <div class="text"><p><strong>2.建设单位应如实填写各项内容，对提交材料的真实性、完整性负责，不得虚构、伪造或编造事实，否则将承担相应的法律后果。</strong></p></div>
        <div class="text"><p><strong>3.填写应使用钢笔和能够长期保持字迹的墨水或打印，字迹清楚，文面整洁，不得涂改。</strong></p></div>
        <div class="text"><p><strong>4.表格设定的栏目，应逐项填写；不需填写的，应划“\”。</strong></p></div><#--    <p>jfreechart</p>-->
        <div class="text"><p><strong>5.表格中的“□”，表示可供选择，在选中内容前的“□”内画√。</strong></p></div>
        <div class="text"><p><strong>6.申报建设工程局部验收的，应在“其他需要说明的情况”中说明有关情况。</strong></p></div>
        <div class="text"><p><strong>7.关于“使用性质”的填报说明：</strong></p></div>
        <div class="text"><p><strong>人员密集场所是指，公众聚集场所，医院的门诊楼、病房楼，学校的教学楼、图书馆、食堂和集体宿舍，养老院，福利院，托儿所，幼儿园，公共图书馆的阅览室，公共展览馆、博物馆的展示厅，劳动密集型企业的生产加工车间和员工集体宿舍，旅游、宗教活动场所等。</strong></p></div>
        <div class="text"><p><strong>公众聚集场所是指，宾馆、饭店、商场、集贸市场、客运车站候车室、客运码头候船厅、民用机场航站楼、体育场馆、会堂以及公共娱乐场所等。</strong></p></div>
        <div class="text"><p><strong>易燃易爆场所是指，生产、储存、装卸易燃易爆危险品的工厂、仓库和专用车站、码头，以及易燃易爆气体和液体的充装站、供应站、调压站等场所。</strong></p></div>
        <div class="text"><p><strong>8.申报建设工程消防验收的，应同时上传提交下列电子版材料：</strong></p></div>
        <div class="text"><p><strong>（1）工程竣工验收报告；</strong></p></div>
        <div class="text"><p><strong>（2）有关消防设施的工程竣工图纸；</strong></p></div>
        <div class="text"><p><strong>（3）消防产品质量合格证明文件；</strong></p></div>
        <div class="text"><p><strong>（4）具有防火性能要求的建筑构件、建筑材料（含建筑保温材料）、装修材料符合国家标准或者行业标准的证明文件、出厂合格证</strong></p></div>
        <div class="text"><p><strong>（5）消防设施检测合格证明文件；</strong></p></div>
        <div class="text"><p><strong>（7）建设单位的工商营业执照等合法身份证明文件；</strong></p></div>
        <div class="text"><p><strong>（8）法律、行政法规规定的其他材料。</strong></p></div>
    </div>
</div>
</body>

</html>
