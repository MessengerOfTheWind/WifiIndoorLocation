package com.ruoyi.system.domain.vo;

public class MeasureWifiVo {
    /** mac 地址 */
    private String wiMac;
    /** 产生的信号值 */
    private Integer measureWifiRssi;


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

    public MeasureWifiVo(String wiMac, Integer measureWifiRssi) {
        this.wiMac = wiMac;
        this.measureWifiRssi = measureWifiRssi;
    }

    public MeasureWifiVo() {
    }
}
