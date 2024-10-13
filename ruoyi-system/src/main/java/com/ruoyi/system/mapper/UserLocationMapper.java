package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.UserLocation;

/**
 * 【请填写功能名称】Mapper接口
 *
 * @author ruoyi
 * @date 2024-03-30
 */
public interface UserLocationMapper
{
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

    public int updateUserLocation(UserLocation userLocation);

}
