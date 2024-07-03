package com.ruoyi.system.domain.view;

import java.util.List;

public class Finger {

    private String areaName;
    // 例如 10，20，1表示在（10，20，1）这个位置点上
    private String XYZ;

    // rssiList依照apName去进行的排序，换句话说，rssilist都是依照这个顺序进行的
    private List<Integer> rssiList;

    public Finger(String areaName, String XYZ, List<Integer> rssiList) {
        this.areaName = areaName;
        this.XYZ = XYZ;
        this.rssiList = rssiList;
    }

    public Finger(String areaName, String XYZ) {
        this.areaName = areaName;
        this.XYZ = XYZ;
    }

    public Finger(){

    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public String getXYZ() {
        return XYZ;
    }

    public void setXYZ(String XYZ) {
        this.XYZ = XYZ;
    }

    public List<Integer> getRssiList() {
        return rssiList;
    }

    public void setRssiList(List<Integer> rssiList) {
        this.rssiList = rssiList;
    }

    @Override
    public String toString() {
        return "FingerList{" +
                "areaName='" + areaName + '\'' +
                ", XYZ='" + XYZ + '\'' +
                ", rssiList=" + rssiList +
                '}';
    }
}
