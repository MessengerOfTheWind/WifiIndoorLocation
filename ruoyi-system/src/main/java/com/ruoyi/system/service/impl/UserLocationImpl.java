package com.ruoyi.system.service.impl;


import com.ruoyi.system.domain.UserLocation;
import com.ruoyi.system.mapper.UserLocationMapper;
import com.ruoyi.system.service.IUserLocationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class UserLocationImpl implements IUserLocationService {
    @Autowired
    private UserLocationMapper userLocationMapper;


    @Override
    public UserLocation selectUserLocationByUserName(String userName) {
        return userLocationMapper.selectUserLocationByUserName(userName);
    }

    @Override
    public List<UserLocation> selectUserLocationList(UserLocation userLocation) {
        return userLocationMapper.selectUserLocationList(userLocation);
    }

    @Override
    public int insertUserLocation(UserLocation userLocation) {
        Date date = new Date();
        userLocation.setCreateTime(new java.sql.Date(date.getTime()));
        return userLocationMapper.insertUserLocation(userLocation);
    }
}
