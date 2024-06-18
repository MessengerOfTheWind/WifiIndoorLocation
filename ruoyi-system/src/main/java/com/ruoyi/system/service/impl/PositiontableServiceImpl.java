package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.PositiontableMapper;
import com.ruoyi.system.domain.Positiontable;
import com.ruoyi.system.service.IPositiontableService;

/**
 * 【请填写功能名称】Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-03-30
 */
@Service
public class PositiontableServiceImpl implements IPositiontableService 
{
    @Autowired
    private PositiontableMapper positiontableMapper;

    /**
     * 查询【请填写功能名称】
     * 
     * @param poId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    @Override
    public Positiontable selectPositiontableByPoId(Long poId)
    {
        return positiontableMapper.selectPositiontableByPoId(poId);
    }

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param positiontable 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<Positiontable> selectPositiontableList(Positiontable positiontable)
    {
        return positiontableMapper.selectPositiontableList(positiontable);
    }

    /**
     * 新增【请填写功能名称】
     * 
     * @param positiontable 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertPositiontable(Positiontable positiontable)
    {
        return positiontableMapper.insertPositiontable(positiontable);
    }

    /**
     * 修改【请填写功能名称】
     * 
     * @param positiontable 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updatePositiontable(Positiontable positiontable)
    {
        return positiontableMapper.updatePositiontable(positiontable);
    }

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param poIds 需要删除的【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deletePositiontableByPoIds(Long[] poIds)
    {
        return positiontableMapper.deletePositiontableByPoIds(poIds);
    }

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param poId 【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deletePositiontableByPoId(Long poId)
    {
        return positiontableMapper.deletePositiontableByPoId(poId);
    }
}
