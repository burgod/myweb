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
                    <td><input name="name" class="easyui-validatebox" required="true" style="width: 200px;"></td>
                </tr>
                <tr>
                    <td>年龄：</td>
                    <td><input name="age" class="easyui-validatebox" required="true" style="width: 200px;"></td>
                </tr>
                <tr>
                    <td>联系电话：</td>
                    <td><input name="phone" class="easyui-validatebox" required="true" style="width: 200px;"></td>
                </tr>
                <tr>
                    <td>Email：</td>
                    <td><input name="email" class="easyui-validatebox" validType="email" required="true" style="width: 200px;"></td>
                </tr>
                <tr>
                    <td>角色：</td>
                    <td>
                        <input id="roleSelect" name="roleSelect" class="easyui-combobox"/>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    </body>
</html>
