package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 【请填写功能名称】对象 positiontable
 * 
 * @author ruoyi
 * @date 2024-03-30
 */
public class Positiontable extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 位置 id */
    private Long poId;

    /** 位置名字 */
    @Excel(name = "位置名字")
    private String poName;

    /** 所处区域 id */
    @Excel(name = "所处区域 id")
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

    public Long getPoId() {
        return poId;
    }

    public void setPoId(Long poId) {
        this.poId = poId;
    }

    public String getPoName() {
        return poName;
    }

    public void setPoName(String poName) {
        this.poName = poName;
    }

    public Long getAreaId() {
        return areaId;
    }

    public void setAreaId(Long areaId) {
        this.areaId = areaId;
    }


    public Positiontable(String poName, Long areaId, Long blockId, Float poX, Float poY, Float poZ) {
        this.poName = poName;
        this.areaId = areaId;
        this.blockId = blockId;
        this.poX = poX;
        this.poY = poY;
        this.poZ = poZ;
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

    public Positiontable(String poName, Long areaId, Float poX, Float poY, Float poZ) {
        this.poName = poName;
        this.areaId = areaId;
        this.poX = poX;
        this.poY = poY;
        this.poZ = poZ;
    }

    public Positiontable(){

    }

    @Override
    public String toString() {
        return "Positiontable{" +
                "poId=" + poId +
                ", poName='" + poName + '\'' +
                ", areaId=" + areaId +
                ", poX=" + poX +
                ", poY=" + poY +
                ", poZ=" + poZ +
                '}';
    }
}
