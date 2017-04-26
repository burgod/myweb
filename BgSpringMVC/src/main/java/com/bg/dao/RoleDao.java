package com.bg.dao;

import com.bg.model.Role;
import com.bg.model.UserRole;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by yitop on 2017/4/24.
 */
@Repository
public interface RoleDao {
    public void addRole(Role role);
    public List<Role> findList(Map<String,String> map);
    public long findtotal();
    Role findById(String id);
    void deleteRole(String id);
    void updateRole(Role role);
    List<Role> getAllRole();
    void addUserRole(UserRole userRole);
    List<UserRole> findByUserId(String id);
    void deleteByUserName(String username);
}
