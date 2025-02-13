<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="wifi名称" prop="apName">
        <el-input
          v-model="queryParams.apName"
          placeholder="请输入wifi名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="物理地址" prop="apMac">
        <el-input
          v-model="queryParams.apMac"
          placeholder="请输入物理地址"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="所处区域" prop="areaId">
        <el-input
          v-model="queryParams.areaId"
          placeholder="请输入所处区域"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="位置信息
" prop="poId">
        <el-input
          v-model="queryParams.poId"
          placeholder="请输入位置信息
"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="描述" prop="apDescription">
        <el-input
          v-model="queryParams.apDescription"
          placeholder="请输入描述"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['system:aptable:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:aptable:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:aptable:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:aptable:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="aptableList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="wifi的id" align="center" prop="apId" />
      <el-table-column label="wifi名称" align="center" prop="apName" />
      <el-table-column label="物理地址" align="center" prop="apMac" />
      <el-table-column label="所处区域" align="center" prop="areaId" />
      <el-table-column label="位置信息" align="center" prop="poId" />
      <el-table-column label="描述" align="center" prop="apDescription" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:aptable:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:aptable:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改【请填写功能名称】对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="wifi名称" prop="apName">
          <el-input v-model="form.apName" placeholder="请输入wifi名称" />
        </el-form-item>
        <el-form-item label="物理地址" prop="apMac">
          <el-input v-model="form.apMac" placeholder="请输入物理地址" />
        </el-form-item>
        <el-form-item label="所处区域" prop="areaId">
          <el-input v-model="form.areaId" placeholder="请输入所处区域" />
        </el-form-item>
        <el-form-item label="位置信息" prop="poId">
          <el-input v-model="form.poId" placeholder="请输入位置信息
" />
        </el-form-item>
        <el-form-item label="描述" prop="apDescription">
          <el-input v-model="form.apDescription" placeholder="请输入描述" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listAptable, getAptable, delAptable, addAptable, updateAptable } from "@/api/position/aptable";

export default {
  name: "Aptable",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 【请填写功能名称】表格数据
      aptableList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        apName: null,
        apMac: null,
        areaId: null,
        poId: null,
        apDescription: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        apName: [
          { required: true, message: "wifi名称不能为空", trigger: "blur" }
        ],
        apMac: [
          { required: true, message: "物理地址不能为空", trigger: "blur" }
        ],
        areaId: [
          { required: true, message: "所处区域不能为空", trigger: "blur" }
        ],
        poId: [
          { required: true, message: "位置信息不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询【请填写功能名称】列表 */
    getList() {
      this.loading = true;
      listAptable(this.queryParams).then(response => {
        this.aptableList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        apId: null,
        apName: null,
        apMac: null,
        areaId: null,
        poId: null,
        apDescription: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.apId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加【请填写功能名称】";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const apId = row.apId || this.ids
      getAptable(apId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改【请填写功能名称】";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.apId != null) {
            updateAptable(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addAptable(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const apIds = row.apId || this.ids;
      this.$modal.confirm('是否确认删除【请填写功能名称】编号为"' + apIds + '"的数据项？').then(function() {
        return delAptable(apIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/aptable/export', {
        ...this.queryParams
      }, `aptable_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
