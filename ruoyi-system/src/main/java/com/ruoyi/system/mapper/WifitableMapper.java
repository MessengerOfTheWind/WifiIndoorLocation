package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.Wifitable;
import com.ruoyi.system.domain.vo.WifiTableVo;

/**
 * 【请填写功能名称】Mapper接口
 * 
 * @author ruoyi
 * @date 2024-03-30
 */
public interface WifitableMapper 
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param wiId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public Wifitable selectWifitableByWiId(Long wiId);

    public Wifitable countWifiTable(WifiTableVo wifiTableVo);

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param wifitable 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<Wifitable> selectWifitableList(Wifitable wifitable);

    /**
     * 统计【wifiTable】个数
     * @param
     */

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
     * 删除【请填写功能名称】
     * 
     * @param wiId 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteWifitableByWiId(Long wiId);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param wiIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteWifitableByWiIds(Long[] wiIds);
}
