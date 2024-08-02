package com.ruoyi.system.domain.dto;

import com.ruoyi.system.domain.vo.MeasureWifiVo;

import java.awt.geom.Area;
import java.lang.reflect.Array;
import java.util.ArrayList;

public class MeasureApRssi {
    /** 区域Id */
    private Long AreaId;

    /** wifi信号列表 */
    private ArrayList<MeasureWifiVo> measureWifiVos;

    /** 相关xyz坐标 */
    private Float poX;

    private Float poY;

    private Float poZ;

    @Override
    public String toString() {
        return "MeasureApRssi{" +
                "AreaId=" + AreaId +
                ", measureWifiVos=" + measureWifiVos +
                ", poX=" + poX +
                ", poY=" + poY +
                ", poZ=" + poZ +
                '}';
    }

    public Long getAreaId() {
        return AreaId;
    }

    public void setAreaId(Long areaId) {
        AreaId = areaId;
    }

    public ArrayList<MeasureWifiVo> getMeasureWifiVos() {
        return measureWifiVos;
    }

    public void setMeasureWifiVos(ArrayList<MeasureWifiVo> measureWifiVos) {
        this.measureWifiVos = measureWifiVos;
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
