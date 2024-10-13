package com.ruoyi.screen.poji.view;


import java.util.Date;

public class ScreenMonitorView {
    private Long userLocationId;

    private String userName;

    private String areaName;

    private String userXyz;

    private Date createTime;

    private Date updateTime;

    private Integer onlineStatus;

    public ScreenMonitorView(Long userLocationId, String userName, String areaName, String userXyz, Date createTime, Date updateTime, Integer onlineStatus) {
        this.userLocationId = userLocationId;
        this.userName = userName;
        this.areaName = areaName;
        this.userXyz = userXyz;
        this.createTime = createTime;
        this.updateTime = updateTime;
        this.onlineStatus = onlineStatus;
    }

    public ScreenMonitorView() {
    }

    public Long getUserLocationId() {
        return userLocationId;
    }

    public void setUserLocationId(Long userLocationId) {
        this.userLocationId = userLocationId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public String getUserXyz() {
        return userXyz;
    }

    public void setUserXyz(String userXyz) {
        this.userXyz = userXyz;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Integer getOnlineStatus() {
        return onlineStatus;
    }

    public void setOnlineStatus(Integer onlineStatus) {
        this.onlineStatus = onlineStatus;
    }

    @Override
    public String toString() {
        return "ScreenMonitorView{" +
                "userLocationId=" + userLocationId +
                ", userName='" + userName + '\'' +
                ", areaName='" + areaName + '\'' +
                ", userXyz='" + userXyz + '\'' +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                ", onlineStatus=" + onlineStatus +
                '}';
    }
}
