<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="位置名字" prop="poName">
        <el-input
          v-model="queryParams.poName"
          placeholder="请输入位置名字"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="所处区域 id" prop="areaId">
        <el-input
          v-model="queryParams.areaId"
          placeholder="请输入所处区域 id"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="x轴" prop="poX">
        <el-input
          v-model="queryParams.poX"
          placeholder="请输入x轴"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="y轴" prop="poY">
        <el-input
          v-model="queryParams.poY"
          placeholder="请输入y轴"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="z轴" prop="poZ">
        <el-input
          v-model="queryParams.poZ"
          placeholder="请输入z轴"
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
          v-hasPermi="['system:positiontable:add']"
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
          v-hasPermi="['system:positiontable:edit']"
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
          v-hasPermi="['system:positiontable:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:positiontable:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="positiontableList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="位置 id" align="center" prop="poId" />
      <el-table-column label="位置名字" align="center" prop="poName" />
      <el-table-column label="所处区域 id" align="center" prop="areaId" />
      <el-table-column label="x轴" align="center" prop="poX" />
      <el-table-column label="y轴" align="center" prop="poY" />
      <el-table-column label="z轴" align="center" prop="poZ" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:positiontable:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:positiontable:remove']"
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
        <el-form-item label="位置名字" prop="poName">
          <el-input v-model="form.poName" placeholder="请输入位置名字" />
        </el-form-item>
        <el-form-item label="所处区域 id" prop="areaId">
          <el-input v-model="form.areaId" placeholder="请输入所处区域 id" />
        </el-form-item>
        <el-form-item label="x轴" prop="poX">
          <el-input v-model="form.poX" placeholder="请输入x轴" />
        </el-form-item>
        <el-form-item label="y轴" prop="poY">
          <el-input v-model="form.poY" placeholder="请输入y轴" />
        </el-form-item>
        <el-form-item label="z轴" prop="poZ">
          <el-input v-model="form.poZ" placeholder="请输入z轴" />
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
import { listPositiontable, getPositiontable, delPositiontable, addPositiontable, updatePositiontable } from "@/api/position/positiontable";

export default {
  name: "Positiontable",
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
      positiontableList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        poName: null,
        areaId: null,
        poX: null,
        poY: null,
        poZ: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        poName: [
          { required: true, message: "位置名字不能为空", trigger: "blur" }
        ],
        areaId: [
          { required: true, message: "所处区域 id不能为空", trigger: "blur" }
        ],
        poX: [
          { required: true, message: "x轴不能为空", trigger: "blur" }
        ],
        poY: [
          { required: true, message: "y轴不能为空", trigger: "blur" }
        ],
        poZ: [
          { required: true, message: "z轴不能为空", trigger: "blur" }
        ]
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
      listPositiontable(this.queryParams).then(response => {
        this.positiontableList = response.rows;
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
        poId: null,
        poName: null,
        areaId: null,
        poX: null,
        poY: null,
        poZ: null
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
      this.ids = selection.map(item => item.poId)
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
      const poId = row.poId || this.ids
      getPositiontable(poId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改【请填写功能名称】";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.poId != null) {
            updatePositiontable(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addPositiontable(this.form).then(response => {
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
      const poIds = row.poId || this.ids;
      this.$modal.confirm('是否确认删除【请填写功能名称】编号为"' + poIds + '"的数据项？').then(function() {
        return delPositiontable(poIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/positiontable/export', {
        ...this.queryParams
      }, `positiontable_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
