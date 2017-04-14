package com.bg.dao;

import com.bg.model.UserInfo;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by yitop on 2017/3/16.
 */
@Repository
public interface UserInfoDao {
    public void add(UserInfo info);
    public List<UserInfo> findList();
}
