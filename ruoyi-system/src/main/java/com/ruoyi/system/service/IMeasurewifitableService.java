package com.ruoyi.system.service;

import java.util.List;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.system.domain.Measurewifitable;
import com.ruoyi.system.domain.dto.MeasureApOrder;
import com.ruoyi.system.domain.dto.MeasureApRssi;

/**
 * 【请填写功能名称】Service接口
 * 
 * @author ruoyi
 * @date 2024-03-30
 */
public interface IMeasurewifitableService 
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param measureWifiId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public Measurewifitable selectMeasurewifitableByMeasureWifiId(Long measureWifiId);

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param measurewifitable 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<Measurewifitable> selectMeasurewifitableList(Measurewifitable measurewifitable);

    /**
     * 新增【请填写功能名称】
     * 
     * @param measureApRssi 【请填写功能名称】
     * @return 结果
     */
    public int insertMeasurewifitable(MeasureApRssi measureApRssi);

    public int insertMeasureWifiTableTest(List<MeasureApOrder> measureApOrders);

    /**
     * 修改【请填写功能名称】
     * 
     * @param measurewifitable 【请填写功能名称】
     * @return 结果
     */
    public int updateMeasurewifitable(Measurewifitable measurewifitable);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param measureWifiIds 需要删除的【请填写功能名称】主键集合
     * @return 结果
     */
    public int deleteMeasurewifitableByMeasureWifiIds(Long[] measureWifiIds);

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param measureWifiId 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteMeasurewifitableByMeasureWifiId(Long measureWifiId);

    String importMeasureWifitable(List<Measurewifitable> measurewifitableList, Boolean isUpdateSupport);
}
