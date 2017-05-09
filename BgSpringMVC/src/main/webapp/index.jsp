<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <style type="text/css">
        form{
            margin:0px auto;
            width:500px;
            padding:20px;
        }
    </style>
    <script src="${pageContext.request.contextPath }/js/jquery-1.8.0.min.js"></script>
    <title></title>
</head>

<body>
<h1>DDU</h1>
<form action="" method="post" id="loginform">
    <table>
        <tr>
            <td>用户名：</td>
            <td><input name="name"/> </td>
        </tr>
        <tr>
            <td>密码：</td>
            <td><input name="password"/></td>
        </tr>
    </table>
    <input type="button" onclick="login()" value="登录"/>
</form>
</body>
</html>
<script type="text/javascript">
    function login(){
        $.ajax({
            cache: true,
            type: 'POST',
            url:"${pageContext.request.contextPath }/login/login.do",
            data:$('#loginform').serialize(),// 你的formid
            async: false,
            error: function(request) {
                alert("用户或密码错误");
                return;
            },
            success: function(data) {
                var res = data;
                if(res=='wrong'){
                    alert("用户或密码错误");
                    return;
                }else if(res=='ok'){
                    window.location.href="${pageContext.request.contextPath }/userAction/toWelcome.htm";
                }
            }
        });
    }
</script>
<%--<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <!--<meta http-equiv="X-UA-Compatible" content="IE=edge">-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登录</title>
&lt;%&ndash;
    <link rel="stylesheet" href="http://yitopapp.xicp.io:42020/dist/package/1.0.0/vue-blu.min.css">
&ndash;%&gt;
    <script type="text/javascript" src="/assets/js/jquery.min.js"></script>
&lt;%&ndash;
    <script src="http://yitopapp.xicp.io:42020/dist/package/1.0.0/vue-blu.min.js"></script>
&ndash;%&gt;
    <!--<script src="http://localhost:8081/package/vue-blu.min.js"></script>-->
    <!--<script type="text/javascript" src="/assets/js/common.js"></script>-->
    <link rel="stylesheet" href="/assets/css/common.css" />
    <script type="text/javascript" src="/assets/js/common/common.js"></script>
    <script type="text/javascript" src="<%=basePath%>assets/js/login/login.js"></script>

</head>

<body class="login">
<div class="login-box">
    <div class="main-bg"></div>
    <div class="main">
        <a href="#" class="logo"></a>
        <h3 class="tit">BG系统</h3>
        <!--登录-->
        <div class="login-main">
            <h6 class="login-tit">用户登录</h6>
            <div class="login-input-box g-clr">
                <i class="icon icon-username fl"></i>
                <input type="text" class="input-txt username fl" placeholder="请输入用户名"/>
            </div>

            <div class="login-input-box g-clr">
                <i class="icon icon-password fl"></i>
                <input type="password" class="input-txt password fl" placeholder="请输入密码"/>
            </div>
            <a href="javascript:;" class="submit" >登录</a>
            <a class="is-loading submit-loading" style="display: none"></a>
        </div>

        <!--验证码获取-->
        <div class="code-main"  style="display: none">
            <h6 class="code-tit">校验验证码</h6>
            <div class="code-box g-clr">
                <i class="code icon-phone fl"></i>
                <input type="text" class="code-txt code-name fl" placeholder="请输入用户名" disabled/>
            </div>

            <div class="code-box g-clr">
                <i class="code icon-code fl"></i>
                <input type="text" class="code-txt code-num fl" placeholder="请输入验证码"/>
                <a href="javascript:;" class="code-btn fl">获取验证码</a>
            </div>
            <a href="javascript:;" class="sure">确定</a>
            <a class="is-loading sure-loading" style="display: none"></a>
        </div>
    </div>
</div>
</body>
</html>--%>



