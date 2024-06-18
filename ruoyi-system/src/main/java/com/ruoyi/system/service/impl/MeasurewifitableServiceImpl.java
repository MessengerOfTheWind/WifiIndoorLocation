package com.ruoyi.system.service.impl;

import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.MeasurewifitableMapper;
import com.ruoyi.system.domain.Measurewifitable;
import com.ruoyi.system.service.IMeasurewifitableService;

/**
 * 【请填写功能名称】Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-03-30
 */
@Service
public class MeasurewifitableServiceImpl implements IMeasurewifitableService 
{
    @Autowired
    private MeasurewifitableMapper measurewifitableMapper;

    /**
     * 查询【请填写功能名称】
     * 
     * @param measureWifiId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    @Override
    public Measurewifitable selectMeasurewifitableByMeasureWifiId(Long measureWifiId)
    {
        return measurewifitableMapper.selectMeasurewifitableByMeasureWifiId(measureWifiId);
    }

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param measurewifitable 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<Measurewifitable> selectMeasurewifitableList(Measurewifitable measurewifitable)
    {
        return measurewifitableMapper.selectMeasurewifitableList(measurewifitable);
    }

    /**
     * 新增【请填写功能名称】
     * 
     * @param measurewifitable 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertMeasurewifitable(Measurewifitable measurewifitable)
    {
        //载入当前日期
        Date date = new Date();
        measurewifitable.setMeasureWifiDate(new java.sql.Date(date.getTime()));
        return measurewifitableMapper.insertMeasurewifitable(measurewifitable);
    }

    /**
     * 修改【请填写功能名称】
     * 
     * @param measurewifitable 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateMeasurewifitable(Measurewifitable measurewifitable)
    {
        return measurewifitableMapper.updateMeasurewifitable(measurewifitable);
    }

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param measureWifiIds 需要删除的【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteMeasurewifitableByMeasureWifiIds(Long[] measureWifiIds)
    {
        return measurewifitableMapper.deleteMeasurewifitableByMeasureWifiIds(measureWifiIds);
    }

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param measureWifiId 【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteMeasurewifitableByMeasureWifiId(Long measureWifiId)
    {
        return measurewifitableMapper.deleteMeasurewifitableByMeasureWifiId(measureWifiId);
    }
}
