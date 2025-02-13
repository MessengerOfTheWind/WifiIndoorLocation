package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.Positiontable;
import org.apache.ibatis.annotations.Mapper;

/**
 * 【请填写功能名称】Mapper接口
 * 
 * @author ruoyi
 * @date 2024-03-30
 */
@Mapper
public interface PositiontableMapper 
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param poId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public Positiontable selectPositiontableByPoId(Long poId);

    /**
     * 查询【依据区域id查询positionList】
     * @param areaId 【区域号】
     * @return 【该区域的所有position】
     */

    public List<Positiontable> selectAreaIdList(Long areaId);
    public Positiontable selectPoIdByPosition(Positiontable positiontable);

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
     * 删除【请填写功能名称】
     * 
     * @param poId 【请填写功能名称】主键
     * @return 结果
     */
    public int deletePositiontableByPoId(Long poId);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param poIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deletePositiontableByPoIds(Long[] poIds);
}
