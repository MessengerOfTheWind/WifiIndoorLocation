package com.ruoyi.system.service.impl;


import com.ruoyi.system.domain.Aptable;
import com.ruoyi.system.domain.Positiontable;
import com.ruoyi.system.domain.UserLocation;
import com.ruoyi.system.domain.view.UserWifiRssi;
import com.ruoyi.system.locationAlgorithm.LocationAlgorithm.TempLocation;
import com.ruoyi.system.locationAlgorithm.LocationAlgorithm.WifiRssiMatcher;
import com.ruoyi.system.locationAlgorithm.judgeArea.FindArea;
import com.ruoyi.system.mapper.AptableMapper;
import com.ruoyi.system.mapper.PositiontableMapper;
import com.ruoyi.system.mapper.UserLocationMapper;
import com.ruoyi.system.mapper.view.WifiTableViewMapper;
import com.ruoyi.system.service.IUserLocationService;
import com.ruoyi.system.domain.model.WifiTableView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

@Service
public class UserLocationImpl implements IUserLocationService {
    @Autowired
    private UserLocationMapper userLocationMapper;

    @Autowired
    private AptableMapper aptableMapper;

    @Autowired
    private WifiTableViewMapper wifiTableViewMapper;

    @Autowired
    private FindArea findArea;

    @Autowired
    private PositiontableMapper positiontableMapper;

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

    @Override
    public String computeUserLocation(UserWifiRssi userWifiRssi) {
        // 判断当前用户属于哪个位置，目前我们假定就在区域1，区域1的id是37,获取当前位置下的apList
        Long areaId = findArea.findAreaByWifiRssi(userWifiRssi);
        List<Aptable> aptableList = aptableMapper.selectAptableList(new Aptable(areaId));
        // 得到赋予的权重
        Map<Long, Integer> apWeightMap = new HashMap<>();
        for (Aptable aptable: aptableList
        ) {
            // 通过apName去查找apId
            Long thisApId = aptable.getApId();
            apWeightMap.put(thisApId, aptable.getApWeight());
        }
        String user = userWifiRssi.getUser();
        List<UserWifiRssi.WifiRssi> wifiRssiList = userWifiRssi.getWifiRssiList();
//        List<UserWifiRssi.WifiRssi> wifiRssiList = userWifiRssi.getWifiRssiList().stream()
//                .sorted(Comparator.comparingInt(UserWifiRssi.WifiRssi::getRssi).reversed())
//                .limit(4)
//                .collect(Collectors.toList());
        // 给wifiRssiList用筛选，只留下在区域1中有的ap的信号值
        List<UserWifiRssi.WifiRssi> exitedWifiRssiList  = wifiRssiList.stream()
                .filter(itemA -> aptableList.stream()
                        .anyMatch(itemB -> itemB.getApName().equals(itemA.getApName())))
                .collect(Collectors.toList());
        // 把重复的值去除，有时候可能我们会通过多次扫描得到的结果实现
        List<UserWifiRssi.WifiRssi> processedList = exitedWifiRssiList.stream()
                .collect(Collectors.groupingBy(
                        UserWifiRssi.WifiRssi::getApName,           // 按 apName 分组
                        Collectors.averagingInt(UserWifiRssi.WifiRssi::getRssi) // 计算每组 RSSI 的平均值
                ))
                .entrySet().stream()
                .map(entry -> new UserWifiRssi.WifiRssi(entry.getKey(), (int) Math.round(entry.getValue())))
                .collect(Collectors.toList());
        // 把processedList建立map，以便于后续的比对,key=apId,value=Rssi
//        List<UserWifiRssi.WifiRssi> process2List = processedList.stream()
//                .sorted(Comparator.comparingInt(UserWifiRssi.WifiRssi::getRssi).reversed()) // Changed to descending order
//                .limit(4)
//                .collect(Collectors.toList());
        Map<Long, Integer> userMap = new HashMap<>();
        for (UserWifiRssi.WifiRssi wifiRssi: processedList
        ) {
            // 通过apName去查找apId
            Long thisApId = aptableMapper.selectByApName(wifiRssi.getApName()).getApId();
            userMap.put(thisApId, wifiRssi.getRssi());
        }
        //查找所处区域的所有信号信息
        List<WifiTableView> wifiTableViews = wifiTableViewMapper.selectWifiTableViewByAreaId(areaId);

        // 先按poId分类，然后在每个分类内将apId和wiRssi转换为Map
        Map<Long, Map<Long, Integer>> groupedByPoIdAndMapped = wifiTableViews.stream()
                .collect(Collectors.groupingBy(
                        WifiTableView::getPoId, // 先按poId分类
                        Collectors.toMap(WifiTableView::getApId, WifiTableView::getWiRssi) // 再将每个分类内的apId和wiRssi转换为Map
                ));

        // 输出分组后的Map
//        groupedByPoIdAndMapped.forEach((poId, map) -> {
//            System.out.println("poId: " + poId);
//            map.forEach((apId, wiRssi) -> {
//                System.out.println("  apId: " + apId + ", wiRssi: " + wiRssi);
//            });
//        });

        WifiRssiMatcher wifiRssiMatcher = new WifiRssiMatcher();
        Long positionId = wifiRssiMatcher.findClosestPoId(userMap, groupedByPoIdAndMapped, apWeightMap);

        Positiontable  positiontable = positiontableMapper.selectPositiontableByPoId(positionId);

        String xyz = getLocation(userMap);
//        String xyz = positiontable.getPoX().toString() +", "+ positiontable.getPoY().toString() +", "+ positiontable.getPoZ().toString();
////        System.out.println(xyz);
//
        UserLocation userLocation = new UserLocation(user,areaId,xyz);
        //检查是否存在
        UserLocation exitedUser = userLocationMapper.selectUserLocationByUserName(user);
        if (exitedUser == null){
            userLocationMapper.insertUserLocation(userLocation);
        }else {
            userLocationMapper.updateUserLocation(userLocation);
        }


        return xyz;
    }

