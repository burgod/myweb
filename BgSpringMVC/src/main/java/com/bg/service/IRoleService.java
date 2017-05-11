package com.bg.service;

import com.bg.model.Role;
import com.bg.model.UserRole;

import java.util.List;
import java.util.Map;

/**
 * Created by yitop on 2017/4/24.
 */
public interface IRoleService {
    void addRole(Role role,String[] ztreeIds);
    List<Role> findList(Map<String,String> map);
    long findtotal(Map<String,String> map);
    Role findById(String id);
    void deleteRole(String id);
    void updateRole(Role role,String[] ztreeIds);
    List<Role> getAllRole();
    void addUserRole(UserRole userRole);
    List<UserRole> findByUserId(String id);
    int findRoleByName(String rolename);
    int findByRoleNotId(Role role);
}
