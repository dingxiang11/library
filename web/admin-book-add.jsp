<%--
  Created by IntelliJ IDEA.
  User: 86152
  Date: 2022/6/2
  Time: 20:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新增图书</title>
    <style type="text/css">
        h1{
            text-align: center;
        }
        h4{
            text-align: center;
            color: red;
        }
        body{
            background-color: antiquewhite;
         }
         div{
             text-align: center;
         }
         #before{
             text-align: center;
         }

    </style>
</head>
<body>
<%-- 头部 --%>
<jsp:include page="top.jsp"/>

<h1>新增图书</h1>
<hr>
<div id="before">
    <a href="javascript:window.history.go(-1)">返回上一级</a>
</div>

<form action="admin-book-do-add.jsp" method="post" name="addForm">
    <div>
        <label>图书名称：</label>
        <input type="text" name="bookname" id="bookname" placeholder="图书名称" autofocus="autofocus">
    </div>
    <div>
        <label>图书价格：</label>
        <input type="text" name="price" id="price" placeholder="图书价格(数字)">
    </div>
    <div>
        <label>图书作者：</label>
        <input type="text" name="author" id="author" placeholder="图书作者">
    </div>
    <div>
        <label>出版公司：</label>
        <input type="text" name="publish" id="publish" placeholder="出版公司">
    </div>
    <div>
        <label>类型编号：</label>
        <input type="text" name="categoryid" id="categoryid" placeholder="类型编号">
    </div>
    <div>
        <label>书籍链接：</label>
        <input type="text" name="booklink" id="booklink" placeholder="书籍链接">
    </div>
    <div id="submitbtn">
        <button type="submit" onclick="return checkForm()">添加</button>
        <button type="reset">重置</button>
    </div>
</form>

<script type="text/javascript">
    function checkForm(){
        var bookname = addForm.bookname.value;
        var price = addForm.price.value;
        if (bookname == "" || bookname == null){
            alert("请输入图书名称");
            addForm.bookname.focus();
            return false;
        }else if (price == "" || price == null){
            alert("请输入图书价格");
            addForm.price.focus();
            return false;
        }
        alert('添加成功！');
        return true;
    }
</script>
</body>
</html>
