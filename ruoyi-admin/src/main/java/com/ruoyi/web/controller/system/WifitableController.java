package com.ruoyi.web.controller.system;

import java.lang.reflect.Array;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson2.function.impl.ToString;
import com.ruoyi.system.domain.*;
import com.ruoyi.system.domain.dto.WifiFinger;
import com.ruoyi.system.mapper.MeasurewifitableMapper;
import com.ruoyi.system.service.IAptableService;
import com.ruoyi.system.service.IMeasurewifitableService;
import com.ruoyi.system.service.IPositiontableService;
import com.ruoyi.system.service.impl.MeasurewifitableServiceImpl;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.service.IWifitableService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 【请填写功能名称】Controller
 *
 * @author ruoyi
 * @date 2024-03-30
 */
@Api("指纹库管理")
@RestController
@RequestMapping("/system/wifitable")
public class WifitableController extends BaseController
{
    @Autowired
    private IWifitableService wifitableService;

    @Autowired
    private IAptableService aptableService;

    @Autowired
    private IPositiontableService positiontableService;

    @Autowired
    private IMeasurewifitableService measurewifitableService;

    /**
     * 查询【请填写功能名称】列表
     */
    @ApiOperation("查询wifi指纹库列表")
//    @PreAuthorize("@ss.hasPermi('system:wifitable:list')")
    @GetMapping("/list")
    public TableDataInfo list(Wifitable wifitable)
    {
        startPage();
        List<Wifitable> list = wifitableService.selectWifitableList(wifitable);
        return getDataTable(list);
    }

    /**
     * 导出【请填写功能名称】列表
     */
    @PreAuthorize("@ss.hasPermi('system:wifitable:export')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Wifitable wifitable)
    {
        List<Wifitable> list = wifitableService.selectWifitableList(wifitable);
        ExcelUtil<Wifitable> util = new ExcelUtil<Wifitable>(Wifitable.class);
        util.exportExcel(response, list, "【请填写功能名称】数据");
    }

    /**
     * 获取【请填写功能名称】详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:wifitable:query')")
    @GetMapping(value = "/{wiId}")
    public AjaxResult getInfo(@PathVariable("wiId") Long wiId)
    {
        return success(wifitableService.selectWifitableByWiId(wiId));
    }

    /**
     * 新增【请填写功能名称】
     */
    @ApiOperation("新增指纹")
//    @PreAuthorize("@ss.hasPermi('system:wifitable:add')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.INSERT)
    @PostMapping("/updateOrInsert")
    public AjaxResult addOrUpdate(@RequestBody WifiFinger wifiFinger)
    {
        return toAjax(wifitableService.insertOrUpdate(wifiFinger));
    }



    /**
     * 修改【请填写功能名称】
     */
    @PreAuthorize("@ss.hasPermi('system:wifitable:edit')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Wifitable wifitable)
    {
        return toAjax(wifitableService.updateWifitable(wifitable));
    }

    /**
     * 更新【请填写功能名称】
     */
//    @PreAuthorize("@ss.hasPermi('system:wifitable:edit')")
    @Log(title = "【更新wifitable】", businessType = BusinessType.UPDATE)
    @PutMapping("/update")
    public AjaxResult update(@RequestBody WifiPre wifiPre)
    {
        String apMac= wifiPre.getApMac();
        Long areaId = wifiPre.getAreaId();
        Float X = wifiPre.getPoX();
        Float Y = wifiPre.getPoY();
        Float Z = wifiPre.getPoZ();

        //查询wifiPre对应的apID
        Aptable aptable = new Aptable();
        aptable.setApMac(wifiPre.getApMac());
        List<Aptable> apList = aptableService.selectAptableList(aptable);
        // 将wifitable的更新Apid修改
        Wifitable wifitable = new Wifitable();
        wifitable.setApId(apList.get(0).getApId());
        // 获取对应的poId
        Positiontable positiontable = new Positiontable("XYZ/finger position",areaId,X,Y,Z);
        // 获取位置id
        List<Positiontable> poList = positiontableService.selectPositiontableList(positiontable);
        wifitable.setPoId(poList.get(0).getPoId());
        // 获取指纹表中的所有信号
        Measurewifitable measurewifitable = new Measurewifitable(areaId,apMac,X,Y,Z);
        List<Measurewifitable> measurewifitableList = measurewifitableService.selectMeasurewifitableList(measurewifitable);
        // 求这些信号的平均值
        int averTotal = 0;
        for (int i = 0; i < measurewifitableList.size(); i++) {
            averTotal += measurewifitableList.get(i).getMeasureWifiRssi();
        }
        Integer aver = (int)Math.round((double) averTotal/measurewifitableList.size());
//      List<Wifitable> wifitableList = wifitableService.selectWifitableList()
        wifitable.setWiRssi(aver);
        return toAjax(wifitableService.updateWifitable(wifitable));
    }

    /**
     * 删除【请填写功能名称】
     */
    @PreAuthorize("@ss.hasPermi('system:wifitable:remove')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.DELETE)
    @DeleteMapping("/{wiIds}")
    public AjaxResult remove(@PathVariable Long[] wiIds)
    {
        return toAjax(wifitableService.deleteWifitableByWiIds(wiIds));
    }
}
