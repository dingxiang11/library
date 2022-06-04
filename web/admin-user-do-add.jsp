<%@ page import="com.sjsq.po.User" %>
<%@ page import="com.sjsq.service.UserService" %>
<%@ page import="com.sjsq.service.impl.UserServiceImpl" %><%--
  Created by IntelliJ IDEA.
  User: 86152
  Date: 2022/6/3
  Time: 3:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>处理新增用户</title>
</head>
<body>
<%-- 头部 --%>
<jsp:include page="top.jsp"/>
<%

    request.setCharacterEncoding("UTF-8");
    User user = new User();

    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    Integer isadmin = Integer.parseInt(request.getParameter("isadmin"));

    user.setUsername(username);
    user.setPassword(password);
    user.setEmail(email);
    user.setPhone(phone);
    user.setIsadmin(isadmin);

    UserService userService = new UserServiceImpl();
    boolean flag = userService.addUser(user);

    //重定向到对应的页面
    if (flag){
        response.sendRedirect("admin-user-manager.jsp");
    }else {
        response.sendRedirect("error.jsp");
    }
%>
</body>
</html>
