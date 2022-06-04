<%@ page import="com.sjsq.po.User" %>
<%@ page import="com.sjsq.po.BookShelf" %>
<%@ page import="com.sjsq.service.BookShelfService" %>
<%@ page import="com.sjsq.service.impl.BookShelfServiceImpl" %><%--
  Created by IntelliJ IDEA.
  User: 86152
  Date: 2022/6/2
  Time: 17:49
  To change this template use File | Settings | File Templates.
--%>

<html>
<head>
    <title>移出书架</title>
    <style type="text/css">

        body {
            background-color: antiquewhite;
        }


    </style>
</head>
<body>

<%-- 头部 --%>
<jsp:include page="top.jsp"/>

<%
    // 设置获取注册时的编码为UTF-8
    request.setCharacterEncoding("UTF-8");
    // 获取userid
    User user =(User)session.getAttribute("user");
    Integer userid = user.getUserid();
    //获取bookid
    Integer bookid = Integer.parseInt(request.getParameter("bookid"));


    //引入数据交互层
    BookShelfService bookShelfService = new BookShelfServiceImpl();

    boolean flag = bookShelfService.removeBookShelf(userid,bookid);

    if (flag) {
        response.sendRedirect("user-bookshelf.jsp");
    } else {
        response.sendRedirect("error.jsp");
    }
%>
</body>
</html>
