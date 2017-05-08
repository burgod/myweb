package com.bg.controller;

import com.bg.common.MenuTree;
import com.bg.model.Resource;
import com.bg.service.IResourceService;
import com.bg.utils.GsonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by luyb on 2017/4/7.
 */
@Controller
@RequestMapping(value="login")
public class LoginController {

    @Autowired
    private IResourceService iResourceService;

    @RequestMapping(value="menu")
    @ResponseBody
    public String getMenu(@RequestParam(value="username",required = false)String username){
        List<MenuTree> menus = iResourceService.getResourceByUser(username);
        return GsonUtils.bean2json(menus);
    }
}
