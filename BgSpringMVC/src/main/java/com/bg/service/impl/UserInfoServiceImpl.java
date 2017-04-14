package com.bg.service.impl;

import com.bg.dao.UserInfoDao;
import com.bg.model.UserInfo;
import com.bg.service.IUserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by yitop on 2017/3/16.
 */
@Service
public class UserInfoServiceImpl implements IUserInfoService{

    @Autowired
    private UserInfoDao userInfoDao;

    public void add(UserInfo info) {
        userInfoDao.add(info);
    }

    public List<UserInfo> findList() {
        return userInfoDao.findList();
    }

    public UserInfoDao getUserInfoDao() {
        return userInfoDao;
    }

    public void setUserInfoDao(UserInfoDao userInfoDao) {
        this.userInfoDao = userInfoDao;
    }

}
