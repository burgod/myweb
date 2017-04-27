<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <body>
    <div style="padding:10px 20px;">
        <form id="fm">
            <table cellspacing="10px;">
                <tr>
                    <input name="id" class="easyui-validatebox" required="true" style="width: 200px;display: none">
                    <td>资源权限名称：</td>
                    <td><input name="resourcename" class="easyui-validatebox" required="true" style="width: 200px;"></td>
                </tr>
                <tr>
                    <td>资源路径：</td>
                    <td><input name="resourceurl" class="easyui-validatebox" required="true" style="width: 200px;"></td>
                </tr>
                <tr>
                    <td>父资源权限：</td>
                    <td><input id="preresource" name="preresource" class="easyui-combobox" style="width: 200px;"/></td>
                </tr>
                <tr>
                    <td>权限类型：</td>
                    <td><select name="resourcetype" class="easyui-validatebox" required="true" style="width: 200px;">
                            <option value="0">菜单资源</option>
                            <option value="1">功能资源</option>
                        </select>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    </body>
</html>
