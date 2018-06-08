<%@ page language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE HTML>
<html dir="ltr" lang="en-US">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>在线客服系统</title>
    <style type="text/css">
    </style>
    <link href="${ctx}/css/css.css" rel="stylesheet" type="text/css">
    <script type="text/javascript">
        function reloadVerifyCode() {
            document.getElementById('verifyCodeImage').setAttribute('src', '${ctx}/getVerifyCodeImage?random=' + Math.random());
        }
    </script>
</head>
<body>
<div class="topfarme">
    <table width="960" border="0" align="center">
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
</div>
<div class="inside">
    <table width="1000" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td width="376" valign="top">
                <div class="insideword1">
                    <DIV>
                        <p>在线客服系统<br></p>
                    </DIV>
                </div>
                <!-- <div class="addnew"><a href="http://www.schoolgo.com.cn" class="addnew1"></a></div> --></td>
            <td width="524">
                <div class="insidehome">
                    <div class="logo1"><img src="" alt="" width="163" height="40"></div>
                    <form name="form1" method="post" action="${ctx}/login">
                        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="from">
                            <tr>
                                <td width="200" height="30" class="font1">用户名：</td>
                                <td colspan="3" class="font1">密码：</td>
                            </tr>
                            <tr>
                                <td height="34"><label for="textfield"></label>
                                    <input name="username" type="text" class="username-field" id="textfield"></td>
                                <td colspan="2"><label for="textfield2"></label>
                                    <input name="password" type="password" class="password-field" id="textfield2"></td>
                            </tr>
                            <tr>
                                <td height="34">
                                    验证码<input name="verifyCode" class="username-field" type="text" style="width:100px;">
                                </td>
                                <td colspan="2"><img id="verifyCodeImage" onclick="reloadVerifyCode()"
                                                     src="${ctx}/getVerifyCodeImage"/></td>

                            </tr>

                            <tr>
                                <td height="60" align="left"><span class="dx">
	                <input name="reminder" type="checkbox" value="1">
记住账号	              </span></td>
                                <td width="150" height="34" align="left"><input name="重置" type="submit" class="pushCopy"
                                                                                id="重置" value="重置"></td>
                                <td align="left"><input name="登录" type="submit" class="push" id="登录" value="登录"></td>
                            </tr>
                            <!--  <a href="${ctx}/logout" target="_blank">Logout</a>-->


                        </table>
                    </form>
                </div>
            </td>
        </tr>
    </table>


</div>
<div id="bottomNav">版权所有 ©2015</div>
</body>
</html>