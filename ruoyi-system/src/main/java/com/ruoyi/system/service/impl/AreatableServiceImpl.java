package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.AreatableMapper;
import com.ruoyi.system.domain.Areatable;
import com.ruoyi.system.service.IAreatableService;

/**
 * 【请填写功能名称】Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-03-30
 */
@Service
public class AreatableServiceImpl implements IAreatableService 
{
    @Autowired
    private AreatableMapper areatableMapper;

    /**
     * 查询【请填写功能名称】
     * 
     * @param areaId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    @Override
    public Areatable selectAreatableByAreaId(Long areaId)
    {
        return areatableMapper.selectAreatableByAreaId(areaId);
    }

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param areatable 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<Areatable> selectAreatableList(Areatable areatable)
    {
        return areatableMapper.selectAreatableList(areatable);
    }

    /**
     * 新增【请填写功能名称】
     * 
     * @param areatable 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertAreatable(Areatable areatable)
    {
        return areatableMapper.insertAreatable(areatable);
    }

    /**
     * 修改【请填写功能名称】
     * 
     * @param areatable 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateAreatable(Areatable areatable)
    {
        return areatableMapper.updateAreatable(areatable);
    }

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param areaIds 需要删除的【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteAreatableByAreaIds(Long[] areaIds)
    {
        return areatableMapper.deleteAreatableByAreaIds(areaIds);
    }

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param areaId 【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteAreatableByAreaId(Long areaId)
    {
        return areatableMapper.deleteAreatableByAreaId(areaId);
    }
}
