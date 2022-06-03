<%--
  Created by IntelliJ IDEA.
  User: 86152
  Date: 2022/6/3
  Time: 0:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.sjsq.po.User" %>
<%@ page import="com.sjsq.service.UserService" %>
<%@ page import="com.sjsq.service.impl.UserServiceImpl" %>
<html>
<head>
    <title>删除用户</title>
    <style type="text/css">
        #before {
            text-align: center;
        }

        body {
            background-color: antiquewhite;
        }


    </style>
</head>
<body>


<%
    // 设置获取注册时的编码为UTF-8
    request.setCharacterEncoding("UTF-8");

    //获取admin-user-manager.jsp页面的userid
    Integer userid = Integer.parseInt(request.getParameter("userid"));


    //引入数据交互层
    UserService userService = new UserServiceImpl();
    // 获取删除用户的信息
    User user = userService.getUser(userid);
    System.out.println("删除的用户信息："+user);
    boolean flag = userService.deleteUser(userid);

    if (flag) {
        response.sendRedirect("admin-user-manager.jsp");
    } else {
        response.sendRedirect("error.jsp");
    }
%>
</body>
</html>


