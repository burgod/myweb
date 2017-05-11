package com.bg.service.impl;

import com.bg.dao.RoleDao;
import com.bg.model.Role;
import com.bg.model.UserRole;
import com.bg.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by yitop on 2017/4/24.
 */
@Service
public class RoleServiceImpl implements IRoleService{

    @Autowired
    private RoleDao roleDao;

    @Transactional
    public void addRole(Role role,String[] ztreeIds) {
        roleDao.addRole(role);
        for(String s:ztreeIds){
            Map<String,String> map = new HashMap<String,String>();
            map.put("roleid",role.getRoleid().toString());
            map.put("resourceid",s);
            roleDao.addRoleResource(map);
        }
    }

    public List<Role> findList(Map<String, String> map) {
        return roleDao.findList(map);
    }

    public long findtotal(Map<String,String> map) {
        return roleDao.findtotal(map);
    }

    public Role findById(String id) {
        return roleDao.findById(id);
    }

    public void deleteRole(String id) {
        roleDao.deleteRole(id);
    }

    @Transactional
    public void updateRole(Role role,String[] ztreeIds) {
        roleDao.updateRole(role);
        roleDao.delRoleResource(role.getRoleid().toString());
        for(String s:ztreeIds){
            Map<String,String> map = new HashMap<String,String>();
            map.put("roleid",role.getRoleid().toString());
            map.put("resourceid",s);
            roleDao.addRoleResource(map);
        }
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

    public int findRoleByName(String rolename) {
        return roleDao.findRoleByName(rolename);
    }

    public int findByRoleNotId(Role role) {
        return roleDao.findByRoleNotId(role);
    }
}
