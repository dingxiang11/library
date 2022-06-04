<%@ page import="com.sjsq.po.User" %>
<%@ page import="com.sjsq.service.BookService" %>
<%@ page import="com.sjsq.service.impl.BookServiceImpl" %>
<%@ page import="com.sjsq.po.Book" %>
<%@ page import="com.sjsq.po.BookShelf" %>
<%@ page import="com.sjsq.po.Record" %>
<%@ page import="com.sjsq.service.BookShelfService" %>
<%@ page import="com.sjsq.service.impl.BookShelfServiceImpl" %>
<%@ page import="com.sjsq.service.RecordService" %>
<%@ page import="com.sjsq.service.impl.RecordServiceImpl" %><%--
  Created by IntelliJ IDEA.
  User: 86152
  Date: 2022/6/2
  Time: 20:08
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <title>加入书架</title>
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

    // 获取书籍名称
    BookService bookService = new BookServiceImpl();
    Book book = bookService.getBook(bookid);

    // 加入书架
    BookShelf bookShelf = new BookShelf();
    bookShelf.setUserid(userid);
    bookShelf.setBookid(bookid);
    bookShelf.setBookname(book.getBookname());
    bookShelf.setBooklink(null);


    // 新增借阅记录
    Record record = new Record();
    record.setUserid(userid);
    record.setBookid(bookid);
    record.setBookname(book.getBookname());
    record.setBooklink(book.getBooklink());


    // 新增书架记录
    BookShelfService bookShelfService = new BookShelfServiceImpl();
    boolean flag = bookShelfService.addBookShelf(bookShelf);

    // 新增借阅记录
    RecordService recordService = new RecordServiceImpl();
    boolean flag1  = recordService.addRecord(record);

    if (flag && flag1) {
        response.sendRedirect("user-bookshelf.jsp");
    } else {
        response.sendRedirect("error.jsp");
    }
%>
</body>
</html>
