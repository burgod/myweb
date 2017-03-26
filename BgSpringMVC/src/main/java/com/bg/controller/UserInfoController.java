package com.bg.controller;

import com.bg.model.UserInfo;
import com.bg.service.IUserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
        iUserInfoService.add(userInfo);
        return "/welcome/welcome";
    }

    public IUserInfoService getiUserInfoService() {
        return iUserInfoService;
    }

    public void setiUserInfoService(IUserInfoService iUserInfoService) {
        this.iUserInfoService = iUserInfoService;
    }

}
