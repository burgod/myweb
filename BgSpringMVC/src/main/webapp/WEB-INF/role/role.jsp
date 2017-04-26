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
<span> >>角色信息 </span>
<div id="tb" class="datagrid-toolbar" style="padding:2px 5px;">
    角色名称: <input class="easyui-text" id="rolename" style="width:110px">
    <a href="javascript:tableFresh()" class="easyui-linkbutton" iconCls="icon-search">Search</a>
</div>
<table id="roletable" class="easyui-datagrid" style="width:100%;height:300px"  data-options="fitColumns:true,singleSelect:true,pagination:true,toolbar:'#tb'">

</table>

<%--
<%@ include file="addOrEdit.jsp"%>
--%>
<%--<div style="display:none" id="addOr">
<%@ include file="addOrEdit.jsp"%>
</div>--%>

<%--<div id="dlg-buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveUser()">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">关闭</a>
</div>--%>
</body>
</html>
<script type="text/javascript">
    $(function() {
        $('#roletable').datagrid({
            url: '${pageContext.request.contextPath }/role/findList.do',
            columns: [[
                {field: 'roleid', title: 'code', width: 100},
                {field: 'rolename', title: '角色名称', width: 100},
                {field: 'createtime', title: '创建时间', width: 100},
                {field: 'updatetime', title: '更新时间', width: 100},
                {field: 'createuser', title: '创建者', width: 100},
                {field:'opt',title:'操作',width:100,align:'center',
                    formatter:function(value,rec,index){
                        var s = '<a href="#" mce_href="#" onclick="toShow(\''+ rec.id + '\')">查看</a> ';
                        var e = '<a href="#" mce_href="#" onclick="edit(\''+ rec.id + '\')">编辑</a> ';
                        var d = '<a href="#" mce_href="#" onclick="del(\''+ rec.id +'\')">删除</a> ';
                        return s+e+d;
                    }
                }
            ]],
            toolbar:[{
                text:'增加',iconCls:'icon-add',handler:function(){
                    open_add();
                }
            }/*,
             {text:'导入',iconCls:'icon-add',handler:function(){
             window.location.href='StuImport.aspx'
             }
             },
             {text:'查找',iconCls:'icon-search'}*/
            ],
        });
    });
    function open_add(){
        //$("#dlg").dialog('open').dialog('setTitle','添加用户');
        //$('#fm').form('clear');
        //url='userSave.do';
        //$("#addOr").css('display','block');
        $("<div></div>").dialog({
            id:'dlg',
            title: '添加',
            width : 400,
            height : 300,
            modal: true,
            href:'${pageContext.request.contextPath }/role/toAdd.do',
            onClose:function(){
                $('#dlg').dialog('destroy');
            },
            buttons : [ {
                text : 'OK',
                iconCls : 'icon-ok',
                handler : function() {
                    //提交表单
                    $.ajax({
                        cache: false,
                        type: "POST",
                        url:"${pageContext.request.contextPath }/role/addRole.do", //把表单数据发送到ajax.jsp
                        data:$('#fm').serialize(), //要发送的是ajaxFrm表单中的数据
                        async: false,
                        error: function(request) {
                            alert("发送请求失败！");

                        },success: function(data) {
                            alert("添加成功");
                            $('#roletable').datagrid("reload");
                            $("#dlg").dialog('destroy');
                        }

                    });

                }
            }, {
                text : 'CANCEL',
                iconCls : 'icon-cancel',
                handler : function() {
                    $("#dlg").dialog('destroy');
                }
            } ],
            onLoad : function() {
                //初始化表单数据
            }
        });
    }
    function toShow(id){
        $("<div></div>").dialog({
            id:'dlg',
            title: '查看',
            width : 400,
            height : 300,
            modal: true,
            href:'${pageContext.request.contextPath }/role/toAdd.do',
            onClose:function(){
                $("#dlg").dialog('destroy');
            },
            buttons : [  {
                text : 'Ok',
                iconCls : 'icon-ok',
                handler : function() {
                    $("#dlg").dialog('destroy');
                }
            } ],
            onLoad : function() {
                //初始化表单数据
                $.ajax({
                    url: '${pageContext.request.contextPath }/role/findById.do',
                    type:'POST',
                    data:{id:id},
                    success:function(data){
                        var sin = $.parseJSON(data);
                        $("input[name='rolename']").val(sin.rolename);
                    }
                });
            }
        });
    }
    function del(id){
        if(window.confirm("确定要删除该项吗")){
            $.ajax({
                url: '${pageContext.request.contextPath }/role/deleteRole.do',
                type: 'POST',
                data:{id:id},
                success:function (data) {
                    alert("删除成功");
                    $('#roletable').datagrid("reload");
                    return true;
                }

            });
        }else{
            return false;
        }
    }
    function tableFresh(){
        $('#roletable').datagrid({
            queryParams: {
                'rolename':$('#rolename').val(),
            }
        });
    }
    function edit(id){
        $('<div></div>').dialog({
            id:'dlg',
            title: '编辑',
            width : 400,
            height : 300,
            modal: true,
            href:'${pageContext.request.contextPath }/role/toAdd.do',
            onClose:function(){
                $("#dlg").dialog('destroy');
            },
            buttons : [ {
                text : 'OK',
                iconCls : 'icon-ok',
                handler : function() {
                    //提交表单
                    $.ajax({
                        cache: false,
                        type: "POST",
                        url:"${pageContext.request.contextPath }/role/updateRole.do", //把表单数据发送到ajax.jsp
                        data:$('#fm').serialize(), //要发送的是ajaxFrm表单中的数据
                        async: false,
                        error: function(request) {
                            alert("发送请求失败！");

                        },success: function(data) {
                            alert("修改成功");
                            $('#roletable').datagrid("reload");
                            $("#dlg").dialog('destroy');
                        }

                    });

                }
            }, {
                text : 'CANCEL',
                iconCls : 'icon-cancel',
                handler : function() {
                    $("#dlg").dialog('destroy');
                }
            } ],
            onLoad : function() {
                //初始化表单数据
                //初始化表单数据
                $.ajax({
                    url: '${pageContext.request.contextPath }/role/findById.do',
                    type:'POST',
                    data:{id:id},
                    success:function(data){
                        var sin = $.parseJSON(data);
                        $("input[name='rolename']").val(sin.rolename);
                        $("input[name='id']").val(sin.id);
                    }
                });
            }
        });
    }
</script>