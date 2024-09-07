package com.ruoyi.web.controller.system;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.system.domain.ApPositionTable;
import com.ruoyi.system.domain.Positiontable;
import com.ruoyi.system.service.IPositiontableService;
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
import com.ruoyi.system.domain.Aptable;
import com.ruoyi.system.service.IAptableService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 【请填写功能名称】Controller
 * 
 * @author ruoyi
 * @date 2024-03-30
 */
@Api("ap信息管理")
@RestController
@RequestMapping("/system/aptable")
public class AptableController extends BaseController
{
    @Autowired
    private IAptableService aptableService;

    @Autowired
    private IPositiontableService positiontableService;

    /**
     * 查询【请填写功能名称】列表
     */
//    @PreAuthorize("@ss.hasPermi('system:aptable:list')")
    @ApiOperation("获取ap列表")
    @GetMapping("/list")
    public TableDataInfo list(Aptable aptable)
    {
        startPage();
        List<Aptable> list = aptableService.selectAptableList(aptable);
        return getDataTable(list);
    }

    /**
     * 导出【请填写功能名称】列表
     */
    @PreAuthorize("@ss.hasPermi('system:aptable:export')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Aptable aptable)
    {
        List<Aptable> list = aptableService.selectAptableList(aptable);
        ExcelUtil<Aptable> util = new ExcelUtil<Aptable>(Aptable.class);
        util.exportExcel(response, list, "【请填写功能名称】数据");
    }

    /**
     * 获取【请填写功能名称】详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:aptable:query')")
    @GetMapping(value = "/{apId}")
    public AjaxResult getInfo(@PathVariable("apId") Long apId)
    {
        return success(aptableService.selectAptableByApId(apId));
    }

    /**
     * 新增【请填写功能名称】
     */
    @ApiOperation("新增ap")
//    @PreAuthorize("@ss.hasPermi('system:aptable:add')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Aptable aptable)
    {
        // 新增位置信息
        return toAjax(aptableService.insertAptable(aptable));
    }

    /**
     * 新增【新增ap同时新增position】
     */
    @ApiOperation("新增positon和ap")
//    @PreAuthorize("@ss.hasPermi('system:aptable:add')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.INSERT)
    @PostMapping("/position")
    public AjaxResult addPosition(@RequestBody ApPositionTable apPositionTable)
    {
        // 新增位置信息
        Positiontable positiontable = new Positiontable(apPositionTable.getApName()+"/AP position",apPositionTable.getAreaId(), -1L, apPositionTable.getPoX(), apPositionTable.getPoY(), apPositionTable.getPoZ());
        try{
            positiontableService.insertPositiontable(positiontable);
        }
        catch(Exception e){
            System.out.println("insert position error, result reason: content error or content has existed");
        }
        List<Positiontable> poTableList = positiontableService.selectPositiontableList(positiontable);
        // 插入ap信息
        try{
            Aptable aptable = new Aptable(poTableList.get(0).getAreaId(), apPositionTable.getApName(), apPositionTable.getApMac(), apPositionTable.getAreaId(), poTableList.get(0).getPoId(), apPositionTable.getApDescription());
            int res = aptableService.insertAptable(aptable);
            return toAjax(res);
        }
        catch (Exception e){
            System.out.println("ap插入失败");
            return new AjaxResult(-1,"ap插入失败");
        }
    }

    /**
     * 修改【请填写功能名称】
     */
    @PreAuthorize("@ss.hasPermi('system:aptable:edit')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Aptable aptable)
    {
        return toAjax(aptableService.updateAptable(aptable));
    }

    /**
     * 删除【请填写功能名称】
     */
    @PreAuthorize("@ss.hasPermi('system:aptable:remove')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.DELETE)
    @DeleteMapping("/{apIds}")
    public AjaxResult remove(@PathVariable Long[] apIds)
    {
        return toAjax(aptableService.deleteAptableByApIds(apIds));
    }
}
