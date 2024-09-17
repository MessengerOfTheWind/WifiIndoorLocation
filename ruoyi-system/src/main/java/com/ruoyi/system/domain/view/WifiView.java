package com.ruoyi.system.domain.view;
import com.ruoyi.common.annotation.Excel;
import java.util.Date;


public class WifiView {
    @Excel(name = "area_name")
    private String areaName;

    @Excel(name = "ap_name")
    private String apName;

    @Excel(name = "po_x")
    private Double poX;

    @Excel(name = "po_y")
    private Double poY;

    @Excel(name = "po_z")
    private Double poZ;

    @Excel(name = "wi_rssi")
    private Integer wiRssi;

    @Excel(name = "wi_date")
    private Date wiDate;

    public WifiView() {

    }

    public WifiView(String areaName) {
        this.areaName = areaName;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public String getApName() {
        return apName;
    }

    public void setApName(String apName) {
        this.apName = apName;
    }

    public Double getPoX() {
        return poX;
    }

    public void setPoX(double poX) {
        this.poX = poX;
    }

    public Double getPoY() {
        return poY;
    }

    public void setPoY(double poY) {
        this.poY = poY;
    }

    public Double getPoZ() {
        return poZ;
    }

    public void setPoZ(double poZ) {
        this.poZ = poZ;
    }

    public Integer getWiRssi() {
        return wiRssi;
    }

    public void setWiRssi(int wiRssi) {
        this.wiRssi = wiRssi;
    }

    public Date getWiDate() {
        return wiDate;
    }

    public void setWiDate(Date wiDate) {
        this.wiDate = wiDate;
    }

    public WifiView(String areaName, String apName, Double poX, Double poY, Double poZ, Integer wiRssi, Date wiDate) {
        this.areaName = areaName;
        this.apName = apName;
        this.poX = poX;
        this.poY = poY;
        this.poZ = poZ;
        this.wiRssi = wiRssi;
        this.wiDate = wiDate;
    }

    @Override
    public String toString() {
        return "WifiView{" +
                "areaName='" + areaName + '\'' +
                ", apName='" + apName + '\'' +
                ", poX=" + poX +
                ", poY=" + poY +
                ", poZ=" + poZ +
                ", wiRssi=" + wiRssi +
                ", wiDate=" + wiDate +
                '}';
    }

    public String LocationToString(){
        return poX.toString() + ", " + poY.toString() +", " + poZ.toString();
    }
}
