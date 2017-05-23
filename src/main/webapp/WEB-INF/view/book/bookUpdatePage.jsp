<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2017/5/15
  Time: 16:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<form id="updateForm">
    <input type="hidden" id="edit_book_id" value="${book.bookID}">
    书籍名称:<input id="edit_book_name" value="${book.bookName}" class="easyui-textbox" data-options="prompt:'请输入书籍名称'">
</form>
<script>
    var edit_book_json = new Object();
    function edit_book_fun() {
        var book_id =$("#edit_book_id").val();
        var book_name = $("#edit_book_name").textbox("getValue");
        edit_book_json.bookID = book_id;
        edit_book_json.bookName = book_name;
        return edit_book_json;
    }
</script>
</body>
</html>