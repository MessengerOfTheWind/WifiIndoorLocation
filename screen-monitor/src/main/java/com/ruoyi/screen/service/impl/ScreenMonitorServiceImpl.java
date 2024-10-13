package com.ruoyi.screen.service.impl;

import com.ruoyi.screen.mapper.ScreenMonitorMapper;
import com.ruoyi.screen.poji.view.ScreenMonitorView;
import com.ruoyi.screen.poji.vo.PersonDistributionDonut;
import com.ruoyi.screen.service.IScreenMonitorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class ScreenMonitorServiceImpl implements IScreenMonitorService {

    @Autowired
    private ScreenMonitorMapper screenMonitorMapper;
    @Override
    public List<PersonDistributionDonut> GetPersonDistributionDonut(){
        ScreenMonitorView screenMonitorView = new ScreenMonitorView();
        List<ScreenMonitorView> screenMonitorViewList = screenMonitorMapper.selectScreenMonitorViewList(screenMonitorView);
        Map<String, Integer> personMap = new HashMap<>();
        for (ScreenMonitorView screen: screenMonitorViewList
             ) {
            String areaName = screen.getAreaName();
            if(screen.getOnlineStatus() == 1){
                personMap.put(areaName, personMap.getOrDefault(areaName, 0) + 1);
            }
        }
        List<PersonDistributionDonut> personDistributionDonutList = new ArrayList<>();
        //map转list
        for (String name: personMap.keySet()
             ) {
            PersonDistributionDonut tmpPerson = new PersonDistributionDonut(name, personMap.get(name));
            personDistributionDonutList.add(tmpPerson);
        }
        return personDistributionDonutList;
    }

    @Override
    public List<ScreenMonitorView> selectScreenMonitorViewList(ScreenMonitorView screenMonitorView) {
        return screenMonitorMapper.selectScreenMonitorViewList(screenMonitorView);
    }
}
