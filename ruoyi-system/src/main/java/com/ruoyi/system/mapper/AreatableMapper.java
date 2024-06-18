package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.Areatable;

/**
 * 【请填写功能名称】Mapper接口
 * 
 * @author ruoyi
 * @date 2024-03-30
 */
public interface AreatableMapper 
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param areaId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public Areatable selectAreatableByAreaId(Long areaId);

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param areatable 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<Areatable> selectAreatableList(Areatable areatable);

    /**
     * 新增【请填写功能名称】
     * 
     * @param areatable 【请填写功能名称】
     * @return 结果
     */
    public int insertAreatable(Areatable areatable);

    /**
     * 修改【请填写功能名称】
     * 
     * @param areatable 【请填写功能名称】
     * @return 结果
     */
    public int updateAreatable(Areatable areatable);

    /**
     * 删除【请填写功能名称】
     * 
     * @param areaId 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteAreatableByAreaId(Long areaId);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param areaIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteAreatableByAreaIds(Long[] areaIds);
}
