package com.ruoyi.system.service.impl;

import java.util.Date;
import java.util.List;

import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.MeasurewifitableMapper;
import com.ruoyi.system.domain.Measurewifitable;
import com.ruoyi.system.service.IMeasurewifitableService;

/**
 * 【请填写功能名称】Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-03-30
 */
@Service
public class MeasurewifitableServiceImpl implements IMeasurewifitableService 
{
    @Autowired
    private MeasurewifitableMapper measurewifitableMapper;
    private static final Logger log = LoggerFactory.getLogger(SysUserServiceImpl.class);

    /**
     * 查询【请填写功能名称】
     * 
     * @param measureWifiId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    @Override
    public Measurewifitable selectMeasurewifitableByMeasureWifiId(Long measureWifiId)
    {
        return measurewifitableMapper.selectMeasurewifitableByMeasureWifiId(measureWifiId);
    }

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param measurewifitable 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<Measurewifitable> selectMeasurewifitableList(Measurewifitable measurewifitable)
    {
        return measurewifitableMapper.selectMeasurewifitableList(measurewifitable);
    }

    /**
     * 新增【请填写功能名称】
     * 
     * @param measurewifitable 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertMeasurewifitable(Measurewifitable measurewifitable)
    {
        //载入当前日期
        Date date = new Date();
        measurewifitable.setMeasureWifiDate(new java.sql.Date(date.getTime()));
        return measurewifitableMapper.insertMeasurewifitable(measurewifitable);
    }

    /**
     * 修改【请填写功能名称】
     * 
     * @param measurewifitable 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateMeasurewifitable(Measurewifitable measurewifitable)
    {
        return measurewifitableMapper.updateMeasurewifitable(measurewifitable);
    }

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param measureWifiIds 需要删除的【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteMeasurewifitableByMeasureWifiIds(Long[] measureWifiIds)
    {
        return measurewifitableMapper.deleteMeasurewifitableByMeasureWifiIds(measureWifiIds);
    }

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param measureWifiId 【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteMeasurewifitableByMeasureWifiId(Long measureWifiId)
    {
        return measurewifitableMapper.deleteMeasurewifitableByMeasureWifiId(measureWifiId);
    }

    /**
     * 导入wifi信号数据
     *
     * @param measurewifitableList 用户数据列表
     * @param isUpdateSupport 是否更新支持，如果已存在，则进行更新数据
     * @return 结果
     */
    @Override
    public String importMeasureWifitable(List<Measurewifitable> measurewifitableList, Boolean isUpdateSupport)
    {
        if (StringUtils.isNull(measurewifitableList) || measurewifitableList.size() == 0)
        {
            throw new ServiceException("导入wifi信号数据不能为空！");
        }
        int successNum = 0;
        int failureNum = 0;
        StringBuilder successMsg = new StringBuilder();
        StringBuilder failureMsg = new StringBuilder();
        for (Measurewifitable measurewifitable : measurewifitableList)
        {
            try
            {
                List<Measurewifitable> exitedList = measurewifitableMapper.selectMeasurewifitableList(measurewifitable);
                if (StringUtils.isNull(exitedList) || exitedList.size()==0){
                    measurewifitableMapper.insertMeasurewifitable(measurewifitable);
                    successNum++;
                    successMsg.append("<br/>" + successNum + " 导入成功");
                }
                else if (isUpdateSupport)
                {
                    Measurewifitable Wifi = exitedList.get(0);
                    measurewifitable.setMeasureWifiId(Wifi.getMeasureWifiId());
                    measurewifitableMapper.updateMeasurewifitable(measurewifitable);
                    successNum++;
                    successMsg.append("<br/>" + successNum + " 更新成功");
                }
                else
                {
                    failureNum++;
                    failureMsg.append("<br/>" + failureNum + " 已存在");
                }
            }
            catch (Exception e)
            {
                failureNum++;
                String msg = "<br/>" + failureNum + " 导入失败：";
                failureMsg.append(msg + e.getMessage());
                log.error(msg, e);
            }
        }
        if (failureNum > 0)
        {
            failureMsg.insert(0, "很抱歉，导入失败！共 " + failureNum + " 条数据格式不正确，错误如下：");
            throw new ServiceException(failureMsg.toString());
        }
        else
        {
            successMsg.insert(0, "恭喜您，数据已全部导入成功！共 " + successNum + " 条，数据如下：");
        }
        return successMsg.toString();
    }
}
