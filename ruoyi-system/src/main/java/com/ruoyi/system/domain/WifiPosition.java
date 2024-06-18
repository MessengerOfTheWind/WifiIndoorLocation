package com.ruoyi.system.domain;

import com.ruoyi.common.annotation.Excel;

public class WifiPosition {

    /** wifi的id */
    private Long apId;

    /** 所处区域 */
    @Excel(name = "所处区域")
    private Long areaId;

    @Excel(name = "所处区域块号")
    private Long blockId;
    /** x轴 */
    @Excel(name = "x轴")
    private Float poX;

    /** y轴 */
    @Excel(name = "y轴")
    private Float poY;

    /** z轴 */
    @Excel(name = "z轴")
    private Float poZ;


    public Long getApId() {
        return apId;
    }

    public void setApId(Long apId) {
        this.apId = apId;
    }

    public Long getAreaId() {
        return areaId;
    }

    public void setAreaId(Long areaId) {
        this.areaId = areaId;
    }

    public Long getBlockId() {
        return blockId;
    }

    public void setBlockId(Long blockId) {
        this.blockId = blockId;
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

    @Override
    public String toString() {
        return "WifiPosition{" +
                "apId=" + apId +
                ", areaId=" + areaId +
                ", blockId=" + blockId +
                ", poX=" + poX +
                ", poY=" + poY +
                ", poZ=" + poZ +
                '}';
    }
}
