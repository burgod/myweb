<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <body>
    <div style="padding:10px 20px;">
        <form id="fm">
            <table cellspacing="10px;">
                <tr>
                    <input name="id" class="easyui-validatebox" required="true" style="width: 200px;display: none">
                    <td>角色名称：</td>
                    <td><input name="rolename" class="easyui-validatebox" required="true" style="width: 200px;"></td>
                </tr>
                <tr>
                    <td>资源:</td>
                    <td>
                        <div class="content_wrap">
                            <div class="zTreeDemoBackground left">
                                <ul class="list">
                                    <li class="title"><input id="citySel" type="text" readonly value="" style="width:120px;" onclick="showMenu();" />
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div id="menuContent" class="menuContent" style="display:none;position:inherit; z-index:999999;background-color: beige;overflow:scroll;" >
                            <ul id="treeDemo" class="ztree" style="margin-top:0; width:180px; height: 300px;"></ul>
                        </div>
                        <input type="hidden" name="ztreeIds" id="ztreeIds">
                    </td>
                </tr>
            </table>
        </form>
    </div>
    </body>
</html>
