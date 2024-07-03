package com.ruoyi.system.domain;

import java.util.Date;

public class UserLocation {
    /** 定位用户的唯一标识 */
    private String userName;

    private Long userAreaId;

    /** 用户坐标 */
    private String userXyz;

    /** 创建日期 */
    private Date createTime;

    /** 修改日期 */
    private Date updateTime;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Long getUserAreaId() {
        return userAreaId;
    }

    public void setUserAreaId(Long userAreaId) {
        this.userAreaId = userAreaId;
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

    public UserLocation() {
    }

    public UserLocation(String userName, Long userAreaId, String userXyz) {
        this.userName = userName;
        this.userAreaId = userAreaId;
        this.userXyz = userXyz;
    }

    public UserLocation(String userName, String userXyz, Date createTime, Date updateTime) {
        this.userName = userName;
        this.userXyz = userXyz;
        this.createTime = createTime;
        this.updateTime = updateTime;
    }

    public UserLocation(String userName, Long userAreaId, String userXyz, Date createTime, Date updateTime) {
        this.userName = userName;
        this.userAreaId = userAreaId;
        this.userXyz = userXyz;
        this.createTime = createTime;
        this.updateTime = updateTime;
    }


    @Override
    public String toString() {
        return "UserLocation{" +
                "userName='" + userName + '\'' +
                ", userAreaId=" + userAreaId +
                ", userXyz='" + userXyz + '\'' +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                '}';
    }
}
