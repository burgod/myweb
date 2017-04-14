<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <style type="text/css">
        form{
            margin:0px auto;

            width:500px;
            padding:20px;
        }
    </style>
    <title></title>
</head>

<body>
<h1>噢，在呢！eeee</h1>
<table id="mytable">

</table>
</body>
</html>
<script type="text/javascript">
    $(function() {
        $('#mytable').datagrid({
            url: '/userAction/userList.do',
            columns: [[
                {field: 'id', title: 'Code', width: 100},
                {field: 'name', title: '名字', width: 100},
                {field: 'age', title: '年龄', width: 100}
            ]]
        });
    });
</script>