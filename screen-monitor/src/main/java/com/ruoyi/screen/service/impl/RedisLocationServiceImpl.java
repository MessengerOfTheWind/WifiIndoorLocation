package com.ruoyi.screen.service.impl;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ruoyi.screen.poji.view.ScreenMonitorView;
import com.ruoyi.screen.service.IRedisLocationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.*;

@Service
public class RedisLocationServiceImpl implements IRedisLocationService {

    @Autowired
    private StringRedisTemplate redisTemplate;

    private final ObjectMapper objectMapper = new ObjectMapper();

    // 更新用户位置信息到 Redis
    // 更新用户位置信息到 Redis，包含所有字段
    // 更新用户位置信息到 Redis
    // 更新用户位置信息到 Redis
    public void updateUserLocation(ScreenMonitorView screenMonitorView) throws JsonProcessingException {
        String locationKey = "user_location:" + screenMonitorView.getUserName();

        // 检查是否已有该用户的位置数据
        String existingData = redisTemplate.opsForValue().get(locationKey);

        // 若为新位置数据，设置创建时间
        if (existingData == null) {
            screenMonitorView.setCreateTime(convertToDate(LocalDateTime.now()));
        } else {
            // 若已有数据，保持创建时间不变
            ScreenMonitorView existingLocation = objectMapper.readValue(existingData, ScreenMonitorView.class);
            screenMonitorView.setCreateTime(existingLocation.getCreateTime());
        }

        // 始终更新更新时间
        screenMonitorView.setUpdateTime(convertToDate(LocalDateTime.now()));

        // 将 ScreenMonitorView 对象序列化为 JSON 字符串并保存到 Redis
        redisTemplate.opsForValue().set(locationKey, objectMapper.writeValueAsString(screenMonitorView));
        System.out.println(getAllUserLocations());
    }
    // 获取所有用户位置信息并返回 List<ScreenMonitorView>
    public List<ScreenMonitorView> getAllUserLocations() throws JsonProcessingException {
        List<ScreenMonitorView> allUserLocations = new ArrayList<>();
        Set<String> keys = redisTemplate.keys("user_location:*");

        if (keys != null) {
            for (String key : keys) {
                String locationData = redisTemplate.opsForValue().get(key);

                if (locationData != null) {
                    // 反序列化 JSON 字符串为 ScreenMonitorView 对象
                    ScreenMonitorView userLocation = objectMapper.readValue(locationData, ScreenMonitorView.class);
                    allUserLocations.add(userLocation);
                }
            }
        }
        return allUserLocations;
    }

    // 将 LocalDateTime 转换为 Date
    private Date convertToDate(LocalDateTime localDateTime) {
        return Date.from(localDateTime.atZone(ZoneId.systemDefault()).toInstant());
    }

}
