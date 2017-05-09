package com.bg.service;

import com.bg.model.UserInfo;

import java.util.List;
import java.util.Map;

/**
 * Created by yitop on 2017/3/16.
 */
public interface IUserInfoService {
    void add(UserInfo info,String [] rolesId);
    List<UserInfo> findList(Map<String,String> map);
    long findtotal(Map<String,String> map);
    void deleteUser(String id);
    UserInfo findByid(String id);
    void updateUser(UserInfo userInfo,String [] rolesId);
    UserInfo findUser(UserInfo userInfo);
}
