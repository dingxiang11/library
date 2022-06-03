<%--
  Created by IntelliJ IDEA.
  User: 86152
  Date: 2022/6/3
  Time: 1:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    // 获取绝对路径路径 ,开发项目一定要使用绝对路径，不然肯定出错
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":"
            + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath %>" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>找回密码</title>
    <style type="text/css">
        h1{
            text-align: center;
        }
        div{
            text-align: center;
        }
        body{
            background-color:antiquewhite;
        }
    </style>
</head>
<body>
<h1>找回密码</h1>
<hr>
<div>
    <a href="javascript: window.history.go(-1)">返回上一级</a>
</div>
<br>
<form action="search-password-do.jsp" method="post">
    <table align="center">
        <tr>
            <td>请输入账号：</td>
            <td><input type="text" name="name"/></td>
        </tr>
        <tr>
            <td colspan="1"></td>
            <td>
                <input type="submit" value="提交">
                <input type="reset" value="重置">
            </td>
        </tr>
    </table>
</form>
</body>
</html>


