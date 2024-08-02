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


    public static String calMutiple(List<Finger> dataList, List<Integer> newPoint){
        int minIndex = -1;
        int minDifference = 999999999;
        for (int i = 0; i < dataList.size(); i++) {
            List<Integer> currentData = dataList.get(i).getRssiList();
            int currentDifference = calculateDifference(currentData, newPoint);
            if (currentDifference <= minDifference) {
                minDifference = currentDifference;
                minIndex = i;
            }
        }
        return dataList.get(minIndex).getXYZ();
    }

    public static Integer calculateDifference(List<Integer> currentData, List<Integer> targetData){
        int m = 1;
        for (int i = 0; i < currentData.size(); i++){
             int gap = Math.abs(currentData.get(i) - targetData.get(i));
             if(gap==0){
                 gap = 1;
             }
             m = m* gap;
        }
        return m;
    }
}

