package com.ruoyi.web.controller.system;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.system.domain.UserLocation;
import com.ruoyi.system.mapper.UserLocationMapper;
import com.ruoyi.system.service.IUserLocationService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Api("用户位置管理")
@RestController
@RequestMapping("/system/userLocation/")
public class UserLocationController extends BaseController {

    @Autowired
    private IUserLocationService userLocationService;

    @ApiOperation("依据用户名查询用户位置信息")
    @GetMapping("/username")
    public AjaxResult getUserLocationByUserName(String userName){
        return new AjaxResult(1,"查询成功",userLocationService.selectUserLocationByUserName(userName));
    }


    @ApiOperation("依据用户查询所有人的位置信息")
    @GetMapping("/list")
    public TableDataInfo getUserLocationList(UserLocation userLocation){
        List<UserLocation> userLocationList = userLocationService.selectUserLocationList(userLocation);
        return getDataTable(userLocationList);
    }


    @ApiOperation("插入用户的位置信息")
    @PostMapping
    public AjaxResult insertUserLocation(@RequestBody UserLocation userLocation){
        return new AjaxResult(userLocationService.insertUserLocation(userLocation),"插入成功");
    }
}
