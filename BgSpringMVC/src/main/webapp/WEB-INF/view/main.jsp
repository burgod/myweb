<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <!-- 引入 jQuery -->
    <script src="${pageContext.request.contextPath }/js/jquery-1.8.0.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/easing.js"></script>
    <script src="${pageContext.request.contextPath }/js/jquery.easyui.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/datagrid-detailview.js"></script>
    <script src="${pageContext.request.contextPath }/js/jquery.panel.js"></script>
    <script src="${pageContext.request.contextPath }/js/ztree/jquery.ztree.core.js"></script>
    <script src="${pageContext.request.contextPath }/js/ztree/jquery.ztree.excheck.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/zTreeStyle/zTreeStyle.css">
    <style>
        .ztree li a.level0 {width:200px;height: 20px; text-align: center; display:block; background-color: #0B61A4; border:1px silver solid;}
        .ztree li a.level0.cur {background-color: #66A3D2; }
        .ztree li a.level0 span {display: block; color: white; padding-top:3px; font-size:12px; font-weight: bold;word-spacing: 2px;}
        .ztree li a.level0 span.button { float:right; margin-left: 10px; visibility: visible;display:none;}
        .ztree li span.button.switch.level0 {display:none;}
    </style>
</head>
<body>
<%--
<script src="/demos/googlegg.js"></script>
--%>
<div class="content_wrap">
    <div class="zTreeDemoBackground left" id="menuId" style="float: left;height: 100%;">
        <ul id="treeMenu" class="ztree"></ul>
    </div>
    <div class="right" style="float: left;" id="contentId">
        <div class="content" style="width:100%"></div>
    </div>
</div>
<script>
    var curMenu = null, zTree_Menu = null;
    var settings = {
        view: {
            showLine: true,
            selectedMulti: false,
            dblClickExpand: false
        },
        data: {
            simpleData: {
                enable: true
            }
        },
        callback: {
            onNodeCreated: this.onNodeCreated,
            beforeClick: this.getBeforeClick,
            onClick: this.onClick
        }
    };
    //等待dom元素加载完毕.
    function getBeforeClick(treeId, node) {
        if (node.isParent) {
            if (node.level === 0) {
                var pNode = curMenu;
                while (pNode && pNode.level !==0) {
                    pNode = pNode.getParentNode();
                }
                if (pNode !== node) {
                    var a = $("#" + pNode.tId + "_a");
                    a.removeClass("cur");
                    zTree_Menu.expandNode(pNode, false);
                }
                a = $("#" + node.tId + "_a");
                a.addClass("cur");
                var isOpen = false;
                for (var i=0,l=node.children.length; i<l; i++) {
                    if(node.children[i].open) {
                        isOpen = true;
                        break;
                    }
                }
                if (isOpen) {
                    zTree_Menu.expandNode(node, true);
                    curMenu = node;
                } else {
                    zTree_Menu.expandNode(node.children[0].isParent?node.children[0]:node, true);
                    curMenu = node.children[0];
                }
            } else {
                zTree_Menu.expandNode(node);
            }
        }
        return !node.isParent;
    }
    function onClick(e, treeId, node) {
        $(".content").load("${pageContext.request.contextPath }"+node.resourceurl);
    }
    $(function(){
        var leftWidth=document.body.clientWidth - $('#menuId').width()-250;
        $('#contentId').width(leftWidth);
        $.ajax({
            url:'${pageContext.request.contextPath }/login/menu.do',
            type:'POST',
            data:{username:'lu'},
            success:function(data){
                var treeData =$.parseJSON(data);
                $.fn.zTree.init($("#treeMenu"), settings, treeData);
                zTree_Menu = $.fn.zTree.getZTreeObj("treeMenu");
                curMenu = zTree_Menu.getNodes()[0].children[0];
                zTree_Menu.selectNode(curMenu);
                var a = $("#" + zTree_Menu.getNodes()[0].tId + "_a");
                a.addClass("cur");
            }
        })
    });
</script>
</body>
</html>