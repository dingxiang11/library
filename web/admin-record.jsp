<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.sjsq.po.Book" %>
<%@ page import="com.sjsq.service.impl.BookServiceImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="com.sjsq.service.BookShelfService" %>
<%@ page import="com.sjsq.service.impl.BookShelfServiceImpl" %>
<%@ page import="com.sjsq.po.BookShelf" %>
<%@ page import="com.sjsq.po.User" %>
<%@ page import="com.sjsq.service.RecordService" %>
<%@ page import="com.sjsq.service.impl.RecordServiceImpl" %>
<%@ page import="com.sjsq.po.Record" %>
<%--
  Created by IntelliJ IDEA.
  User: 86152
  Date: 2022/6/4
  Time: 20:43
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>借阅记录</title>
    <style type="text/css">
        h1 {
            text-align: center;
        }

        #before {
            text-align: center;
        }
        body{
            text-align: center;
        }

    </style>
</head>
<body>

<%-- 头部 --%>
<jsp:include page="top.jsp"/>

<%--图书信息--%>
<%

    // 获取userid
    User user =(User)session.getAttribute("user");
    Integer userid = user.getUserid();

    // 获取该用户的书单
    RecordService recordService = new RecordServiceImpl();
    List<Record> list = recordService.selectRecords();
%>
<h1>借阅记录</h1>
<hr>
<div id="before">
    <form action="user-home.jsp" method="post">
        请输入书名：<input type="text" name="bookname" placeholder="输入图书名称搜索">
        <input type="submit" value="查询"/>
    </form>
    <a href="javascript: window.history.go(-1)">返回上一级</a>
</div>
<br>
<table align="center" cellspacing="0">
    <tr bgcolor="#5f9ea0" style="font-size: 20px;height:40px;text-align: center">
        <td style="width: 120px">用户编号</td>
        <td style="width: 120px">图书编号</td>
        <td style="width: 120px">图书名称</td>
        <td style="width: 120px">书籍链接</td>
        <td style="width: 120px">借阅时间</td>
        <td style="width: 120px">操作借阅记录</td>
    </tr>
    <%
        String bg = null;
        for (int i = 0; i < list.size(); i++) {
            Record r = list.get(i);
            if (i % 2 == 0) {
                bg = "pink";
            } else {
                bg = "yellow";
            }

    %>
    <tr bgcolor="<%=bg%>" style="height:40px;text-align: center">
        <td><%=r.getUserid()%>
            </a></td>
        <td><%=r.getBookid()%>
            </a></td>
        <td><%=r.getBookname()%>
        </td>
        <td><%=r.getBooklink()%>
        </td>
        <td><%=r.getBorrowtime()%>
        </td>
        <td><a href="admin-record-delete.jsp?borrowid=<%=r.getBorrowid()%>">删除</a>
        </td>

    </tr>
    <%
        }
    %>
    <a href="admin-home.jsp" style="text-align: center">返回主页</a>
</table>
</body>
</html>

