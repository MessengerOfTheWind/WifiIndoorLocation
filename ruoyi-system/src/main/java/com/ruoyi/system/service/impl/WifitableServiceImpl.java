package com.ruoyi.system.service.impl;

import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.WifitableMapper;
import com.ruoyi.system.domain.Wifitable;
import com.ruoyi.system.service.IWifitableService;

/**
 * 【请填写功能名称】Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-03-30
 */
@Service
public class WifitableServiceImpl implements IWifitableService 
{
    @Autowired
    private WifitableMapper wifitableMapper;

    /**
     * 查询【请填写功能名称】
     * 
     * @param wiId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    @Override
    public Wifitable selectWifitableByWiId(Long wiId)
    {
        return wifitableMapper.selectWifitableByWiId(wiId);
    }

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param wifitable 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<Wifitable> selectWifitableList(Wifitable wifitable)
    {
        return wifitableMapper.selectWifitableList(wifitable);
    }

    /**
     * 新增【请填写功能名称】
     * 
     * @param wifitable 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertWifitable(Wifitable wifitable)
    {
        return wifitableMapper.insertWifitable(wifitable);
    }

    /**
     * 修改【请填写功能名称】
     * 
     * @param wifitable 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateWifitable(Wifitable wifitable)
    {
        //载入当前日期
        Date date = new Date();
        wifitable.setWiDate(new java.sql.Date(date.getTime()));
        return wifitableMapper.updateWifitable(wifitable);
    }

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param wiIds 需要删除的【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteWifitableByWiIds(Long[] wiIds)
    {
        return wifitableMapper.deleteWifitableByWiIds(wiIds);
    }

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param wiId 【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteWifitableByWiId(Long wiId)
    {
        return wifitableMapper.deleteWifitableByWiId(wiId);
    }
}
