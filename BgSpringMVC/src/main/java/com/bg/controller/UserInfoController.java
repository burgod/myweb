package com.bg.controller;

import com.bg.model.UserInfo;
import com.bg.service.IUserInfoService;
import com.bg.utils.GsonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by yitop on 2017/3/16.
 */
@org.springframework.stereotype.Controller
@RequestMapping(value="userAction")
public class UserInfoController{

    @Autowired
    private IUserInfoService iUserInfoService;

    @RequestMapping(value="toWelcome")
    public String handleRequest(HttpServletRequest httpServletRequest,HttpServletResponse httpServletResponse,UserInfo userInfo) throws Exception {
        /*String name = httpServletRequest.getParameter("name");
        Integer age = Integer.valueOf(httpServletRequest.getParameter("age"));

        UserInfo userInfo = new UserInfo();
        userInfo.setName(name);
        userInfo.setAge(age);*/
        //iUserInfoService.add(userInfo);
        //return "/welcome/welcome";
        return "/view/Test";
    }

    @RequestMapping(value="myWelcome")
    public String toContent(){
        return "/welcome/welcome";
    }

    @RequestMapping(value="userList")
    @ResponseBody
    public String getUserList(){
        List<UserInfo> results = iUserInfoService.findList();
        return GsonUtils.bean2json(results);
    }

    public IUserInfoService getiUserInfoService() {
        return iUserInfoService;
    }

    public void setiUserInfoService(IUserInfoService iUserInfoService) {
        this.iUserInfoService = iUserInfoService;
    }

}
