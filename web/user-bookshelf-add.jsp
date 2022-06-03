<%@ page import="com.sjsq.po.User" %>
<%@ page import="com.sjsq.service.BookService" %>
<%@ page import="com.sjsq.service.impl.BookServiceImpl" %>
<%@ page import="com.sjsq.po.Book" %><%--
  Created by IntelliJ IDEA.
  User: 86152
  Date: 2022/6/2
  Time: 20:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="user-top.jsp"/>

<%
    //设置获取注册时的编码为UTF-8
    response.sendRedirect("UTF-8");
    //获取userid
    User user = (User) session.getAttribute("user");
    Integer userid = user.getUserid();
    //获取bookid
    Integer bookid = Integer.parseInt(request.getParameter("bookid"));

    //获取书籍名称
    BookService bookService = new BookServiceImpl();
    Book book = bookService.getBook(bookid);
    //加入书架
    boolean flag = bookService.addBook(book);
    if (flag){
        response.sendRedirect("user-bookshelf.jsp");
    }else {
        response.sendRedirect("error.jsp");
    }
%>
</body>
</html>
