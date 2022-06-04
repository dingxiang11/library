<%@ page import="com.sjsq.po.Book" %>
<%@ page import="com.sjsq.service.BookService" %>
<%@ page import="com.sjsq.service.impl.BookServiceImpl" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: 86152
  Date: 2022/6/2
  Time: 20:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
    <title>查看图书</title>
    <style type="text/css">
        h1{
            text-align: center;
        }
       body{
           background-color: antiquewhite;
       }
       #before{
           text-align: center;
       }
    </style>
</head>
<body>
<!--头部-->
<jsp:include page="top.jsp"/>

<!--图书信息-->
<%
    //设置获取注册时的编码为UTF-8
    request.setCharacterEncoding("UTF-8");
    Book book = new Book();

    //获取上一个页面传过来的值
    String  bookname = request.getParameter("bookname");
    System.out.println("书名："+ bookname);
    //传入的空字符串处理，null不能使用equals
    if (bookname != null && bookname.equals("")){
        bookname = null;
    }

    BookServiceImpl service = new BookServiceImpl();
    List<Book> list = service.select(bookname);

%>
<h1>图书列表</h1>
<hr>
<div id="before">
    <form action="admin-book-manager.jsp" method="post">
        请输入书名：<input type="text" name="bookname" placeholder="输入图书名称搜索">
        <input type="submit" value="查询"/>
    </form>
    <a href="javascript:window.history.go(-1)">返回上一级</a>
</div>
<br>
<table align="center" cellpadding="0">
    <tr bgcolor="#5f9ea0" style="font-size: 20px;height: 40px;text-align: center">
        <td style="width: 120px;">编号</td>
        <td style="width: 120px;">书名</td>
        <td style="width: 120px;">价格</td>
        <td style="width: 120px;">作者</td>
        <td style="width: 120px;">出版社</td>
        <td style="width: 120px;">类型编号</td>
        <td style="width: 120px;">书籍链接</td>
        <td style="width: 120px;">到期日期</td>
        <td style="width: 120px;">操作图书</td>
    </tr>
    <%
        String bg = null;
        for (int i = 0; i < list.size(); i++) {
            Book b = list.get(i);
            if (i % 2 == 0){
                bg = "pink";
            }else {
                bg = "yellow";
            }

    %>
    <tr bgcolor="<%=bg%>" style="height: 40px;text-align: center">
        <td><%=b.getBookid()%></td>
        <td><a href="admin-book-info.jsp?bookid=<%=b.getBookid()%>"><%=b.getBookname()%>
        </a> </td>
        <td><%=b.getPrice()%></td>
        <td><%=b.getAuthor()%></td>
        <td><%=b.getPublish()%></td>
        <td><%=b.getCategoryid()%></td>
        <td><%=b.getBooklink()%></td>
        <td><%=b.getDeadline()%></td>
        <td>
        <a href="admin-book-update.jsp?bookid=<%=b.getBookid()%>">修改</a>
        <a href="admin-book-delete.jsp?bookid=<%=b.getBookid()%>">删除</a>
        </td>
    </tr>
    <%
        }
    %>

</table>
<table align="center">
    <tr>
        <td><a href="admin-book-add.jsp">新增图书</a> </td>
    </tr>
</table>
</body>
</html>
