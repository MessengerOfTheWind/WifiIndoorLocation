package com.ruoyi.system.domain.view;

import java.util.List;

public class UserWifiRssi {
    private String user;
    private List<WifiRssi> wifiRssiList;

    // 无参构造函数
    public UserWifiRssi() {
    }

    public UserWifiRssi(String user, List<WifiRssi> wifiRssiList) {
        this.user = user;
        this.wifiRssiList = wifiRssiList;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public List<WifiRssi> getWifiRssiList() {
        return wifiRssiList;
    }

    public void setWifiRssiList(List<WifiRssi> wifiRssiList) {
        this.wifiRssiList = wifiRssiList;
    }

    public static class WifiRssi {
        private String apName;
        private int rssi;

        // 无参构造函数
        public WifiRssi() {
        }

        public WifiRssi(String apName, int rssi) {
            this.apName = apName;
            this.rssi = rssi;
        }

        public String getApName() {
            return apName;
        }

        public void setApName(String apName) {
            this.apName = apName;
        }

        public int getRssi() {
            return rssi;
        }

        public void setRssi(int rssi) {
            this.rssi = rssi;
        }
    }
}
