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

    public List<List<String>> GetPersonDistributionExcel();

    public List<List<String>> GetPersonDistributionDensity();

    public List<List<String>> GetPersonDistributionEchart();

    public List<List<String>> GetPersonDistributionPredict();
}
