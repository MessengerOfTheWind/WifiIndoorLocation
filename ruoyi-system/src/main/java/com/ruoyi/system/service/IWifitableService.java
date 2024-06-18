package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.Wifitable;

/**
 * 【请填写功能名称】Service接口
 * 
 * @author ruoyi
 * @date 2024-03-30
 */
public interface IWifitableService 
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param wiId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public Wifitable selectWifitableByWiId(Long wiId);

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param wifitable 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<Wifitable> selectWifitableList(Wifitable wifitable);

    /**
     * 新增【请填写功能名称】
     * 
     * @param wifitable 【请填写功能名称】
     * @return 结果
     */
    public int insertWifitable(Wifitable wifitable);

    /**
     * 修改【请填写功能名称】
     * 
     * @param wifitable 【请填写功能名称】
     * @return 结果
     */
    public int updateWifitable(Wifitable wifitable);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param wiIds 需要删除的【请填写功能名称】主键集合
     * @return 结果
     */
    public int deleteWifitableByWiIds(Long[] wiIds);

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param wiId 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteWifitableByWiId(Long wiId);
}
