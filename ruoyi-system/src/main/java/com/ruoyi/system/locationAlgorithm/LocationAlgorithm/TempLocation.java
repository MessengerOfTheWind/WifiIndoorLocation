package com.ruoyi.system.locationAlgorithm.LocationAlgorithm;

import com.ruoyi.system.domain.Positiontable;
import com.ruoyi.system.mapper.AptableMapper;
import com.ruoyi.system.mapper.PositiontableMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Map;
@Component
public class TempLocation {
    @Autowired
    private AptableMapper aptableMapper;
    @Autowired
    private PositiontableMapper positiontableMapper;
    public String getLocation(Map<Long, Integer> targetMap){
        //找到最前和次强的信号值
        Long firstApId = -1L;
        Long secApId = -1L;
        Integer firstRssi = -100;
        Integer secRssi = -100;
        for (Long apId: targetMap.keySet()
             ) {
            Integer thisRssi = targetMap.get(apId);
            if(thisRssi > firstRssi){
                firstRssi = thisRssi;
                firstApId = apId;
            }else if(thisRssi > secRssi){
                secRssi = thisRssi;
                secApId = apId;
            }
        }
        //如果最强的信号>-55,返回apId
        if(firstRssi > -55){
            Long apId = firstApId;
            Long poId = aptableMapper.selectAptableByApId(apId).getPoId();
            Positiontable positiontable = positiontableMapper.selectPositiontableByPoId(poId);
            String xyz = positiontable.getPoX().toString() +", "+ positiontable.getPoY().toString() +", "+ positiontable.getPoZ().toString();
            return xyz;
        }else if (firstRssi - secRssi<8){
            Long firstPoId = aptableMapper.selectAptableByApId(firstApId).getPoId();
            Long secPoId = aptableMapper.selectAptableByApId(secApId).getPoId();
            Positiontable firstPosition = positiontableMapper.selectPositiontableByPoId(firstPoId);
            Positiontable secPosition = positiontableMapper.selectPositiontableByPoId(secPoId);
            Integer x = Math.round((firstPosition.getPoX() + secPosition.getPoX())/2);
            Integer y = Math.round((firstPosition.getPoY() + secPosition.getPoY())/2);
            String xyz = x.toString() + ", "+ y.toString() + ", 1";
            return xyz;
        }else{
            return "7, 7 ,1";
        }
    }
}
