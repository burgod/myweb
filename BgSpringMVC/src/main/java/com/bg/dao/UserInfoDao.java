package com.bg.dao;

import com.bg.model.UserInfo;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by yitop on 2017/3/16.
 */
@Repository
public interface UserInfoDao {
    public void add(UserInfo info);
    public List<UserInfo> findList(Map<String,String> map);
    public long findtotal();
    public void deleteUser(String id);
    public UserInfo findByid(String id);
    public void updateUser(UserInfo info);
}
