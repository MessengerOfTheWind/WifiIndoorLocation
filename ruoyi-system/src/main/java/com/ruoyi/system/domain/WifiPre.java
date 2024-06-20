package com.ruoyi.system.domain;

import com.ruoyi.common.annotation.Excel;

public class WifiPre {
    /** 物理地址 */
    @Excel(name = "物理地址")
    private String apMac;

    @Excel(name = "区域Id")
    private Long areaId;

    /** x轴 */
    @Excel(name = "x轴")
    private Float poX;

    /** y轴 */
    @Excel(name = "y轴")
    private Float poY;

    /** z轴 */
    @Excel(name = "z轴")
    private Float poZ;

    public String getApMac() {
        return apMac;
    }

    public void setApMac(String apMac) {
        this.apMac = apMac;
    }

    public Long getAreaId() {
        return areaId;
    }

    public void setAreaId(Long areaId) {
        this.areaId = areaId;
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
        return "WifiPre{" +
                "apMac='" + apMac + '\'' +
                ", areaId='" + areaId + '\'' +
                ", blockId='" +
                ", poX=" + poX +
                ", poY=" + poY +
                ", poZ=" + poZ +
                '}';
    }
}
