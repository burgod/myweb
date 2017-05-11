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
    void add(UserInfo info);
    List<UserInfo> findList(Map<String,String> map);
    long findtotal(Map<String,String> map);
    void deleteUser(String id);
    UserInfo findByid(String id);
    void updateUser(UserInfo info);
    UserInfo findUser(UserInfo info);
    void updatePwd(Map<String,String> map);
}
