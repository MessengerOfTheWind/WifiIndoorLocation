package com.ruoyi.screen.service;


import com.ruoyi.screen.poji.view.ScreenMonitorView;
import com.ruoyi.screen.poji.vo.PersonDistributionDonut;

import java.util.List;
import java.util.Map;

public interface IScreenMonitorService {

    /** 获取人员分布的环形图
     *
     * @return Map<areaName, value>
     */
    public List<PersonDistributionDonut> GetPersonDistributionDonut();

    public List<ScreenMonitorView> selectScreenMonitorViewList(ScreenMonitorView screenMonitorView);
}
