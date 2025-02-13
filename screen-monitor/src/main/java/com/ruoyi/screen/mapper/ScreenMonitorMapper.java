package com.ruoyi.screen.mapper;

import com.ruoyi.screen.poji.view.ScreenMonitorView;

import java.util.Date;
import java.util.List;


public interface ScreenMonitorMapper {
    public List<ScreenMonitorView> selectScreenMonitorViewList(ScreenMonitorView screenMonitorView);


    List<ScreenMonitorView> selectScreenMonitorViewListByTime(Date oneHourAgoStr, Date nowStr);
}
