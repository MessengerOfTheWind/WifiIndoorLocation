package com.ruoyi.web.controller.tool.spearmanr;

import lombok.Data;

@Data
public class Fingerprint {
    double[] rssi;
    String coords;

    public Fingerprint(double[] rssi, String coords) {
        this.rssi = rssi;
        this.coords = coords;
    }

    public Fingerprint(){

    }
}
