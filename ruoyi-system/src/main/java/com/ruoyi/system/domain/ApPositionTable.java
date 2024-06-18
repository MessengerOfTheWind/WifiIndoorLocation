package com.ruoyi.system.domain;

import com.ruoyi.common.annotation.Excel;

public class ApPositionTable {

    /** wifi名称 */
    @Excel(name = "wifi名称")
    private String apName;

    /** 物理地址 */
    @Excel(name = "物理地址")
    private String apMac;

    /** 所处区域 */
    @Excel(name = "所处区域")
    private Long areaId;

    @Excel(name = "区域所属块号")
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

    /**
     * 描述
     */
    @Excel(name = "描述")
    private String apDescription;

    public String getApName() {
        return apName;
    }

    public void setApName(String apName) {
        this.apName = apName;
    }

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

    public String getApDescription() {
        return apDescription;
    }

    public void setApDescription(String apDescription) {
        this.apDescription = apDescription;
    }

    public ApPositionTable(String apName, String apMac, Long areaId, Long blockId, Float poX, Float poY, Float poZ, String apDescription) {
        this.apName = apName;
        this.apMac = apMac;
        this.areaId = areaId;
        this.blockId = blockId;
        this.poX = poX;
        this.poY = poY;
        this.poZ = poZ;
        this.apDescription = apDescription;
    }



    public ApPositionTable(){

    }
}
