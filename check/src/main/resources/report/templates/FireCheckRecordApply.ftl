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
            font-size: 150%;
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
    <div class="hTitle"><p><strong>建设工程消防验收备案表</strong></p></div>
    <div class="right"><p>文号：${fireCheck.id?string["0"]}</p></div>

    <table table style="margin:auto; width:100%;font-size: 100%" border="0" cellspacing="0">
        <tr align="left" valign="middle">
            <td width="12%" >工程名称：</td>
            <td width="52%">${fireCheck.info.project.name!} &nbsp;&nbsp;（印章）</td>
            <td width="12%" >申请日期：</td>
            <td width="24%">${fireCheck.applyTime?string("yyyy年MM月dd日")}</td>
        </tr>
    </table>

    <div style="text-align:center;clear: both" >

        <table style="margin:auto; width:100%;font-size: 90%" border="0.3" cellspacing="0">
            <tr align="center" valign="middle">
                <td width="10%" height="40px">建设单位</td>
                <td width="36%" colspan="2">${joinCorp.name!}</td>
                <td width="12%">联系人</td>
                <td width="15%">${fireCheck.info.contracts!}</td>
                <td width="12%">联系电话</td>
                <td width="15%">${fireCheck.info.tel!}</td>
            </tr>
            <tr align="center" valign="middle">
                <td width="10%" height="40px">工程地址</td>
                <td width="36%" colspan="2">${fireCheck.info.project.address!}</td>
                <td width="12%" >类别</td>
                <#if (enumData)?exists>
                    <#list enumData as enumItem>
                        <#if enumItem.type == "ProjectProperty" && enumItem.code ==fireCheck.info.project.property>
                            <#assign pproperty = enumItem.desc>
                        </#if>
                    </#list>
                </#if>
                <td width="36%" colspan="3">
                    ${pproperty!}
                    <#if fireCheck.info.project.property == "MODIFY">
                        (
                        <#if fireCheck.info.project.modifyFit?? && fireCheck.info.project.modifyFit == true>
                            <input type="checkbox" checked="true" />&nbsp;装饰装修&nbsp;
                        </#if>
                        <#if fireCheck.info.project.modifyWarm?? && fireCheck.info.project.modifyWarm == true>
                            <input type="checkbox" checked="true"/>&nbsp;建筑保温&nbsp;
                        </#if>
                        <#if fireCheck.info.project.modifyUse?? && fireCheck.info.project.modifyUse == true>
                            <input type="checkbox" checked="true"/>&nbsp;改变用途&nbsp;
                        </#if>
                        )
                    </#if>
                </td>
            </tr>

            <tr>
                <td width="10%" height="40px" colspan="2">工程投资额（万元）</td>
                <td width="36%">${(fireCheck.info.project.putMoney?string('#.000'))!}</td>
                <td width="12%" colspan="2">总建筑面积<sub>(㎡)</sub></td>
                <td width="36%" colspan="2">${(fireCheck.info.project.area?string('#.000'))!}</td>
            </tr>




            <tr align="center" valign="middle">
                <td width="10%" height="40px">单位类别</td>
                <td width="36%" colspan="2">单位名称</td>
                <td width="6%">资质等级</td>
                <td width="18%">法定代表人(身份证号)</td>
                <td width="18%">项目负责人(身份证号)</td>
                <td width="15%">联系电话（移动电话和座机)</td>
            </tr>
            <#if (fireCheck.info.project.corps)?exists>
                <#list fireCheck.info.project.corps ? sort_by("property") as corp>
                    <tr align="center" valign="middle">

                        <#if corp.property == "Developer">
                            <td width="10%" height="40px">建设单位</td>
                            <td width="36%" colspan="2">${corp.name!}</td>
                            <#if (enumData)?exists>
                                <#list enumData as enumItem>
                                    <#if enumItem.type == "IDeveloper" && enumItem.code==(corp.level?string)>
                                        <#assign iDeveloper = enumItem.desc>
                                    </#if>
                                </#list>
                            </#if>
                            <td width="12%">${iDeveloper!}</td>
                            <td width="15%">${corp.ownerName!}
                                <#if corp.ownerId??>
                                    、${corp.ownerId!}
                                </#if>
                            </td>
                            <td width="12%">${corp.contacts!}
                                <#if corp.contactsId??>
                                    、${corp.contactsId!}
                                </#if>
                            </td>
                            <td width="15%">${corp.tel!}</td>
                        </#if>


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
                            <td width="15%">${corp.ownerName!}
                                <#if corp.ownerId??>
                                    、${corp.ownerId!}
                                </#if>
                            </td>
                            <td width="12%">${corp.contacts!}
                                <#if corp.contactsId??>
                                    、${corp.contactsId!}
                                </#if>
                            </td>
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
                            <td width="15%">${corp.ownerName!}
                                <#if corp.ownerId??>
                                    、${corp.ownerId!}
                                </#if>
                            </td>
                            <td width="12%">${corp.contacts!}
                                <#if corp.contactsId??>
                                    、${corp.contactsId!}
                                </#if>
                            </td>
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
                            <td width="15%">${corp.ownerName!}
                                <#if corp.ownerId??>
                                    、${corp.ownerId!}
                                </#if>
                            </td>
                            <td width="12%">${corp.contacts!}
                                <#if corp.contactsId??>
                                    、${corp.contactsId!}
                                </#if>
                            </td>
                            <td width="15%">${corp.tel!}</td>
                        </#if>


                        <#if corp.property == "FireCheck">
                            <td width="10%" height="40px">技术服务机构</td>
                            <td width="36%" colspan="2">${corp.name!}</td>
                            <#if (enumData)?exists>
                                <#list enumData as enumItem>
                                    <#if enumItem.type == "IDeveloper" && enumItem.code==(corp.level?string)>
                                        <#assign fireCheckDesc = enumItem.desc>
                                    </#if>
                                </#list>
                            </#if>
                            <td width="12%">${fireCheckDesc!}</td>
                            <td width="15%">${corp.ownerName!}
                                <#if corp.ownerId??>
                                    、${corp.ownerId!}
                                </#if>
                            </td>
                            <td width="12%">${corp.contacts!}
                                <#if corp.contactsId??>
                                    、${corp.contactsId!}
                                </#if>
                            </td>
                            <td width="15%">${corp.tel!}</td>
                        </#if>

                    </tr>
                </#list>
            </#if>

            <tr align="center" valign="middle">
                <td width="20%" height="40px" colspan="4">
                    <table table style="margin:auto; width:100%;font-size: 100%;padding: 0;" border="0" cellspacing="0" >
                        <tr>
                            <td width="50%" height="40px" style="border-right:0.5px">建筑工程施工许可证号、批准开工报告编号或证明文件编号（依法需办理的)</td>
                            <td width="40%">${fireCheck.info.constructFile!}</td>
                        </tr>
                    </table>
                </td>
                <td width="20%" colspan="1">制证日期</td>
                <td width="20%" colspan="2">${(fireCheck.info.constructFileDate?string("yyyy年MM月dd日"))!}</td>
            </tr>

            <tr align="center" valign="middle">
                <td width="100%" height="40px" colspan="7">
                    <table table style="margin:auto; width:100%;font-size: 90%;padding: 0;" border="0" cellspacing="0" >
                        <tr align="center" valign="middle">
                            <td width="20%" height="40px" style="border-right:0.5px" colspan="2">建筑名称</td>
                            <td width="10%" style="border-right:0.5px">结构类型</td>
                            <td width="10%" style="border-right:0.5px">使用性质</td>
                            <td width="10%" style="border-right:0.5px">耐火等级</td>
                            <td width="10%" style="border-right:0.5px">地上层数</td>
                            <td width="10%" style="border-right:0.5px">地下层数</td>
                            <td width="10%" style="border-right:0.5px">高度(m)</td>
                            <td width="10%" style="border-right:0.5px">长度(m)</td>
                            <td width="10%" style="border-right:0.5px">占地面积<sub>(㎡)</sub></td>
                            <td width="10%" style="border-right:0.5px">地上建筑面积<sub>(㎡)</sub></td>
                            <td width="10%">地下建筑面积<sub>(㎡)</sub></td>
                        </tr>
                        <#list fireCheck.info.builds as build>
                            <tr align="center" valign="middle">
                                <td width="20%" height="40px" style="border-right:0.5px;border-top:0.5px" colspan="2">${build.info.name!}</td>

                                <#if (enumData)?exists>
                                    <#list enumData as enumItem>
                                        <#if enumItem.type == "ProjectStruct" && enumItem.code==build.info.structure>
                                            <#assign bStruct = enumItem.desc>
                                        </#if>
                                    </#list>
                                </#if>
                                <td width="10%" style="border-right:0.5px;border-top: 0.5px;">${bStruct!}</td>

                                <#if build.property??>
                                    <#if (enumData)?exists>
                                        <#list enumData as enumItem>
                                            <#if enumItem.type == "UseProperty" && enumItem.code==build.property>
                                                <#assign useProperty = enumItem.desc>
                                            </#if>
                                        </#list>
                                    </#if>
                                </#if>
                                <td width="10%" style="border-right:0.5px;border-top: 0.5px;">${useProperty!}</td>

                                <#if (enumData)?exists>
                                    <#list enumData as enumItem>
                                        <#if enumItem.type == "Rating"  && enumItem.code==(build.rating?string)>
                                            <#assign bRating = enumItem.desc>
                                        </#if>
                                    </#list>
                                </#if>
                                <td width="10%" style="border-right:0.5px;border-top: 0.5px;">${bRating!}</td>
                                <td width="10%" style="border-right:0.5px;border-top: 0.5px">${build.info.onCount!}</td>
                                <td width="10%" style="border-right:0.5px;border-top: 0.5px">${build.info.underCount!}</td>
                                <td width="10%" style="border-right:0.5px;border-top: 0.5px">${(build.info.height?string('#.000'))!}</td>
                                <td width="10%" style="border-right:0.5px;border-top: 0.5px">${(build.info.length?string('#.000'))!}</td>
                                <td width="10%" style="border-right:0.5px;border-top: 0.5px">${(build.info.landArea?string('#.000'))!}</td>
                                <td width="10%" style="border-right:0.5px;border-top: 0.5px">${(build.info.onArea?string('#.000'))!}</td>
                                <td width="10%" style="border-top: 0.5px">${(build.info.underArea?string('#.000'))!}</td>
                            </tr>
                        </#list>

                        <#if fireCheck.info.fit?exists>
                            <tr align="center" valign="middle">
                                <td width="20%"  style="border-right:0.5px;border-top: 0.5px" rowspan="2" colspan="2">装饰装修</td>
                                <td style="border-right:0.5px;border-top: 0.5px" height="40px" colspan="2">装修部位</td>
                                <td style="border-top: 0.5px" colspan="8">
                                   <#if fireCheck.info.fit.pack??>
                                        <#if (packEnumDataList)?exists>
                                            <#list packEnumDataList as enumItem>
                                                <#if enumItem.select == true>
                                                    √${enumItem.desc}
                                                <#else>
                                                    □${enumItem.desc}
                                                </#if>
                                            </#list>
                                        </#if>
                                   </#if>
                                </td>
                            </tr>
                            <tr align="center" valign="middle">
                                <td style="border-right:0.5px;border-top: 0.5px" colspan="2" height="40px">装修面积<sub>(㎡)</sub></td>
                                <td style="border-top: 0.5px;border-right: 0.5px" colspan="3">${(fireCheck.info.fit.area?string('#.000'))!}</td>
                                <td style="border-right:0.5px;border-top: 0.5px" colspan="2">装修所在层数</td>
                                <td style="border-top: 0.5px" colspan="3">${fireCheck.info.fit.layers!}</td>
                            </tr>
                        <#else>
                            <tr align="center" valign="middle">
                                <td width="20%"  style="border-right:0.5px;border-top: 0.5px" rowspan="2" colspan="2">装饰装修</td>
                                <td style="border-right:0.5px;border-top: 0.5px" height="40px" colspan="2">装修部位</td>
                                <td style="border-top: 0.5px" colspan="8"></td>
                            </tr>
                            <tr align="center" valign="middle">
                                <td style="border-right:0.5px;border-top: 0.5px" colspan="2" height="40px">装修面积<sub>(㎡)</sub></td>
                                <td style="border-top: 0.5px;border-right: 0.5px" colspan="3"></td>
                                <td style="border-right:0.5px;border-top: 0.5px" colspan="2">装修所在层数</td>
                                <td style="border-top: 0.5px" colspan="3"></td>
                            </tr>
                        </#if>

                        <#if fireCheck.info.useChange?exists>
                            <tr>
                                <td width="20%"  style="border-right:0.5px;border-top: 0.5px"  colspan="2">改变用途</td>
                                <td style="border-right:0.5px;border-top: 0.5px" height="40px" colspan="2">使用性质</td>
                                <#if fireCheck.info.useChange.property??>
                                <#if (enumData)?exists>
                                    <#list enumData as enumItem>
                                        <#if enumItem.type == "UseProperty" && enumItem.code==fireCheck.info.useChange.property>
                                            <#assign cProperty = enumItem.desc>
                                        </#if>
                                    </#list>
                                </#if>
                                </#if>
                                <td style="border-top: 0.5px;border-right: 0.5px" colspan="3">${cProperty!}</td>
                                <td style="border-right:0.5px;border-top: 0.5px" height="40px" colspan="2">原有用途</td>
                                <td style="border-top: 0.5px;" colspan="3">${fireCheck.info.useChange.oldUse!}</td>
                            </tr>
                        <#else>
                            <tr>
                                <td width="20%"  style="border-right:0.5px;border-top: 0.5px"  colspan="2">改变用途</td>
                                <td style="border-right:0.5px;border-top: 0.5px" height="40px" colspan="2">使用性质</td>
                                <td style="border-top: 0.5px;border-right: 0.5px" colspan="3"></td>
                                <td style="border-right:0.5px;border-top: 0.5px" height="40px" colspan="2">原有用途</td>
                                <td style="border-top: 0.5px;" colspan="3"></td>
                            </tr>
                        </#if>
                        <#if fireCheck.info.warm?exists>
                            <tr align="center" valign="middle">
                                <td width="20%"  style="border-right:0.5px;border-top: 0.5px" rowspan="2" colspan="2">建筑保温</td>
                                <td style="border-right:0.5px;border-top: 0.5px" colspan="2" height="40px">材料类别</td>
                                <#if (enumData)?exists>
                                    <#list enumData as enumItem>
                                        <#if enumItem.type == "WarmType" && enumItem.code==fireCheck.info.warm.type>
                                            <#assign ctype = enumItem.desc>
                                        </#if>
                                    </#list>
                                </#if>
                                <td style="border-top: 0.5px;border-right: 0.5px" colspan="3">${ctype!}</td>
                                <td style="border-right:0.5px;border-top: 0.5px" colspan="2">保温所在层数</td>
                                <td style="border-top: 0.5px" colspan="3">${fireCheck.info.warm.layers!}</td>
                            </tr>
                            <tr align="center" valign="middle">
                                <td style="border-right:0.5px;border-top: 0.5px" colspan="2" height="40px">保温部位</td>
                                <td style="border-top: 0.5px;border-right: 0.5px" colspan="3">${fireCheck.info.warm.part!}</td>
                                <td style="border-right:0.5px;border-top: 0.5px" colspan="2">保温材料</td>
                                <td style="border-top: 0.5px" colspan="3">${fireCheck.info.warm.material!}</td>
                            </tr>
                        <#else>
                        <tr align="center" valign="middle">
                            <td width="20%"  style="border-right:0.5px;border-top: 0.5px" rowspan="2" colspan="2">建筑保温</td>
                            <td style="border-right:0.5px;border-top: 0.5px" colspan="2" height="40px">材料类别</td>
                            <td style="border-top: 0.5px;border-right: 0.5px" colspan="3"></td>
                            <td style="border-right:0.5px;border-top: 0.5px" colspan="2">保温所在层数</td>
                            <td style="border-top: 0.5px" colspan="3"></td>
                        </tr>
                        <tr align="center" valign="middle">
                            <td style="border-right:0.5px;border-top: 0.5px" colspan="2" height="40px">保温部位</td>
                            <td style="border-top: 0.5px;border-right: 0.5px" colspan="3"></td>
                            <td style="border-right:0.5px;border-top: 0.5px" colspan="2">保温材料</td>
                            <td style="border-top: 0.5px" colspan="3"></td>
                        </tr>
                        </#if>
                    </table>
                </td>
            </tr>





        </table>
    </div>
    <span style="page-break-after:always;"></span>
    <div class="page">
        <div style="text-align:center;clear: both" >
            <table style="margin:auto; width:100%;font-size: 90%" border="0.3" cellspacing="0">
                <tr>
                   <td height="30px"><strong>施工过程中消防设施检测情况（如有）</strong></td>
                </tr>
                <tr>
                    <td height="130px">
                        <div style="clear: both" >
                            <table table style="margin:auto; width:100%;font-size: 100%;padding: 0;" border="0" cellspacing="0" >\
                                <tr align="right" valign="middle">
                                    <td height="90px" width="100%" colspan="2"></td>
                                </tr>

                                <tr align="right" valign="middle">
                                    <td width="50%"></td>
                                    <td width="50%" height="20px">技术服务机构（印章）：</td>
                                </tr>
                                <tr align="right" valign="middle">
                                    <td width="50%" ></td>
                                    <td width="50%" height="20px">项目负责人签名：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日</td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td height="30px"><strong>建设工程竣工验收消防查验情况及意见</strong></td>
                </tr>
                <tr>
                    <td height="130px">
                        <div style="clear: both" >
                            <table table style="margin:auto; width:100%;font-size: 100%;padding: 0;" border="0" cellspacing="0" >

                                <tr style="text-align: left">
                                    <td height="20px" width="50%">一、基本情况</td>
                                    <td width="50%"></td>
                                </tr>

                                <tr>
                                    <td width="100%" colspan="2" height="60px"></td>
                                </tr>

                                <tr align="right" valign="middle">
                                    <td width="50%"></td>
                                    <td width="50%" height="20px">建设单位（印章）：</td>
                                </tr>
                                <tr align="right" valign="middle">
                                    <td width="50%" ></td>
                                    <td width="50%" height="20px">项目负责人签名：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日</td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td height="130px">
                        <div style="clear: both" >
                            <table table style="margin:auto; width:100%;font-size: 100%;padding: 0;" border="0" cellspacing="0" >

                                <tr style="text-align: left">
                                    <td height="20px" width="50%">二、符合消防工程技术标准的设计文件实施情况</td>
                                    <td width="50%"></td>
                                </tr>

                                <tr>
                                    <td width="100%" colspan="2" height="60px"></td>
                                </tr>

                                <tr align="right" valign="middle">
                                    <td width="50%"></td>
                                    <td width="50%" height="20px">设计单位（印章）：</td>
                                </tr>
                                <tr align="right" valign="middle">
                                    <td width="50%" ></td>
                                    <td width="50%" height="20px">项目负责人签名：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日</td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td height="130px">
                        <div style="clear: both" >
                            <table table style="margin:auto; width:100%;font-size: 100%;padding: 0;" border="0" cellspacing="0" >

                                <tr style="text-align: left">
                                    <td height="20px" width="50%">三、工程监理情况</td>
                                    <td width="50%"></td>
                                </tr>

                                <tr>
                                    <td width="100%" colspan="2" height="60px"></td>
                                </tr>

                                <tr align="right" valign="middle">
                                    <td width="50%"></td>
                                    <td width="50%" height="20px">监理单位（印章）：</td>
                                </tr>
                                <tr align="right" valign="middle">
                                    <td width="50%" ></td>
                                    <td width="50%" height="20px">项目总监理工程师签名：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日</td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td height="130px">
                        <div style="clear: both" >
                            <table table style="margin:auto; width:100%;font-size: 100%;padding: 0;" border="0" cellspacing="0" >

                                <tr style="text-align: left">
                                    <td height="20px" width="50%">四、工程施工情况</td>
                                    <td width="50%"></td>
                                </tr>

                                <tr>
                                    <td width="100%" colspan="2" height="60px"></td>
                                </tr>

                                <tr align="right" valign="middle">
                                    <td width="50%">消防施工专业分包单位（印章）：</td>
                                    <td width="50%" height="20px">施工总承包单位（印章）：</td>
                                </tr>
                                <tr align="right" valign="middle">
                                    <td width="50%" height="20px">项目负责人签名：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日</td>
                                    <td width="50%" height="20px">项目经理签名：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日</td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td height="130px">
                        <div style="clear: both" >
                            <table table style="margin:auto; width:100%;font-size: 100%;padding: 0;" border="0" cellspacing="0" >

                                <tr style="text-align: left">
                                    <td height="20px" width="50%">五、消防设施性能、系统功能联调联试情况</td>
                                    <td width="50%"></td>
                                </tr>

                                <tr>
                                    <td width="100%" colspan="2" height="60px"></td>
                                </tr>

                                <tr align="right" valign="middle">
                                    <td width="50%"></td>
                                    <td width="50%" height="20px">技术服务机构（印章）：</td>
                                </tr>
                                <tr align="right" valign="middle">
                                    <td width="50%" ></td>
                                    <td width="50%" height="20px">项目负责人签名：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日</td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td height="120px">
                        <div style="clear: both" >
                            <table table style="margin:auto; width:100%;font-size: 100%;padding: 0;" border="0" cellspacing="0" >

                                <tr style="text-align: left">
                                    <td height="20px" width="50%">备注：${fireCheck.memo!}</td>
                                    <td width="50%"></td>
                                </tr>

                                <tr>
                                    <td width="100%" colspan="2" height="40px"></td>
                                </tr>

                                <tr align="right" valign="middle">
                                    <td width="50%"></td>
                                    <td width="50%" height="20px"></td>
                                </tr>
                                <tr align="right" valign="middle">
                                    <td width="50%" ></td>
                                    <td width="50%" height="20px"></td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>

            </table>
        </div>
    </div>
</div>
</body>

</html>
