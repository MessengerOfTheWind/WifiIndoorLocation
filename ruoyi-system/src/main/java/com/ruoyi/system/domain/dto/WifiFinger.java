package com.ruoyi.system.domain.dto;

import java.util.List;

public class WifiFinger {
    /** 区域号 */
    private Long areaId;

    /** mac列表 */
    private List<String> macList;

    /** 坐标 */
    private Float poX;
    private Float poY;
    private Float poZ;

    public WifiFinger(Long areaId, List<String> macList, Float poX, Float poY, Float poZ) {
        this.areaId = areaId;
        this.macList = macList;
        this.poX = poX;
        this.poY = poY;
        this.poZ = poZ;
    }

    public WifiFinger() {
    }

    public Long getAreaId() {
        return areaId;
    }

    public void setAreaId(Long areaId) {
        this.areaId = areaId;
    }

    public List<String> getMacList() {
        return macList;
    }

    public void setMacList(List<String> macList) {
        this.macList = macList;
    }

    public Float getPoX() {
        return poX;
    }

    public void setPoX(Float poX) {
        this.poX = poX;
    }

    public Float getPoY() {
        return poY;
    }

    public void setPoY(Float poY) {
        this.poY = poY;
    }

    public Float getPoZ() {
        return poZ;
    }

    public void setPoZ(Float poZ) {
        this.poZ = poZ;
    }
}
