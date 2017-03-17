package com.bg.controller;

import com.bg.model.UserInfo;
import com.bg.service.IUserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by yitop on 2017/3/16.
 */
@org.springframework.stereotype.Controller
@RequestMapping("/userAction.do")
public class UserInfoController implements Controller{

    @Autowired
    private IUserInfoService iUserInfoService;

    public ModelAndView handleRequest(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {
        String name = httpServletRequest.getParameter("name");
        Integer age = Integer.valueOf(httpServletRequest.getParameter("age"));

        UserInfo userInfo = new UserInfo();
        userInfo.setName(name);
        userInfo.setAge(age);
        iUserInfoService.add(userInfo);
        return new ModelAndView("/welcome/welcome.jsp");
    }

    public IUserInfoService getiUserInfoService() {
        return iUserInfoService;
    }

    public void setiUserInfoService(IUserInfoService iUserInfoService) {
        this.iUserInfoService = iUserInfoService;
    }
}
