package com.bg.service;

import com.bg.model.Role;

import java.util.List;
import java.util.Map;

/**
 * Created by yitop on 2017/4/24.
 */
public interface IRoleService {
    public void addRole(Role role);
    public List<Role> findList(Map<String,String> map);
    public long findtotal();
}
