package com.bg.model;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.Date;

/**
 * Created by yitop on 2017/3/16.
 */
public class UserInfo {

    public static final String Cookie_Key_UserName = "autoUserName";
    public static final String Cookie_Key_PwdKey = "autoPwKey";
    public static final String Cookie_DESede_Key = "ThisIsTwbKey@_2014072315";
    private Integer id;
    private String name;
    private Integer age;
    private String password;
    private String phone;
    private String email;
    private Date createtime;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }
}
