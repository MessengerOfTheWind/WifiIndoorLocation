package com.ruoyi.system.domain.dto;

import com.ruoyi.system.domain.vo.MeasureWifiVo;

import java.util.ArrayList;

public class MeasureApOrder {
    /** 所处的组号 */
    private Integer groupId;
    /** 区域Id */
    private Long AreaId;

    /** wifi信号列表 */
    private ArrayList<MeasureWifiVo> measureWifiVos;

    /** 相关xyz坐标 */
    private Float poX;

    private Float poY;

    private Float poZ;

    public MeasureApOrder(Integer groupId, Long areaId, ArrayList<MeasureWifiVo> measureWifiVos, Float poX, Float poY, Float poZ) {
        this.groupId = groupId;
        AreaId = areaId;
        this.measureWifiVos = measureWifiVos;
        this.poX = poX;
        this.poY = poY;
        this.poZ = poZ;
    }

    public MeasureApOrder() {
    }

    public Integer getGroupId() {
        return groupId;
    }

    public void setGroupId(Integer groupId) {
        this.groupId = groupId;
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
