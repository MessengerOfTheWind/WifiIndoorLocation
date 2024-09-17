package com.ruoyi.system.locationAlgorithm.LocationAlgorithm;

import java.util.Map;

public class WifiRssiMatcher {
    // 计算两个集合之间的距离，只比较共有的apId
    public double calculateDistance(Map<Long, Integer> map1, Map<Long, Integer> map2) {
        double distance = 0.0;
        int commonCount = 0;

        for (Long apId : map1.keySet()) {
            if (map2.containsKey(apId)) {
                int rssi1 = map1.get(apId);
                int rssi2 = map2.get(apId);
                // 使用乘法计算距离并处理距离为0的情况
                distance *= Math.abs(rssi1 - rssi2);
                if (distance == 0) {
                    distance = 1;
                }
                commonCount++;
            }
        }

        if (commonCount == 0) {
            return Double.MAX_VALUE; // 如果没有共同的apId，返回最大值
        }

        return distance / commonCount; // 返回平均距离
    }

    // 寻找与传入的RSSI Map最接近的poId
    public Long findClosestPoId(Map<Long, Integer> targetMap, Map<Long, Map<Long, Integer>> allData) {
        double minDistance = Double.MAX_VALUE;
        Long closestPoId = -1L;

        for (Map.Entry<Long, Map<Long, Integer>> entry : allData.entrySet()) {
            Long poId = entry.getKey();
            Map<Long, Integer> currentMap = entry.getValue();
            double distance = calculateDistance(targetMap, currentMap);
            if (distance < minDistance) {
                minDistance = distance;
                closestPoId = poId;
            }
        }

        return closestPoId; // 返回最接近的poId
    }
}
