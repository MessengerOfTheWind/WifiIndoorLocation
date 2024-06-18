package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 【请填写功能名称】对象 measurewifitable
 * 
 * @author ruoyi
 * @date 2024-03-30
 */
public class Measurewifitable extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 对比 id
 */
    private Long measureWifiId;

    /** 区域 id */
    @Excel(name = "区域 id")
    private Long areaId;

    @Excel(name = "区域块id号")
    private Long blockId;

    /** mac 地址 */
    @Excel(name = "mac 地址")
    private String wiMac;

    /** 产生的信号值 */
    @Excel(name = "产生的信号值")
    private Integer measureWifiRssi;

    /** 产生的时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "产生的时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date measureWifiDate;

    /** x轴 */
    @Excel(name = "x轴")
    private Float poX;

    /** y轴 */
    @Excel(name = "y轴")
    private Float poY;

    /** z轴 */
    @Excel(name = "z轴")
    private Float poZ;


    public Measurewifitable(){

    }
    public Measurewifitable(Long areaId, Long blockId, String wiMac, Float poX, Float poY, Float poZ) {
        this.areaId = areaId;
        this.blockId = blockId;
        this.wiMac = wiMac;
        this.poX = poX;
        this.poY = poY;
        this.poZ = poZ;
    }



    public Long getMeasureWifiId() {
        return measureWifiId;
    }

    public void setMeasureWifiId(Long measureWifiId) {
        this.measureWifiId = measureWifiId;
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

    public String getWiMac() {
        return wiMac;
    }

    public void setWiMac(String wiMac) {
        this.wiMac = wiMac;
    }

    public Integer getMeasureWifiRssi() {
        return measureWifiRssi;
    }

    public void setMeasureWifiRssi(Integer measureWifiRssi) {
        this.measureWifiRssi = measureWifiRssi;
    }

    public Date getMeasureWifiDate() {
        return measureWifiDate;
    }

    public void setMeasureWifiDate(Date measureWifiDate) {
        this.measureWifiDate = measureWifiDate;
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
        return "Measurewifitable{" +
                "measureWifiId=" + measureWifiId +
                ", areaId=" + areaId +
                ", blockId=" + blockId +
                ", wiMac='" + wiMac + '\'' +
                ", measureWifiRssi=" + measureWifiRssi +
                ", measureWifiDate=" + measureWifiDate +
                ", poX=" + poX +
                ", poY=" + poY +
                ", poZ=" + poZ +
                '}';
    }
}
