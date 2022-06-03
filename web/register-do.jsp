<%@ page import="com.sjsq.po.User" %>
<%@ page import="com.sjsq.service.UserService" %>
<%@ page import="com.sjsq.service.impl.UserServiceImpl" %><%--
  Created by IntelliJ IDEA.
  User: 86152
  Date: 2022/6/1
  Time: 13:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>处理注册</title>
</head>
<body>
<%
        //设置获取注册时的编码为UTF-8
        request.setCharacterEncoding("UTF-8");

        //获取register.jsp页面提交的信息
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        //把前端获取过来的值放到实体类里面
        User user = new User();
        user.setUsername(name);
        user.setPassword(password);
        user.setEmail(email);
        user.setPhone(phone);

        //调用注册方法，将数据保存在数据库里
        UserService service = new UserServiceImpl();
        boolean flag = service.register(user);

        //如果要保留请求域中的数据，使用转发，否则使用重定向
        //重定向 response.sendRedirect("");
        //转发 request.getRequestDispatcher("login.jsp").forward(request, response);
        if (flag){

                //重定向到新的jsp页面
                response.sendRedirect("login.jsp");
        }else {
                response.sendRedirect("register.jsp");
        }
%>
</body>
</html>
