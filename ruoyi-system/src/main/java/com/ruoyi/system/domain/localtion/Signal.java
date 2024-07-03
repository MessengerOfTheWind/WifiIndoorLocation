package com.ruoyi.system.domain.localtion;

public class Signal {
    private String wifiMac;
    private Integer rssi;

    public Signal(String wifiMac, Integer rssi) {
        this.wifiMac = wifiMac;
        this.rssi = rssi;
    }

    public Signal(){

    }

    public String getWifiMac() {
        return wifiMac;
    }

    public void setWifiMac(String wifiMac) {
        this.wifiMac = wifiMac;
    }

    public Integer getRssi() {
        return rssi;
    }

    public void setRssi(Integer rssi) {
        this.rssi = rssi;
    }

    @Override
    public String toString() {
        return "Signal{" +
                "wifiMac='" + wifiMac + '\'' +
                ", rssi=" + rssi +
                '}';
    }

}
