package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.view.WifiView;

import java.util.List;

public interface FingerprintMapper {

    /**
     * 查询【依据WifiView对象查询】
     *
     * @param wifiView 【查询的对象】
     * @return 【请填写功能名称】
     */
    public List<WifiView> selectFingerprintList(WifiView wifiView);


}
