package com.ruoyi.web.controller.system;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.system.domain.Aptable;
import com.ruoyi.system.domain.WifiPosition;
import com.ruoyi.system.domain.Wifitable;
import com.ruoyi.system.service.IWifitableService;
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
import com.ruoyi.system.domain.Positiontable;
import com.ruoyi.system.service.IPositiontableService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 【请填写功能名称】Controller
 * 
 * @author ruoyi
 * @date 2024-03-30
 */
@Api("位置管理")
@RestController
@RequestMapping("/system/positiontable")
public class PositiontableController extends BaseController
{
    @Autowired
    private IPositiontableService positiontableService;

    @Autowired
    private IWifitableService wifitableService;

    /**
     * 查询【请填写功能名称】列表
     */
    @ApiOperation("查询位置列表")
//    @PreAuthorize("@ss.hasPermi('system:positiontable:list')")
    @GetMapping("/list")
    public TableDataInfo list(Positiontable positiontable)
    {
        startPage();
        List<Positiontable> list = positiontableService.selectPositiontableList(positiontable);
        return getDataTable(list);
    }

    /**
     * 导出【请填写功能名称】列表
     */
    @PreAuthorize("@ss.hasPermi('system:positiontable:export')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Positiontable positiontable)
    {
        List<Positiontable> list = positiontableService.selectPositiontableList(positiontable);
        ExcelUtil<Positiontable> util = new ExcelUtil<Positiontable>(Positiontable.class);
        util.exportExcel(response, list, "【请填写功能名称】数据");
    }

    /**
     * 获取【请填写功能名称】详细信息
     */

    @PreAuthorize("@ss.hasPermi('system:positiontable:query')")
    @GetMapping(value = "/{poId}")
    public AjaxResult getInfo(@PathVariable("poId") Long poId)
    {
        return success(positiontableService.selectPositiontableByPoId(poId));
    }

    /**
     * 新增【请填写功能名称】
     */
    @ApiOperation("新增位置")
//    @PreAuthorize("@ss.hasPermi('system:positiontable:add')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Positiontable positiontable)
    {
        return toAjax(positiontableService.insertPositiontable(positiontable));
    }

    /**
     * 新增【指纹信息和指纹位置】
     */
    @ApiOperation("新增指纹信息和指纹位置")
//    @PreAuthorize("@ss.hasPermi('system:positiontable:add')")
    @Log(title = "【新增指纹信息和指纹位置】", businessType = BusinessType.INSERT)
    @PostMapping("/solveTwo")
    public AjaxResult add(@RequestBody WifiPosition wifiPosition)
    {
        // 新增位置
        Positiontable positiontable = new Positiontable("XYZ"+"/finger position", wifiPosition.getAreaId(), wifiPosition.getPoX(), wifiPosition.getPoY(), wifiPosition.getPoZ());
        List<Positiontable> positiontableList = positiontableService.selectPositiontableList(positiontable);
        // 如果存在位置，直接插入
        if(positiontableList.size()==0){
            int res = positiontableService.insertPositiontable(positiontable);
            if(res == 0)
                return new AjaxResult(-1,"指纹点位置无法插入，指纹对比信息无法插入");
        } else if (positiontableList.size() > 1) {
            return new AjaxResult(-1,"请检查数据库中指纹点位置是否重复");
        }
        List<Positiontable> poTableList = positiontableService.selectPositiontableList(positiontable);
        // 添加指纹
        Wifitable wifitable = new Wifitable();
        wifitable.setPoId(poTableList.get(0).getPoId());
        wifitable.setApId(wifiPosition.getApId());
        List<Wifitable> wifitableList = wifitableService.selectWifitableList(wifitable);
        if (wifitableList.size() > 0)
            return new AjaxResult(-1,"wifi指纹已存在，请勿重复添加");
        return toAjax(wifitableService.insertWifitable(wifitable));
    }

    /**
     * 修改【请填写功能名称】
     */
    @PreAuthorize("@ss.hasPermi('system:positiontable:edit')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Positiontable positiontable)
    {
        return toAjax(positiontableService.updatePositiontable(positiontable));
    }

    /**
     * 删除【请填写功能名称】
     */
    @PreAuthorize("@ss.hasPermi('system:positiontable:remove')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.DELETE)
    @DeleteMapping("/{poIds}")
    public AjaxResult remove(@PathVariable Long[] poIds)
    {
        return toAjax(positiontableService.deletePositiontableByPoIds(poIds));
    }
}
