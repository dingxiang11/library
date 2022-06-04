<%--
  Created by IntelliJ IDEA.
  User: 86152
  Date: 2022/6/3
  Time: 1:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@page import="java.util.List"%>
<%@page import="com.sjsq.service.impl.UserServiceImpl"%>
<%@page import="com.sjsq.po.User"%>
<%@ page import="com.sjsq.service.UserService" %>


<!DOCTYPE html>
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>处理找回密码</title>
</head>
<body>
<%
    User user=new User();
    //获取searchPassword.jsp页面提交的账号和密码
    String name=request.getParameter("name");
    user.setUsername(name);

    UserService userService = new UserServiceImpl();
    List<User> list = userService.selectUser(name);
    request.setAttribute("list", list);
    for(User u:list){
        request.setAttribute("user", u);
        out.print(u);
    }
    if(user!=null){
        request.getRequestDispatcher("search-password-info.jsp").forward(request, response);
    }
%>
</body>
</html>


