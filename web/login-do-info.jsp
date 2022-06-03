<%@ page import="com.sjsq.po.User" %>
<%@ page import="com.sjsq.service.UserService" %>
<%@ page import="com.sjsq.service.impl.UserServiceImpl" %><%--
  Created by IntelliJ IDEA.
  User: 86152
  Date: 2022/6/1
  Time: 21:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户登录</title>
</head>
<body>
<%
    //设置接收的编码格式
    request.setCharacterEncoding("UTF-8");

    //获取前端传过来的值
    String username = request.getParameter("username");
    String  password = request.getParameter("password");

    User user = new User();
    user.setUsername(username);
    user.setPassword(password);

    //定义service对象
    UserService service = new UserServiceImpl();
    //获取用户信息
    User currentUser = service.login(user);

    //设置会话
    session.setAttribute("user",currentUser);

    //对currentUser进行非空判断，1是管理员，0是学生
    if (currentUser != null && currentUser.getIsadmin().equals(1)){
        response.sendRedirect("admin-home.jsp");
    }else if (currentUser != null && !currentUser.getIsadmin().equals(1)){
        response.sendRedirect("user-home.jsp");
    }else {
        response.sendRedirect("login-fail.jsp");
    }
%>
</body>
</html>
