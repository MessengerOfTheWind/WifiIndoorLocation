package com.ruoyi.system.service.impl;


import com.ruoyi.system.domain.view.WifiView;
import com.ruoyi.system.mapper.FingerprintMapper;
import com.ruoyi.system.service.IFingerprintService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FingerprintServiceImpl implements IFingerprintService {

    @Autowired
    private FingerprintMapper fingerprintMapper;

    private static final Logger log = LoggerFactory.getLogger(SysUserServiceImpl.class);


    @Override
    public List<WifiView> selectFingerprintList(WifiView wifiView){
        return fingerprintMapper.selectFingerprintList(wifiView);
    }
}
