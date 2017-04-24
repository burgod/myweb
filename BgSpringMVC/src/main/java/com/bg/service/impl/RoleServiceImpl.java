package com.bg.service.impl;

import com.bg.dao.RoleDao;
import com.bg.model.Role;
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

    public RoleDao getRoleDao() {
        return roleDao;
    }

    public void setRoleDao(RoleDao roleDao) {
        this.roleDao = roleDao;
    }
}
