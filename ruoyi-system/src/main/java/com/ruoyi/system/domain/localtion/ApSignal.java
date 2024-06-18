package com.ruoyi.system.domain.localtion;

public class ApSignal {
//    apName,apMac,apRssi
    /** wifi名称 */
    private String apName;
    /** wifi物理地址 */
    private String apMac;
    /** wifi信号值 */
    private String apRssi;

    public String getApName() {
        return apName;
    }

    public void setApName(String apName) {
        this.apName = apName;
    }

    public String getApMac() {
        return apMac;
    }

    public void setApMac(String apMac) {
        this.apMac = apMac;
    }

    public String getApRssi() {
        return apRssi;
    }

    public void setApRssi(String apRssi) {
        this.apRssi = apRssi;
    }

    @Override
    public String toString() {
        return "ap_signal{" +
                "apName='" + apName + '\'' +
                ", apMac='" + apMac + '\'' +
                ", apRssi='" + apRssi + '\'' +
                '}';
    }
}
