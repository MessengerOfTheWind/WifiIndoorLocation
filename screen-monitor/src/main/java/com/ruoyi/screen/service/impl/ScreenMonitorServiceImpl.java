package com.ruoyi.screen.service.impl;

import com.ruoyi.screen.mapper.ScreenMonitorMapper;
import com.ruoyi.screen.poji.view.ScreenMonitorView;
import com.ruoyi.screen.poji.vo.PersonDistributionDonut;
import com.ruoyi.screen.service.IScreenMonitorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.*;


@Service
public class ScreenMonitorServiceImpl implements IScreenMonitorService {

    @Autowired
    private ScreenMonitorMapper screenMonitorMapper;
    @Override
    public List<PersonDistributionDonut> GetPersonDistributionDonut(){
        ScreenMonitorView screenMonitorView = new ScreenMonitorView();
        List<ScreenMonitorView> screenMonitorViewList = screenMonitorMapper.selectScreenMonitorViewList(screenMonitorView);
        Map<String, Integer> personMap = new HashMap<>();
        for (ScreenMonitorView screen: screenMonitorViewList
             ) {
            String areaName = screen.getAreaName();
            if(screen.getOnlineStatus() == "2"){
                personMap.put(areaName, personMap.getOrDefault(areaName, 0) + 1);
            }
        }
        List<PersonDistributionDonut> personDistributionDonutList = new ArrayList<>();
        //map转list
        for (String name: personMap.keySet()
             ) {
            PersonDistributionDonut tmpPerson = new PersonDistributionDonut(name, personMap.get(name));
            personDistributionDonutList.add(tmpPerson);
        }
        return personDistributionDonutList;
    }

    @Override
    public List<ScreenMonitorView> selectScreenMonitorViewList(ScreenMonitorView screenMonitorView) {
        return screenMonitorMapper.selectScreenMonitorViewList(screenMonitorView);
    }

    @Override
    public List<List<String>> GetPersonDistributionExcel() {
        ScreenMonitorView screenMonitorView = new ScreenMonitorView();
        List<ScreenMonitorView> screenMonitorViewList = screenMonitorMapper.selectScreenMonitorViewList(screenMonitorView);
        List<List<String>> res = new ArrayList<>();
        for (ScreenMonitorView sc: screenMonitorViewList
             ) {
            List<String> perMes = new ArrayList<>();
            perMes.add(sc.getUserName());
            perMes.add(sc.getAreaName());
            perMes.add(sc.getUserXyz());
            res.add(perMes);
        }
        return res;
    }

    @Override
    public List<List<String>> GetPersonDistributionDensity() {
        ScreenMonitorView screenMonitorView = new ScreenMonitorView();
        List<ScreenMonitorView> screenMonitorViewList = screenMonitorMapper.selectScreenMonitorViewList(screenMonitorView);
        List<List<String>> res = new ArrayList<>();

        // 使用Map来统计每个area_name的数量
        Map<String, Integer> areaCountMap = new HashMap<>();

        for (ScreenMonitorView view : screenMonitorViewList) {
            // 只统计 online_status 为 2 的数据
            if (Integer.valueOf(2).equals(view.getOnlineStatus())) {
                String areaName = view.getAreaName();
                areaCountMap.put(areaName, areaCountMap.getOrDefault(areaName, 0) + 1);
            }
        }

        // 将结果转换为 List<List<String>>
        for (Map.Entry<String, Integer> entry : areaCountMap.entrySet()) {
            List<String> tempList = new ArrayList<>();
            tempList.add(entry.getKey()); // area_name
            tempList.add(String.valueOf(entry.getValue())); // 统计数量
            res.add(tempList);
        }

        return res;
    }


    //传到前端的数据为：获取当前时间，将过去一小时分以十分钟为一个区间分区，再将每个区间的人数统计传到前端，以下为示例：
//    [
//            ["区域1", "2024-10-12 13:00:00", "1"],
//            ["区域1", "2024-10-12 13:10:00", "1"],
//            ["区域1", "2024-10-12 13:20:00", "1"],
//            ["区域2", "2024-10-12 13:10:00", "1"],
//            ["区域2", "2024-10-12 13:20:00", "1"]
//            ]

