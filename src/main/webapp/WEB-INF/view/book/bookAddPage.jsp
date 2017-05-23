<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2017/5/15
  Time: 15:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
  <form id="insertForm">
    书籍名称:<input id="book_name" class="easyui-textbox" data-options="prompt:'请输入书籍名称'">
  </form>
<script>
  var add_book_json = new Object();

  function add_book_fun() {
    var book_name = $("#book_name").textbox("getValue");
    add_book_json.bookName = book_name;
    return add_book_json;
  }
</script>
</body>
</html>
