<%--
  Created by IntelliJ IDEA.
  User: 86152
  Date: 2022/6/3
  Time: 1:09
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
    <title>弹出信息</title>
    <script type="text/javascript">
        alert("您的密码是：${user.password}");
    </script>
    <style type="text/css">
        h1{
            text-align: center;
        }
        div{
            text-align: center;
        }
    </style>
</head>
<body>
<h1>您的密码是：${user.password}</h1>

<div>
    <td><a href="login.jsp">返回登录</a></td>
</div>
</body>
</html>


