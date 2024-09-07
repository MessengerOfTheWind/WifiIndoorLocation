package com.ruoyi.web.controller.tool.spearmanr;
import com.ruoyi.common.core.domain.AjaxResult;
import org.apache.commons.math3.stat.correlation.SpearmansCorrelation;

import java.util.ArrayList;
import java.util.List;

public class WifiFingerprintLocalization {

    public static String speGetLocation(List<Fingerprint> fingerprintDatabase, double[] givenRssi) {
        // 示例指纹库 (RSSI向量, 位置坐标)
//        List<Fingerprint> fingerprintDatabase = new ArrayList<>();
//        fingerprintDatabase.add(new Fingerprint(new double[]{-60, -70, -80, -90}, new double[]{1, 1}));
//        fingerprintDatabase.add(new Fingerprint(new double[]{-50, -60, -70, -85}, new double[]{2, 2}));
//        fingerprintDatabase.add(new Fingerprint(new double[]{-55, -65, -75, -95}, new double[]{3, 3}));
//
//        // 给定的RSSI向量
//        double[] givenRssi = {-58, -68, -78, -88};

        // 初始化变量存储最高相关系数和对应坐标
        double maxCorrelation = Double.NEGATIVE_INFINITY;
        String estimatedCoords = null;

        // 创建斯皮尔曼相关系数计算器
        SpearmansCorrelation spearmanCorrelation = new SpearmansCorrelation();

        // 遍历指纹库
        for (Fingerprint fingerprint : fingerprintDatabase) {
            // 获取指纹库中的RSSI向量
            double[] rssiVector = fingerprint.rssi;

            // 计算斯皮尔曼相关系数
            double correlation = spearmanCorrelation.correlation(givenRssi, rssiVector);

            // 如果相关系数更高，则更新最高相关系数和对应坐标
            if (correlation > maxCorrelation) {
                maxCorrelation = correlation;
                estimatedCoords = fingerprint.coords;
            }
        }
        // 输出估计位置坐标
        if (estimatedCoords != null) {
            System.out.println("估计的位置坐标为: " + estimatedCoords);
            return  estimatedCoords;
        } else {
            System.out.println("没有找到匹配的指纹点。");
            return "";
        }
    }
}