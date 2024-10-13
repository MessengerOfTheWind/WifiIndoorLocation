package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 【请填写功能名称】对象 aptable
 * 
 * @author ruoyi
 * @date 2024-03-30
 */
public class Aptable extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** wifi的id */
    private Long apId;

    /** wifi名称 */
    @Excel(name = "wifi名称")
    private String apName;

    /** 物理地址 */
    @Excel(name = "物理地址")
    private String apMac;

    /** 所处区域 */
    @Excel(name = "所处区域")
    private Long areaId;

    /** 位置信息
 */
    @Excel(name = "位置信息")
    private Long poId;

    /** 描述 */
    @Excel(name = "描述")
    private String apDescription;

    /** ap的权重 */
    @Excel(name = "ap的权重")
    private Integer apWeight;

    public void setApId(Long apId) 
    {
        this.apId = apId;
    }

    public Long getApId() 
    {
        return apId;
    }
    public void setApName(String apName) 
    {
        this.apName = apName;
    }

    public String getApName() 
    {
        return apName;
    }
    public void setApMac(String apMac) 
    {
        this.apMac = apMac;
    }

    public String getApMac() 
    {
        return apMac;
    }
    public void setAreaId(Long areaId) 
    {
        this.areaId = areaId;
    }

    public Long getAreaId() 
    {
        return areaId;
    }
    public void setPoId(Long poId) 
    {
        this.poId = poId;
    }

    public Long getPoId() 
    {
        return poId;
    }
    public void setApDescription(String apDescription) 
    {
        this.apDescription = apDescription;
    }

    public String getApDescription() 
    {
        return apDescription;
    }

    public Integer getApWeight() {
        return apWeight;
    }

    public void setApWeight(Integer apWeight) {
        this.apWeight = apWeight;
    }

    public Aptable(Long apId, String apName, String apMac, Long areaId, Long poId, String apDescription, Integer apWeight) {
        this.apId = apId;
        this.apName = apName;
        this.apMac = apMac;
        this.areaId = areaId;
        this.poId = poId;
        this.apDescription = apDescription;
        this.apWeight = apWeight;
    }

    public Aptable(Long areaId) {
        this.areaId = areaId;
    }

    public Aptable() {

    }
    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("apId", getApId())
            .append("apName", getApName())
            .append("apMac", getApMac())
            .append("areaId", getAreaId())
            .append("poId", getPoId())
            .append("apDescription", getApDescription())
            .toString();
    }

    public Aptable(String apMac, Long areaId) {
        this.apMac = apMac;
        this.areaId = areaId;
    }

    public Aptable(Long apId, String apName, String apMac, Long areaId, Long poId, String apDescription) {
        this.apId = apId;
        this.apName = apName;
        this.apMac = apMac;
        this.areaId = areaId;
        this.poId = poId;
        this.apDescription = apDescription;
    }
}
