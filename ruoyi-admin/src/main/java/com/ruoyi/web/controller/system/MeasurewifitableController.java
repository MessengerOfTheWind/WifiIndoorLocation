package com.ruoyi.web.controller.system;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.core.domain.entity.SysUser;
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
import com.ruoyi.system.domain.Measurewifitable;
import com.ruoyi.system.service.IMeasurewifitableService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;
import org.springframework.web.multipart.MultipartFile;

/**
 * 【请填写功能名称】Controller
 * 
 * @author ruoyi
 * @date 2024-03-30
 */
@Api("信号对比库管理")
@RestController
@RequestMapping("/system/measurewifitable")
public class MeasurewifitableController extends BaseController
{
    @Autowired
    private IMeasurewifitableService measurewifitableService;

    /**
     * 查询【请填写功能名称】列表
     */
    @ApiOperation("获取信号库列表")
    @PreAuthorize("@ss.hasPermi('system:measurewifitable:list')")
    @GetMapping("/list")
    public TableDataInfo list(Measurewifitable measurewifitable)
    {
        startPage();
        List<Measurewifitable> list = measurewifitableService.selectMeasurewifitableList(measurewifitable);
        return getDataTable(list);
    }

    /**
     * 导出【请填写功能名称】列表
     */
    @PreAuthorize("@ss.hasPermi('system:measurewifitable:export')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Measurewifitable measurewifitable)
    {
        List<Measurewifitable> list = measurewifitableService.selectMeasurewifitableList(measurewifitable);
        ExcelUtil<Measurewifitable> util = new ExcelUtil<Measurewifitable>(Measurewifitable.class);
        util.exportExcel(response, list, "【请填写功能名称】数据");
    }

    @Log(title = "用户管理", businessType = BusinessType.IMPORT)
    @PreAuthorize("@ss.hasPermi('system:measurewifitable:import')")
    @PostMapping("/importData")
    public AjaxResult importData(MultipartFile file, boolean updateSupport) throws Exception
    {
        ExcelUtil<Measurewifitable> util = new ExcelUtil<Measurewifitable>(Measurewifitable.class);
        List<Measurewifitable> measurewifitableList = util.importExcel(file.getInputStream());
        String operName = getUsername();
        String message = measurewifitableService.importMeasureWifitable(measurewifitableList, updateSupport);
        return success(message);
    }

    @PostMapping("/importTemplate")
    public void importTemplate(HttpServletResponse response)
    {
        ExcelUtil<Measurewifitable> util = new ExcelUtil<Measurewifitable>(Measurewifitable.class);
        util.importTemplateExcel(response, "wifi信号数据");
    }

    /**
     * 获取【请填写功能名称】详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:measurewifitable:query')")
    @GetMapping(value = "/{measureWifiId}")
    public AjaxResult getInfo(@PathVariable("measureWifiId") Long measureWifiId)
    {
        return success(measurewifitableService.selectMeasurewifitableByMeasureWifiId(measureWifiId));
    }

    /**
     * 新增【请填写功能名称】
     */
    @ApiOperation("新增信号")
//    @PreAuthorize("@ss.hasPermi('system:measurewifitable:add')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Measurewifitable measurewifitable)
    {
        return toAjax(measurewifitableService.insertMeasurewifitable(measurewifitable));
    }

    /**
     * 修改【请填写功能名称】
     */
    @PreAuthorize("@ss.hasPermi('system:measurewifitable:edit')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Measurewifitable measurewifitable)
    {
        return toAjax(measurewifitableService.updateMeasurewifitable(measurewifitable));
    }

    /**
     * 删除【请填写功能名称】
     */
    @PreAuthorize("@ss.hasPermi('system:measurewifitable:remove')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.DELETE)
	@DeleteMapping("/{measureWifiIds}")
    public AjaxResult remove(@PathVariable Long[] measureWifiIds)
    {
        return toAjax(measurewifitableService.deleteMeasurewifitableByMeasureWifiIds(measureWifiIds));
    }
}
