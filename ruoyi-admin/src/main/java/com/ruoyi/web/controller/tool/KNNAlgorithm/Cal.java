package com.ruoyi.web.controller.tool.KNNAlgorithm;

import com.ruoyi.system.domain.view.Finger;

import java.util.List;

public class Cal {

    public static String cal(List<Finger> fingerList,List<Integer> newPoint) {
        // 创建KNN分类器，设置k值
        int k = 1;
        KNN knn = new KNN(fingerList, k);

        // 预测位置
        String predictedLocation = knn.classify(newPoint);
        System.out.println("预测的位置: " + predictedLocation);
        return predictedLocation;
    }
}

