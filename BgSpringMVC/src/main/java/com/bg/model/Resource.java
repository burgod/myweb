package com.bg.model;

/**
 * Created by yitop on 2017/4/26.
 */
public class Resource {
    private Integer resourceid;
    private String resourcename;
    private String resourceurl;
    private Integer presourceid;
    private Integer resourcetype;

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

    public Integer getPresourceid() {
        return presourceid;
    }

    public void setPresourceid(Integer presourceid) {
        this.presourceid = presourceid;
    }

    public Integer getResourcetype() {
        return resourcetype;
    }

    public void setResourcetype(Integer resourcetype) {
        this.resourcetype = resourcetype;
    }
}
