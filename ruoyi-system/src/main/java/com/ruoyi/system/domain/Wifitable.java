package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 【请填写功能名称】对象 wifitable
 * 
 * @author ruoyi
 * @date 2024-03-30
 */
public class Wifitable extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 指纹 id */
    private Long wiId;

    /** 指纹所处位置 id */
    @Excel(name = "指纹所处位置 id")
    private Long poId;

    /**  wifi 硬件位置 */
    @Excel(name = " wifi 硬件位置")
    private Long apId;

    /** wifi 信号平均值 */
    @Excel(name = "wifi 信号平均值")
    private Integer wiRssi;

    /** 产生时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "产生时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date wiDate;

    public Long getWiId() {
        return wiId;
    }

    public void setWiId(Long wiId) {
        this.wiId = wiId;
    }

    public Long getPoId() {
        return poId;
    }

    public void setPoId(Long poId) {
        this.poId = poId;
    }

    public Long getApId() {
        return apId;
    }

    public void setApId(Long apId) {
        this.apId = apId;
    }

    public Integer getWiRssi() {
        return wiRssi;
    }

    public void setWiRssi(Integer wiRssi) {
        this.wiRssi = wiRssi;
    }

    public Date getWiDate() {
        return wiDate;
    }

    public void setWiDate(Date wiDate) {
        this.wiDate = wiDate;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("wiId", getWiId())
            .append("poId", getPoId())
            .append("apId", getApId())
            .append("wiRssi", getWiRssi())
            .append("wiDate", getWiDate())
            .toString();
    }
}
