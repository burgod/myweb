package com.bg.service.impl;

import com.bg.dao.RoleDao;
import com.bg.model.Role;
import com.bg.model.UserRole;
import com.bg.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by yitop on 2017/4/24.
 */
@Service
public class RoleServiceImpl implements IRoleService{

    @Autowired
    private RoleDao roleDao;

    public void addRole(Role role) {
        roleDao.addRole(role);
    }

    public List<Role> findList(Map<String, String> map) {
        return roleDao.findList(map);
    }

    public long findtotal() {
        return roleDao.findtotal();
    }

    public Role findById(String id) {
        return roleDao.findById(id);
    }

    public void deleteRole(String id) {
        roleDao.deleteRole(id);
    }

    public void updateRole(Role role) {
        roleDao.updateRole(role);
    }

    public List<Role> getAllRole() {
        return roleDao.getAllRole();
    }

    public void addUserRole(UserRole userRole) {
        roleDao.addUserRole(userRole);
    }

    public List<UserRole> findByUserId(String id) {
        return roleDao.findByUserId(id);
    }
}
