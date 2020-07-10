<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="Content-Style-Type" content="text/css"/>
    <title></title>
    <style type="text/css">
        body {
            font-family: pingfang sc light;
            width: 100%;
        }
        .center{
            text-align: center;
            width: 100%;
        }
        td{
            border:solid 0.3px;
        }.hTitle {
             text-align: center;
             width: 100%;
             font-size: 180%;
         }.right{
              text-align: right;
              width: 90%;
          }
        .underline{
            text-decoration:underline;
        }
    </style>
</head>


<body>
<div class="page">
    <div class="hTitle"><p><strong>${org}</strong></p></div>
    <div class="hTitle"><p><strong>建设工程消防验收申请受理通知书</strong></p></div>
    <div class="right"><p> 编号:〔${word}〕第${fireCheck.id?string["0"]}号</p></div>

    <table table cellspacing="0" cellpadding="0" style="width: 100%;font-size:80% ;border:solid 0.3px #000000;border-collapse: collapse;">
        <tr>
            <td width="10%" height="25px" align="center" valign="middle">工程名称</td>
            <td width="26%" height="25px" align="center" valign="middle" colspan="2">${fireCheck.info.project.name!}</td>
            <td width="10%" height="25px" align="center" valign="middle">工程地址</td>
            <td width="30%" height="25px" align="center" valign="middle" colspan="3">${fireCheck.info.project.address!}</td>
            <td width="10%" height="25px" align="center" valign="middle">现场检查日期</td>
            <td width="14%" height="25px" align="center" valign="middle"></td>
        </tr>
        <tr>
            <td width="10%" height="25px" align="center" valign="middle">建设单位</td>
            <td width="26%" height="25px" align="center" valign="middle" colspan="2">${joinCorp.name!}</td>
            <td width="10%" height="25px" align="center" valign="middle">受理凭证文号</td>
            <td width="10%" height="25px" align="center" valign="middle">${fireCheck.info.applyFile}</td>
            <td width="10%" height="25px" align="center" valign="middle">联系人</td>
            <td width="10%" height="25px" align="center" valign="middle">${fireCheck.info.contracts!}</td>
            <td width="10%" height="25px" align="center" valign="middle">联系电话</td>
            <td width="14%" height="25px" align="center" valign="middle">${fireCheck.info.tel!}</td>
        </tr>
        <tr>
            <td height="25px" align="center" valign="middle">工程类别</td>
            <#if (enumData)?exists>
                <#list enumData as enumItem>
                    <#if enumItem.type == "ProjectProperty" && enumItem.code ==fireCheck.info.project.property>
                        <#assign pproperty = enumItem.desc>
                    </#if>
                </#list>
            </#if>
            <td height="25px" align="center" valign="middle" colspan="4">
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
            <td height="25px" align="center" valign="middle">使用性质</td>
            <#if (enumData)?exists>
                <#list enumData as enumItem>
                    <#if enumItem.type == "ProjectType" && enumItem.code ==fireCheck.info.project.type>
                        <#assign pType = enumItem.desc>
                    </#if>
                </#list>
            </#if>
            <td height="25px" align="center" valign="middle">${pType}</td>
            <td height="25px" align="center" valign="middle">火灾危险性</td>
            <td height="25px" align="center" valign="middle"></td>
        </tr>
        <tr>
            <td height="25px" align="center" valign="middle">建筑面积(m2)</td>
            <td height="25px" align="center" valign="middle"></td>
            <td height="25px" align="center" valign="middle">占地面积(m2)</td>
            <td height="25px" align="center" valign="middle">${fireCheck.info.project.landArea!?string('#.000')}</td>
            <td height="25px" align="center" valign="middle">建筑高度(m2)</td>
            <td height="25px" align="center" valign="middle" colspan="2"></td>
            <td height="25px" align="center" valign="middle">层数</td>
            <td height="25px" align="center" valign="middle">

            </td>
        </tr>
        <tr>
            <td height="25px" align="center" valign="middle">单项名称</td>
            <td height="25px" align="center" valign="middle">评定结论</td>
            <td height="25px" align="center" valign="middle">单项名称</td>
            <td height="25px" align="center" valign="middle">评定结论</td>
            <td rowspan="4" colspan="5" style="border-bottom: 0px;border-top: 0px">
                <table table cellspacing="0" cellpadding="0" style="width: 100%;font-size:120% ;border:solid 0.3px #000000;border-collapse: collapse;">
                    <tr>
                        <td width="50%" height="25px" align="left" valign="middle" style="border: 0px">建设工程消防验收情况和综合评定意见：</td>
                        <td width="50%" height="25px" align="left" valign="middle" style="border: 0px"></td>
                    </tr>
                    <tr>
                        <td width="50%" height="25px" align="left" valign="middle" style="border: 0px">&nbsp;&nbsp;□合格&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□不合格：</td>
                        <td width="50%" height="25px" align="center" valign="middle" style="border: 0px"></td>
                    </tr>
                    <tr>
                        <td width="50%" height="25px" align="center" valign="middle" style="border: 0px"></td>
                        <td width="50%" height="25px" align="center" valign="middle" style="border: 0px"></td>
                    </tr>
                    <tr>
                        <td width="50%" height="25px" align="center" valign="middle" style="border: 0px"></td>
                        <td width="50%" height="25px" align="center" valign="middle" style="border: 0px"></td>
                    </tr>
                    <tr>
                        <td width="50%" height="25px" align="left" valign="middle" style="border: 0px">&nbsp;主责承办人（签名）： </td>
                        <td width="50%" height="25px" align="center" valign="middle" style="border: 0px">&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日</td>
                    </tr>


                </table>
            </td>

        </tr>
        <tr>
            <td height="25px" align="left" valign="middle">□建筑类别与耐火等级</td>
            <td height="25px" align="left" valign="middle"></td>
            <td height="25px" align="left" valign="middle">□消火栓系统</td>
            <td height="25px" align="left" valign="middle"></td>
        </tr>
        <tr>
            <td height="25px" align="left" valign="middle">□总平面布局</td>
            <td height="25px" align="left" valign="middle"></td>
            <td height="25px" align="left" valign="middle">□自动喷水灭火系统</td>
            <td height="25px" align="left" valign="middle"></td>
        </tr>
        <tr>
            <td height="25px" align="left" valign="middle">□平面布置</td>
            <td height="25px" align="left" valign="middle"></td>
            <td height="25px" align="left" valign="middle">□火灾自动报警系统</td>
            <td height="25px" align="left" valign="middle"></td>
        </tr>
        <tr>
            <td height="25px" align="left" valign="middle">□建筑保温及外墙装饰防火</td>
            <td height="25px" align="left" valign="middle"></td>
            <td height="25px" align="left" valign="middle">□防烟排烟系统及通风、空调系统防火</td>
            <td height="25px" align="left" valign="middle"></td>
            <td rowspan="4" colspan="5" style="border-bottom: 0px;border-top: 0px">
                <table table cellspacing="0" cellpadding="0" style="width: 100%;font-size:120% ;border:solid 0.3px #000000;border-collapse: collapse;">
                    <tr>
                        <td width="50%" height="25px" align="left" valign="middle" style="border: 0px">建设工程消防验收技术复核意见：</td>
                        <td width="50%" height="25px" align="left" valign="middle" style="border: 0px"></td>
                    </tr>
                    <tr>
                        <td width="50%" height="25px" align="left" valign="middle" style="border: 0px">&nbsp;</td>
                        <td width="50%" height="25px" align="center" valign="middle" style="border: 0px"></td>
                    </tr>
                    <tr>
                        <td width="50%" height="25px" align="center" valign="middle" style="border: 0px"></td>
                        <td width="50%" height="25px" align="center" valign="middle" style="border: 0px"></td>
                    </tr>
                    <tr>
                        <td width="50%" height="25px" align="center" valign="middle" style="border: 0px"></td>
                        <td width="50%" height="25px" align="center" valign="middle" style="border: 0px"></td>
                    </tr>
                    <tr>
                        <td width="50%" height="25px" align="left" valign="middle" style="border: 0px">&nbsp;技术复核人（签名）： </td>
                        <td width="50%" height="25px" align="center" valign="middle" style="border: 0px">&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日</td>
                    </tr>


                </table>

            </td>
        </tr>
        <tr>
            <td height="25px" align="left" valign="middle">□建筑内部装修防火</td>
            <td height="25px" align="left" valign="middle"></td>
            <td height="25px" align="left" valign="middle">□消防电气</td>
            <td height="25px" align="left" valign="middle"></td>
        </tr>
        <tr>
            <td height="25px" align="left" valign="middle">□防火分隔</td>
            <td height="25px" align="left" valign="middle"></td>
            <td height="25px" align="left" valign="middle">□建筑灭火器</td>
            <td height="25px" align="left" valign="middle"></td>
        </tr>
        <tr>
            <td height="25px" align="left" valign="middle">□防烟分隔</td>
            <td height="25px" align="left" valign="middle"></td>
            <td height="25px" align="left" valign="middle">□其他灭火设施</td>
            <td height="25px" align="left" valign="middle"></td>
        </tr>

        <tr>
            <td height="25px" align="left" valign="middle">□防爆</td>
            <td height="25px" align="left" valign="middle"></td>
            <td height="25px" align="left" valign="middle">□资料审查</td>
            <td height="25px" align="left" valign="middle"></td>

            <td height="25px" align="center" valign="middle">单位类别</td>
            <td height="25px" align="center" valign="middle" colspan="2">单位名称</td>
            <td height="25px" align="center" valign="middle" colspan="2">项目负责人签名</td>
        </tr>
        <tr>
            <td height="25px" align="left" valign="middle">□安全疏散</td>
            <td height="25px" align="left" valign="middle"></td>
            <td height="25px" align="left" valign="middle">□消防电梯</td>
            <td height="25px" align="left" valign="middle"></td>

            <td height="25px" align="center" valign="middle">建设单位</td>
            <#assign DeveloperName = "">
            <#if (joinCorps)?exists>
                <#list joinCorps as crop>
                    <#if crop.property == "Developer">
                        <#if DeveloperName =="">
                            <#assign DeveloperName = crop.name>
                        <#else>
                            <#assign DeveloperName = DeveloperName+"  、"+ crop.name>
                        </#if>
                    </#if>
                </#list>
            </#if>
            <td height="25px" align="center" valign="middle" colspan="2">${DeveloperName}</td>
            <td height="25px" align="center" valign="middle" colspan="2"></td>
        </tr>
        <tr>
            <td height="25px" align="left" valign="middle">□其他</td>
            <td height="25px" align="left" valign="middle" colspan="3"> </td>

            <td height="25px" align="center" valign="middle">设计单位</td>
            <#assign DesignName = "">
            <#if (joinCorps)?exists>
                <#list joinCorps as crop>
                    <#if crop.property == "Design">
                        <#if DesignName =="">
                            <#assign DesignName = crop.name>
                        <#else>
                            <#assign DesignName = DesignName+"  、"+ crop.name>
                        </#if>
                    </#if>
                </#list>
            </#if>
            <td height="25px" align="center" valign="middle" colspan="2">${DesignName}</td>
            <td height="25px" align="center" valign="middle" colspan="2"></td>
        </tr>
        <tr>
            <td height="25px" align="left" valign="top" colspan="4" rowspan="2">
                现场消防检查人员（签名）：
            </td>
            <td height="25px" align="center" valign="middle">施工单位</td>
            <#assign ConstructName = "">
            <#if (joinCorps)?exists>
                <#list joinCorps as crop>
                    <#if crop.property == "Construct">
                        <#if ConstructName =="">
                            <#assign ConstructName = crop.name>
                        <#else>
                            <#assign ConstructName = ConstructName+"  、"+ crop.name>
                        </#if>
                    </#if>
                </#list>
            </#if>
            <td height="25px" align="center" valign="middle" colspan="2">${ConstructName}</td>
            <td height="25px" align="center" valign="middle" colspan="2"></td>
        </tr>

        <tr>
            <td height="25px" align="center" valign="middle">监理单位</td>
            <#assign SupervisortName = "">
            <#if (joinCorps)?exists>
                <#list joinCorps as crop>
                    <#if crop.property == "Supervisor">
                        <#if SupervisortName =="">
                            <#assign SupervisortName = crop.name>
                        <#else>
                            <#assign SupervisortName = SupervisortName+"  、"+ crop.name>
                        </#if>
                    </#if>
                </#list>
            </#if>
            <td height="25px" align="center" valign="middle" colspan="2">${SupervisortName}</td>
            <td height="25px" align="center" valign="middle" colspan="2"></td>
        </tr>




    </table>


