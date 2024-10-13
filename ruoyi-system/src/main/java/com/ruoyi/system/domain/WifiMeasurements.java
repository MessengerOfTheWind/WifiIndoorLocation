package com.ruoyi.system.domain;

import java.io.Serializable;
import java.util.Date;

/**
 * WiFi 测量记录实体类
 * 对应数据库表 wifi_measurements_with_order
 * 
 */
public class WifiMeasurements implements Serializable {

    private static final long serialVersionUID = 1L;

    /** 对比 ID */
    private Long measureWifiId;

    /** 区域 ID */
    private Long areaId;

    /** WiFi 名称 */
    private String apName;

    /** 产生的信号值 */
    private Integer measureWifiRssi;

    /** 产生的时间 */
    private Date measureWifiDate;

    /** X 轴 */
    private Float poX;

    /** Y 轴 */
    private Float poY;

    /** Z 轴 */
    private Float poZ;

    /** 顺序 */
    private Long order;

    public WifiMeasurements(Long areaId, String apName, Integer measureWifiRssi, Date measureWifiDate, Float poX, Float poY, Float poZ, Long order) {
        this.areaId = areaId;
        this.apName = apName;
        this.measureWifiRssi = measureWifiRssi;
        this.measureWifiDate = measureWifiDate;
        this.poX = poX;
        this.poY = poY;
        this.poZ = poZ;
        this.order = order;
    }

    public WifiMeasurements() {
    }

    // Getter 和 Setter 方法

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

    public String getApName() {
        return apName;
    }

    public void setApName(String apName) {
        this.apName = apName;
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

    public Long getOrder() {
        return order;
    }

    public void setOrder(Long order) {
        this.order = order;
    }

    @Override
    public String toString() {
        return "WifiMeasurements{" +
                "measureWifiId=" + measureWifiId +
                ", areaId=" + areaId +
                ", apName='" + apName + '\'' +
                ", measureWifiRssi=" + measureWifiRssi +
                ", measureWifiDate=" + measureWifiDate +
                ", poX=" + poX +
                ", poY=" + poY +
                ", poZ=" + poZ +
                ", order=" + order +
                '}';
    }
}
