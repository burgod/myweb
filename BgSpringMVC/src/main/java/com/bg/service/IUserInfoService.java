package com.bg.service;

import com.bg.model.UserInfo;

import java.util.List;
import java.util.Map;

/**
 * Created by yitop on 2017/3/16.
 */
public interface IUserInfoService {
    public void add(UserInfo info,String [] rolesId);
    public List<UserInfo> findList(Map<String,String> map);
    public long findtotal();
    public void deleteUser(String id);
    public UserInfo findByid(String id);
    public void updateUser(UserInfo userInfo,String [] rolesId);
}
