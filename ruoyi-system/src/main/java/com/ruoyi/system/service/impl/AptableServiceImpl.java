package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.AptableMapper;
import com.ruoyi.system.domain.Aptable;
import com.ruoyi.system.service.IAptableService;

/**
 * 【请填写功能名称】Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-03-30
 */
@Service
public class AptableServiceImpl implements IAptableService 
{
    @Autowired
    private AptableMapper aptableMapper;

    /**
     * 查询【请填写功能名称】
     * 
     * @param apId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    @Override
    public Aptable selectAptableByApId(Long apId)
    {
        return aptableMapper.selectAptableByApId(apId);
    }

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param aptable 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<Aptable> selectAptableList(Aptable aptable)
    {
        return aptableMapper.selectAptableList(aptable);
    }

    /**
     * 新增【请填写功能名称】
     * 
     * @param aptable 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertAptable(Aptable aptable)
    {
        return aptableMapper.insertAptable(aptable);
    }

    /**
     * 修改【请填写功能名称】
     * 
     * @param aptable 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateAptable(Aptable aptable)
    {
        return aptableMapper.updateAptable(aptable);
    }

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param apIds 需要删除的【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteAptableByApIds(Long[] apIds)
    {
        return aptableMapper.deleteAptableByApIds(apIds);
    }

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param apId 【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteAptableByApId(Long apId)
    {
        return aptableMapper.deleteAptableByApId(apId);
    }
}
