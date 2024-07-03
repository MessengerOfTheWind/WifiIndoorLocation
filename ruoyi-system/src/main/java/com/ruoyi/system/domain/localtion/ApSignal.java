package com.ruoyi.system.domain.localtion;

import org.springframework.security.core.userdetails.User;

import java.util.List;

public class ApSignal {
//    apName,apMac,apRssi
    private LocationUser user;

    /** wifi mac和信号值的集合 */
    private List<Signal> signalList;

    public ApSignal(LocationUser user, List<Signal> signalList) {
        this.user = user;
        this.signalList = signalList;
    }

    public ApSignal(List<Signal> signalList) {
        this.signalList = signalList;
    }

    public LocationUser getUser() {
        return user;
    }

    public void setUser(LocationUser user) {
        this.user = user;
    }

    public List<Signal> getSignalList() {
        return signalList;
    }

    public void setSignalList(List<Signal> signalList) {
        this.signalList = signalList;
    }


    @Override
    public String toString() {
        return "ApSignal{" +
                "user=" + user +
                ", signalList=" + signalList +
                '}';
    }
}
