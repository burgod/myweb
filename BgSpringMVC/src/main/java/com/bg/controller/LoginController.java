package com.bg.controller;

import com.bg.common.MenuTree;
import com.bg.model.PurviewSession;
import com.bg.model.Resource;
import com.bg.model.UserInfo;
import com.bg.service.IResourceService;
import com.bg.service.IUserInfoService;
import com.bg.utils.DESEncrypt;
import com.bg.utils.GsonUtils;
import com.bg.utils.SessionHelper;
import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by luyb on 2017/4/7.
 */
@Controller
@RequestMapping(value="login")
public class LoginController {

    @Autowired
    private IResourceService iResourceService;

    @Autowired
    private IUserInfoService iUserInfoService;

    @RequestMapping(value="login")
    @ResponseBody
    public String login(HttpServletRequest request, HttpServletResponse response, UserInfo userInfo){
        UserInfo re = iUserInfoService.findUser(userInfo);
        List<MenuTree> menus = iResourceService.getResourceByUser(re.getName());
        PurviewSession purviewSession = new PurviewSession();
        purviewSession.setMenuTrees(menus);
        purviewSession.setUserInfo(re);
        if(re!=null){
            saveSessioin(request,response,purviewSession);
            return "ok";
        }
        return "wrong";
    }

    @RequestMapping(value="menu")
    @ResponseBody
    public String getMenu(@RequestParam(value="username",required = false)String username){
        List<MenuTree> menus = iResourceService.getResourceByUser(username);
        return GsonUtils.bean2json(menus);
    }

    public void saveSessioin(HttpServletRequest request, HttpServletResponse response, PurviewSession purviewSession){
        // 设置Cookie,保持8小时内自动登录
        try {
            Cookie ckUserName = new Cookie(UserInfo.Cookie_Key_UserName, new String(Base64.encodeBase64(purviewSession.getUserInfo().getName().getBytes()))); //用户名
            ckUserName.setMaxAge(60 * 60 * 8);//设置 Cookie 有效期为8小时

            DESEncrypt desEncrypt = new DESEncrypt(UserInfo.Cookie_DESede_Key);
            String encString = desEncrypt.getEncString(purviewSession.getUserInfo().getPassword());

            Cookie ckPwkey = new Cookie(UserInfo.Cookie_Key_PwdKey, new String(Base64.encodeBase64(encString.getBytes()))); //自动登录密钥
            ckPwkey.setMaxAge(60 * 60 * 8); //设置 Cookie 有效期为8小时

            response.addCookie(ckUserName);
            response.addCookie(ckPwkey);
        } catch(Exception e) {
        }

        purviewSession.getUserInfo().setPassword(null);

        SessionHelper.set(request, purviewSession);
    }
}
