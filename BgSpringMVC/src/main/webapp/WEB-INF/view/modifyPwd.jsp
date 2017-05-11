<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<body>
<div style="padding:10px 20px;">
    <form id="fm">
        <table cellspacing="10px;">
            <tr>
                <input name="id" class="easyui-validatebox" required="true" style="width: 200px;display: none">
                <td>姓名：</td>
                <td><input name="username" class="easyui-validatebox" required="true" style="width: 200px;" readonly= "true"></td>
            </tr>
            <tr>
                <td>原密码：</td>
                <td><input name="password" type="password" class="easyui-validatebox" required="true" style="width: 200px;"></td>
            </tr>
            <tr>
                <td>新密码：</td>
                <td><input name="newpassword" type="password" class="easyui-validatebox" required="true" style="width: 200px;"></td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
