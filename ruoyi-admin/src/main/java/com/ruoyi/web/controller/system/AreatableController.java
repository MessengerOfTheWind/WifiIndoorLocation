package com.ruoyi.web.controller.system;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

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
import com.ruoyi.system.domain.Areatable;
import com.ruoyi.system.service.IAreatableService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 【请填写功能名称】Controller
 * 
 * @author ruoyi
 * @date 2024-03-30
 */
@Api("区域信息管理")
@RestController
@RequestMapping("/system/areatable")
public class AreatableController extends BaseController
{
    @Autowired
    private IAreatableService areatableService;

    /**
     * 查询【请填写功能名称】列表
     */
    @ApiOperation("获取区域列表")
//    @PreAuthorize("@ss.hasPermi('system:areatable:list')")
    @GetMapping("/list")
    public TableDataInfo list(Areatable areatable)
    {
        startPage();
        List<Areatable> list = areatableService.selectAreatableList(areatable);
        return getDataTable(list);
    }

    /**
     * 导出【请填写功能名称】列表
     */
    @PreAuthorize("@ss.hasPermi('system:areatable:export')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Areatable areatable)
    {
        List<Areatable> list = areatableService.selectAreatableList(areatable);
        ExcelUtil<Areatable> util = new ExcelUtil<Areatable>(Areatable.class);
        util.exportExcel(response, list, "【请填写功能名称】数据");
    }

    /**
     * 获取【请填写功能名称】详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:areatable:query')")
    @GetMapping(value = "/{areaId}")
    public AjaxResult getInfo(@PathVariable("areaId") Long areaId)
    {
        return success(areatableService.selectAreatableByAreaId(areaId));
    }

    /**
     * 新增【请填写功能名称】
     */
    @ApiOperation("新增区域")
//    @PreAuthorize("@ss.hasPermi('system:areatable:add')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Areatable areatable)
    {
        return toAjax(areatableService.insertAreatable(areatable));
    }

    /**
     * 修改【请填写功能名称】
     */
    @PreAuthorize("@ss.hasPermi('system:areatable:edit')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Areatable areatable)
    {
        return toAjax(areatableService.updateAreatable(areatable));
    }

    /**
     * 删除【请填写功能名称】
     */
    @PreAuthorize("@ss.hasPermi('system:areatable:remove')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.DELETE)
	@DeleteMapping("/{areaIds}")
    public AjaxResult remove(@PathVariable Long[] areaIds)
    {
        return toAjax(areatableService.deleteAreatableByAreaIds(areaIds));
    }
}
