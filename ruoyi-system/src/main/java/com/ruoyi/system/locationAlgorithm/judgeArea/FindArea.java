package com.ruoyi.system.locationAlgorithm.judgeArea;

import com.ruoyi.system.domain.Aptable;
import com.ruoyi.system.domain.view.UserWifiRssi;
import com.ruoyi.system.mapper.AptableMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Component
public class FindArea {
    @Autowired
    private  AptableMapper aptableMapper;

    public  Long findAreaByWifiRssi(UserWifiRssi userWifiRssi){
        // 获取数据中的ap集合
        List<Aptable> aptableList = aptableMapper.selectAptableList(new Aptable());
        // 获取从手机端获取到的wifi信号，这可能包含其他wifi信号
        List<UserWifiRssi.WifiRssi> wifiRssiList = userWifiRssi.getWifiRssiList();
        // 对手机端的wifi信号做出筛选
        List<UserWifiRssi.WifiRssi> exitedWifiRssiList  = wifiRssiList.stream()
                .filter(itemA -> aptableList.stream()
                        .anyMatch(itemB -> itemB.getApName().equals(itemA.getApName())))
                .collect(Collectors.toList());
        // 判断是否获取到了周围wifi信号
        if (exitedWifiRssiList.size() <= 0){
            return -1L;
        }else{
            // 对获取到的信号值进行降序排序
            exitedWifiRssiList.sort(Comparator.comparing(UserWifiRssi.WifiRssi::getRssi).reversed());
            Map<Long, Integer> countApMap = new HashMap<>();
//            // 定义count用来统计每个单位所处的信号
//            for (UserWifiRssi.WifiRssi wifiRssi: exitedWifiRssiList
//                 ) {
//                String thisApName = wifiRssi.getApName();
//                Aptable aptable = aptableMapper.selectByApName(thisApName);
//                // 对当前获取的apTable做统计得到所处区域
//                Long thisAreaId = aptable.getAreaId();
//                countApMap.put(thisAreaId, countApMap.getOrDefault(thisAreaId, 0) + 1);
//            }
//            // 得到出现次数最多的地区单位
//            // 初始化最大值变量
//            Long maxKey = -1L;
//            Integer maxValue = Integer.MIN_VALUE;
//
//            // 遍历Map，找到最大值的key
//            for (Map.Entry<Long, Integer> entry : countApMap.entrySet()) {
//                if (entry.getValue() > maxValue) {
//                    maxValue = entry.getValue();
//                    maxKey = entry.getKey();
//                }
//            }

            // 找信号最强的
            String thisApName = exitedWifiRssiList.get(0).getApName();
            Aptable aptable = aptableMapper.selectByApName(thisApName);
            Long thisAreaId = aptable.getAreaId();
//            return maxKey;
            return thisAreaId;
        }
    }

}
