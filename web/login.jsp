<%--
  Created by IntelliJ IDEA.
  User: 86152
  Date: 2022/5/30
  Time: 21:26
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //获取绝对路径
    String path = request.getContextPath();
    String bassPath = request.getScheme()+"://"+request.getServerName()
            +":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <base href="<%=bassPath%>">
    <title>用户登录</title>
    <!--从外部引入css-->
    <link rel="stylesheet" type="text/css" href="css/login.css">
    <%-->
    <style type="text/css">
        h1{
            text-align: center;
        }
    </style>
    <--%>
</head>
<body>
<form action="login-do-info.jsp" method="post">
    <h1>用户登录</h1>
    <!--下划线-->
    <hr/>
    <table align="center">
        <tr>
            <td> 账号:</td>
            <td>
                <input type="text" name="username" id="username" placeholder="请输入您的账号">
            </td>
        </tr>
        <tr>
            <td>密码:</td>
            <td>
                <input type="password" name="password" id="password" placeholder="请输入您的密码">
            </td>
            <td><a href="search-password.jsp">找回密码</a> </td>
        </tr>
        <tr>
            <!--占位-->
            <td></td>
            <td> <input type="submit" value="登录">
                <input type="reset" value="重置">
                <a href="register.jsp" target="_blank">注册</a>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
