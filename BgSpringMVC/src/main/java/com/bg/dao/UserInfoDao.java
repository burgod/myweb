package com.bg.dao;

import com.bg.model.UserInfo;
import org.springframework.stereotype.Repository;

/**
 * Created by yitop on 2017/3/16.
 */
@Repository
public interface UserInfoDao {
    public void add(UserInfo info);
}
