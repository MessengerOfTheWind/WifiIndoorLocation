package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.Measurewifitable;

/**
 * 【请填写功能名称】Mapper接口
 * 
 * @author ruoyi
 * @date 2024-03-30
 */
public interface MeasurewifitableMapper 
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
     * @param measurewifitable 【请填写功能名称】
     * @return 结果
     */
    public int insertMeasurewifitable(Measurewifitable measurewifitable);

    /**
     * 修改【请填写功能名称】
     * 
     * @param measurewifitable 【请填写功能名称】
     * @return 结果
     */
    public int updateMeasurewifitable(Measurewifitable measurewifitable);

    /**
     * 删除【请填写功能名称】
     * 
     * @param measureWifiId 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteMeasurewifitableByMeasureWifiId(Long measureWifiId);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param measureWifiIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMeasurewifitableByMeasureWifiIds(Long[] measureWifiIds);
}
