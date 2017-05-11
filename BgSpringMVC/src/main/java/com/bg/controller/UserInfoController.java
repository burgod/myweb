package com.bg.controller;

import com.bg.common.Page;
import com.bg.model.UserInfo;
import com.bg.model.UserRole;
import com.bg.service.IRoleService;
import com.bg.service.IUserInfoService;
import com.bg.utils.GsonUtils;
import com.bg.utils.MD5;
import com.bg.utils.SessionHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by yitop on 2017/3/16.
 */
@org.springframework.stereotype.Controller
@RequestMapping(value="userAction")
public class UserInfoController{

    @Autowired
    private IUserInfoService iUserInfoService;

    @RequestMapping(value="toWelcome")
    public String handleRequest(HttpServletRequest httpServletRequest,HttpServletResponse httpServletResponse,UserInfo userInfo,Map map) throws Exception {
        /*String name = httpServletRequest.getParameter("name");
        Integer age = Integer.valueOf(httpServletRequest.getParameter("age"));

        UserInfo userInfo = new UserInfo();
        userInfo.setName(name);
        userInfo.setAge(age);*/
        //iUserInfoService.add(userInfo);
        //return "/welcome/welcome";
        map.put("username", SessionHelper.get().getUserInfo().getName());
        return "view/main";
    }

    @RequestMapping(value="addUser")
    @ResponseBody
    public String saveUser(UserInfo userInfo,@RequestParam(value="roleSelect")String [] roleids){
        userInfo.setCreatetime(new Date());
        userInfo.setPassword(MD5.md5("123654","utf-8"));//新用户默认密码
        iUserInfoService.add(userInfo,roleids);
        return "success";
    }

    @RequestMapping(value="myWelcome")
    public String toContent(){
        return "/welcome/welcome";
    }

    @RequestMapping(value="userList",produces="text/html;charset=UTF-8")
    @ResponseBody
    public String getUserList(@RequestParam(value="page", required=false) String page,@RequestParam(value="rows", required=false) String rows,@RequestParam(value="name", required=false) String name,@RequestParam(value="phone", required=false) String phone) throws Exception{

        Page pageBean = new Page(Integer.parseInt(page), Integer.parseInt(rows));
        Map reMap = new HashMap();
        Map paraMap = new HashMap();

        //paraMap.put("title", title);
        paraMap.put("firstPage", pageBean.getFirstPage());
        paraMap.put("rows", pageBean.getRows());
        paraMap.put("name",name);
        paraMap.put("phone",phone);

        List<UserInfo> results = iUserInfoService.findList(paraMap);
        long total = iUserInfoService.findtotal(paraMap);
        //System.out.print("测试>>>>"+GsonUtils.bean2json(results));
        reMap.put("rows", results);     //存放每页记录数
        reMap.put("total", total);   //存放总记录数 ，必须的
        return GsonUtils.bean2json(reMap);
    }

    @RequestMapping(value="deleteUser",method = RequestMethod.POST)
    @ResponseBody
    public String deleteUser(@RequestParam String id){
        iUserInfoService.deleteUser(id);
        return "success";
    }

    @RequestMapping(value="toAdd")
    public String toAdd(){
        return "/welcome/addOrEdit";
    }

    @RequestMapping(value="findByid")
    @ResponseBody
    public String findById(@RequestParam String id){
        UserInfo userInfo = iUserInfoService.findByid(id);
        return GsonUtils.bean2json(userInfo);
    }

    @RequestMapping(value="updateUser")
    @ResponseBody
    public String updateUser(UserInfo userInfo,@RequestParam(value="roleSelect")String [] roleids){
        iUserInfoService.updateUser(userInfo,roleids);
        return "success";
    }

    @RequestMapping(value="modifyPwd")
    public String modifyPw(){
        return "/view/modifyPwd";
    }

    @RequestMapping(value="updatePwd")
    @ResponseBody
    public String updatePwd(@RequestParam(value="username")String username,@RequestParam(value="password")String password,@RequestParam(value="newpassword")String newpassword){
        UserInfo userInfo = new UserInfo();
        if(!username.equals("lu")){
            userInfo.setPassword(MD5.md5(password.trim(),"utf-8"));
        }else{
            userInfo.setPassword(password.trim());
        }
        userInfo.setName(username);
        UserInfo re = iUserInfoService.findUser(userInfo);

        Map<String,String> paraMap = new HashMap<String,String>();
        paraMap.put("newpassword",MD5.md5(newpassword.trim(),"utf-8"));
        paraMap.put("name",username);
        if(re!=null){
            iUserInfoService.updatePwd(paraMap);
            return "ok";
        }
        return "wrong";
    }

}