    public String getLocation(Map<Long, Integer> targetMap){
        //找到最前和次强的信号值
        Long firstApId = -1L;
        Long secApId = -1L;
        Integer firstRssi = -100;
        Integer secRssi = -100;
        for (Long apId: targetMap.keySet()
        ) {
            Integer thisRssi = targetMap.get(apId);
            if(thisRssi > firstRssi){
                firstRssi = thisRssi;
                firstApId = apId;
            }else if(thisRssi > secRssi){
                secRssi = thisRssi;
                secApId = apId;
            }
        }
        //如果最强的信号>-55,返回apId
        if(firstRssi > -55){
            Long apId = firstApId;
            Long poId = aptableMapper.selectAptableByApId(apId).getPoId();
            Positiontable positiontable = positiontableMapper.selectPositiontableByPoId(poId);
            String xyz = positiontable.getPoX().toString() +", "+ positiontable.getPoY().toString() +", "+ positiontable.getPoZ().toString();
            return xyz;
        }else if (firstRssi - secRssi<8){
            Long firstPoId = aptableMapper.selectAptableByApId(firstApId).getPoId();
            Long secPoId = aptableMapper.selectAptableByApId(secApId).getPoId();
            Positiontable firstPosition = positiontableMapper.selectPositiontableByPoId(firstPoId);
            Positiontable secPosition = positiontableMapper.selectPositiontableByPoId(secPoId);
            Integer x = Math.round((firstPosition.getPoX() + secPosition.getPoX())/2);
            Integer y = Math.round((firstPosition.getPoY() + secPosition.getPoY())/2);
            String xyz = x.toString() + ", "+ y.toString() + ", 1";
            return xyz;
        }else{
            return "7, 7 ,1";
        }
    }

}
