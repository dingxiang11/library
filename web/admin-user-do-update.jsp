<%@ page import="com.sjsq.po.User" %>
<%@ page import="com.sjsq.service.UserService" %>
<%@ page import="com.sjsq.service.impl.UserServiceImpl" %><%--
  Created by IntelliJ IDEA.
  User: 86152
  Date: 2022/6/3
  Time: 2:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>处理修改用户</title>
</head>
<body>

<%-- 头部 --%>
<jsp:include page="top.jsp"/>

<%
    request.setCharacterEncoding("UTF-8");
    //获取admin-user-update.jsp页面提交的账号和密码
    Integer userid = Integer.parseInt(request.getParameter("userid"));
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    Integer isadmin = Integer.parseInt(request.getParameter("isadmin"));

    User user = new User();

    user.setUserid(userid);
    user.setUsername(username);
    user.setPassword(password);
    user.setEmail(email);
    user.setPhone(phone);
    user.setIsadmin(isadmin);

    System.out.println("修改的用户信息");
    System.out.println(user);

    UserService userService = new UserServiceImpl();
    boolean flag = userService.updateUser(user);

    if (flag){
        response.sendRedirect("admin-user-manager.jsp");
    }else {
        response.sendRedirect("error.jsp");
    }
%>
</body>
</html>

