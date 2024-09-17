package com.ruoyi.system.domain.model;

import com.ruoyi.common.annotation.Log;

public class WifiTableView {
    private Long apId;
    private Integer wiRssi;
    private Long areaId;
    private Long wiId;
    private Long poId;

    // Getters and Setters
    public Long getApId() {
        return apId;
    }

    public void setApId(Long apId) {
        this.apId = apId;
    }

    public Integer getWiRssi() {
        return wiRssi;
    }

    public void setWiRssi(Integer wiRssi) {
        this.wiRssi = wiRssi;
    }

    public Long getAreaId() {
        return areaId;
    }

    public void setAreaId(Long areaId) {
        this.areaId = areaId;
    }

    public Long getWiId() {
        return wiId;
    }

    public void setWiId(Long wiId) {
        this.wiId = wiId;
    }

    public Long getPoId() {
        return poId;
    }

    public void setPoId(Long poId) {
        this.poId = poId;
    }
}
