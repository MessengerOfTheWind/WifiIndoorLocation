package com.ruoyi.system.domain.vo;

import com.ruoyi.common.annotation.Excel;

public class WifiTableVo {

    /** 指纹所处位置 id */
    private Long poId;

    /**  wifi 硬件位置 */
    private Long apId;

    public WifiTableVo(Long poId, Long apId) {
        this.poId = poId;
        this.apId = apId;
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
}
