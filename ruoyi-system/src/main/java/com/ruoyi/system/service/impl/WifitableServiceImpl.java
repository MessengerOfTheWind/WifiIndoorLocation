package com.ruoyi.system.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.ruoyi.system.domain.Aptable;
import com.ruoyi.system.domain.Measurewifitable;
import com.ruoyi.system.domain.Positiontable;
import com.ruoyi.system.domain.dto.WifiFinger;
import com.ruoyi.system.domain.vo.WifiTableVo;
import com.ruoyi.system.mapper.AptableMapper;
import com.ruoyi.system.mapper.MeasurewifitableMapper;
import com.ruoyi.system.mapper.PositiontableMapper;
import org.apache.poi.util.Internal;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

    @Autowired
    private PositiontableMapper positiontableMapper;

    @Autowired
    private AptableMapper aptableMapper;

    @Autowired
    private MeasurewifitableMapper measurewifitableMapper;

    private static final Logger logger = LoggerFactory.getLogger(WifitableServiceImpl.class);

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
     * 新增或者删除wifitable
     * @param wifiFinger
     * @return int
     */
    public int insertOrUpdate(WifiFinger wifiFinger){
        // 对wifiFinger做拆分
        Long areaId = wifiFinger.getAreaId();
        Float x = wifiFinger.getPoX();
        Float y = wifiFinger.getPoY();
        Float z = wifiFinger.getPoZ();
        // 获取对应的poId
        Positiontable positiontable = new Positiontable("XYZ/finger position",areaId,x,y,z);
        Positiontable position = positiontableMapper.selectPoIdByPosition(positiontable);
        if (position == null){
            try{
                logger.info("insert position");
                positiontableMapper.insertPositiontable(positiontable);
            }catch (Exception e){
                logger.error("insert position error");
                return 0;
            }
            logger.info("insert position successfully");
            position = positiontableMapper.selectPoIdByPosition(positiontable);
        }
        Long poId = position.getPoId();
        try{
            for (String mac: wifiFinger.getMacList()
            ) {
                logger.info("Start to update or insert wifiTable");
                //查询wifiPre对应的apID
                Long apId = aptableMapper.selectByMacApIdArea(new Aptable(mac, areaId));
                Measurewifitable measurewifitable = new Measurewifitable(areaId, mac, x, y, z);
                List<Measurewifitable> measurewifitableList = measurewifitableMapper.selectMeasurewifitableList(measurewifitable);
                // 求这些信号的平均值
                int averTotal = 0;
                for (int i = 0; i < measurewifitableList.size(); i++) {
                    averTotal += measurewifitableList.get(i).getMeasureWifiRssi();
                }
                Integer aver = (int)Math.round((double) averTotal/measurewifitableList.size());
                // 查看是否存在该指纹点
                Wifitable wifitable = wifitableMapper.countWifiTable(new WifiTableVo(poId, apId));
                if(wifitable==null){
                    wifitableMapper.insertWifitable(new Wifitable(poId, apId, aver));
                }else{
                    wifitable.setWiRssi(aver);
                    wifitableMapper.updateWifitable(wifitable);
                }
            }
            logger.info("Having updated or inserted wifiTable");
        }catch (Exception e){
            logger.error("Update or insert error");
            return 0;
        }
        return 1;
    };
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
