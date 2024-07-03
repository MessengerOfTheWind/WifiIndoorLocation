package com.ruoyi.system.service;

import com.ruoyi.system.domain.view.WifiView;

import java.util.List;

public interface IFingerprintService {
    public List<WifiView> selectFingerprintList(WifiView wifiView);
}