</div>
<span style="page-break-after:always;"></span>
<div class="page">
    <div class="hTitle"><p><strong>建设工程消防验收楼幢信息记录表</strong></p></div>
    <table cellspacing="0" cellpadding="0" style="width: 100%;font-size:100% ;border:solid 0.3px #000000;border-collapse: collapse;">
        <tr>
            <td width="30%" height="30px" align="center" valign="middle" >楼幢名称</td>
            <td width="10%" height="30px" align="center" valign="middle" style="font-size: 90%">地上建筑面积(m2)</td>
            <td width="10%" height="30px" align="center" valign="middle" style="font-size: 90%">地下建筑面积(m2)</td>
            <td width="7%"  height="30px" align="center" valign="middle">地上层数</td>
            <td width="7%"  height="30px" align="center" valign="middle">地下层数</td>
            <td width="7%"  height="30px" align="center" valign="middle">建筑高度</td>
            <td width="7%"  height="30px" align="center" valign="middle">占地面积</td>
            <td width="7%"  height="30px" align="center" valign="middle">结构形式</td>
            <td width="7%"  height="30px" align="center" valign="middle" style="font-size: 90%">火灾危险性</td>
        </tr>

        <#if fireCheck.info.builds?exists && (fireCheck.info.builds?size>0)>
            <#list fireCheck.info.builds as build>
                <tr>
                    <td align="center" valign="middle" height="30px">${build.info.name!}</td>
                    <td align="center" valign="middle" height="30px">${(build.info.onArea?string('#.000'))!}</td>
                    <td align="center" valign="middle" height="30px">${(build.info.underArea?string('#.000'))!}</td>
                    <td align="center" valign="middle" height="30px">${build.info.upCount!}</td>
                    <td align="center" valign="middle" height="30px">${build.info.underCount!}</td>
                    <td align="center" valign="middle" height="30px">${build.info.height!}</td>
                    <td align="center" valign="middle" height="30px">${(build.info.landArea?string('#.000'))!}</td>
                    <#if (enumData)?exists>
                        <#list enumData as enumItem>
                            <#if enumItem.type == "ProjectStruct" && enumItem.code==build.info.structure>
                                <#assign bStruct = enumItem.desc>
                            </#if>
                        </#list>
                    </#if>
                    <td align="center" valign="middle">${bStruct}</td>
                    <#if (enumData)?exists>
                        <#list enumData as enumItem>
                            <#if enumItem.type == "Danger" && enumItem.code==build.danger?string>
                                <#assign bDanger = enumItem.desc>
                            </#if>
                        </#list>
                    </#if>
                    <td width="7%"  height="30px" align="center" valign="middle">${bDanger}</td>
                </tr>
            </#list>
        </#if>

        <#if fireCheck.info.builds?exists && (fireCheck.info.builds?size<10)>

            <#list 1..5 as i >
                <tr>
                    <td align="center" valign="middle" height="30px"></td>
                    <td align="center" valign="middle" height="30px"></td>
                    <td align="center" valign="middle" height="30px"></td>>
                    <td align="center" valign="middle" height="30px"></td>
                    <td align="center" valign="middle" height="30px"></td>
                    <td align="center" valign="middle" height="30px"></td>
                    <td align="center" valign="middle" height="30px"></td>
                    <td align="center" valign="middle" height="30px"></td>
                    <td align="center" valign="middle" height="30px"></td>
                </tr>
            </#list>
        </#if>

    </table>

