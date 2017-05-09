package com.bg.model;

import com.bg.common.MenuTree;

import java.util.List;

/**
 * Created by luyb on 2017/5/9.
 */
public class PurviewSession {
    private List<MenuTree> menuTrees;
    private UserInfo userInfo;

    public List<MenuTree> getMenuTrees() {
        return menuTrees;
    }

    public void setMenuTrees(List<MenuTree> menuTrees) {
        this.menuTrees = menuTrees;
    }

    public UserInfo getUserInfo() {
        return userInfo;
    }

    public void setUserInfo(UserInfo userInfo) {
        this.userInfo = userInfo;
    }
}
