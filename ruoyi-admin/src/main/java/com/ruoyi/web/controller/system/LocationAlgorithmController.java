//package com.ruoyi.web.controller.system;
//
//import com.ruoyi.common.annotation.Log;
//import com.ruoyi.common.core.controller.BaseController;
//import com.ruoyi.common.core.domain.AjaxResult;
//import com.ruoyi.common.enums.BusinessType;
//import com.ruoyi.system.domain.Aptable;
//import com.ruoyi.system.domain.Measurewifitable;
//import com.ruoyi.system.domain.localtion.ApSignal;
//import com.ruoyi.system.service.IAptableService;
//import com.ruoyi.system.service.IWifitableService;
//import io.swagger.annotations.Api;
//import io.swagger.annotations.ApiOperation;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.access.prepost.PreAuthorize;
//import org.springframework.web.bind.annotation.*;
//
//import java.util.List;
//
//
///**
// * 【定位算法】Controller
// *a
// * @author ruoyi
// * @date 2024-03-30
// */
//@Api("定位算法")
//@RestController
//@RequestMapping("/system/manual/location")
//public class LocationAlgorithmController extends BaseController{
//
//    @Autowired
//    private IAptableService aptableService;
////    @PreAuthorize("@ss.hasPermi('system:aptable:query')")
//
//    /**
//     *
//     * @param apId
//     * @return
//     */
//    @GetMapping(value = "/area/{areaId}")
//    public AjaxResult getInfo(@PathVariable("areaId") Long areaId)
//    {
//        Aptable ap = new Aptable(areaId);
//        List<Aptable> apList = aptableService.selectAptableList(ap);
//
////        return success(aptableService.selectAptableByApId(apId));
//        return success(1);
//    }
//
//    @ApiOperation("查询定位")
////    @PreAuthorize("@ss.hasPermi('system:measurewifitable:add')")
//    @Log(title = "【请填写功能名称】", businessType = BusinessType.INSERT)
//    @PostMapping
//    public AjaxResult add(@RequestBody ApSignal apSignal)
//    {
//
//    }
//
//}
