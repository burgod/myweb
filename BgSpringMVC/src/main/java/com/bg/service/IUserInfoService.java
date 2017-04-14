package com.bg.service;

import com.bg.model.UserInfo;

import java.util.List;

/**
 * Created by yitop on 2017/3/16.
 */
public interface IUserInfoService {
    public void add(UserInfo info);
    public List<UserInfo> findList();
}
