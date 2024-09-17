package com.ruoyi.system.mapper.view;


import com.ruoyi.system.domain.model.WifiTableView;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface WifiTableViewMapper {
    /**
     * 查询指纹视图中的数据
     * @param areaId
     * @return 【指纹视图列表】
     */
    public List<WifiTableView> selectWifiTableViewByAreaId(Long areaId);
}
