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
    <div class="hTitle"><p><strong>建设工程消防验收备案抽查(复查)申请表</strong></p></div>
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
                <td width="25%" height="40px">工程地址</td>
                <td width="75%" colspan="3">${fireCheck.info.project.address!}</td>
            </tr>
            <tr align="center" valign="middle">
                <td width="25%" height="40px">建设单位联系人</td>
                <td width="25%">${fireCheck.info.contracts!}</td>
                <td width="25%" height="40px">联系电话（手机）</td>
                <td width="25%">${fireCheck.info.tel!}</td>
            </tr>

            <tr align="center" valign="middle">
                <td height="40px">备案表编号</td>
                <td>${fireCheck.id?string["0"]}</td>
                <td height="40px">备案凭证文号</td>
                <td>${fireCheck.id?string["0"]}</td>
            </tr>

            <tr align="center" valign="middle">
                <td height="40px" colspan="2">建设工程消防验收备案抽（复）查结果通知书文号</td>
                <td colspan="2">${fireCheck.id?string["0"]}</td>
            </tr>


            <tr align="center" valign="middle">
                <td height="170px" >存在问题整改情况</td>
                <td colspan="3">${fireCheck.opinion!}</td>


            </tr>

            <tr align="center" valign="middle">
                <td height="170px" >其他需要说明的情况</td>
                <td colspan="3"></td>
            </tr>

            <tr align="center" valign="middle">
                <td width="25%" height="40px" >技术服务机构</td>
                <td width="75%" colspan="3" >
                    <table table style="margin:auto; width:100%;font-size: 100%" border="0" cellspacing="0">
                        <tr>
                            <td width="25%" style="border-right: 0.3px" height="40px"  >设计单位</td>
                            <td width="25%" style="border-right: 0.3px" >工程监理单位</td>
                            <td width="25%" style="border-right: 0.3px">施工单位</td>
                            <td width="25%">建设单位</td>
                        </tr>
                    </table>
                </td>

            </tr>

            <tr align="center" valign="middle">
                <td width="25%" height="200px" >
                    <table table style="margin:auto; width:100%;font-size: 100%" border="0" cellspacing="0">
                        <tr>
                            <td width="25%" height="10px"  ></td>
                        </tr>
                        <tr style="text-align: left">
                            <td  height="40px"  >项目负责人</td>
                        </tr>
                        <tr style="text-align: left">
                            <td  height="40px"  >（签名）：</td>
                        </tr>
                        <tr>
                            <td  height="30px"  ></td>
                        </tr>
                        <tr>
                            <td   height="40px"  >（印章）</td>
                        </tr>
                        <tr>
                            <td   height="40px" >年 &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;月&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;日</td>
                        </tr>

                    </table>
                </td>
                <td width="75%" colspan="3">
                    <table table style="margin:auto; width:100%;font-size: 100%" border="0" cellspacing="0">
                        <tr>
                            <td width="25%" style="border-right: 0.3px" height="200px" >
                                <table table style="margin:auto; width:100%;font-size: 100%" border="0" cellspacing="0">
                                    <tr>
                                        <td width="25%" height="10px"  ></td>
                                    </tr>
                                    <tr style="text-align: left">
                                        <td  height="40px"  >项目负责人</td>
                                    </tr>
                                    <tr style="text-align: left">
                                        <td  height="40px"  >（签名）：</td>
                                    </tr>
                                    <tr>
                                        <td  height="30px"  ></td>
                                    </tr>
                                    <tr>
                                        <td   height="40px"  >（印章）</td>
                                    </tr>
                                    <tr>
                                        <td   height="40px" >年 &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;月&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;日</td>
                                    </tr>
                                </table>
                            </td>
                            <td width="25%" style="border-right: 0.3px" >
                                <table table style="margin:auto; width:100%;font-size: 100%" border="0" cellspacing="0">
                                    <tr>
                                        <td width="25%" height="10px"  ></td>
                                    </tr>
                                    <tr style="text-align: left">
                                        <td  height="40px"  >项目负责人</td>
                                    </tr>
                                    <tr style="text-align: left">
                                        <td  height="40px"  >（签名）：</td>
                                    </tr>
                                    <tr>
                                        <td  height="30px"  ></td>
                                    </tr>
                                    <tr>
                                        <td   height="40px"  >（印章）</td>
                                    </tr>
                                    <tr>
                                        <td   height="40px" >年 &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;月&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;日</td>
                                    </tr>
                                </table>
                            </td>
                            <td width="25%" style="border-right: 0.3px">
                                <table table style="margin:auto; width:100%;font-size: 100%" border="0" cellspacing="0">
                                    <tr>
                                        <td width="25%" height="10px"  ></td>
                                    </tr>
                                    <tr style="text-align: left">
                                        <td  height="40px"  >项目负责人</td>
                                    </tr>
                                    <tr style="text-align: left">
                                        <td  height="40px"  >（签名）：</td>
                                    </tr>
                                    <tr>
                                        <td  height="30px"  ></td>
                                    </tr>
                                    <tr>
                                        <td   height="40px"  >（印章）</td>
                                    </tr>
                                    <tr>
                                        <td   height="40px" >年 &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;月&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;日</td>
                                    </tr>
                                </table>
                            </td>
                            <td width="25%">
                                <table table style="margin:auto; width:100%;font-size: 100%" border="0" cellspacing="0">
                                    <tr>
                                        <td width="25%" height="10px"  ></td>
                                    </tr>
                                    <tr style="text-align: left">
                                        <td  height="40px"  >项目负责人</td>
                                    </tr>
                                    <tr style="text-align: left">
                                        <td  height="40px"  >（签名）：</td>
                                    </tr>
                                    <tr>
                                        <td  height="30px"  ></td>
                                    </tr>
                                    <tr>
                                        <td   height="40px"  >（印章）</td>
                                    </tr>
                                    <tr>
                                        <td   height="40px" >年 &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;月&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;日</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>


        </table>
    </div>
</div>
</body>

</html>
