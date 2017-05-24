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
        html{
            width: 100%;
            height: 100%;
            overflow: hidden;
            font-style: sans-serif;
        }
        body{
            width: 100%;
            height: 100%;
            font-family: 'Open Sans',sans-serif;
            margin: 0;
            background-color: #4A374A;
        }
        #login{
            position: absolute;
            top: 50%;
            left:50%;
            margin: -150px 0 0 -150px;
            width: 300px;
            height: 300px;
        }
        #login h1{
            color: #fff;
            text-shadow:0 0 10px;
            letter-spacing: 1px;
            text-align: center;
        }
        h1{
            font-size: 2em;
            margin: 0.67em 0;
        }
        input{
            width: 300px;
            height: 22px;
            margin-bottom: 10px;
            outline: none;
            font-size: 13px;
            border-radius: 4px;
        }
        .but{
            width: 300px;
            min-height: 20px;
            display: block;
            background-color: #4a77d4;
            border: 1px solid #3762bc;
            color: #fff;
            padding: 9px 14px;
            font-size: 15px;
            line-height: normal;
            border-radius: 5px;
            margin: 0;
        }

    </style>
    <script src="${pageContext.request.contextPath }/js/jquery-1.8.0.min.js"></script>
    <title></title>
</head>

<body>
<div id="login">
    <h1>Login</h1>
    <form method="post" id="loginform">
        <input type="text" required="required" placeholder="用户名" name="name"/>
        <input type="password" required="required" placeholder="密码" name="password"/>
        <button class="but" type="button"  onclick="login()">登录</button>
    </form>
</div>
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



