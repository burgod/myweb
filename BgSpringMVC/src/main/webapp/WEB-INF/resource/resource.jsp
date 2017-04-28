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
<span> >>权限信息 </span>
<div id="tb" class="datagrid-toolbar" style="padding:2px 5px;">
    父资源: <input class="easyui-combobox" id="pre" style="width:110px">
    子资源: <input class="easyui-combobox" id="re" style="width:110px">
    <a href="javascript:tableFresh()" class="easyui-linkbutton" iconCls="icon-search">Search</a>
</div>
<table id="resourcetable" class="easyui-datagrid" style="width:100%;height:300px"  data-options="fitColumns:true,singleSelect:true,pagination:true,toolbar:'#tb'">

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
        $('#resourcetable').datagrid({
            url: '${pageContext.request.contextPath }/resource/findList.do',
            columns: [[
                {field: 'resourceid', title: 'code', width: 100},
                {field: 'resourcename', title: '资源权限名称', width: 100},
                {field: 'resourceurl', title: '资源路径', width: 100},
                {field: 'presourcename', title: '父资源权限', width: 100},
                {field: 'resourcetype', title: '资源类型', width: 100},
                {field:'opt',title:'操作',width:100,align:'center',
                    formatter:function(value,rec,index){
                        var s = '<a href="#" mce_href="#" onclick="toShow(\''+ rec.resourceid + '\')">查看</a> ';
                        var e = '<a href="#" mce_href="#" onclick="edit(\''+ rec.resourceid + '\')">编辑</a> ';
                        var d = '<a href="#" mce_href="#" onclick="del(\''+ rec.resourceid +'\')">删除</a> ';
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
            onLoadSuccess:function () {

            }
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
            href:'${pageContext.request.contextPath }/resource/toAdd.do',
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
                        url:"${pageContext.request.contextPath }/resource/addResource.do", //把表单数据发送到ajax.jsp
                        data:$('#fm').serialize(), //要发送的是ajaxFrm表单中的数据
                        async: false,
                        error: function(request) {
                            alert("发送请求失败！");

                        },success: function(data) {
                            alert("添加成功");
                            $('#resourcetable').datagrid("reload");
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
                initCombobox("presourceid",'');
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
            href:'${pageContext.request.contextPath }/resource/toAdd.do',
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
                    url: '${pageContext.request.contextPath }/resource/findById.do',
                    type:'POST',
                    data:{id:id},
                    success:function(data){
                        var sin = $.parseJSON(data);
                        $("input[name='resourcename']").val(sin.resourcename);
                        $("input[name='resourceurl']").val(sin.resourceurl);
                        $("#resourcetype").val(sin.resourcetype);
                    }
                });
                initCombobox("presourceid",id);
            }
        });
    }
    function del(id){
        if(window.confirm("确定要删除该项吗")){
            $.ajax({
                url: '${pageContext.request.contextPath }/resource/deleteResource.do',
                type: 'POST',
                data:{id:id},
                success:function (data) {
                    alert("删除成功");
                    $('#resourcetable').datagrid("reload");
                    return true;
                }

            });
        }else{
            return false;
        }
    }
    function tableFresh(){
        $('#resourcetable').datagrid({
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
            href:'${pageContext.request.contextPath }/resource/toAdd.do',
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
                        url:"${pageContext.request.contextPath }/resource/updateResource.do", //把表单数据发送到ajax.jsp
                        data:$('#fm').serialize(), //要发送的是ajaxFrm表单中的数据
                        async: false,
                        error: function(request) {
                            alert("发送请求失败！");

                        },success: function(data) {
                            alert("修改成功");
                            $('#resourcetable').datagrid("reload");
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
                    url: '${pageContext.request.contextPath }/resource/findById.do',
                    type:'POST',
                    data:{id:id},
                    success:function(data){
                        var sin = $.parseJSON(data);
                        $("input[name='resourceid']").val(sin.resourceid);
                        $("input[name='resourcename']").val(sin.resourcename);
                        $("input[name='resourceurl']").val(sin.resourceurl);
                        $("#resourcetype").val(sin.resourcetype);
                    }
                });
                initCombobox("presourceid",id);
            }
        });
    }
    function initCombobox(id,code){
        var value = "";
        //加载下拉框复选框
        $('#'+id).combobox({
            url:'${pageContext.request.contextPath }/resource/getAllResource.do?resourceId='+code, //后台获取下拉框数据的url
            method:'post',
            panelHeight:200,//设置为固定高度，combobox出现竖直滚动条
            valueField:'id',
            textField:'text',
            multiple:false,
/*            formatter: function (row) { //formatter方法就是实现了在每个下拉选项前面增加checkbox框的方法
                var opts = $(this).combobox('options');
                return '<input type="checkbox" class="combobox-checkbox">' + row[opts.textField];
            },*/
            /*onLoadSuccess: function () {  //下拉框数据加载成功调用
                var opts = $(this).combobox('options');
                var target = this;
                var values = $(target).combobox('getValues');//获取选中的值的values
                $.map(values, function (value) {
                    var el = opts.finder.getEl(target, value);
                    el.find('input.combobox-checkbox')._propAttr('checked', true);
                })
            },
            onSelect: function (row) { //选中一个选项时调用
                var opts = $(this).combobox('options');
                //设置选中值所对应的复选框为选中状态
                var el = opts.finder.getEl(this, row[opts.valueField]);
                el.find('input.combobox-checkbox')._propAttr('checked', true);

                //获取选中的值的values
                $("#"+id).val($(this).combobox('getValues'));
            },
            onUnselect: function (row) {//不选中一个选项时调用
                var opts = $(this).combobox('options');
                var el = opts.finder.getEl(this, row[opts.valueField]);
                el.find('input.combobox-checkbox')._propAttr('checked', false);

                //获取选中的值的values
                $("#"+id).val($(this).combobox('getValues'));
            }*/
        });
    }
</script>