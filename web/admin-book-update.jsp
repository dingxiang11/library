<%@ page import="com.sjsq.Dao.BookDao" %>
<%@ page import="com.sjsq.Dao.impl.BookDaoImpl" %>
<%@ page import="com.sjsq.po.Book" %>
<%@ page import="com.sjsq.utils.BaseDao" %>
<%@ page import="com.sjsq.Dao.impl.BookDaoImpl" %>
<%@ page import="com.sjsq.service.BookService" %>
<%@ page import="com.sjsq.service.impl.BookServiceImpl" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--
  Created by IntelliJ IDEA.
  User: 86152
  Date: 2022/6/2
  Time: 23:19
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>修改图书</title>
    <style type="text/css">
        h1 {
            text-align: center;
        }

        h4 {
            text-align: center;
            color: red;
        }

        body {
            background-color: antiquewhite;
        }

        div {
            text-align: center;
        }

    </style>
</head>
<body>
<%-- 头部 --%>
<jsp:include page="top.jsp"/>

<h1>修改图书</h1>
<hr/>
<%
    //获取admin-home.jsp页面的bookid
    Integer bookid = Integer.parseInt(request.getParameter("bookid"));
    BookService bookService = new BookServiceImpl();
    Book book = bookService.getBook(bookid);
%>
<form action="admin-book-do-update.jsp" method="post" name="updateForm">
    <div>
        <tr>
            <input type="hidden" name="bookid" id="bookid" value="<%=book.getBookid()%>">
        </tr>
    </div>
    <div>
        <tr>
            <label>图书名称：</label>
            <input type="text" name="bookname" id="bookname" value="<%=book.getBookname()%>" autofocus="autofocus">
        </tr>
    </div>
    <div>
        <tr>
            <label>图书价格：</label></td>
            <input type="text" name="price" id="price" value="<%=book.getPrice()%>">
        </tr>
    </div>
    <div>
        <tr>
            <label>图书作者：</label>
            <input type="text" name="author" id="author" value="<%=book.getAuthor()%>">
        </tr>
    </div>
    <div>
        <tr>
            <label>出版公司：</label>
            <input type="text" name="publish" id="publish" value="<%=book.getPublish()%>">
        </tr>
    </div>
    <div>
        <tr>
            <label>类型编号：</label>
            <input type="text" name="categoryid" id="categoryid" value="<%=book.getCategoryid()%>">
        </tr>
    </div>
    <div>
        <tr>
            <label>书籍链接：</label>
            <input type="text" name="booklink" id="booklink" value="<%=book.getBooklink()%>">
        </tr>
    </div>

    <div>
        <tr>
            <button type="submit" onclick="return checkForm()">修改</button>
            <button type="reset">重置</button>
        </tr>
    </div>
</form>

<script type="text/javascript">
    function checkForm() {
        var bookname = updateForm.bookname.value;
        var price = updateForm.price.value;
        //alert(name + pwd + repwd);
        if (bookname == "" || bookname == null) {
            alert("请输入图书名称");
            updateForm.bookname.focus();
            return false;
        } else if (price == "" || price == null) {
            alert("请输入图书价格");
            updateForm.price.focus();
            return false;
        }
        alert('修改成功！');
        return true;
    }
</script>
</body>
</html>

