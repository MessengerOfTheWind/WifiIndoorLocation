package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.Positiontable;

/**
 * 【请填写功能名称】Service接口
 * 
 * @author ruoyi
 * @date 2024-03-30
 */
public interface IPositiontableService 
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param poId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public Positiontable selectPositiontableByPoId(Long poId);

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param positiontable 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<Positiontable> selectPositiontableList(Positiontable positiontable);

    /**
     * 新增【请填写功能名称】
     * 
     * @param positiontable 【请填写功能名称】
     * @return 结果
     */
    public int insertPositiontable(Positiontable positiontable);

    /**
     * 修改【请填写功能名称】
     * 
     * @param positiontable 【请填写功能名称】
     * @return 结果
     */
    public int updatePositiontable(Positiontable positiontable);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param poIds 需要删除的【请填写功能名称】主键集合
     * @return 结果
     */
    public int deletePositiontableByPoIds(Long[] poIds);

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param poId 【请填写功能名称】主键
     * @return 结果
     */
    public int deletePositiontableByPoId(Long poId);
}
