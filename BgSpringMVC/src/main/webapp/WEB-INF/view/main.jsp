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
    <script src="${pageContext.request.contextPath }/js/jquery.parser.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/themes/icon.css">
    <style>
        /*
                author :前端一枚  努力学习中 qq：815183231;
        */

        /*简单粗暴重置默认样式===============================*/
        *{ margin: 0; padding: 0; }
        img{border:0;}
        ul,li{list-style-type:none;}
        a {color:#00007F;text-decoration:none;}
        a:hover {color:#bd0a01;text-decoration:underline;}
        .treebox{ width: 200px; margin-left: 0px; background-color:#1a6cb9; height: 100%;float: left}
        .mymenu{ overflow: hidden; border-color: #ddd; border-style: solid ; border-width: 0 1px 1px ; }
        /*第一层*/
        .mymenu li.level1>a{
            display:block;
            height: 45px;
            line-height: 45px;
            color: #fff;
            padding-left: 50px;
            border-bottom: 1px solid #000;
            font-size: 16px;
            position: relative;
            transition:all .5s ease 0s;
        }
        .mymenu li.level1 a:hover{ text-decoration: none;background-color:#326ea5;   }
        .mymenu li.level1 a.current{ background: #0f4679; }

        /*============修饰图标*/
        .ico{ width: 20px; height: 20px; display:block;   position: absolute; left: 20px; top: 10px; background-repeat: no-repeat; background-image: url(${pageContext.request.contextPath }/images/ico1.png); }

        /*============小箭头*/
        .level1 i{ width: 20px; height: 10px; background-image:url(${pageContext.request.contextPath }/images/arrow.png); background-repeat: no-repeat; display: block; position: absolute; right: 20px; top: 20px; }
        .level1 i.down{ background-position: 0 -10px; }

        .ico1{ background-position: 0 0; }
        .ico2{ background-position: 0 -20px; }
        .ico3{ background-position: 0 -40px; }
        .ico4{ background-position: 0 -60px; }
        .ico5{ background-position: 0 -80px; }

        /*第二层*/
        .mymenu li ul{ overflow: hidden; }
        .mymenu li ul.level2{ display: none;background: #0f4679;  }
        .mymenu li ul.level2 li a{
            display: block;
            height: 45px;
            line-height: 45px;
            color: #fff;
            text-indent: 60px;
            /*border-bottom: 1px solid #ddd; */
            font-size: 14px;
            transition:all 1s ease 0s;
        }

    </style>
</head>
<body>
<%--
<script src="/demos/googlegg.js"></script>
--%>
<div>
<div class="treebox">
    <ul class="mymenu">
        <li class="level1">
            <a href="#none"><em class="ico ico1"></em>导航一<i class="down"></i></a>
            <ul class="level2">
                <li><a href="javascript:TO_METCH();">用户管理</a></li>
                <li><a href="javascript:;">导航选项</a></li>
                <li><a href="javascript:;">导航选项</a></li>
                <li><a href="javascript:;">导航选项</a></li>
            </ul>
        </li>
        <li class="level1">
            <a href="#none"><em class="ico ico2"></em>导航一<i></i></a>
            <ul class="level2">
                <li><a href="javascript:;">导航选项</a></li>
                <li><a href="javascript:;">导航选项</a></li>
                <li><a href="javascript:;">导航选项</a></li>
                <li><a href="javascript:;">导航选项</a></li>
            </ul>
        </li>
        <li class="level1">
            <a href="#none"><em class="ico ico3"></em>导航一<i></i></a>
            <ul class="level2">
                <li><a href="javascript:;">导航选项</a></li>
                <li><a href="javascript:;">导航选项</a></li>
                <li><a href="javascript:;">导航选项</a></li>
                <li><a href="javascript:;">导航选项</a></li>
            </ul>
        </li>
        <li class="level1">
            <a href="#none"><em class="ico ico4"></em>导航一<i></i></a>
            <ul class="level2">
                <li><a href="javascript:;">导航选项</a></li>
                <li><a href="javascript:;">导航选项</a></li>
                <li><a href="javascript:;">导航选项</a></li>
                <li><a href="javascript:;">导航选项</a></li>
            </ul>
        </li>
        <li class="level1">
            <a href="#none"><em class="ico ico5"></em>导航一<i></i></a>
            <ul class="level2">
                <li><a href="javascript:;">导航选项</a></li>
                <li><a href="javascript:;">导航选项</a></li>
                <li><a href="javascript:;">导航选项</a></li>
                <li><a href="javascript:;">导航选项</a></li>
            </ul>
        </li>
    </ul>
</div>
<div style="float:left;width:80%">
    <div class="content" style="width:100%"></div>
</div>
</div>
<script>
    //等待dom元素加载完毕.
    $(function(){
        $(".treebox .level1>a").click(function(){
            $(this).addClass('current')   //给当前元素添加"current"样式
                    .find('i').addClass('down')   //小箭头向下样式
                    .parent().next().slideDown('slow','easeOutQuad')  //下一个元素显示
                    .parent().siblings().children('a').removeClass('current')//父元素的兄弟元素的子元素去除"current"样式
                    .find('i').removeClass('down').parent().next().slideUp('slow','easeOutQuad');//隐藏
            return false; //阻止默认时间
        });
    })
    function TO_METCH(){
        $(".content").load("${pageContext.request.contextPath }/userAction/myWelcome.do");
    }
</script>
</body>
</html>