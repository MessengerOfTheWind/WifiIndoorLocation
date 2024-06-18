package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.Aptable;

/**
 * 【请填写功能名称】Service接口
 * 
 * @author ruoyi
 * @date 2024-03-30
 */
public interface IAptableService 
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param apId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public Aptable selectAptableByApId(Long apId);

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param aptable 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<Aptable> selectAptableList(Aptable aptable);

    /**
     * 新增【请填写功能名称】
     * 
     * @param aptable 【请填写功能名称】
     * @return 结果
     */
    public int insertAptable(Aptable aptable);

    /**
     * 修改【请填写功能名称】
     * 
     * @param aptable 【请填写功能名称】
     * @return 结果
     */
    public int updateAptable(Aptable aptable);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param apIds 需要删除的【请填写功能名称】主键集合
     * @return 结果
     */
    public int deleteAptableByApIds(Long[] apIds);

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param apId 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteAptableByApId(Long apId);
}
