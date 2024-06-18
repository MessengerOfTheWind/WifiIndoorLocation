package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 【请填写功能名称】对象 areatable
 * 
 * @author ruoyi
 * @date 2024-03-30
 */
public class Areatable extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 区域id */
    private Long areaId;

    /** 区域名称 */
    @Excel(name = "区域名称")
    private String areaName;

    /** 区域描述
 */
    @Excel(name = "区域描述")
    private String areaDescription;

    /** 区域布置数量 */
    @Excel(name = "区域布置数量")
    private Integer areaApnum;

    public Long getAreaId() {
        return areaId;
    }

    public void setAreaId(Long areaId) {
        this.areaId = areaId;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public String getAreaDescription() {
        return areaDescription;
    }

    public void setAreaDescription(String areaDescription) {
        this.areaDescription = areaDescription;
    }

    public Integer getAreaApnum() {
        return areaApnum;
    }

    public void setAreaApnum(Integer areaApnum) {
        this.areaApnum = areaApnum;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("areaId", getAreaId())
            .append("areaName", getAreaName())
            .append("areaDescription", getAreaDescription())
            .append("areaApnum", getAreaApnum())
            .toString();
    }
}
