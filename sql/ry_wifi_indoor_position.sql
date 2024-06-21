/*
 Navicat Premium Data Transfer

 Source Server         : yunmysql
 Source Server Type    : MySQL
 Source Server Version : 50744
 Source Host           : 120.27.111.189:3306
 Source Schema         : ry_wifi_indoor_position

 Target Server Type    : MySQL
 Target Server Version : 50744
 File Encoding         : 65001

 Date: 21/06/2024 20:26:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for aptable
-- ----------------------------
DROP TABLE IF EXISTS `aptable`;
CREATE TABLE `aptable`  (
  `ap_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'wifi的id',
  `ap_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'wifi名称',
  `ap_mac` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '物理地址',
  `area_id` bigint(20) NOT NULL COMMENT '所处区域',
  `po_id` bigint(20) NOT NULL COMMENT '位置信息\r',
  `ap_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`ap_id`) USING BTREE,
  UNIQUE INDEX `unique_id`(`ap_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 66 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of aptable
-- ----------------------------
INSERT INTO `aptable` VALUES (44, 'ZTE_51551F', '54:1f:8d:51:55:1f', 37, 55, '区域1的AP1');
INSERT INTO `aptable` VALUES (45, 'ZTE_50172E', '54:1f:8d:50:17:2e', 37, 56, '区域1的ap3');
INSERT INTO `aptable` VALUES (46, 'ZTE_469A71', '54:1f:8d:46:9a:71', 37, 57, '区域1的ap2');
INSERT INTO `aptable` VALUES (47, 'ZTE_4697EF', '54:1f:8d:46:97:ef', 37, 58, '区域1的ap4');
INSERT INTO `aptable` VALUES (48, 'ZTE_5155DD', '54:1f:8d:51:55:dd', 40, 59, '区域2的ap7');
INSERT INTO `aptable` VALUES (49, 'ZTE_5150A7', '54:1f:8d:51:50:a7', 40, 60, '区域2的AP5');
INSERT INTO `aptable` VALUES (50, 'ZTE_469878', '54:1f:8d:46:98:78', 40, 61, '区域2的ap6');
INSERT INTO `aptable` VALUES (51, 'ZTE_5150A7', '54:1f:8d:51:50:a7', 41, 62, '区域3的AP5');
INSERT INTO `aptable` VALUES (52, 'ZTE_469878', '54:1f:8d:46:98:78', 41, 63, '区域3的ap6');
INSERT INTO `aptable` VALUES (53, 'ZTE_5155DD', '54:1f:8d:51:55:dd', 41, 64, '区域3的ap7');
INSERT INTO `aptable` VALUES (54, 'ZTE_5150A7', '54:1f:8d:51:50:a7', 42, 65, '区域4的AP5');
INSERT INTO `aptable` VALUES (55, 'ZTE_5155DD', '54:1f:8d:51:55:dd', 42, 66, '区域4的ap7');
INSERT INTO `aptable` VALUES (56, 'ZTE_469878', '54:1f:8d:46:98:78', 42, 67, '区域4的ap6');
INSERT INTO `aptable` VALUES (57, 'ZTE_469878', '54:1f:8d:46:98:78', 43, 68, '区域5的AP6');
INSERT INTO `aptable` VALUES (58, 'ZTE_5155DD', '54:1f:8d:51:55:dd', 43, 69, '区域5的ap7');
INSERT INTO `aptable` VALUES (59, 'ZTE_5150A7', '54:1f:8d:51:50:a7', 43, 70, '区域5的AP5');
INSERT INTO `aptable` VALUES (60, 'ZTE_469878', '54:1f:8d:46:98:78', 44, 71, '区域6的AP6');
INSERT INTO `aptable` VALUES (61, 'ZTE_5150A7', '54:1f:8d:51:50:a7', 44, 72, '区域6的AP5');
INSERT INTO `aptable` VALUES (62, 'ZTE_5155DD', '54:1f:8d:51:55:dd', 44, 73, '区域6的ap7');
INSERT INTO `aptable` VALUES (63, 'ZTE_5155DD', '54:1f:8d:51:55:dd', 45, 74, '区域7的ap7');
INSERT INTO `aptable` VALUES (64, 'ZTE_469878', '54:1f:8d:46:98:78', 45, 75, '区域7的AP6');
INSERT INTO `aptable` VALUES (65, 'ETZ_5150A7', '54:1f:8d:51:50:a7', 45, 76, '区域7的AP5');

-- ----------------------------
-- Table structure for architectural_judgment
-- ----------------------------
DROP TABLE IF EXISTS `architectural_judgment`;
CREATE TABLE `architectural_judgment`  (
  `judge_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id自增',
  `order_num` int(11) NOT NULL COMMENT '建筑判定的要求数量',
  `chosen_num` int(11) NOT NULL COMMENT '多少个就判断建筑成功',
  PRIMARY KEY (`judge_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of architectural_judgment
-- ----------------------------
INSERT INTO `architectural_judgment` VALUES (1, 5, 3);

-- ----------------------------
-- Table structure for area_block
-- ----------------------------
DROP TABLE IF EXISTS `area_block`;
CREATE TABLE `area_block`  (
  `area_block_id` bigint(20) NOT NULL COMMENT 'ID',
  `block_order` int(11) NULL DEFAULT NULL COMMENT '区域块号',
  `area_id` bigint(20) NULL DEFAULT NULL COMMENT '所处区域',
  `块描述` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '对块的描述',
  PRIMARY KEY (`area_block_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of area_block
-- ----------------------------
INSERT INTO `area_block` VALUES (1, 1, 1, '1区域的块域1');

-- ----------------------------
-- Table structure for areatable
-- ----------------------------
DROP TABLE IF EXISTS `areatable`;
CREATE TABLE `areatable`  (
  `area_id` bigint(255) NOT NULL AUTO_INCREMENT COMMENT '区域id',
  `area_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区域名称',
  `area_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域描述\r',
  `area_apnum` int(11) NULL DEFAULT NULL COMMENT '区域布置数量',
  PRIMARY KEY (`area_id`, `area_name`) USING BTREE,
  UNIQUE INDEX `uniqueareaid`(`area_id`) USING BTREE,
  UNIQUE INDEX `unique_area_name`(`area_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of areatable
-- ----------------------------
INSERT INTO `areatable` VALUES (37, '区域1', '方案1的区域1', 4);
INSERT INTO `areatable` VALUES (40, '区域2', '方案2的区域1，ap距离为1m', 3);
INSERT INTO `areatable` VALUES (41, '区域3', '方案2的区域2，ap距离为2', 3);
INSERT INTO `areatable` VALUES (42, '区域4', '方案2的区域3，ap距离为3', 3);
INSERT INTO `areatable` VALUES (43, '区域5', '方案2的区域4，ap距离为4', 3);
INSERT INTO `areatable` VALUES (44, '区域6', '方案二的区域5，ap距离为5', 3);
INSERT INTO `areatable` VALUES (45, '区域7', '方案二的区域6，ap距离为6', 3);
INSERT INTO `areatable` VALUES (46, '测试区域', '测试数据', 5);

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (6, 'aptable', '', NULL, NULL, 'Aptable', 'crud', '', 'com.ruoyi.system', 'system', 'aptable', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2024-03-30 00:22:20', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (7, 'areatable', '', NULL, NULL, 'Areatable', 'crud', '', 'com.ruoyi.system', 'system', 'areatable', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2024-03-30 00:22:20', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (8, 'measurewifitable', '', NULL, NULL, 'Measurewifitable', 'crud', '', 'com.ruoyi.system', 'system', 'measurewifitable', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2024-03-30 00:22:20', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (9, 'positiontable', '', NULL, NULL, 'Positiontable', 'crud', '', 'com.ruoyi.system', 'system', 'positiontable', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2024-03-30 00:22:20', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (10, 'wifitable', '', NULL, NULL, 'Wifitable', 'crud', '', 'com.ruoyi.system', 'system', 'wifitable', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2024-03-30 00:22:20', '', NULL, NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint(20) NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (30, 6, 'ap_id', 'wifi的id', 'bigint(20)', 'Long', 'apId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-03-30 00:22:20', '', NULL);
INSERT INTO `gen_table_column` VALUES (31, 6, 'ap_name', 'wifi名称', 'varchar(255)', 'String', 'apName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-03-30 00:22:20', '', NULL);
INSERT INTO `gen_table_column` VALUES (32, 6, 'ap_mac', '物理地址', 'varchar(255)', 'String', 'apMac', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-03-30 00:22:20', '', NULL);
INSERT INTO `gen_table_column` VALUES (33, 6, 'area_id', '所处区域', 'bigint(20)', 'Long', 'areaId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-03-30 00:22:20', '', NULL);
INSERT INTO `gen_table_column` VALUES (34, 6, 'po_id', '位置信息\r', 'bigint(20)', 'Long', 'poId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-03-30 00:22:20', '', NULL);
INSERT INTO `gen_table_column` VALUES (35, 6, 'ap_description', '描述', 'varchar(255)', 'String', 'apDescription', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-03-30 00:22:20', '', NULL);
INSERT INTO `gen_table_column` VALUES (36, 7, 'area_id', '区域id', 'bigint(255)', 'Long', 'areaId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-03-30 00:22:20', '', NULL);
INSERT INTO `gen_table_column` VALUES (37, 7, 'area_name', '区域名称', 'varchar(255)', 'String', 'areaName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-03-30 00:22:20', '', NULL);
INSERT INTO `gen_table_column` VALUES (38, 7, 'area_description', '区域描述\r', 'varchar(255)', 'String', 'areaDescription', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-03-30 00:22:20', '', NULL);
INSERT INTO `gen_table_column` VALUES (39, 7, 'area_apnum', '区域布置数量', 'int(11)', 'Integer', 'areaApnum', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-03-30 00:22:20', '', NULL);
INSERT INTO `gen_table_column` VALUES (40, 8, 'measure_wifi_id', '对比 id\r', 'bigint(20)', 'Long', 'measureWifiId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-03-30 00:22:20', '', NULL);
INSERT INTO `gen_table_column` VALUES (41, 8, 'area_id', '区域 id', 'bigint(255)', 'Long', 'areaId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-03-30 00:22:20', '', NULL);
INSERT INTO `gen_table_column` VALUES (42, 8, 'wi_mac', 'mac 地址', 'varchar(255)', 'String', 'wiMac', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-03-30 00:22:20', '', NULL);
INSERT INTO `gen_table_column` VALUES (43, 8, 'measure_wifi_rssi', '产生的信号值', 'int(11)', 'Integer', 'measureWifiRssi', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-03-30 00:22:20', '', NULL);
INSERT INTO `gen_table_column` VALUES (44, 8, 'measure_wifi_date', '产生的时间', 'datetime', 'Date', 'measureWifiDate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2024-03-30 00:22:20', '', NULL);
INSERT INTO `gen_table_column` VALUES (45, 8, 'po_x', 'x轴', 'float', 'Float', 'poX', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-03-30 00:22:20', '', NULL);
INSERT INTO `gen_table_column` VALUES (46, 8, 'po_y', 'y轴', 'float', 'Float', 'poY', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-03-30 00:22:20', '', NULL);
INSERT INTO `gen_table_column` VALUES (47, 8, 'po_z', 'z轴', 'float', 'Float', 'poZ', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-03-30 00:22:20', '', NULL);
INSERT INTO `gen_table_column` VALUES (48, 9, 'po_id', '位置 id', 'bigint(20)', 'Long', 'poId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-03-30 00:22:20', '', NULL);
INSERT INTO `gen_table_column` VALUES (49, 9, 'po_name', '位置名字', 'varchar(255)', 'String', 'poName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-03-30 00:22:20', '', NULL);
INSERT INTO `gen_table_column` VALUES (50, 9, 'area_id', '所处区域 id', 'bigint(255)', 'Long', 'areaId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-03-30 00:22:20', '', NULL);
INSERT INTO `gen_table_column` VALUES (51, 9, 'po_x', 'x轴', 'float', 'Float', 'poX', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-03-30 00:22:20', '', NULL);
INSERT INTO `gen_table_column` VALUES (52, 9, 'po_y', 'y轴', 'float', 'Float', 'poY', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-03-30 00:22:20', '', NULL);
INSERT INTO `gen_table_column` VALUES (53, 9, 'po_z', 'z轴', 'float', 'Float', 'poZ', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-03-30 00:22:20', '', NULL);
INSERT INTO `gen_table_column` VALUES (54, 10, 'wi_id', '指纹 id', 'bigint(255)', 'Long', 'wiId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-03-30 00:22:20', '', NULL);
INSERT INTO `gen_table_column` VALUES (55, 10, 'po_id', '指纹所处位置 id', 'bigint(255)', 'Long', 'poId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-03-30 00:22:20', '', NULL);
INSERT INTO `gen_table_column` VALUES (56, 10, 'ap_id', ' wifi 硬件位置', 'bigint(255)', 'Long', 'apId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-03-30 00:22:20', '', NULL);
INSERT INTO `gen_table_column` VALUES (57, 10, 'wi_rssi', 'wifi 信号平均值', 'int(11)', 'Integer', 'wiRssi', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-03-30 00:22:20', '', NULL);
INSERT INTO `gen_table_column` VALUES (58, 10, 'wi_date', '产生时间', 'datetime', 'Date', 'wiDate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2024-03-30 00:22:20', '', NULL);

-- ----------------------------
-- Table structure for measurewifitable
-- ----------------------------
DROP TABLE IF EXISTS `measurewifitable`;
CREATE TABLE `measurewifitable`  (
  `measure_wifi_id` bigint(255) NOT NULL AUTO_INCREMENT COMMENT '对比 id\r',
  `area_id` bigint(255) NOT NULL COMMENT '区域 id',
  `wi_mac` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'mac 地址',
  `measure_wifi_rssi` int(11) NOT NULL COMMENT '产生的信号值',
  `measure_wifi_date` datetime NULL DEFAULT NULL COMMENT '产生的时间',
  `po_x` float NOT NULL COMMENT 'x轴',
  `po_y` float NOT NULL COMMENT 'y轴',
  `po_z` float NOT NULL COMMENT 'z轴',
  PRIMARY KEY (`measure_wifi_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 541 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of measurewifitable
-- ----------------------------
INSERT INTO `measurewifitable` VALUES (1, 37, '54:1f:8d:46:97:ef', -42, NULL, 1, 6, 1);
INSERT INTO `measurewifitable` VALUES (2, 37, '54:1f:8d:46:9a:71', -47, NULL, 1, 6, 1);
INSERT INTO `measurewifitable` VALUES (3, 37, '54:1f:8d:50:17:2e', -40, NULL, 1, 6, 1);
INSERT INTO `measurewifitable` VALUES (4, 37, '54:1f:8d:51:55:1f', -50, NULL, 1, 6, 1);
INSERT INTO `measurewifitable` VALUES (5, 37, '54:1f:8d:46:97:ef', -44, NULL, 1, 6, 1);
INSERT INTO `measurewifitable` VALUES (6, 37, '54:1f:8d:46:9a:71', -48, NULL, 1, 6, 1);
INSERT INTO `measurewifitable` VALUES (7, 37, '54:1f:8d:50:17:2e', -43, NULL, 1, 6, 1);
INSERT INTO `measurewifitable` VALUES (8, 37, '54:1f:8d:51:55:1f', -39, NULL, 1, 6, 1);
INSERT INTO `measurewifitable` VALUES (9, 37, '54:1f:8d:46:97:ef', -42, NULL, 1, 6, 1);
INSERT INTO `measurewifitable` VALUES (10, 37, '54:1f:8d:46:9a:71', -53, NULL, 1, 6, 1);
INSERT INTO `measurewifitable` VALUES (11, 37, '54:1f:8d:50:17:2e', -44, NULL, 1, 6, 1);
INSERT INTO `measurewifitable` VALUES (12, 37, '54:1f:8d:51:55:1f', -37, NULL, 1, 6, 1);
INSERT INTO `measurewifitable` VALUES (13, 37, '54:1f:8d:46:97:ef', -45, NULL, 1, 11, 1);
INSERT INTO `measurewifitable` VALUES (14, 37, '54:1f:8d:46:9a:71', -43, NULL, 1, 11, 1);
INSERT INTO `measurewifitable` VALUES (15, 37, '54:1f:8d:50:17:2e', -44, NULL, 1, 11, 1);
INSERT INTO `measurewifitable` VALUES (16, 37, '54:1f:8d:51:55:1f', -53, NULL, 1, 11, 1);
INSERT INTO `measurewifitable` VALUES (17, 37, '54:1f:8d:46:97:ef', -50, NULL, 1, 11, 1);
INSERT INTO `measurewifitable` VALUES (18, 37, '54:1f:8d:46:9a:71', -50, NULL, 1, 11, 1);
INSERT INTO `measurewifitable` VALUES (19, 37, '54:1f:8d:50:17:2e', -43, NULL, 1, 11, 1);
INSERT INTO `measurewifitable` VALUES (20, 37, '54:1f:8d:51:55:1f', -44, NULL, 1, 11, 1);
INSERT INTO `measurewifitable` VALUES (21, 37, '54:1f:8d:46:97:ef', -57, NULL, 1, 11, 1);
INSERT INTO `measurewifitable` VALUES (22, 37, '54:1f:8d:46:9a:71', -50, NULL, 1, 11, 1);
INSERT INTO `measurewifitable` VALUES (23, 37, '54:1f:8d:50:17:2e', -48, NULL, 1, 11, 1);
INSERT INTO `measurewifitable` VALUES (24, 37, '54:1f:8d:51:55:1f', -53, NULL, 1, 11, 1);
INSERT INTO `measurewifitable` VALUES (25, 37, '54:1f:8d:46:97:ef', -42, NULL, 1, 16, 1);
INSERT INTO `measurewifitable` VALUES (26, 37, '54:1f:8d:46:9a:71', -41, NULL, 1, 16, 1);
INSERT INTO `measurewifitable` VALUES (27, 37, '54:1f:8d:50:17:2e', -45, NULL, 1, 16, 1);
INSERT INTO `measurewifitable` VALUES (28, 37, '54:1f:8d:51:55:1f', -47, NULL, 1, 16, 1);
INSERT INTO `measurewifitable` VALUES (29, 37, '54:1f:8d:46:97:ef', -45, NULL, 1, 16, 1);
INSERT INTO `measurewifitable` VALUES (30, 37, '54:1f:8d:46:9a:71', -42, NULL, 1, 16, 1);
INSERT INTO `measurewifitable` VALUES (31, 37, '54:1f:8d:50:17:2e', -48, NULL, 1, 16, 1);
INSERT INTO `measurewifitable` VALUES (32, 37, '54:1f:8d:51:55:1f', -43, NULL, 1, 16, 1);
INSERT INTO `measurewifitable` VALUES (33, 37, '54:1f:8d:46:97:ef', -41, NULL, 1, 16, 1);
INSERT INTO `measurewifitable` VALUES (34, 37, '54:1f:8d:46:9a:71', -38, NULL, 1, 16, 1);
INSERT INTO `measurewifitable` VALUES (35, 37, '54:1f:8d:50:17:2e', -49, NULL, 1, 16, 1);
INSERT INTO `measurewifitable` VALUES (36, 37, '54:1f:8d:51:55:1f', -42, NULL, 1, 16, 1);
INSERT INTO `measurewifitable` VALUES (37, 37, '54:1f:8d:46:97:ef', -50, NULL, 1, 21, 1);
INSERT INTO `measurewifitable` VALUES (38, 37, '54:1f:8d:46:9a:71', -49, NULL, 1, 21, 1);
INSERT INTO `measurewifitable` VALUES (39, 37, '54:1f:8d:50:17:2e', -48, NULL, 1, 21, 1);
INSERT INTO `measurewifitable` VALUES (40, 37, '54:1f:8d:51:55:1f', -37, NULL, 1, 21, 1);
INSERT INTO `measurewifitable` VALUES (41, 37, '54:1f:8d:46:97:ef', -45, NULL, 1, 21, 1);
INSERT INTO `measurewifitable` VALUES (42, 37, '54:1f:8d:46:9a:71', -45, NULL, 1, 21, 1);
INSERT INTO `measurewifitable` VALUES (43, 37, '54:1f:8d:50:17:2e', -41, NULL, 1, 21, 1);
INSERT INTO `measurewifitable` VALUES (44, 37, '54:1f:8d:51:55:1f', -53, NULL, 1, 21, 1);
INSERT INTO `measurewifitable` VALUES (45, 37, '54:1f:8d:46:97:ef', -50, NULL, 1, 21, 1);
INSERT INTO `measurewifitable` VALUES (46, 37, '54:1f:8d:46:9a:71', -35, NULL, 1, 21, 1);
INSERT INTO `measurewifitable` VALUES (47, 37, '54:1f:8d:50:17:2e', -44, NULL, 1, 21, 1);
INSERT INTO `measurewifitable` VALUES (48, 37, '54:1f:8d:51:55:1f', -52, NULL, 1, 21, 1);
INSERT INTO `measurewifitable` VALUES (49, 37, '54:1f:8d:46:97:ef', -38, NULL, 1, 26, 1);
INSERT INTO `measurewifitable` VALUES (50, 37, '54:1f:8d:46:9a:71', -53, NULL, 1, 26, 1);
INSERT INTO `measurewifitable` VALUES (51, 37, '54:1f:8d:50:17:2e', -43, NULL, 1, 26, 1);
INSERT INTO `measurewifitable` VALUES (52, 37, '54:1f:8d:51:55:1f', -39, NULL, 1, 26, 1);
INSERT INTO `measurewifitable` VALUES (53, 37, '54:1f:8d:46:97:ef', -53, NULL, 1, 26, 1);
INSERT INTO `measurewifitable` VALUES (54, 37, '54:1f:8d:46:9a:71', -69, NULL, 1, 26, 1);
INSERT INTO `measurewifitable` VALUES (55, 37, '54:1f:8d:50:17:2e', -42, NULL, 1, 26, 1);
INSERT INTO `measurewifitable` VALUES (56, 37, '54:1f:8d:51:55:1f', -32, NULL, 1, 26, 1);
INSERT INTO `measurewifitable` VALUES (57, 37, '54:1f:8d:46:97:ef', -53, NULL, 1, 26, 1);
INSERT INTO `measurewifitable` VALUES (58, 37, '54:1f:8d:46:9a:71', -48, NULL, 1, 26, 1);
INSERT INTO `measurewifitable` VALUES (59, 37, '54:1f:8d:50:17:2e', -42, NULL, 1, 26, 1);
INSERT INTO `measurewifitable` VALUES (60, 37, '54:1f:8d:51:55:1f', -32, NULL, 1, 26, 1);
INSERT INTO `measurewifitable` VALUES (61, 37, '54:1f:8d:46:97:ef', -54, NULL, 6, 1, 1);
INSERT INTO `measurewifitable` VALUES (62, 37, '54:1f:8d:46:9a:71', -58, NULL, 6, 1, 1);
INSERT INTO `measurewifitable` VALUES (63, 37, '54:1f:8d:50:17:2e', -59, NULL, 6, 1, 1);
INSERT INTO `measurewifitable` VALUES (64, 37, '54:1f:8d:51:55:1f', -41, NULL, 6, 1, 1);
INSERT INTO `measurewifitable` VALUES (65, 37, '54:1f:8d:46:97:ef', -53, NULL, 6, 1, 1);
INSERT INTO `measurewifitable` VALUES (66, 37, '54:1f:8d:46:9a:71', -55, NULL, 6, 1, 1);
INSERT INTO `measurewifitable` VALUES (67, 37, '54:1f:8d:50:17:2e', -53, NULL, 6, 1, 1);
INSERT INTO `measurewifitable` VALUES (68, 37, '54:1f:8d:51:55:1f', -38, NULL, 6, 1, 1);
INSERT INTO `measurewifitable` VALUES (69, 37, '54:1f:8d:46:97:ef', -51, NULL, 6, 1, 1);
INSERT INTO `measurewifitable` VALUES (70, 37, '54:1f:8d:46:9a:71', -55, NULL, 6, 1, 1);
INSERT INTO `measurewifitable` VALUES (71, 37, '54:1f:8d:50:17:2e', -55, NULL, 6, 1, 1);
INSERT INTO `measurewifitable` VALUES (72, 37, '54:1f:8d:51:55:1f', -39, NULL, 6, 1, 1);
INSERT INTO `measurewifitable` VALUES (73, 37, '54:1f:8d:46:97:ef', -56, NULL, 6, 6, 1);
INSERT INTO `measurewifitable` VALUES (74, 37, '54:1f:8d:46:9a:71', -57, NULL, 6, 6, 1);
INSERT INTO `measurewifitable` VALUES (75, 37, '54:1f:8d:50:17:2e', -59, NULL, 6, 6, 1);
INSERT INTO `measurewifitable` VALUES (76, 37, '54:1f:8d:51:55:1f', -39, NULL, 6, 6, 1);
INSERT INTO `measurewifitable` VALUES (77, 37, '54:1f:8d:46:97:ef', -56, NULL, 6, 6, 1);
INSERT INTO `measurewifitable` VALUES (78, 37, '54:1f:8d:46:9a:71', -49, NULL, 6, 6, 1);
INSERT INTO `measurewifitable` VALUES (79, 37, '54:1f:8d:50:17:2e', -49, NULL, 6, 6, 1);
INSERT INTO `measurewifitable` VALUES (80, 37, '54:1f:8d:51:55:1f', -43, NULL, 6, 6, 1);
INSERT INTO `measurewifitable` VALUES (81, 37, '54:1f:8d:46:97:ef', -56, NULL, 6, 6, 1);
INSERT INTO `measurewifitable` VALUES (82, 37, '54:1f:8d:46:9a:71', -52, NULL, 6, 6, 1);
INSERT INTO `measurewifitable` VALUES (83, 37, '54:1f:8d:50:17:2e', -50, NULL, 6, 6, 1);
INSERT INTO `measurewifitable` VALUES (84, 37, '54:1f:8d:51:55:1f', -46, NULL, 6, 6, 1);
INSERT INTO `measurewifitable` VALUES (85, 37, '54:1f:8d:46:97:ef', -55, NULL, 6, 11, 1);
INSERT INTO `measurewifitable` VALUES (86, 37, '54:1f:8d:46:9a:71', -45, NULL, 6, 11, 1);
INSERT INTO `measurewifitable` VALUES (87, 37, '54:1f:8d:50:17:2e', -56, NULL, 6, 11, 1);
INSERT INTO `measurewifitable` VALUES (88, 37, '54:1f:8d:51:55:1f', -51, NULL, 6, 11, 1);
INSERT INTO `measurewifitable` VALUES (89, 37, '54:1f:8d:46:97:ef', -51, NULL, 6, 11, 1);
INSERT INTO `measurewifitable` VALUES (90, 37, '54:1f:8d:46:9a:71', -42, NULL, 6, 11, 1);
INSERT INTO `measurewifitable` VALUES (91, 37, '54:1f:8d:50:17:2e', -58, NULL, 6, 11, 1);
INSERT INTO `measurewifitable` VALUES (92, 37, '54:1f:8d:51:55:1f', -54, NULL, 6, 11, 1);
INSERT INTO `measurewifitable` VALUES (93, 37, '54:1f:8d:46:97:ef', -52, NULL, 6, 11, 1);
INSERT INTO `measurewifitable` VALUES (94, 37, '54:1f:8d:46:9a:71', -46, NULL, 6, 11, 1);
INSERT INTO `measurewifitable` VALUES (95, 37, '54:1f:8d:50:17:2e', -57, NULL, 6, 11, 1);
INSERT INTO `measurewifitable` VALUES (96, 37, '54:1f:8d:51:55:1f', -48, NULL, 6, 11, 1);
INSERT INTO `measurewifitable` VALUES (97, 37, '54:1f:8d:46:97:ef', -55, NULL, 6, 16, 1);
INSERT INTO `measurewifitable` VALUES (98, 37, '54:1f:8d:46:9a:71', -41, NULL, 6, 16, 1);
INSERT INTO `measurewifitable` VALUES (99, 37, '54:1f:8d:50:17:2e', -48, NULL, 6, 16, 1);
INSERT INTO `measurewifitable` VALUES (100, 37, '54:1f:8d:51:55:1f', -54, NULL, 6, 16, 1);
INSERT INTO `measurewifitable` VALUES (101, 37, '54:1f:8d:46:97:ef', -53, NULL, 6, 16, 1);
INSERT INTO `measurewifitable` VALUES (102, 37, '54:1f:8d:46:9a:71', -56, NULL, 6, 16, 1);
INSERT INTO `measurewifitable` VALUES (103, 37, '54:1f:8d:50:17:2e', -56, NULL, 6, 16, 1);
INSERT INTO `measurewifitable` VALUES (104, 37, '54:1f:8d:51:55:1f', -56, NULL, 6, 16, 1);
INSERT INTO `measurewifitable` VALUES (105, 37, '54:1f:8d:46:97:ef', -56, NULL, 6, 16, 1);
INSERT INTO `measurewifitable` VALUES (106, 37, '54:1f:8d:46:9a:71', -54, NULL, 6, 16, 1);
INSERT INTO `measurewifitable` VALUES (107, 37, '54:1f:8d:50:17:2e', -51, NULL, 6, 16, 1);
INSERT INTO `measurewifitable` VALUES (108, 37, '54:1f:8d:51:55:1f', -55, NULL, 6, 16, 1);
INSERT INTO `measurewifitable` VALUES (109, 37, '54:1f:8d:46:97:ef', -49, NULL, 6, 21, 1);
INSERT INTO `measurewifitable` VALUES (110, 37, '54:1f:8d:46:9a:71', -57, NULL, 6, 21, 1);
INSERT INTO `measurewifitable` VALUES (111, 37, '54:1f:8d:50:17:2e', -49, NULL, 6, 21, 1);
INSERT INTO `measurewifitable` VALUES (112, 37, '54:1f:8d:51:55:1f', -58, NULL, 6, 21, 1);
INSERT INTO `measurewifitable` VALUES (113, 37, '54:1f:8d:46:97:ef', -57, NULL, 6, 21, 1);
INSERT INTO `measurewifitable` VALUES (114, 37, '54:1f:8d:46:9a:71', -46, NULL, 6, 21, 1);
INSERT INTO `measurewifitable` VALUES (115, 37, '54:1f:8d:50:17:2e', -58, NULL, 6, 21, 1);
INSERT INTO `measurewifitable` VALUES (116, 37, '54:1f:8d:51:55:1f', -54, NULL, 6, 21, 1);
INSERT INTO `measurewifitable` VALUES (117, 37, '54:1f:8d:46:97:ef', -59, NULL, 6, 21, 1);
INSERT INTO `measurewifitable` VALUES (118, 37, '54:1f:8d:46:9a:71', -50, NULL, 6, 21, 1);
INSERT INTO `measurewifitable` VALUES (119, 37, '54:1f:8d:50:17:2e', -49, NULL, 6, 21, 1);
INSERT INTO `measurewifitable` VALUES (120, 37, '54:1f:8d:51:55:1f', -57, NULL, 6, 21, 1);
INSERT INTO `measurewifitable` VALUES (121, 37, '54:1f:8d:46:97:ef', -58, NULL, 6, 26, 1);
INSERT INTO `measurewifitable` VALUES (122, 37, '54:1f:8d:46:9a:71', -45, NULL, 6, 26, 1);
INSERT INTO `measurewifitable` VALUES (123, 37, '54:1f:8d:50:17:2e', -56, NULL, 6, 26, 1);
INSERT INTO `measurewifitable` VALUES (124, 37, '54:1f:8d:51:55:1f', -55, NULL, 6, 26, 1);
INSERT INTO `measurewifitable` VALUES (125, 37, '54:1f:8d:46:97:ef', -64, NULL, 6, 26, 1);
INSERT INTO `measurewifitable` VALUES (126, 37, '54:1f:8d:46:9a:71', -47, NULL, 6, 26, 1);
INSERT INTO `measurewifitable` VALUES (127, 37, '54:1f:8d:50:17:2e', -54, NULL, 6, 26, 1);
INSERT INTO `measurewifitable` VALUES (128, 37, '54:1f:8d:51:55:1f', -50, NULL, 6, 26, 1);
INSERT INTO `measurewifitable` VALUES (129, 37, '54:1f:8d:46:97:ef', -52, NULL, 6, 26, 1);
INSERT INTO `measurewifitable` VALUES (130, 37, '54:1f:8d:46:9a:71', -42, NULL, 6, 26, 1);
INSERT INTO `measurewifitable` VALUES (131, 37, '54:1f:8d:50:17:2e', -55, NULL, 6, 26, 1);
INSERT INTO `measurewifitable` VALUES (132, 37, '54:1f:8d:51:55:1f', -52, NULL, 6, 26, 1);
INSERT INTO `measurewifitable` VALUES (133, 37, '54:1f:8d:46:97:ef', -48, NULL, 6, 31, 1);
INSERT INTO `measurewifitable` VALUES (134, 37, '54:1f:8d:46:9a:71', -53, NULL, 6, 31, 1);
INSERT INTO `measurewifitable` VALUES (135, 37, '54:1f:8d:50:17:2e', -50, NULL, 6, 31, 1);
INSERT INTO `measurewifitable` VALUES (136, 37, '54:1f:8d:51:55:1f', -50, NULL, 6, 31, 1);
INSERT INTO `measurewifitable` VALUES (137, 37, '54:1f:8d:46:97:ef', -47, NULL, 6, 31, 1);
INSERT INTO `measurewifitable` VALUES (138, 37, '54:1f:8d:46:9a:71', -51, NULL, 6, 31, 1);
INSERT INTO `measurewifitable` VALUES (139, 37, '54:1f:8d:50:17:2e', -48, NULL, 6, 31, 1);
INSERT INTO `measurewifitable` VALUES (140, 37, '54:1f:8d:51:55:1f', -41, NULL, 6, 31, 1);
INSERT INTO `measurewifitable` VALUES (141, 37, '54:1f:8d:46:97:ef', -47, NULL, 6, 31, 1);
INSERT INTO `measurewifitable` VALUES (142, 37, '54:1f:8d:46:9a:71', -53, NULL, 6, 31, 1);
INSERT INTO `measurewifitable` VALUES (143, 37, '54:1f:8d:50:17:2e', -56, NULL, 6, 31, 1);
INSERT INTO `measurewifitable` VALUES (144, 37, '54:1f:8d:51:55:1f', -39, NULL, 6, 31, 1);
INSERT INTO `measurewifitable` VALUES (145, 37, '54:1f:8d:46:97:ef', -36, NULL, 11, 1, 1);
INSERT INTO `measurewifitable` VALUES (146, 37, '54:1f:8d:46:9a:71', -54, NULL, 11, 1, 1);
INSERT INTO `measurewifitable` VALUES (147, 37, '54:1f:8d:50:17:2e', -48, NULL, 11, 1, 1);
INSERT INTO `measurewifitable` VALUES (148, 37, '54:1f:8d:51:55:1f', -41, NULL, 11, 1, 1);
INSERT INTO `measurewifitable` VALUES (149, 37, '54:1f:8d:46:97:ef', -47, NULL, 11, 1, 1);
INSERT INTO `measurewifitable` VALUES (150, 37, '54:1f:8d:46:9a:71', -52, NULL, 11, 1, 1);
INSERT INTO `measurewifitable` VALUES (151, 37, '54:1f:8d:50:17:2e', -51, NULL, 11, 1, 1);
INSERT INTO `measurewifitable` VALUES (152, 37, '54:1f:8d:51:55:1f', -45, NULL, 11, 1, 1);
INSERT INTO `measurewifitable` VALUES (153, 37, '54:1f:8d:46:97:ef', -49, NULL, 11, 1, 1);
INSERT INTO `measurewifitable` VALUES (154, 37, '54:1f:8d:46:9a:71', -51, NULL, 11, 1, 1);
INSERT INTO `measurewifitable` VALUES (155, 37, '54:1f:8d:50:17:2e', -51, NULL, 11, 1, 1);
INSERT INTO `measurewifitable` VALUES (156, 37, '54:1f:8d:51:55:1f', -46, NULL, 11, 1, 1);
INSERT INTO `measurewifitable` VALUES (157, 37, '54:1f:8d:46:97:ef', -43, NULL, 11, 6, 1);
INSERT INTO `measurewifitable` VALUES (158, 37, '54:1f:8d:46:9a:71', -47, NULL, 11, 6, 1);
INSERT INTO `measurewifitable` VALUES (159, 37, '54:1f:8d:50:17:2e', -39, NULL, 11, 6, 1);
INSERT INTO `measurewifitable` VALUES (160, 37, '54:1f:8d:51:55:1f', -36, NULL, 11, 6, 1);
INSERT INTO `measurewifitable` VALUES (161, 37, '54:1f:8d:46:97:ef', -38, NULL, 11, 6, 1);
INSERT INTO `measurewifitable` VALUES (162, 37, '54:1f:8d:46:9a:71', -49, NULL, 11, 6, 1);
INSERT INTO `measurewifitable` VALUES (163, 37, '54:1f:8d:50:17:2e', -35, NULL, 11, 6, 1);
INSERT INTO `measurewifitable` VALUES (164, 37, '54:1f:8d:51:55:1f', -37, NULL, 11, 6, 1);
INSERT INTO `measurewifitable` VALUES (165, 37, '54:1f:8d:46:97:ef', -52, NULL, 11, 6, 1);
INSERT INTO `measurewifitable` VALUES (166, 37, '54:1f:8d:46:9a:71', -51, NULL, 11, 6, 1);
INSERT INTO `measurewifitable` VALUES (167, 37, '54:1f:8d:50:17:2e', -37, NULL, 11, 6, 1);
INSERT INTO `measurewifitable` VALUES (168, 37, '54:1f:8d:51:55:1f', -36, NULL, 11, 6, 1);
INSERT INTO `measurewifitable` VALUES (169, 37, '54:1f:8d:46:97:ef', -52, NULL, 11, 11, 1);
INSERT INTO `measurewifitable` VALUES (170, 37, '54:1f:8d:46:9a:71', -44, NULL, 11, 11, 1);
INSERT INTO `measurewifitable` VALUES (171, 37, '54:1f:8d:50:17:2e', -41, NULL, 11, 11, 1);
INSERT INTO `measurewifitable` VALUES (172, 37, '54:1f:8d:51:55:1f', -39, NULL, 11, 11, 1);
INSERT INTO `measurewifitable` VALUES (173, 37, '54:1f:8d:46:97:ef', -52, NULL, 11, 11, 1);
INSERT INTO `measurewifitable` VALUES (174, 37, '54:1f:8d:46:9a:71', -44, NULL, 11, 11, 1);
INSERT INTO `measurewifitable` VALUES (175, 37, '54:1f:8d:50:17:2e', -41, NULL, 11, 11, 1);
INSERT INTO `measurewifitable` VALUES (176, 37, '54:1f:8d:51:55:1f', -39, NULL, 11, 11, 1);
INSERT INTO `measurewifitable` VALUES (177, 37, '54:1f:8d:46:97:ef', -41, NULL, 11, 11, 1);
INSERT INTO `measurewifitable` VALUES (178, 37, '54:1f:8d:46:9a:71', -43, NULL, 11, 11, 1);
INSERT INTO `measurewifitable` VALUES (179, 37, '54:1f:8d:50:17:2e', -43, NULL, 11, 11, 1);
INSERT INTO `measurewifitable` VALUES (180, 37, '54:1f:8d:51:55:1f', -46, NULL, 11, 11, 1);
INSERT INTO `measurewifitable` VALUES (181, 37, '54:1f:8d:46:97:ef', -47, NULL, 11, 16, 1);
INSERT INTO `measurewifitable` VALUES (182, 37, '54:1f:8d:46:9a:71', -50, NULL, 11, 16, 1);
INSERT INTO `measurewifitable` VALUES (183, 37, '54:1f:8d:50:17:2e', -42, NULL, 11, 16, 1);
INSERT INTO `measurewifitable` VALUES (184, 37, '54:1f:8d:51:55:1f', -53, NULL, 11, 16, 1);
INSERT INTO `measurewifitable` VALUES (185, 37, '54:1f:8d:46:97:ef', -48, NULL, 11, 16, 1);
INSERT INTO `measurewifitable` VALUES (186, 37, '54:1f:8d:46:9a:71', -49, NULL, 11, 16, 1);
INSERT INTO `measurewifitable` VALUES (187, 37, '54:1f:8d:50:17:2e', -48, NULL, 11, 16, 1);
INSERT INTO `measurewifitable` VALUES (188, 37, '54:1f:8d:51:55:1f', -49, NULL, 11, 16, 1);
INSERT INTO `measurewifitable` VALUES (189, 37, '54:1f:8d:46:97:ef', -52, NULL, 11, 16, 1);
INSERT INTO `measurewifitable` VALUES (190, 37, '54:1f:8d:46:9a:71', -42, NULL, 11, 16, 1);
INSERT INTO `measurewifitable` VALUES (191, 37, '54:1f:8d:50:17:2e', -43, NULL, 11, 16, 1);
INSERT INTO `measurewifitable` VALUES (192, 37, '54:1f:8d:51:55:1f', -45, NULL, 11, 16, 1);
INSERT INTO `measurewifitable` VALUES (193, 37, '54:1f:8d:46:97:ef', -52, NULL, 11, 21, 1);
INSERT INTO `measurewifitable` VALUES (194, 37, '54:1f:8d:46:9a:71', -45, NULL, 11, 21, 1);
INSERT INTO `measurewifitable` VALUES (195, 37, '54:1f:8d:50:17:2e', -38, NULL, 11, 21, 1);
INSERT INTO `measurewifitable` VALUES (196, 37, '54:1f:8d:51:55:1f', -56, NULL, 11, 21, 1);
INSERT INTO `measurewifitable` VALUES (197, 37, '54:1f:8d:46:97:ef', -45, NULL, 11, 21, 1);
INSERT INTO `measurewifitable` VALUES (198, 37, '54:1f:8d:46:9a:71', -43, NULL, 11, 21, 1);
INSERT INTO `measurewifitable` VALUES (199, 37, '54:1f:8d:50:17:2e', -44, NULL, 11, 21, 1);
INSERT INTO `measurewifitable` VALUES (200, 37, '54:1f:8d:51:55:1f', -49, NULL, 11, 21, 1);
INSERT INTO `measurewifitable` VALUES (201, 37, '54:1f:8d:46:97:ef', -46, NULL, 11, 21, 1);
INSERT INTO `measurewifitable` VALUES (202, 37, '54:1f:8d:46:9a:71', -40, NULL, 11, 21, 1);
INSERT INTO `measurewifitable` VALUES (203, 37, '54:1f:8d:50:17:2e', -37, NULL, 11, 21, 1);
INSERT INTO `measurewifitable` VALUES (204, 37, '54:1f:8d:51:55:1f', -51, NULL, 11, 21, 1);
INSERT INTO `measurewifitable` VALUES (205, 37, '54:1f:8d:46:97:ef', -48, NULL, 11, 26, 1);
INSERT INTO `measurewifitable` VALUES (206, 37, '54:1f:8d:46:9a:71', -38, NULL, 11, 26, 1);
INSERT INTO `measurewifitable` VALUES (207, 37, '54:1f:8d:50:17:2e', -40, NULL, 11, 26, 1);
INSERT INTO `measurewifitable` VALUES (208, 37, '54:1f:8d:51:55:1f', -37, NULL, 11, 26, 1);
INSERT INTO `measurewifitable` VALUES (209, 37, '54:1f:8d:46:97:ef', -51, NULL, 11, 26, 1);
INSERT INTO `measurewifitable` VALUES (210, 37, '54:1f:8d:46:9a:71', -38, NULL, 11, 26, 1);
INSERT INTO `measurewifitable` VALUES (211, 37, '54:1f:8d:50:17:2e', -39, NULL, 11, 26, 1);
INSERT INTO `measurewifitable` VALUES (212, 37, '54:1f:8d:51:55:1f', -43, NULL, 11, 26, 1);
INSERT INTO `measurewifitable` VALUES (213, 37, '54:1f:8d:46:97:ef', -46, NULL, 11, 26, 1);
INSERT INTO `measurewifitable` VALUES (214, 37, '54:1f:8d:46:9a:71', -44, NULL, 11, 26, 1);
INSERT INTO `measurewifitable` VALUES (215, 37, '54:1f:8d:50:17:2e', -36, NULL, 11, 26, 1);
INSERT INTO `measurewifitable` VALUES (216, 37, '54:1f:8d:51:55:1f', -44, NULL, 11, 26, 1);
INSERT INTO `measurewifitable` VALUES (217, 37, '54:1f:8d:46:97:ef', -44, NULL, 11, 31, 1);
INSERT INTO `measurewifitable` VALUES (218, 37, '54:1f:8d:46:9a:71', -46, NULL, 11, 31, 1);
INSERT INTO `measurewifitable` VALUES (219, 37, '54:1f:8d:50:17:2e', -51, NULL, 11, 31, 1);
INSERT INTO `measurewifitable` VALUES (220, 37, '54:1f:8d:51:55:1f', -40, NULL, 11, 31, 1);
INSERT INTO `measurewifitable` VALUES (221, 37, '54:1f:8d:46:97:ef', -49, NULL, 11, 31, 1);
INSERT INTO `measurewifitable` VALUES (222, 37, '54:1f:8d:46:9a:71', -52, NULL, 11, 31, 1);
INSERT INTO `measurewifitable` VALUES (223, 37, '54:1f:8d:50:17:2e', -47, NULL, 11, 31, 1);
INSERT INTO `measurewifitable` VALUES (224, 37, '54:1f:8d:51:55:1f', -45, NULL, 11, 31, 1);
INSERT INTO `measurewifitable` VALUES (225, 37, '54:1f:8d:46:97:ef', -48, NULL, 11, 31, 1);
INSERT INTO `measurewifitable` VALUES (226, 37, '54:1f:8d:46:9a:71', -52, NULL, 11, 31, 1);
INSERT INTO `measurewifitable` VALUES (227, 37, '54:1f:8d:50:17:2e', -54, NULL, 11, 31, 1);
INSERT INTO `measurewifitable` VALUES (228, 37, '54:1f:8d:51:55:1f', -39, NULL, 11, 31, 1);
INSERT INTO `measurewifitable` VALUES (229, 37, '54:1f:8d:46:97:ef', -42, NULL, 16, 1, 1);
INSERT INTO `measurewifitable` VALUES (230, 37, '54:1f:8d:46:9a:71', -55, NULL, 16, 1, 1);
INSERT INTO `measurewifitable` VALUES (231, 37, '54:1f:8d:50:17:2e', -48, NULL, 16, 1, 1);
INSERT INTO `measurewifitable` VALUES (232, 37, '54:1f:8d:51:55:1f', -36, NULL, 16, 1, 1);
INSERT INTO `measurewifitable` VALUES (233, 37, '54:1f:8d:46:97:ef', -38, NULL, 16, 1, 1);
INSERT INTO `measurewifitable` VALUES (234, 37, '54:1f:8d:46:9a:71', -46, NULL, 16, 1, 1);
INSERT INTO `measurewifitable` VALUES (235, 37, '54:1f:8d:50:17:2e', -46, NULL, 16, 1, 1);
INSERT INTO `measurewifitable` VALUES (236, 37, '54:1f:8d:51:55:1f', -44, NULL, 16, 1, 1);
INSERT INTO `measurewifitable` VALUES (237, 37, '54:1f:8d:46:97:ef', -43, NULL, 16, 1, 1);
INSERT INTO `measurewifitable` VALUES (238, 37, '54:1f:8d:46:9a:71', -49, NULL, 16, 1, 1);
INSERT INTO `measurewifitable` VALUES (239, 37, '54:1f:8d:50:17:2e', -52, NULL, 16, 1, 1);
INSERT INTO `measurewifitable` VALUES (240, 37, '54:1f:8d:51:55:1f', -47, NULL, 16, 1, 1);
INSERT INTO `measurewifitable` VALUES (241, 37, '54:1f:8d:46:97:ef', -49, NULL, 16, 6, 1);
INSERT INTO `measurewifitable` VALUES (242, 37, '54:1f:8d:46:9a:71', -48, NULL, 16, 6, 1);
INSERT INTO `measurewifitable` VALUES (243, 37, '54:1f:8d:50:17:2e', -44, NULL, 16, 6, 1);
INSERT INTO `measurewifitable` VALUES (244, 37, '54:1f:8d:51:55:1f', -42, NULL, 16, 6, 1);
INSERT INTO `measurewifitable` VALUES (245, 37, '54:1f:8d:46:97:ef', -51, NULL, 16, 6, 1);
INSERT INTO `measurewifitable` VALUES (246, 37, '54:1f:8d:46:9a:71', -47, NULL, 16, 6, 1);
INSERT INTO `measurewifitable` VALUES (247, 37, '54:1f:8d:50:17:2e', -47, NULL, 16, 6, 1);
INSERT INTO `measurewifitable` VALUES (248, 37, '54:1f:8d:51:55:1f', -44, NULL, 16, 6, 1);
INSERT INTO `measurewifitable` VALUES (249, 37, '54:1f:8d:46:97:ef', -50, NULL, 16, 6, 1);
INSERT INTO `measurewifitable` VALUES (250, 37, '54:1f:8d:46:9a:71', -50, NULL, 16, 6, 1);
INSERT INTO `measurewifitable` VALUES (251, 37, '54:1f:8d:50:17:2e', -45, NULL, 16, 6, 1);
INSERT INTO `measurewifitable` VALUES (252, 37, '54:1f:8d:51:55:1f', -45, NULL, 16, 6, 1);
INSERT INTO `measurewifitable` VALUES (253, 37, '54:1f:8d:46:97:ef', -48, NULL, 16, 11, 1);
INSERT INTO `measurewifitable` VALUES (254, 37, '54:1f:8d:46:9a:71', -50, NULL, 16, 11, 1);
INSERT INTO `measurewifitable` VALUES (255, 37, '54:1f:8d:50:17:2e', -41, NULL, 16, 11, 1);
INSERT INTO `measurewifitable` VALUES (256, 37, '54:1f:8d:51:55:1f', -55, NULL, 16, 11, 1);
INSERT INTO `measurewifitable` VALUES (257, 37, '54:1f:8d:46:97:ef', -53, NULL, 16, 11, 1);
INSERT INTO `measurewifitable` VALUES (258, 37, '54:1f:8d:46:9a:71', -53, NULL, 16, 11, 1);
INSERT INTO `measurewifitable` VALUES (259, 37, '54:1f:8d:50:17:2e', -53, NULL, 16, 11, 1);
INSERT INTO `measurewifitable` VALUES (260, 37, '54:1f:8d:51:55:1f', -55, NULL, 16, 11, 1);
INSERT INTO `measurewifitable` VALUES (261, 37, '54:1f:8d:46:97:ef', -50, NULL, 16, 11, 1);
INSERT INTO `measurewifitable` VALUES (262, 37, '54:1f:8d:46:9a:71', -54, NULL, 16, 11, 1);
INSERT INTO `measurewifitable` VALUES (263, 37, '54:1f:8d:50:17:2e', -39, NULL, 16, 11, 1);
INSERT INTO `measurewifitable` VALUES (264, 37, '54:1f:8d:51:55:1f', -55, NULL, 16, 11, 1);
INSERT INTO `measurewifitable` VALUES (265, 37, '54:1f:8d:46:97:ef', -54, NULL, 16, 16, 1);
INSERT INTO `measurewifitable` VALUES (266, 37, '54:1f:8d:46:9a:71', -45, NULL, 16, 16, 1);
INSERT INTO `measurewifitable` VALUES (267, 37, '54:1f:8d:50:17:2e', -44, NULL, 16, 16, 1);
INSERT INTO `measurewifitable` VALUES (268, 37, '54:1f:8d:51:55:1f', -49, NULL, 16, 16, 1);
INSERT INTO `measurewifitable` VALUES (269, 37, '54:1f:8d:46:97:ef', -48, NULL, 16, 16, 1);
INSERT INTO `measurewifitable` VALUES (270, 37, '54:1f:8d:46:9a:71', -45, NULL, 16, 16, 1);
INSERT INTO `measurewifitable` VALUES (271, 37, '54:1f:8d:50:17:2e', -45, NULL, 16, 16, 1);
INSERT INTO `measurewifitable` VALUES (272, 37, '54:1f:8d:51:55:1f', -46, NULL, 16, 16, 1);
INSERT INTO `measurewifitable` VALUES (273, 37, '54:1f:8d:46:97:ef', -47, NULL, 16, 16, 1);
INSERT INTO `measurewifitable` VALUES (274, 37, '54:1f:8d:46:9a:71', -49, NULL, 16, 16, 1);
INSERT INTO `measurewifitable` VALUES (275, 37, '54:1f:8d:50:17:2e', -42, NULL, 16, 16, 1);
INSERT INTO `measurewifitable` VALUES (276, 37, '54:1f:8d:51:55:1f', -55, NULL, 16, 16, 1);
INSERT INTO `measurewifitable` VALUES (277, 37, '54:1f:8d:46:97:ef', -62, NULL, 16, 21, 1);
INSERT INTO `measurewifitable` VALUES (278, 37, '54:1f:8d:46:9a:71', -50, NULL, 16, 21, 1);
INSERT INTO `measurewifitable` VALUES (279, 37, '54:1f:8d:50:17:2e', -44, NULL, 16, 21, 1);
INSERT INTO `measurewifitable` VALUES (280, 37, '54:1f:8d:51:55:1f', -56, NULL, 16, 21, 1);
INSERT INTO `measurewifitable` VALUES (281, 37, '54:1f:8d:46:97:ef', -56, NULL, 16, 21, 1);
INSERT INTO `measurewifitable` VALUES (282, 37, '54:1f:8d:46:9a:71', -50, NULL, 16, 21, 1);
INSERT INTO `measurewifitable` VALUES (283, 37, '54:1f:8d:50:17:2e', -47, NULL, 16, 21, 1);
INSERT INTO `measurewifitable` VALUES (284, 37, '54:1f:8d:51:55:1f', -55, NULL, 16, 21, 1);
INSERT INTO `measurewifitable` VALUES (285, 37, '54:1f:8d:46:97:ef', -56, NULL, 16, 21, 1);
INSERT INTO `measurewifitable` VALUES (286, 37, '54:1f:8d:46:9a:71', -48, NULL, 16, 21, 1);
INSERT INTO `measurewifitable` VALUES (287, 37, '54:1f:8d:50:17:2e', -45, NULL, 16, 21, 1);
INSERT INTO `measurewifitable` VALUES (288, 37, '54:1f:8d:51:55:1f', -54, NULL, 16, 21, 1);
INSERT INTO `measurewifitable` VALUES (289, 37, '54:1f:8d:46:97:ef', -49, NULL, 16, 26, 1);
INSERT INTO `measurewifitable` VALUES (290, 37, '54:1f:8d:46:9a:71', -45, NULL, 16, 26, 1);
INSERT INTO `measurewifitable` VALUES (291, 37, '54:1f:8d:50:17:2e', -34, NULL, 16, 26, 1);
INSERT INTO `measurewifitable` VALUES (292, 37, '54:1f:8d:51:55:1f', -48, NULL, 16, 26, 1);
INSERT INTO `measurewifitable` VALUES (293, 37, '54:1f:8d:46:97:ef', -53, NULL, 16, 26, 1);
INSERT INTO `measurewifitable` VALUES (294, 37, '54:1f:8d:46:9a:71', -49, NULL, 16, 26, 1);
INSERT INTO `measurewifitable` VALUES (295, 37, '54:1f:8d:50:17:2e', -33, NULL, 16, 26, 1);
INSERT INTO `measurewifitable` VALUES (296, 37, '54:1f:8d:51:55:1f', -46, NULL, 16, 26, 1);
INSERT INTO `measurewifitable` VALUES (297, 37, '54:1f:8d:46:97:ef', -47, NULL, 16, 26, 1);
INSERT INTO `measurewifitable` VALUES (298, 37, '54:1f:8d:46:9a:71', -47, NULL, 16, 26, 1);
INSERT INTO `measurewifitable` VALUES (299, 37, '54:1f:8d:50:17:2e', -33, NULL, 16, 26, 1);
INSERT INTO `measurewifitable` VALUES (300, 37, '54:1f:8d:51:55:1f', -48, NULL, 16, 26, 1);
INSERT INTO `measurewifitable` VALUES (301, 37, '54:1f:8d:46:97:ef', -46, NULL, 16, 31, 1);
INSERT INTO `measurewifitable` VALUES (302, 37, '54:1f:8d:46:9a:71', -50, NULL, 16, 31, 1);
INSERT INTO `measurewifitable` VALUES (303, 37, '54:1f:8d:50:17:2e', -47, NULL, 16, 31, 1);
INSERT INTO `measurewifitable` VALUES (304, 37, '54:1f:8d:51:55:1f', -45, NULL, 16, 31, 1);
INSERT INTO `measurewifitable` VALUES (305, 37, '54:1f:8d:46:97:ef', -39, NULL, 16, 31, 1);
INSERT INTO `measurewifitable` VALUES (306, 37, '54:1f:8d:46:9a:71', -55, NULL, 16, 31, 1);
INSERT INTO `measurewifitable` VALUES (307, 37, '54:1f:8d:50:17:2e', -50, NULL, 16, 31, 1);
INSERT INTO `measurewifitable` VALUES (308, 37, '54:1f:8d:51:55:1f', -44, NULL, 16, 31, 1);
INSERT INTO `measurewifitable` VALUES (309, 37, '54:1f:8d:46:97:ef', -42, NULL, 16, 31, 1);
INSERT INTO `measurewifitable` VALUES (310, 37, '54:1f:8d:46:9a:71', -48, NULL, 16, 31, 1);
INSERT INTO `measurewifitable` VALUES (311, 37, '54:1f:8d:50:17:2e', -49, NULL, 16, 31, 1);
INSERT INTO `measurewifitable` VALUES (312, 37, '54:1f:8d:51:55:1f', -39, NULL, 16, 31, 1);
INSERT INTO `measurewifitable` VALUES (313, 37, '54:1f:8d:46:97:ef', -40, NULL, 21, 1, 1);
INSERT INTO `measurewifitable` VALUES (314, 37, '54:1f:8d:46:9a:71', -46, NULL, 21, 1, 1);
INSERT INTO `measurewifitable` VALUES (315, 37, '54:1f:8d:50:17:2e', -50, NULL, 21, 1, 1);
INSERT INTO `measurewifitable` VALUES (316, 37, '54:1f:8d:51:55:1f', -53, NULL, 21, 1, 1);
INSERT INTO `measurewifitable` VALUES (317, 37, '54:1f:8d:46:97:ef', -41, NULL, 21, 1, 1);
INSERT INTO `measurewifitable` VALUES (318, 37, '54:1f:8d:46:9a:71', -58, NULL, 21, 1, 1);
INSERT INTO `measurewifitable` VALUES (319, 37, '54:1f:8d:50:17:2e', -46, NULL, 21, 1, 1);
INSERT INTO `measurewifitable` VALUES (320, 37, '54:1f:8d:51:55:1f', -52, NULL, 21, 1, 1);
INSERT INTO `measurewifitable` VALUES (321, 37, '54:1f:8d:46:97:ef', -39, NULL, 21, 1, 1);
INSERT INTO `measurewifitable` VALUES (322, 37, '54:1f:8d:46:9a:71', -50, NULL, 21, 1, 1);
INSERT INTO `measurewifitable` VALUES (323, 37, '54:1f:8d:50:17:2e', -45, NULL, 21, 1, 1);
INSERT INTO `measurewifitable` VALUES (324, 37, '54:1f:8d:51:55:1f', -52, NULL, 21, 1, 1);
INSERT INTO `measurewifitable` VALUES (325, 37, '54:1f:8d:46:97:ef', -56, NULL, 21, 6, 1);
INSERT INTO `measurewifitable` VALUES (326, 37, '54:1f:8d:46:9a:71', -49, NULL, 21, 6, 1);
INSERT INTO `measurewifitable` VALUES (327, 37, '54:1f:8d:50:17:2e', -43, NULL, 21, 6, 1);
INSERT INTO `measurewifitable` VALUES (328, 37, '54:1f:8d:51:55:1f', -54, NULL, 21, 6, 1);
INSERT INTO `measurewifitable` VALUES (329, 37, '54:1f:8d:46:97:ef', -55, NULL, 21, 6, 1);
INSERT INTO `measurewifitable` VALUES (330, 37, '54:1f:8d:46:9a:71', -48, NULL, 21, 6, 1);
INSERT INTO `measurewifitable` VALUES (331, 37, '54:1f:8d:50:17:2e', -37, NULL, 21, 6, 1);
INSERT INTO `measurewifitable` VALUES (332, 37, '54:1f:8d:51:55:1f', -44, NULL, 21, 6, 1);
INSERT INTO `measurewifitable` VALUES (333, 37, '54:1f:8d:46:97:ef', -48, NULL, 21, 6, 1);
INSERT INTO `measurewifitable` VALUES (334, 37, '54:1f:8d:46:9a:71', -46, NULL, 21, 6, 1);
INSERT INTO `measurewifitable` VALUES (335, 37, '54:1f:8d:50:17:2e', -45, NULL, 21, 6, 1);
INSERT INTO `measurewifitable` VALUES (336, 37, '54:1f:8d:51:55:1f', -53, NULL, 21, 6, 1);
INSERT INTO `measurewifitable` VALUES (337, 37, '54:1f:8d:46:97:ef', -55, NULL, 21, 11, 1);
INSERT INTO `measurewifitable` VALUES (338, 37, '54:1f:8d:46:9a:71', -66, NULL, 21, 11, 1);
INSERT INTO `measurewifitable` VALUES (339, 37, '54:1f:8d:50:17:2e', -47, NULL, 21, 11, 1);
INSERT INTO `measurewifitable` VALUES (340, 37, '54:1f:8d:51:55:1f', -52, NULL, 21, 11, 1);
INSERT INTO `measurewifitable` VALUES (341, 37, '54:1f:8d:46:97:ef', -57, NULL, 21, 11, 1);
INSERT INTO `measurewifitable` VALUES (342, 37, '54:1f:8d:46:9a:71', -54, NULL, 21, 11, 1);
INSERT INTO `measurewifitable` VALUES (343, 37, '54:1f:8d:50:17:2e', -45, NULL, 21, 11, 1);
INSERT INTO `measurewifitable` VALUES (344, 37, '54:1f:8d:51:55:1f', -58, NULL, 21, 11, 1);
INSERT INTO `measurewifitable` VALUES (345, 37, '54:1f:8d:46:97:ef', -61, NULL, 21, 11, 1);
INSERT INTO `measurewifitable` VALUES (346, 37, '54:1f:8d:46:9a:71', -54, NULL, 21, 11, 1);
INSERT INTO `measurewifitable` VALUES (347, 37, '54:1f:8d:50:17:2e', -44, NULL, 21, 11, 1);
INSERT INTO `measurewifitable` VALUES (348, 37, '54:1f:8d:51:55:1f', -50, NULL, 21, 11, 1);
INSERT INTO `measurewifitable` VALUES (349, 37, '54:1f:8d:46:97:ef', -58, NULL, 21, 16, 1);
INSERT INTO `measurewifitable` VALUES (350, 37, '54:1f:8d:46:9a:71', -55, NULL, 21, 16, 1);
INSERT INTO `measurewifitable` VALUES (351, 37, '54:1f:8d:50:17:2e', -40, NULL, 21, 16, 1);
INSERT INTO `measurewifitable` VALUES (352, 37, '54:1f:8d:51:55:1f', -53, NULL, 21, 16, 1);
INSERT INTO `measurewifitable` VALUES (353, 37, '54:1f:8d:46:97:ef', -42, NULL, 21, 16, 1);
INSERT INTO `measurewifitable` VALUES (354, 37, '54:1f:8d:46:9a:71', -46, NULL, 21, 16, 1);
INSERT INTO `measurewifitable` VALUES (355, 37, '54:1f:8d:50:17:2e', -30, NULL, 21, 16, 1);
INSERT INTO `measurewifitable` VALUES (356, 37, '54:1f:8d:51:55:1f', -51, NULL, 21, 16, 1);
INSERT INTO `measurewifitable` VALUES (357, 37, '54:1f:8d:46:97:ef', -53, NULL, 21, 16, 1);
INSERT INTO `measurewifitable` VALUES (358, 37, '54:1f:8d:46:9a:71', -51, NULL, 21, 16, 1);
INSERT INTO `measurewifitable` VALUES (359, 37, '54:1f:8d:50:17:2e', -40, NULL, 21, 16, 1);
INSERT INTO `measurewifitable` VALUES (360, 37, '54:1f:8d:51:55:1f', -45, NULL, 21, 16, 1);
INSERT INTO `measurewifitable` VALUES (361, 37, '54:1f:8d:46:97:ef', -49, NULL, 21, 21, 1);
INSERT INTO `measurewifitable` VALUES (362, 37, '54:1f:8d:46:9a:71', -50, NULL, 21, 21, 1);
INSERT INTO `measurewifitable` VALUES (363, 37, '54:1f:8d:50:17:2e', -43, NULL, 21, 21, 1);
INSERT INTO `measurewifitable` VALUES (364, 37, '54:1f:8d:51:55:1f', -50, NULL, 21, 21, 1);
INSERT INTO `measurewifitable` VALUES (365, 37, '54:1f:8d:46:97:ef', -51, NULL, 21, 21, 1);
INSERT INTO `measurewifitable` VALUES (366, 37, '54:1f:8d:46:9a:71', -51, NULL, 21, 21, 1);
INSERT INTO `measurewifitable` VALUES (367, 37, '54:1f:8d:50:17:2e', -46, NULL, 21, 21, 1);
INSERT INTO `measurewifitable` VALUES (368, 37, '54:1f:8d:51:55:1f', -44, NULL, 21, 21, 1);
INSERT INTO `measurewifitable` VALUES (369, 37, '54:1f:8d:46:97:ef', -46, NULL, 21, 21, 1);
INSERT INTO `measurewifitable` VALUES (370, 37, '54:1f:8d:46:9a:71', -51, NULL, 21, 21, 1);
INSERT INTO `measurewifitable` VALUES (371, 37, '54:1f:8d:50:17:2e', -34, NULL, 21, 21, 1);
INSERT INTO `measurewifitable` VALUES (372, 37, '54:1f:8d:51:55:1f', -39, NULL, 21, 21, 1);
INSERT INTO `measurewifitable` VALUES (373, 37, '54:1f:8d:46:97:ef', -56, NULL, 21, 26, 1);
INSERT INTO `measurewifitable` VALUES (374, 37, '54:1f:8d:46:9a:71', -60, NULL, 21, 26, 1);
INSERT INTO `measurewifitable` VALUES (375, 37, '54:1f:8d:50:17:2e', -41, NULL, 21, 26, 1);
INSERT INTO `measurewifitable` VALUES (376, 37, '54:1f:8d:51:55:1f', -47, NULL, 21, 26, 1);
INSERT INTO `measurewifitable` VALUES (377, 37, '54:1f:8d:46:97:ef', -55, NULL, 21, 26, 1);
INSERT INTO `measurewifitable` VALUES (378, 37, '54:1f:8d:46:9a:71', -52, NULL, 21, 26, 1);
INSERT INTO `measurewifitable` VALUES (379, 37, '54:1f:8d:50:17:2e', -44, NULL, 21, 26, 1);
INSERT INTO `measurewifitable` VALUES (380, 37, '54:1f:8d:51:55:1f', -47, NULL, 21, 26, 1);
INSERT INTO `measurewifitable` VALUES (381, 37, '54:1f:8d:46:97:ef', -59, NULL, 21, 26, 1);
INSERT INTO `measurewifitable` VALUES (382, 37, '54:1f:8d:46:9a:71', -46, NULL, 21, 26, 1);
INSERT INTO `measurewifitable` VALUES (383, 37, '54:1f:8d:50:17:2e', -34, NULL, 21, 26, 1);
INSERT INTO `measurewifitable` VALUES (384, 37, '54:1f:8d:51:55:1f', -49, NULL, 21, 26, 1);
INSERT INTO `measurewifitable` VALUES (385, 37, '54:1f:8d:46:97:ef', -43, NULL, 21, 31, 1);
INSERT INTO `measurewifitable` VALUES (386, 37, '54:1f:8d:46:9a:71', -43, NULL, 21, 31, 1);
INSERT INTO `measurewifitable` VALUES (387, 37, '54:1f:8d:50:17:2e', -43, NULL, 21, 31, 1);
INSERT INTO `measurewifitable` VALUES (388, 37, '54:1f:8d:51:55:1f', -46, NULL, 21, 31, 1);
INSERT INTO `measurewifitable` VALUES (389, 37, '54:1f:8d:46:97:ef', -49, NULL, 21, 31, 1);
INSERT INTO `measurewifitable` VALUES (390, 37, '54:1f:8d:46:9a:71', -45, NULL, 21, 31, 1);
INSERT INTO `measurewifitable` VALUES (391, 37, '54:1f:8d:50:17:2e', -38, NULL, 21, 31, 1);
INSERT INTO `measurewifitable` VALUES (392, 37, '54:1f:8d:51:55:1f', -49, NULL, 21, 31, 1);
INSERT INTO `measurewifitable` VALUES (393, 37, '54:1f:8d:46:97:ef', -42, NULL, 21, 31, 1);
INSERT INTO `measurewifitable` VALUES (394, 37, '54:1f:8d:46:9a:71', -42, NULL, 21, 31, 1);
INSERT INTO `measurewifitable` VALUES (395, 37, '54:1f:8d:50:17:2e', -38, NULL, 21, 31, 1);
INSERT INTO `measurewifitable` VALUES (396, 37, '54:1f:8d:51:55:1f', -54, NULL, 21, 31, 1);
INSERT INTO `measurewifitable` VALUES (397, 37, '54:1f:8d:46:97:ef', -48, NULL, 26, 1, 1);
INSERT INTO `measurewifitable` VALUES (398, 37, '54:1f:8d:46:9a:71', -52, NULL, 26, 1, 1);
INSERT INTO `measurewifitable` VALUES (399, 37, '54:1f:8d:50:17:2e', -50, NULL, 26, 1, 1);
INSERT INTO `measurewifitable` VALUES (400, 37, '54:1f:8d:51:55:1f', -52, NULL, 26, 1, 1);
INSERT INTO `measurewifitable` VALUES (401, 37, '54:1f:8d:46:97:ef', -56, NULL, 26, 1, 1);
INSERT INTO `measurewifitable` VALUES (402, 37, '54:1f:8d:46:9a:71', -60, NULL, 26, 1, 1);
INSERT INTO `measurewifitable` VALUES (403, 37, '54:1f:8d:50:17:2e', -44, NULL, 26, 1, 1);
INSERT INTO `measurewifitable` VALUES (404, 37, '54:1f:8d:51:55:1f', -54, NULL, 26, 1, 1);
INSERT INTO `measurewifitable` VALUES (405, 37, '54:1f:8d:46:97:ef', -52, NULL, 26, 1, 1);
INSERT INTO `measurewifitable` VALUES (406, 37, '54:1f:8d:46:9a:71', -59, NULL, 26, 1, 1);
INSERT INTO `measurewifitable` VALUES (407, 37, '54:1f:8d:50:17:2e', -43, NULL, 26, 1, 1);
INSERT INTO `measurewifitable` VALUES (408, 37, '54:1f:8d:51:55:1f', -48, NULL, 26, 1, 1);
INSERT INTO `measurewifitable` VALUES (409, 37, '54:1f:8d:46:97:ef', -43, NULL, 26, 6, 1);
INSERT INTO `measurewifitable` VALUES (410, 37, '54:1f:8d:46:9a:71', -48, NULL, 26, 6, 1);
INSERT INTO `measurewifitable` VALUES (411, 37, '54:1f:8d:50:17:2e', -56, NULL, 26, 6, 1);
INSERT INTO `measurewifitable` VALUES (412, 37, '54:1f:8d:51:55:1f', -40, NULL, 26, 6, 1);
INSERT INTO `measurewifitable` VALUES (413, 37, '54:1f:8d:46:97:ef', -63, NULL, 26, 6, 1);
INSERT INTO `measurewifitable` VALUES (414, 37, '54:1f:8d:46:9a:71', -64, NULL, 26, 6, 1);
INSERT INTO `measurewifitable` VALUES (415, 37, '54:1f:8d:50:17:2e', -52, NULL, 26, 6, 1);
INSERT INTO `measurewifitable` VALUES (416, 37, '54:1f:8d:51:55:1f', -57, NULL, 26, 6, 1);
INSERT INTO `measurewifitable` VALUES (417, 37, '54:1f:8d:46:97:ef', -61, NULL, 26, 6, 1);
INSERT INTO `measurewifitable` VALUES (418, 37, '54:1f:8d:46:9a:71', -56, NULL, 26, 6, 1);
INSERT INTO `measurewifitable` VALUES (419, 37, '54:1f:8d:50:17:2e', -43, NULL, 26, 6, 1);
INSERT INTO `measurewifitable` VALUES (420, 37, '54:1f:8d:51:55:1f', -46, NULL, 26, 6, 1);
INSERT INTO `measurewifitable` VALUES (421, 37, '54:1f:8d:46:97:ef', -51, NULL, 26, 11, 1);
INSERT INTO `measurewifitable` VALUES (422, 37, '54:1f:8d:46:9a:71', -58, NULL, 26, 11, 1);
INSERT INTO `measurewifitable` VALUES (423, 37, '54:1f:8d:50:17:2e', -44, NULL, 26, 11, 1);
INSERT INTO `measurewifitable` VALUES (424, 37, '54:1f:8d:51:55:1f', -43, NULL, 26, 11, 1);
INSERT INTO `measurewifitable` VALUES (425, 37, '54:1f:8d:46:97:ef', -51, NULL, 26, 11, 1);
INSERT INTO `measurewifitable` VALUES (426, 37, '54:1f:8d:46:9a:71', -54, NULL, 26, 11, 1);
INSERT INTO `measurewifitable` VALUES (427, 37, '54:1f:8d:50:17:2e', -44, NULL, 26, 11, 1);
INSERT INTO `measurewifitable` VALUES (428, 37, '54:1f:8d:51:55:1f', -42, NULL, 26, 11, 1);
INSERT INTO `measurewifitable` VALUES (429, 37, '54:1f:8d:46:97:ef', -50, NULL, 26, 11, 1);
INSERT INTO `measurewifitable` VALUES (430, 37, '54:1f:8d:46:9a:71', -47, NULL, 26, 11, 1);
INSERT INTO `measurewifitable` VALUES (431, 37, '54:1f:8d:50:17:2e', -43, NULL, 26, 11, 1);
INSERT INTO `measurewifitable` VALUES (432, 37, '54:1f:8d:51:55:1f', -48, NULL, 26, 11, 1);
INSERT INTO `measurewifitable` VALUES (433, 37, '54:1f:8d:46:97:ef', -50, NULL, 26, 16, 1);
INSERT INTO `measurewifitable` VALUES (434, 37, '54:1f:8d:46:9a:71', -55, NULL, 26, 16, 1);
INSERT INTO `measurewifitable` VALUES (435, 37, '54:1f:8d:50:17:2e', -42, NULL, 26, 16, 1);
INSERT INTO `measurewifitable` VALUES (436, 37, '54:1f:8d:51:55:1f', -49, NULL, 26, 16, 1);
INSERT INTO `measurewifitable` VALUES (437, 37, '54:1f:8d:46:97:ef', -56, NULL, 26, 16, 1);
INSERT INTO `measurewifitable` VALUES (438, 37, '54:1f:8d:46:9a:71', -57, NULL, 26, 16, 1);
INSERT INTO `measurewifitable` VALUES (439, 37, '54:1f:8d:50:17:2e', -43, NULL, 26, 16, 1);
INSERT INTO `measurewifitable` VALUES (440, 37, '54:1f:8d:51:55:1f', -51, NULL, 26, 16, 1);
INSERT INTO `measurewifitable` VALUES (441, 37, '54:1f:8d:46:97:ef', -52, NULL, 26, 16, 1);
INSERT INTO `measurewifitable` VALUES (442, 37, '54:1f:8d:46:9a:71', -58, NULL, 26, 16, 1);
INSERT INTO `measurewifitable` VALUES (443, 37, '54:1f:8d:50:17:2e', -39, NULL, 26, 16, 1);
INSERT INTO `measurewifitable` VALUES (444, 37, '54:1f:8d:51:55:1f', -51, NULL, 26, 16, 1);
INSERT INTO `measurewifitable` VALUES (445, 37, '54:1f:8d:46:97:ef', -50, NULL, 26, 21, 1);
INSERT INTO `measurewifitable` VALUES (446, 37, '54:1f:8d:46:9a:71', -51, NULL, 26, 21, 1);
INSERT INTO `measurewifitable` VALUES (447, 37, '54:1f:8d:50:17:2e', -41, NULL, 26, 21, 1);
INSERT INTO `measurewifitable` VALUES (448, 37, '54:1f:8d:51:55:1f', -41, NULL, 26, 21, 1);
INSERT INTO `measurewifitable` VALUES (449, 37, '54:1f:8d:46:97:ef', -51, NULL, 26, 21, 1);
INSERT INTO `measurewifitable` VALUES (450, 37, '54:1f:8d:46:9a:71', -50, NULL, 26, 21, 1);
INSERT INTO `measurewifitable` VALUES (451, 37, '54:1f:8d:50:17:2e', -63, NULL, 26, 21, 1);
INSERT INTO `measurewifitable` VALUES (452, 37, '54:1f:8d:51:55:1f', -44, NULL, 26, 21, 1);
INSERT INTO `measurewifitable` VALUES (453, 37, '54:1f:8d:46:97:ef', -36, NULL, 26, 21, 1);
INSERT INTO `measurewifitable` VALUES (454, 37, '54:1f:8d:46:9a:71', -49, NULL, 26, 21, 1);
INSERT INTO `measurewifitable` VALUES (455, 37, '54:1f:8d:50:17:2e', -43, NULL, 26, 21, 1);
INSERT INTO `measurewifitable` VALUES (456, 37, '54:1f:8d:51:55:1f', -38, NULL, 26, 21, 1);
INSERT INTO `measurewifitable` VALUES (457, 37, '54:1f:8d:46:97:ef', -49, NULL, 26, 26, 1);
INSERT INTO `measurewifitable` VALUES (458, 37, '54:1f:8d:46:9a:71', -57, NULL, 26, 26, 1);
INSERT INTO `measurewifitable` VALUES (459, 37, '54:1f:8d:50:17:2e', -50, NULL, 26, 26, 1);
INSERT INTO `measurewifitable` VALUES (460, 37, '54:1f:8d:51:55:1f', -41, NULL, 26, 26, 1);
INSERT INTO `measurewifitable` VALUES (461, 37, '54:1f:8d:46:97:ef', -54, NULL, 26, 26, 1);
INSERT INTO `measurewifitable` VALUES (462, 37, '54:1f:8d:46:9a:71', -48, NULL, 26, 26, 1);
INSERT INTO `measurewifitable` VALUES (463, 37, '54:1f:8d:50:17:2e', -60, NULL, 26, 26, 1);
INSERT INTO `measurewifitable` VALUES (464, 37, '54:1f:8d:51:55:1f', -37, NULL, 26, 26, 1);
INSERT INTO `measurewifitable` VALUES (465, 37, '54:1f:8d:46:97:ef', -44, NULL, 26, 26, 1);
INSERT INTO `measurewifitable` VALUES (466, 37, '54:1f:8d:46:9a:71', -50, NULL, 26, 26, 1);
INSERT INTO `measurewifitable` VALUES (467, 37, '54:1f:8d:50:17:2e', -49, NULL, 26, 26, 1);
INSERT INTO `measurewifitable` VALUES (468, 37, '54:1f:8d:51:55:1f', -41, NULL, 26, 26, 1);
INSERT INTO `measurewifitable` VALUES (469, 37, '54:1f:8d:46:97:ef', -47, NULL, 26, 31, 1);
INSERT INTO `measurewifitable` VALUES (470, 37, '54:1f:8d:46:9a:71', -44, NULL, 26, 31, 1);
INSERT INTO `measurewifitable` VALUES (471, 37, '54:1f:8d:50:17:2e', -37, NULL, 26, 31, 1);
INSERT INTO `measurewifitable` VALUES (472, 37, '54:1f:8d:51:55:1f', -50, NULL, 26, 31, 1);
INSERT INTO `measurewifitable` VALUES (473, 37, '54:1f:8d:46:97:ef', -52, NULL, 26, 31, 1);
INSERT INTO `measurewifitable` VALUES (474, 37, '54:1f:8d:46:9a:71', -57, NULL, 26, 31, 1);
INSERT INTO `measurewifitable` VALUES (475, 37, '54:1f:8d:50:17:2e', -50, NULL, 26, 31, 1);
INSERT INTO `measurewifitable` VALUES (476, 37, '54:1f:8d:51:55:1f', -54, NULL, 26, 31, 1);
INSERT INTO `measurewifitable` VALUES (477, 37, '54:1f:8d:46:97:ef', -55, NULL, 26, 31, 1);
INSERT INTO `measurewifitable` VALUES (478, 37, '54:1f:8d:46:9a:71', -49, NULL, 26, 31, 1);
INSERT INTO `measurewifitable` VALUES (479, 37, '54:1f:8d:50:17:2e', -47, NULL, 26, 31, 1);
INSERT INTO `measurewifitable` VALUES (480, 37, '54:1f:8d:51:55:1f', -56, NULL, 26, 31, 1);
INSERT INTO `measurewifitable` VALUES (481, 37, '54:1f:8d:46:97:ef', -55, NULL, 31, 6, 1);
INSERT INTO `measurewifitable` VALUES (482, 37, '54:1f:8d:46:9a:71', -54, NULL, 31, 6, 1);
INSERT INTO `measurewifitable` VALUES (483, 37, '54:1f:8d:50:17:2e', -47, NULL, 31, 6, 1);
INSERT INTO `measurewifitable` VALUES (484, 37, '54:1f:8d:51:55:1f', -62, NULL, 31, 6, 1);
INSERT INTO `measurewifitable` VALUES (485, 37, '54:1f:8d:46:97:ef', -59, NULL, 31, 6, 1);
INSERT INTO `measurewifitable` VALUES (486, 37, '54:1f:8d:46:9a:71', -54, NULL, 31, 6, 1);
INSERT INTO `measurewifitable` VALUES (487, 37, '54:1f:8d:50:17:2e', -48, NULL, 31, 6, 1);
INSERT INTO `measurewifitable` VALUES (488, 37, '54:1f:8d:51:55:1f', -56, NULL, 31, 6, 1);
INSERT INTO `measurewifitable` VALUES (489, 37, '54:1f:8d:46:97:ef', -64, NULL, 31, 6, 1);
INSERT INTO `measurewifitable` VALUES (490, 37, '54:1f:8d:46:9a:71', -41, NULL, 31, 6, 1);
INSERT INTO `measurewifitable` VALUES (491, 37, '54:1f:8d:50:17:2e', -53, NULL, 31, 6, 1);
INSERT INTO `measurewifitable` VALUES (492, 37, '54:1f:8d:51:55:1f', -59, NULL, 31, 6, 1);
INSERT INTO `measurewifitable` VALUES (493, 37, '54:1f:8d:46:97:ef', -54, NULL, 31, 11, 1);
INSERT INTO `measurewifitable` VALUES (494, 37, '54:1f:8d:46:9a:71', -35, NULL, 31, 11, 1);
INSERT INTO `measurewifitable` VALUES (495, 37, '54:1f:8d:50:17:2e', -55, NULL, 31, 11, 1);
INSERT INTO `measurewifitable` VALUES (496, 37, '54:1f:8d:51:55:1f', -53, NULL, 31, 11, 1);
INSERT INTO `measurewifitable` VALUES (497, 37, '54:1f:8d:46:97:ef', -48, NULL, 31, 11, 1);
INSERT INTO `measurewifitable` VALUES (498, 37, '54:1f:8d:46:9a:71', -45, NULL, 31, 11, 1);
INSERT INTO `measurewifitable` VALUES (499, 37, '54:1f:8d:50:17:2e', -52, NULL, 31, 11, 1);
INSERT INTO `measurewifitable` VALUES (500, 37, '54:1f:8d:51:55:1f', -57, NULL, 31, 11, 1);
INSERT INTO `measurewifitable` VALUES (501, 37, '54:1f:8d:46:97:ef', -52, NULL, 31, 11, 1);
INSERT INTO `measurewifitable` VALUES (502, 37, '54:1f:8d:46:9a:71', -49, NULL, 31, 11, 1);
INSERT INTO `measurewifitable` VALUES (503, 37, '54:1f:8d:50:17:2e', -62, NULL, 31, 11, 1);
INSERT INTO `measurewifitable` VALUES (504, 37, '54:1f:8d:51:55:1f', -58, NULL, 31, 11, 1);
INSERT INTO `measurewifitable` VALUES (505, 37, '54:1f:8d:46:97:ef', -48, NULL, 31, 16, 1);
INSERT INTO `measurewifitable` VALUES (506, 37, '54:1f:8d:46:9a:71', -44, NULL, 31, 16, 1);
INSERT INTO `measurewifitable` VALUES (507, 37, '54:1f:8d:50:17:2e', -50, NULL, 31, 16, 1);
INSERT INTO `measurewifitable` VALUES (508, 37, '54:1f:8d:51:55:1f', -51, NULL, 31, 16, 1);
INSERT INTO `measurewifitable` VALUES (509, 37, '54:1f:8d:46:97:ef', -56, NULL, 31, 16, 1);
INSERT INTO `measurewifitable` VALUES (510, 37, '54:1f:8d:46:9a:71', -46, NULL, 31, 16, 1);
INSERT INTO `measurewifitable` VALUES (511, 37, '54:1f:8d:50:17:2e', -44, NULL, 31, 16, 1);
INSERT INTO `measurewifitable` VALUES (512, 37, '54:1f:8d:51:55:1f', -63, NULL, 31, 16, 1);
INSERT INTO `measurewifitable` VALUES (513, 37, '54:1f:8d:46:97:ef', -52, NULL, 31, 16, 1);
INSERT INTO `measurewifitable` VALUES (514, 37, '54:1f:8d:46:9a:71', -41, NULL, 31, 16, 1);
INSERT INTO `measurewifitable` VALUES (515, 37, '54:1f:8d:50:17:2e', -43, NULL, 31, 16, 1);
INSERT INTO `measurewifitable` VALUES (516, 37, '54:1f:8d:51:55:1f', -57, NULL, 31, 16, 1);
INSERT INTO `measurewifitable` VALUES (517, 37, '54:1f:8d:46:97:ef', -69, NULL, 31, 21, 1);
INSERT INTO `measurewifitable` VALUES (518, 37, '54:1f:8d:46:9a:71', -38, NULL, 31, 21, 1);
INSERT INTO `measurewifitable` VALUES (519, 37, '54:1f:8d:50:17:2e', -57, NULL, 31, 21, 1);
INSERT INTO `measurewifitable` VALUES (520, 37, '54:1f:8d:51:55:1f', -60, NULL, 31, 21, 1);
INSERT INTO `measurewifitable` VALUES (521, 37, '54:1f:8d:46:97:ef', -64, NULL, 31, 21, 1);
INSERT INTO `measurewifitable` VALUES (522, 37, '54:1f:8d:46:9a:71', -45, NULL, 31, 21, 1);
INSERT INTO `measurewifitable` VALUES (523, 37, '54:1f:8d:50:17:2e', -54, NULL, 31, 21, 1);
INSERT INTO `measurewifitable` VALUES (524, 37, '54:1f:8d:51:55:1f', -59, NULL, 31, 21, 1);
INSERT INTO `measurewifitable` VALUES (525, 37, '54:1f:8d:46:97:ef', -66, NULL, 31, 21, 1);
INSERT INTO `measurewifitable` VALUES (526, 37, '54:1f:8d:46:9a:71', -47, NULL, 31, 21, 1);
INSERT INTO `measurewifitable` VALUES (527, 37, '54:1f:8d:50:17:2e', -58, NULL, 31, 21, 1);
INSERT INTO `measurewifitable` VALUES (528, 37, '54:1f:8d:51:55:1f', -59, NULL, 31, 21, 1);
INSERT INTO `measurewifitable` VALUES (529, 37, '54:1f:8d:46:97:ef', -38, NULL, 31, 26, 1);
INSERT INTO `measurewifitable` VALUES (530, 37, '54:1f:8d:46:9a:71', -49, NULL, 31, 26, 1);
INSERT INTO `measurewifitable` VALUES (531, 37, '54:1f:8d:50:17:2e', -56, NULL, 31, 26, 1);
INSERT INTO `measurewifitable` VALUES (532, 37, '54:1f:8d:51:55:1f', -43, NULL, 31, 26, 1);
INSERT INTO `measurewifitable` VALUES (533, 37, '54:1f:8d:46:97:ef', -48, NULL, 31, 26, 1);
INSERT INTO `measurewifitable` VALUES (534, 37, '54:1f:8d:46:9a:71', -48, NULL, 31, 26, 1);
INSERT INTO `measurewifitable` VALUES (535, 37, '54:1f:8d:50:17:2e', -57, NULL, 31, 26, 1);
INSERT INTO `measurewifitable` VALUES (536, 37, '54:1f:8d:51:55:1f', -52, NULL, 31, 26, 1);
INSERT INTO `measurewifitable` VALUES (537, 37, '54:1f:8d:46:97:ef', -46, NULL, 31, 26, 1);
INSERT INTO `measurewifitable` VALUES (538, 37, '54:1f:8d:46:9a:71', -55, NULL, 31, 26, 1);
INSERT INTO `measurewifitable` VALUES (539, 37, '54:1f:8d:50:17:2e', -46, NULL, 31, 26, 1);
INSERT INTO `measurewifitable` VALUES (540, 37, '54:1f:8d:51:55:1f', -48, NULL, 31, 26, 1);

-- ----------------------------
-- Table structure for positiontable
-- ----------------------------
DROP TABLE IF EXISTS `positiontable`;
CREATE TABLE `positiontable`  (
  `po_id` bigint(255) NOT NULL AUTO_INCREMENT COMMENT '位置 id',
  `po_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '位置名字',
  `area_id` bigint(255) NOT NULL COMMENT '所处区域 id',
  `po_x` float NOT NULL COMMENT 'x轴',
  `po_y` float NOT NULL COMMENT 'y轴',
  `po_z` float NOT NULL COMMENT 'z轴',
  PRIMARY KEY (`po_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 122 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of positiontable
-- ----------------------------
INSERT INTO `positiontable` VALUES (55, 'ZTE_51551F/AP position', 37, 1, 1, 1);
INSERT INTO `positiontable` VALUES (56, 'ZTE_50172E/AP position', 37, 31, 31, 1);
INSERT INTO `positiontable` VALUES (57, 'ZTE_469A71/AP position', 37, 1, 31, 1);
INSERT INTO `positiontable` VALUES (58, 'ZTE_4697EF/AP position', 37, 31, 1, 1);
INSERT INTO `positiontable` VALUES (59, 'ZTE_5155DD/AP position', 40, 6, 1, 2);
INSERT INTO `positiontable` VALUES (60, 'ZTE_5150A7/AP position', 40, 1, 1, 2);
INSERT INTO `positiontable` VALUES (61, 'ZTE_469878/AP position', 40, 1, 6, 2);
INSERT INTO `positiontable` VALUES (62, 'ZTE_5150A7/AP position', 41, 1, 1, 1);
INSERT INTO `positiontable` VALUES (63, 'ZTE_469878/AP position', 41, 1, 11, 3);
INSERT INTO `positiontable` VALUES (64, 'ZTE_5155DD/AP position', 41, 11, 1, 3);
INSERT INTO `positiontable` VALUES (65, 'ZTE_5150A7/AP position', 42, 1, 1, 4);
INSERT INTO `positiontable` VALUES (66, 'ZTE_5155DD/AP position', 42, 16, 1, 4);
INSERT INTO `positiontable` VALUES (67, 'ZTE_469878/AP position', 42, 1, 16, 4);
INSERT INTO `positiontable` VALUES (68, 'ZTE_469878/AP position', 43, 1, 21, 5);
INSERT INTO `positiontable` VALUES (69, 'ZTE_5155DD/AP position', 43, 21, 1, 5);
INSERT INTO `positiontable` VALUES (70, 'ZTE_5150A7/AP position', 43, 1, 1, 5);
INSERT INTO `positiontable` VALUES (71, 'ZTE_469878/AP position', 44, 1, 26, 6);
INSERT INTO `positiontable` VALUES (72, 'ZTE_5150A7/AP position', 44, 1, 1, 6);
INSERT INTO `positiontable` VALUES (73, 'ZTE_5155DD/AP position', 44, 26, 1, 6);
INSERT INTO `positiontable` VALUES (74, 'ZTE_5155DD/AP position', 45, 31, 1, 7);
INSERT INTO `positiontable` VALUES (75, 'ZTE_469878/AP position', 45, 1, 31, 7);
INSERT INTO `positiontable` VALUES (76, 'ETZ_5150A7/AP position', 45, 1, 1, 7);
INSERT INTO `positiontable` VALUES (77, 'XYZ/finger position', 37, 1, 6, 1);
INSERT INTO `positiontable` VALUES (78, 'XYZ/finger position', 37, 1, 11, 1);
INSERT INTO `positiontable` VALUES (79, 'XYZ/finger position', 37, 1, 16, 1);
INSERT INTO `positiontable` VALUES (80, 'XYZ/finger position', 37, 1, 21, 1);
INSERT INTO `positiontable` VALUES (81, 'XYZ/finger position', 37, 1, 26, 1);
INSERT INTO `positiontable` VALUES (82, 'XYZ/finger position', 37, 6, 1, 1);
INSERT INTO `positiontable` VALUES (83, 'XYZ/finger position', 37, 6, 6, 1);
INSERT INTO `positiontable` VALUES (84, 'XYZ/finger position', 37, 6, 11, 1);
INSERT INTO `positiontable` VALUES (85, 'XYZ/finger position', 37, 6, 16, 1);
INSERT INTO `positiontable` VALUES (86, 'XYZ/finger position', 37, 6, 21, 1);
INSERT INTO `positiontable` VALUES (87, 'XYZ/finger position', 37, 6, 26, 1);
INSERT INTO `positiontable` VALUES (88, 'XYZ/finger position', 37, 6, 31, 1);
INSERT INTO `positiontable` VALUES (89, 'XYZ/finger position', 37, 11, 1, 1);
INSERT INTO `positiontable` VALUES (90, 'XYZ/finger position', 37, 11, 6, 1);
INSERT INTO `positiontable` VALUES (91, 'XYZ/finger position', 37, 11, 11, 1);
INSERT INTO `positiontable` VALUES (92, 'XYZ/finger position', 37, 11, 16, 1);
INSERT INTO `positiontable` VALUES (93, 'XYZ/finger position', 37, 11, 21, 1);
INSERT INTO `positiontable` VALUES (94, 'XYZ/finger position', 37, 11, 26, 1);
INSERT INTO `positiontable` VALUES (95, 'XYZ/finger position', 37, 11, 31, 1);
INSERT INTO `positiontable` VALUES (96, 'XYZ/finger position', 37, 16, 1, 1);
INSERT INTO `positiontable` VALUES (97, 'XYZ/finger position', 37, 16, 6, 1);
INSERT INTO `positiontable` VALUES (98, 'XYZ/finger position', 37, 16, 11, 1);
INSERT INTO `positiontable` VALUES (99, 'XYZ/finger position', 37, 16, 16, 1);
INSERT INTO `positiontable` VALUES (100, 'XYZ/finger position', 37, 16, 21, 1);
INSERT INTO `positiontable` VALUES (101, 'XYZ/finger position', 37, 16, 26, 1);
INSERT INTO `positiontable` VALUES (102, 'XYZ/finger position', 37, 16, 31, 1);
INSERT INTO `positiontable` VALUES (103, 'XYZ/finger position', 37, 21, 1, 1);
INSERT INTO `positiontable` VALUES (104, 'XYZ/finger position', 37, 21, 6, 1);
INSERT INTO `positiontable` VALUES (105, 'XYZ/finger position', 37, 21, 11, 1);
INSERT INTO `positiontable` VALUES (106, 'XYZ/finger position', 37, 21, 16, 1);
INSERT INTO `positiontable` VALUES (107, 'XYZ/finger position', 37, 21, 21, 1);
INSERT INTO `positiontable` VALUES (108, 'XYZ/finger position', 37, 21, 26, 1);
INSERT INTO `positiontable` VALUES (109, 'XYZ/finger position', 37, 21, 31, 1);
INSERT INTO `positiontable` VALUES (110, 'XYZ/finger position', 37, 26, 1, 1);
INSERT INTO `positiontable` VALUES (111, 'XYZ/finger position', 37, 26, 6, 1);
INSERT INTO `positiontable` VALUES (112, 'XYZ/finger position', 37, 26, 11, 1);
INSERT INTO `positiontable` VALUES (113, 'XYZ/finger position', 37, 26, 16, 1);
INSERT INTO `positiontable` VALUES (114, 'XYZ/finger position', 37, 26, 21, 1);
INSERT INTO `positiontable` VALUES (115, 'XYZ/finger position', 37, 26, 26, 1);
INSERT INTO `positiontable` VALUES (116, 'XYZ/finger position', 37, 26, 31, 1);
INSERT INTO `positiontable` VALUES (117, 'XYZ/finger position', 37, 31, 6, 1);
INSERT INTO `positiontable` VALUES (118, 'XYZ/finger position', 37, 31, 11, 1);
INSERT INTO `positiontable` VALUES (119, 'XYZ/finger position', 37, 31, 16, 1);
INSERT INTO `positiontable` VALUES (120, 'XYZ/finger position', 37, 31, 21, 1);
INSERT INTO `positiontable` VALUES (121, 'XYZ/finger position', 37, 31, 26, 1);

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'Blob类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '日历信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'Cron类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '已触发的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '任务详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '存储的悲观锁信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '暂停的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '调度器状态表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '简单触发器的信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '同步机制的行锁表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(13) NOT NULL COMMENT '开始时间',
  `end_time` bigint(13) NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(2) NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '触发器详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2024-03-29 20:39:43', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-03-29 20:39:43', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-03-29 20:39:43', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2024-03-29 20:39:43', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2024-03-29 20:39:43', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2024-03-29 20:39:43', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-03-29 20:39:43', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-03-29 20:39:43', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-03-29 20:39:43', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-03-29 20:39:43', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-03-29 20:39:43', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-03-29 20:39:43', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-03-29 20:39:43', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-03-29 20:39:43', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-03-29 20:39:43', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-03-29 20:39:43', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-03-29 20:39:43', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-03-29 20:39:43', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-03-29 20:39:43', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-03-29 20:39:43', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-03-29 20:39:43', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-03-29 20:39:43', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-03-29 20:39:43', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2024-03-29 20:39:43', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2024-03-29 20:39:43', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2024-03-29 20:39:43', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-03-29 20:39:43', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-03-29 20:39:43', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-03-29 20:39:43', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2024-03-29 20:39:43', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2024-03-29 20:39:43', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2024-03-29 20:39:43', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2024-03-29 20:39:43', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-03-29 20:39:43', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-03-29 20:39:43', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-03-29 20:39:43', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-03-29 20:39:43', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2024-03-29 20:39:43', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-03-29 20:39:43', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-03-29 20:39:43', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-03-29 20:39:43', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-03-29 20:39:43', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-03-29 20:39:43', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2024-03-29 20:39:43', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2024-03-29 20:39:43', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2024-03-29 20:39:43', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2024-03-29 20:39:43', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2024-03-29 20:39:43', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2024-03-29 20:39:43', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2024-03-29 20:39:43', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2024-03-29 20:39:43', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2024-03-29 20:39:43', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2024-03-29 20:39:43', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2024-03-29 20:39:43', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2024-03-29 20:39:43', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '定时任务调度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2024-03-29 20:39:43', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '定时任务调度日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status`) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 129 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-29 22:22:46');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-03-29 22:40:54');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-29 22:40:59');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-03-29 22:40:59');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-29 22:41:22');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-03-29 22:41:22');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-29 22:41:40');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-03-29 22:41:41');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-29 22:42:02');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-03-29 22:42:02');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-29 22:43:14');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-03-29 22:45:32');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-29 22:45:40');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-29 22:46:24');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-03-29 23:14:43');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-29 23:22:01');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-30 00:21:04');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-31 14:28:06');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-31 15:42:19');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-18 19:19:43');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-19 12:22:09');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-19 12:33:15');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-06-19 13:42:08');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-06-19 13:42:11');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-19 13:42:14');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-19 15:06:05');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-19 17:08:29');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-06-20 13:29:20');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-20 13:29:24');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(1) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2031 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2024-03-29 20:39:43', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2024-03-29 20:39:43', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2024-03-29 20:39:43', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', NULL, '', 0, 0, 'M', '0', '0', '', 'guide', 'admin', '2024-03-29 20:39:43', '', NULL, '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2024-03-29 20:39:43', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2024-03-29 20:39:43', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2024-03-29 20:39:43', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2024-03-29 20:39:43', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2024-03-29 20:39:43', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2024-03-29 20:39:43', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2024-03-29 20:39:43', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2024-03-29 20:39:43', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2024-03-29 20:39:43', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2024-03-29 20:39:43', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2024-03-29 20:39:43', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2024-03-29 20:39:43', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2024-03-29 20:39:43', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2024-03-29 20:39:43', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2024-03-29 20:39:43', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2024-03-29 20:39:43', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2024-03-29 20:39:43', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2024-03-29 20:39:43', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2024-03-29 20:39:43', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2024-03-29 20:39:43', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, 'wifi定位', 0, 4, 'system', NULL, NULL, 1, 0, 'M', '0', '0', '', 'online', 'admin', '2024-03-29 23:50:09', 'admin', '2024-03-29 23:50:23', '');
INSERT INTO `sys_menu` VALUES (2001, 'ap信息', 2000, 1, 'aptable', 'system/aptable/index', NULL, 1, 0, 'C', '0', '0', 'system:aptable:list', '#', 'admin', '2024-03-29 23:51:30', 'admin', '2024-03-29 23:52:26', '');
INSERT INTO `sys_menu` VALUES (2002, 'ap查询', 2001, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:aptable:query', '#', 'admin', '2024-03-30 00:56:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, 'ap新增', 2001, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:aptable:add', '#', 'admin', '2024-03-30 00:57:59', 'admin', '2024-03-30 00:58:14', '');
INSERT INTO `sys_menu` VALUES (2004, 'ap修改', 2001, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:aptable:edit', '#', 'admin', '2024-03-30 00:59:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, 'ap删除', 2001, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:aptable:remove', '#', 'admin', '2024-03-30 01:02:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, 'ap导出', 2001, 5, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:aptable:export', '#', 'admin', '2024-03-30 01:03:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2007, '区域', 2000, 2, 'areatable', 'system/areatable/index', NULL, 1, 0, 'C', '0', '0', 'system:areatable:list', '#', 'admin', '2024-03-30 01:05:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2008, '区域查询', 2007, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:areatable:query', '#', 'admin', '2024-03-30 01:06:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2009, '区域新增', 2007, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:areatable:add', '#', 'admin', '2024-03-30 01:07:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2010, '区域修改', 2007, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:areatable:edit', '#', 'admin', '2024-03-30 01:08:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '区域删除', 2007, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:areatable:remove', '#', 'admin', '2024-03-30 01:08:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '区域导出', 2007, 5, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:areatable:export', '#', 'admin', '2024-03-30 01:09:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, '位置信息', 2000, 3, 'positiontable', 'system/positiontable/index', NULL, 1, 0, 'C', '0', '0', 'system:positiontable:list', 'build', 'admin', '2024-03-30 01:11:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2014, '位置点查询', 2013, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:positiontable:query', '#', 'admin', '2024-03-30 01:11:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, '位置新增', 2013, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:positiontable:add', '#', 'admin', '2024-03-30 01:12:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '位置修改', 2013, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:positiontable:edit', '#', 'admin', '2024-03-30 01:13:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '位置删除', 2013, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:positiontable:remove', '#', 'admin', '2024-03-30 01:13:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '位置导出', 2013, 5, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:positiontable:export', '#', 'admin', '2024-03-30 01:14:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2019, '信号测试', 2000, 4, 'measurewifitable', 'system/measurewifitable/index', NULL, 1, 0, 'C', '0', '0', 'system:measurewifitable:list', '#', 'admin', '2024-03-30 01:16:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2020, '信号查询', 2019, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:measurewifitable:query', '#', 'admin', '2024-03-30 01:16:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2021, '信号新增', 2019, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:measurewifitable:add', '#', 'admin', '2024-03-30 01:16:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2022, '信号修改', 2019, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:measurewifitable:edit', '#', 'admin', '2024-03-30 01:17:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2023, '信号删除', 2019, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:measurewifitable:remove', '#', 'admin', '2024-03-30 01:17:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2024, '信号导出', 2019, 5, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:measurewifitable:export', '#', 'admin', '2024-03-30 01:17:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2025, '指纹库', 2000, 5, 'wifitable', 'system/wifitable/index', NULL, 1, 0, 'C', '0', '0', 'system:wifitable:list', '#', 'admin', '2024-03-30 01:18:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2026, '指纹查询', 2025, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:wifitable:query', '#', 'admin', '2024-03-30 01:19:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2027, '指纹新增', 2025, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:wifitable:add', '#', 'admin', '2024-03-30 01:19:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2028, '指纹修改', 2025, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:wifitable:edit', '#', 'admin', '2024-03-30 01:19:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2029, '指纹删除', 2025, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:wifitable:remove', '#', 'admin', '2024-03-30 01:20:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2030, '指纹导出', 2025, 5, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:wifitable:export', '#', 'admin', '2024-03-30 01:20:22', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2024-03-29 20:39:43', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2024-03-29 20:39:43', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(20) NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type`) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status`) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 147 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"areatable,positiontable,wifitable,aptable\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-29 23:23:56', 272);
INSERT INTO `sys_oper_log` VALUES (101, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"measurewifitable\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-29 23:24:05', 20);
INSERT INTO `sys_oper_log` VALUES (102, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"aptable,areatable,positiontable,wifitable,measurewifitable\"}', NULL, 0, NULL, '2024-03-29 23:24:09', 333);
INSERT INTO `sys_oper_log` VALUES (103, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"aptable,areatable,positiontable,wifitable,measurewifitable\"}', NULL, 0, NULL, '2024-03-29 23:29:37', 364);
INSERT INTO `sys_oper_log` VALUES (104, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"online\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"wifi定位\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"/system/\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-29 23:50:09', 134);
INSERT INTO `sys_oper_log` VALUES (105, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-03-29 23:50:09\",\"icon\":\"online\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"wifi定位\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-29 23:50:23', 19);
INSERT INTO `sys_oper_log` VALUES (106, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"ap信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"system\",\"perms\":\"system:aptable:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-29 23:51:30', 12);
INSERT INTO `sys_oper_log` VALUES (107, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/aptable/index\",\"createTime\":\"2024-03-29 23:51:30\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"ap信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"aptable\",\"perms\":\"system:aptable:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-29 23:52:26', 6);
INSERT INTO `sys_oper_log` VALUES (108, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"aptable\"}', NULL, 0, NULL, '2024-03-30 00:21:26', 96);
INSERT INTO `sys_oper_log` VALUES (109, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/1,2,3,4,5', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-30 00:22:08', 10);
INSERT INTO `sys_oper_log` VALUES (110, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"wifitable,areatable,aptable,positiontable,measurewifitable\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-30 00:22:20', 50);
INSERT INTO `sys_oper_log` VALUES (111, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"aptable,areatable,measurewifitable,positiontable,wifitable\"}', NULL, 0, NULL, '2024-03-30 00:23:35', 69);
INSERT INTO `sys_oper_log` VALUES (112, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"ap查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"perms\":\"system:aptable:query\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-30 00:56:51', 106);
INSERT INTO `sys_oper_log` VALUES (113, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"ap新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2002,\"perms\":\"system:aptable:add\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-30 00:57:59', 10);
INSERT INTO `sys_oper_log` VALUES (114, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-03-30 00:57:59\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"ap新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2001,\"path\":\"\",\"perms\":\"system:aptable:add\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-30 00:58:14', 11);
INSERT INTO `sys_oper_log` VALUES (115, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"ap修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2001,\"perms\":\"system:aptable:edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-30 00:59:37', 7);
INSERT INTO `sys_oper_log` VALUES (116, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"ap删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2001,\"perms\":\"system:aptable:remove\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-30 01:02:20', 8);
INSERT INTO `sys_oper_log` VALUES (117, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"ap导出\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2001,\"perms\":\"system:aptable:export\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-30 01:03:44', 12);
INSERT INTO `sys_oper_log` VALUES (118, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/areatable/index\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"区域\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2000,\"path\":\"areatable\",\"perms\":\"system:areatable:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-30 01:05:51', 7);
INSERT INTO `sys_oper_log` VALUES (119, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"区域查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2007,\"perms\":\"system:areatable:query\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-30 01:06:52', 6);
INSERT INTO `sys_oper_log` VALUES (120, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"区域新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2007,\"perms\":\"system:areatable:add\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-30 01:07:43', 9);
INSERT INTO `sys_oper_log` VALUES (121, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"区域修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2007,\"perms\":\"system:areatable:edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-30 01:08:09', 4);
INSERT INTO `sys_oper_log` VALUES (122, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"区域删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2007,\"perms\":\"system:areatable:remove\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-30 01:08:40', 5);
INSERT INTO `sys_oper_log` VALUES (123, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"区域导出\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2007,\"perms\":\"system:areatable:export\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-30 01:09:06', 7);
INSERT INTO `sys_oper_log` VALUES (124, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/positiontable/index\",\"createBy\":\"admin\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"位置信息\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2000,\"path\":\"positiontable\",\"perms\":\"system:positiontable:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-30 01:11:18', 5);
INSERT INTO `sys_oper_log` VALUES (125, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"位置点查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2013,\"perms\":\"system:positiontable:query\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-30 01:11:48', 6);
INSERT INTO `sys_oper_log` VALUES (126, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"位置新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2013,\"perms\":\"system:positiontable:add\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-30 01:12:35', 6);
INSERT INTO `sys_oper_log` VALUES (127, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"位置修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2013,\"perms\":\"system:positiontable:edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-30 01:13:24', 5);
INSERT INTO `sys_oper_log` VALUES (128, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"位置删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2013,\"perms\":\"system:positiontable:remove\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-30 01:13:42', 5);
INSERT INTO `sys_oper_log` VALUES (129, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"位置导出\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2013,\"perms\":\"system:positiontable:export\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-30 01:14:11', 7);
INSERT INTO `sys_oper_log` VALUES (130, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/measurewifitable/index\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"信号测试\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2000,\"path\":\"measurewifitable\",\"perms\":\"system:measurewifitable:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-30 01:16:11', 6);
INSERT INTO `sys_oper_log` VALUES (131, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"信号查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2019,\"perms\":\"system:measurewifitable:query\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-30 01:16:38', 10);
INSERT INTO `sys_oper_log` VALUES (132, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"信号新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2019,\"perms\":\"system:measurewifitable:add\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-30 01:16:55', 5);
INSERT INTO `sys_oper_log` VALUES (133, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"信号修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2019,\"perms\":\"system:measurewifitable:edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-30 01:17:10', 5);
INSERT INTO `sys_oper_log` VALUES (134, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"信号删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2019,\"perms\":\"system:measurewifitable:remove\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-30 01:17:24', 6);
INSERT INTO `sys_oper_log` VALUES (135, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"信号导出\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2019,\"perms\":\"system:measurewifitable:export\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-30 01:17:39', 4);
INSERT INTO `sys_oper_log` VALUES (136, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/wifitable/index\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"指纹库\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":2000,\"path\":\"wifitable\",\"perms\":\"system:wifitable:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-30 01:18:53', 4);
INSERT INTO `sys_oper_log` VALUES (137, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"指纹查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2025,\"perms\":\"system:wifitable:query\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-30 01:19:12', 8);
INSERT INTO `sys_oper_log` VALUES (138, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"指纹新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2025,\"perms\":\"system:wifitable:add\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-30 01:19:39', 5);
INSERT INTO `sys_oper_log` VALUES (139, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"指纹修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2025,\"perms\":\"system:wifitable:edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-30 01:19:54', 3);
INSERT INTO `sys_oper_log` VALUES (140, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"指纹删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2025,\"perms\":\"system:wifitable:remove\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-30 01:20:09', 5);
INSERT INTO `sys_oper_log` VALUES (141, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"指纹导出\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2025,\"perms\":\"system:wifitable:export\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-30 01:20:22', 8);
INSERT INTO `sys_oper_log` VALUES (142, '【请填写功能名称】', 5, 'com.ruoyi.web.controller.system.MeasurewifitableController.export()', 'POST', 1, 'admin', '研发部门', '/system/measurewifitable/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 1, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'block_id\' in \'field list\'\r\n### The error may exist in file [C:\\Users\\20623\\Desktop\\horizontal project\\ry-vue\\WifiIndoorLocation\\ruoyi-system\\target\\classes\\mapper\\system\\MeasurewifitableMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.MeasurewifitableMapper.selectMeasurewifitableList-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select measure_wifi_id, area_id, block_id, wi_mac, measure_wifi_rssi, measure_wifi_date, po_x, po_y, po_z from measurewifitable\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'block_id\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'block_id\' in \'field list\'', '2024-06-19 12:36:40', 165);
INSERT INTO `sys_oper_log` VALUES (143, '用户管理', 6, 'com.ruoyi.web.controller.system.MeasurewifitableController.importData()', 'POST', 1, 'admin', '研发部门', '/system/measurewifitable/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"0\"}', '{\"msg\":\"get\",\"code\":200}', 0, NULL, '2024-06-19 13:52:15', 663);
INSERT INTO `sys_oper_log` VALUES (144, '【更新wifitable】', 2, 'com.ruoyi.web.controller.system.WifitableController.update()', 'PUT', 1, 'admin', '研发部门', '/system/wifitable/update', '127.0.0.1', '内网IP', '{\"apMac\":\"54:1f:8d:46:97:ef\",\"areaId\":37,\"poX\":1.0,\"poY\":6.0,\"poZ\":1.0}', NULL, 1, 'Index 0 out of bounds for length 0', '2024-06-19 17:11:27', 236);
INSERT INTO `sys_oper_log` VALUES (145, '【更新wifitable】', 2, 'com.ruoyi.web.controller.system.WifitableController.update()', 'PUT', 1, 'admin', '研发部门', '/system/wifitable/update', '127.0.0.1', '内网IP', '{\"apMac\":\"54:1f:8d:46:97:ef\",\"areaId\":37,\"poX\":1.0,\"poY\":6.0,\"poZ\":1.0}', NULL, 1, 'Index 0 out of bounds for length 0', '2024-06-19 17:11:40', 154);
INSERT INTO `sys_oper_log` VALUES (146, '【更新wifitable】', 2, 'com.ruoyi.web.controller.system.WifitableController.update()', 'PUT', 1, 'admin', '研发部门', '/system/wifitable/update', '127.0.0.1', '内网IP', '{\"apMac\":\"54:1f:8d:46:97:ef\",\"areaId\":37,\"poX\":1.0,\"poY\":6.0,\"poZ\":1.0}', NULL, 1, 'Index 0 out of bounds for length 0', '2024-06-19 17:14:01', 226);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2024-03-29 20:39:43', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2024-03-29 20:39:43', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2024-03-29 20:39:43', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2024-03-29 20:39:43', '', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-06-20 13:29:24', 'admin', '2024-03-29 20:39:43', '', '2024-06-20 13:29:24', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-03-29 20:39:43', 'admin', '2024-03-29 20:39:43', '', NULL, '测试员');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

-- ----------------------------
-- Table structure for wifitable
-- ----------------------------
DROP TABLE IF EXISTS `wifitable`;
CREATE TABLE `wifitable`  (
  `wi_id` bigint(255) NOT NULL AUTO_INCREMENT COMMENT '指纹 id',
  `po_id` bigint(255) NOT NULL COMMENT '指纹所处位置 id',
  `ap_id` bigint(255) NOT NULL COMMENT ' wifi 硬件位置',
  `wi_rssi` int(11) NULL DEFAULT NULL COMMENT 'wifi 信号平均值',
  `wi_date` datetime NULL DEFAULT NULL COMMENT '产生时间',
  PRIMARY KEY (`wi_id`) USING BTREE,
  UNIQUE INDEX `unique_query`(`po_id`, `ap_id`) USING BTREE COMMENT '一个wifi，在指纹表里只需要一个信号值'
) ENGINE = InnoDB AUTO_INCREMENT = 181 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wifitable
-- ----------------------------
INSERT INTO `wifitable` VALUES (1, 77, 47, -43, '2024-06-20 11:07:03');
INSERT INTO `wifitable` VALUES (2, 77, 46, -49, '2024-06-20 11:10:43');
INSERT INTO `wifitable` VALUES (3, 77, 45, -42, '2024-06-20 11:15:56');
INSERT INTO `wifitable` VALUES (4, 77, 44, -42, '2024-06-20 10:59:43');
INSERT INTO `wifitable` VALUES (5, 78, 47, -51, '2024-06-20 11:07:13');
INSERT INTO `wifitable` VALUES (6, 78, 46, -48, '2024-06-20 11:12:20');
INSERT INTO `wifitable` VALUES (7, 78, 45, -45, '2024-06-20 11:15:59');
INSERT INTO `wifitable` VALUES (8, 78, 44, -50, '2024-06-20 11:00:33');
INSERT INTO `wifitable` VALUES (9, 79, 47, -43, '2024-06-20 11:07:16');
INSERT INTO `wifitable` VALUES (10, 79, 46, -40, '2024-06-20 11:12:23');
INSERT INTO `wifitable` VALUES (11, 79, 45, -47, '2024-06-20 11:16:02');
INSERT INTO `wifitable` VALUES (12, 79, 44, -44, '2024-06-20 11:00:45');
INSERT INTO `wifitable` VALUES (13, 80, 47, -48, '2024-06-20 11:07:19');
INSERT INTO `wifitable` VALUES (14, 80, 46, -43, '2024-06-20 11:12:27');
INSERT INTO `wifitable` VALUES (15, 80, 45, -44, '2024-06-20 11:16:05');
INSERT INTO `wifitable` VALUES (16, 80, 44, -47, '2024-06-20 11:00:52');
INSERT INTO `wifitable` VALUES (17, 81, 47, -48, '2024-06-20 11:07:23');
INSERT INTO `wifitable` VALUES (18, 81, 46, -57, '2024-06-20 11:12:30');
INSERT INTO `wifitable` VALUES (19, 81, 45, -42, '2024-06-20 11:16:07');
INSERT INTO `wifitable` VALUES (20, 81, 44, -34, '2024-06-20 11:00:57');
INSERT INTO `wifitable` VALUES (21, 82, 47, -53, '2024-06-20 11:07:32');
INSERT INTO `wifitable` VALUES (22, 82, 46, -56, '2024-06-20 11:12:39');
INSERT INTO `wifitable` VALUES (23, 82, 45, -56, '2024-06-20 11:16:13');
INSERT INTO `wifitable` VALUES (24, 82, 44, -39, '2024-06-20 11:01:28');
INSERT INTO `wifitable` VALUES (25, 83, 47, -56, '2024-06-20 11:07:41');
INSERT INTO `wifitable` VALUES (26, 83, 46, -53, '2024-06-20 11:12:43');
INSERT INTO `wifitable` VALUES (27, 83, 45, -53, '2024-06-20 11:16:15');
INSERT INTO `wifitable` VALUES (28, 83, 44, -43, '2024-06-20 11:01:33');
INSERT INTO `wifitable` VALUES (29, 84, 47, -53, '2024-06-20 11:07:46');
INSERT INTO `wifitable` VALUES (30, 84, 46, -44, '2024-06-20 11:12:46');
INSERT INTO `wifitable` VALUES (31, 84, 45, -57, '2024-06-20 11:16:18');
INSERT INTO `wifitable` VALUES (32, 84, 44, -51, '2024-06-20 11:01:38');
INSERT INTO `wifitable` VALUES (33, 85, 47, -55, '2024-06-20 11:07:49');
INSERT INTO `wifitable` VALUES (34, 85, 46, -50, '2024-06-20 11:12:49');
INSERT INTO `wifitable` VALUES (35, 85, 45, -52, '2024-06-20 11:16:20');
INSERT INTO `wifitable` VALUES (36, 85, 44, -55, '2024-06-20 11:01:46');
INSERT INTO `wifitable` VALUES (37, 86, 47, -55, '2024-06-20 11:07:53');
INSERT INTO `wifitable` VALUES (38, 86, 46, -51, '2024-06-20 11:12:51');
INSERT INTO `wifitable` VALUES (39, 86, 45, -52, '2024-06-20 11:16:23');
INSERT INTO `wifitable` VALUES (40, 86, 44, -56, '2024-06-20 11:01:49');
INSERT INTO `wifitable` VALUES (41, 87, 47, -58, '2024-06-20 11:07:55');
INSERT INTO `wifitable` VALUES (42, 87, 46, -45, '2024-06-20 11:12:55');
INSERT INTO `wifitable` VALUES (43, 87, 45, -55, '2024-06-20 11:16:25');
INSERT INTO `wifitable` VALUES (44, 87, 44, -52, '2024-06-20 11:01:53');
INSERT INTO `wifitable` VALUES (45, 88, 47, -47, '2024-06-20 11:07:58');
INSERT INTO `wifitable` VALUES (46, 88, 46, -52, '2024-06-20 11:12:58');
INSERT INTO `wifitable` VALUES (47, 88, 45, -51, '2024-06-20 11:16:27');
INSERT INTO `wifitable` VALUES (48, 88, 44, -43, '2024-06-20 11:01:56');
INSERT INTO `wifitable` VALUES (49, 89, 47, -44, '2024-06-20 11:08:04');
INSERT INTO `wifitable` VALUES (50, 89, 46, -52, '2024-06-20 11:13:10');
INSERT INTO `wifitable` VALUES (51, 89, 45, -50, '2024-06-20 11:16:31');
INSERT INTO `wifitable` VALUES (52, 89, 44, -44, '2024-06-20 11:02:05');
INSERT INTO `wifitable` VALUES (53, 90, 47, -44, '2024-06-20 11:08:08');
INSERT INTO `wifitable` VALUES (54, 90, 46, -49, '2024-06-20 11:13:13');
INSERT INTO `wifitable` VALUES (55, 90, 45, -37, '2024-06-20 11:16:33');
INSERT INTO `wifitable` VALUES (56, 90, 44, -36, '2024-06-20 11:02:09');
INSERT INTO `wifitable` VALUES (57, 91, 47, -48, '2024-06-20 11:08:11');
INSERT INTO `wifitable` VALUES (58, 91, 46, -44, '2024-06-20 11:13:17');
INSERT INTO `wifitable` VALUES (59, 91, 45, -42, '2024-06-20 11:16:34');
INSERT INTO `wifitable` VALUES (60, 91, 44, -41, '2024-06-20 11:02:12');
INSERT INTO `wifitable` VALUES (61, 92, 47, -49, '2024-06-20 11:08:15');
INSERT INTO `wifitable` VALUES (62, 92, 46, -47, '2024-06-20 11:13:20');
INSERT INTO `wifitable` VALUES (63, 92, 45, -44, '2024-06-20 11:16:36');
INSERT INTO `wifitable` VALUES (64, 92, 44, -49, '2024-06-20 11:02:16');
INSERT INTO `wifitable` VALUES (65, 93, 47, -48, '2024-06-20 11:08:19');
INSERT INTO `wifitable` VALUES (66, 93, 46, -43, '2024-06-20 11:13:23');
INSERT INTO `wifitable` VALUES (67, 93, 45, -40, '2024-06-20 11:16:38');
INSERT INTO `wifitable` VALUES (68, 93, 44, -52, '2024-06-20 11:02:20');
INSERT INTO `wifitable` VALUES (69, 94, 47, -48, '2024-06-20 11:08:21');
INSERT INTO `wifitable` VALUES (70, 94, 46, -40, '2024-06-20 11:13:26');
INSERT INTO `wifitable` VALUES (71, 94, 45, -38, '2024-06-20 11:16:40');
INSERT INTO `wifitable` VALUES (72, 94, 44, -41, '2024-06-20 11:02:23');
INSERT INTO `wifitable` VALUES (73, 95, 47, -47, '2024-06-20 11:08:25');
INSERT INTO `wifitable` VALUES (74, 95, 46, -50, '2024-06-20 11:13:29');
INSERT INTO `wifitable` VALUES (75, 95, 45, -51, '2024-06-20 11:16:42');
INSERT INTO `wifitable` VALUES (76, 95, 44, -41, '2024-06-20 11:02:27');
INSERT INTO `wifitable` VALUES (77, 96, 47, -41, '2024-06-20 11:08:38');
INSERT INTO `wifitable` VALUES (78, 96, 46, -50, '2024-06-20 11:13:34');
INSERT INTO `wifitable` VALUES (79, 96, 45, -49, '2024-06-20 11:16:46');
INSERT INTO `wifitable` VALUES (80, 96, 44, -42, '2024-06-20 11:02:34');
INSERT INTO `wifitable` VALUES (81, 97, 47, -50, '2024-06-20 11:08:42');
INSERT INTO `wifitable` VALUES (82, 97, 46, -48, '2024-06-20 11:13:37');
INSERT INTO `wifitable` VALUES (83, 97, 45, -45, '2024-06-20 11:16:51');
INSERT INTO `wifitable` VALUES (84, 97, 44, -44, '2024-06-20 11:02:37');
INSERT INTO `wifitable` VALUES (85, 98, 47, -50, '2024-06-20 11:08:45');
INSERT INTO `wifitable` VALUES (86, 98, 46, -52, '2024-06-20 11:13:40');
INSERT INTO `wifitable` VALUES (87, 98, 45, -44, '2024-06-20 11:16:53');
INSERT INTO `wifitable` VALUES (88, 98, 44, -55, '2024-06-20 11:02:41');
INSERT INTO `wifitable` VALUES (89, 99, 47, -50, '2024-06-20 11:08:48');
INSERT INTO `wifitable` VALUES (90, 99, 46, -46, '2024-06-20 11:13:43');
INSERT INTO `wifitable` VALUES (91, 99, 45, -44, '2024-06-20 11:16:55');
INSERT INTO `wifitable` VALUES (92, 99, 44, -50, '2024-06-20 11:02:44');
INSERT INTO `wifitable` VALUES (93, 100, 47, -58, '2024-06-20 11:08:51');
INSERT INTO `wifitable` VALUES (94, 100, 46, -49, '2024-06-20 11:13:47');
INSERT INTO `wifitable` VALUES (95, 100, 45, -45, '2024-06-20 11:16:58');
INSERT INTO `wifitable` VALUES (96, 100, 44, -55, '2024-06-20 11:03:04');
INSERT INTO `wifitable` VALUES (97, 101, 47, -50, '2024-06-20 11:08:55');
INSERT INTO `wifitable` VALUES (98, 101, 46, -47, '2024-06-20 11:13:50');
INSERT INTO `wifitable` VALUES (99, 101, 45, -33, '2024-06-20 11:16:59');
INSERT INTO `wifitable` VALUES (100, 101, 44, -47, '2024-06-20 11:03:07');
INSERT INTO `wifitable` VALUES (101, 102, 47, -42, '2024-06-20 11:08:59');
INSERT INTO `wifitable` VALUES (102, 102, 46, -51, '2024-06-20 11:13:55');
INSERT INTO `wifitable` VALUES (103, 102, 45, -49, '2024-06-20 11:17:01');
INSERT INTO `wifitable` VALUES (104, 102, 44, -43, '2024-06-20 11:03:10');
INSERT INTO `wifitable` VALUES (105, 103, 47, -40, '2024-06-20 11:09:09');
INSERT INTO `wifitable` VALUES (106, 103, 46, -51, '2024-06-20 11:14:02');
INSERT INTO `wifitable` VALUES (107, 103, 45, -47, '2024-06-20 11:18:00');
INSERT INTO `wifitable` VALUES (108, 103, 44, -52, '2024-06-20 11:03:28');
INSERT INTO `wifitable` VALUES (109, 104, 47, -53, '2024-06-20 11:09:14');
INSERT INTO `wifitable` VALUES (110, 104, 46, -48, '2024-06-20 11:14:06');
INSERT INTO `wifitable` VALUES (111, 104, 45, -42, '2024-06-20 11:18:02');
INSERT INTO `wifitable` VALUES (112, 104, 44, -50, '2024-06-20 11:03:30');
INSERT INTO `wifitable` VALUES (113, 105, 47, -58, '2024-06-20 11:09:17');
INSERT INTO `wifitable` VALUES (114, 105, 46, -58, '2024-06-20 11:14:18');
INSERT INTO `wifitable` VALUES (115, 105, 45, -45, '2024-06-20 11:18:04');
INSERT INTO `wifitable` VALUES (116, 105, 44, -53, '2024-06-20 11:03:34');
INSERT INTO `wifitable` VALUES (117, 106, 47, -51, '2024-06-20 11:09:20');
INSERT INTO `wifitable` VALUES (118, 106, 46, -51, '2024-06-20 11:14:23');
INSERT INTO `wifitable` VALUES (119, 106, 45, -37, '2024-06-20 11:18:07');
INSERT INTO `wifitable` VALUES (120, 106, 44, -50, '2024-06-20 11:03:39');
INSERT INTO `wifitable` VALUES (121, 107, 47, -49, '2024-06-20 11:09:24');
INSERT INTO `wifitable` VALUES (122, 107, 46, -51, '2024-06-20 11:14:25');
INSERT INTO `wifitable` VALUES (123, 107, 45, -41, '2024-06-20 11:18:09');
INSERT INTO `wifitable` VALUES (124, 107, 44, -44, '2024-06-20 11:03:43');
INSERT INTO `wifitable` VALUES (125, 108, 47, -57, '2024-06-20 11:09:29');
INSERT INTO `wifitable` VALUES (126, 108, 46, -53, '2024-06-20 11:14:30');
INSERT INTO `wifitable` VALUES (127, 108, 45, -40, '2024-06-20 11:18:11');
INSERT INTO `wifitable` VALUES (128, 108, 44, -48, '2024-06-20 11:03:47');
INSERT INTO `wifitable` VALUES (129, 109, 47, -45, '2024-06-20 11:09:32');
INSERT INTO `wifitable` VALUES (130, 109, 46, -43, '2024-06-20 11:14:33');
INSERT INTO `wifitable` VALUES (131, 109, 45, -40, '2024-06-20 11:18:13');
INSERT INTO `wifitable` VALUES (132, 109, 44, -50, '2024-06-20 11:03:50');
INSERT INTO `wifitable` VALUES (133, 110, 47, -52, '2024-06-20 11:09:38');
INSERT INTO `wifitable` VALUES (134, 110, 46, -57, '2024-06-20 11:14:38');
INSERT INTO `wifitable` VALUES (135, 110, 45, -46, '2024-06-20 11:18:18');
INSERT INTO `wifitable` VALUES (136, 110, 44, -51, '2024-06-20 11:04:04');
INSERT INTO `wifitable` VALUES (137, 111, 47, -56, '2024-06-20 11:09:41');
INSERT INTO `wifitable` VALUES (138, 111, 46, -56, '2024-06-20 11:14:41');
INSERT INTO `wifitable` VALUES (139, 111, 45, -50, '2024-06-20 11:18:20');
INSERT INTO `wifitable` VALUES (140, 111, 44, -48, '2024-06-20 11:04:00');
INSERT INTO `wifitable` VALUES (141, 112, 47, -51, '2024-06-20 11:09:44');
INSERT INTO `wifitable` VALUES (142, 112, 46, -53, '2024-06-20 11:14:44');
INSERT INTO `wifitable` VALUES (143, 112, 45, -44, '2024-06-20 11:18:22');
INSERT INTO `wifitable` VALUES (144, 112, 44, -44, '2024-06-20 11:04:07');
INSERT INTO `wifitable` VALUES (145, 113, 47, -53, '2024-06-20 11:09:47');
INSERT INTO `wifitable` VALUES (146, 113, 46, -57, '2024-06-20 11:14:47');
INSERT INTO `wifitable` VALUES (147, 113, 45, -41, '2024-06-20 11:18:24');
INSERT INTO `wifitable` VALUES (148, 113, 44, -50, '2024-06-20 11:04:10');
INSERT INTO `wifitable` VALUES (149, 114, 47, -46, '2024-06-20 11:09:50');
INSERT INTO `wifitable` VALUES (150, 114, 46, -50, '2024-06-20 11:14:50');
INSERT INTO `wifitable` VALUES (151, 114, 45, -49, '2024-06-20 11:18:25');
INSERT INTO `wifitable` VALUES (152, 114, 44, -41, '2024-06-20 11:04:13');
INSERT INTO `wifitable` VALUES (153, 115, 47, -49, '2024-06-20 11:09:53');
INSERT INTO `wifitable` VALUES (154, 115, 46, -52, '2024-06-20 11:14:53');
INSERT INTO `wifitable` VALUES (155, 115, 45, -53, '2024-06-20 11:18:30');
INSERT INTO `wifitable` VALUES (156, 115, 44, -40, '2024-06-20 11:04:15');
INSERT INTO `wifitable` VALUES (157, 116, 47, -51, '2024-06-20 11:09:56');
INSERT INTO `wifitable` VALUES (158, 116, 46, -50, '2024-06-20 11:14:56');
INSERT INTO `wifitable` VALUES (159, 116, 45, -45, '2024-06-20 11:18:37');
INSERT INTO `wifitable` VALUES (160, 116, 44, -53, '2024-06-20 11:04:20');
INSERT INTO `wifitable` VALUES (161, 117, 47, -59, '2024-06-20 11:10:07');
INSERT INTO `wifitable` VALUES (162, 117, 46, -50, '2024-06-20 11:15:00');
INSERT INTO `wifitable` VALUES (163, 117, 45, -49, '2024-06-20 11:18:48');
INSERT INTO `wifitable` VALUES (164, 117, 44, -59, '2024-06-20 11:04:48');
INSERT INTO `wifitable` VALUES (165, 118, 47, -51, '2024-06-20 11:10:11');
INSERT INTO `wifitable` VALUES (166, 118, 46, -43, '2024-06-20 11:15:05');
INSERT INTO `wifitable` VALUES (167, 118, 45, -56, '2024-06-20 11:18:50');
INSERT INTO `wifitable` VALUES (168, 118, 44, -56, '2024-06-20 11:05:17');
INSERT INTO `wifitable` VALUES (169, 119, 47, -52, '2024-06-20 11:10:15');
INSERT INTO `wifitable` VALUES (170, 119, 46, -44, '2024-06-20 11:15:09');
INSERT INTO `wifitable` VALUES (171, 119, 45, -46, '2024-06-20 11:18:52');
INSERT INTO `wifitable` VALUES (172, 119, 44, -57, '2024-06-20 11:05:22');
INSERT INTO `wifitable` VALUES (173, 120, 47, -66, '2024-06-20 11:10:19');
INSERT INTO `wifitable` VALUES (174, 120, 46, -43, '2024-06-20 11:15:15');
INSERT INTO `wifitable` VALUES (175, 120, 45, -56, '2024-06-20 11:18:54');
INSERT INTO `wifitable` VALUES (176, 120, 44, -59, '2024-06-20 11:05:25');
INSERT INTO `wifitable` VALUES (177, 121, 47, -44, '2024-06-20 11:10:22');
INSERT INTO `wifitable` VALUES (178, 121, 46, -51, '2024-06-20 11:15:19');
INSERT INTO `wifitable` VALUES (179, 121, 45, -53, '2024-06-20 11:18:55');
INSERT INTO `wifitable` VALUES (180, 121, 44, -48, '2024-06-20 11:05:28');

-- ----------------------------
-- View structure for fingerprint
-- ----------------------------
DROP VIEW IF EXISTS `fingerprint`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `fingerprint` AS select `areatable`.`area_name` AS `area_name`,`aptable`.`ap_name` AS `ap_name`,`positiontable`.`po_x` AS `po_x`,`positiontable`.`po_y` AS `po_y`,`positiontable`.`po_z` AS `po_z`,`wifitable`.`wi_rssi` AS `wi_rssi`,`wifitable`.`wi_date` AS `wi_date` from (((`wifitable` join `aptable`) join `areatable`) join `positiontable`) where ((`wifitable`.`ap_id` = `aptable`.`ap_id`) and (`positiontable`.`area_id` = `areatable`.`area_id`) and (`wifitable`.`po_id` = `positiontable`.`po_id`));

-- ----------------------------
-- View structure for measureinfo
-- ----------------------------
DROP VIEW IF EXISTS `measureinfo`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `measureinfo` AS select `areatable`.`area_name` AS `area_name`,`aptable`.`ap_name` AS `ap_name`,`measurewifitable`.`measure_wifi_rssi` AS `measure_wifi_rssi`,`measurewifitable`.`measure_wifi_date` AS `measure_wifi_date`,`measurewifitable`.`po_x` AS `po_x`,`measurewifitable`.`po_y` AS `po_y`,`measurewifitable`.`wi_mac` AS `wi_mac` from ((`measurewifitable` join `aptable`) join `areatable`) where ((`aptable`.`area_id` = `measurewifitable`.`area_id`) and (`aptable`.`ap_mac` = `measurewifitable`.`wi_mac`) and (`aptable`.`area_id` = `areatable`.`area_id`)) order by `aptable`.`ap_id`,`measurewifitable`.`po_x`;

SET FOREIGN_KEY_CHECKS = 1;