    @Override
    public List<List<String>> GetPersonDistributionEchart() {
        // 获取当前时间
        LocalDateTime now = LocalDateTime.now();
        // 计算一个小时之前的时间
        LocalDateTime oneHourAgo = now.minusHours(1);

        // 将时间转换为数据库所需的格式
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String nowStr = now.format(formatter);
        String oneHourAgoStr = oneHourAgo.format(formatter);

        Date nowDate = null;
        Date oneHourAgoDate = null;

        // 将字符串转换为 Date
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        try {
            nowDate = dateFormat.parse(nowStr);
            oneHourAgoDate = dateFormat.parse(oneHourAgoStr);

            // 输出结果
            System.out.println("现在的时间 (Date): " + nowDate);
            System.out.println("一小时前的时间 (Date): " + oneHourAgoDate);
        } catch (ParseException e) {
            e.printStackTrace();
        }


        // 查询过去一个小时的数据
        List<ScreenMonitorView> screenMonitorViewList = screenMonitorMapper.selectScreenMonitorViewListByTime(oneHourAgoDate, nowDate);
        List<List<String>> res = new ArrayList<>();


//        // 检查查询结果
//        if (screenMonitorViewList.isEmpty()) {
//            System.out.println("没数据");
//        } else {
//            System.out.println("Data retrieved: " + screenMonitorViewList.size() + " records.");
//        }

        // 使用Map来统计每个区域每10分钟的数量
        Map<String, Map<String, Integer>> areaCountMap = new HashMap<>();

        for (ScreenMonitorView view : screenMonitorViewList) {
            // 只统计 online_status 为 2 的数据
            if ((Integer.valueOf(2)).equals(view.getOnlineStatus())) {
                String areaName = view.getAreaName();
                Date updateTime = view.getUpdateTime();

                // 将 Date 转换为 LocalDateTime
                LocalDateTime truncatedTime = updateTime.toInstant()
                        .atZone(ZoneId.systemDefault())
                        .toLocalDateTime()
                        .truncatedTo(ChronoUnit.MINUTES);

                int minute = truncatedTime.getMinute();
                if (minute % 10 != 0) {
                    // 向下取整到最近的十分钟
                    minute = (minute / 10) * 10;
                }
                LocalDateTime timeSlot = truncatedTime.withMinute(minute).withSecond(0).withNano(0);

                // 格式化为字符串
                String timeSlotStr = timeSlot.format(formatter);

                // 初始化区域和时间段的映射
                areaCountMap.putIfAbsent(areaName, new HashMap<>());
                areaCountMap.get(areaName).put(timeSlotStr, areaCountMap.get(areaName).getOrDefault(timeSlotStr, 0) + 1);
            }
        }

        // 将结果转换为 List<List<String>>
        for (Map.Entry<String, Map<String, Integer>> areaEntry : areaCountMap.entrySet()) {
            String areaName = areaEntry.getKey();
            Map<String, Integer> timeCounts = areaEntry.getValue();

            for (Map.Entry<String, Integer> timeEntry : timeCounts.entrySet()) {
                List<String> tempList = new ArrayList<>();
                tempList.add(areaName); // area_name
                tempList.add(timeEntry.getKey()); // 10分钟时间段
                tempList.add(String.valueOf(timeEntry.getValue())); // 统计数量
                res.add(tempList);
            }
        }

        return res;
    }


    //传到前端的数据为：获取当前时间，将过去一小时的每个区域的人数统计，以下为示例：
//    [
//            ["区域A", "3"],
//            ["区域B", "5"],
//            ["区域C", "2"]
//            ]

    @Override
    public List<List<String>> GetPersonDistributionPredict() {
        // 获取当前时间
        LocalDateTime now = LocalDateTime.now();
        // 计算一个小时之前的时间
        LocalDateTime oneHourAgo = now.minusHours(1);

        // 将时间转换为数据库所需的格式
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String nowStr = now.format(formatter);
        String oneHourAgoStr = oneHourAgo.format(formatter);

        Date nowDate = null;
        Date oneHourAgoDate = null;

        // 将字符串转换为 Date
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        try {
            nowDate = dateFormat.parse(nowStr);
            oneHourAgoDate = dateFormat.parse(oneHourAgoStr);

            // 输出结果
            System.out.println("现在的时间 (Date): " + nowDate);
            System.out.println("一小时前的时间 (Date): " + oneHourAgoDate);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        // 查询过去一个小时的数据
        List<ScreenMonitorView> screenMonitorViewList = screenMonitorMapper.selectScreenMonitorViewListByTime(oneHourAgoDate, nowDate);
        List<List<String>> res = new ArrayList<>();

        // 使用Map来统计每个区域的数量
        Map<String, Integer> areaCountMap = new HashMap<>();

        for (ScreenMonitorView view : screenMonitorViewList) {
            // 只统计 online_status 为 2 的数据
            if (Integer.valueOf(2).equals(view.getOnlineStatus())) {
                String areaName = view.getAreaName();
                areaCountMap.put(areaName, areaCountMap.getOrDefault(areaName, 0) + 1);
            }
        }

        // 将结果转换为 List<List<String>>
        for (Map.Entry<String, Integer> entry : areaCountMap.entrySet()) {
            List<String> tempList = new ArrayList<>();
            tempList.add(entry.getKey()); // area_name
            tempList.add(String.valueOf(entry.getValue())); // 统计数量
            res.add(tempList);
        }

        return res;
    }





}
