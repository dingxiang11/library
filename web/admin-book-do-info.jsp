<%--
  Created by IntelliJ IDEA.
  User: 86152
  Date: 2022/6/4
  Time: 20:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.sjsq.po.Book" %>
<%@ page import="com.sjsq.service.BookService" %>
<%@ page import="com.sjsq.service.impl.BookServiceImpl" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

    <title>书籍信息</title>
</head>
<body>

<%-- 头部 --%>
<jsp:include page="top.jsp"/>

<%
    Book book = new Book();
    String sid = request.getParameter("bookid");
    Integer id = Integer.parseInt(sid);
    BookService service = new BookServiceImpl();
    book.setBookid(id);
    Book bookCur = service.getBook(book);
    // 控制台打印出类的信息（日志的前身）
    System.out.println(bookCur);
    session.setAttribute("book", bookCur);
    response.sendRedirect("admin-user-book-info.jsp");
%>
</body>
</html>

