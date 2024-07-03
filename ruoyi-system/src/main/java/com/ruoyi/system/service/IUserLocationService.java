package com.ruoyi.system.service;

import com.ruoyi.system.domain.UserLocation;

import java.util.List;

public interface IUserLocationService {

    /**
     * 查询【请填写功能名称】
     *
     * @param userName 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public UserLocation selectUserLocationByUserName(String userName);

    /**
     * 查询【请填写功能名称】列表
     *
     * @param userLocation 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<UserLocation> selectUserLocationList(UserLocation userLocation);

    /**
     * 新增【请填写功能名称】
     *
     * @param userLocation 【请填写功能名称】
     * @return 结果
     */
    public int insertUserLocation(UserLocation userLocation);

}
