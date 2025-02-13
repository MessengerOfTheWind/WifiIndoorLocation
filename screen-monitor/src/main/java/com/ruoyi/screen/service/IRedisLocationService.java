package com.ruoyi.screen.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.ruoyi.screen.poji.view.ScreenMonitorView;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


public interface IRedisLocationService {
    // 更新用户位置信息到 Redis
    public void updateUserLocation(ScreenMonitorView screenMonitorView) throws JsonProcessingException ;

    // 获取所有用户的位置信息并返回为 List
    public List<ScreenMonitorView> getAllUserLocations() throws JsonProcessingException;
}
