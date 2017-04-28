package com.bg.model;

/**
 * Created by yitop on 2017/4/28.
 */
public class ResourceTable {
    private Integer resourceid;
    private String resourcename;
    private String resourceurl;
    private String presourcename;
    private String resourcetype;

    public Integer getResourceid() {
        return resourceid;
    }

    public void setResourceid(Integer resourceid) {
        this.resourceid = resourceid;
    }

    public String getResourcename() {
        return resourcename;
    }

    public void setResourcename(String resourcename) {
        this.resourcename = resourcename;
    }

    public String getResourceurl() {
        return resourceurl;
    }

    public void setResourceurl(String resourceurl) {
        this.resourceurl = resourceurl;
    }

    public String getPresourcename() {
        return presourcename;
    }

    public void setPresourcename(String presourcename) {
        this.presourcename = presourcename;
    }

    public String getResourcetype() {
        return resourcetype;
    }

    public void setResourcetype(String resourcetype) {
        this.resourcetype = resourcetype;
    }
}
