package com.bg.service.impl;

import com.bg.dao.RoleDao;
import com.bg.dao.UserInfoDao;
import com.bg.filter.SessionFilter;
import com.bg.model.Role;
import com.bg.model.UserInfo;
import com.bg.model.UserRole;
import com.bg.service.IUserInfoService;
import com.bg.utils.CookieManager;
import com.bg.utils.SessionHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by yitop on 2017/3/16.
 */
@Service
public class UserInfoServiceImpl implements IUserInfoService{

    @Autowired
    private UserInfoDao userInfoDao;

    @Autowired
    private RoleDao roleDao;

    @Transactional
    public void add(UserInfo info,String [] rolesId) {
        userInfoDao.add(info);
        for(int i=0;i<rolesId.length;i++){
            UserRole userRole = new UserRole();
            userRole.setRoleid(Integer.valueOf(rolesId[i]));
            userRole.setUsername(info.getName());
            roleDao.addUserRole(userRole);
        }
    }

    public List<UserInfo> findList(Map<String,String> map) {
        return userInfoDao.findList(map);
    }

    public long findtotal(Map<String,String> map) {
        return userInfoDao.findtotal(map);
    }

    public void deleteUser(String id) {
        userInfoDao.deleteUser(id);
    }

    public UserInfo findByid(String id) {
        return userInfoDao.findByid(id);
    }

    @Transactional
    public void updateUser(UserInfo userInfo,String [] rolesId) {
        List<UserRole> ur = roleDao.findByUserId(userInfo.getId().toString());
        roleDao.deleteByUserName(userInfo.getName());
        for(int i=0;i<rolesId.length;i++){
            UserRole userRole = new UserRole();
            userRole.setRoleid(Integer.valueOf(rolesId[i]));
            userRole.setUsername(userInfo.getName());
            roleDao.addUserRole(userRole);
        }
        userInfoDao.updateUser(userInfo);
    }

    public UserInfo findUser(UserInfo userInfo) {
        return userInfoDao.findUser(userInfo);
    }

    public void logout() {
        SessionFilter.HttpRequestContext.getHttpSession().removeAttribute(SessionHelper.USER_SESSION);

        // 清除cookie信息
        CookieManager cm = new CookieManager();
        Cookie[] cookies = SessionFilter.HttpRequestContext.get().getRequest().getCookies();

        Cookie ckUserName = cm.getCookieValue(cookies, UserInfo.Cookie_Key_UserName);
        Cookie ckPwkey = cm.getCookieValue(cookies, UserInfo.Cookie_Key_PwdKey);

        if (ckUserName != null) {
            ckUserName.setMaxAge(0);

            SessionFilter.HttpRequestContext.get().getResponse().addCookie(ckUserName);
        }

        if(ckPwkey != null) {
            ckPwkey.setMaxAge(0);

            SessionFilter.HttpRequestContext.get().getResponse().addCookie(ckPwkey);
        }
    }

    public void updatePwd(Map<String, String> map) {
        userInfoDao.updatePwd(map);
    }
}
