package com.ruoyi.system.domain.localtion;

public class LocationUser {
    /** 用户的唯一标识 **/
    private Long userId;

    /** 用户名 */
    private String userName;

    /** 是否开启导航权限 */
    private Boolean ifStartGuide;

    /** 是否登录 */
    private Boolean ifOnline;

    /** X坐标 */
    private Float poX;

    /** Y坐标 */
    private Float poY;

    /** Z坐标 */
    private Float PoZ;

    public LocationUser(Long userId, String userName) {
        this.userId = userId;
        this.userName = userName;
    }


    public LocationUser(Long userId) {
        this.userId = userId;
    }

    public LocationUser(String userName) {
        this.userName = userName;
    }

    public LocationUser() {
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    @Override
    public String toString() {
        return "LocationUser{" +
                "userId=" + userId +
                ", userName='" + userName + '\'' +
                '}';
    }
}