</div>
<span style="page-break-after:always;"></span>
<#if (fireCheck.info.items)?exists>
    <#assign i=2>
    <#list fireCheck.info.items as checkTable>

        <div class="page">

            <div class="center"><p>表A.${i}&nbsp;&nbsp;${checkTable.name}</p></div>
            <table cellspacing="0" cellpadding="0" style="width: 100%;font-size:80% ;border:solid 1px #000000;border-collapse: collapse;">
                <tr>
                    <td width="5%" height="15px" align="center" valign="middle">单项名称</td>
                    <td width="5%" height="15px" align="center" valign="middle">子项名称</td>
                    <td width="20%" height="15px" align="center" valign="middle">内容和方法</td>
                    <td width="15%" height="15px" align="center" valign="middle">要&nbsp;&nbsp;求</td>
                    <td width="5%" height="15px" align="center" valign="middle">检查部位</td>
                    <td width="5%" height="15px" align="center" valign="middle">检查数量</td>
                    <td width="20%" height="15px" align="center" valign="middle">验收检查情况</td>
                    <td width="15%" height="15px" >
                        <table cellspacing="0" cellpadding="0" style="width:100%;height:100%;font-size:100%;border-collapse: collapse;border-width:0px; border-style:hidden;">
                            <tr>
                                <td width="100%" height="15px" align="center" valign="middle" witdth="100%" colspan="2">单项名称</td>
                            </tr>
                            <tr>
                                <td width="50%" height="15px" align="center" valign="middle" witdth="50%">重要程度</td>
                                <td width="50%" height="15px" align="center" valign="middle" witdth="50%">是否合格</td>
                            </tr>
                        </table>
                    </td>
                    <td width="5%" height="15px" align="center" valign="middle">单项评定</td>
                </tr>

                <#if (checkTable.items)?exists>
                    <#list checkTable.items as checkItem>
                        <#if (checkItem.items?size>0)>
                            <tr>
                                <td width="5%">${checkItem.name}</td>

                                <td colspan="7" width="90%">
                                    <table cellspacing="0" cellpadding="0"  style="width:100%;font-size:100%;height:100%;border-collapse: collapse;border-width:0px; border-style:hidden;">
                                        <#list checkItem.items as CheckSubItem>
                                            <tr align="left" valign="middle">
                                                <td height="50px" width="5%">${CheckSubItem.name}</td>
                                                <td height="50px" width="20%">
                                                    <table cellspacing="0" cellpadding="0"  style="width:100%;font-size:100%;height:100%;border-collapse: collapse;border-width:0px; border-style:hidden;">
                                                        <#if (CheckSubItem.contents?size>0)>
                                                            <#list CheckSubItem.contents as content>
                                                                <tr>
                                                                    <td height="50px" style="border: 0px;border-top: 0.3px" >${content.name}</td>
                                                                </tr>
                                                            </#list>
                                                        <#else>
                                                            <tr>
                                                                <td height="50px" style="border: 0px" align="center" valign="middle">无</td>
                                                            </tr>
                                                        </#if>
                                                    </table>
                                                </td>


                                                <td height="50px" width="15%">
                                                    <table cellspacing="0" cellpadding="0"  style="width:100%;font-size:100%;height:100%;border-collapse: collapse;border-width:0px; border-style:hidden;">
                                                        <#if (CheckSubItem.contents?size>0)>
                                                            <#list CheckSubItem.contents as content>
                                                                <tr>
                                                                    <td height="50px" style="border: 0px;border-top: 0.3px" >${content.require}</td>
                                                                </tr>
                                                            </#list>
                                                        <#else>
                                                            <tr>
                                                                <td height="50px" style="border: 0px" align="center" valign="middle">无</td>
                                                            </tr>
                                                        </#if>
                                                    </table>
                                                </td>

                                                <td height="50px" width="5%">
                                                    <table cellspacing="0" cellpadding="0"  style="width:100%;font-size:100%;height:100%;border-collapse: collapse;border-width:0px; border-style:hidden;">
                                                        <#if (CheckSubItem.contents?size>0)>
                                                            <#list CheckSubItem.contents as content>
                                                                <tr>
                                                                    <td height="50px" style="border: 0px;border-top: 0.3px" >${content.parts}</td>
                                                                </tr>
                                                            </#list>
                                                        <#else>
                                                            <tr>
                                                                <td height="50px" style="border: 0px" align="center" valign="middle">无</td>
                                                            </tr>
                                                        </#if>
                                                    </table>
                                                </td>

                                                <td height="50px" width="5%" align="center" valign="middle">
                                                    ${CheckSubItem.count}
                                                </td>

                                                <td height="50px" width="20%">
                                                    <table cellspacing="0" cellpadding="0"  style="width:100%;font-size:100%;height:100%;border-collapse: collapse;border-width:0px; border-style:hidden;">
                                                        <#if (CheckSubItem.contents?size>0)>
                                                            <#list CheckSubItem.contents as content>
                                                                <tr>
                                                                    <td height="50px" style="border: 0px;border-top: 0.3px" >${content.description}</td>
                                                                </tr>
                                                            </#list>
                                                        <#else>
                                                            <tr>
                                                                <td height="50px" style="border: 0px" align="center" valign="middle">无</td>
                                                            </tr>
                                                        </#if>
                                                    </table>
                                                </td>

                                                <td height="50px" width="15%">
                                                    <table cellspacing="0" cellpadding="0"  style="width:100%;font-size:100%;height:100%;border-collapse: collapse;border-width:0px; border-style:hidden;">
                                                        <#if (CheckSubItem.contents?size>0)>
                                                            <#list CheckSubItem.contents as content>
                                                                <tr>
                                                                    <td>
                                                                        <table cellspacing="0" cellpadding="0" style="width:100%;font-size:100%;height:100%;border-collapse: collapse;border-width:0px; border-style:hidden;">
                                                                            <tr>
                                                                                <td height="50px" width="50%" style="border: 0px; border-right: 0.3px" align="center" valign="middle">${content.level}</td>
                                                                                <td height="50px" width="50%" style="border: 0px" align="center" valign="middle">${content.qualified?string('合格','不合格')}</td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>

                                                                </tr>
                                                            </#list>
                                                        <#else>
                                                            <tr>
                                                                <td height="50px" style="border: 0px" align="center" valign="middle">无</td>
                                                            </tr>
                                                        </#if>
                                                    </table>
                                                </td>



                                            </tr>
                                        </#list>
                                    </table>
                                </td>

                                <td height="50px" width="5%" align="center" valign="middle">
                                    ${checkItem.qualified?string('合格','不合格')}
                                </td>
                            </tr>
                        <#else>
                            <tr>
                                <td width="5%">${checkItem.name}${checkItem.items?size}qq</td>
                                <td width="5%">无子项名称</td>
                            </tr>
                        </#if>
                    </#list>
                </#if>

            </table>
            <table table cellspacing="0" cellpadding="0" border="0" style="width: 100%;font-size:100% ;border:solid 1px #000000;border-collapse: collapse;">
                <tr>
                    <td  style="border: 0px" height="15px"></td>
                </tr>
                <tr>
                    <td width="33%" align="center" valign="middle" style="border: 0px" height="20px">消防验收人员:________</td>
                    <td width="33%" align="center" valign="middle" style="border: 0px">建设单位负责人：________</td>
                    <td width="33%" align="center" valign="middle" style="border: 0px">________年________月________日</td>
                </tr>

            </table>



        </div>
        <#if checkTable_index != (fireCheck.info.items?size-1)>
            <span style="page-break-after:always;"></span>
        </#if>
        <#assign i=i+1>
    </#list>
</#if>
</body>
</html>
