package com.bg.service.impl;

import com.bg.dao.RoleDao;
import com.bg.dao.UserInfoDao;
import com.bg.model.Role;
import com.bg.model.UserInfo;
import com.bg.model.UserRole;
import com.bg.service.IUserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
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

    public long findtotal() {
        return userInfoDao.findtotal();
    }

    public void deleteUser(String id) {
        userInfoDao.deleteUser(id);
    }

    public UserInfo findByid(String id) {
        return userInfoDao.findByid(id);
    }

    public void updateUser(UserInfo userInfo) {
        userInfoDao.updateUser(userInfo);
    }

}
