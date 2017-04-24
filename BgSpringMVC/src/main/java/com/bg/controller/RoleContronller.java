package com.bg.controller;

import com.bg.common.Page;
import com.bg.model.Role;
import com.bg.service.IRoleService;
import com.bg.utils.GsonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by yitop on 2017/4/24.
 */
@Controller
@RequestMapping(value="role")
public class RoleContronller {

    @Autowired
    private IRoleService iRoleService;

    @RequestMapping(value="toView")
    public String toView(){
        return "/role/role";
    }

    @RequestMapping(value="addRole")
    @ResponseBody
    public String addRole(Role role){
        role.setCreatetime(new Date());
        role.setUpdatetime(new Date());
        role.setCreateuser("lu");
        iRoleService.addRole(role);
        return "success";
    }

    @RequestMapping(value="findList")
    @ResponseBody
    public String getRoleList(@RequestParam(value="page", required=false) String page, @RequestParam(value="rows", required=false) String rows, @RequestParam(value="rolename", required=false) String rolename){
        Page pageBean = new Page(Integer.parseInt(page), Integer.parseInt(rows));
        Map reMap = new HashMap();
        Map paraMap = new HashMap();

        //paraMap.put("title", title);
        paraMap.put("firstPage", pageBean.getFirstPage());
        paraMap.put("rows", pageBean.getRows());
        paraMap.put("rolename",rolename);

        long total = iRoleService.findtotal();
        List<Role> results = iRoleService.findList(paraMap);
        reMap.put("rows",results);
        reMap.put("total",total);
        return GsonUtils.bean2json(reMap);
    }
}
