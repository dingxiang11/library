<%@ page import="com.sjsq.service.BookService" %>
<%@ page import="com.sjsq.service.impl.BookServiceImpl" %>
<%@ page import="com.sjsq.po.Book" %><%--
  Created by IntelliJ IDEA.
  User: 86152
  Date: 2022/6/3
  Time: 0:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>删除图书</title>
    <style type="text/css">
        #before{
            text-align: center;
        }
        body{
            background-color: antiquewhite;
        }
    </style>
</head>
<body>
<%-- 头部 --%>
<jsp:include page="top.jsp"/>
<%


    request.setCharacterEncoding("UTF-8");

    Integer bookid = Integer.parseInt(request.getParameter("bookid"));

    BookService bookService = new BookServiceImpl();
    Book book = new Book();
    book = bookService.getBook(bookid);
    System.out.println("删除图书信息");
    System.out.println(book);

    boolean flag = bookService.deleteBook(bookid);

    //返回对应的页面
    if (flag){
        response.sendRedirect("admin-book-manager.jsp");
    }else {
        response.sendRedirect("error.jsp");
    }
%>
</body>
</html>
