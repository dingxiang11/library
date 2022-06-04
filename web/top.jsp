<%--
  Created by IntelliJ IDEA.
  User: 86152
  Date: 2022/6/4
  Time: 20:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.sjsq.po.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style type="text/css">
        #head {
            background: #eeeeee;
            height: 80px;
        }

        #logout {
            position: absolute;
            font-size: 20px;
            top:40px;
            right: 20px;
        }

        #welcome {
            position: absolute;
            font-size: 20px;
            left: 900px;
            top:40px;
        }
        #sysname{
            position: absolute;
            text-decoration:none;
            font-size: 60px;
            align:left;
            left: 200px;
        }
    </style>
</head>
<body>

<%--头部信息--%>
<%
    User user =(User)session.getAttribute("user");
    if(user == null){
        response.sendRedirect("login.jsp");
    }else {
%>
<div id="head">
    <table width="100%">
        <td><a href="admin-home.jsp" id="sysname">图书管理系统</a></td>
        <td id="welcome">欢迎您：<%=user.getUsername()%></td>
        <td id="logout">
            <a href="admin-record.jsp">借阅记录</a>
            <a href="logout.jsp">安全退出</a>
        </td>
    </table>
</div>
<%
    }
%>
</body>
</html>

