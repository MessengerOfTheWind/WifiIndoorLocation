package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.WifiMeasurements;

import java.util.List;

public interface WifiMeasureOrderMapper {
    /**
     * 查询 wifi_measurements_with_order 列表
     *
     * @param wifiMeasurements 查询条件
     * @return wifi_measurements_with_order 列表
     */
    List<WifiMeasurements> selectWifiMeasurementsList(WifiMeasurements wifiMeasurements);

    /**
     * 根据 ID 查询单条记录
     *
     * @param measureWifiId 主键 ID
     * @return WifiMeasurements 对象
     */
    WifiMeasurements selectWifiMeasurementsById(Long measureWifiId);

    /**
     * 插入一条新记录
     *
     * @param wifiMeasurements WifiMeasurements 对象
     * @return 影响行数
     */
    int insertWifiMeasurements(WifiMeasurements wifiMeasurements);
    /**
     * 更新记录
     *
     * @param wifiMeasurements WifiMeasurements 对象
     * @return 影响行数
     */
    int updateWifiMeasurements(WifiMeasurements wifiMeasurements);

    /**
     * 根据 ID 删除单条记录
     *
     * @param measureWifiId 主键 ID
     * @return 影响行数
     */
    int deleteWifiMeasurementsById(Long measureWifiId);

    /**
     * 批量删除记录
     *
     * @param measureWifiIds 主键 ID 列表
     * @return 影响行数
     */
    int deleteWifiMeasurementsByIds(Long[] measureWifiIds);
}
