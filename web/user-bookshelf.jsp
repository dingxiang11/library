<%@ page import="com.sjsq.service.BookShelfService" %>
<%@ page import="com.sjsq.service.impl.BookShelfServiceImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="com.sjsq.po.BookShelf" %>
<%@ page import="com.sjsq.po.User" %><%--
  Created by IntelliJ IDEA.
  User: 86152
  Date: 2022/6/2
  Time: 13:31
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
        #before {
            text-align: center;
        }body{
             text-align: center;
         }
    </style>
</head>
<body>
<!--头部-->
<jsp:include page="user-top.jsp"/>

<!--图书信息-->
<%
    //获取userid
    User user = (User) session.getAttribute("user");
    Integer userid = user.getUserid();

    //获取该用户的书单
    BookShelfService bookShelfService = new BookShelfServiceImpl();
    List<BookShelf> list = bookShelfService.selectBookShelf(userid);
%>
<h1>借阅记录</h1>
<hr>
<div id="before">
    <form action="user-home.jsp" method="post">
        请输入书名：<input type="text" name="bookname" placeholder="输入图书名称搜索">
        <input type="submit" value="查询"/>
    </form>
    <a href="javascript:window.history.go(-1)">返回上一级</a>
</div>
<br>
<table align="center" cellpadding="0">
    <tr bgcolor="#5f9ea0" style="font-size: 20px;height: 40px;text-align: center">
        <td style="width: 120px;">图书编号</td>
        <td style="width: 120px;">图书名称</td>
        <td style="width: 120px;">加入时间</td>
        <td style="width: 120px;">操作书架</td>
    </tr>
    <%
        String bg = null;
        for (int i = 0; i < list.size(); i++) {
            BookShelf b = list.get(i);
            if (i % 2 == 0){
                bg = "pink";
            }else {
                bg = "yellow";
            }

    %>
    <tr bgcolor="<%=bg%>" style="height: 40px;text-align: center">
        <td><%=b.getBookid()%></td>
        <td><%=b.getBookname()%></td>
        <td><%=b.getAdddate()%></td>
        <td><a href="user-bookshelf-remove.jsp?bookid=<%=b.getBookid()%>">移除书架</a> </td>
    </tr>
    <%
        }
    %>
    <a href="user-home.jsp">返回主页</a>
</table>
</body>
</html>

