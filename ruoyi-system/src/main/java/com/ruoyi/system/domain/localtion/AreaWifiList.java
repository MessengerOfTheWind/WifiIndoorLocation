package com.ruoyi.system.domain.localtion;

import com.ruoyi.system.domain.Aptable;

import java.util.List;

public class AreaWifiList {
    private int areaId;
    private List<ApSignal> signalList;

    // 构造方法
    public AreaWifiList(int areaId, List<ApSignal> wifiList) {
        this.areaId = areaId;
        this.signalList = wifiList;
    }

}
