package com.ruoyi.web.controller.screen;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.screen.poji.vo.PersonDistributionDonut;
import com.ruoyi.screen.service.IScreenMonitorService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@Api("大屏监控系统")
@RestController
@RequestMapping("/screen/BigScreenMonitor")
public class BigScreenMonitor extends BaseController {
    @Autowired
    private IScreenMonitorService screenMonitorService;
    @ApiOperation("获取人员分布环形图")
    @GetMapping("/personDistributionDonutC")
    public TableDataInfo GetPersonDistributeDonut(){
        List<PersonDistributionDonut> personDistributionDonutList = screenMonitorService.GetPersonDistributionDonut();
        return getDataTable(personDistributionDonutList);
    }
}
