package com.ruoyi.web.controller.tool.KNNAlgorithm;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.system.domain.view.Finger;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class KNN extends BaseController {
    private List<Finger> data;
    private int k;

    public KNN(List<Finger> data, int k) {
        this.data = data;
        this.k = k;
    }

    public String classify(List<Integer> newPoint) {
        List<Neighbor> neighbors = new ArrayList<>();

        for (Finger point : data) {
            double distance = calculateDistance(point.getRssiList(), newPoint);
            neighbors.add(new Neighbor(point, distance));
        }

        Collections.sort(neighbors, Comparator.comparingDouble(Neighbor::getDistance));

        Map<String, Integer> frequencyMap = new HashMap<>();
        for (int i = 0; i < k; i++) {
            String label = neighbors.get(i).getFinger().getXYZ();
            frequencyMap.put(label, frequencyMap.getOrDefault(label, 0) + 1);
        }
        return Collections.max(frequencyMap.entrySet(), Map.Entry.comparingByValue()).getKey();
    }

    private double calculateDistance(List<Integer> a, List<Integer> b) {
        double sum = 0;
        for (int i = 0; i < a.size(); i++) {
            sum += Math.pow(a.get(i) - b.get(i), 2);
        }
        return Math.sqrt(sum);
    }

    private class Neighbor {
        private Finger finger;
        private double distance;

        public Neighbor(Finger finger, double distance) {
            this.finger = finger;
            this.distance = distance;
        }

        public Finger getFinger() {
            return finger;
        }

        public double getDistance() {
            return distance;
        }
    }


}

