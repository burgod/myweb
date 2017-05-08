package com.bg.model;

import java.util.Date;

/**
 * Created by luyb on 2017/4/24.
 */
public class Role {
    private Integer roleid;
    private String rolename;
    private Date createtime;
    private Date updatetime;
    private String createuser;
    private String ztreeIds;

    public Integer getRoleid() {
        return roleid;
    }

    public void setRoleid(Integer roleid) {
        this.roleid = roleid;
    }

    public String getRolename() {
        return rolename;
    }

    public void setRolename(String rolename) {
        this.rolename = rolename;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }

    public String getCreateuser() {
        return createuser;
    }

    public void setCreateuser(String createuser) {
        this.createuser = createuser;
    }

    public String getZtreeIds() {
        return ztreeIds;
    }

    public void setZtreeIds(String ztreeIds) {
        this.ztreeIds = ztreeIds;
    }
}
