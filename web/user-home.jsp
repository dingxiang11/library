<%@ page import="com.sjsq.service.BookService" %>
<%@ page import="com.sjsq.service.impl.BookServiceImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="com.sjsq.po.Book" %><%--
  Created by IntelliJ IDEA.
  User: 86152
  Date: 2022/6/1
  Time: 21:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查看图书</title>
    <!--从外部引入css-->
    <link rel="stylesheet" type="text/css" href="css/user-home.css">
    <%--
    <style type="text/css">
        body{
            text-align: center;
        }
    </style>
    --%>
</head>
<body>

<%-- 头部--%>
<jsp:include page="user-top.jsp"/>

<%
    request.setCharacterEncoding("UTF-8");
    String bookname = request.getParameter("bookname");
    System.out.println("书名" + bookname);

    //处理空字符串
    if (bookname != null && bookname.equals("")){
        bookname = null;
    }

    BookService service = new BookServiceImpl();
    List<Book> list = service.select(bookname);
%>
<h1>图书列表</h1>
<hr>
<div id="before">
    <form action="user-home.jsp" method="post">
        请输入书名: <input type="text" name="bookname" placeholder="输入图书名称">
        <input type="submit" value="查询">
    </form>
    <a href="javascript:window.history.go(-1)">返回上一个页面</a>
</div>
<br>
<table align="center" cellpadding="0">
    <tr bgcolor="green" style="font-size: 20px;height: 40px;text-align: center">
        <th style="width: 120px">编号</th>
        <th style="width: 120px">书名</th>
        <th style="width: 120px">价格</th>
        <th style="width: 120px">作者</th>
        <th style="width: 120px">出版社</th>
    </tr>
    <%
        String bg = null;
        for (int i = 0; i < list.size(); i++){
            Book b = list.get(i);
            if (i % 2 == 0) {
                bg = "pink";
            } else {
                bg = "yellow";
            }
    %>
    <tr bgcolor="<%=bg%>" style="height: 40px;text-align: center">
        <td><%=b.getBookid()%></td>
        <td><a href="user-book-info.jsp?bookid=<%=b.getBookid()%>"><%=b.getBookname()%></a></td>
        <td><%=b.getPrice()%></td>
        <td><%=b.getAuthor()%></td>
        <td><%=b.getPublish()%></td>
    </tr>
    <%
        }
    %>
</table>
</body>
</html>