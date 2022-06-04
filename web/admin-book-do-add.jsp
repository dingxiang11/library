<%@ page import="com.sjsq.po.Book" %>
<%@ page import="com.sjsq.service.BookService" %>
<%@ page import="com.sjsq.service.impl.BookServiceImpl" %><%--
  Created by IntelliJ IDEA.
  User: 86152
  Date: 2022/6/2
  Time: 22:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>处理新增图书</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    Book book = new Book();

    String bookname = request.getParameter("bookname");
    Double price = Double.parseDouble(request.getParameter("price"));
    String author = request.getParameter("author");
    String publish = request.getParameter("publish");
    Integer categoryid = Integer.parseInt(request.getParameter("categoryid"));
    String booklink = request.getParameter("booklink");

    book.setBookname(bookname);
    book.setPrice(price);
    book.setAuthor(author);
    book.setPublish(publish);
    book.setCategoryid(categoryid);
    book.setBooklink(booklink);

    System.out.println("添加的图书信息");
    System.out.println(book);

    BookService bookService =new BookServiceImpl();
    boolean flag = bookService.addBook(book);

    //重定向到对应的页面
    if (flag){
        response.sendRedirect("admin-book-manager.jsp");
    }else {
        response.sendRedirect("error.jsp");
    }
%>
</body>
</html>
