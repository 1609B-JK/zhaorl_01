<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2017/5/15
  Time: 11:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title></title>
  <!-- 引入easyui组件 -->
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/js/easyui/themes/default/easyui.css" />
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/js/easyui/themes/icon.css" />
  <script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath() %>/js/easyui/jquery.easyui.min.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath() %>/js/easyui/locale/easyui-lang-zh_CN.js"></script>
</head>
<body>
<div id="book_dg"></div>
<div id=book_tb>
  <!-- 按钮组 -->
  <div class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'" onclick="addBook()">添加</div>
  <div class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-remove'" onclick="deleteBook()">删除</div>
  <div class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-edit'" onclick="updateBook()">修改</div>
</div>
<script>
  $("#book_dg").datagrid({
    url: "<%=request.getContextPath()%>/queryBookList.jhtml",
    striped: true,
    ctrlSelect: true,
    loadMsg: "数据加载中……",
    fitColumns: true,
    toolbar: "#book_tb",
    pagination: true,
    pagePosition: "both",
    pageList: [3, 5, 10, 15],
    pageSize: 3,
    columns:[[
      {field:"bookID",title:"主键",width:100},
      {field:"bookName",title:"名称",width:100},
    ]]
  })
  function addBook(){
    var add_book_dialog = $("<div style='padding:5px'></div>").dialog({
      title:"添加书籍",
      autoHeight:true,
      width:360,
      modal:true,
      buttons:[
        {text:"保存",
          handler:function(){
            var add_book_json = add_book_fun();
            $.post(
                    "<%=request.getContextPath() %>/insertBook.jhtml",
                    add_book_json,
                    function(data) {
                      add_book_dialog.dialog("destroy");
                      $("#book_dg").datagrid("load");
                    },
                    "json"
            );
          }
        },
        {text:"取消",
          handler:function(node) {
            add_book_dialog.dialog("destroy");
          }
        },
      ]
    })
    add_book_dialog.window({
      href:"<%=request.getContextPath()%>/toAddBookPage.jhtml",
    })
  }
  function deleteBook(){
    var deleteBookById = $("#book_dg").datagrid("getSelected");
    if(deleteBookById){
      $.messager.confirm("提示","您确定删除吗？",function(f){
        if(f){
          $.ajax({
            type:"post",
            url:"<%=request.getContextPath()%>/deleteBookByID.jhtml?bookID="+deleteBookById.bookID,
            dataType:"json",
            success:function(data){
              $("#book_dg").datagrid("reload");
            }
          })
        }
      })
    }else{
      $.messager.alert("提示","二狗子请选择一条删除");
    }
  }
  function updateBook(){
    var updatePageByID = $("#book_dg").datagrid("getSelected");
    if(updatePageByID){
      var edit_book_dialog = $("<div style='padding:5px'></div>").dialog({
        title:"修改书籍",
        autoHeight:true,
        width:360,
        modal:true,
        buttons:[
          {text:"修改",
            handler:function(){
              var edit_book_json = edit_book_fun();
              $.post(
                      "<%=request.getContextPath() %>/updateBook.jhtml",
                      edit_book_json,
                      function(data) {
                        edit_book_dialog.dialog("destroy");
                        $("#book_dg").datagrid("load");
                      },
                      "json"
              );
            }
          },
          {text:"取消",
            handler:function(){
              edit_book_dialog.dialog("destroy");
            }
          },
        ]
      })
      edit_book_dialog.window({
        href:"<%=request.getContextPath()%>/updatePage.jhtml?bookID="+updatePageByID.bookID
      })
    }
  }
</script>
</body>
</html>
