/*
 Navicat Premium Data Transfer

 Source Server         : 本地数据库
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : mm

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 04/05/2020 22:47:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for activity_action_log
-- ----------------------------
DROP TABLE IF EXISTS `activity_action_log`;
CREATE TABLE `activity_action_log`  (
  `action_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '操作行为ID：[1,2147483647]',
  `time_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间：',
  `time_update` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间：',
  `func_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参操函数名：[0,32]',
  `uin_action` varchar(65) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作者uin：[0,65]',
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作方法：[0,255]',
  `log` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '操作记录：',
  PRIMARY KEY (`action_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '活动操作日志：记录谁操作过什么' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of activity_action_log
-- ----------------------------
INSERT INTO `activity_action_log` VALUES (1, '2020-03-03 22:58:00', '2020-03-03 22:58:21', 'activiys_item', 'xxx', 'get', NULL);

-- ----------------------------
-- Table structure for activity_info
-- ----------------------------
DROP TABLE IF EXISTS `activity_info`;
CREATE TABLE `activity_info`  (
  `activity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '活动ID：[1,2147483647]',
  `period_num` smallint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '活动周期数：[0,999]即多少天或多少年为一个周期',
  `period_unit` smallint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '活动周期单位：[0,16]1为日、2为周、3为月、4为年',
  `prize_1` smallint(6) UNSIGNED NOT NULL DEFAULT 0 COMMENT '一等奖：[0,32767]为奖品item_id',
  `prize_2` smallint(6) UNSIGNED NOT NULL DEFAULT 0 COMMENT '二等奖：[0,32767]为奖品item_id',
  `prize_3` smallint(6) UNSIGNED NOT NULL DEFAULT 0 COMMENT '三等奖：[0,32767]为奖品item_id',
  `prize_t` smallint(6) UNSIGNED NOT NULL DEFAULT 0 COMMENT '特等奖：[0,32767]为奖品item_id',
  `num_people` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '参与人数：[0,2147483647]',
  `num_winner` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '中奖人数：[0,2147483647]',
  `time_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间：',
  `time_update` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间：',
  `time_start` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '开始时间：',
  `time_end` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '结束时间：',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '活动名称：[0,16]',
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '活动类型：[0,16]',
  `uin_creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者uin：[0,64]',
  `title` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '活动标题：[0,125]',
  `descrtption` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '活动描述：[0,255]',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '活动详情：',
  `num_applicant` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '申请次数统计：[0,2147483647]',
  PRIMARY KEY (`activity_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '活动信息：用来编辑添加活动' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of activity_info
-- ----------------------------
INSERT INTO `activity_info` VALUES (1, 1, 4, 1, 0, 0, 0, 10000, 10, '2020-03-03 22:46:14', '2020-03-11 16:55:32', '2020-01-20 16:00:00', '2020-02-29 16:00:00', '心电捐赠活动', '抽奖', '', '腾讯联合武汉人民医院东院新冠21病区和武汉市第五医院推出智能心电服务捐赠活动', NULL, NULL, 0);
INSERT INTO `activity_info` VALUES (2, 1, 3, 1, 0, 0, 0, 0, 0, '2020-03-10 13:48:43', '2020-03-11 12:00:00', '1969-12-31 16:00:00', '1969-12-31 16:00:00', '呃呃呃', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `activity_info` VALUES (3, 1, 2, 0, 0, 1, 0, 100000, 10, '2020-03-10 13:49:55', '2020-03-11 16:55:35', '1969-12-31 00:00:00', '1969-12-31 00:00:00', '新互动', '竞猜', NULL, NULL, NULL, NULL, 0);
INSERT INTO `activity_info` VALUES (4, 1, 1, 0, 1, 0, 0, 0, 0, '2020-03-10 05:48:43', '2020-03-11 12:00:01', '2020-12-31 00:00:00', '1969-12-31 00:00:00', '呃呃呃', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `activity_info` VALUES (5, 1, 2, 0, 0, 0, 0, 500, 10, '2020-03-10 05:48:43', '2020-03-10 18:44:00', '2020-12-23 08:00:00', '2020-02-23 08:00:00', '呃呃呃', '转发', NULL, 'cese', 'eaea', NULL, 0);
INSERT INTO `activity_info` VALUES (6, 1, 2, 0, 0, 1, 0, 0, 0, '2020-03-10 17:54:59', '2020-03-11 12:00:02', '2020-12-31 00:00:00', '2020-12-31 00:00:00', '超值购活动', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `activity_info` VALUES (7, 1, 1, 0, 2, 1, 0, 0, 0, '2020-03-10 17:56:16', '2020-03-11 16:55:44', '1969-12-31 08:00:00', '2020-12-31 08:00:00', '呃呃呃', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `activity_info` VALUES (8, 1, 1, 0, 0, 0, 1, 0, 0, '2020-03-10 17:57:13', '2020-03-11 12:00:03', '2020-12-31 00:00:00', '2020-12-31 00:00:00', '呃呃呃', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `activity_info` VALUES (9, 1, 1, 0, 1, 0, 2, 100000, 10, '2020-03-10 18:32:21', '2020-03-11 16:55:42', '2019-12-31 00:00:00', '2019-12-31 00:00:00', '', NULL, NULL, NULL, NULL, NULL, 0);

-- ----------------------------
-- Table structure for activity_item
-- ----------------------------
DROP TABLE IF EXISTS `activity_item`;
CREATE TABLE `activity_item`  (
  `item_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '物品ID：[1,2147483647]',
  `price` double(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '物品价值：',
  `time_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间：',
  `time_update` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间：',
  `num` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '物品剩余数量：[0,2147483647]',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '物品名称：[0,16]',
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物品类型：[0,16]',
  `creator_uin` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者uin：[0,64]',
  `title` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物品标题：[0,125]',
  `descrtption` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物品描述：[0,255]',
  `img_cover` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '封面图：传base64',
  PRIMARY KEY (`item_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '活动奖品：用来办法给用户的奖品' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of activity_item
-- ----------------------------
INSERT INTO `activity_item` VALUES (1, 698.00, '2020-03-03 22:49:37', '2020-03-10 19:51:50', 50, '心电监测设备', '智能家电', NULL, '心电监测设备', '可穿戴心电监测设备及智能分析服务', 'data:image/jpeg;base64,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');
INSERT INTO `activity_item` VALUES (2, 52.00, '2020-03-10 20:04:58', '2020-03-10 20:21:07', 96, '新智电', '数码', NULL, '智能电表抽奖活动', '活动维持3天，每天抽1词', 'data:image/png;base64,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');

-- ----------------------------
-- Table structure for activity_user_info
-- ----------------------------
DROP TABLE IF EXISTS `activity_user_info`;
CREATE TABLE `activity_user_info`  (
  `info_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '表单ID：[1,2147483647]填表时的ID，用于查改表单',
  `state` smallint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '用户验证状态：[0,9]1待审核，2已认证，3未通过，4黑名单',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '手机号码：[0,11]',
  `liaison_phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '紧急联系人号码：[0,11]',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '参与人姓名：[0,16]',
  `idcard` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '身份证号：[0,32]',
  `liaison_name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '紧急联系人姓名：[0,16]',
  `uin_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户唯一标识：[0,64]用来识别用户',
  `uin_checker` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核人uin：[0,64]',
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在位置：[0,255]用户所在位置，同时用来接收快递，传省市区',
  `address` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细地址：[0,64]',
  `idcard_img_a` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '身份证正面照：传base64字符串',
  `idcard_img_b` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '身份证反面照：传base64字符串',
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '其他补充信息：',
  `img_prove` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '出院证明：',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参与者信息：用来记录参与的用户的个人信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of activity_user_info
-- ----------------------------
INSERT INTO `activity_user_info` VALUES (1, 2, '15817188815', '18928814799', '邱文X', '44142319910401XXXX', '邱志X', 'xxx', NULL, '广东 深圳 南山', '粤海街道汇景豪苑', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for activity_user_log
-- ----------------------------
DROP TABLE IF EXISTS `activity_user_log`;
CREATE TABLE `activity_user_log`  (
  `log_id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '参与者记录：[1,2147483647]',
  `state` smallint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '领取状态：[0,9]1待抽奖，2待派送，3已寄出，4已签收，5已领奖',
  `prize_1` smallint(6) UNSIGNED NOT NULL DEFAULT 0 COMMENT '一等奖：[0,32767]为奖品item_id',
  `prize_2` smallint(6) UNSIGNED NOT NULL DEFAULT 0 COMMENT '二等奖：[0,32767]为奖品item_id',
  `prize_3` smallint(6) UNSIGNED NOT NULL DEFAULT 0 COMMENT '三等奖：[0,32767]为奖品item_id',
  `prize_t` smallint(6) UNSIGNED NOT NULL DEFAULT 0 COMMENT '特等奖：[0,32767]为奖品item_id',
  `activity_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '活动ID：[1,2147483647]用来识别是那个活动',
  `time_update` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间：',
  `time_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间：',
  `uin_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户唯一标识：[0,64]',
  `uin_prize winners` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '颁奖者uin：[0,64]',
  `img_prove` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '活动证明：',
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '活动参与记录：用来记录参与活动的人和中奖情况' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of activity_user_log
-- ----------------------------
INSERT INTO `activity_user_log` VALUES (1, 1, 1, 0, 0, 0, 1, '2020-03-11 13:35:04', '2020-03-03 22:54:58', 'xxx', NULL, NULL);

-- ----------------------------
-- Table structure for bbs_config
-- ----------------------------
DROP TABLE IF EXISTS `bbs_config`;
CREATE TABLE `bbs_config`  (
  `config_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '配置ID：[1,2147483647]',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '变量名：[0,16]',
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'string' COMMENT '数据类型：[0,16]string文本型、number数字型、boolean布尔型',
  `title` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '变量标题：[0,16]可以用中文名',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '变量值：[0,255]',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '变量描述：[0,255]描述该变量的作用',
  `model` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '数据模型：json格式，用于单选、多选模式',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '社区配置：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bbs_config
-- ----------------------------

-- ----------------------------
-- Table structure for bbs_thread
-- ----------------------------
DROP TABLE IF EXISTS `bbs_thread`;
CREATE TABLE `bbs_thread`  (
  `thread_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主题id：[1,8388607]',
  `available` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否启用：[0,1]启用后前台才会显示该主题',
  `state` smallint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态：[1,5]1正常，2推荐，3认证，4官方，5违规',
  `type_id` smallint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '主题分类ID：[1,1000]用来搜索指定类型的主题',
  `channel_id` smallint(5) UNSIGNED NOT NULL DEFAULT 1 COMMENT '频道ID：[1,10000]该主题所属频道，仅该频道列表可以看到该主题',
  `display` smallint(5) UNSIGNED NOT NULL DEFAULT 100 COMMENT '排序：[0,10000]决定主题显示的顺序',
  `city_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '所属城市ID：[1,8388607]对于一些地方主题，可以通过该ID筛看',
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID：[1,8388607]编辑这篇主题到本站的用户ID',
  `hot` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '热度：[0,1000000000]访问这篇主题的人次',
  `praise` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '点赞次数：[0,1000000000]',
  `collect_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '采集规则ID：[1,1000000000]如果主题是通过采集的方式获得，那么具有采集ID',
  `time_create` datetime(0) NOT NULL DEFAULT '1997-01-01 00:00:00' COMMENT '创建时间：',
  `time_update` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间：',
  `title` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题：[0,125]用于主题和html的<title>标签中',
  `keywords` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关键词：[0,125]用于搜索引擎收录',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述：[0,255]用于主题提纲和搜索引擎收录',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '封面图：[0,255]用于显示于主题列表页，多个封面图用换行分隔',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '来源地址：[0,255]用于跳转到发布该主题的网站',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签：[0,255]用于标注主题所属相关内容，多个标签用空格隔开',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '正文：主题的主体内容',
  `collecter` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '收藏者：多个收藏者用”,“分隔',
  PRIMARY KEY (`thread_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '社区主题：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bbs_thread
-- ----------------------------

-- ----------------------------
-- Table structure for bbs_thread_channel
-- ----------------------------
DROP TABLE IF EXISTS `bbs_thread_channel`;
CREATE TABLE `bbs_thread_channel`  (
  `channel_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '频道ID：[1,10000]',
  `available` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否启用：[0,1]启用后才可以看到该频道',
  `hide` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否隐藏：[0,1]隐藏非管理员该频道无法查看. 0为不隐藏，1为隐藏',
  `can_comment` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否可评论：[0,1]不可评论则用户只能看，无法点评。0为不可评论，1为可评论',
  `display` smallint(4) UNSIGNED NOT NULL DEFAULT 100 COMMENT '显示顺序：[0,1000]决定频道显示的先后顺序',
  `father_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级ID：[1,10000]在频道列表操作时，当上级频道展开时，才显示该频道',
  `city_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '所属城市：[1,8388607]一些地方频道，可以通过该条判断是否可查看',
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'article' COMMENT '频道类型：[0,16]question问答、info资讯、news新闻、article主题、activity活动',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '频道名称：[2,16]',
  `template` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '风格模板：[0,64]频道和主题都使用的样式',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述：[0,255]描述该频道的作用',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '频道图标：[0,255]',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '外链地址：[0,255]如果该频道是跳转到其他网站的情况下，就在该URL上设置',
  PRIMARY KEY (`channel_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '主题板块：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bbs_thread_channel
-- ----------------------------

-- ----------------------------
-- Table structure for bbs_thread_comment
-- ----------------------------
DROP TABLE IF EXISTS `bbs_thread_comment`;
CREATE TABLE `bbs_thread_comment`  (
  `comment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '评论id：[1,2147483647]',
  `available` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否启用：[0,1]启用则显示该评论',
  `score` smallint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '评分：[0,5]最低1分、最多5分',
  `display` smallint(4) UNSIGNED NOT NULL DEFAULT 100 COMMENT '显示排序：[0,1000]决定显示的顺序',
  `thread_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 1 COMMENT '所属主题id：[1,8388607]',
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID：[1,8388607]编辑评论的用户ID',
  `tag` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签：[0,64]评论人给的标签，多个标签用空格隔开',
  `reply` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '评论回复：对评论人的评论做出的回复。通过form-url格式保存，多个人的回复用换行分隔',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '正文：评论内容',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '主题评论：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bbs_thread_comment
-- ----------------------------

-- ----------------------------
-- Table structure for bbs_thread_type
-- ----------------------------
DROP TABLE IF EXISTS `bbs_thread_type`;
CREATE TABLE `bbs_thread_type`  (
  `type_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主题分类ID：[1,30000]',
  `display` smallint(4) UNSIGNED NOT NULL DEFAULT 100 COMMENT '显示顺序：[0,1000]',
  `father_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级分类ID：[1,32767]',
  `channel_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '频道ID：[1,10000]',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类名称：[0,16]',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类图标：[0,255]',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类描述：[0,255]',
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '主题分类：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bbs_thread_type
-- ----------------------------

-- ----------------------------
-- Table structure for cms_article
-- ----------------------------
DROP TABLE IF EXISTS `cms_article`;
CREATE TABLE `cms_article`  (
  `article_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文章id：[1,8388607]',
  `available` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否启用：[0,1]启用后前台才会显示该文章',
  `state` smallint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态：[1,5]1正常，2推荐，3认证，4官方，5违规',
  `type_id` smallint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文章分类ID：[1,1000]用来搜索指定类型的文章',
  `display` smallint(5) UNSIGNED NOT NULL DEFAULT 100 COMMENT '排序：[0,10000]决定文章显示的顺序',
  `channel_id` smallint(5) UNSIGNED NOT NULL DEFAULT 1 COMMENT '频道ID：[1,10000]该文章所属频道，仅该频道列表可以看到该文章',
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID：[1,8388607]编辑这篇文章到本站的用户ID',
  `city_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '所属城市ID：[1,8388607]对于一些地方文章，可以通过该ID筛看',
  `hot` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '热度：[0,1000000000]访问这篇文章的人次',
  `praise` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '点赞次数：[0,1000000000]',
  `collect_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '采集规则ID：[1,1000000000]如果文章是通过采集的方式获得，那么具有采集ID',
  `time_create` datetime(0) NOT NULL DEFAULT '1997-01-01 00:00:00' COMMENT '创建时间：',
  `time_update` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间：',
  `author` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作者：[0,16]写出该文章的人',
  `title` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题：[0,125]用于文章和html的<title>标签中',
  `keywords` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关键词：[0,125]用于搜索引擎收录',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述：[0,255]用于文章提纲和搜索引擎收录',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '封面图：[0,255]用于显示于文章列表页，多个封面图用换行分隔',
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '来源：[0,255]文章的出处',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '来源地址：[0,255]用于跳转到发布该文章的网站',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签：[0,255]用于标注文章所属相关内容，多个标签用空格隔开',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '正文：文章的主体内容',
  `collecter` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '收藏者：多个收藏者用”,“分隔',
  PRIMARY KEY (`article_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章：用于内容管理系统的文章' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_article
-- ----------------------------
INSERT INTO `cms_article` VALUES (1, 1, 1, 0, 100, 1, 0, 0, 0, 0, 0, '1997-01-01 00:00:00', '2020-03-21 11:26:59', NULL, '张三', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_article` VALUES (2, 1, 1, 0, 100, 1, 0, 0, 0, 0, 0, '1997-01-01 00:00:00', '2020-03-21 11:27:06', NULL, '李四', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_article` VALUES (3, 1, 1, 0, 100, 1, 0, 0, 0, 0, 0, '1997-01-01 00:00:00', '2020-03-21 11:27:11', NULL, '王五', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_article` VALUES (4, 1, 1, 0, 100, 1, 0, 0, 0, 0, 0, '1997-01-01 00:00:00', '2020-03-21 11:27:15', NULL, '十五', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for cms_article_channel
-- ----------------------------
DROP TABLE IF EXISTS `cms_article_channel`;
CREATE TABLE `cms_article_channel`  (
  `channel_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '频道ID：[1,10000]',
  `available` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否启用：[0,1]启用后才可以看到该频道',
  `hide` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否隐藏：[0,1]隐藏非管理员该频道无法查看. 0为不隐藏，1为隐藏',
  `can_comment` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否可评论：[0,1]不可评论则用户只能看，无法点评。0为不可评论，1为可评论',
  `display` smallint(4) UNSIGNED NOT NULL DEFAULT 100 COMMENT '显示顺序：[0,1000]决定频道显示的先后顺序',
  `father_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级ID：[1,10000]在频道列表操作时，当上级频道展开时，才显示该频道',
  `city_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '所属城市：[1,8388607]一些地方频道，可以通过该条判断是否可查看',
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'article' COMMENT '频道类型：[0,16]question问答、info资讯、news新闻、article文章、activity活动',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '频道名称：[2,16]',
  `template` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '风格模板：[0,64]频道和文章都使用的样式',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述：[0,255]描述该频道的作用',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '频道图标：[0,255]',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '外链地址：[0,255]如果该频道是跳转到其他网站的情况下，就在该URL上设置',
  PRIMARY KEY (`channel_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章频道：用于汇总浏览文章，在不同频道下展示不同文章。' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_article_channel
-- ----------------------------

-- ----------------------------
-- Table structure for cms_article_comment
-- ----------------------------
DROP TABLE IF EXISTS `cms_article_comment`;
CREATE TABLE `cms_article_comment`  (
  `comment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '评论id：[1,2147483647]',
  `available` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否启用：[0,1]启用则显示该评论',
  `score` smallint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '评分：[0,5]最低1分、最多5分',
  `display` smallint(4) UNSIGNED NOT NULL DEFAULT 100 COMMENT '显示排序：[0,1000]决定显示的顺序',
  `article_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 1 COMMENT '所属文章id：[1,8388607]',
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID：[1,8388607]编辑评论的用户ID',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '留言者姓名：[2,16]用于实名回复',
  `tag` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签：[0,64]评论人给的标签，多个标签用空格隔开',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '正文：评论内容',
  `reply` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '评论回复：对评论人的评论做出的回复。通过form-url格式保存，多个人的回复用换行分隔',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章评论：用于记录读者对某文章的评论' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_article_comment
-- ----------------------------

-- ----------------------------
-- Table structure for cms_article_section
-- ----------------------------
DROP TABLE IF EXISTS `cms_article_section`;
CREATE TABLE `cms_article_section`  (
  `content_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '内容模块ID：[1,2147483647]',
  `article_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '对应文章ID：[1,2147483647]',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '章节标题：[0,255]',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '章节内容：',
  `img` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '章节图片：',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '章节标签：[0,255]',
  PRIMARY KEY (`content_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章正文章节：文章的正文是单独一块保存的，一个个章节保存' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_article_section
-- ----------------------------

-- ----------------------------
-- Table structure for cms_article_type
-- ----------------------------
DROP TABLE IF EXISTS `cms_article_type`;
CREATE TABLE `cms_article_type`  (
  `type_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文章分类ID：[1,30000]',
  `display` smallint(4) UNSIGNED NOT NULL DEFAULT 100 COMMENT '显示顺序：[0,1000]',
  `channel_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '频道ID：[1,10000]',
  `father_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级分类ID：[1,32767]',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类名称：[0,16]',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类描述：[0,255]',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类图标：[0,255]',
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章分类：将文章归类，可选看不同类型的文章' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_article_type
-- ----------------------------

-- ----------------------------
-- Table structure for coin_analyse
-- ----------------------------
DROP TABLE IF EXISTS `coin_analyse`;
CREATE TABLE `coin_analyse`  (
  `analyse_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分析ID：[1,2147483647]用来查询和修改结果',
  `weight` smallint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '权重得分：[-99,99]',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间：',
  `datetime` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '当日时间：指数字货币当天',
  `policy_buy` smallint(2) NOT NULL DEFAULT 0 COMMENT '决策买入：分值越高，别是越应该买入',
  `policy_hold` smallint(2) NOT NULL DEFAULT 0 COMMENT '决策留守：分值越高，别是越应该留守',
  `policy_sell` smallint(2) NOT NULL DEFAULT 0 COMMENT '决策卖出：分值越高，别是越应该卖出',
  `presage_today` smallint(2) NOT NULL DEFAULT 0 COMMENT '预示今日：[-99,99]今日涨跌评分，负分看跌，正分看涨',
  `presage_recently` smallint(2) NOT NULL DEFAULT 0 COMMENT '预示近日：[-99,99]近3日涨跌评分，负分看跌，正分看涨',
  `presage_next` smallint(2) NOT NULL DEFAULT 0 COMMENT '预示后市：[-99,99]之后涨跌走势评分，负分看跌，正分看涨',
  `code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数字货币代码：[0,16]',
  `tip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分析提示：[0,255]技术分析名称',
  `action` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '行动方式：[0,16]买、卖、留',
  `predict` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预言：[0,255]告知近日和将来走势',
  PRIMARY KEY (`analyse_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数字货币分析：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of coin_analyse
-- ----------------------------

-- ----------------------------
-- Table structure for coin_formula
-- ----------------------------
DROP TABLE IF EXISTS `coin_formula`;
CREATE TABLE `coin_formula`  (
  `formula_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '公式ID：[1,2147483647]',
  `weight` smallint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '权重：[0,99]权重决定买卖和看涨看跌',
  `policy` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '方针：[0,4]只想操作方式',
  `tense` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分析时态：[0,8]同时过去还是今时、今日数据分析。now今时、today今日、past昔日',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '公式名称：[0,16]技术分析名称',
  `filter` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '过滤：[0,16]当出现该技术分析时结果时，其他某个分析结果将无效，所以将其过滤调',
  `presage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预示：[0,255]今日、近日、之后走势的看涨、看跌',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公式简介：[0,255]介绍该公式是什么技术分析的',
  `express` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '数字货币公式：用于分析走势，返回逻辑值',
  PRIMARY KEY (`formula_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数字货币公式：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of coin_formula
-- ----------------------------

-- ----------------------------
-- Table structure for coin_info
-- ----------------------------
DROP TABLE IF EXISTS `coin_info`;
CREATE TABLE `coin_info`  (
  `coin_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '数字货币ID：[1,2147483647]',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数字货币名称：[0,16]',
  `code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '数字货币代码：[0,12]',
  `company` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公司名称：[0,32]',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数字货币简介：[0,255]',
  `bonus` double(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '分红频率：1年1次为1.0；2年一次为0.5；3年一次为0.33；不分红为0',
  `issue_price` double(6, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '：',
  `pe` double(6, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '市盈率：',
  `pb` double(6, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '市净率：',
  `profit` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '公司利润：如果为0或负数，表示公司不盈利',
  `num` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '发行量：[0,2147483647]单位(万股)',
  `time_to_market` date NOT NULL DEFAULT '1970-01-01' COMMENT '上市时间：',
  PRIMARY KEY (`coin_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数字货币信息：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of coin_info
-- ----------------------------

-- ----------------------------
-- Table structure for coin_market
-- ----------------------------
DROP TABLE IF EXISTS `coin_market`;
CREATE TABLE `coin_market`  (
  `market_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '行情ID：[1,2147483647]',
  `code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '数字货币代码：[0,16]',
  `HIGH` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最高价：',
  `LOW` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最低价：',
  `OPEN` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '开盘价：',
  `CLOSE` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '收盘价：',
  `VOL` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '成交量：[0,2147483647]',
  `CHG` double(5, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '涨跌幅：',
  `TOTAL` double(12, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '总成交额：',
  `DATETIME` date NOT NULL DEFAULT '1970-01-01' COMMENT '交易日期：',
  PRIMARY KEY (`market_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数字货币行情：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of coin_market
-- ----------------------------

-- ----------------------------
-- Table structure for coin_subscribe
-- ----------------------------
DROP TABLE IF EXISTS `coin_subscribe`;
CREATE TABLE `coin_subscribe`  (
  `subscribe_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '订阅ID：[1,8388607]',
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '订阅用户ID：[1,8388607]',
  `time1` time(0) NOT NULL DEFAULT '10:00:00' COMMENT '通知时段1：默认为开盘后半小时，一般通知什么数字货币要卖',
  `time2` time(0) NOT NULL DEFAULT '13:00:00' COMMENT '通知时段2：默认为下午开盘时间，一般通知什么数字货币要卖',
  `time3` time(0) NOT NULL DEFAULT '14:30:00' COMMENT '通知时段3：默认为收盘前半小时。一般通知什么数字货币要买',
  `way` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'wechat' COMMENT '订阅方式：[0,12]phone手机短信、email邮箱、wechat微信公众号、app应用端',
  `stocks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订阅的数字货币：[0,255]',
  PRIMARY KEY (`subscribe_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数字货币订阅：用于记录用户订阅的数字货币，便于定时通知技术分析和走势' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of coin_subscribe
-- ----------------------------

-- ----------------------------
-- Table structure for mall_config
-- ----------------------------
DROP TABLE IF EXISTS `mall_config`;
CREATE TABLE `mall_config`  (
  `config_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '配置ID：[1,2147483647]',
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'string' COMMENT '数据类型：[0,16]string文本型、number数字型、boolean布尔型',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '变量名：[0,16]',
  `title` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '变量标题：[0,16]可以用中文名',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '变量描述：[0,255]描述该变量的作用',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '变量值：[0,255]',
  `model` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '数据模型：json格式，用于单选、多选模式',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商城配置：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mall_config
-- ----------------------------
INSERT INTO `mall_config` VALUES (1, 'string', 'asd', '阿斯顿', '描述', '123', '{}');

-- ----------------------------
-- Table structure for mall_product
-- ----------------------------
DROP TABLE IF EXISTS `mall_product`;
CREATE TABLE `mall_product`  (
  `product_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '产品id：[1,8388607]',
  `available` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否启用：[0,1]启用后前台才会显示该产品',
  `state` smallint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态：[0,5]1出售中，2预售中，3已下架，4已删除，5已违规',
  `type_id` smallint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '产品分类ID：[1,1000]用来搜索指定类型的产品',
  `display` smallint(5) UNSIGNED NOT NULL DEFAULT 100 COMMENT '排序：[0,10000]决定产品显示的顺序',
  `channel_id` smallint(5) UNSIGNED NOT NULL DEFAULT 1 COMMENT '频道ID：[1,10000]该产品所属频道，仅该频道列表可以看到该产品',
  `shop_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '店铺ID：[1,8388607]该商品所属的店铺',
  `city_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '所属城市ID：[1,8388607]对于一些地方产品，可以通过该ID筛看',
  `hot` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '热度：[0,1000000000]访问这篇产品的人次',
  `praise` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '点赞次数：[0,1000000000]',
  `price` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '卖价：[1]',
  `price_old` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '原价：[1]',
  `time_create` datetime(0) NOT NULL DEFAULT '1997-01-01 00:00:00' COMMENT '创建时间：',
  `time_update` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间：',
  `title` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题：[0,125]用于产品和html的<title>标签中',
  `keywords` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关键词：[0,125]用于搜索引擎收录',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述：[0,255]用于产品提纲和搜索引擎收录',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '封面图：[0,255]用于显示于产品列表页，多个封面图用换行分隔',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签：[0,255]用于标注产品所属相关内容，多个标签用空格隔开',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '正文：产品的主体内容',
  `collecter` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '收藏者：多个收藏者用”,“分隔',
  `brand` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '品牌：[0,18]商品的品牌',
  PRIMARY KEY (`product_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品信息：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mall_product
-- ----------------------------
INSERT INTO `mall_product` VALUES (1, 1, 1, 0, 100, 1, 0, 0, 0, 0, 0.00, 0.00, '1997-01-01 00:00:00', '2020-04-01 23:27:51', ' 电脑', '彩虹 蓝冠 胜利剑', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mall_product` VALUES (2, 1, 1, 0, 100, 1, 0, 0, 0, 0, 0.00, 0.00, '1997-01-01 00:00:00', '2020-04-01 23:28:12', 'xxx手机', '光辉 蓝冠 水晶鞋', NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for mall_product_channel
-- ----------------------------
DROP TABLE IF EXISTS `mall_product_channel`;
CREATE TABLE `mall_product_channel`  (
  `channel_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '频道ID：[1,10000]',
  `available` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否启用：[0,1]启用后才可以看到该频道',
  `hide` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否隐藏：[0,1]隐藏非管理员该频道无法查看. 0为不隐藏，1为隐藏',
  `can_comment` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否可评论：[0,1]不可评论则用户只能看，无法点评。0为不可评论，1为可评论',
  `display` mediumint(4) UNSIGNED NOT NULL DEFAULT 100 COMMENT '显示顺序：[0,1000]决定频道显示的先后顺序',
  `father_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级ID：[1,10000]在频道列表操作时，当上级频道展开时，才显示该频道',
  `city_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '所属城市：[1,8388607]一些地方频道，可以通过该条判断是否可查看',
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'product' COMMENT '频道类型：[0,16]question问答、info资讯、news新闻、product产品、activity活动',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '频道名称：[2,16]',
  `template` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '风格模板：[0,64]频道和产品都使用的样式',
  `icon` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '频道图标：[0,255]',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '外链地址：[0,255]如果该频道是跳转到其他网站的情况下，就在该URL上设置',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述：[0,255]描述该频道的作用',
  PRIMARY KEY (`channel_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品专区：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mall_product_channel
-- ----------------------------
INSERT INTO `mall_product_channel` VALUES (1, 1, 1, 1, 1, 0, 650200, 'product', 'afwdfaw', NULL, NULL, NULL, NULL);
INSERT INTO `mall_product_channel` VALUES (2, 1, 1, 1, 1, 0, 610900, 'info', 'asf', NULL, 'data:image/png;base64,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', NULL, 'safawfawf');

-- ----------------------------
-- Table structure for mall_product_comment
-- ----------------------------
DROP TABLE IF EXISTS `mall_product_comment`;
CREATE TABLE `mall_product_comment`  (
  `comment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '评论id：[1,2147483647]',
  `available` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否启用：[0,1]启用则显示该评论',
  `score` smallint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '评分：[0,5]最低1分、最多5分',
  `display` smallint(3) UNSIGNED NOT NULL DEFAULT 100 COMMENT '显示排序：[0,1000]决定显示的顺序',
  `product_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 1 COMMENT '所属产品id：[1,8388607]',
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID：[1,8388607]编辑评论的用户ID',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '留言者姓名：[2,16]用于实名回复',
  `tag` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签：[0,64]评论人给的标签，多个标签用空格隔开',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '正文：评论内容',
  `reply` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '评论回复：对评论人的评论做出的回复。通过form-url格式保存，多个人的回复用换行分隔',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品评论：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mall_product_comment
-- ----------------------------
INSERT INTO `mall_product_comment` VALUES (1, 1, 3, 100, 1, 4, ' 名称', '白银', '正文', '管理员牛逼');
INSERT INTO `mall_product_comment` VALUES (2, 1, 5, 100, 2, 2, ' 名称', '黄金', '撒到活佛阿旺光脑vhi哦主从i啊哈佛i啊hi哦奥vi闹i', '超帅作者');
INSERT INTO `mall_product_comment` VALUES (3, 1, 5, 6, 1, 5, 'hgchgxcgh', ' gh cghchgcvg', 'bhjvhjvhjh', 'vgvgcvhfch');

-- ----------------------------
-- Table structure for mall_product_property
-- ----------------------------
DROP TABLE IF EXISTS `mall_product_property`;
CREATE TABLE `mall_product_property`  (
  `property_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '产品分类ID：[1,30000]',
  `display` smallint(4) UNSIGNED NOT NULL DEFAULT 100 COMMENT '显示顺序：[0,1000]',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类名称：[0,16]',
  `icon` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '分类图标：[0,255]',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类描述：[0,255]',
  PRIMARY KEY (`property_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品属性：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mall_product_property
-- ----------------------------
INSERT INTO `mall_product_property` VALUES (1, 100, ' 名称', 'data:image/png;base64,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', '描述');
INSERT INTO `mall_product_property` VALUES (2, 3, 'sad', 'data:image/png;base64,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', 'awfwa');
INSERT INTO `mall_product_property` VALUES (3, 6, 'chg ch', 'data:image/png;base64,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', NULL);

-- ----------------------------
-- Table structure for mall_product_type
-- ----------------------------
DROP TABLE IF EXISTS `mall_product_type`;
CREATE TABLE `mall_product_type`  (
  `type_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '产品分类ID：[1,30000]',
  `display` smallint(4) UNSIGNED NOT NULL DEFAULT 100 COMMENT '显示顺序：[0,1000]',
  `channel_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '频道ID：[1,10000]',
  `father_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级分类ID：[1,32767]',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类名称：[0,16]',
  `icon` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '分类图标：[0,255]',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类描述：[0,255]',
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品分类：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mall_product_type
-- ----------------------------
INSERT INTO `mall_product_type` VALUES (1, 100, 0, 0, '数码产品', NULL, '电子器材分类');
INSERT INTO `mall_product_type` VALUES (2, 123, 2, 1, '手机', 'data:image/png;base64,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', '手机的分类如三星炸药包，华为游戏手机');
INSERT INTO `mall_product_type` VALUES (3, 11, 1, 1, 'afwfaw', 'data:image/png;base64,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', 'sfawfw');
INSERT INTO `mall_product_type` VALUES (4, 5, 1, 2, '124164', 'data:image/png;base64,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', 'fytdfgsggr');

-- ----------------------------
-- Table structure for mall_shop
-- ----------------------------
DROP TABLE IF EXISTS `mall_shop`;
CREATE TABLE `mall_shop`  (
  `shop_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '店铺id：[1,8388607]',
  `available` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否启用：[0,1]启用后前台才会显示该店铺',
  `state` smallint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态：[0,5]1营业中，2已歇业，3已关店，4已删除，5已违规',
  `type_id` smallint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '店铺分类ID：[1,1000]用来搜索指定类型的店铺',
  `display` smallint(4) UNSIGNED NOT NULL DEFAULT 100 COMMENT '排序：[0,1000]决定店铺显示的顺序',
  `channel_id` smallint(5) UNSIGNED NOT NULL DEFAULT 1 COMMENT '频道ID：[1,10000]该店铺所属频道，仅该频道列表可以看到该店铺',
  `city_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '所属城市ID：[1,8388607]对于一些地方店铺，可以通过该ID筛看',
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '店铺所属人ID：[1,8388607]即该店铺是属于哪个用户的',
  `hot` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '热度：[0,1000000000]访问这篇店铺的人次',
  `praise` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '点赞次数：[0,1000000000]',
  `time_create` datetime(0) NOT NULL DEFAULT '1997-01-01 00:00:00' COMMENT '创建时间：',
  `time_update` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间：',
  `name` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题：[0,125]用于店铺和html的<title>标签中',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述：[0,255]用于店铺提纲和搜索引擎收录',
  `keywords` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关键词：[0,64]用于搜索引擎收录',
  `img` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '封面图：[0,255]用于显示于店铺列表页，多个封面图用换行分隔',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签：[0,255]用于标注店铺所属相关内容，多个标签用空格隔开',
  `collecter` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '收藏者：多个收藏者用”,“分隔',
  PRIMARY KEY (`shop_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '店铺信息：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mall_shop
-- ----------------------------
INSERT INTO `mall_shop` VALUES (1, 1, 1, 0, 9, 2, 650200, 0, 0, 0, '1997-01-01 00:00:00', '2020-04-12 14:32:29', '塞尔达专卖店', NULL, '塞尔达, 专卖店', 'data:image/png;base64,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', NULL, '塞尔达, 专卖店');
INSERT INTO `mall_shop` VALUES (2, 1, 3, 0, 5, 1, 654200, 0, 5, 5, '1997-01-01 00:00:00', '2020-04-13 22:13:25', 'agawgag', NULL, 'agawgaw', 'data:image/png;base64,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', 'sagag', 'asgag');

-- ----------------------------
-- Table structure for mall_shop_channel
-- ----------------------------
DROP TABLE IF EXISTS `mall_shop_channel`;
CREATE TABLE `mall_shop_channel`  (
  `channel_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '频道ID：[1,10000]',
  `available` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否启用：[0,1]启用后才可以看到该频道',
  `hide` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否隐藏：[0,1]隐藏非管理员该频道无法查看. 0为不隐藏，1为隐藏',
  `can_comment` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否可评论：[0,1]不可评论则用户只能看，无法点评。0为不可评论，1为可评论',
  `display` mediumint(4) UNSIGNED NOT NULL DEFAULT 100 COMMENT '显示顺序：[0,1000]决定频道显示的先后顺序',
  `father_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级ID：[1,10000]在频道列表操作时，当上级频道展开时，才显示该频道',
  `city_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '所属城市：[1,8388607]一些地方频道，可以通过该条判断是否可查看',
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'shop' COMMENT '频道类型：[0,16]question问答、info资讯、news新闻、shop店铺、activity活动',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '频道名称：[2,16]',
  `template` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '风格模板：[0,64]频道和店铺都使用的样式',
  `icon` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '频道图标：[0,255]',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '外链地址：[0,255]如果该频道是跳转到其他网站的情况下，就在该URL上设置',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述：[0,255]描述该频道的作用',
  PRIMARY KEY (`channel_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '店铺专区：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mall_shop_channel
-- ----------------------------
INSERT INTO `mall_shop_channel` VALUES (1, 1, 0, 1, 100, 0, 0, 'shop', '名称', NULL, 'data:image/png;base64,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', NULL, NULL);
INSERT INTO `mall_shop_channel` VALUES (2, 1, 1, 1, 15, 1, 652100, 'shop', '赛博坦', '是发给我给', 'data:image/png;base64,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', 'faw', NULL);

-- ----------------------------
-- Table structure for mall_shop_comment
-- ----------------------------
DROP TABLE IF EXISTS `mall_shop_comment`;
CREATE TABLE `mall_shop_comment`  (
  `comment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '评论id：[1,2147483647]',
  `available` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否启用：[0,1]启用则显示该评论',
  `score` smallint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '评分：[0,5]最低1分、最多5分',
  `display` smallint(4) UNSIGNED NOT NULL DEFAULT 100 COMMENT '显示排序：[0,1000]决定显示的顺序',
  `shop_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 1 COMMENT '所属店铺id：[1,8388607]',
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID：[1,8388607]编辑评论的用户ID',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '留言者姓名：[2,16]用于实名回复',
  `tag` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签：[0,64]评论人给的标签，多个标签用空格隔开',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '正文：评论内容',
  `reply` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '评论回复：对评论人的评论做出的回复。通过form-url格式保存，多个人的回复用换行分隔',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '店铺评论：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mall_shop_comment
-- ----------------------------
INSERT INTO `mall_shop_comment` VALUES (1, 1, 5, 4, 1, 5, 'xscca', 'afwfa', 'fawfawf', NULL);

-- ----------------------------
-- Table structure for mall_shop_type
-- ----------------------------
DROP TABLE IF EXISTS `mall_shop_type`;
CREATE TABLE `mall_shop_type`  (
  `type_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '店铺分类ID：[1,30000]',
  `display` smallint(4) UNSIGNED NOT NULL DEFAULT 100 COMMENT '显示顺序：[0,1000]',
  `channel_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '频道ID：[1,10000]',
  `father_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级分类ID：[1,32767]',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类名称：[0,16]',
  `icon` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '分类图标：[0,255]',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类描述：[0,255]',
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '店铺分类：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mall_shop_type
-- ----------------------------
INSERT INTO `mall_shop_type` VALUES (1, 5, 1, 0, '塞尔达', 'data:image/png;base64,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', 'sadfawf');
INSERT INTO `mall_shop_type` VALUES (2, 5, 2, 1, '林克', 'data:image/png;base64,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', NULL);

-- ----------------------------
-- Table structure for pay_account
-- ----------------------------
DROP TABLE IF EXISTS `pay_account`;
CREATE TABLE `pay_account`  (
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID：[1,8388607]',
  `state` smallint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态：[0,10]1为正常，2为异常，3为冻结，4为注销',
  `bank` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '网银账户：[0,32]',
  `bank_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '网银名称：[0,255]含支行',
  `bank_state` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '微信认证：[0,1]0未认证，1已认证',
  `wechat` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收款微信账户：[0,32]',
  `wechat_state` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '微信认证：[0,1]0未认证，1已认证',
  `alipay` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收款支付宝账户：[0,32]',
  `alipay_state` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '微信认证：[0,1]0未认证，1已认证',
  `btc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '比特币地址：[0,255]',
  `btc_state` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '比特币地址认证：[0,1]0未认证，1已认证',
  `eth` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '以太币地址：[0,255]',
  `eth_state` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '以太币地址认证：[0,1]0未认证，1已认证',
  `eos` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '柚子币地址：[0,255]',
  `eos_state` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '柚子币地址认证：[0,1]0未认证，1已认证',
  `mm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '美眉币地址：[0,255]',
  `mm_state` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '美眉币地址认证：[0,1]0未认证，1已认证',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '支付账户：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pay_account
-- ----------------------------

-- ----------------------------
-- Table structure for pay_account_amount
-- ----------------------------
DROP TABLE IF EXISTS `pay_account_amount`;
CREATE TABLE `pay_account_amount`  (
  `seller_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商户ID：[1,8388607]用于对应商户',
  `usd` decimal(16, 2) NOT NULL COMMENT '美元余额：',
  `cny` decimal(16, 2) NOT NULL COMMENT '人民币余额：',
  `mm` decimal(16, 4) NOT NULL COMMENT '美眉币余额：',
  `btc` decimal(16, 8) NOT NULL COMMENT '比特币余额：',
  `eth` decimal(16, 8) NOT NULL COMMENT '以太币余额：',
  `eos` decimal(16, 8) NOT NULL COMMENT '柚子币余额：',
  PRIMARY KEY (`seller_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '账户余额：' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of pay_account_amount
-- ----------------------------

-- ----------------------------
-- Table structure for pay_account_discount
-- ----------------------------
DROP TABLE IF EXISTS `pay_account_discount`;
CREATE TABLE `pay_account_discount`  (
  `discount_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '提现申请ID：[1,2147483647]',
  `state` smallint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '提现状态：[0,10]1申请中，2转帐中，3已完成，4已拒绝',
  `to_user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '收款人：[1,8388607]如果是商户收款，可选填',
  `seller_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商户ID：[1,8388607]商户收款的ID',
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '审批人：[1,8388607]转账申请处理负责人，即由谁放款的',
  `amount` decimal(17, 8) NOT NULL COMMENT '提现金额：',
  `fee` decimal(16, 8) NOT NULL COMMENT '手续费：',
  `time_create` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '创建时间：',
  `pay_time` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '转账支付时间：',
  `time_end` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '资金到账时间：',
  `time_update` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后编辑时间：用于判断提现申请是否异常',
  `platform` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '应用平台：[0,12]pc电脑版网站、moblie移动版网站、wechat微信公众号、app手机应用',
  `way` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收款方式：[0,12]third第三方支付、bank网银、digiccy数字货币',
  `institution` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '转账机构：[0,16]第三方填支付宝、微信，银行填银行名称例如建设银行，数字货币填数字货币名称，例如比特币',
  `ip` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发起提现时的IP：[0,32]',
  `from_user` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '付款账户：[0,128]',
  `to_user` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收款账户：[0,128]',
  `cause` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '拒绝原因：[0,255]告知商户为什么拒绝本次提现',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商户备注：[0,255]提现完成后的商户备注信息，便于商户查询',
  PRIMARY KEY (`discount_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '账户提现：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pay_account_discount
-- ----------------------------

-- ----------------------------
-- Table structure for pay_config
-- ----------------------------
DROP TABLE IF EXISTS `pay_config`;
CREATE TABLE `pay_config`  (
  `config_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '配置ID：[1,2147483647]',
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'string' COMMENT '数据类型：[0,16]string文本型、number数字型、boolean布尔型',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '变量名：[0,16]',
  `title` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '变量标题：[0,16]可以用中文名',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '变量描述：[0,255]描述该变量的作用',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '变量值：[0,255]',
  `model` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '数据模型：json格式，用于单选、多选模式',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '支付配置：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pay_config
-- ----------------------------

-- ----------------------------
-- Table structure for pay_seller
-- ----------------------------
DROP TABLE IF EXISTS `pay_seller`;
CREATE TABLE `pay_seller`  (
  `seller_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商户ID：[1,8388607]',
  `institution_state` smallint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '认证状态：[0,10]1为未认证，2为认证中，3为已认证，4为认证失败',
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商户持有人：[1,8388607]',
  `province_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '省份ID：[1,2147483647]用户所在地的省份',
  `city_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '所在城市ID：[1,2147483647]',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商户名称：[0,16]',
  `institution` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册企业名：[0,64]',
  `institution_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织机构码：[0,64]',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细地址：[0,255]商户办公地的详细地址',
  `business` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经营范围：[0,255]',
  `institution_img` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '营业执照图片：',
  PRIMARY KEY (`seller_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商户信息：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pay_seller
-- ----------------------------

-- ----------------------------
-- Table structure for pay_trade
-- ----------------------------
DROP TABLE IF EXISTS `pay_trade`;
CREATE TABLE `pay_trade`  (
  `trade_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '交易序号：[1,2147483647]',
  `state` smallint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '付款状态：[0,10]1待付款，2待确认，3已完成，4已取消',
  `from_user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '付款人：[1,8388607]',
  `to_user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '收款人：[1,8388607]如果是商户收款，可选填',
  `seller_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商户ID：[1,8388607]商户收款的ID',
  `total` decimal(16, 8) NOT NULL COMMENT '付款总计金额：',
  `amount` decimal(16, 8) NOT NULL COMMENT '实际付款金额：',
  `fee` decimal(16, 8) NOT NULL COMMENT '手续费：',
  `pay_time` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '转账支付时间：',
  `platform` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '应用平台：[0,12]pc电脑版网站、moblie移动版网站、wechat微信公众号、app手机应用',
  `way` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '付款方式：[0,12]third第三方支付、bank网银、digiccy数字货币',
  `app` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '付款应用：[0,16]cms内容管理系统、mall商城、bbs论坛，可自定义',
  `institution` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '转账机构：[0,16]第三方填支付宝、微信，银行填银行名称例如建设银行，数字货币填数字货币名称，例如比特币',
  `title` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '付款标题：[0,16]',
  `transaction_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易ID：[0,32]类似合同编号，可用来查询该笔交易明细',
  `ip` varchar(67) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '转账时的用户IP：[0,67]',
  `from_user` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '付款账户：[0,128]',
  `to_user` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收款账户：[0,128]',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '付款描述：[0,255]告知用户付款的原因',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '付款人备注：[0,255]付款完成后的用户备注信息，便于用户查询',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '付款内容：根据应用定格式，一般为json格式',
  `create_time` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '订单创建时间：',
  `end_time` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '付款到账时间：',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后编辑时间：用于判断订单是否异常',
  PRIMARY KEY (`trade_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '交易信息：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pay_trade
-- ----------------------------

-- ----------------------------
-- Table structure for query_article
-- ----------------------------
DROP TABLE IF EXISTS `query_article`;
CREATE TABLE `query_article`  (
  `article_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文章ID：[1,2147483647]用于查看文章详情时显示相关评论',
  `result_id` smallint(6) UNSIGNED NOT NULL DEFAULT 0 COMMENT '查询结果ID：[1,32767]',
  `title` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '文章标题：[0,125]',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章描述：[0,255]',
  `keywords` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关键词：[0,125]',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章链接：[0,255]',
  `html` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '文章页面代码：',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间：',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间：',
  PRIMARY KEY (`article_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '查询文章：保存查询到的文章' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of query_article
-- ----------------------------

-- ----------------------------
-- Table structure for query_article_appraise
-- ----------------------------
DROP TABLE IF EXISTS `query_article_appraise`;
CREATE TABLE `query_article_appraise`  (
  `appraise_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '评价ID：[1,2147483647]',
  `task_id` smallint(6) UNSIGNED NOT NULL DEFAULT 0 COMMENT '任务分组ID：[1,32767]用于对应批测任务查询统计',
  `article_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文章ID：[1,2147483647]用于查看文章详情时显示相关评论',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '测评人ID：[1,2147483647]用于识别是哪个用户测评的',
  `score` smallint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '评价得分：[0,9]-1差劲；0一般；2评良；3优秀；4完美',
  `important` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '强调：[0,1]表示测评者觉得该文章需重视，表示该文可能比较有用',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间：',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间：',
  PRIMARY KEY (`appraise_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '查询文章评价：保存对单条文章的测评' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of query_article_appraise
-- ----------------------------

-- ----------------------------
-- Table structure for query_result
-- ----------------------------
DROP TABLE IF EXISTS `query_result`;
CREATE TABLE `query_result`  (
  `result_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '查询结果ID：[1,2147483647]',
  `task_id` smallint(6) UNSIGNED NOT NULL DEFAULT 0 COMMENT '查询任务ID：[1,32767]用于批测判断',
  `time` time(0) NOT NULL DEFAULT '00:00:00' COMMENT '查询时间点：是什么时候查询的',
  `engine` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '搜索引擎：[0,8]腾讯医典、百度、搜过、360',
  `city` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '查询城市：[0,16]用于记录查询时的城市',
  `query` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '查询词条：[0,125]用于记录是通过什么内容查询的',
  `ip` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '查询IP：[0,32]用于记录当前查询所在的IP地址',
  `html` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '查询结果代码：为搜索结果列表',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间：',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间：',
  PRIMARY KEY (`result_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '查询结果：保存查询结果、用于批测做准备' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of query_result
-- ----------------------------

-- ----------------------------
-- Table structure for query_result_compare
-- ----------------------------
DROP TABLE IF EXISTS `query_result_compare`;
CREATE TABLE `query_result_compare`  (
  `compare_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '对比ID：[1,2147483647]用于查询判断用户对比测评结果',
  `task_id` smallint(6) UNSIGNED NOT NULL DEFAULT 0 COMMENT '任务ID：[1,32767]用于对应批测任务查询统计',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '测评人ID：[1,2147483647]用于识别是哪个用户测评的',
  `result_id_left` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '对比结果1ID：[1,2147483647]用于识别谁和谁对比',
  `result_id_right` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '对比结果2ID：[1,2147483647]用于识别谁和谁对比',
  `score` smallint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '评价得分：[0,9]-1差劲；0一般；2评良；3优秀；4完美',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间：',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间：',
  PRIMARY KEY (`compare_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '查询结果对比：保存查询词条对比测评数据' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of query_result_compare
-- ----------------------------

-- ----------------------------
-- Table structure for query_task
-- ----------------------------
DROP TABLE IF EXISTS `query_task`;
CREATE TABLE `query_task`  (
  `task_id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '查询任务ID：[1,32767]',
  `state` smallint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态：[0,9]1待抓取、2抓取中、3待测评、4已关闭',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建者ID：[1,2147483647]',
  `people_num` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '参与批测人数：[0,2147483647]',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分组名称：[0,16]',
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注：',
  `query` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '查询词条集合：',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间：',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间：',
  PRIMARY KEY (`task_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '查询任务：关联多个词条，用于批测' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of query_task
-- ----------------------------

-- ----------------------------
-- Table structure for stock_analyse
-- ----------------------------
DROP TABLE IF EXISTS `stock_analyse`;
CREATE TABLE `stock_analyse`  (
  `analyse_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分析ID：[1,2147483647]用来查询和修改结果',
  `weight` smallint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '权重得分：[-99,99]',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间：',
  `datetime` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '当日时间：指股票当天',
  `policy_buy` smallint(2) NOT NULL DEFAULT 0 COMMENT '决策买入：分值越高，别是越应该买入',
  `policy_hold` smallint(2) NOT NULL DEFAULT 0 COMMENT '决策留守：分值越高，别是越应该留守',
  `policy_sell` smallint(2) NOT NULL DEFAULT 0 COMMENT '决策卖出：分值越高，别是越应该卖出',
  `presage_today` smallint(2) NOT NULL DEFAULT 0 COMMENT '预示今日：[-99,99]今日涨跌评分，负分看跌，正分看涨',
  `presage_recently` smallint(2) NOT NULL DEFAULT 0 COMMENT '预示近日：[-99,99]近3日涨跌评分，负分看跌，正分看涨',
  `presage_next` smallint(2) NOT NULL DEFAULT 0 COMMENT '预示后市：[-99,99]之后涨跌走势评分，负分看跌，正分看涨',
  `code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '股票代码：[0,16]',
  `tip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分析提示：[0,255]技术分析名称',
  `action` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '行动方式：[0,16]买、卖、留',
  `predict` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预言：[0,255]告知近日和将来走势',
  PRIMARY KEY (`analyse_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '股票分析：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stock_analyse
-- ----------------------------

-- ----------------------------
-- Table structure for stock_formula
-- ----------------------------
DROP TABLE IF EXISTS `stock_formula`;
CREATE TABLE `stock_formula`  (
  `formula_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '公式ID：[1,2147483647]',
  `weight` smallint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '权重：[0,99]权重决定买卖和看涨看跌',
  `policy` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '方针：[0,4]只想操作方式',
  `tense` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分析时态：[0,8]同时过去还是今时、今日数据分析。now今时、today今日、past昔日',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '公式名称：[0,16]技术分析名称',
  `filter` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '过滤：[0,16]当出现该技术分析时结果时，其他某个分析结果将无效，所以将其过滤调',
  `presage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预示：[0,255]今日、近日、之后走势的看涨、看跌',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公式简介：[0,255]介绍该公式是什么技术分析的',
  `express` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '股票公式：用于分析走势，返回逻辑值',
  PRIMARY KEY (`formula_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '股票公式：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stock_formula
-- ----------------------------

-- ----------------------------
-- Table structure for stock_info
-- ----------------------------
DROP TABLE IF EXISTS `stock_info`;
CREATE TABLE `stock_info`  (
  `stock_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '股票ID：[1,2147483647]',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '股票名称：[0,16]',
  `code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '股票代码：[0,12]',
  `company` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公司名称：[0,32]',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '股票简介：[0,255]',
  `bonus` double(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '分红频率：1年1次为1.0；2年一次为0.5；3年一次为0.33；不分红为0',
  `issue_price` double(6, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '：',
  `pe` double(6, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '市盈率：',
  `pb` double(6, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '市净率：',
  `profit` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '公司利润：如果为0或负数，表示公司不盈利',
  `num` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '发行量：[0,2147483647]单位(万股)',
  `time_to_market` date NOT NULL DEFAULT '1970-01-01' COMMENT '上市时间：',
  PRIMARY KEY (`stock_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '股票信息：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stock_info
-- ----------------------------

-- ----------------------------
-- Table structure for stock_market
-- ----------------------------
DROP TABLE IF EXISTS `stock_market`;
CREATE TABLE `stock_market`  (
  `market_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '行情ID：[1,2147483647]',
  `code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '股票代码：[0,16]',
  `HIGH` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最高价：',
  `LOW` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最低价：',
  `OPEN` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '开盘价：',
  `CLOSE` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '收盘价：',
  `VOL` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '成交量：[0,2147483647]',
  `CHG` double(5, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '涨跌幅：',
  `TOTAL` double(12, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '总成交额：',
  `DATETIME` date NOT NULL DEFAULT '1970-01-01' COMMENT '交易日期：',
  PRIMARY KEY (`market_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '股票行情：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stock_market
-- ----------------------------

-- ----------------------------
-- Table structure for stock_subscribe
-- ----------------------------
DROP TABLE IF EXISTS `stock_subscribe`;
CREATE TABLE `stock_subscribe`  (
  `subscribe_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '订阅ID：[1,8388607]',
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '订阅用户ID：[1,8388607]',
  `time1` time(0) NOT NULL DEFAULT '10:00:00' COMMENT '通知时段1：默认为开盘后半小时，一般通知什么股票要卖',
  `time2` time(0) NOT NULL DEFAULT '13:00:00' COMMENT '通知时段2：默认为下午开盘时间，一般通知什么股票要卖',
  `time3` time(0) NOT NULL DEFAULT '14:30:00' COMMENT '通知时段3：默认为收盘前半小时。一般通知什么股票要买',
  `way` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'wechat' COMMENT '订阅方式：[0,12]phone手机短信、email邮箱、wechat微信公众号、app应用端',
  `stocks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订阅的股票：[0,255]',
  PRIMARY KEY (`subscribe_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '股票订阅：用于记录用户订阅的股票，便于定时通知技术分析和走势' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stock_subscribe
-- ----------------------------

-- ----------------------------
-- Table structure for sys_ad
-- ----------------------------
DROP TABLE IF EXISTS `sys_ad`;
CREATE TABLE `sys_ad`  (
  `ad_id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '广告ID：[1,32767]',
  `display` smallint(5) UNSIGNED NOT NULL DEFAULT 100 COMMENT '显示顺序：[0,10000]数值越小，越优先显示',
  `city_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '投放城市ID：[1,8388607]',
  `area_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '投放地区：[1,8388607]',
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '广告主ID：[1,8388607]表示是谁打的广告',
  `times_user` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '访客数：[0,2147483647]',
  `times_max` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '次数上限：[0,2147483647]表示点击或展现达多少次后不再打该广告',
  `times_show` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '展现量：[0,2147483647]',
  `times_click` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '点击量：[0,2147483647]',
  `fee` double(5, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '费用：每次点击或展现、增加访客所需的费用',
  `fee_max` double(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '费用上限：表示打广告消费到多少钱后不再打广告',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '广告名称：[0,16]',
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '广告类型：[0,16]text文字、img图片、video视频、flash交互动画',
  `location` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '投放位置：[0,16]',
  `fee_way` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '付费方式：[0,16]click点击付费、show展现付费、user访客付费',
  `app` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '展现应用：[0,16]将在指定的应用下才展现广告',
  `trade` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所属行业：[0,24]可以根据不同的行业定制不同的投放',
  `title` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '广告标题：[0,32]',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '广告描述：[0,255]',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '广告图：[0,255]',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '跳转链接：[0,255]',
  `keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关键词：[0,255]在出现于关键词相关的情况下才打广告，多个关键词用空格分隔',
  PRIMARY KEY (`ad_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '广告信息：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_ad
-- ----------------------------
INSERT INTO `sys_ad` VALUES (1, 100, 1, 0, 1, 0, 0, 0, 0, 0.00, 0.00, ' 莫比乌斯广告', 'text', NULL, 'click', NULL, NULL, '文章', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_address_area
-- ----------------------------
DROP TABLE IF EXISTS `sys_address_area`;
CREATE TABLE `sys_address_area`  (
  `area_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '地区ID：[1,8388607]',
  `show` smallint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否可见：[0,2]0为仅表单可见，1为仅表单和搜索时可见 ，2为均可见',
  `display` smallint(4) UNSIGNED NOT NULL DEFAULT 100 COMMENT '显示顺序：[0,1000]',
  `city_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '所属城市ID：[1,8388607]',
  `name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '地区名称：[0,16]',
  PRIMARY KEY (`area_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '地区：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_address_area
-- ----------------------------
INSERT INTO `sys_address_area` VALUES (110101, 0, 100, 110100, '东城区');
INSERT INTO `sys_address_area` VALUES (110102, 0, 100, 110100, '西城区');
INSERT INTO `sys_address_area` VALUES (110103, 0, 100, 110100, '崇文区');
INSERT INTO `sys_address_area` VALUES (110104, 0, 100, 110100, '宣武区');
INSERT INTO `sys_address_area` VALUES (110105, 0, 100, 110100, '朝阳区');
INSERT INTO `sys_address_area` VALUES (110106, 0, 100, 110100, '丰台区');
INSERT INTO `sys_address_area` VALUES (110107, 0, 100, 110100, '石景山区');
INSERT INTO `sys_address_area` VALUES (110108, 0, 100, 110100, '海淀区');
INSERT INTO `sys_address_area` VALUES (110109, 0, 100, 110100, '门头沟区');
INSERT INTO `sys_address_area` VALUES (110111, 0, 100, 110100, '房山区');
INSERT INTO `sys_address_area` VALUES (110112, 0, 100, 110100, '通州区');
INSERT INTO `sys_address_area` VALUES (110113, 0, 100, 110100, '顺义区');
INSERT INTO `sys_address_area` VALUES (110114, 0, 100, 110100, '昌平区');
INSERT INTO `sys_address_area` VALUES (110115, 0, 100, 110100, '大兴区');
INSERT INTO `sys_address_area` VALUES (110116, 0, 100, 110100, '怀柔区');
INSERT INTO `sys_address_area` VALUES (110117, 0, 100, 110100, '平谷区');
INSERT INTO `sys_address_area` VALUES (110228, 0, 100, 110200, '密云县');
INSERT INTO `sys_address_area` VALUES (110229, 0, 100, 110200, '延庆县');
INSERT INTO `sys_address_area` VALUES (120101, 0, 100, 120100, '和平区');
INSERT INTO `sys_address_area` VALUES (120102, 0, 100, 120100, '河东区');
INSERT INTO `sys_address_area` VALUES (120103, 0, 100, 120100, '河西区');
INSERT INTO `sys_address_area` VALUES (120104, 0, 100, 120100, '南开区');
INSERT INTO `sys_address_area` VALUES (120105, 0, 100, 120100, '河北区');
INSERT INTO `sys_address_area` VALUES (120106, 0, 100, 120100, '红桥区');
INSERT INTO `sys_address_area` VALUES (120107, 0, 100, 120100, '塘沽区');
INSERT INTO `sys_address_area` VALUES (120108, 0, 100, 120100, '汉沽区');
INSERT INTO `sys_address_area` VALUES (120109, 0, 100, 120100, '大港区');
INSERT INTO `sys_address_area` VALUES (120110, 0, 100, 120100, '东丽区');
INSERT INTO `sys_address_area` VALUES (120111, 0, 100, 120100, '西青区');
INSERT INTO `sys_address_area` VALUES (120112, 0, 100, 120100, '津南区');
INSERT INTO `sys_address_area` VALUES (120113, 0, 100, 120100, '北辰区');
INSERT INTO `sys_address_area` VALUES (120114, 0, 100, 120100, '武清区');
INSERT INTO `sys_address_area` VALUES (120115, 0, 100, 120100, '宝坻区');
INSERT INTO `sys_address_area` VALUES (120221, 0, 100, 120200, '宁河县');
INSERT INTO `sys_address_area` VALUES (120223, 0, 100, 120200, '静海县');
INSERT INTO `sys_address_area` VALUES (120225, 0, 100, 120200, '蓟　县');
INSERT INTO `sys_address_area` VALUES (130101, 0, 100, 130100, '市辖区');
INSERT INTO `sys_address_area` VALUES (130102, 0, 100, 130100, '长安区');
INSERT INTO `sys_address_area` VALUES (130103, 0, 100, 130100, '桥东区');
INSERT INTO `sys_address_area` VALUES (130104, 0, 100, 130100, '桥西区');
INSERT INTO `sys_address_area` VALUES (130105, 0, 100, 130100, '新华区');
INSERT INTO `sys_address_area` VALUES (130107, 0, 100, 130100, '井陉矿区');
INSERT INTO `sys_address_area` VALUES (130108, 0, 100, 130100, '裕华区');
INSERT INTO `sys_address_area` VALUES (130121, 0, 100, 130100, '井陉县');
INSERT INTO `sys_address_area` VALUES (130123, 0, 100, 130100, '正定县');
INSERT INTO `sys_address_area` VALUES (130124, 0, 100, 130100, '栾城县');
INSERT INTO `sys_address_area` VALUES (130125, 0, 100, 130100, '行唐县');
INSERT INTO `sys_address_area` VALUES (130126, 0, 100, 130100, '灵寿县');
INSERT INTO `sys_address_area` VALUES (130127, 0, 100, 130100, '高邑县');
INSERT INTO `sys_address_area` VALUES (130128, 0, 100, 130100, '深泽县');
INSERT INTO `sys_address_area` VALUES (130129, 0, 100, 130100, '赞皇县');
INSERT INTO `sys_address_area` VALUES (130130, 0, 100, 130100, '无极县');
INSERT INTO `sys_address_area` VALUES (130131, 0, 100, 130100, '平山县');
INSERT INTO `sys_address_area` VALUES (130132, 0, 100, 130100, '元氏县');
INSERT INTO `sys_address_area` VALUES (130133, 0, 100, 130100, '赵　县');
INSERT INTO `sys_address_area` VALUES (130181, 0, 100, 130100, '辛集市');
INSERT INTO `sys_address_area` VALUES (130182, 0, 100, 130100, '藁城市');
INSERT INTO `sys_address_area` VALUES (130183, 0, 100, 130100, '晋州市');
INSERT INTO `sys_address_area` VALUES (130184, 0, 100, 130100, '新乐市');
INSERT INTO `sys_address_area` VALUES (130185, 0, 100, 130100, '鹿泉市');
INSERT INTO `sys_address_area` VALUES (130201, 0, 100, 130200, '市辖区');
INSERT INTO `sys_address_area` VALUES (130202, 0, 100, 130200, '路南区');
INSERT INTO `sys_address_area` VALUES (130203, 0, 100, 130200, '路北区');
INSERT INTO `sys_address_area` VALUES (130204, 0, 100, 130200, '古冶区');
INSERT INTO `sys_address_area` VALUES (130205, 0, 100, 130200, '开平区');
INSERT INTO `sys_address_area` VALUES (130207, 0, 100, 130200, '丰南区');
INSERT INTO `sys_address_area` VALUES (130208, 0, 100, 130200, '丰润区');
INSERT INTO `sys_address_area` VALUES (130223, 0, 100, 130200, '滦　县');
INSERT INTO `sys_address_area` VALUES (130224, 0, 100, 130200, '滦南县');
INSERT INTO `sys_address_area` VALUES (130225, 0, 100, 130200, '乐亭县');
INSERT INTO `sys_address_area` VALUES (130227, 0, 100, 130200, '迁西县');
INSERT INTO `sys_address_area` VALUES (130229, 0, 100, 130200, '玉田县');
INSERT INTO `sys_address_area` VALUES (130230, 0, 100, 130200, '唐海县');
INSERT INTO `sys_address_area` VALUES (130281, 0, 100, 130200, '遵化市');
INSERT INTO `sys_address_area` VALUES (130283, 0, 100, 130200, '迁安市');
INSERT INTO `sys_address_area` VALUES (130301, 0, 100, 130300, '市辖区');
INSERT INTO `sys_address_area` VALUES (130302, 0, 100, 130300, '海港区');
INSERT INTO `sys_address_area` VALUES (130303, 0, 100, 130300, '山海关区');
INSERT INTO `sys_address_area` VALUES (130304, 0, 100, 130300, '北戴河区');
INSERT INTO `sys_address_area` VALUES (130321, 0, 100, 130300, '青龙满族自治县');
INSERT INTO `sys_address_area` VALUES (130322, 0, 100, 130300, '昌黎县');
INSERT INTO `sys_address_area` VALUES (130323, 0, 100, 130300, '抚宁县');
INSERT INTO `sys_address_area` VALUES (130324, 0, 100, 130300, '卢龙县');
INSERT INTO `sys_address_area` VALUES (130401, 0, 100, 130400, '市辖区');
INSERT INTO `sys_address_area` VALUES (130402, 0, 100, 130400, '邯山区');
INSERT INTO `sys_address_area` VALUES (130403, 0, 100, 130400, '丛台区');
INSERT INTO `sys_address_area` VALUES (130404, 0, 100, 130400, '复兴区');
INSERT INTO `sys_address_area` VALUES (130406, 0, 100, 130400, '峰峰矿区');
INSERT INTO `sys_address_area` VALUES (130421, 0, 100, 130400, '邯郸县');
INSERT INTO `sys_address_area` VALUES (130423, 0, 100, 130400, '临漳县');
INSERT INTO `sys_address_area` VALUES (130424, 0, 100, 130400, '成安县');
INSERT INTO `sys_address_area` VALUES (130425, 0, 100, 130400, '大名县');
INSERT INTO `sys_address_area` VALUES (130426, 0, 100, 130400, '涉　县');
INSERT INTO `sys_address_area` VALUES (130427, 0, 100, 130400, '磁　县');
INSERT INTO `sys_address_area` VALUES (130428, 0, 100, 130400, '肥乡县');
INSERT INTO `sys_address_area` VALUES (130429, 0, 100, 130400, '永年县');
INSERT INTO `sys_address_area` VALUES (130430, 0, 100, 130400, '邱　县');
INSERT INTO `sys_address_area` VALUES (130431, 0, 100, 130400, '鸡泽县');
INSERT INTO `sys_address_area` VALUES (130432, 0, 100, 130400, '广平县');
INSERT INTO `sys_address_area` VALUES (130433, 0, 100, 130400, '馆陶县');
INSERT INTO `sys_address_area` VALUES (130434, 0, 100, 130400, '魏　县');
INSERT INTO `sys_address_area` VALUES (130435, 0, 100, 130400, '曲周县');
INSERT INTO `sys_address_area` VALUES (130481, 0, 100, 130400, '武安市');
INSERT INTO `sys_address_area` VALUES (130501, 0, 100, 130500, '市辖区');
INSERT INTO `sys_address_area` VALUES (130502, 0, 100, 130500, '桥东区');
INSERT INTO `sys_address_area` VALUES (130503, 0, 100, 130500, '桥西区');
INSERT INTO `sys_address_area` VALUES (130521, 0, 100, 130500, '邢台县');
INSERT INTO `sys_address_area` VALUES (130522, 0, 100, 130500, '临城县');
INSERT INTO `sys_address_area` VALUES (130523, 0, 100, 130500, '内丘县');
INSERT INTO `sys_address_area` VALUES (130524, 0, 100, 130500, '柏乡县');
INSERT INTO `sys_address_area` VALUES (130525, 0, 100, 130500, '隆尧县');
INSERT INTO `sys_address_area` VALUES (130526, 0, 100, 130500, '任　县');
INSERT INTO `sys_address_area` VALUES (130527, 0, 100, 130500, '南和县');
INSERT INTO `sys_address_area` VALUES (130528, 0, 100, 130500, '宁晋县');
INSERT INTO `sys_address_area` VALUES (130529, 0, 100, 130500, '巨鹿县');
INSERT INTO `sys_address_area` VALUES (130530, 0, 100, 130500, '新河县');
INSERT INTO `sys_address_area` VALUES (130531, 0, 100, 130500, '广宗县');
INSERT INTO `sys_address_area` VALUES (130532, 0, 100, 130500, '平乡县');
INSERT INTO `sys_address_area` VALUES (130533, 0, 100, 130500, '威　县');
INSERT INTO `sys_address_area` VALUES (130534, 0, 100, 130500, '清河县');
INSERT INTO `sys_address_area` VALUES (130535, 0, 100, 130500, '临西县');
INSERT INTO `sys_address_area` VALUES (130581, 0, 100, 130500, '南宫市');
INSERT INTO `sys_address_area` VALUES (130582, 0, 100, 130500, '沙河市');
INSERT INTO `sys_address_area` VALUES (130601, 0, 100, 130600, '市辖区');
INSERT INTO `sys_address_area` VALUES (130602, 0, 100, 130600, '新市区');
INSERT INTO `sys_address_area` VALUES (130603, 0, 100, 130600, '北市区');
INSERT INTO `sys_address_area` VALUES (130604, 0, 100, 130600, '南市区');
INSERT INTO `sys_address_area` VALUES (130621, 0, 100, 130600, '满城县');
INSERT INTO `sys_address_area` VALUES (130622, 0, 100, 130600, '清苑县');
INSERT INTO `sys_address_area` VALUES (130623, 0, 100, 130600, '涞水县');
INSERT INTO `sys_address_area` VALUES (130624, 0, 100, 130600, '阜平县');
INSERT INTO `sys_address_area` VALUES (130625, 0, 100, 130600, '徐水县');
INSERT INTO `sys_address_area` VALUES (130626, 0, 100, 130600, '定兴县');
INSERT INTO `sys_address_area` VALUES (130627, 0, 100, 130600, '唐　县');
INSERT INTO `sys_address_area` VALUES (130628, 0, 100, 130600, '高阳县');
INSERT INTO `sys_address_area` VALUES (130629, 0, 100, 130600, '容城县');
INSERT INTO `sys_address_area` VALUES (130630, 0, 100, 130600, '涞源县');
INSERT INTO `sys_address_area` VALUES (130631, 0, 100, 130600, '望都县');
INSERT INTO `sys_address_area` VALUES (130632, 0, 100, 130600, '安新县');
INSERT INTO `sys_address_area` VALUES (130633, 0, 100, 130600, '易　县');
INSERT INTO `sys_address_area` VALUES (130634, 0, 100, 130600, '曲阳县');
INSERT INTO `sys_address_area` VALUES (130635, 0, 100, 130600, '蠡　县');
INSERT INTO `sys_address_area` VALUES (130636, 0, 100, 130600, '顺平县');
INSERT INTO `sys_address_area` VALUES (130637, 0, 100, 130600, '博野县');
INSERT INTO `sys_address_area` VALUES (130638, 0, 100, 130600, '雄　县');
INSERT INTO `sys_address_area` VALUES (130681, 0, 100, 130600, '涿州市');
INSERT INTO `sys_address_area` VALUES (130682, 0, 100, 130600, '定州市');
INSERT INTO `sys_address_area` VALUES (130683, 0, 100, 130600, '安国市');
INSERT INTO `sys_address_area` VALUES (130684, 0, 100, 130600, '高碑店市');
INSERT INTO `sys_address_area` VALUES (130701, 0, 100, 130700, '市辖区');
INSERT INTO `sys_address_area` VALUES (130702, 0, 100, 130700, '桥东区');
INSERT INTO `sys_address_area` VALUES (130703, 0, 100, 130700, '桥西区');
INSERT INTO `sys_address_area` VALUES (130705, 0, 100, 130700, '宣化区');
INSERT INTO `sys_address_area` VALUES (130706, 0, 100, 130700, '下花园区');
INSERT INTO `sys_address_area` VALUES (130721, 0, 100, 130700, '宣化县');
INSERT INTO `sys_address_area` VALUES (130722, 0, 100, 130700, '张北县');
INSERT INTO `sys_address_area` VALUES (130723, 0, 100, 130700, '康保县');
INSERT INTO `sys_address_area` VALUES (130724, 0, 100, 130700, '沽源县');
INSERT INTO `sys_address_area` VALUES (130725, 0, 100, 130700, '尚义县');
INSERT INTO `sys_address_area` VALUES (130726, 0, 100, 130700, '蔚　县');
INSERT INTO `sys_address_area` VALUES (130727, 0, 100, 130700, '阳原县');
INSERT INTO `sys_address_area` VALUES (130728, 0, 100, 130700, '怀安县');
INSERT INTO `sys_address_area` VALUES (130729, 0, 100, 130700, '万全县');
INSERT INTO `sys_address_area` VALUES (130730, 0, 100, 130700, '怀来县');
INSERT INTO `sys_address_area` VALUES (130731, 0, 100, 130700, '涿鹿县');
INSERT INTO `sys_address_area` VALUES (130732, 0, 100, 130700, '赤城县');
INSERT INTO `sys_address_area` VALUES (130733, 0, 100, 130700, '崇礼县');
INSERT INTO `sys_address_area` VALUES (130801, 0, 100, 130800, '市辖区');
INSERT INTO `sys_address_area` VALUES (130802, 0, 100, 130800, '双桥区');
INSERT INTO `sys_address_area` VALUES (130803, 0, 100, 130800, '双滦区');
INSERT INTO `sys_address_area` VALUES (130804, 0, 100, 130800, '鹰手营子矿区');
INSERT INTO `sys_address_area` VALUES (130821, 0, 100, 130800, '承德县');
INSERT INTO `sys_address_area` VALUES (130822, 0, 100, 130800, '兴隆县');
INSERT INTO `sys_address_area` VALUES (130823, 0, 100, 130800, '平泉县');
INSERT INTO `sys_address_area` VALUES (130824, 0, 100, 130800, '滦平县');
INSERT INTO `sys_address_area` VALUES (130825, 0, 100, 130800, '隆化县');
INSERT INTO `sys_address_area` VALUES (130826, 0, 100, 130800, '丰宁满族自治县');
INSERT INTO `sys_address_area` VALUES (130827, 0, 100, 130800, '宽城满族自治县');
INSERT INTO `sys_address_area` VALUES (130828, 0, 100, 130800, '围场满族蒙古族自治县');
INSERT INTO `sys_address_area` VALUES (130901, 0, 100, 130900, '市辖区');
INSERT INTO `sys_address_area` VALUES (130902, 0, 100, 130900, '新华区');
INSERT INTO `sys_address_area` VALUES (130903, 0, 100, 130900, '运河区');
INSERT INTO `sys_address_area` VALUES (130921, 0, 100, 130900, '沧　县');
INSERT INTO `sys_address_area` VALUES (130922, 0, 100, 130900, '青　县');
INSERT INTO `sys_address_area` VALUES (130923, 0, 100, 130900, '东光县');
INSERT INTO `sys_address_area` VALUES (130924, 0, 100, 130900, '海兴县');
INSERT INTO `sys_address_area` VALUES (130925, 0, 100, 130900, '盐山县');
INSERT INTO `sys_address_area` VALUES (130926, 0, 100, 130900, '肃宁县');
INSERT INTO `sys_address_area` VALUES (130927, 0, 100, 130900, '南皮县');
INSERT INTO `sys_address_area` VALUES (130928, 0, 100, 130900, '吴桥县');
INSERT INTO `sys_address_area` VALUES (130929, 0, 100, 130900, '献　县');
INSERT INTO `sys_address_area` VALUES (130930, 0, 100, 130900, '孟村回族自治县');
INSERT INTO `sys_address_area` VALUES (130981, 0, 100, 130900, '泊头市');
INSERT INTO `sys_address_area` VALUES (130982, 0, 100, 130900, '任丘市');
INSERT INTO `sys_address_area` VALUES (130983, 0, 100, 130900, '黄骅市');
INSERT INTO `sys_address_area` VALUES (130984, 0, 100, 130900, '河间市');
INSERT INTO `sys_address_area` VALUES (131001, 0, 100, 131000, '市辖区');
INSERT INTO `sys_address_area` VALUES (131002, 0, 100, 131000, '安次区');
INSERT INTO `sys_address_area` VALUES (131003, 0, 100, 131000, '广阳区');
INSERT INTO `sys_address_area` VALUES (131022, 0, 100, 131000, '固安县');
INSERT INTO `sys_address_area` VALUES (131023, 0, 100, 131000, '永清县');
INSERT INTO `sys_address_area` VALUES (131024, 0, 100, 131000, '香河县');
INSERT INTO `sys_address_area` VALUES (131025, 0, 100, 131000, '大城县');
INSERT INTO `sys_address_area` VALUES (131026, 0, 100, 131000, '文安县');
INSERT INTO `sys_address_area` VALUES (131028, 0, 100, 131000, '大厂回族自治县');
INSERT INTO `sys_address_area` VALUES (131081, 0, 100, 131000, '霸州市');
INSERT INTO `sys_address_area` VALUES (131082, 0, 100, 131000, '三河市');
INSERT INTO `sys_address_area` VALUES (131101, 0, 100, 131100, '市辖区');
INSERT INTO `sys_address_area` VALUES (131102, 0, 100, 131100, '桃城区');
INSERT INTO `sys_address_area` VALUES (131121, 0, 100, 131100, '枣强县');
INSERT INTO `sys_address_area` VALUES (131122, 0, 100, 131100, '武邑县');
INSERT INTO `sys_address_area` VALUES (131123, 0, 100, 131100, '武强县');
INSERT INTO `sys_address_area` VALUES (131124, 0, 100, 131100, '饶阳县');
INSERT INTO `sys_address_area` VALUES (131125, 0, 100, 131100, '安平县');
INSERT INTO `sys_address_area` VALUES (131126, 0, 100, 131100, '故城县');
INSERT INTO `sys_address_area` VALUES (131127, 0, 100, 131100, '景　县');
INSERT INTO `sys_address_area` VALUES (131128, 0, 100, 131100, '阜城县');
INSERT INTO `sys_address_area` VALUES (131181, 0, 100, 131100, '冀州市');
INSERT INTO `sys_address_area` VALUES (131182, 0, 100, 131100, '深州市');
INSERT INTO `sys_address_area` VALUES (140101, 0, 100, 140100, '市辖区');
INSERT INTO `sys_address_area` VALUES (140105, 0, 100, 140100, '小店区');
INSERT INTO `sys_address_area` VALUES (140106, 0, 100, 140100, '迎泽区');
INSERT INTO `sys_address_area` VALUES (140107, 0, 100, 140100, '杏花岭区');
INSERT INTO `sys_address_area` VALUES (140108, 0, 100, 140100, '尖草坪区');
INSERT INTO `sys_address_area` VALUES (140109, 0, 100, 140100, '万柏林区');
INSERT INTO `sys_address_area` VALUES (140110, 0, 100, 140100, '晋源区');
INSERT INTO `sys_address_area` VALUES (140121, 0, 100, 140100, '清徐县');
INSERT INTO `sys_address_area` VALUES (140122, 0, 100, 140100, '阳曲县');
INSERT INTO `sys_address_area` VALUES (140123, 0, 100, 140100, '娄烦县');
INSERT INTO `sys_address_area` VALUES (140181, 0, 100, 140100, '古交市');
INSERT INTO `sys_address_area` VALUES (140201, 0, 100, 140200, '市辖区');
INSERT INTO `sys_address_area` VALUES (140202, 0, 100, 140200, '城　区');
INSERT INTO `sys_address_area` VALUES (140203, 0, 100, 140200, '矿　区');
INSERT INTO `sys_address_area` VALUES (140211, 0, 100, 140200, '南郊区');
INSERT INTO `sys_address_area` VALUES (140212, 0, 100, 140200, '新荣区');
INSERT INTO `sys_address_area` VALUES (140221, 0, 100, 140200, '阳高县');
INSERT INTO `sys_address_area` VALUES (140222, 0, 100, 140200, '天镇县');
INSERT INTO `sys_address_area` VALUES (140223, 0, 100, 140200, '广灵县');
INSERT INTO `sys_address_area` VALUES (140224, 0, 100, 140200, '灵丘县');
INSERT INTO `sys_address_area` VALUES (140225, 0, 100, 140200, '浑源县');
INSERT INTO `sys_address_area` VALUES (140226, 0, 100, 140200, '左云县');
INSERT INTO `sys_address_area` VALUES (140227, 0, 100, 140200, '大同县');
INSERT INTO `sys_address_area` VALUES (140301, 0, 100, 140300, '市辖区');
INSERT INTO `sys_address_area` VALUES (140302, 0, 100, 140300, '城　区');
INSERT INTO `sys_address_area` VALUES (140303, 0, 100, 140300, '矿　区');
INSERT INTO `sys_address_area` VALUES (140311, 0, 100, 140300, '郊　区');
INSERT INTO `sys_address_area` VALUES (140321, 0, 100, 140300, '平定县');
INSERT INTO `sys_address_area` VALUES (140322, 0, 100, 140300, '盂　县');
INSERT INTO `sys_address_area` VALUES (140401, 0, 100, 140400, '市辖区');
INSERT INTO `sys_address_area` VALUES (140402, 0, 100, 140400, '城　区');
INSERT INTO `sys_address_area` VALUES (140411, 0, 100, 140400, '郊　区');
INSERT INTO `sys_address_area` VALUES (140421, 0, 100, 140400, '长治县');
INSERT INTO `sys_address_area` VALUES (140423, 0, 100, 140400, '襄垣县');
INSERT INTO `sys_address_area` VALUES (140424, 0, 100, 140400, '屯留县');
INSERT INTO `sys_address_area` VALUES (140425, 0, 100, 140400, '平顺县');
INSERT INTO `sys_address_area` VALUES (140426, 0, 100, 140400, '黎城县');
INSERT INTO `sys_address_area` VALUES (140427, 0, 100, 140400, '壶关县');
INSERT INTO `sys_address_area` VALUES (140428, 0, 100, 140400, '长子县');
INSERT INTO `sys_address_area` VALUES (140429, 0, 100, 140400, '武乡县');
INSERT INTO `sys_address_area` VALUES (140430, 0, 100, 140400, '沁　县');
INSERT INTO `sys_address_area` VALUES (140431, 0, 100, 140400, '沁源县');
INSERT INTO `sys_address_area` VALUES (140481, 0, 100, 140400, '潞城市');
INSERT INTO `sys_address_area` VALUES (140501, 0, 100, 140500, '市辖区');
INSERT INTO `sys_address_area` VALUES (140502, 0, 100, 140500, '城　区');
INSERT INTO `sys_address_area` VALUES (140521, 0, 100, 140500, '沁水县');
INSERT INTO `sys_address_area` VALUES (140522, 0, 100, 140500, '阳城县');
INSERT INTO `sys_address_area` VALUES (140524, 0, 100, 140500, '陵川县');
INSERT INTO `sys_address_area` VALUES (140525, 0, 100, 140500, '泽州县');
INSERT INTO `sys_address_area` VALUES (140581, 0, 100, 140500, '高平市');
INSERT INTO `sys_address_area` VALUES (140601, 0, 100, 140600, '市辖区');
INSERT INTO `sys_address_area` VALUES (140602, 0, 100, 140600, '朔城区');
INSERT INTO `sys_address_area` VALUES (140603, 0, 100, 140600, '平鲁区');
INSERT INTO `sys_address_area` VALUES (140621, 0, 100, 140600, '山阴县');
INSERT INTO `sys_address_area` VALUES (140622, 0, 100, 140600, '应　县');
INSERT INTO `sys_address_area` VALUES (140623, 0, 100, 140600, '右玉县');
INSERT INTO `sys_address_area` VALUES (140624, 0, 100, 140600, '怀仁县');
INSERT INTO `sys_address_area` VALUES (140701, 0, 100, 140700, '市辖区');
INSERT INTO `sys_address_area` VALUES (140702, 0, 100, 140700, '榆次区');
INSERT INTO `sys_address_area` VALUES (140721, 0, 100, 140700, '榆社县');
INSERT INTO `sys_address_area` VALUES (140722, 0, 100, 140700, '左权县');
INSERT INTO `sys_address_area` VALUES (140723, 0, 100, 140700, '和顺县');
INSERT INTO `sys_address_area` VALUES (140724, 0, 100, 140700, '昔阳县');
INSERT INTO `sys_address_area` VALUES (140725, 0, 100, 140700, '寿阳县');
INSERT INTO `sys_address_area` VALUES (140726, 0, 100, 140700, '太谷县');
INSERT INTO `sys_address_area` VALUES (140727, 0, 100, 140700, '祁　县');
INSERT INTO `sys_address_area` VALUES (140728, 0, 100, 140700, '平遥县');
INSERT INTO `sys_address_area` VALUES (140729, 0, 100, 140700, '灵石县');
INSERT INTO `sys_address_area` VALUES (140781, 0, 100, 140700, '介休市');
INSERT INTO `sys_address_area` VALUES (140801, 0, 100, 140800, '市辖区');
INSERT INTO `sys_address_area` VALUES (140802, 0, 100, 140800, '盐湖区');
INSERT INTO `sys_address_area` VALUES (140821, 0, 100, 140800, '临猗县');
INSERT INTO `sys_address_area` VALUES (140822, 0, 100, 140800, '万荣县');
INSERT INTO `sys_address_area` VALUES (140823, 0, 100, 140800, '闻喜县');
INSERT INTO `sys_address_area` VALUES (140824, 0, 100, 140800, '稷山县');
INSERT INTO `sys_address_area` VALUES (140825, 0, 100, 140800, '新绛县');
INSERT INTO `sys_address_area` VALUES (140826, 0, 100, 140800, '绛　县');
INSERT INTO `sys_address_area` VALUES (140827, 0, 100, 140800, '垣曲县');
INSERT INTO `sys_address_area` VALUES (140828, 0, 100, 140800, '夏　县');
INSERT INTO `sys_address_area` VALUES (140829, 0, 100, 140800, '平陆县');
INSERT INTO `sys_address_area` VALUES (140830, 0, 100, 140800, '芮城县');
INSERT INTO `sys_address_area` VALUES (140881, 0, 100, 140800, '永济市');
INSERT INTO `sys_address_area` VALUES (140882, 0, 100, 140800, '河津市');
INSERT INTO `sys_address_area` VALUES (140901, 0, 100, 140900, '市辖区');
INSERT INTO `sys_address_area` VALUES (140902, 0, 100, 140900, '忻府区');
INSERT INTO `sys_address_area` VALUES (140921, 0, 100, 140900, '定襄县');
INSERT INTO `sys_address_area` VALUES (140922, 0, 100, 140900, '五台县');
INSERT INTO `sys_address_area` VALUES (140923, 0, 100, 140900, '代　县');
INSERT INTO `sys_address_area` VALUES (140924, 0, 100, 140900, '繁峙县');
INSERT INTO `sys_address_area` VALUES (140925, 0, 100, 140900, '宁武县');
INSERT INTO `sys_address_area` VALUES (140926, 0, 100, 140900, '静乐县');
INSERT INTO `sys_address_area` VALUES (140927, 0, 100, 140900, '神池县');
INSERT INTO `sys_address_area` VALUES (140928, 0, 100, 140900, '五寨县');
INSERT INTO `sys_address_area` VALUES (140929, 0, 100, 140900, '岢岚县');
INSERT INTO `sys_address_area` VALUES (140930, 0, 100, 140900, '河曲县');
INSERT INTO `sys_address_area` VALUES (140931, 0, 100, 140900, '保德县');
INSERT INTO `sys_address_area` VALUES (140932, 0, 100, 140900, '偏关县');
INSERT INTO `sys_address_area` VALUES (140981, 0, 100, 140900, '原平市');
INSERT INTO `sys_address_area` VALUES (141001, 0, 100, 141000, '市辖区');
INSERT INTO `sys_address_area` VALUES (141002, 0, 100, 141000, '尧都区');
INSERT INTO `sys_address_area` VALUES (141021, 0, 100, 141000, '曲沃县');
INSERT INTO `sys_address_area` VALUES (141022, 0, 100, 141000, '翼城县');
INSERT INTO `sys_address_area` VALUES (141023, 0, 100, 141000, '襄汾县');
INSERT INTO `sys_address_area` VALUES (141024, 0, 100, 141000, '洪洞县');
INSERT INTO `sys_address_area` VALUES (141025, 0, 100, 141000, '古　县');
INSERT INTO `sys_address_area` VALUES (141026, 0, 100, 141000, '安泽县');
INSERT INTO `sys_address_area` VALUES (141027, 0, 100, 141000, '浮山县');
INSERT INTO `sys_address_area` VALUES (141028, 0, 100, 141000, '吉　县');
INSERT INTO `sys_address_area` VALUES (141029, 0, 100, 141000, '乡宁县');
INSERT INTO `sys_address_area` VALUES (141030, 0, 100, 141000, '大宁县');
INSERT INTO `sys_address_area` VALUES (141031, 0, 100, 141000, '隰　县');
INSERT INTO `sys_address_area` VALUES (141032, 0, 100, 141000, '永和县');
INSERT INTO `sys_address_area` VALUES (141033, 0, 100, 141000, '蒲　县');
INSERT INTO `sys_address_area` VALUES (141034, 0, 100, 141000, '汾西县');
INSERT INTO `sys_address_area` VALUES (141081, 0, 100, 141000, '侯马市');
INSERT INTO `sys_address_area` VALUES (141082, 0, 100, 141000, '霍州市');
INSERT INTO `sys_address_area` VALUES (141101, 0, 100, 141100, '市辖区');
INSERT INTO `sys_address_area` VALUES (141102, 0, 100, 141100, '离石区');
INSERT INTO `sys_address_area` VALUES (141121, 0, 100, 141100, '文水县');
INSERT INTO `sys_address_area` VALUES (141122, 0, 100, 141100, '交城县');
INSERT INTO `sys_address_area` VALUES (141123, 0, 100, 141100, '兴　县');
INSERT INTO `sys_address_area` VALUES (141124, 0, 100, 141100, '临　县');
INSERT INTO `sys_address_area` VALUES (141125, 0, 100, 141100, '柳林县');
INSERT INTO `sys_address_area` VALUES (141126, 0, 100, 141100, '石楼县');
INSERT INTO `sys_address_area` VALUES (141127, 0, 100, 141100, '岚　县');
INSERT INTO `sys_address_area` VALUES (141128, 0, 100, 141100, '方山县');
INSERT INTO `sys_address_area` VALUES (141129, 0, 100, 141100, '中阳县');
INSERT INTO `sys_address_area` VALUES (141130, 0, 100, 141100, '交口县');
INSERT INTO `sys_address_area` VALUES (141181, 0, 100, 141100, '孝义市');
INSERT INTO `sys_address_area` VALUES (141182, 0, 100, 141100, '汾阳市');
INSERT INTO `sys_address_area` VALUES (150101, 0, 100, 150100, '市辖区');
INSERT INTO `sys_address_area` VALUES (150102, 0, 100, 150100, '新城区');
INSERT INTO `sys_address_area` VALUES (150103, 0, 100, 150100, '回民区');
INSERT INTO `sys_address_area` VALUES (150104, 0, 100, 150100, '玉泉区');
INSERT INTO `sys_address_area` VALUES (150105, 0, 100, 150100, '赛罕区');
INSERT INTO `sys_address_area` VALUES (150121, 0, 100, 150100, '土默特左旗');
INSERT INTO `sys_address_area` VALUES (150122, 0, 100, 150100, '托克托县');
INSERT INTO `sys_address_area` VALUES (150123, 0, 100, 150100, '和林格尔县');
INSERT INTO `sys_address_area` VALUES (150124, 0, 100, 150100, '清水河县');
INSERT INTO `sys_address_area` VALUES (150125, 0, 100, 150100, '武川县');
INSERT INTO `sys_address_area` VALUES (150201, 0, 100, 150200, '市辖区');
INSERT INTO `sys_address_area` VALUES (150202, 0, 100, 150200, '东河区');
INSERT INTO `sys_address_area` VALUES (150203, 0, 100, 150200, '昆都仑区');
INSERT INTO `sys_address_area` VALUES (150204, 0, 100, 150200, '青山区');
INSERT INTO `sys_address_area` VALUES (150205, 0, 100, 150200, '石拐区');
INSERT INTO `sys_address_area` VALUES (150206, 0, 100, 150200, '白云矿区');
INSERT INTO `sys_address_area` VALUES (150207, 0, 100, 150200, '九原区');
INSERT INTO `sys_address_area` VALUES (150221, 0, 100, 150200, '土默特右旗');
INSERT INTO `sys_address_area` VALUES (150222, 0, 100, 150200, '固阳县');
INSERT INTO `sys_address_area` VALUES (150223, 0, 100, 150200, '达尔罕茂明安联合旗');
INSERT INTO `sys_address_area` VALUES (150301, 0, 100, 150300, '市辖区');
INSERT INTO `sys_address_area` VALUES (150302, 0, 100, 150300, '海勃湾区');
INSERT INTO `sys_address_area` VALUES (150303, 0, 100, 150300, '海南区');
INSERT INTO `sys_address_area` VALUES (150304, 0, 100, 150300, '乌达区');
INSERT INTO `sys_address_area` VALUES (150401, 0, 100, 150400, '市辖区');
INSERT INTO `sys_address_area` VALUES (150402, 0, 100, 150400, '红山区');
INSERT INTO `sys_address_area` VALUES (150403, 0, 100, 150400, '元宝山区');
INSERT INTO `sys_address_area` VALUES (150404, 0, 100, 150400, '松山区');
INSERT INTO `sys_address_area` VALUES (150421, 0, 100, 150400, '阿鲁科尔沁旗');
INSERT INTO `sys_address_area` VALUES (150422, 0, 100, 150400, '巴林左旗');
INSERT INTO `sys_address_area` VALUES (150423, 0, 100, 150400, '巴林右旗');
INSERT INTO `sys_address_area` VALUES (150424, 0, 100, 150400, '林西县');
INSERT INTO `sys_address_area` VALUES (150425, 0, 100, 150400, '克什克腾旗');
INSERT INTO `sys_address_area` VALUES (150426, 0, 100, 150400, '翁牛特旗');
INSERT INTO `sys_address_area` VALUES (150428, 0, 100, 150400, '喀喇沁旗');
INSERT INTO `sys_address_area` VALUES (150429, 0, 100, 150400, '宁城县');
INSERT INTO `sys_address_area` VALUES (150430, 0, 100, 150400, '敖汉旗');
INSERT INTO `sys_address_area` VALUES (150501, 0, 100, 150500, '市辖区');
INSERT INTO `sys_address_area` VALUES (150502, 0, 100, 150500, '科尔沁区');
INSERT INTO `sys_address_area` VALUES (150521, 0, 100, 150500, '科尔沁左翼中旗');
INSERT INTO `sys_address_area` VALUES (150522, 0, 100, 150500, '科尔沁左翼后旗');
INSERT INTO `sys_address_area` VALUES (150523, 0, 100, 150500, '开鲁县');
INSERT INTO `sys_address_area` VALUES (150524, 0, 100, 150500, '库伦旗');
INSERT INTO `sys_address_area` VALUES (150525, 0, 100, 150500, '奈曼旗');
INSERT INTO `sys_address_area` VALUES (150526, 0, 100, 150500, '扎鲁特旗');
INSERT INTO `sys_address_area` VALUES (150581, 0, 100, 150500, '霍林郭勒市');
INSERT INTO `sys_address_area` VALUES (150602, 0, 100, 150600, '东胜区');
INSERT INTO `sys_address_area` VALUES (150621, 0, 100, 150600, '达拉特旗');
INSERT INTO `sys_address_area` VALUES (150622, 0, 100, 150600, '准格尔旗');
INSERT INTO `sys_address_area` VALUES (150623, 0, 100, 150600, '鄂托克前旗');
INSERT INTO `sys_address_area` VALUES (150624, 0, 100, 150600, '鄂托克旗');
INSERT INTO `sys_address_area` VALUES (150625, 0, 100, 150600, '杭锦旗');
INSERT INTO `sys_address_area` VALUES (150626, 0, 100, 150600, '乌审旗');
INSERT INTO `sys_address_area` VALUES (150627, 0, 100, 150600, '伊金霍洛旗');
INSERT INTO `sys_address_area` VALUES (150701, 0, 100, 150700, '市辖区');
INSERT INTO `sys_address_area` VALUES (150702, 0, 100, 150700, '海拉尔区');
INSERT INTO `sys_address_area` VALUES (150721, 0, 100, 150700, '阿荣旗');
INSERT INTO `sys_address_area` VALUES (150722, 0, 100, 150700, '莫力达瓦达斡尔族自治旗');
INSERT INTO `sys_address_area` VALUES (150723, 0, 100, 150700, '鄂伦春自治旗');
INSERT INTO `sys_address_area` VALUES (150724, 0, 100, 150700, '鄂温克族自治旗');
INSERT INTO `sys_address_area` VALUES (150725, 0, 100, 150700, '陈巴尔虎旗');
INSERT INTO `sys_address_area` VALUES (150726, 0, 100, 150700, '新巴尔虎左旗');
INSERT INTO `sys_address_area` VALUES (150727, 0, 100, 150700, '新巴尔虎右旗');
INSERT INTO `sys_address_area` VALUES (150781, 0, 100, 150700, '满洲里市');
INSERT INTO `sys_address_area` VALUES (150782, 0, 100, 150700, '牙克石市');
INSERT INTO `sys_address_area` VALUES (150783, 0, 100, 150700, '扎兰屯市');
INSERT INTO `sys_address_area` VALUES (150784, 0, 100, 150700, '额尔古纳市');
INSERT INTO `sys_address_area` VALUES (150785, 0, 100, 150700, '根河市');
INSERT INTO `sys_address_area` VALUES (150801, 0, 100, 150800, '市辖区');
INSERT INTO `sys_address_area` VALUES (150802, 0, 100, 150800, '临河区');
INSERT INTO `sys_address_area` VALUES (150821, 0, 100, 150800, '五原县');
INSERT INTO `sys_address_area` VALUES (150822, 0, 100, 150800, '磴口县');
INSERT INTO `sys_address_area` VALUES (150823, 0, 100, 150800, '乌拉特前旗');
INSERT INTO `sys_address_area` VALUES (150824, 0, 100, 150800, '乌拉特中旗');
INSERT INTO `sys_address_area` VALUES (150825, 0, 100, 150800, '乌拉特后旗');
INSERT INTO `sys_address_area` VALUES (150826, 0, 100, 150800, '杭锦后旗');
INSERT INTO `sys_address_area` VALUES (150901, 0, 100, 150900, '市辖区');
INSERT INTO `sys_address_area` VALUES (150902, 0, 100, 150900, '集宁区');
INSERT INTO `sys_address_area` VALUES (150921, 0, 100, 150900, '卓资县');
INSERT INTO `sys_address_area` VALUES (150922, 0, 100, 150900, '化德县');
INSERT INTO `sys_address_area` VALUES (150923, 0, 100, 150900, '商都县');
INSERT INTO `sys_address_area` VALUES (150924, 0, 100, 150900, '兴和县');
INSERT INTO `sys_address_area` VALUES (150925, 0, 100, 150900, '凉城县');
INSERT INTO `sys_address_area` VALUES (150926, 0, 100, 150900, '察哈尔右翼前旗');
INSERT INTO `sys_address_area` VALUES (150927, 0, 100, 150900, '察哈尔右翼中旗');
INSERT INTO `sys_address_area` VALUES (150928, 0, 100, 150900, '察哈尔右翼后旗');
INSERT INTO `sys_address_area` VALUES (150929, 0, 100, 150900, '四子王旗');
INSERT INTO `sys_address_area` VALUES (150981, 0, 100, 150900, '丰镇市');
INSERT INTO `sys_address_area` VALUES (152201, 0, 100, 152200, '乌兰浩特市');
INSERT INTO `sys_address_area` VALUES (152202, 0, 100, 152200, '阿尔山市');
INSERT INTO `sys_address_area` VALUES (152221, 0, 100, 152200, '科尔沁右翼前旗');
INSERT INTO `sys_address_area` VALUES (152222, 0, 100, 152200, '科尔沁右翼中旗');
INSERT INTO `sys_address_area` VALUES (152223, 0, 100, 152200, '扎赉特旗');
INSERT INTO `sys_address_area` VALUES (152224, 0, 100, 152200, '突泉县');
INSERT INTO `sys_address_area` VALUES (152501, 0, 100, 152500, '二连浩特市');
INSERT INTO `sys_address_area` VALUES (152502, 0, 100, 152500, '锡林浩特市');
INSERT INTO `sys_address_area` VALUES (152522, 0, 100, 152500, '阿巴嘎旗');
INSERT INTO `sys_address_area` VALUES (152523, 0, 100, 152500, '苏尼特左旗');
INSERT INTO `sys_address_area` VALUES (152524, 0, 100, 152500, '苏尼特右旗');
INSERT INTO `sys_address_area` VALUES (152525, 0, 100, 152500, '东乌珠穆沁旗');
INSERT INTO `sys_address_area` VALUES (152526, 0, 100, 152500, '西乌珠穆沁旗');
INSERT INTO `sys_address_area` VALUES (152527, 0, 100, 152500, '太仆寺旗');
INSERT INTO `sys_address_area` VALUES (152528, 0, 100, 152500, '镶黄旗');
INSERT INTO `sys_address_area` VALUES (152529, 0, 100, 152500, '正镶白旗');
INSERT INTO `sys_address_area` VALUES (152530, 0, 100, 152500, '正蓝旗');
INSERT INTO `sys_address_area` VALUES (152531, 0, 100, 152500, '多伦县');
INSERT INTO `sys_address_area` VALUES (152921, 0, 100, 152900, '阿拉善左旗');
INSERT INTO `sys_address_area` VALUES (152922, 0, 100, 152900, '阿拉善右旗');
INSERT INTO `sys_address_area` VALUES (152923, 0, 100, 152900, '额济纳旗');
INSERT INTO `sys_address_area` VALUES (210101, 0, 100, 210100, '市辖区');
INSERT INTO `sys_address_area` VALUES (210102, 0, 100, 210100, '和平区');
INSERT INTO `sys_address_area` VALUES (210103, 0, 100, 210100, '沈河区');
INSERT INTO `sys_address_area` VALUES (210104, 0, 100, 210100, '大东区');
INSERT INTO `sys_address_area` VALUES (210105, 0, 100, 210100, '皇姑区');
INSERT INTO `sys_address_area` VALUES (210106, 0, 100, 210100, '铁西区');
INSERT INTO `sys_address_area` VALUES (210111, 0, 100, 210100, '苏家屯区');
INSERT INTO `sys_address_area` VALUES (210112, 0, 100, 210100, '东陵区');
INSERT INTO `sys_address_area` VALUES (210113, 0, 100, 210100, '新城子区');
INSERT INTO `sys_address_area` VALUES (210114, 0, 100, 210100, '于洪区');
INSERT INTO `sys_address_area` VALUES (210122, 0, 100, 210100, '辽中县');
INSERT INTO `sys_address_area` VALUES (210123, 0, 100, 210100, '康平县');
INSERT INTO `sys_address_area` VALUES (210124, 0, 100, 210100, '法库县');
INSERT INTO `sys_address_area` VALUES (210181, 0, 100, 210100, '新民市');
INSERT INTO `sys_address_area` VALUES (210201, 0, 100, 210200, '市辖区');
INSERT INTO `sys_address_area` VALUES (210202, 0, 100, 210200, '中山区');
INSERT INTO `sys_address_area` VALUES (210203, 0, 100, 210200, '西岗区');
INSERT INTO `sys_address_area` VALUES (210204, 0, 100, 210200, '沙河口区');
INSERT INTO `sys_address_area` VALUES (210211, 0, 100, 210200, '甘井子区');
INSERT INTO `sys_address_area` VALUES (210212, 0, 100, 210200, '旅顺口区');
INSERT INTO `sys_address_area` VALUES (210213, 0, 100, 210200, '金州区');
INSERT INTO `sys_address_area` VALUES (210224, 0, 100, 210200, '长海县');
INSERT INTO `sys_address_area` VALUES (210281, 0, 100, 210200, '瓦房店市');
INSERT INTO `sys_address_area` VALUES (210282, 0, 100, 210200, '普兰店市');
INSERT INTO `sys_address_area` VALUES (210283, 0, 100, 210200, '庄河市');
INSERT INTO `sys_address_area` VALUES (210301, 0, 100, 210300, '市辖区');
INSERT INTO `sys_address_area` VALUES (210302, 0, 100, 210300, '铁东区');
INSERT INTO `sys_address_area` VALUES (210303, 0, 100, 210300, '铁西区');
INSERT INTO `sys_address_area` VALUES (210304, 0, 100, 210300, '立山区');
INSERT INTO `sys_address_area` VALUES (210311, 0, 100, 210300, '千山区');
INSERT INTO `sys_address_area` VALUES (210321, 0, 100, 210300, '台安县');
INSERT INTO `sys_address_area` VALUES (210323, 0, 100, 210300, '岫岩满族自治县');
INSERT INTO `sys_address_area` VALUES (210381, 0, 100, 210300, '海城市');
INSERT INTO `sys_address_area` VALUES (210401, 0, 100, 210400, '市辖区');
INSERT INTO `sys_address_area` VALUES (210402, 0, 100, 210400, '新抚区');
INSERT INTO `sys_address_area` VALUES (210403, 0, 100, 210400, '东洲区');
INSERT INTO `sys_address_area` VALUES (210404, 0, 100, 210400, '望花区');
INSERT INTO `sys_address_area` VALUES (210411, 0, 100, 210400, '顺城区');
INSERT INTO `sys_address_area` VALUES (210421, 0, 100, 210400, '抚顺县');
INSERT INTO `sys_address_area` VALUES (210422, 0, 100, 210400, '新宾满族自治县');
INSERT INTO `sys_address_area` VALUES (210423, 0, 100, 210400, '清原满族自治县');
INSERT INTO `sys_address_area` VALUES (210501, 0, 100, 210500, '市辖区');
INSERT INTO `sys_address_area` VALUES (210502, 0, 100, 210500, '平山区');
INSERT INTO `sys_address_area` VALUES (210503, 0, 100, 210500, '溪湖区');
INSERT INTO `sys_address_area` VALUES (210504, 0, 100, 210500, '明山区');
INSERT INTO `sys_address_area` VALUES (210505, 0, 100, 210500, '南芬区');
INSERT INTO `sys_address_area` VALUES (210521, 0, 100, 210500, '本溪满族自治县');
INSERT INTO `sys_address_area` VALUES (210522, 0, 100, 210500, '桓仁满族自治县');
INSERT INTO `sys_address_area` VALUES (210601, 0, 100, 210600, '市辖区');
INSERT INTO `sys_address_area` VALUES (210602, 0, 100, 210600, '元宝区');
INSERT INTO `sys_address_area` VALUES (210603, 0, 100, 210600, '振兴区');
INSERT INTO `sys_address_area` VALUES (210604, 0, 100, 210600, '振安区');
INSERT INTO `sys_address_area` VALUES (210624, 0, 100, 210600, '宽甸满族自治县');
INSERT INTO `sys_address_area` VALUES (210681, 0, 100, 210600, '东港市');
INSERT INTO `sys_address_area` VALUES (210682, 0, 100, 210600, '凤城市');
INSERT INTO `sys_address_area` VALUES (210701, 0, 100, 210700, '市辖区');
INSERT INTO `sys_address_area` VALUES (210702, 0, 100, 210700, '古塔区');
INSERT INTO `sys_address_area` VALUES (210703, 0, 100, 210700, '凌河区');
INSERT INTO `sys_address_area` VALUES (210711, 0, 100, 210700, '太和区');
INSERT INTO `sys_address_area` VALUES (210726, 0, 100, 210700, '黑山县');
INSERT INTO `sys_address_area` VALUES (210727, 0, 100, 210700, '义　县');
INSERT INTO `sys_address_area` VALUES (210781, 0, 100, 210700, '凌海市');
INSERT INTO `sys_address_area` VALUES (210782, 0, 100, 210700, '北宁市');
INSERT INTO `sys_address_area` VALUES (210801, 0, 100, 210800, '市辖区');
INSERT INTO `sys_address_area` VALUES (210802, 0, 100, 210800, '站前区');
INSERT INTO `sys_address_area` VALUES (210803, 0, 100, 210800, '西市区');
INSERT INTO `sys_address_area` VALUES (210804, 0, 100, 210800, '鲅鱼圈区');
INSERT INTO `sys_address_area` VALUES (210811, 0, 100, 210800, '老边区');
INSERT INTO `sys_address_area` VALUES (210881, 0, 100, 210800, '盖州市');
INSERT INTO `sys_address_area` VALUES (210882, 0, 100, 210800, '大石桥市');
INSERT INTO `sys_address_area` VALUES (210901, 0, 100, 210900, '市辖区');
INSERT INTO `sys_address_area` VALUES (210902, 0, 100, 210900, '海州区');
INSERT INTO `sys_address_area` VALUES (210903, 0, 100, 210900, '新邱区');
INSERT INTO `sys_address_area` VALUES (210904, 0, 100, 210900, '太平区');
INSERT INTO `sys_address_area` VALUES (210905, 0, 100, 210900, '清河门区');
INSERT INTO `sys_address_area` VALUES (210911, 0, 100, 210900, '细河区');
INSERT INTO `sys_address_area` VALUES (210921, 0, 100, 210900, '阜新蒙古族自治县');
INSERT INTO `sys_address_area` VALUES (210922, 0, 100, 210900, '彰武县');
INSERT INTO `sys_address_area` VALUES (211001, 0, 100, 211000, '市辖区');
INSERT INTO `sys_address_area` VALUES (211002, 0, 100, 211000, '白塔区');
INSERT INTO `sys_address_area` VALUES (211003, 0, 100, 211000, '文圣区');
INSERT INTO `sys_address_area` VALUES (211004, 0, 100, 211000, '宏伟区');
INSERT INTO `sys_address_area` VALUES (211005, 0, 100, 211000, '弓长岭区');
INSERT INTO `sys_address_area` VALUES (211011, 0, 100, 211000, '太子河区');
INSERT INTO `sys_address_area` VALUES (211021, 0, 100, 211000, '辽阳县');
INSERT INTO `sys_address_area` VALUES (211081, 0, 100, 211000, '灯塔市');
INSERT INTO `sys_address_area` VALUES (211101, 0, 100, 211100, '市辖区');
INSERT INTO `sys_address_area` VALUES (211102, 0, 100, 211100, '双台子区');
INSERT INTO `sys_address_area` VALUES (211103, 0, 100, 211100, '兴隆台区');
INSERT INTO `sys_address_area` VALUES (211121, 0, 100, 211100, '大洼县');
INSERT INTO `sys_address_area` VALUES (211122, 0, 100, 211100, '盘山县');
INSERT INTO `sys_address_area` VALUES (211201, 0, 100, 211200, '市辖区');
INSERT INTO `sys_address_area` VALUES (211202, 0, 100, 211200, '银州区');
INSERT INTO `sys_address_area` VALUES (211204, 0, 100, 211200, '清河区');
INSERT INTO `sys_address_area` VALUES (211221, 0, 100, 211200, '铁岭县');
INSERT INTO `sys_address_area` VALUES (211223, 0, 100, 211200, '西丰县');
INSERT INTO `sys_address_area` VALUES (211224, 0, 100, 211200, '昌图县');
INSERT INTO `sys_address_area` VALUES (211281, 0, 100, 211200, '调兵山市');
INSERT INTO `sys_address_area` VALUES (211282, 0, 100, 211200, '开原市');
INSERT INTO `sys_address_area` VALUES (211301, 0, 100, 211300, '市辖区');
INSERT INTO `sys_address_area` VALUES (211302, 0, 100, 211300, '双塔区');
INSERT INTO `sys_address_area` VALUES (211303, 0, 100, 211300, '龙城区');
INSERT INTO `sys_address_area` VALUES (211321, 0, 100, 211300, '朝阳县');
INSERT INTO `sys_address_area` VALUES (211322, 0, 100, 211300, '建平县');
INSERT INTO `sys_address_area` VALUES (211324, 0, 100, 211300, '喀喇沁左翼蒙古族自治县');
INSERT INTO `sys_address_area` VALUES (211381, 0, 100, 211300, '北票市');
INSERT INTO `sys_address_area` VALUES (211382, 0, 100, 211300, '凌源市');
INSERT INTO `sys_address_area` VALUES (211401, 0, 100, 211400, '市辖区');
INSERT INTO `sys_address_area` VALUES (211402, 0, 100, 211400, '连山区');
INSERT INTO `sys_address_area` VALUES (211403, 0, 100, 211400, '龙港区');
INSERT INTO `sys_address_area` VALUES (211404, 0, 100, 211400, '南票区');
INSERT INTO `sys_address_area` VALUES (211421, 0, 100, 211400, '绥中县');
INSERT INTO `sys_address_area` VALUES (211422, 0, 100, 211400, '建昌县');
INSERT INTO `sys_address_area` VALUES (211481, 0, 100, 211400, '兴城市');
INSERT INTO `sys_address_area` VALUES (220101, 0, 100, 220100, '市辖区');
INSERT INTO `sys_address_area` VALUES (220102, 0, 100, 220100, '南关区');
INSERT INTO `sys_address_area` VALUES (220103, 0, 100, 220100, '宽城区');
INSERT INTO `sys_address_area` VALUES (220104, 0, 100, 220100, '朝阳区');
INSERT INTO `sys_address_area` VALUES (220105, 0, 100, 220100, '二道区');
INSERT INTO `sys_address_area` VALUES (220106, 0, 100, 220100, '绿园区');
INSERT INTO `sys_address_area` VALUES (220112, 0, 100, 220100, '双阳区');
INSERT INTO `sys_address_area` VALUES (220122, 0, 100, 220100, '农安县');
INSERT INTO `sys_address_area` VALUES (220181, 0, 100, 220100, '九台市');
INSERT INTO `sys_address_area` VALUES (220182, 0, 100, 220100, '榆树市');
INSERT INTO `sys_address_area` VALUES (220183, 0, 100, 220100, '德惠市');
INSERT INTO `sys_address_area` VALUES (220201, 0, 100, 220200, '市辖区');
INSERT INTO `sys_address_area` VALUES (220202, 0, 100, 220200, '昌邑区');
INSERT INTO `sys_address_area` VALUES (220203, 0, 100, 220200, '龙潭区');
INSERT INTO `sys_address_area` VALUES (220204, 0, 100, 220200, '船营区');
INSERT INTO `sys_address_area` VALUES (220211, 0, 100, 220200, '丰满区');
INSERT INTO `sys_address_area` VALUES (220221, 0, 100, 220200, '永吉县');
INSERT INTO `sys_address_area` VALUES (220281, 0, 100, 220200, '蛟河市');
INSERT INTO `sys_address_area` VALUES (220282, 0, 100, 220200, '桦甸市');
INSERT INTO `sys_address_area` VALUES (220283, 0, 100, 220200, '舒兰市');
INSERT INTO `sys_address_area` VALUES (220284, 0, 100, 220200, '磐石市');
INSERT INTO `sys_address_area` VALUES (220301, 0, 100, 220300, '市辖区');
INSERT INTO `sys_address_area` VALUES (220302, 0, 100, 220300, '铁西区');
INSERT INTO `sys_address_area` VALUES (220303, 0, 100, 220300, '铁东区');
INSERT INTO `sys_address_area` VALUES (220322, 0, 100, 220300, '梨树县');
INSERT INTO `sys_address_area` VALUES (220323, 0, 100, 220300, '伊通满族自治县');
INSERT INTO `sys_address_area` VALUES (220381, 0, 100, 220300, '公主岭市');
INSERT INTO `sys_address_area` VALUES (220382, 0, 100, 220300, '双辽市');
INSERT INTO `sys_address_area` VALUES (220401, 0, 100, 220400, '市辖区');
INSERT INTO `sys_address_area` VALUES (220402, 0, 100, 220400, '龙山区');
INSERT INTO `sys_address_area` VALUES (220403, 0, 100, 220400, '西安区');
INSERT INTO `sys_address_area` VALUES (220421, 0, 100, 220400, '东丰县');
INSERT INTO `sys_address_area` VALUES (220422, 0, 100, 220400, '东辽县');
INSERT INTO `sys_address_area` VALUES (220501, 0, 100, 220500, '市辖区');
INSERT INTO `sys_address_area` VALUES (220502, 0, 100, 220500, '东昌区');
INSERT INTO `sys_address_area` VALUES (220503, 0, 100, 220500, '二道江区');
INSERT INTO `sys_address_area` VALUES (220521, 0, 100, 220500, '通化县');
INSERT INTO `sys_address_area` VALUES (220523, 0, 100, 220500, '辉南县');
INSERT INTO `sys_address_area` VALUES (220524, 0, 100, 220500, '柳河县');
INSERT INTO `sys_address_area` VALUES (220581, 0, 100, 220500, '梅河口市');
INSERT INTO `sys_address_area` VALUES (220582, 0, 100, 220500, '集安市');
INSERT INTO `sys_address_area` VALUES (220601, 0, 100, 220600, '市辖区');
INSERT INTO `sys_address_area` VALUES (220602, 0, 100, 220600, '八道江区');
INSERT INTO `sys_address_area` VALUES (220621, 0, 100, 220600, '抚松县');
INSERT INTO `sys_address_area` VALUES (220622, 0, 100, 220600, '靖宇县');
INSERT INTO `sys_address_area` VALUES (220623, 0, 100, 220600, '长白朝鲜族自治县');
INSERT INTO `sys_address_area` VALUES (220625, 0, 100, 220600, '江源县');
INSERT INTO `sys_address_area` VALUES (220681, 0, 100, 220600, '临江市');
INSERT INTO `sys_address_area` VALUES (220701, 0, 100, 220700, '市辖区');
INSERT INTO `sys_address_area` VALUES (220702, 0, 100, 220700, '宁江区');
INSERT INTO `sys_address_area` VALUES (220721, 0, 100, 220700, '前郭尔罗斯蒙古族自治县');
INSERT INTO `sys_address_area` VALUES (220722, 0, 100, 220700, '长岭县');
INSERT INTO `sys_address_area` VALUES (220723, 0, 100, 220700, '乾安县');
INSERT INTO `sys_address_area` VALUES (220724, 0, 100, 220700, '扶余县');
INSERT INTO `sys_address_area` VALUES (220801, 0, 100, 220800, '市辖区');
INSERT INTO `sys_address_area` VALUES (220802, 0, 100, 220800, '洮北区');
INSERT INTO `sys_address_area` VALUES (220821, 0, 100, 220800, '镇赉县');
INSERT INTO `sys_address_area` VALUES (220822, 0, 100, 220800, '通榆县');
INSERT INTO `sys_address_area` VALUES (220881, 0, 100, 220800, '洮南市');
INSERT INTO `sys_address_area` VALUES (220882, 0, 100, 220800, '大安市');
INSERT INTO `sys_address_area` VALUES (222401, 0, 100, 222400, '延吉市');
INSERT INTO `sys_address_area` VALUES (222402, 0, 100, 222400, '图们市');
INSERT INTO `sys_address_area` VALUES (222403, 0, 100, 222400, '敦化市');
INSERT INTO `sys_address_area` VALUES (222404, 0, 100, 222400, '珲春市');
INSERT INTO `sys_address_area` VALUES (222405, 0, 100, 222400, '龙井市');
INSERT INTO `sys_address_area` VALUES (222406, 0, 100, 222400, '和龙市');
INSERT INTO `sys_address_area` VALUES (222424, 0, 100, 222400, '汪清县');
INSERT INTO `sys_address_area` VALUES (222426, 0, 100, 222400, '安图县');
INSERT INTO `sys_address_area` VALUES (230101, 0, 100, 230100, '市辖区');
INSERT INTO `sys_address_area` VALUES (230102, 0, 100, 230100, '道里区');
INSERT INTO `sys_address_area` VALUES (230103, 0, 100, 230100, '南岗区');
INSERT INTO `sys_address_area` VALUES (230104, 0, 100, 230100, '道外区');
INSERT INTO `sys_address_area` VALUES (230106, 0, 100, 230100, '香坊区');
INSERT INTO `sys_address_area` VALUES (230107, 0, 100, 230100, '动力区');
INSERT INTO `sys_address_area` VALUES (230108, 0, 100, 230100, '平房区');
INSERT INTO `sys_address_area` VALUES (230109, 0, 100, 230100, '松北区');
INSERT INTO `sys_address_area` VALUES (230111, 0, 100, 230100, '呼兰区');
INSERT INTO `sys_address_area` VALUES (230123, 0, 100, 230100, '依兰县');
INSERT INTO `sys_address_area` VALUES (230124, 0, 100, 230100, '方正县');
INSERT INTO `sys_address_area` VALUES (230125, 0, 100, 230100, '宾　县');
INSERT INTO `sys_address_area` VALUES (230126, 0, 100, 230100, '巴彦县');
INSERT INTO `sys_address_area` VALUES (230127, 0, 100, 230100, '木兰县');
INSERT INTO `sys_address_area` VALUES (230128, 0, 100, 230100, '通河县');
INSERT INTO `sys_address_area` VALUES (230129, 0, 100, 230100, '延寿县');
INSERT INTO `sys_address_area` VALUES (230181, 0, 100, 230100, '阿城市');
INSERT INTO `sys_address_area` VALUES (230182, 0, 100, 230100, '双城市');
INSERT INTO `sys_address_area` VALUES (230183, 0, 100, 230100, '尚志市');
INSERT INTO `sys_address_area` VALUES (230184, 0, 100, 230100, '五常市');
INSERT INTO `sys_address_area` VALUES (230201, 0, 100, 230200, '市辖区');
INSERT INTO `sys_address_area` VALUES (230202, 0, 100, 230200, '龙沙区');
INSERT INTO `sys_address_area` VALUES (230203, 0, 100, 230200, '建华区');
INSERT INTO `sys_address_area` VALUES (230204, 0, 100, 230200, '铁锋区');
INSERT INTO `sys_address_area` VALUES (230205, 0, 100, 230200, '昂昂溪区');
INSERT INTO `sys_address_area` VALUES (230206, 0, 100, 230200, '富拉尔基区');
INSERT INTO `sys_address_area` VALUES (230207, 0, 100, 230200, '碾子山区');
INSERT INTO `sys_address_area` VALUES (230208, 0, 100, 230200, '梅里斯达斡尔族区');
INSERT INTO `sys_address_area` VALUES (230221, 0, 100, 230200, '龙江县');
INSERT INTO `sys_address_area` VALUES (230223, 0, 100, 230200, '依安县');
INSERT INTO `sys_address_area` VALUES (230224, 0, 100, 230200, '泰来县');
INSERT INTO `sys_address_area` VALUES (230225, 0, 100, 230200, '甘南县');
INSERT INTO `sys_address_area` VALUES (230227, 0, 100, 230200, '富裕县');
INSERT INTO `sys_address_area` VALUES (230229, 0, 100, 230200, '克山县');
INSERT INTO `sys_address_area` VALUES (230230, 0, 100, 230200, '克东县');
INSERT INTO `sys_address_area` VALUES (230231, 0, 100, 230200, '拜泉县');
INSERT INTO `sys_address_area` VALUES (230281, 0, 100, 230200, '讷河市');
INSERT INTO `sys_address_area` VALUES (230301, 0, 100, 230300, '市辖区');
INSERT INTO `sys_address_area` VALUES (230302, 0, 100, 230300, '鸡冠区');
INSERT INTO `sys_address_area` VALUES (230303, 0, 100, 230300, '恒山区');
INSERT INTO `sys_address_area` VALUES (230304, 0, 100, 230300, '滴道区');
INSERT INTO `sys_address_area` VALUES (230305, 0, 100, 230300, '梨树区');
INSERT INTO `sys_address_area` VALUES (230306, 0, 100, 230300, '城子河区');
INSERT INTO `sys_address_area` VALUES (230307, 0, 100, 230300, '麻山区');
INSERT INTO `sys_address_area` VALUES (230321, 0, 100, 230300, '鸡东县');
INSERT INTO `sys_address_area` VALUES (230381, 0, 100, 230300, '虎林市');
INSERT INTO `sys_address_area` VALUES (230382, 0, 100, 230300, '密山市');
INSERT INTO `sys_address_area` VALUES (230401, 0, 100, 230400, '市辖区');
INSERT INTO `sys_address_area` VALUES (230402, 0, 100, 230400, '向阳区');
INSERT INTO `sys_address_area` VALUES (230403, 0, 100, 230400, '工农区');
INSERT INTO `sys_address_area` VALUES (230404, 0, 100, 230400, '南山区');
INSERT INTO `sys_address_area` VALUES (230405, 0, 100, 230400, '兴安区');
INSERT INTO `sys_address_area` VALUES (230406, 0, 100, 230400, '东山区');
INSERT INTO `sys_address_area` VALUES (230407, 0, 100, 230400, '兴山区');
INSERT INTO `sys_address_area` VALUES (230421, 0, 100, 230400, '萝北县');
INSERT INTO `sys_address_area` VALUES (230422, 0, 100, 230400, '绥滨县');
INSERT INTO `sys_address_area` VALUES (230501, 0, 100, 230500, '市辖区');
INSERT INTO `sys_address_area` VALUES (230502, 0, 100, 230500, '尖山区');
INSERT INTO `sys_address_area` VALUES (230503, 0, 100, 230500, '岭东区');
INSERT INTO `sys_address_area` VALUES (230505, 0, 100, 230500, '四方台区');
INSERT INTO `sys_address_area` VALUES (230506, 0, 100, 230500, '宝山区');
INSERT INTO `sys_address_area` VALUES (230521, 0, 100, 230500, '集贤县');
INSERT INTO `sys_address_area` VALUES (230522, 0, 100, 230500, '友谊县');
INSERT INTO `sys_address_area` VALUES (230523, 0, 100, 230500, '宝清县');
INSERT INTO `sys_address_area` VALUES (230524, 0, 100, 230500, '饶河县');
INSERT INTO `sys_address_area` VALUES (230601, 0, 100, 230600, '市辖区');
INSERT INTO `sys_address_area` VALUES (230602, 0, 100, 230600, '萨尔图区');
INSERT INTO `sys_address_area` VALUES (230603, 0, 100, 230600, '龙凤区');
INSERT INTO `sys_address_area` VALUES (230604, 0, 100, 230600, '让胡路区');
INSERT INTO `sys_address_area` VALUES (230605, 0, 100, 230600, '红岗区');
INSERT INTO `sys_address_area` VALUES (230606, 0, 100, 230600, '大同区');
INSERT INTO `sys_address_area` VALUES (230621, 0, 100, 230600, '肇州县');
INSERT INTO `sys_address_area` VALUES (230622, 0, 100, 230600, '肇源县');
INSERT INTO `sys_address_area` VALUES (230623, 0, 100, 230600, '林甸县');
INSERT INTO `sys_address_area` VALUES (230624, 0, 100, 230600, '杜尔伯特蒙古族自治县');
INSERT INTO `sys_address_area` VALUES (230701, 0, 100, 230700, '市辖区');
INSERT INTO `sys_address_area` VALUES (230702, 0, 100, 230700, '伊春区');
INSERT INTO `sys_address_area` VALUES (230703, 0, 100, 230700, '南岔区');
INSERT INTO `sys_address_area` VALUES (230704, 0, 100, 230700, '友好区');
INSERT INTO `sys_address_area` VALUES (230705, 0, 100, 230700, '西林区');
INSERT INTO `sys_address_area` VALUES (230706, 0, 100, 230700, '翠峦区');
INSERT INTO `sys_address_area` VALUES (230707, 0, 100, 230700, '新青区');
INSERT INTO `sys_address_area` VALUES (230708, 0, 100, 230700, '美溪区');
INSERT INTO `sys_address_area` VALUES (230709, 0, 100, 230700, '金山屯区');
INSERT INTO `sys_address_area` VALUES (230710, 0, 100, 230700, '五营区');
INSERT INTO `sys_address_area` VALUES (230711, 0, 100, 230700, '乌马河区');
INSERT INTO `sys_address_area` VALUES (230712, 0, 100, 230700, '汤旺河区');
INSERT INTO `sys_address_area` VALUES (230713, 0, 100, 230700, '带岭区');
INSERT INTO `sys_address_area` VALUES (230714, 0, 100, 230700, '乌伊岭区');
INSERT INTO `sys_address_area` VALUES (230715, 0, 100, 230700, '红星区');
INSERT INTO `sys_address_area` VALUES (230716, 0, 100, 230700, '上甘岭区');
INSERT INTO `sys_address_area` VALUES (230722, 0, 100, 230700, '嘉荫县');
INSERT INTO `sys_address_area` VALUES (230781, 0, 100, 230700, '铁力市');
INSERT INTO `sys_address_area` VALUES (230801, 0, 100, 230800, '市辖区');
INSERT INTO `sys_address_area` VALUES (230802, 0, 100, 230800, '永红区');
INSERT INTO `sys_address_area` VALUES (230803, 0, 100, 230800, '向阳区');
INSERT INTO `sys_address_area` VALUES (230804, 0, 100, 230800, '前进区');
INSERT INTO `sys_address_area` VALUES (230805, 0, 100, 230800, '东风区');
INSERT INTO `sys_address_area` VALUES (230811, 0, 100, 230800, '郊　区');
INSERT INTO `sys_address_area` VALUES (230822, 0, 100, 230800, '桦南县');
INSERT INTO `sys_address_area` VALUES (230826, 0, 100, 230800, '桦川县');
INSERT INTO `sys_address_area` VALUES (230828, 0, 100, 230800, '汤原县');
INSERT INTO `sys_address_area` VALUES (230833, 0, 100, 230800, '抚远县');
INSERT INTO `sys_address_area` VALUES (230881, 0, 100, 230800, '同江市');
INSERT INTO `sys_address_area` VALUES (230882, 0, 100, 230800, '富锦市');
INSERT INTO `sys_address_area` VALUES (230901, 0, 100, 230900, '市辖区');
INSERT INTO `sys_address_area` VALUES (230902, 0, 100, 230900, '新兴区');
INSERT INTO `sys_address_area` VALUES (230903, 0, 100, 230900, '桃山区');
INSERT INTO `sys_address_area` VALUES (230904, 0, 100, 230900, '茄子河区');
INSERT INTO `sys_address_area` VALUES (230921, 0, 100, 230900, '勃利县');
INSERT INTO `sys_address_area` VALUES (231001, 0, 100, 231000, '市辖区');
INSERT INTO `sys_address_area` VALUES (231002, 0, 100, 231000, '东安区');
INSERT INTO `sys_address_area` VALUES (231003, 0, 100, 231000, '阳明区');
INSERT INTO `sys_address_area` VALUES (231004, 0, 100, 231000, '爱民区');
INSERT INTO `sys_address_area` VALUES (231005, 0, 100, 231000, '西安区');
INSERT INTO `sys_address_area` VALUES (231024, 0, 100, 231000, '东宁县');
INSERT INTO `sys_address_area` VALUES (231025, 0, 100, 231000, '林口县');
INSERT INTO `sys_address_area` VALUES (231081, 0, 100, 231000, '绥芬河市');
INSERT INTO `sys_address_area` VALUES (231083, 0, 100, 231000, '海林市');
INSERT INTO `sys_address_area` VALUES (231084, 0, 100, 231000, '宁安市');
INSERT INTO `sys_address_area` VALUES (231085, 0, 100, 231000, '穆棱市');
INSERT INTO `sys_address_area` VALUES (231101, 0, 100, 231100, '市辖区');
INSERT INTO `sys_address_area` VALUES (231102, 0, 100, 231100, '爱辉区');
INSERT INTO `sys_address_area` VALUES (231121, 0, 100, 231100, '嫩江县');
INSERT INTO `sys_address_area` VALUES (231123, 0, 100, 231100, '逊克县');
INSERT INTO `sys_address_area` VALUES (231124, 0, 100, 231100, '孙吴县');
INSERT INTO `sys_address_area` VALUES (231181, 0, 100, 231100, '北安市');
INSERT INTO `sys_address_area` VALUES (231182, 0, 100, 231100, '五大连池市');
INSERT INTO `sys_address_area` VALUES (231201, 0, 100, 231200, '市辖区');
INSERT INTO `sys_address_area` VALUES (231202, 0, 100, 231200, '北林区');
INSERT INTO `sys_address_area` VALUES (231221, 0, 100, 231200, '望奎县');
INSERT INTO `sys_address_area` VALUES (231222, 0, 100, 231200, '兰西县');
INSERT INTO `sys_address_area` VALUES (231223, 0, 100, 231200, '青冈县');
INSERT INTO `sys_address_area` VALUES (231224, 0, 100, 231200, '庆安县');
INSERT INTO `sys_address_area` VALUES (231225, 0, 100, 231200, '明水县');
INSERT INTO `sys_address_area` VALUES (231226, 0, 100, 231200, '绥棱县');
INSERT INTO `sys_address_area` VALUES (231281, 0, 100, 231200, '安达市');
INSERT INTO `sys_address_area` VALUES (231282, 0, 100, 231200, '肇东市');
INSERT INTO `sys_address_area` VALUES (231283, 0, 100, 231200, '海伦市');
INSERT INTO `sys_address_area` VALUES (232721, 0, 100, 232700, '呼玛县');
INSERT INTO `sys_address_area` VALUES (232722, 0, 100, 232700, '塔河县');
INSERT INTO `sys_address_area` VALUES (232723, 0, 100, 232700, '漠河县');
INSERT INTO `sys_address_area` VALUES (310101, 0, 100, 310100, '黄浦区');
INSERT INTO `sys_address_area` VALUES (310103, 0, 100, 310100, '卢湾区');
INSERT INTO `sys_address_area` VALUES (310104, 0, 100, 310100, '徐汇区');
INSERT INTO `sys_address_area` VALUES (310105, 0, 100, 310100, '长宁区');
INSERT INTO `sys_address_area` VALUES (310106, 0, 100, 310100, '静安区');
INSERT INTO `sys_address_area` VALUES (310107, 0, 100, 310100, '普陀区');
INSERT INTO `sys_address_area` VALUES (310108, 0, 100, 310100, '闸北区');
INSERT INTO `sys_address_area` VALUES (310109, 0, 100, 310100, '虹口区');
INSERT INTO `sys_address_area` VALUES (310110, 0, 100, 310100, '杨浦区');
INSERT INTO `sys_address_area` VALUES (310112, 0, 100, 310100, '闵行区');
INSERT INTO `sys_address_area` VALUES (310113, 0, 100, 310100, '宝山区');
INSERT INTO `sys_address_area` VALUES (310114, 0, 100, 310100, '嘉定区');
INSERT INTO `sys_address_area` VALUES (310115, 0, 100, 310100, '浦东新区');
INSERT INTO `sys_address_area` VALUES (310116, 0, 100, 310100, '金山区');
INSERT INTO `sys_address_area` VALUES (310117, 0, 100, 310100, '松江区');
INSERT INTO `sys_address_area` VALUES (310118, 0, 100, 310100, '青浦区');
INSERT INTO `sys_address_area` VALUES (310119, 0, 100, 310100, '南汇区');
INSERT INTO `sys_address_area` VALUES (310120, 0, 100, 310100, '奉贤区');
INSERT INTO `sys_address_area` VALUES (310230, 0, 100, 310200, '崇明县');
INSERT INTO `sys_address_area` VALUES (320101, 0, 100, 320100, '市辖区');
INSERT INTO `sys_address_area` VALUES (320102, 0, 100, 320100, '玄武区');
INSERT INTO `sys_address_area` VALUES (320103, 0, 100, 320100, '白下区');
INSERT INTO `sys_address_area` VALUES (320104, 0, 100, 320100, '秦淮区');
INSERT INTO `sys_address_area` VALUES (320105, 0, 100, 320100, '建邺区');
INSERT INTO `sys_address_area` VALUES (320106, 0, 100, 320100, '鼓楼区');
INSERT INTO `sys_address_area` VALUES (320107, 0, 100, 320100, '下关区');
INSERT INTO `sys_address_area` VALUES (320111, 0, 100, 320100, '浦口区');
INSERT INTO `sys_address_area` VALUES (320113, 0, 100, 320100, '栖霞区');
INSERT INTO `sys_address_area` VALUES (320114, 0, 100, 320100, '雨花台区');
INSERT INTO `sys_address_area` VALUES (320115, 0, 100, 320100, '江宁区');
INSERT INTO `sys_address_area` VALUES (320116, 0, 100, 320100, '六合区');
INSERT INTO `sys_address_area` VALUES (320124, 0, 100, 320100, '溧水县');
INSERT INTO `sys_address_area` VALUES (320125, 0, 100, 320100, '高淳县');
INSERT INTO `sys_address_area` VALUES (320201, 0, 100, 320200, '市辖区');
INSERT INTO `sys_address_area` VALUES (320202, 0, 100, 320200, '崇安区');
INSERT INTO `sys_address_area` VALUES (320203, 0, 100, 320200, '南长区');
INSERT INTO `sys_address_area` VALUES (320204, 0, 100, 320200, '北塘区');
INSERT INTO `sys_address_area` VALUES (320205, 0, 100, 320200, '锡山区');
INSERT INTO `sys_address_area` VALUES (320206, 0, 100, 320200, '惠山区');
INSERT INTO `sys_address_area` VALUES (320211, 0, 100, 320200, '滨湖区');
INSERT INTO `sys_address_area` VALUES (320281, 0, 100, 320200, '江阴市');
INSERT INTO `sys_address_area` VALUES (320282, 0, 100, 320200, '宜兴市');
INSERT INTO `sys_address_area` VALUES (320301, 0, 100, 320300, '市辖区');
INSERT INTO `sys_address_area` VALUES (320302, 0, 100, 320300, '鼓楼区');
INSERT INTO `sys_address_area` VALUES (320303, 0, 100, 320300, '云龙区');
INSERT INTO `sys_address_area` VALUES (320304, 0, 100, 320300, '九里区');
INSERT INTO `sys_address_area` VALUES (320305, 0, 100, 320300, '贾汪区');
INSERT INTO `sys_address_area` VALUES (320311, 0, 100, 320300, '泉山区');
INSERT INTO `sys_address_area` VALUES (320321, 0, 100, 320300, '丰　县');
INSERT INTO `sys_address_area` VALUES (320322, 0, 100, 320300, '沛　县');
INSERT INTO `sys_address_area` VALUES (320323, 0, 100, 320300, '铜山县');
INSERT INTO `sys_address_area` VALUES (320324, 0, 100, 320300, '睢宁县');
INSERT INTO `sys_address_area` VALUES (320381, 0, 100, 320300, '新沂市');
INSERT INTO `sys_address_area` VALUES (320382, 0, 100, 320300, '邳州市');
INSERT INTO `sys_address_area` VALUES (320401, 0, 100, 320400, '市辖区');
INSERT INTO `sys_address_area` VALUES (320402, 0, 100, 320400, '天宁区');
INSERT INTO `sys_address_area` VALUES (320404, 0, 100, 320400, '钟楼区');
INSERT INTO `sys_address_area` VALUES (320405, 0, 100, 320400, '戚墅堰区');
INSERT INTO `sys_address_area` VALUES (320411, 0, 100, 320400, '新北区');
INSERT INTO `sys_address_area` VALUES (320412, 0, 100, 320400, '武进区');
INSERT INTO `sys_address_area` VALUES (320481, 0, 100, 320400, '溧阳市');
INSERT INTO `sys_address_area` VALUES (320482, 0, 100, 320400, '金坛市');
INSERT INTO `sys_address_area` VALUES (320501, 0, 100, 320500, '市辖区');
INSERT INTO `sys_address_area` VALUES (320502, 0, 100, 320500, '沧浪区');
INSERT INTO `sys_address_area` VALUES (320503, 0, 100, 320500, '平江区');
INSERT INTO `sys_address_area` VALUES (320504, 0, 100, 320500, '金阊区');
INSERT INTO `sys_address_area` VALUES (320505, 0, 100, 320500, '虎丘区');
INSERT INTO `sys_address_area` VALUES (320506, 0, 100, 320500, '吴中区');
INSERT INTO `sys_address_area` VALUES (320507, 0, 100, 320500, '相城区');
INSERT INTO `sys_address_area` VALUES (320581, 0, 100, 320500, '常熟市');
INSERT INTO `sys_address_area` VALUES (320582, 0, 100, 320500, '张家港市');
INSERT INTO `sys_address_area` VALUES (320583, 0, 100, 320500, '昆山市');
INSERT INTO `sys_address_area` VALUES (320584, 0, 100, 320500, '吴江市');
INSERT INTO `sys_address_area` VALUES (320585, 0, 100, 320500, '太仓市');
INSERT INTO `sys_address_area` VALUES (320601, 0, 100, 320600, '市辖区');
INSERT INTO `sys_address_area` VALUES (320602, 0, 100, 320600, '崇川区');
INSERT INTO `sys_address_area` VALUES (320611, 0, 100, 320600, '港闸区');
INSERT INTO `sys_address_area` VALUES (320621, 0, 100, 320600, '海安县');
INSERT INTO `sys_address_area` VALUES (320623, 0, 100, 320600, '如东县');
INSERT INTO `sys_address_area` VALUES (320681, 0, 100, 320600, '启东市');
INSERT INTO `sys_address_area` VALUES (320682, 0, 100, 320600, '如皋市');
INSERT INTO `sys_address_area` VALUES (320683, 0, 100, 320600, '通州市');
INSERT INTO `sys_address_area` VALUES (320684, 0, 100, 320600, '海门市');
INSERT INTO `sys_address_area` VALUES (320701, 0, 100, 320700, '市辖区');
INSERT INTO `sys_address_area` VALUES (320703, 0, 100, 320700, '连云区');
INSERT INTO `sys_address_area` VALUES (320705, 0, 100, 320700, '新浦区');
INSERT INTO `sys_address_area` VALUES (320706, 0, 100, 320700, '海州区');
INSERT INTO `sys_address_area` VALUES (320721, 0, 100, 320700, '赣榆县');
INSERT INTO `sys_address_area` VALUES (320722, 0, 100, 320700, '东海县');
INSERT INTO `sys_address_area` VALUES (320723, 0, 100, 320700, '灌云县');
INSERT INTO `sys_address_area` VALUES (320724, 0, 100, 320700, '灌南县');
INSERT INTO `sys_address_area` VALUES (320801, 0, 100, 320800, '市辖区');
INSERT INTO `sys_address_area` VALUES (320802, 0, 100, 320800, '清河区');
INSERT INTO `sys_address_area` VALUES (320803, 0, 100, 320800, '楚州区');
INSERT INTO `sys_address_area` VALUES (320804, 0, 100, 320800, '淮阴区');
INSERT INTO `sys_address_area` VALUES (320811, 0, 100, 320800, '清浦区');
INSERT INTO `sys_address_area` VALUES (320826, 0, 100, 320800, '涟水县');
INSERT INTO `sys_address_area` VALUES (320829, 0, 100, 320800, '洪泽县');
INSERT INTO `sys_address_area` VALUES (320830, 0, 100, 320800, '盱眙县');
INSERT INTO `sys_address_area` VALUES (320831, 0, 100, 320800, '金湖县');
INSERT INTO `sys_address_area` VALUES (320901, 0, 100, 320900, '市辖区');
INSERT INTO `sys_address_area` VALUES (320902, 0, 100, 320900, '亭湖区');
INSERT INTO `sys_address_area` VALUES (320903, 0, 100, 320900, '盐都区');
INSERT INTO `sys_address_area` VALUES (320921, 0, 100, 320900, '响水县');
INSERT INTO `sys_address_area` VALUES (320922, 0, 100, 320900, '滨海县');
INSERT INTO `sys_address_area` VALUES (320923, 0, 100, 320900, '阜宁县');
INSERT INTO `sys_address_area` VALUES (320924, 0, 100, 320900, '射阳县');
INSERT INTO `sys_address_area` VALUES (320925, 0, 100, 320900, '建湖县');
INSERT INTO `sys_address_area` VALUES (320981, 0, 100, 320900, '东台市');
INSERT INTO `sys_address_area` VALUES (320982, 0, 100, 320900, '大丰市');
INSERT INTO `sys_address_area` VALUES (321001, 0, 100, 321000, '市辖区');
INSERT INTO `sys_address_area` VALUES (321002, 0, 100, 321000, '广陵区');
INSERT INTO `sys_address_area` VALUES (321003, 0, 100, 321000, '邗江区');
INSERT INTO `sys_address_area` VALUES (321011, 0, 100, 321000, '郊　区');
INSERT INTO `sys_address_area` VALUES (321023, 0, 100, 321000, '宝应县');
INSERT INTO `sys_address_area` VALUES (321081, 0, 100, 321000, '仪征市');
INSERT INTO `sys_address_area` VALUES (321084, 0, 100, 321000, '高邮市');
INSERT INTO `sys_address_area` VALUES (321088, 0, 100, 321000, '江都市');
INSERT INTO `sys_address_area` VALUES (321101, 0, 100, 321100, '市辖区');
INSERT INTO `sys_address_area` VALUES (321102, 0, 100, 321100, '京口区');
INSERT INTO `sys_address_area` VALUES (321111, 0, 100, 321100, '润州区');
INSERT INTO `sys_address_area` VALUES (321112, 0, 100, 321100, '丹徒区');
INSERT INTO `sys_address_area` VALUES (321181, 0, 100, 321100, '丹阳市');
INSERT INTO `sys_address_area` VALUES (321182, 0, 100, 321100, '扬中市');
INSERT INTO `sys_address_area` VALUES (321183, 0, 100, 321100, '句容市');
INSERT INTO `sys_address_area` VALUES (321201, 0, 100, 321200, '市辖区');
INSERT INTO `sys_address_area` VALUES (321202, 0, 100, 321200, '海陵区');
INSERT INTO `sys_address_area` VALUES (321203, 0, 100, 321200, '高港区');
INSERT INTO `sys_address_area` VALUES (321281, 0, 100, 321200, '兴化市');
INSERT INTO `sys_address_area` VALUES (321282, 0, 100, 321200, '靖江市');
INSERT INTO `sys_address_area` VALUES (321283, 0, 100, 321200, '泰兴市');
INSERT INTO `sys_address_area` VALUES (321284, 0, 100, 321200, '姜堰市');
INSERT INTO `sys_address_area` VALUES (321301, 0, 100, 321300, '市辖区');
INSERT INTO `sys_address_area` VALUES (321302, 0, 100, 321300, '宿城区');
INSERT INTO `sys_address_area` VALUES (321311, 0, 100, 321300, '宿豫区');
INSERT INTO `sys_address_area` VALUES (321322, 0, 100, 321300, '沭阳县');
INSERT INTO `sys_address_area` VALUES (321323, 0, 100, 321300, '泗阳县');
INSERT INTO `sys_address_area` VALUES (321324, 0, 100, 321300, '泗洪县');
INSERT INTO `sys_address_area` VALUES (330101, 0, 100, 330100, '市辖区');
INSERT INTO `sys_address_area` VALUES (330102, 0, 100, 330100, '上城区');
INSERT INTO `sys_address_area` VALUES (330103, 0, 100, 330100, '下城区');
INSERT INTO `sys_address_area` VALUES (330104, 0, 100, 330100, '江干区');
INSERT INTO `sys_address_area` VALUES (330105, 0, 100, 330100, '拱墅区');
INSERT INTO `sys_address_area` VALUES (330106, 0, 100, 330100, '西湖区');
INSERT INTO `sys_address_area` VALUES (330108, 0, 100, 330100, '滨江区');
INSERT INTO `sys_address_area` VALUES (330109, 0, 100, 330100, '萧山区');
INSERT INTO `sys_address_area` VALUES (330110, 0, 100, 330100, '余杭区');
INSERT INTO `sys_address_area` VALUES (330122, 0, 100, 330100, '桐庐县');
INSERT INTO `sys_address_area` VALUES (330127, 0, 100, 330100, '淳安县');
INSERT INTO `sys_address_area` VALUES (330182, 0, 100, 330100, '建德市');
INSERT INTO `sys_address_area` VALUES (330183, 0, 100, 330100, '富阳市');
INSERT INTO `sys_address_area` VALUES (330185, 0, 100, 330100, '临安市');
INSERT INTO `sys_address_area` VALUES (330201, 0, 100, 330200, '市辖区');
INSERT INTO `sys_address_area` VALUES (330203, 0, 100, 330200, '海曙区');
INSERT INTO `sys_address_area` VALUES (330204, 0, 100, 330200, '江东区');
INSERT INTO `sys_address_area` VALUES (330205, 0, 100, 330200, '江北区');
INSERT INTO `sys_address_area` VALUES (330206, 0, 100, 330200, '北仑区');
INSERT INTO `sys_address_area` VALUES (330211, 0, 100, 330200, '镇海区');
INSERT INTO `sys_address_area` VALUES (330212, 0, 100, 330200, '鄞州区');
INSERT INTO `sys_address_area` VALUES (330225, 0, 100, 330200, '象山县');
INSERT INTO `sys_address_area` VALUES (330226, 0, 100, 330200, '宁海县');
INSERT INTO `sys_address_area` VALUES (330281, 0, 100, 330200, '余姚市');
INSERT INTO `sys_address_area` VALUES (330282, 0, 100, 330200, '慈溪市');
INSERT INTO `sys_address_area` VALUES (330283, 0, 100, 330200, '奉化市');
INSERT INTO `sys_address_area` VALUES (330301, 0, 100, 330300, '市辖区');
INSERT INTO `sys_address_area` VALUES (330302, 0, 100, 330300, '鹿城区');
INSERT INTO `sys_address_area` VALUES (330303, 0, 100, 330300, '龙湾区');
INSERT INTO `sys_address_area` VALUES (330304, 0, 100, 330300, '瓯海区');
INSERT INTO `sys_address_area` VALUES (330322, 0, 100, 330300, '洞头县');
INSERT INTO `sys_address_area` VALUES (330324, 0, 100, 330300, '永嘉县');
INSERT INTO `sys_address_area` VALUES (330326, 0, 100, 330300, '平阳县');
INSERT INTO `sys_address_area` VALUES (330327, 0, 100, 330300, '苍南县');
INSERT INTO `sys_address_area` VALUES (330328, 0, 100, 330300, '文成县');
INSERT INTO `sys_address_area` VALUES (330329, 0, 100, 330300, '泰顺县');
INSERT INTO `sys_address_area` VALUES (330381, 0, 100, 330300, '瑞安市');
INSERT INTO `sys_address_area` VALUES (330382, 0, 100, 330300, '乐清市');
INSERT INTO `sys_address_area` VALUES (330401, 0, 100, 330400, '市辖区');
INSERT INTO `sys_address_area` VALUES (330402, 0, 100, 330400, '秀城区');
INSERT INTO `sys_address_area` VALUES (330411, 0, 100, 330400, '秀洲区');
INSERT INTO `sys_address_area` VALUES (330421, 0, 100, 330400, '嘉善县');
INSERT INTO `sys_address_area` VALUES (330424, 0, 100, 330400, '海盐县');
INSERT INTO `sys_address_area` VALUES (330481, 0, 100, 330400, '海宁市');
INSERT INTO `sys_address_area` VALUES (330482, 0, 100, 330400, '平湖市');
INSERT INTO `sys_address_area` VALUES (330483, 0, 100, 330400, '桐乡市');
INSERT INTO `sys_address_area` VALUES (330501, 0, 100, 330500, '市辖区');
INSERT INTO `sys_address_area` VALUES (330502, 0, 100, 330500, '吴兴区');
INSERT INTO `sys_address_area` VALUES (330503, 0, 100, 330500, '南浔区');
INSERT INTO `sys_address_area` VALUES (330521, 0, 100, 330500, '德清县');
INSERT INTO `sys_address_area` VALUES (330522, 0, 100, 330500, '长兴县');
INSERT INTO `sys_address_area` VALUES (330523, 0, 100, 330500, '安吉县');
INSERT INTO `sys_address_area` VALUES (330601, 0, 100, 330600, '市辖区');
INSERT INTO `sys_address_area` VALUES (330602, 0, 100, 330600, '越城区');
INSERT INTO `sys_address_area` VALUES (330621, 0, 100, 330600, '绍兴县');
INSERT INTO `sys_address_area` VALUES (330624, 0, 100, 330600, '新昌县');
INSERT INTO `sys_address_area` VALUES (330681, 0, 100, 330600, '诸暨市');
INSERT INTO `sys_address_area` VALUES (330682, 0, 100, 330600, '上虞市');
INSERT INTO `sys_address_area` VALUES (330683, 0, 100, 330600, '嵊州市');
INSERT INTO `sys_address_area` VALUES (330701, 0, 100, 330700, '市辖区');
INSERT INTO `sys_address_area` VALUES (330702, 0, 100, 330700, '婺城区');
INSERT INTO `sys_address_area` VALUES (330703, 0, 100, 330700, '金东区');
INSERT INTO `sys_address_area` VALUES (330723, 0, 100, 330700, '武义县');
INSERT INTO `sys_address_area` VALUES (330726, 0, 100, 330700, '浦江县');
INSERT INTO `sys_address_area` VALUES (330727, 0, 100, 330700, '磐安县');
INSERT INTO `sys_address_area` VALUES (330781, 0, 100, 330700, '兰溪市');
INSERT INTO `sys_address_area` VALUES (330782, 0, 100, 330700, '义乌市');
INSERT INTO `sys_address_area` VALUES (330783, 0, 100, 330700, '东阳市');
INSERT INTO `sys_address_area` VALUES (330784, 0, 100, 330700, '永康市');
INSERT INTO `sys_address_area` VALUES (330801, 0, 100, 330800, '市辖区');
INSERT INTO `sys_address_area` VALUES (330802, 0, 100, 330800, '柯城区');
INSERT INTO `sys_address_area` VALUES (330803, 0, 100, 330800, '衢江区');
INSERT INTO `sys_address_area` VALUES (330822, 0, 100, 330800, '常山县');
INSERT INTO `sys_address_area` VALUES (330824, 0, 100, 330800, '开化县');
INSERT INTO `sys_address_area` VALUES (330825, 0, 100, 330800, '龙游县');
INSERT INTO `sys_address_area` VALUES (330881, 0, 100, 330800, '江山市');
INSERT INTO `sys_address_area` VALUES (330901, 0, 100, 330900, '市辖区');
INSERT INTO `sys_address_area` VALUES (330902, 0, 100, 330900, '定海区');
INSERT INTO `sys_address_area` VALUES (330903, 0, 100, 330900, '普陀区');
INSERT INTO `sys_address_area` VALUES (330921, 0, 100, 330900, '岱山县');
INSERT INTO `sys_address_area` VALUES (330922, 0, 100, 330900, '嵊泗县');
INSERT INTO `sys_address_area` VALUES (331001, 0, 100, 331000, '市辖区');
INSERT INTO `sys_address_area` VALUES (331002, 0, 100, 331000, '椒江区');
INSERT INTO `sys_address_area` VALUES (331003, 0, 100, 331000, '黄岩区');
INSERT INTO `sys_address_area` VALUES (331004, 0, 100, 331000, '路桥区');
INSERT INTO `sys_address_area` VALUES (331021, 0, 100, 331000, '玉环县');
INSERT INTO `sys_address_area` VALUES (331022, 0, 100, 331000, '三门县');
INSERT INTO `sys_address_area` VALUES (331023, 0, 100, 331000, '天台县');
INSERT INTO `sys_address_area` VALUES (331024, 0, 100, 331000, '仙居县');
INSERT INTO `sys_address_area` VALUES (331081, 0, 100, 331000, '温岭市');
INSERT INTO `sys_address_area` VALUES (331082, 0, 100, 331000, '临海市');
INSERT INTO `sys_address_area` VALUES (331101, 0, 100, 331100, '市辖区');
INSERT INTO `sys_address_area` VALUES (331102, 0, 100, 331100, '莲都区');
INSERT INTO `sys_address_area` VALUES (331121, 0, 100, 331100, '青田县');
INSERT INTO `sys_address_area` VALUES (331122, 0, 100, 331100, '缙云县');
INSERT INTO `sys_address_area` VALUES (331123, 0, 100, 331100, '遂昌县');
INSERT INTO `sys_address_area` VALUES (331124, 0, 100, 331100, '松阳县');
INSERT INTO `sys_address_area` VALUES (331125, 0, 100, 331100, '云和县');
INSERT INTO `sys_address_area` VALUES (331126, 0, 100, 331100, '庆元县');
INSERT INTO `sys_address_area` VALUES (331127, 0, 100, 331100, '景宁畲族自治县');
INSERT INTO `sys_address_area` VALUES (331181, 0, 100, 331100, '龙泉市');
INSERT INTO `sys_address_area` VALUES (340101, 0, 100, 340100, '市辖区');
INSERT INTO `sys_address_area` VALUES (340102, 0, 100, 340100, '瑶海区');
INSERT INTO `sys_address_area` VALUES (340103, 0, 100, 340100, '庐阳区');
INSERT INTO `sys_address_area` VALUES (340104, 0, 100, 340100, '蜀山区');
INSERT INTO `sys_address_area` VALUES (340111, 0, 100, 340100, '包河区');
INSERT INTO `sys_address_area` VALUES (340121, 0, 100, 340100, '长丰县');
INSERT INTO `sys_address_area` VALUES (340122, 0, 100, 340100, '肥东县');
INSERT INTO `sys_address_area` VALUES (340123, 0, 100, 340100, '肥西县');
INSERT INTO `sys_address_area` VALUES (340201, 0, 100, 340200, '市辖区');
INSERT INTO `sys_address_area` VALUES (340202, 0, 100, 340200, '镜湖区');
INSERT INTO `sys_address_area` VALUES (340203, 0, 100, 340200, '马塘区');
INSERT INTO `sys_address_area` VALUES (340204, 0, 100, 340200, '新芜区');
INSERT INTO `sys_address_area` VALUES (340207, 0, 100, 340200, '鸠江区');
INSERT INTO `sys_address_area` VALUES (340221, 0, 100, 340200, '芜湖县');
INSERT INTO `sys_address_area` VALUES (340222, 0, 100, 340200, '繁昌县');
INSERT INTO `sys_address_area` VALUES (340223, 0, 100, 340200, '南陵县');
INSERT INTO `sys_address_area` VALUES (340301, 0, 100, 340300, '市辖区');
INSERT INTO `sys_address_area` VALUES (340302, 0, 100, 340300, '龙子湖区');
INSERT INTO `sys_address_area` VALUES (340303, 0, 100, 340300, '蚌山区');
INSERT INTO `sys_address_area` VALUES (340304, 0, 100, 340300, '禹会区');
INSERT INTO `sys_address_area` VALUES (340311, 0, 100, 340300, '淮上区');
INSERT INTO `sys_address_area` VALUES (340321, 0, 100, 340300, '怀远县');
INSERT INTO `sys_address_area` VALUES (340322, 0, 100, 340300, '五河县');
INSERT INTO `sys_address_area` VALUES (340323, 0, 100, 340300, '固镇县');
INSERT INTO `sys_address_area` VALUES (340401, 0, 100, 340400, '市辖区');
INSERT INTO `sys_address_area` VALUES (340402, 0, 100, 340400, '大通区');
INSERT INTO `sys_address_area` VALUES (340403, 0, 100, 340400, '田家庵区');
INSERT INTO `sys_address_area` VALUES (340404, 0, 100, 340400, '谢家集区');
INSERT INTO `sys_address_area` VALUES (340405, 0, 100, 340400, '八公山区');
INSERT INTO `sys_address_area` VALUES (340406, 0, 100, 340400, '潘集区');
INSERT INTO `sys_address_area` VALUES (340421, 0, 100, 340400, '凤台县');
INSERT INTO `sys_address_area` VALUES (340501, 0, 100, 340500, '市辖区');
INSERT INTO `sys_address_area` VALUES (340502, 0, 100, 340500, '金家庄区');
INSERT INTO `sys_address_area` VALUES (340503, 0, 100, 340500, '花山区');
INSERT INTO `sys_address_area` VALUES (340504, 0, 100, 340500, '雨山区');
INSERT INTO `sys_address_area` VALUES (340521, 0, 100, 340500, '当涂县');
INSERT INTO `sys_address_area` VALUES (340601, 0, 100, 340600, '市辖区');
INSERT INTO `sys_address_area` VALUES (340602, 0, 100, 340600, '杜集区');
INSERT INTO `sys_address_area` VALUES (340603, 0, 100, 340600, '相山区');
INSERT INTO `sys_address_area` VALUES (340604, 0, 100, 340600, '烈山区');
INSERT INTO `sys_address_area` VALUES (340621, 0, 100, 340600, '濉溪县');
INSERT INTO `sys_address_area` VALUES (340701, 0, 100, 340700, '市辖区');
INSERT INTO `sys_address_area` VALUES (340702, 0, 100, 340700, '铜官山区');
INSERT INTO `sys_address_area` VALUES (340703, 0, 100, 340700, '狮子山区');
INSERT INTO `sys_address_area` VALUES (340711, 0, 100, 340700, '郊　区');
INSERT INTO `sys_address_area` VALUES (340721, 0, 100, 340700, '铜陵县');
INSERT INTO `sys_address_area` VALUES (340801, 0, 100, 340800, '市辖区');
INSERT INTO `sys_address_area` VALUES (340802, 0, 100, 340800, '迎江区');
INSERT INTO `sys_address_area` VALUES (340803, 0, 100, 340800, '大观区');
INSERT INTO `sys_address_area` VALUES (340811, 0, 100, 340800, '郊　区');
INSERT INTO `sys_address_area` VALUES (340822, 0, 100, 340800, '怀宁县');
INSERT INTO `sys_address_area` VALUES (340823, 0, 100, 340800, '枞阳县');
INSERT INTO `sys_address_area` VALUES (340824, 0, 100, 340800, '潜山县');
INSERT INTO `sys_address_area` VALUES (340825, 0, 100, 340800, '太湖县');
INSERT INTO `sys_address_area` VALUES (340826, 0, 100, 340800, '宿松县');
INSERT INTO `sys_address_area` VALUES (340827, 0, 100, 340800, '望江县');
INSERT INTO `sys_address_area` VALUES (340828, 0, 100, 340800, '岳西县');
INSERT INTO `sys_address_area` VALUES (340881, 0, 100, 340800, '桐城市');
INSERT INTO `sys_address_area` VALUES (341001, 0, 100, 341000, '市辖区');
INSERT INTO `sys_address_area` VALUES (341002, 0, 100, 341000, '屯溪区');
INSERT INTO `sys_address_area` VALUES (341003, 0, 100, 341000, '黄山区');
INSERT INTO `sys_address_area` VALUES (341004, 0, 100, 341000, '徽州区');
INSERT INTO `sys_address_area` VALUES (341021, 0, 100, 341000, '歙　县');
INSERT INTO `sys_address_area` VALUES (341022, 0, 100, 341000, '休宁县');
INSERT INTO `sys_address_area` VALUES (341023, 0, 100, 341000, '黟　县');
INSERT INTO `sys_address_area` VALUES (341024, 0, 100, 341000, '祁门县');
INSERT INTO `sys_address_area` VALUES (341101, 0, 100, 341100, '市辖区');
INSERT INTO `sys_address_area` VALUES (341102, 0, 100, 341100, '琅琊区');
INSERT INTO `sys_address_area` VALUES (341103, 0, 100, 341100, '南谯区');
INSERT INTO `sys_address_area` VALUES (341122, 0, 100, 341100, '来安县');
INSERT INTO `sys_address_area` VALUES (341124, 0, 100, 341100, '全椒县');
INSERT INTO `sys_address_area` VALUES (341125, 0, 100, 341100, '定远县');
INSERT INTO `sys_address_area` VALUES (341126, 0, 100, 341100, '凤阳县');
INSERT INTO `sys_address_area` VALUES (341181, 0, 100, 341100, '天长市');
INSERT INTO `sys_address_area` VALUES (341182, 0, 100, 341100, '明光市');
INSERT INTO `sys_address_area` VALUES (341201, 0, 100, 341200, '市辖区');
INSERT INTO `sys_address_area` VALUES (341202, 0, 100, 341200, '颍州区');
INSERT INTO `sys_address_area` VALUES (341203, 0, 100, 341200, '颍东区');
INSERT INTO `sys_address_area` VALUES (341204, 0, 100, 341200, '颍泉区');
INSERT INTO `sys_address_area` VALUES (341221, 0, 100, 341200, '临泉县');
INSERT INTO `sys_address_area` VALUES (341222, 0, 100, 341200, '太和县');
INSERT INTO `sys_address_area` VALUES (341225, 0, 100, 341200, '阜南县');
INSERT INTO `sys_address_area` VALUES (341226, 0, 100, 341200, '颍上县');
INSERT INTO `sys_address_area` VALUES (341282, 0, 100, 341200, '界首市');
INSERT INTO `sys_address_area` VALUES (341301, 0, 100, 341300, '市辖区');
INSERT INTO `sys_address_area` VALUES (341302, 0, 100, 341300, '墉桥区');
INSERT INTO `sys_address_area` VALUES (341321, 0, 100, 341300, '砀山县');
INSERT INTO `sys_address_area` VALUES (341322, 0, 100, 341300, '萧　县');
INSERT INTO `sys_address_area` VALUES (341323, 0, 100, 341300, '灵璧县');
INSERT INTO `sys_address_area` VALUES (341324, 0, 100, 341300, '泗　县');
INSERT INTO `sys_address_area` VALUES (341401, 0, 100, 341400, '市辖区');
INSERT INTO `sys_address_area` VALUES (341402, 0, 100, 341400, '居巢区');
INSERT INTO `sys_address_area` VALUES (341421, 0, 100, 341400, '庐江县');
INSERT INTO `sys_address_area` VALUES (341422, 0, 100, 341400, '无为县');
INSERT INTO `sys_address_area` VALUES (341423, 0, 100, 341400, '含山县');
INSERT INTO `sys_address_area` VALUES (341424, 0, 100, 341400, '和　县');
INSERT INTO `sys_address_area` VALUES (341501, 0, 100, 341500, '市辖区');
INSERT INTO `sys_address_area` VALUES (341502, 0, 100, 341500, '金安区');
INSERT INTO `sys_address_area` VALUES (341503, 0, 100, 341500, '裕安区');
INSERT INTO `sys_address_area` VALUES (341521, 0, 100, 341500, '寿　县');
INSERT INTO `sys_address_area` VALUES (341522, 0, 100, 341500, '霍邱县');
INSERT INTO `sys_address_area` VALUES (341523, 0, 100, 341500, '舒城县');
INSERT INTO `sys_address_area` VALUES (341524, 0, 100, 341500, '金寨县');
INSERT INTO `sys_address_area` VALUES (341525, 0, 100, 341500, '霍山县');
INSERT INTO `sys_address_area` VALUES (341601, 0, 100, 341600, '市辖区');
INSERT INTO `sys_address_area` VALUES (341602, 0, 100, 341600, '谯城区');
INSERT INTO `sys_address_area` VALUES (341621, 0, 100, 341600, '涡阳县');
INSERT INTO `sys_address_area` VALUES (341622, 0, 100, 341600, '蒙城县');
INSERT INTO `sys_address_area` VALUES (341623, 0, 100, 341600, '利辛县');
INSERT INTO `sys_address_area` VALUES (341701, 0, 100, 341700, '市辖区');
INSERT INTO `sys_address_area` VALUES (341702, 0, 100, 341700, '贵池区');
INSERT INTO `sys_address_area` VALUES (341721, 0, 100, 341700, '东至县');
INSERT INTO `sys_address_area` VALUES (341722, 0, 100, 341700, '石台县');
INSERT INTO `sys_address_area` VALUES (341723, 0, 100, 341700, '青阳县');
INSERT INTO `sys_address_area` VALUES (341801, 0, 100, 341800, '市辖区');
INSERT INTO `sys_address_area` VALUES (341802, 0, 100, 341800, '宣州区');
INSERT INTO `sys_address_area` VALUES (341821, 0, 100, 341800, '郎溪县');
INSERT INTO `sys_address_area` VALUES (341822, 0, 100, 341800, '广德县');
INSERT INTO `sys_address_area` VALUES (341823, 0, 100, 341800, '泾　县');
INSERT INTO `sys_address_area` VALUES (341824, 0, 100, 341800, '绩溪县');
INSERT INTO `sys_address_area` VALUES (341825, 0, 100, 341800, '旌德县');
INSERT INTO `sys_address_area` VALUES (341881, 0, 100, 341800, '宁国市');
INSERT INTO `sys_address_area` VALUES (350101, 0, 100, 350100, '市辖区');
INSERT INTO `sys_address_area` VALUES (350102, 0, 100, 350100, '鼓楼区');
INSERT INTO `sys_address_area` VALUES (350103, 0, 100, 350100, '台江区');
INSERT INTO `sys_address_area` VALUES (350104, 0, 100, 350100, '仓山区');
INSERT INTO `sys_address_area` VALUES (350105, 0, 100, 350100, '马尾区');
INSERT INTO `sys_address_area` VALUES (350111, 0, 100, 350100, '晋安区');
INSERT INTO `sys_address_area` VALUES (350121, 0, 100, 350100, '闽侯县');
INSERT INTO `sys_address_area` VALUES (350122, 0, 100, 350100, '连江县');
INSERT INTO `sys_address_area` VALUES (350123, 0, 100, 350100, '罗源县');
INSERT INTO `sys_address_area` VALUES (350124, 0, 100, 350100, '闽清县');
INSERT INTO `sys_address_area` VALUES (350125, 0, 100, 350100, '永泰县');
INSERT INTO `sys_address_area` VALUES (350128, 0, 100, 350100, '平潭县');
INSERT INTO `sys_address_area` VALUES (350181, 0, 100, 350100, '福清市');
INSERT INTO `sys_address_area` VALUES (350182, 0, 100, 350100, '长乐市');
INSERT INTO `sys_address_area` VALUES (350201, 0, 100, 350200, '市辖区');
INSERT INTO `sys_address_area` VALUES (350203, 0, 100, 350200, '思明区');
INSERT INTO `sys_address_area` VALUES (350205, 0, 100, 350200, '海沧区');
INSERT INTO `sys_address_area` VALUES (350206, 0, 100, 350200, '湖里区');
INSERT INTO `sys_address_area` VALUES (350211, 0, 100, 350200, '集美区');
INSERT INTO `sys_address_area` VALUES (350212, 0, 100, 350200, '同安区');
INSERT INTO `sys_address_area` VALUES (350213, 0, 100, 350200, '翔安区');
INSERT INTO `sys_address_area` VALUES (350301, 0, 100, 350300, '市辖区');
INSERT INTO `sys_address_area` VALUES (350302, 0, 100, 350300, '城厢区');
INSERT INTO `sys_address_area` VALUES (350303, 0, 100, 350300, '涵江区');
INSERT INTO `sys_address_area` VALUES (350304, 0, 100, 350300, '荔城区');
INSERT INTO `sys_address_area` VALUES (350305, 0, 100, 350300, '秀屿区');
INSERT INTO `sys_address_area` VALUES (350322, 0, 100, 350300, '仙游县');
INSERT INTO `sys_address_area` VALUES (350401, 0, 100, 350400, '市辖区');
INSERT INTO `sys_address_area` VALUES (350402, 0, 100, 350400, '梅列区');
INSERT INTO `sys_address_area` VALUES (350403, 0, 100, 350400, '三元区');
INSERT INTO `sys_address_area` VALUES (350421, 0, 100, 350400, '明溪县');
INSERT INTO `sys_address_area` VALUES (350423, 0, 100, 350400, '清流县');
INSERT INTO `sys_address_area` VALUES (350424, 0, 100, 350400, '宁化县');
INSERT INTO `sys_address_area` VALUES (350425, 0, 100, 350400, '大田县');
INSERT INTO `sys_address_area` VALUES (350426, 0, 100, 350400, '尤溪县');
INSERT INTO `sys_address_area` VALUES (350427, 0, 100, 350400, '沙　县');
INSERT INTO `sys_address_area` VALUES (350428, 0, 100, 350400, '将乐县');
INSERT INTO `sys_address_area` VALUES (350429, 0, 100, 350400, '泰宁县');
INSERT INTO `sys_address_area` VALUES (350430, 0, 100, 350400, '建宁县');
INSERT INTO `sys_address_area` VALUES (350481, 0, 100, 350400, '永安市');
INSERT INTO `sys_address_area` VALUES (350501, 0, 100, 350500, '市辖区');
INSERT INTO `sys_address_area` VALUES (350502, 0, 100, 350500, '鲤城区');
INSERT INTO `sys_address_area` VALUES (350503, 0, 100, 350500, '丰泽区');
INSERT INTO `sys_address_area` VALUES (350504, 0, 100, 350500, '洛江区');
INSERT INTO `sys_address_area` VALUES (350505, 0, 100, 350500, '泉港区');
INSERT INTO `sys_address_area` VALUES (350521, 0, 100, 350500, '惠安县');
INSERT INTO `sys_address_area` VALUES (350524, 0, 100, 350500, '安溪县');
INSERT INTO `sys_address_area` VALUES (350525, 0, 100, 350500, '永春县');
INSERT INTO `sys_address_area` VALUES (350526, 0, 100, 350500, '德化县');
INSERT INTO `sys_address_area` VALUES (350527, 0, 100, 350500, '金门县');
INSERT INTO `sys_address_area` VALUES (350581, 0, 100, 350500, '石狮市');
INSERT INTO `sys_address_area` VALUES (350582, 0, 100, 350500, '晋江市');
INSERT INTO `sys_address_area` VALUES (350583, 0, 100, 350500, '南安市');
INSERT INTO `sys_address_area` VALUES (350601, 0, 100, 350600, '市辖区');
INSERT INTO `sys_address_area` VALUES (350602, 0, 100, 350600, '芗城区');
INSERT INTO `sys_address_area` VALUES (350603, 0, 100, 350600, '龙文区');
INSERT INTO `sys_address_area` VALUES (350622, 0, 100, 350600, '云霄县');
INSERT INTO `sys_address_area` VALUES (350623, 0, 100, 350600, '漳浦县');
INSERT INTO `sys_address_area` VALUES (350624, 0, 100, 350600, '诏安县');
INSERT INTO `sys_address_area` VALUES (350625, 0, 100, 350600, '长泰县');
INSERT INTO `sys_address_area` VALUES (350626, 0, 100, 350600, '东山县');
INSERT INTO `sys_address_area` VALUES (350627, 0, 100, 350600, '南靖县');
INSERT INTO `sys_address_area` VALUES (350628, 0, 100, 350600, '平和县');
INSERT INTO `sys_address_area` VALUES (350629, 0, 100, 350600, '华安县');
INSERT INTO `sys_address_area` VALUES (350681, 0, 100, 350600, '龙海市');
INSERT INTO `sys_address_area` VALUES (350701, 0, 100, 350700, '市辖区');
INSERT INTO `sys_address_area` VALUES (350702, 0, 100, 350700, '延平区');
INSERT INTO `sys_address_area` VALUES (350721, 0, 100, 350700, '顺昌县');
INSERT INTO `sys_address_area` VALUES (350722, 0, 100, 350700, '浦城县');
INSERT INTO `sys_address_area` VALUES (350723, 0, 100, 350700, '光泽县');
INSERT INTO `sys_address_area` VALUES (350724, 0, 100, 350700, '松溪县');
INSERT INTO `sys_address_area` VALUES (350725, 0, 100, 350700, '政和县');
INSERT INTO `sys_address_area` VALUES (350781, 0, 100, 350700, '邵武市');
INSERT INTO `sys_address_area` VALUES (350782, 0, 100, 350700, '武夷山市');
INSERT INTO `sys_address_area` VALUES (350783, 0, 100, 350700, '建瓯市');
INSERT INTO `sys_address_area` VALUES (350784, 0, 100, 350700, '建阳市');
INSERT INTO `sys_address_area` VALUES (350801, 0, 100, 350800, '市辖区');
INSERT INTO `sys_address_area` VALUES (350802, 0, 100, 350800, '新罗区');
INSERT INTO `sys_address_area` VALUES (350821, 0, 100, 350800, '长汀县');
INSERT INTO `sys_address_area` VALUES (350822, 0, 100, 350800, '永定县');
INSERT INTO `sys_address_area` VALUES (350823, 0, 100, 350800, '上杭县');
INSERT INTO `sys_address_area` VALUES (350824, 0, 100, 350800, '武平县');
INSERT INTO `sys_address_area` VALUES (350825, 0, 100, 350800, '连城县');
INSERT INTO `sys_address_area` VALUES (350881, 0, 100, 350800, '漳平市');
INSERT INTO `sys_address_area` VALUES (350901, 0, 100, 350900, '市辖区');
INSERT INTO `sys_address_area` VALUES (350902, 0, 100, 350900, '蕉城区');
INSERT INTO `sys_address_area` VALUES (350921, 0, 100, 350900, '霞浦县');
INSERT INTO `sys_address_area` VALUES (350922, 0, 100, 350900, '古田县');
INSERT INTO `sys_address_area` VALUES (350923, 0, 100, 350900, '屏南县');
INSERT INTO `sys_address_area` VALUES (350924, 0, 100, 350900, '寿宁县');
INSERT INTO `sys_address_area` VALUES (350925, 0, 100, 350900, '周宁县');
INSERT INTO `sys_address_area` VALUES (350926, 0, 100, 350900, '柘荣县');
INSERT INTO `sys_address_area` VALUES (350981, 0, 100, 350900, '福安市');
INSERT INTO `sys_address_area` VALUES (350982, 0, 100, 350900, '福鼎市');
INSERT INTO `sys_address_area` VALUES (360101, 0, 100, 360100, '市辖区');
INSERT INTO `sys_address_area` VALUES (360102, 0, 100, 360100, '东湖区');
INSERT INTO `sys_address_area` VALUES (360103, 0, 100, 360100, '西湖区');
INSERT INTO `sys_address_area` VALUES (360104, 0, 100, 360100, '青云谱区');
INSERT INTO `sys_address_area` VALUES (360105, 0, 100, 360100, '湾里区');
INSERT INTO `sys_address_area` VALUES (360111, 0, 100, 360100, '青山湖区');
INSERT INTO `sys_address_area` VALUES (360121, 0, 100, 360100, '南昌县');
INSERT INTO `sys_address_area` VALUES (360122, 0, 100, 360100, '新建县');
INSERT INTO `sys_address_area` VALUES (360123, 0, 100, 360100, '安义县');
INSERT INTO `sys_address_area` VALUES (360124, 0, 100, 360100, '进贤县');
INSERT INTO `sys_address_area` VALUES (360201, 0, 100, 360200, '市辖区');
INSERT INTO `sys_address_area` VALUES (360202, 0, 100, 360200, '昌江区');
INSERT INTO `sys_address_area` VALUES (360203, 0, 100, 360200, '珠山区');
INSERT INTO `sys_address_area` VALUES (360222, 0, 100, 360200, '浮梁县');
INSERT INTO `sys_address_area` VALUES (360281, 0, 100, 360200, '乐平市');
INSERT INTO `sys_address_area` VALUES (360301, 0, 100, 360300, '市辖区');
INSERT INTO `sys_address_area` VALUES (360302, 0, 100, 360300, '安源区');
INSERT INTO `sys_address_area` VALUES (360313, 0, 100, 360300, '湘东区');
INSERT INTO `sys_address_area` VALUES (360321, 0, 100, 360300, '莲花县');
INSERT INTO `sys_address_area` VALUES (360322, 0, 100, 360300, '上栗县');
INSERT INTO `sys_address_area` VALUES (360323, 0, 100, 360300, '芦溪县');
INSERT INTO `sys_address_area` VALUES (360401, 0, 100, 360400, '市辖区');
INSERT INTO `sys_address_area` VALUES (360402, 0, 100, 360400, '庐山区');
INSERT INTO `sys_address_area` VALUES (360403, 0, 100, 360400, '浔阳区');
INSERT INTO `sys_address_area` VALUES (360421, 0, 100, 360400, '九江县');
INSERT INTO `sys_address_area` VALUES (360423, 0, 100, 360400, '武宁县');
INSERT INTO `sys_address_area` VALUES (360424, 0, 100, 360400, '修水县');
INSERT INTO `sys_address_area` VALUES (360425, 0, 100, 360400, '永修县');
INSERT INTO `sys_address_area` VALUES (360426, 0, 100, 360400, '德安县');
INSERT INTO `sys_address_area` VALUES (360427, 0, 100, 360400, '星子县');
INSERT INTO `sys_address_area` VALUES (360428, 0, 100, 360400, '都昌县');
INSERT INTO `sys_address_area` VALUES (360429, 0, 100, 360400, '湖口县');
INSERT INTO `sys_address_area` VALUES (360430, 0, 100, 360400, '彭泽县');
INSERT INTO `sys_address_area` VALUES (360481, 0, 100, 360400, '瑞昌市');
INSERT INTO `sys_address_area` VALUES (360501, 0, 100, 360500, '市辖区');
INSERT INTO `sys_address_area` VALUES (360502, 0, 100, 360500, '渝水区');
INSERT INTO `sys_address_area` VALUES (360521, 0, 100, 360500, '分宜县');
INSERT INTO `sys_address_area` VALUES (360601, 0, 100, 360600, '市辖区');
INSERT INTO `sys_address_area` VALUES (360602, 0, 100, 360600, '月湖区');
INSERT INTO `sys_address_area` VALUES (360622, 0, 100, 360600, '余江县');
INSERT INTO `sys_address_area` VALUES (360681, 0, 100, 360600, '贵溪市');
INSERT INTO `sys_address_area` VALUES (360701, 0, 100, 360700, '市辖区');
INSERT INTO `sys_address_area` VALUES (360702, 0, 100, 360700, '章贡区');
INSERT INTO `sys_address_area` VALUES (360721, 0, 100, 360700, '赣　县');
INSERT INTO `sys_address_area` VALUES (360722, 0, 100, 360700, '信丰县');
INSERT INTO `sys_address_area` VALUES (360723, 0, 100, 360700, '大余县');
INSERT INTO `sys_address_area` VALUES (360724, 0, 100, 360700, '上犹县');
INSERT INTO `sys_address_area` VALUES (360725, 0, 100, 360700, '崇义县');
INSERT INTO `sys_address_area` VALUES (360726, 0, 100, 360700, '安远县');
INSERT INTO `sys_address_area` VALUES (360727, 0, 100, 360700, '龙南县');
INSERT INTO `sys_address_area` VALUES (360728, 0, 100, 360700, '定南县');
INSERT INTO `sys_address_area` VALUES (360729, 0, 100, 360700, '全南县');
INSERT INTO `sys_address_area` VALUES (360730, 0, 100, 360700, '宁都县');
INSERT INTO `sys_address_area` VALUES (360731, 0, 100, 360700, '于都县');
INSERT INTO `sys_address_area` VALUES (360732, 0, 100, 360700, '兴国县');
INSERT INTO `sys_address_area` VALUES (360733, 0, 100, 360700, '会昌县');
INSERT INTO `sys_address_area` VALUES (360734, 0, 100, 360700, '寻乌县');
INSERT INTO `sys_address_area` VALUES (360735, 0, 100, 360700, '石城县');
INSERT INTO `sys_address_area` VALUES (360781, 0, 100, 360700, '瑞金市');
INSERT INTO `sys_address_area` VALUES (360782, 0, 100, 360700, '南康市');
INSERT INTO `sys_address_area` VALUES (360801, 0, 100, 360800, '市辖区');
INSERT INTO `sys_address_area` VALUES (360802, 0, 100, 360800, '吉州区');
INSERT INTO `sys_address_area` VALUES (360803, 0, 100, 360800, '青原区');
INSERT INTO `sys_address_area` VALUES (360821, 0, 100, 360800, '吉安县');
INSERT INTO `sys_address_area` VALUES (360822, 0, 100, 360800, '吉水县');
INSERT INTO `sys_address_area` VALUES (360823, 0, 100, 360800, '峡江县');
INSERT INTO `sys_address_area` VALUES (360824, 0, 100, 360800, '新干县');
INSERT INTO `sys_address_area` VALUES (360825, 0, 100, 360800, '永丰县');
INSERT INTO `sys_address_area` VALUES (360826, 0, 100, 360800, '泰和县');
INSERT INTO `sys_address_area` VALUES (360827, 0, 100, 360800, '遂川县');
INSERT INTO `sys_address_area` VALUES (360828, 0, 100, 360800, '万安县');
INSERT INTO `sys_address_area` VALUES (360829, 0, 100, 360800, '安福县');
INSERT INTO `sys_address_area` VALUES (360830, 0, 100, 360800, '永新县');
INSERT INTO `sys_address_area` VALUES (360881, 0, 100, 360800, '井冈山市');
INSERT INTO `sys_address_area` VALUES (360901, 0, 100, 360900, '市辖区');
INSERT INTO `sys_address_area` VALUES (360902, 0, 100, 360900, '袁州区');
INSERT INTO `sys_address_area` VALUES (360921, 0, 100, 360900, '奉新县');
INSERT INTO `sys_address_area` VALUES (360922, 0, 100, 360900, '万载县');
INSERT INTO `sys_address_area` VALUES (360923, 0, 100, 360900, '上高县');
INSERT INTO `sys_address_area` VALUES (360924, 0, 100, 360900, '宜丰县');
INSERT INTO `sys_address_area` VALUES (360925, 0, 100, 360900, '靖安县');
INSERT INTO `sys_address_area` VALUES (360926, 0, 100, 360900, '铜鼓县');
INSERT INTO `sys_address_area` VALUES (360981, 0, 100, 360900, '丰城市');
INSERT INTO `sys_address_area` VALUES (360982, 0, 100, 360900, '樟树市');
INSERT INTO `sys_address_area` VALUES (360983, 0, 100, 360900, '高安市');
INSERT INTO `sys_address_area` VALUES (361001, 0, 100, 361000, '市辖区');
INSERT INTO `sys_address_area` VALUES (361002, 0, 100, 361000, '临川区');
INSERT INTO `sys_address_area` VALUES (361021, 0, 100, 361000, '南城县');
INSERT INTO `sys_address_area` VALUES (361022, 0, 100, 361000, '黎川县');
INSERT INTO `sys_address_area` VALUES (361023, 0, 100, 361000, '南丰县');
INSERT INTO `sys_address_area` VALUES (361024, 0, 100, 361000, '崇仁县');
INSERT INTO `sys_address_area` VALUES (361025, 0, 100, 361000, '乐安县');
INSERT INTO `sys_address_area` VALUES (361026, 0, 100, 361000, '宜黄县');
INSERT INTO `sys_address_area` VALUES (361027, 0, 100, 361000, '金溪县');
INSERT INTO `sys_address_area` VALUES (361028, 0, 100, 361000, '资溪县');
INSERT INTO `sys_address_area` VALUES (361029, 0, 100, 361000, '东乡县');
INSERT INTO `sys_address_area` VALUES (361030, 0, 100, 361000, '广昌县');
INSERT INTO `sys_address_area` VALUES (361101, 0, 100, 361100, '市辖区');
INSERT INTO `sys_address_area` VALUES (361102, 0, 100, 361100, '信州区');
INSERT INTO `sys_address_area` VALUES (361121, 0, 100, 361100, '上饶县');
INSERT INTO `sys_address_area` VALUES (361122, 0, 100, 361100, '广丰县');
INSERT INTO `sys_address_area` VALUES (361123, 0, 100, 361100, '玉山县');
INSERT INTO `sys_address_area` VALUES (361124, 0, 100, 361100, '铅山县');
INSERT INTO `sys_address_area` VALUES (361125, 0, 100, 361100, '横峰县');
INSERT INTO `sys_address_area` VALUES (361126, 0, 100, 361100, '弋阳县');
INSERT INTO `sys_address_area` VALUES (361127, 0, 100, 361100, '余干县');
INSERT INTO `sys_address_area` VALUES (361128, 0, 100, 361100, '鄱阳县');
INSERT INTO `sys_address_area` VALUES (361129, 0, 100, 361100, '万年县');
INSERT INTO `sys_address_area` VALUES (361130, 0, 100, 361100, '婺源县');
INSERT INTO `sys_address_area` VALUES (361181, 0, 100, 361100, '德兴市');
INSERT INTO `sys_address_area` VALUES (370101, 0, 100, 370100, '市辖区');
INSERT INTO `sys_address_area` VALUES (370102, 0, 100, 370100, '历下区');
INSERT INTO `sys_address_area` VALUES (370103, 0, 100, 370100, '市中区');
INSERT INTO `sys_address_area` VALUES (370104, 0, 100, 370100, '槐荫区');
INSERT INTO `sys_address_area` VALUES (370105, 0, 100, 370100, '天桥区');
INSERT INTO `sys_address_area` VALUES (370112, 0, 100, 370100, '历城区');
INSERT INTO `sys_address_area` VALUES (370113, 0, 100, 370100, '长清区');
INSERT INTO `sys_address_area` VALUES (370124, 0, 100, 370100, '平阴县');
INSERT INTO `sys_address_area` VALUES (370125, 0, 100, 370100, '济阳县');
INSERT INTO `sys_address_area` VALUES (370126, 0, 100, 370100, '商河县');
INSERT INTO `sys_address_area` VALUES (370181, 0, 100, 370100, '章丘市');
INSERT INTO `sys_address_area` VALUES (370201, 0, 100, 370200, '市辖区');
INSERT INTO `sys_address_area` VALUES (370202, 0, 100, 370200, '市南区');
INSERT INTO `sys_address_area` VALUES (370203, 0, 100, 370200, '市北区');
INSERT INTO `sys_address_area` VALUES (370205, 0, 100, 370200, '四方区');
INSERT INTO `sys_address_area` VALUES (370211, 0, 100, 370200, '黄岛区');
INSERT INTO `sys_address_area` VALUES (370212, 0, 100, 370200, '崂山区');
INSERT INTO `sys_address_area` VALUES (370213, 0, 100, 370200, '李沧区');
INSERT INTO `sys_address_area` VALUES (370214, 0, 100, 370200, '城阳区');
INSERT INTO `sys_address_area` VALUES (370281, 0, 100, 370200, '胶州市');
INSERT INTO `sys_address_area` VALUES (370282, 0, 100, 370200, '即墨市');
INSERT INTO `sys_address_area` VALUES (370283, 0, 100, 370200, '平度市');
INSERT INTO `sys_address_area` VALUES (370284, 0, 100, 370200, '胶南市');
INSERT INTO `sys_address_area` VALUES (370285, 0, 100, 370200, '莱西市');
INSERT INTO `sys_address_area` VALUES (370301, 0, 100, 370300, '市辖区');
INSERT INTO `sys_address_area` VALUES (370302, 0, 100, 370300, '淄川区');
INSERT INTO `sys_address_area` VALUES (370303, 0, 100, 370300, '张店区');
INSERT INTO `sys_address_area` VALUES (370304, 0, 100, 370300, '博山区');
INSERT INTO `sys_address_area` VALUES (370305, 0, 100, 370300, '临淄区');
INSERT INTO `sys_address_area` VALUES (370306, 0, 100, 370300, '周村区');
INSERT INTO `sys_address_area` VALUES (370321, 0, 100, 370300, '桓台县');
INSERT INTO `sys_address_area` VALUES (370322, 0, 100, 370300, '高青县');
INSERT INTO `sys_address_area` VALUES (370323, 0, 100, 370300, '沂源县');
INSERT INTO `sys_address_area` VALUES (370401, 0, 100, 370400, '市辖区');
INSERT INTO `sys_address_area` VALUES (370402, 0, 100, 370400, '市中区');
INSERT INTO `sys_address_area` VALUES (370403, 0, 100, 370400, '薛城区');
INSERT INTO `sys_address_area` VALUES (370404, 0, 100, 370400, '峄城区');
INSERT INTO `sys_address_area` VALUES (370405, 0, 100, 370400, '台儿庄区');
INSERT INTO `sys_address_area` VALUES (370406, 0, 100, 370400, '山亭区');
INSERT INTO `sys_address_area` VALUES (370481, 0, 100, 370400, '滕州市');
INSERT INTO `sys_address_area` VALUES (370501, 0, 100, 370500, '市辖区');
INSERT INTO `sys_address_area` VALUES (370502, 0, 100, 370500, '东营区');
INSERT INTO `sys_address_area` VALUES (370503, 0, 100, 370500, '河口区');
INSERT INTO `sys_address_area` VALUES (370521, 0, 100, 370500, '垦利县');
INSERT INTO `sys_address_area` VALUES (370522, 0, 100, 370500, '利津县');
INSERT INTO `sys_address_area` VALUES (370523, 0, 100, 370500, '广饶县');
INSERT INTO `sys_address_area` VALUES (370601, 0, 100, 370600, '市辖区');
INSERT INTO `sys_address_area` VALUES (370602, 0, 100, 370600, '芝罘区');
INSERT INTO `sys_address_area` VALUES (370611, 0, 100, 370600, '福山区');
INSERT INTO `sys_address_area` VALUES (370612, 0, 100, 370600, '牟平区');
INSERT INTO `sys_address_area` VALUES (370613, 0, 100, 370600, '莱山区');
INSERT INTO `sys_address_area` VALUES (370634, 0, 100, 370600, '长岛县');
INSERT INTO `sys_address_area` VALUES (370681, 0, 100, 370600, '龙口市');
INSERT INTO `sys_address_area` VALUES (370682, 0, 100, 370600, '莱阳市');
INSERT INTO `sys_address_area` VALUES (370683, 0, 100, 370600, '莱州市');
INSERT INTO `sys_address_area` VALUES (370684, 0, 100, 370600, '蓬莱市');
INSERT INTO `sys_address_area` VALUES (370685, 0, 100, 370600, '招远市');
INSERT INTO `sys_address_area` VALUES (370686, 0, 100, 370600, '栖霞市');
INSERT INTO `sys_address_area` VALUES (370687, 0, 100, 370600, '海阳市');
INSERT INTO `sys_address_area` VALUES (370701, 0, 100, 370700, '市辖区');
INSERT INTO `sys_address_area` VALUES (370702, 0, 100, 370700, '潍城区');
INSERT INTO `sys_address_area` VALUES (370703, 0, 100, 370700, '寒亭区');
INSERT INTO `sys_address_area` VALUES (370704, 0, 100, 370700, '坊子区');
INSERT INTO `sys_address_area` VALUES (370705, 0, 100, 370700, '奎文区');
INSERT INTO `sys_address_area` VALUES (370724, 0, 100, 370700, '临朐县');
INSERT INTO `sys_address_area` VALUES (370725, 0, 100, 370700, '昌乐县');
INSERT INTO `sys_address_area` VALUES (370781, 0, 100, 370700, '青州市');
INSERT INTO `sys_address_area` VALUES (370782, 0, 100, 370700, '诸城市');
INSERT INTO `sys_address_area` VALUES (370783, 0, 100, 370700, '寿光市');
INSERT INTO `sys_address_area` VALUES (370784, 0, 100, 370700, '安丘市');
INSERT INTO `sys_address_area` VALUES (370785, 0, 100, 370700, '高密市');
INSERT INTO `sys_address_area` VALUES (370786, 0, 100, 370700, '昌邑市');
INSERT INTO `sys_address_area` VALUES (370801, 0, 100, 370800, '市辖区');
INSERT INTO `sys_address_area` VALUES (370802, 0, 100, 370800, '市中区');
INSERT INTO `sys_address_area` VALUES (370811, 0, 100, 370800, '任城区');
INSERT INTO `sys_address_area` VALUES (370826, 0, 100, 370800, '微山县');
INSERT INTO `sys_address_area` VALUES (370827, 0, 100, 370800, '鱼台县');
INSERT INTO `sys_address_area` VALUES (370828, 0, 100, 370800, '金乡县');
INSERT INTO `sys_address_area` VALUES (370829, 0, 100, 370800, '嘉祥县');
INSERT INTO `sys_address_area` VALUES (370830, 0, 100, 370800, '汶上县');
INSERT INTO `sys_address_area` VALUES (370831, 0, 100, 370800, '泗水县');
INSERT INTO `sys_address_area` VALUES (370832, 0, 100, 370800, '梁山县');
INSERT INTO `sys_address_area` VALUES (370881, 0, 100, 370800, '曲阜市');
INSERT INTO `sys_address_area` VALUES (370882, 0, 100, 370800, '兖州市');
INSERT INTO `sys_address_area` VALUES (370883, 0, 100, 370800, '邹城市');
INSERT INTO `sys_address_area` VALUES (370901, 0, 100, 370900, '市辖区');
INSERT INTO `sys_address_area` VALUES (370902, 0, 100, 370900, '泰山区');
INSERT INTO `sys_address_area` VALUES (370903, 0, 100, 370900, '岱岳区');
INSERT INTO `sys_address_area` VALUES (370921, 0, 100, 370900, '宁阳县');
INSERT INTO `sys_address_area` VALUES (370923, 0, 100, 370900, '东平县');
INSERT INTO `sys_address_area` VALUES (370982, 0, 100, 370900, '新泰市');
INSERT INTO `sys_address_area` VALUES (370983, 0, 100, 370900, '肥城市');
INSERT INTO `sys_address_area` VALUES (371001, 0, 100, 371000, '市辖区');
INSERT INTO `sys_address_area` VALUES (371002, 0, 100, 371000, '环翠区');
INSERT INTO `sys_address_area` VALUES (371081, 0, 100, 371000, '文登市');
INSERT INTO `sys_address_area` VALUES (371082, 0, 100, 371000, '荣成市');
INSERT INTO `sys_address_area` VALUES (371083, 0, 100, 371000, '乳山市');
INSERT INTO `sys_address_area` VALUES (371101, 0, 100, 371100, '市辖区');
INSERT INTO `sys_address_area` VALUES (371102, 0, 100, 371100, '东港区');
INSERT INTO `sys_address_area` VALUES (371103, 0, 100, 371100, '岚山区');
INSERT INTO `sys_address_area` VALUES (371121, 0, 100, 371100, '五莲县');
INSERT INTO `sys_address_area` VALUES (371122, 0, 100, 371100, '莒　县');
INSERT INTO `sys_address_area` VALUES (371201, 0, 100, 371200, '市辖区');
INSERT INTO `sys_address_area` VALUES (371202, 0, 100, 371200, '莱城区');
INSERT INTO `sys_address_area` VALUES (371203, 0, 100, 371200, '钢城区');
INSERT INTO `sys_address_area` VALUES (371301, 0, 100, 371300, '市辖区');
INSERT INTO `sys_address_area` VALUES (371302, 0, 100, 371300, '兰山区');
INSERT INTO `sys_address_area` VALUES (371311, 0, 100, 371300, '罗庄区');
INSERT INTO `sys_address_area` VALUES (371312, 0, 100, 371300, '河东区');
INSERT INTO `sys_address_area` VALUES (371321, 0, 100, 371300, '沂南县');
INSERT INTO `sys_address_area` VALUES (371322, 0, 100, 371300, '郯城县');
INSERT INTO `sys_address_area` VALUES (371323, 0, 100, 371300, '沂水县');
INSERT INTO `sys_address_area` VALUES (371324, 0, 100, 371300, '苍山县');
INSERT INTO `sys_address_area` VALUES (371325, 0, 100, 371300, '费　县');
INSERT INTO `sys_address_area` VALUES (371326, 0, 100, 371300, '平邑县');
INSERT INTO `sys_address_area` VALUES (371327, 0, 100, 371300, '莒南县');
INSERT INTO `sys_address_area` VALUES (371328, 0, 100, 371300, '蒙阴县');
INSERT INTO `sys_address_area` VALUES (371329, 0, 100, 371300, '临沭县');
INSERT INTO `sys_address_area` VALUES (371401, 0, 100, 371400, '市辖区');
INSERT INTO `sys_address_area` VALUES (371402, 0, 100, 371400, '德城区');
INSERT INTO `sys_address_area` VALUES (371421, 0, 100, 371400, '陵　县');
INSERT INTO `sys_address_area` VALUES (371422, 0, 100, 371400, '宁津县');
INSERT INTO `sys_address_area` VALUES (371423, 0, 100, 371400, '庆云县');
INSERT INTO `sys_address_area` VALUES (371424, 0, 100, 371400, '临邑县');
INSERT INTO `sys_address_area` VALUES (371425, 0, 100, 371400, '齐河县');
INSERT INTO `sys_address_area` VALUES (371426, 0, 100, 371400, '平原县');
INSERT INTO `sys_address_area` VALUES (371427, 0, 100, 371400, '夏津县');
INSERT INTO `sys_address_area` VALUES (371428, 0, 100, 371400, '武城县');
INSERT INTO `sys_address_area` VALUES (371481, 0, 100, 371400, '乐陵市');
INSERT INTO `sys_address_area` VALUES (371482, 0, 100, 371400, '禹城市');
INSERT INTO `sys_address_area` VALUES (371501, 0, 100, 371500, '市辖区');
INSERT INTO `sys_address_area` VALUES (371502, 0, 100, 371500, '东昌府区');
INSERT INTO `sys_address_area` VALUES (371521, 0, 100, 371500, '阳谷县');
INSERT INTO `sys_address_area` VALUES (371522, 0, 100, 371500, '莘　县');
INSERT INTO `sys_address_area` VALUES (371523, 0, 100, 371500, '茌平县');
INSERT INTO `sys_address_area` VALUES (371524, 0, 100, 371500, '东阿县');
INSERT INTO `sys_address_area` VALUES (371525, 0, 100, 371500, '冠　县');
INSERT INTO `sys_address_area` VALUES (371526, 0, 100, 371500, '高唐县');
INSERT INTO `sys_address_area` VALUES (371581, 0, 100, 371500, '临清市');
INSERT INTO `sys_address_area` VALUES (371601, 0, 100, 371600, '市辖区');
INSERT INTO `sys_address_area` VALUES (371602, 0, 100, 371600, '滨城区');
INSERT INTO `sys_address_area` VALUES (371621, 0, 100, 371600, '惠民县');
INSERT INTO `sys_address_area` VALUES (371622, 0, 100, 371600, '阳信县');
INSERT INTO `sys_address_area` VALUES (371623, 0, 100, 371600, '无棣县');
INSERT INTO `sys_address_area` VALUES (371624, 0, 100, 371600, '沾化县');
INSERT INTO `sys_address_area` VALUES (371625, 0, 100, 371600, '博兴县');
INSERT INTO `sys_address_area` VALUES (371626, 0, 100, 371600, '邹平县');
INSERT INTO `sys_address_area` VALUES (371701, 0, 100, 371700, '市辖区');
INSERT INTO `sys_address_area` VALUES (371702, 0, 100, 371700, '牡丹区');
INSERT INTO `sys_address_area` VALUES (371721, 0, 100, 371700, '曹　县');
INSERT INTO `sys_address_area` VALUES (371722, 0, 100, 371700, '单　县');
INSERT INTO `sys_address_area` VALUES (371723, 0, 100, 371700, '成武县');
INSERT INTO `sys_address_area` VALUES (371724, 0, 100, 371700, '巨野县');
INSERT INTO `sys_address_area` VALUES (371725, 0, 100, 371700, '郓城县');
INSERT INTO `sys_address_area` VALUES (371726, 0, 100, 371700, '鄄城县');
INSERT INTO `sys_address_area` VALUES (371727, 0, 100, 371700, '定陶县');
INSERT INTO `sys_address_area` VALUES (371728, 0, 100, 371700, '东明县');
INSERT INTO `sys_address_area` VALUES (410101, 0, 100, 410100, '市辖区');
INSERT INTO `sys_address_area` VALUES (410102, 0, 100, 410100, '中原区');
INSERT INTO `sys_address_area` VALUES (410103, 0, 100, 410100, '二七区');
INSERT INTO `sys_address_area` VALUES (410104, 0, 100, 410100, '管城回族区');
INSERT INTO `sys_address_area` VALUES (410105, 0, 100, 410100, '金水区');
INSERT INTO `sys_address_area` VALUES (410106, 0, 100, 410100, '上街区');
INSERT INTO `sys_address_area` VALUES (410108, 0, 100, 410100, '邙山区');
INSERT INTO `sys_address_area` VALUES (410122, 0, 100, 410100, '中牟县');
INSERT INTO `sys_address_area` VALUES (410181, 0, 100, 410100, '巩义市');
INSERT INTO `sys_address_area` VALUES (410182, 0, 100, 410100, '荥阳市');
INSERT INTO `sys_address_area` VALUES (410183, 0, 100, 410100, '新密市');
INSERT INTO `sys_address_area` VALUES (410184, 0, 100, 410100, '新郑市');
INSERT INTO `sys_address_area` VALUES (410185, 0, 100, 410100, '登封市');
INSERT INTO `sys_address_area` VALUES (410201, 0, 100, 410200, '市辖区');
INSERT INTO `sys_address_area` VALUES (410202, 0, 100, 410200, '龙亭区');
INSERT INTO `sys_address_area` VALUES (410203, 0, 100, 410200, '顺河回族区');
INSERT INTO `sys_address_area` VALUES (410204, 0, 100, 410200, '鼓楼区');
INSERT INTO `sys_address_area` VALUES (410205, 0, 100, 410200, '南关区');
INSERT INTO `sys_address_area` VALUES (410211, 0, 100, 410200, '郊　区');
INSERT INTO `sys_address_area` VALUES (410221, 0, 100, 410200, '杞　县');
INSERT INTO `sys_address_area` VALUES (410222, 0, 100, 410200, '通许县');
INSERT INTO `sys_address_area` VALUES (410223, 0, 100, 410200, '尉氏县');
INSERT INTO `sys_address_area` VALUES (410224, 0, 100, 410200, '开封县');
INSERT INTO `sys_address_area` VALUES (410225, 0, 100, 410200, '兰考县');
INSERT INTO `sys_address_area` VALUES (410301, 0, 100, 410300, '市辖区');
INSERT INTO `sys_address_area` VALUES (410302, 0, 100, 410300, '老城区');
INSERT INTO `sys_address_area` VALUES (410303, 0, 100, 410300, '西工区');
INSERT INTO `sys_address_area` VALUES (410304, 0, 100, 410300, '廛河回族区');
INSERT INTO `sys_address_area` VALUES (410305, 0, 100, 410300, '涧西区');
INSERT INTO `sys_address_area` VALUES (410306, 0, 100, 410300, '吉利区');
INSERT INTO `sys_address_area` VALUES (410307, 0, 100, 410300, '洛龙区');
INSERT INTO `sys_address_area` VALUES (410322, 0, 100, 410300, '孟津县');
INSERT INTO `sys_address_area` VALUES (410323, 0, 100, 410300, '新安县');
INSERT INTO `sys_address_area` VALUES (410324, 0, 100, 410300, '栾川县');
INSERT INTO `sys_address_area` VALUES (410325, 0, 100, 410300, '嵩　县');
INSERT INTO `sys_address_area` VALUES (410326, 0, 100, 410300, '汝阳县');
INSERT INTO `sys_address_area` VALUES (410327, 0, 100, 410300, '宜阳县');
INSERT INTO `sys_address_area` VALUES (410328, 0, 100, 410300, '洛宁县');
INSERT INTO `sys_address_area` VALUES (410329, 0, 100, 410300, '伊川县');
INSERT INTO `sys_address_area` VALUES (410381, 0, 100, 410300, '偃师市');
INSERT INTO `sys_address_area` VALUES (410401, 0, 100, 410400, '市辖区');
INSERT INTO `sys_address_area` VALUES (410402, 0, 100, 410400, '新华区');
INSERT INTO `sys_address_area` VALUES (410403, 0, 100, 410400, '卫东区');
INSERT INTO `sys_address_area` VALUES (410404, 0, 100, 410400, '石龙区');
INSERT INTO `sys_address_area` VALUES (410411, 0, 100, 410400, '湛河区');
INSERT INTO `sys_address_area` VALUES (410421, 0, 100, 410400, '宝丰县');
INSERT INTO `sys_address_area` VALUES (410422, 0, 100, 410400, '叶　县');
INSERT INTO `sys_address_area` VALUES (410423, 0, 100, 410400, '鲁山县');
INSERT INTO `sys_address_area` VALUES (410425, 0, 100, 410400, '郏　县');
INSERT INTO `sys_address_area` VALUES (410481, 0, 100, 410400, '舞钢市');
INSERT INTO `sys_address_area` VALUES (410482, 0, 100, 410400, '汝州市');
INSERT INTO `sys_address_area` VALUES (410501, 0, 100, 410500, '市辖区');
INSERT INTO `sys_address_area` VALUES (410502, 0, 100, 410500, '文峰区');
INSERT INTO `sys_address_area` VALUES (410503, 0, 100, 410500, '北关区');
INSERT INTO `sys_address_area` VALUES (410505, 0, 100, 410500, '殷都区');
INSERT INTO `sys_address_area` VALUES (410506, 0, 100, 410500, '龙安区');
INSERT INTO `sys_address_area` VALUES (410522, 0, 100, 410500, '安阳县');
INSERT INTO `sys_address_area` VALUES (410523, 0, 100, 410500, '汤阴县');
INSERT INTO `sys_address_area` VALUES (410526, 0, 100, 410500, '滑　县');
INSERT INTO `sys_address_area` VALUES (410527, 0, 100, 410500, '内黄县');
INSERT INTO `sys_address_area` VALUES (410581, 0, 100, 410500, '林州市');
INSERT INTO `sys_address_area` VALUES (410601, 0, 100, 410600, '市辖区');
INSERT INTO `sys_address_area` VALUES (410602, 0, 100, 410600, '鹤山区');
INSERT INTO `sys_address_area` VALUES (410603, 0, 100, 410600, '山城区');
INSERT INTO `sys_address_area` VALUES (410611, 0, 100, 410600, '淇滨区');
INSERT INTO `sys_address_area` VALUES (410621, 0, 100, 410600, '浚　县');
INSERT INTO `sys_address_area` VALUES (410622, 0, 100, 410600, '淇　县');
INSERT INTO `sys_address_area` VALUES (410701, 0, 100, 410700, '市辖区');
INSERT INTO `sys_address_area` VALUES (410702, 0, 100, 410700, '红旗区');
INSERT INTO `sys_address_area` VALUES (410703, 0, 100, 410700, '卫滨区');
INSERT INTO `sys_address_area` VALUES (410704, 0, 100, 410700, '凤泉区');
INSERT INTO `sys_address_area` VALUES (410711, 0, 100, 410700, '牧野区');
INSERT INTO `sys_address_area` VALUES (410721, 0, 100, 410700, '新乡县');
INSERT INTO `sys_address_area` VALUES (410724, 0, 100, 410700, '获嘉县');
INSERT INTO `sys_address_area` VALUES (410725, 0, 100, 410700, '原阳县');
INSERT INTO `sys_address_area` VALUES (410726, 0, 100, 410700, '延津县');
INSERT INTO `sys_address_area` VALUES (410727, 0, 100, 410700, '封丘县');
INSERT INTO `sys_address_area` VALUES (410728, 0, 100, 410700, '长垣县');
INSERT INTO `sys_address_area` VALUES (410781, 0, 100, 410700, '卫辉市');
INSERT INTO `sys_address_area` VALUES (410782, 0, 100, 410700, '辉县市');
INSERT INTO `sys_address_area` VALUES (410801, 0, 100, 410800, '市辖区');
INSERT INTO `sys_address_area` VALUES (410802, 0, 100, 410800, '解放区');
INSERT INTO `sys_address_area` VALUES (410803, 0, 100, 410800, '中站区');
INSERT INTO `sys_address_area` VALUES (410804, 0, 100, 410800, '马村区');
INSERT INTO `sys_address_area` VALUES (410811, 0, 100, 410800, '山阳区');
INSERT INTO `sys_address_area` VALUES (410821, 0, 100, 410800, '修武县');
INSERT INTO `sys_address_area` VALUES (410822, 0, 100, 410800, '博爱县');
INSERT INTO `sys_address_area` VALUES (410823, 0, 100, 410800, '武陟县');
INSERT INTO `sys_address_area` VALUES (410825, 0, 100, 410800, '温　县');
INSERT INTO `sys_address_area` VALUES (410881, 0, 100, 410800, '济源市');
INSERT INTO `sys_address_area` VALUES (410882, 0, 100, 410800, '沁阳市');
INSERT INTO `sys_address_area` VALUES (410883, 0, 100, 410800, '孟州市');
INSERT INTO `sys_address_area` VALUES (410901, 0, 100, 410900, '市辖区');
INSERT INTO `sys_address_area` VALUES (410902, 0, 100, 410900, '华龙区');
INSERT INTO `sys_address_area` VALUES (410922, 0, 100, 410900, '清丰县');
INSERT INTO `sys_address_area` VALUES (410923, 0, 100, 410900, '南乐县');
INSERT INTO `sys_address_area` VALUES (410926, 0, 100, 410900, '范　县');
INSERT INTO `sys_address_area` VALUES (410927, 0, 100, 410900, '台前县');
INSERT INTO `sys_address_area` VALUES (410928, 0, 100, 410900, '濮阳县');
INSERT INTO `sys_address_area` VALUES (411001, 0, 100, 411000, '市辖区');
INSERT INTO `sys_address_area` VALUES (411002, 0, 100, 411000, '魏都区');
INSERT INTO `sys_address_area` VALUES (411023, 0, 100, 411000, '许昌县');
INSERT INTO `sys_address_area` VALUES (411024, 0, 100, 411000, '鄢陵县');
INSERT INTO `sys_address_area` VALUES (411025, 0, 100, 411000, '襄城县');
INSERT INTO `sys_address_area` VALUES (411081, 0, 100, 411000, '禹州市');
INSERT INTO `sys_address_area` VALUES (411082, 0, 100, 411000, '长葛市');
INSERT INTO `sys_address_area` VALUES (411101, 0, 100, 411100, '市辖区');
INSERT INTO `sys_address_area` VALUES (411102, 0, 100, 411100, '源汇区');
INSERT INTO `sys_address_area` VALUES (411103, 0, 100, 411100, '郾城区');
INSERT INTO `sys_address_area` VALUES (411104, 0, 100, 411100, '召陵区');
INSERT INTO `sys_address_area` VALUES (411121, 0, 100, 411100, '舞阳县');
INSERT INTO `sys_address_area` VALUES (411122, 0, 100, 411100, '临颍县');
INSERT INTO `sys_address_area` VALUES (411201, 0, 100, 411200, '市辖区');
INSERT INTO `sys_address_area` VALUES (411202, 0, 100, 411200, '湖滨区');
INSERT INTO `sys_address_area` VALUES (411221, 0, 100, 411200, '渑池县');
INSERT INTO `sys_address_area` VALUES (411222, 0, 100, 411200, '陕　县');
INSERT INTO `sys_address_area` VALUES (411224, 0, 100, 411200, '卢氏县');
INSERT INTO `sys_address_area` VALUES (411281, 0, 100, 411200, '义马市');
INSERT INTO `sys_address_area` VALUES (411282, 0, 100, 411200, '灵宝市');
INSERT INTO `sys_address_area` VALUES (411301, 0, 100, 411300, '市辖区');
INSERT INTO `sys_address_area` VALUES (411302, 0, 100, 411300, '宛城区');
INSERT INTO `sys_address_area` VALUES (411303, 0, 100, 411300, '卧龙区');
INSERT INTO `sys_address_area` VALUES (411321, 0, 100, 411300, '南召县');
INSERT INTO `sys_address_area` VALUES (411322, 0, 100, 411300, '方城县');
INSERT INTO `sys_address_area` VALUES (411323, 0, 100, 411300, '西峡县');
INSERT INTO `sys_address_area` VALUES (411324, 0, 100, 411300, '镇平县');
INSERT INTO `sys_address_area` VALUES (411325, 0, 100, 411300, '内乡县');
INSERT INTO `sys_address_area` VALUES (411326, 0, 100, 411300, '淅川县');
INSERT INTO `sys_address_area` VALUES (411327, 0, 100, 411300, '社旗县');
INSERT INTO `sys_address_area` VALUES (411328, 0, 100, 411300, '唐河县');
INSERT INTO `sys_address_area` VALUES (411329, 0, 100, 411300, '新野县');
INSERT INTO `sys_address_area` VALUES (411330, 0, 100, 411300, '桐柏县');
INSERT INTO `sys_address_area` VALUES (411381, 0, 100, 411300, '邓州市');
INSERT INTO `sys_address_area` VALUES (411401, 0, 100, 411400, '市辖区');
INSERT INTO `sys_address_area` VALUES (411402, 0, 100, 411400, '梁园区');
INSERT INTO `sys_address_area` VALUES (411403, 0, 100, 411400, '睢阳区');
INSERT INTO `sys_address_area` VALUES (411421, 0, 100, 411400, '民权县');
INSERT INTO `sys_address_area` VALUES (411422, 0, 100, 411400, '睢　县');
INSERT INTO `sys_address_area` VALUES (411423, 0, 100, 411400, '宁陵县');
INSERT INTO `sys_address_area` VALUES (411424, 0, 100, 411400, '柘城县');
INSERT INTO `sys_address_area` VALUES (411425, 0, 100, 411400, '虞城县');
INSERT INTO `sys_address_area` VALUES (411426, 0, 100, 411400, '夏邑县');
INSERT INTO `sys_address_area` VALUES (411481, 0, 100, 411400, '永城市');
INSERT INTO `sys_address_area` VALUES (411501, 0, 100, 411500, '市辖区');
INSERT INTO `sys_address_area` VALUES (411502, 0, 100, 411500, '师河区');
INSERT INTO `sys_address_area` VALUES (411503, 0, 100, 411500, '平桥区');
INSERT INTO `sys_address_area` VALUES (411521, 0, 100, 411500, '罗山县');
INSERT INTO `sys_address_area` VALUES (411522, 0, 100, 411500, '光山县');
INSERT INTO `sys_address_area` VALUES (411523, 0, 100, 411500, '新　县');
INSERT INTO `sys_address_area` VALUES (411524, 0, 100, 411500, '商城县');
INSERT INTO `sys_address_area` VALUES (411525, 0, 100, 411500, '固始县');
INSERT INTO `sys_address_area` VALUES (411526, 0, 100, 411500, '潢川县');
INSERT INTO `sys_address_area` VALUES (411527, 0, 100, 411500, '淮滨县');
INSERT INTO `sys_address_area` VALUES (411528, 0, 100, 411500, '息　县');
INSERT INTO `sys_address_area` VALUES (411601, 0, 100, 411600, '市辖区');
INSERT INTO `sys_address_area` VALUES (411602, 0, 100, 411600, '川汇区');
INSERT INTO `sys_address_area` VALUES (411621, 0, 100, 411600, '扶沟县');
INSERT INTO `sys_address_area` VALUES (411622, 0, 100, 411600, '西华县');
INSERT INTO `sys_address_area` VALUES (411623, 0, 100, 411600, '商水县');
INSERT INTO `sys_address_area` VALUES (411624, 0, 100, 411600, '沈丘县');
INSERT INTO `sys_address_area` VALUES (411625, 0, 100, 411600, '郸城县');
INSERT INTO `sys_address_area` VALUES (411626, 0, 100, 411600, '淮阳县');
INSERT INTO `sys_address_area` VALUES (411627, 0, 100, 411600, '太康县');
INSERT INTO `sys_address_area` VALUES (411628, 0, 100, 411600, '鹿邑县');
INSERT INTO `sys_address_area` VALUES (411681, 0, 100, 411600, '项城市');
INSERT INTO `sys_address_area` VALUES (411701, 0, 100, 411700, '市辖区');
INSERT INTO `sys_address_area` VALUES (411702, 0, 100, 411700, '驿城区');
INSERT INTO `sys_address_area` VALUES (411721, 0, 100, 411700, '西平县');
INSERT INTO `sys_address_area` VALUES (411722, 0, 100, 411700, '上蔡县');
INSERT INTO `sys_address_area` VALUES (411723, 0, 100, 411700, '平舆县');
INSERT INTO `sys_address_area` VALUES (411724, 0, 100, 411700, '正阳县');
INSERT INTO `sys_address_area` VALUES (411725, 0, 100, 411700, '确山县');
INSERT INTO `sys_address_area` VALUES (411726, 0, 100, 411700, '泌阳县');
INSERT INTO `sys_address_area` VALUES (411727, 0, 100, 411700, '汝南县');
INSERT INTO `sys_address_area` VALUES (411728, 0, 100, 411700, '遂平县');
INSERT INTO `sys_address_area` VALUES (411729, 0, 100, 411700, '新蔡县');
INSERT INTO `sys_address_area` VALUES (420101, 0, 100, 420100, '市辖区');
INSERT INTO `sys_address_area` VALUES (420102, 0, 100, 420100, '江岸区');
INSERT INTO `sys_address_area` VALUES (420103, 0, 100, 420100, '江汉区');
INSERT INTO `sys_address_area` VALUES (420104, 0, 100, 420100, '乔口区');
INSERT INTO `sys_address_area` VALUES (420105, 0, 100, 420100, '汉阳区');
INSERT INTO `sys_address_area` VALUES (420106, 0, 100, 420100, '武昌区');
INSERT INTO `sys_address_area` VALUES (420107, 0, 100, 420100, '青山区');
INSERT INTO `sys_address_area` VALUES (420111, 0, 100, 420100, '洪山区');
INSERT INTO `sys_address_area` VALUES (420112, 0, 100, 420100, '东西湖区');
INSERT INTO `sys_address_area` VALUES (420113, 0, 100, 420100, '汉南区');
INSERT INTO `sys_address_area` VALUES (420114, 0, 100, 420100, '蔡甸区');
INSERT INTO `sys_address_area` VALUES (420115, 0, 100, 420100, '江夏区');
INSERT INTO `sys_address_area` VALUES (420116, 0, 100, 420100, '黄陂区');
INSERT INTO `sys_address_area` VALUES (420117, 0, 100, 420100, '新洲区');
INSERT INTO `sys_address_area` VALUES (420201, 0, 100, 420200, '市辖区');
INSERT INTO `sys_address_area` VALUES (420202, 0, 100, 420200, '黄石港区');
INSERT INTO `sys_address_area` VALUES (420203, 0, 100, 420200, '西塞山区');
INSERT INTO `sys_address_area` VALUES (420204, 0, 100, 420200, '下陆区');
INSERT INTO `sys_address_area` VALUES (420205, 0, 100, 420200, '铁山区');
INSERT INTO `sys_address_area` VALUES (420222, 0, 100, 420200, '阳新县');
INSERT INTO `sys_address_area` VALUES (420281, 0, 100, 420200, '大冶市');
INSERT INTO `sys_address_area` VALUES (420301, 0, 100, 420300, '市辖区');
INSERT INTO `sys_address_area` VALUES (420302, 0, 100, 420300, '茅箭区');
INSERT INTO `sys_address_area` VALUES (420303, 0, 100, 420300, '张湾区');
INSERT INTO `sys_address_area` VALUES (420321, 0, 100, 420300, '郧　县');
INSERT INTO `sys_address_area` VALUES (420322, 0, 100, 420300, '郧西县');
INSERT INTO `sys_address_area` VALUES (420323, 0, 100, 420300, '竹山县');
INSERT INTO `sys_address_area` VALUES (420324, 0, 100, 420300, '竹溪县');
INSERT INTO `sys_address_area` VALUES (420325, 0, 100, 420300, '房　县');
INSERT INTO `sys_address_area` VALUES (420381, 0, 100, 420300, '丹江口市');
INSERT INTO `sys_address_area` VALUES (420501, 0, 100, 420500, '市辖区');
INSERT INTO `sys_address_area` VALUES (420502, 0, 100, 420500, '西陵区');
INSERT INTO `sys_address_area` VALUES (420503, 0, 100, 420500, '伍家岗区');
INSERT INTO `sys_address_area` VALUES (420504, 0, 100, 420500, '点军区');
INSERT INTO `sys_address_area` VALUES (420505, 0, 100, 420500, '猇亭区');
INSERT INTO `sys_address_area` VALUES (420506, 0, 100, 420500, '夷陵区');
INSERT INTO `sys_address_area` VALUES (420525, 0, 100, 420500, '远安县');
INSERT INTO `sys_address_area` VALUES (420526, 0, 100, 420500, '兴山县');
INSERT INTO `sys_address_area` VALUES (420527, 0, 100, 420500, '秭归县');
INSERT INTO `sys_address_area` VALUES (420528, 0, 100, 420500, '长阳土家族自治县');
INSERT INTO `sys_address_area` VALUES (420529, 0, 100, 420500, '五峰土家族自治县');
INSERT INTO `sys_address_area` VALUES (420581, 0, 100, 420500, '宜都市');
INSERT INTO `sys_address_area` VALUES (420582, 0, 100, 420500, '当阳市');
INSERT INTO `sys_address_area` VALUES (420583, 0, 100, 420500, '枝江市');
INSERT INTO `sys_address_area` VALUES (420601, 0, 100, 420600, '市辖区');
INSERT INTO `sys_address_area` VALUES (420602, 0, 100, 420600, '襄城区');
INSERT INTO `sys_address_area` VALUES (420606, 0, 100, 420600, '樊城区');
INSERT INTO `sys_address_area` VALUES (420607, 0, 100, 420600, '襄阳区');
INSERT INTO `sys_address_area` VALUES (420624, 0, 100, 420600, '南漳县');
INSERT INTO `sys_address_area` VALUES (420625, 0, 100, 420600, '谷城县');
INSERT INTO `sys_address_area` VALUES (420626, 0, 100, 420600, '保康县');
INSERT INTO `sys_address_area` VALUES (420682, 0, 100, 420600, '老河口市');
INSERT INTO `sys_address_area` VALUES (420683, 0, 100, 420600, '枣阳市');
INSERT INTO `sys_address_area` VALUES (420684, 0, 100, 420600, '宜城市');
INSERT INTO `sys_address_area` VALUES (420701, 0, 100, 420700, '市辖区');
INSERT INTO `sys_address_area` VALUES (420702, 0, 100, 420700, '梁子湖区');
INSERT INTO `sys_address_area` VALUES (420703, 0, 100, 420700, '华容区');
INSERT INTO `sys_address_area` VALUES (420704, 0, 100, 420700, '鄂城区');
INSERT INTO `sys_address_area` VALUES (420801, 0, 100, 420800, '市辖区');
INSERT INTO `sys_address_area` VALUES (420802, 0, 100, 420800, '东宝区');
INSERT INTO `sys_address_area` VALUES (420804, 0, 100, 420800, '掇刀区');
INSERT INTO `sys_address_area` VALUES (420821, 0, 100, 420800, '京山县');
INSERT INTO `sys_address_area` VALUES (420822, 0, 100, 420800, '沙洋县');
INSERT INTO `sys_address_area` VALUES (420881, 0, 100, 420800, '钟祥市');
INSERT INTO `sys_address_area` VALUES (420901, 0, 100, 420900, '市辖区');
INSERT INTO `sys_address_area` VALUES (420902, 0, 100, 420900, '孝南区');
INSERT INTO `sys_address_area` VALUES (420921, 0, 100, 420900, '孝昌县');
INSERT INTO `sys_address_area` VALUES (420922, 0, 100, 420900, '大悟县');
INSERT INTO `sys_address_area` VALUES (420923, 0, 100, 420900, '云梦县');
INSERT INTO `sys_address_area` VALUES (420981, 0, 100, 420900, '应城市');
INSERT INTO `sys_address_area` VALUES (420982, 0, 100, 420900, '安陆市');
INSERT INTO `sys_address_area` VALUES (420984, 0, 100, 420900, '汉川市');
INSERT INTO `sys_address_area` VALUES (421001, 0, 100, 421000, '市辖区');
INSERT INTO `sys_address_area` VALUES (421002, 0, 100, 421000, '沙市区');
INSERT INTO `sys_address_area` VALUES (421003, 0, 100, 421000, '荆州区');
INSERT INTO `sys_address_area` VALUES (421022, 0, 100, 421000, '公安县');
INSERT INTO `sys_address_area` VALUES (421023, 0, 100, 421000, '监利县');
INSERT INTO `sys_address_area` VALUES (421024, 0, 100, 421000, '江陵县');
INSERT INTO `sys_address_area` VALUES (421081, 0, 100, 421000, '石首市');
INSERT INTO `sys_address_area` VALUES (421083, 0, 100, 421000, '洪湖市');
INSERT INTO `sys_address_area` VALUES (421087, 0, 100, 421000, '松滋市');
INSERT INTO `sys_address_area` VALUES (421101, 0, 100, 421100, '市辖区');
INSERT INTO `sys_address_area` VALUES (421102, 0, 100, 421100, '黄州区');
INSERT INTO `sys_address_area` VALUES (421121, 0, 100, 421100, '团风县');
INSERT INTO `sys_address_area` VALUES (421122, 0, 100, 421100, '红安县');
INSERT INTO `sys_address_area` VALUES (421123, 0, 100, 421100, '罗田县');
INSERT INTO `sys_address_area` VALUES (421124, 0, 100, 421100, '英山县');
INSERT INTO `sys_address_area` VALUES (421125, 0, 100, 421100, '浠水县');
INSERT INTO `sys_address_area` VALUES (421126, 0, 100, 421100, '蕲春县');
INSERT INTO `sys_address_area` VALUES (421127, 0, 100, 421100, '黄梅县');
INSERT INTO `sys_address_area` VALUES (421181, 0, 100, 421100, '麻城市');
INSERT INTO `sys_address_area` VALUES (421182, 0, 100, 421100, '武穴市');
INSERT INTO `sys_address_area` VALUES (421201, 0, 100, 421200, '市辖区');
INSERT INTO `sys_address_area` VALUES (421202, 0, 100, 421200, '咸安区');
INSERT INTO `sys_address_area` VALUES (421221, 0, 100, 421200, '嘉鱼县');
INSERT INTO `sys_address_area` VALUES (421222, 0, 100, 421200, '通城县');
INSERT INTO `sys_address_area` VALUES (421223, 0, 100, 421200, '崇阳县');
INSERT INTO `sys_address_area` VALUES (421224, 0, 100, 421200, '通山县');
INSERT INTO `sys_address_area` VALUES (421281, 0, 100, 421200, '赤壁市');
INSERT INTO `sys_address_area` VALUES (421301, 0, 100, 421300, '市辖区');
INSERT INTO `sys_address_area` VALUES (421302, 0, 100, 421300, '曾都区');
INSERT INTO `sys_address_area` VALUES (421381, 0, 100, 421300, '广水市');
INSERT INTO `sys_address_area` VALUES (422801, 0, 100, 422800, '恩施市');
INSERT INTO `sys_address_area` VALUES (422802, 0, 100, 422800, '利川市');
INSERT INTO `sys_address_area` VALUES (422822, 0, 100, 422800, '建始县');
INSERT INTO `sys_address_area` VALUES (422823, 0, 100, 422800, '巴东县');
INSERT INTO `sys_address_area` VALUES (422825, 0, 100, 422800, '宣恩县');
INSERT INTO `sys_address_area` VALUES (422826, 0, 100, 422800, '咸丰县');
INSERT INTO `sys_address_area` VALUES (422827, 0, 100, 422800, '来凤县');
INSERT INTO `sys_address_area` VALUES (422828, 0, 100, 422800, '鹤峰县');
INSERT INTO `sys_address_area` VALUES (429004, 0, 100, 429000, '仙桃市');
INSERT INTO `sys_address_area` VALUES (429005, 0, 100, 429000, '潜江市');
INSERT INTO `sys_address_area` VALUES (429006, 0, 100, 429000, '天门市');
INSERT INTO `sys_address_area` VALUES (429021, 0, 100, 429000, '神农架林区');
INSERT INTO `sys_address_area` VALUES (430101, 0, 100, 430100, '市辖区');
INSERT INTO `sys_address_area` VALUES (430102, 0, 100, 430100, '芙蓉区');
INSERT INTO `sys_address_area` VALUES (430103, 0, 100, 430100, '天心区');
INSERT INTO `sys_address_area` VALUES (430104, 0, 100, 430100, '岳麓区');
INSERT INTO `sys_address_area` VALUES (430105, 0, 100, 430100, '开福区');
INSERT INTO `sys_address_area` VALUES (430111, 0, 100, 430100, '雨花区');
INSERT INTO `sys_address_area` VALUES (430121, 0, 100, 430100, '长沙县');
INSERT INTO `sys_address_area` VALUES (430122, 0, 100, 430100, '望城县');
INSERT INTO `sys_address_area` VALUES (430124, 0, 100, 430100, '宁乡县');
INSERT INTO `sys_address_area` VALUES (430181, 0, 100, 430100, '浏阳市');
INSERT INTO `sys_address_area` VALUES (430201, 0, 100, 430200, '市辖区');
INSERT INTO `sys_address_area` VALUES (430202, 0, 100, 430200, '荷塘区');
INSERT INTO `sys_address_area` VALUES (430203, 0, 100, 430200, '芦淞区');
INSERT INTO `sys_address_area` VALUES (430204, 0, 100, 430200, '石峰区');
INSERT INTO `sys_address_area` VALUES (430211, 0, 100, 430200, '天元区');
INSERT INTO `sys_address_area` VALUES (430221, 0, 100, 430200, '株洲县');
INSERT INTO `sys_address_area` VALUES (430223, 0, 100, 430200, '攸　县');
INSERT INTO `sys_address_area` VALUES (430224, 0, 100, 430200, '茶陵县');
INSERT INTO `sys_address_area` VALUES (430225, 0, 100, 430200, '炎陵县');
INSERT INTO `sys_address_area` VALUES (430281, 0, 100, 430200, '醴陵市');
INSERT INTO `sys_address_area` VALUES (430301, 0, 100, 430300, '市辖区');
INSERT INTO `sys_address_area` VALUES (430302, 0, 100, 430300, '雨湖区');
INSERT INTO `sys_address_area` VALUES (430304, 0, 100, 430300, '岳塘区');
INSERT INTO `sys_address_area` VALUES (430321, 0, 100, 430300, '湘潭县');
INSERT INTO `sys_address_area` VALUES (430381, 0, 100, 430300, '湘乡市');
INSERT INTO `sys_address_area` VALUES (430382, 0, 100, 430300, '韶山市');
INSERT INTO `sys_address_area` VALUES (430401, 0, 100, 430400, '市辖区');
INSERT INTO `sys_address_area` VALUES (430405, 0, 100, 430400, '珠晖区');
INSERT INTO `sys_address_area` VALUES (430406, 0, 100, 430400, '雁峰区');
INSERT INTO `sys_address_area` VALUES (430407, 0, 100, 430400, '石鼓区');
INSERT INTO `sys_address_area` VALUES (430408, 0, 100, 430400, '蒸湘区');
INSERT INTO `sys_address_area` VALUES (430412, 0, 100, 430400, '南岳区');
INSERT INTO `sys_address_area` VALUES (430421, 0, 100, 430400, '衡阳县');
INSERT INTO `sys_address_area` VALUES (430422, 0, 100, 430400, '衡南县');
INSERT INTO `sys_address_area` VALUES (430423, 0, 100, 430400, '衡山县');
INSERT INTO `sys_address_area` VALUES (430424, 0, 100, 430400, '衡东县');
INSERT INTO `sys_address_area` VALUES (430426, 0, 100, 430400, '祁东县');
INSERT INTO `sys_address_area` VALUES (430481, 0, 100, 430400, '耒阳市');
INSERT INTO `sys_address_area` VALUES (430482, 0, 100, 430400, '常宁市');
INSERT INTO `sys_address_area` VALUES (430501, 0, 100, 430500, '市辖区');
INSERT INTO `sys_address_area` VALUES (430502, 0, 100, 430500, '双清区');
INSERT INTO `sys_address_area` VALUES (430503, 0, 100, 430500, '大祥区');
INSERT INTO `sys_address_area` VALUES (430511, 0, 100, 430500, '北塔区');
INSERT INTO `sys_address_area` VALUES (430521, 0, 100, 430500, '邵东县');
INSERT INTO `sys_address_area` VALUES (430522, 0, 100, 430500, '新邵县');
INSERT INTO `sys_address_area` VALUES (430523, 0, 100, 430500, '邵阳县');
INSERT INTO `sys_address_area` VALUES (430524, 0, 100, 430500, '隆回县');
INSERT INTO `sys_address_area` VALUES (430525, 0, 100, 430500, '洞口县');
INSERT INTO `sys_address_area` VALUES (430527, 0, 100, 430500, '绥宁县');
INSERT INTO `sys_address_area` VALUES (430528, 0, 100, 430500, '新宁县');
INSERT INTO `sys_address_area` VALUES (430529, 0, 100, 430500, '城步苗族自治县');
INSERT INTO `sys_address_area` VALUES (430581, 0, 100, 430500, '武冈市');
INSERT INTO `sys_address_area` VALUES (430601, 0, 100, 430600, '市辖区');
INSERT INTO `sys_address_area` VALUES (430602, 0, 100, 430600, '岳阳楼区');
INSERT INTO `sys_address_area` VALUES (430603, 0, 100, 430600, '云溪区');
INSERT INTO `sys_address_area` VALUES (430611, 0, 100, 430600, '君山区');
INSERT INTO `sys_address_area` VALUES (430621, 0, 100, 430600, '岳阳县');
INSERT INTO `sys_address_area` VALUES (430623, 0, 100, 430600, '华容县');
INSERT INTO `sys_address_area` VALUES (430624, 0, 100, 430600, '湘阴县');
INSERT INTO `sys_address_area` VALUES (430626, 0, 100, 430600, '平江县');
INSERT INTO `sys_address_area` VALUES (430681, 0, 100, 430600, '汨罗市');
INSERT INTO `sys_address_area` VALUES (430682, 0, 100, 430600, '临湘市');
INSERT INTO `sys_address_area` VALUES (430701, 0, 100, 430700, '市辖区');
INSERT INTO `sys_address_area` VALUES (430702, 0, 100, 430700, '武陵区');
INSERT INTO `sys_address_area` VALUES (430703, 0, 100, 430700, '鼎城区');
INSERT INTO `sys_address_area` VALUES (430721, 0, 100, 430700, '安乡县');
INSERT INTO `sys_address_area` VALUES (430722, 0, 100, 430700, '汉寿县');
INSERT INTO `sys_address_area` VALUES (430723, 0, 100, 430700, '澧　县');
INSERT INTO `sys_address_area` VALUES (430724, 0, 100, 430700, '临澧县');
INSERT INTO `sys_address_area` VALUES (430725, 0, 100, 430700, '桃源县');
INSERT INTO `sys_address_area` VALUES (430726, 0, 100, 430700, '石门县');
INSERT INTO `sys_address_area` VALUES (430781, 0, 100, 430700, '津市市');
INSERT INTO `sys_address_area` VALUES (430801, 0, 100, 430800, '市辖区');
INSERT INTO `sys_address_area` VALUES (430802, 0, 100, 430800, '永定区');
INSERT INTO `sys_address_area` VALUES (430811, 0, 100, 430800, '武陵源区');
INSERT INTO `sys_address_area` VALUES (430821, 0, 100, 430800, '慈利县');
INSERT INTO `sys_address_area` VALUES (430822, 0, 100, 430800, '桑植县');
INSERT INTO `sys_address_area` VALUES (430901, 0, 100, 430900, '市辖区');
INSERT INTO `sys_address_area` VALUES (430902, 0, 100, 430900, '资阳区');
INSERT INTO `sys_address_area` VALUES (430903, 0, 100, 430900, '赫山区');
INSERT INTO `sys_address_area` VALUES (430921, 0, 100, 430900, '南　县');
INSERT INTO `sys_address_area` VALUES (430922, 0, 100, 430900, '桃江县');
INSERT INTO `sys_address_area` VALUES (430923, 0, 100, 430900, '安化县');
INSERT INTO `sys_address_area` VALUES (430981, 0, 100, 430900, '沅江市');
INSERT INTO `sys_address_area` VALUES (431001, 0, 100, 431000, '市辖区');
INSERT INTO `sys_address_area` VALUES (431002, 0, 100, 431000, '北湖区');
INSERT INTO `sys_address_area` VALUES (431003, 0, 100, 431000, '苏仙区');
INSERT INTO `sys_address_area` VALUES (431021, 0, 100, 431000, '桂阳县');
INSERT INTO `sys_address_area` VALUES (431022, 0, 100, 431000, '宜章县');
INSERT INTO `sys_address_area` VALUES (431023, 0, 100, 431000, '永兴县');
INSERT INTO `sys_address_area` VALUES (431024, 0, 100, 431000, '嘉禾县');
INSERT INTO `sys_address_area` VALUES (431025, 0, 100, 431000, '临武县');
INSERT INTO `sys_address_area` VALUES (431026, 0, 100, 431000, '汝城县');
INSERT INTO `sys_address_area` VALUES (431027, 0, 100, 431000, '桂东县');
INSERT INTO `sys_address_area` VALUES (431028, 0, 100, 431000, '安仁县');
INSERT INTO `sys_address_area` VALUES (431081, 0, 100, 431000, '资兴市');
INSERT INTO `sys_address_area` VALUES (431101, 0, 100, 431100, '市辖区');
INSERT INTO `sys_address_area` VALUES (431102, 0, 100, 431100, '芝山区');
INSERT INTO `sys_address_area` VALUES (431103, 0, 100, 431100, '冷水滩区');
INSERT INTO `sys_address_area` VALUES (431121, 0, 100, 431100, '祁阳县');
INSERT INTO `sys_address_area` VALUES (431122, 0, 100, 431100, '东安县');
INSERT INTO `sys_address_area` VALUES (431123, 0, 100, 431100, '双牌县');
INSERT INTO `sys_address_area` VALUES (431124, 0, 100, 431100, '道　县');
INSERT INTO `sys_address_area` VALUES (431125, 0, 100, 431100, '江永县');
INSERT INTO `sys_address_area` VALUES (431126, 0, 100, 431100, '宁远县');
INSERT INTO `sys_address_area` VALUES (431127, 0, 100, 431100, '蓝山县');
INSERT INTO `sys_address_area` VALUES (431128, 0, 100, 431100, '新田县');
INSERT INTO `sys_address_area` VALUES (431129, 0, 100, 431100, '江华瑶族自治县');
INSERT INTO `sys_address_area` VALUES (431201, 0, 100, 431200, '市辖区');
INSERT INTO `sys_address_area` VALUES (431202, 0, 100, 431200, '鹤城区');
INSERT INTO `sys_address_area` VALUES (431221, 0, 100, 431200, '中方县');
INSERT INTO `sys_address_area` VALUES (431222, 0, 100, 431200, '沅陵县');
INSERT INTO `sys_address_area` VALUES (431223, 0, 100, 431200, '辰溪县');
INSERT INTO `sys_address_area` VALUES (431224, 0, 100, 431200, '溆浦县');
INSERT INTO `sys_address_area` VALUES (431225, 0, 100, 431200, '会同县');
INSERT INTO `sys_address_area` VALUES (431226, 0, 100, 431200, '麻阳苗族自治县');
INSERT INTO `sys_address_area` VALUES (431227, 0, 100, 431200, '新晃侗族自治县');
INSERT INTO `sys_address_area` VALUES (431228, 0, 100, 431200, '芷江侗族自治县');
INSERT INTO `sys_address_area` VALUES (431229, 0, 100, 431200, '靖州苗族侗族自治县');
INSERT INTO `sys_address_area` VALUES (431230, 0, 100, 431200, '通道侗族自治县');
INSERT INTO `sys_address_area` VALUES (431281, 0, 100, 431200, '洪江市');
INSERT INTO `sys_address_area` VALUES (431301, 0, 100, 431300, '市辖区');
INSERT INTO `sys_address_area` VALUES (431302, 0, 100, 431300, '娄星区');
INSERT INTO `sys_address_area` VALUES (431321, 0, 100, 431300, '双峰县');
INSERT INTO `sys_address_area` VALUES (431322, 0, 100, 431300, '新化县');
INSERT INTO `sys_address_area` VALUES (431381, 0, 100, 431300, '冷水江市');
INSERT INTO `sys_address_area` VALUES (431382, 0, 100, 431300, '涟源市');
INSERT INTO `sys_address_area` VALUES (433101, 0, 100, 433100, '吉首市');
INSERT INTO `sys_address_area` VALUES (433122, 0, 100, 433100, '泸溪县');
INSERT INTO `sys_address_area` VALUES (433123, 0, 100, 433100, '凤凰县');
INSERT INTO `sys_address_area` VALUES (433124, 0, 100, 433100, '花垣县');
INSERT INTO `sys_address_area` VALUES (433125, 0, 100, 433100, '保靖县');
INSERT INTO `sys_address_area` VALUES (433126, 0, 100, 433100, '古丈县');
INSERT INTO `sys_address_area` VALUES (433127, 0, 100, 433100, '永顺县');
INSERT INTO `sys_address_area` VALUES (433130, 0, 100, 433100, '龙山县');
INSERT INTO `sys_address_area` VALUES (440101, 0, 100, 440100, '市辖区');
INSERT INTO `sys_address_area` VALUES (440102, 0, 100, 440100, '东山区');
INSERT INTO `sys_address_area` VALUES (440103, 0, 100, 440100, '荔湾区');
INSERT INTO `sys_address_area` VALUES (440104, 0, 100, 440100, '越秀区');
INSERT INTO `sys_address_area` VALUES (440105, 0, 100, 440100, '海珠区');
INSERT INTO `sys_address_area` VALUES (440106, 0, 100, 440100, '天河区');
INSERT INTO `sys_address_area` VALUES (440107, 0, 100, 440100, '芳村区');
INSERT INTO `sys_address_area` VALUES (440111, 0, 100, 440100, '白云区');
INSERT INTO `sys_address_area` VALUES (440112, 0, 100, 440100, '黄埔区');
INSERT INTO `sys_address_area` VALUES (440113, 0, 100, 440100, '番禺区');
INSERT INTO `sys_address_area` VALUES (440114, 0, 100, 440100, '花都区');
INSERT INTO `sys_address_area` VALUES (440183, 0, 100, 440100, '增城市');
INSERT INTO `sys_address_area` VALUES (440184, 0, 100, 440100, '从化市');
INSERT INTO `sys_address_area` VALUES (440201, 0, 100, 440200, '市辖区');
INSERT INTO `sys_address_area` VALUES (440203, 0, 100, 440200, '武江区');
INSERT INTO `sys_address_area` VALUES (440204, 0, 100, 440200, '浈江区');
INSERT INTO `sys_address_area` VALUES (440205, 0, 100, 440200, '曲江区');
INSERT INTO `sys_address_area` VALUES (440222, 0, 100, 440200, '始兴县');
INSERT INTO `sys_address_area` VALUES (440224, 0, 100, 440200, '仁化县');
INSERT INTO `sys_address_area` VALUES (440229, 0, 100, 440200, '翁源县');
INSERT INTO `sys_address_area` VALUES (440232, 0, 100, 440200, '乳源瑶族自治县');
INSERT INTO `sys_address_area` VALUES (440233, 0, 100, 440200, '新丰县');
INSERT INTO `sys_address_area` VALUES (440281, 0, 100, 440200, '乐昌市');
INSERT INTO `sys_address_area` VALUES (440282, 0, 100, 440200, '南雄市');
INSERT INTO `sys_address_area` VALUES (440301, 0, 100, 440300, '市辖区');
INSERT INTO `sys_address_area` VALUES (440303, 0, 100, 440300, '罗湖区');
INSERT INTO `sys_address_area` VALUES (440304, 0, 100, 440300, '福田区');
INSERT INTO `sys_address_area` VALUES (440305, 0, 100, 440300, '南山区');
INSERT INTO `sys_address_area` VALUES (440306, 0, 100, 440300, '宝安区');
INSERT INTO `sys_address_area` VALUES (440307, 0, 100, 440300, '龙岗区');
INSERT INTO `sys_address_area` VALUES (440308, 0, 100, 440300, '盐田区');
INSERT INTO `sys_address_area` VALUES (440401, 0, 100, 440400, '市辖区');
INSERT INTO `sys_address_area` VALUES (440402, 0, 100, 440400, '香洲区');
INSERT INTO `sys_address_area` VALUES (440403, 0, 100, 440400, '斗门区');
INSERT INTO `sys_address_area` VALUES (440404, 0, 100, 440400, '金湾区');
INSERT INTO `sys_address_area` VALUES (440501, 0, 100, 440500, '市辖区');
INSERT INTO `sys_address_area` VALUES (440507, 0, 100, 440500, '龙湖区');
INSERT INTO `sys_address_area` VALUES (440511, 0, 100, 440500, '金平区');
INSERT INTO `sys_address_area` VALUES (440512, 0, 100, 440500, '濠江区');
INSERT INTO `sys_address_area` VALUES (440513, 0, 100, 440500, '潮阳区');
INSERT INTO `sys_address_area` VALUES (440514, 0, 100, 440500, '潮南区');
INSERT INTO `sys_address_area` VALUES (440515, 0, 100, 440500, '澄海区');
INSERT INTO `sys_address_area` VALUES (440523, 0, 100, 440500, '南澳县');
INSERT INTO `sys_address_area` VALUES (440601, 0, 100, 440600, '市辖区');
INSERT INTO `sys_address_area` VALUES (440604, 0, 100, 440600, '禅城区');
INSERT INTO `sys_address_area` VALUES (440605, 0, 100, 440600, '南海区');
INSERT INTO `sys_address_area` VALUES (440606, 0, 100, 440600, '顺德区');
INSERT INTO `sys_address_area` VALUES (440607, 0, 100, 440600, '三水区');
INSERT INTO `sys_address_area` VALUES (440608, 0, 100, 440600, '高明区');
INSERT INTO `sys_address_area` VALUES (440701, 0, 100, 440700, '市辖区');
INSERT INTO `sys_address_area` VALUES (440703, 0, 100, 440700, '蓬江区');
INSERT INTO `sys_address_area` VALUES (440704, 0, 100, 440700, '江海区');
INSERT INTO `sys_address_area` VALUES (440705, 0, 100, 440700, '新会区');
INSERT INTO `sys_address_area` VALUES (440781, 0, 100, 440700, '台山市');
INSERT INTO `sys_address_area` VALUES (440783, 0, 100, 440700, '开平市');
INSERT INTO `sys_address_area` VALUES (440784, 0, 100, 440700, '鹤山市');
INSERT INTO `sys_address_area` VALUES (440785, 0, 100, 440700, '恩平市');
INSERT INTO `sys_address_area` VALUES (440801, 0, 100, 440800, '市辖区');
INSERT INTO `sys_address_area` VALUES (440802, 0, 100, 440800, '赤坎区');
INSERT INTO `sys_address_area` VALUES (440803, 0, 100, 440800, '霞山区');
INSERT INTO `sys_address_area` VALUES (440804, 0, 100, 440800, '坡头区');
INSERT INTO `sys_address_area` VALUES (440811, 0, 100, 440800, '麻章区');
INSERT INTO `sys_address_area` VALUES (440823, 0, 100, 440800, '遂溪县');
INSERT INTO `sys_address_area` VALUES (440825, 0, 100, 440800, '徐闻县');
INSERT INTO `sys_address_area` VALUES (440881, 0, 100, 440800, '廉江市');
INSERT INTO `sys_address_area` VALUES (440882, 0, 100, 440800, '雷州市');
INSERT INTO `sys_address_area` VALUES (440883, 0, 100, 440800, '吴川市');
INSERT INTO `sys_address_area` VALUES (440901, 0, 100, 440900, '市辖区');
INSERT INTO `sys_address_area` VALUES (440902, 0, 100, 440900, '茂南区');
INSERT INTO `sys_address_area` VALUES (440903, 0, 100, 440900, '茂港区');
INSERT INTO `sys_address_area` VALUES (440923, 0, 100, 440900, '电白县');
INSERT INTO `sys_address_area` VALUES (440981, 0, 100, 440900, '高州市');
INSERT INTO `sys_address_area` VALUES (440982, 0, 100, 440900, '化州市');
INSERT INTO `sys_address_area` VALUES (440983, 0, 100, 440900, '信宜市');
INSERT INTO `sys_address_area` VALUES (441201, 0, 100, 441200, '市辖区');
INSERT INTO `sys_address_area` VALUES (441202, 0, 100, 441200, '端州区');
INSERT INTO `sys_address_area` VALUES (441203, 0, 100, 441200, '鼎湖区');
INSERT INTO `sys_address_area` VALUES (441223, 0, 100, 441200, '广宁县');
INSERT INTO `sys_address_area` VALUES (441224, 0, 100, 441200, '怀集县');
INSERT INTO `sys_address_area` VALUES (441225, 0, 100, 441200, '封开县');
INSERT INTO `sys_address_area` VALUES (441226, 0, 100, 441200, '德庆县');
INSERT INTO `sys_address_area` VALUES (441283, 0, 100, 441200, '高要市');
INSERT INTO `sys_address_area` VALUES (441284, 0, 100, 441200, '四会市');
INSERT INTO `sys_address_area` VALUES (441301, 0, 100, 441300, '市辖区');
INSERT INTO `sys_address_area` VALUES (441302, 0, 100, 441300, '惠城区');
INSERT INTO `sys_address_area` VALUES (441303, 0, 100, 441300, '惠阳区');
INSERT INTO `sys_address_area` VALUES (441322, 0, 100, 441300, '博罗县');
INSERT INTO `sys_address_area` VALUES (441323, 0, 100, 441300, '惠东县');
INSERT INTO `sys_address_area` VALUES (441324, 0, 100, 441300, '龙门县');
INSERT INTO `sys_address_area` VALUES (441401, 0, 100, 441400, '市辖区');
INSERT INTO `sys_address_area` VALUES (441402, 0, 100, 441400, '梅江区');
INSERT INTO `sys_address_area` VALUES (441421, 0, 100, 441400, '梅　县');
INSERT INTO `sys_address_area` VALUES (441422, 0, 100, 441400, '大埔县');
INSERT INTO `sys_address_area` VALUES (441423, 0, 100, 441400, '丰顺县');
INSERT INTO `sys_address_area` VALUES (441424, 0, 100, 441400, '五华县');
INSERT INTO `sys_address_area` VALUES (441426, 0, 100, 441400, '平远县');
INSERT INTO `sys_address_area` VALUES (441427, 0, 100, 441400, '蕉岭县');
INSERT INTO `sys_address_area` VALUES (441481, 0, 100, 441400, '兴宁市');
INSERT INTO `sys_address_area` VALUES (441501, 0, 100, 441500, '市辖区');
INSERT INTO `sys_address_area` VALUES (441502, 0, 100, 441500, '城　区');
INSERT INTO `sys_address_area` VALUES (441521, 0, 100, 441500, '海丰县');
INSERT INTO `sys_address_area` VALUES (441523, 0, 100, 441500, '陆河县');
INSERT INTO `sys_address_area` VALUES (441581, 0, 100, 441500, '陆丰市');
INSERT INTO `sys_address_area` VALUES (441601, 0, 100, 441600, '市辖区');
INSERT INTO `sys_address_area` VALUES (441602, 0, 100, 441600, '源城区');
INSERT INTO `sys_address_area` VALUES (441621, 0, 100, 441600, '紫金县');
INSERT INTO `sys_address_area` VALUES (441622, 0, 100, 441600, '龙川县');
INSERT INTO `sys_address_area` VALUES (441623, 0, 100, 441600, '连平县');
INSERT INTO `sys_address_area` VALUES (441624, 0, 100, 441600, '和平县');
INSERT INTO `sys_address_area` VALUES (441625, 0, 100, 441600, '东源县');
INSERT INTO `sys_address_area` VALUES (441701, 0, 100, 441700, '市辖区');
INSERT INTO `sys_address_area` VALUES (441702, 0, 100, 441700, '江城区');
INSERT INTO `sys_address_area` VALUES (441721, 0, 100, 441700, '阳西县');
INSERT INTO `sys_address_area` VALUES (441723, 0, 100, 441700, '阳东县');
INSERT INTO `sys_address_area` VALUES (441781, 0, 100, 441700, '阳春市');
INSERT INTO `sys_address_area` VALUES (441801, 0, 100, 441800, '市辖区');
INSERT INTO `sys_address_area` VALUES (441802, 0, 100, 441800, '清城区');
INSERT INTO `sys_address_area` VALUES (441821, 0, 100, 441800, '佛冈县');
INSERT INTO `sys_address_area` VALUES (441823, 0, 100, 441800, '阳山县');
INSERT INTO `sys_address_area` VALUES (441825, 0, 100, 441800, '连山壮族瑶族自治县');
INSERT INTO `sys_address_area` VALUES (441826, 0, 100, 441800, '连南瑶族自治县');
INSERT INTO `sys_address_area` VALUES (441827, 0, 100, 441800, '清新县');
INSERT INTO `sys_address_area` VALUES (441881, 0, 100, 441800, '英德市');
INSERT INTO `sys_address_area` VALUES (441882, 0, 100, 441800, '连州市');
INSERT INTO `sys_address_area` VALUES (445101, 0, 100, 445100, '市辖区');
INSERT INTO `sys_address_area` VALUES (445102, 0, 100, 445100, '湘桥区');
INSERT INTO `sys_address_area` VALUES (445121, 0, 100, 445100, '潮安县');
INSERT INTO `sys_address_area` VALUES (445122, 0, 100, 445100, '饶平县');
INSERT INTO `sys_address_area` VALUES (445201, 0, 100, 445200, '市辖区');
INSERT INTO `sys_address_area` VALUES (445202, 0, 100, 445200, '榕城区');
INSERT INTO `sys_address_area` VALUES (445221, 0, 100, 445200, '揭东县');
INSERT INTO `sys_address_area` VALUES (445222, 0, 100, 445200, '揭西县');
INSERT INTO `sys_address_area` VALUES (445224, 0, 100, 445200, '惠来县');
INSERT INTO `sys_address_area` VALUES (445281, 0, 100, 445200, '普宁市');
INSERT INTO `sys_address_area` VALUES (445301, 0, 100, 445300, '市辖区');
INSERT INTO `sys_address_area` VALUES (445302, 0, 100, 445300, '云城区');
INSERT INTO `sys_address_area` VALUES (445321, 0, 100, 445300, '新兴县');
INSERT INTO `sys_address_area` VALUES (445322, 0, 100, 445300, '郁南县');
INSERT INTO `sys_address_area` VALUES (445323, 0, 100, 445300, '云安县');
INSERT INTO `sys_address_area` VALUES (445381, 0, 100, 445300, '罗定市');
INSERT INTO `sys_address_area` VALUES (450101, 0, 100, 450100, '市辖区');
INSERT INTO `sys_address_area` VALUES (450102, 0, 100, 450100, '兴宁区');
INSERT INTO `sys_address_area` VALUES (450103, 0, 100, 450100, '青秀区');
INSERT INTO `sys_address_area` VALUES (450105, 0, 100, 450100, '江南区');
INSERT INTO `sys_address_area` VALUES (450107, 0, 100, 450100, '西乡塘区');
INSERT INTO `sys_address_area` VALUES (450108, 0, 100, 450100, '良庆区');
INSERT INTO `sys_address_area` VALUES (450109, 0, 100, 450100, '邕宁区');
INSERT INTO `sys_address_area` VALUES (450122, 0, 100, 450100, '武鸣县');
INSERT INTO `sys_address_area` VALUES (450123, 0, 100, 450100, '隆安县');
INSERT INTO `sys_address_area` VALUES (450124, 0, 100, 450100, '马山县');
INSERT INTO `sys_address_area` VALUES (450125, 0, 100, 450100, '上林县');
INSERT INTO `sys_address_area` VALUES (450126, 0, 100, 450100, '宾阳县');
INSERT INTO `sys_address_area` VALUES (450127, 0, 100, 450100, '横　县');
INSERT INTO `sys_address_area` VALUES (450201, 0, 100, 450200, '市辖区');
INSERT INTO `sys_address_area` VALUES (450202, 0, 100, 450200, '城中区');
INSERT INTO `sys_address_area` VALUES (450203, 0, 100, 450200, '鱼峰区');
INSERT INTO `sys_address_area` VALUES (450204, 0, 100, 450200, '柳南区');
INSERT INTO `sys_address_area` VALUES (450205, 0, 100, 450200, '柳北区');
INSERT INTO `sys_address_area` VALUES (450221, 0, 100, 450200, '柳江县');
INSERT INTO `sys_address_area` VALUES (450222, 0, 100, 450200, '柳城县');
INSERT INTO `sys_address_area` VALUES (450223, 0, 100, 450200, '鹿寨县');
INSERT INTO `sys_address_area` VALUES (450224, 0, 100, 450200, '融安县');
INSERT INTO `sys_address_area` VALUES (450225, 0, 100, 450200, '融水苗族自治县');
INSERT INTO `sys_address_area` VALUES (450226, 0, 100, 450200, '三江侗族自治县');
INSERT INTO `sys_address_area` VALUES (450301, 0, 100, 450300, '市辖区');
INSERT INTO `sys_address_area` VALUES (450302, 0, 100, 450300, '秀峰区');
INSERT INTO `sys_address_area` VALUES (450303, 0, 100, 450300, '叠彩区');
INSERT INTO `sys_address_area` VALUES (450304, 0, 100, 450300, '象山区');
INSERT INTO `sys_address_area` VALUES (450305, 0, 100, 450300, '七星区');
INSERT INTO `sys_address_area` VALUES (450311, 0, 100, 450300, '雁山区');
INSERT INTO `sys_address_area` VALUES (450321, 0, 100, 450300, '阳朔县');
INSERT INTO `sys_address_area` VALUES (450322, 0, 100, 450300, '临桂县');
INSERT INTO `sys_address_area` VALUES (450323, 0, 100, 450300, '灵川县');
INSERT INTO `sys_address_area` VALUES (450324, 0, 100, 450300, '全州县');
INSERT INTO `sys_address_area` VALUES (450325, 0, 100, 450300, '兴安县');
INSERT INTO `sys_address_area` VALUES (450326, 0, 100, 450300, '永福县');
INSERT INTO `sys_address_area` VALUES (450327, 0, 100, 450300, '灌阳县');
INSERT INTO `sys_address_area` VALUES (450328, 0, 100, 450300, '龙胜各族自治县');
INSERT INTO `sys_address_area` VALUES (450329, 0, 100, 450300, '资源县');
INSERT INTO `sys_address_area` VALUES (450330, 0, 100, 450300, '平乐县');
INSERT INTO `sys_address_area` VALUES (450331, 0, 100, 450300, '荔蒲县');
INSERT INTO `sys_address_area` VALUES (450332, 0, 100, 450300, '恭城瑶族自治县');
INSERT INTO `sys_address_area` VALUES (450401, 0, 100, 450400, '市辖区');
INSERT INTO `sys_address_area` VALUES (450403, 0, 100, 450400, '万秀区');
INSERT INTO `sys_address_area` VALUES (450404, 0, 100, 450400, '蝶山区');
INSERT INTO `sys_address_area` VALUES (450405, 0, 100, 450400, '长洲区');
INSERT INTO `sys_address_area` VALUES (450421, 0, 100, 450400, '苍梧县');
INSERT INTO `sys_address_area` VALUES (450422, 0, 100, 450400, '藤　县');
INSERT INTO `sys_address_area` VALUES (450423, 0, 100, 450400, '蒙山县');
INSERT INTO `sys_address_area` VALUES (450481, 0, 100, 450400, '岑溪市');
INSERT INTO `sys_address_area` VALUES (450501, 0, 100, 450500, '市辖区');
INSERT INTO `sys_address_area` VALUES (450502, 0, 100, 450500, '海城区');
INSERT INTO `sys_address_area` VALUES (450503, 0, 100, 450500, '银海区');
INSERT INTO `sys_address_area` VALUES (450512, 0, 100, 450500, '铁山港区');
INSERT INTO `sys_address_area` VALUES (450521, 0, 100, 450500, '合浦县');
INSERT INTO `sys_address_area` VALUES (450601, 0, 100, 450600, '市辖区');
INSERT INTO `sys_address_area` VALUES (450602, 0, 100, 450600, '港口区');
INSERT INTO `sys_address_area` VALUES (450603, 0, 100, 450600, '防城区');
INSERT INTO `sys_address_area` VALUES (450621, 0, 100, 450600, '上思县');
INSERT INTO `sys_address_area` VALUES (450681, 0, 100, 450600, '东兴市');
INSERT INTO `sys_address_area` VALUES (450701, 0, 100, 450700, '市辖区');
INSERT INTO `sys_address_area` VALUES (450702, 0, 100, 450700, '钦南区');
INSERT INTO `sys_address_area` VALUES (450703, 0, 100, 450700, '钦北区');
INSERT INTO `sys_address_area` VALUES (450721, 0, 100, 450700, '灵山县');
INSERT INTO `sys_address_area` VALUES (450722, 0, 100, 450700, '浦北县');
INSERT INTO `sys_address_area` VALUES (450801, 0, 100, 450800, '市辖区');
INSERT INTO `sys_address_area` VALUES (450802, 0, 100, 450800, '港北区');
INSERT INTO `sys_address_area` VALUES (450803, 0, 100, 450800, '港南区');
INSERT INTO `sys_address_area` VALUES (450804, 0, 100, 450800, '覃塘区');
INSERT INTO `sys_address_area` VALUES (450821, 0, 100, 450800, '平南县');
INSERT INTO `sys_address_area` VALUES (450881, 0, 100, 450800, '桂平市');
INSERT INTO `sys_address_area` VALUES (450901, 0, 100, 450900, '市辖区');
INSERT INTO `sys_address_area` VALUES (450902, 0, 100, 450900, '玉州区');
INSERT INTO `sys_address_area` VALUES (450921, 0, 100, 450900, '容　县');
INSERT INTO `sys_address_area` VALUES (450922, 0, 100, 450900, '陆川县');
INSERT INTO `sys_address_area` VALUES (450923, 0, 100, 450900, '博白县');
INSERT INTO `sys_address_area` VALUES (450924, 0, 100, 450900, '兴业县');
INSERT INTO `sys_address_area` VALUES (450981, 0, 100, 450900, '北流市');
INSERT INTO `sys_address_area` VALUES (451001, 0, 100, 451000, '市辖区');
INSERT INTO `sys_address_area` VALUES (451002, 0, 100, 451000, '右江区');
INSERT INTO `sys_address_area` VALUES (451021, 0, 100, 451000, '田阳县');
INSERT INTO `sys_address_area` VALUES (451022, 0, 100, 451000, '田东县');
INSERT INTO `sys_address_area` VALUES (451023, 0, 100, 451000, '平果县');
INSERT INTO `sys_address_area` VALUES (451024, 0, 100, 451000, '德保县');
INSERT INTO `sys_address_area` VALUES (451025, 0, 100, 451000, '靖西县');
INSERT INTO `sys_address_area` VALUES (451026, 0, 100, 451000, '那坡县');
INSERT INTO `sys_address_area` VALUES (451027, 0, 100, 451000, '凌云县');
INSERT INTO `sys_address_area` VALUES (451028, 0, 100, 451000, '乐业县');
INSERT INTO `sys_address_area` VALUES (451029, 0, 100, 451000, '田林县');
INSERT INTO `sys_address_area` VALUES (451030, 0, 100, 451000, '西林县');
INSERT INTO `sys_address_area` VALUES (451031, 0, 100, 451000, '隆林各族自治县');
INSERT INTO `sys_address_area` VALUES (451101, 0, 100, 451100, '市辖区');
INSERT INTO `sys_address_area` VALUES (451102, 0, 100, 451100, '八步区');
INSERT INTO `sys_address_area` VALUES (451121, 0, 100, 451100, '昭平县');
INSERT INTO `sys_address_area` VALUES (451122, 0, 100, 451100, '钟山县');
INSERT INTO `sys_address_area` VALUES (451123, 0, 100, 451100, '富川瑶族自治县');
INSERT INTO `sys_address_area` VALUES (451201, 0, 100, 451200, '市辖区');
INSERT INTO `sys_address_area` VALUES (451202, 0, 100, 451200, '金城江区');
INSERT INTO `sys_address_area` VALUES (451221, 0, 100, 451200, '南丹县');
INSERT INTO `sys_address_area` VALUES (451222, 0, 100, 451200, '天峨县');
INSERT INTO `sys_address_area` VALUES (451223, 0, 100, 451200, '凤山县');
INSERT INTO `sys_address_area` VALUES (451224, 0, 100, 451200, '东兰县');
INSERT INTO `sys_address_area` VALUES (451225, 0, 100, 451200, '罗城仫佬族自治县');
INSERT INTO `sys_address_area` VALUES (451226, 0, 100, 451200, '环江毛南族自治县');
INSERT INTO `sys_address_area` VALUES (451227, 0, 100, 451200, '巴马瑶族自治县');
INSERT INTO `sys_address_area` VALUES (451228, 0, 100, 451200, '都安瑶族自治县');
INSERT INTO `sys_address_area` VALUES (451229, 0, 100, 451200, '大化瑶族自治县');
INSERT INTO `sys_address_area` VALUES (451281, 0, 100, 451200, '宜州市');
INSERT INTO `sys_address_area` VALUES (451301, 0, 100, 451300, '市辖区');
INSERT INTO `sys_address_area` VALUES (451302, 0, 100, 451300, '兴宾区');
INSERT INTO `sys_address_area` VALUES (451321, 0, 100, 451300, '忻城县');
INSERT INTO `sys_address_area` VALUES (451322, 0, 100, 451300, '象州县');
INSERT INTO `sys_address_area` VALUES (451323, 0, 100, 451300, '武宣县');
INSERT INTO `sys_address_area` VALUES (451324, 0, 100, 451300, '金秀瑶族自治县');
INSERT INTO `sys_address_area` VALUES (451381, 0, 100, 451300, '合山市');
INSERT INTO `sys_address_area` VALUES (451401, 0, 100, 451400, '市辖区');
INSERT INTO `sys_address_area` VALUES (451402, 0, 100, 451400, '江洲区');
INSERT INTO `sys_address_area` VALUES (451421, 0, 100, 451400, '扶绥县');
INSERT INTO `sys_address_area` VALUES (451422, 0, 100, 451400, '宁明县');
INSERT INTO `sys_address_area` VALUES (451423, 0, 100, 451400, '龙州县');
INSERT INTO `sys_address_area` VALUES (451424, 0, 100, 451400, '大新县');
INSERT INTO `sys_address_area` VALUES (451425, 0, 100, 451400, '天等县');
INSERT INTO `sys_address_area` VALUES (451481, 0, 100, 451400, '凭祥市');
INSERT INTO `sys_address_area` VALUES (460101, 0, 100, 460100, '市辖区');
INSERT INTO `sys_address_area` VALUES (460105, 0, 100, 460100, '秀英区');
INSERT INTO `sys_address_area` VALUES (460106, 0, 100, 460100, '龙华区');
INSERT INTO `sys_address_area` VALUES (460107, 0, 100, 460100, '琼山区');
INSERT INTO `sys_address_area` VALUES (460108, 0, 100, 460100, '美兰区');
INSERT INTO `sys_address_area` VALUES (460201, 0, 100, 460200, '市辖区');
INSERT INTO `sys_address_area` VALUES (469001, 0, 100, 469000, '五指山市');
INSERT INTO `sys_address_area` VALUES (469002, 0, 100, 469000, '琼海市');
INSERT INTO `sys_address_area` VALUES (469003, 0, 100, 469000, '儋州市');
INSERT INTO `sys_address_area` VALUES (469005, 0, 100, 469000, '文昌市');
INSERT INTO `sys_address_area` VALUES (469006, 0, 100, 469000, '万宁市');
INSERT INTO `sys_address_area` VALUES (469007, 0, 100, 469000, '东方市');
INSERT INTO `sys_address_area` VALUES (469025, 0, 100, 469000, '定安县');
INSERT INTO `sys_address_area` VALUES (469026, 0, 100, 469000, '屯昌县');
INSERT INTO `sys_address_area` VALUES (469027, 0, 100, 469000, '澄迈县');
INSERT INTO `sys_address_area` VALUES (469028, 0, 100, 469000, '临高县');
INSERT INTO `sys_address_area` VALUES (469030, 0, 100, 469000, '白沙黎族自治县');
INSERT INTO `sys_address_area` VALUES (469031, 0, 100, 469000, '昌江黎族自治县');
INSERT INTO `sys_address_area` VALUES (469033, 0, 100, 469000, '乐东黎族自治县');
INSERT INTO `sys_address_area` VALUES (469034, 0, 100, 469000, '陵水黎族自治县');
INSERT INTO `sys_address_area` VALUES (469035, 0, 100, 469000, '保亭黎族苗族自治县');
INSERT INTO `sys_address_area` VALUES (469036, 0, 100, 469000, '琼中黎族苗族自治县');
INSERT INTO `sys_address_area` VALUES (469037, 0, 100, 469000, '西沙群岛');
INSERT INTO `sys_address_area` VALUES (469038, 0, 100, 469000, '南沙群岛');
INSERT INTO `sys_address_area` VALUES (469039, 0, 100, 469000, '中沙群岛的岛礁及其海域');
INSERT INTO `sys_address_area` VALUES (500101, 0, 100, 500100, '万州区');
INSERT INTO `sys_address_area` VALUES (500102, 0, 100, 500100, '涪陵区');
INSERT INTO `sys_address_area` VALUES (500103, 0, 100, 500100, '渝中区');
INSERT INTO `sys_address_area` VALUES (500104, 0, 100, 500100, '大渡口区');
INSERT INTO `sys_address_area` VALUES (500105, 0, 100, 500100, '江北区');
INSERT INTO `sys_address_area` VALUES (500106, 0, 100, 500100, '沙坪坝区');
INSERT INTO `sys_address_area` VALUES (500107, 0, 100, 500100, '九龙坡区');
INSERT INTO `sys_address_area` VALUES (500108, 0, 100, 500100, '南岸区');
INSERT INTO `sys_address_area` VALUES (500109, 0, 100, 500100, '北碚区');
INSERT INTO `sys_address_area` VALUES (500110, 0, 100, 500100, '万盛区');
INSERT INTO `sys_address_area` VALUES (500111, 0, 100, 500100, '双桥区');
INSERT INTO `sys_address_area` VALUES (500112, 0, 100, 500100, '渝北区');
INSERT INTO `sys_address_area` VALUES (500113, 0, 100, 500100, '巴南区');
INSERT INTO `sys_address_area` VALUES (500114, 0, 100, 500100, '黔江区');
INSERT INTO `sys_address_area` VALUES (500115, 0, 100, 500100, '长寿区');
INSERT INTO `sys_address_area` VALUES (500222, 0, 100, 500200, '綦江县');
INSERT INTO `sys_address_area` VALUES (500223, 0, 100, 500200, '潼南县');
INSERT INTO `sys_address_area` VALUES (500224, 0, 100, 500200, '铜梁县');
INSERT INTO `sys_address_area` VALUES (500225, 0, 100, 500200, '大足县');
INSERT INTO `sys_address_area` VALUES (500226, 0, 100, 500200, '荣昌县');
INSERT INTO `sys_address_area` VALUES (500227, 0, 100, 500200, '璧山县');
INSERT INTO `sys_address_area` VALUES (500228, 0, 100, 500200, '梁平县');
INSERT INTO `sys_address_area` VALUES (500229, 0, 100, 500200, '城口县');
INSERT INTO `sys_address_area` VALUES (500230, 0, 100, 500200, '丰都县');
INSERT INTO `sys_address_area` VALUES (500231, 0, 100, 500200, '垫江县');
INSERT INTO `sys_address_area` VALUES (500232, 0, 100, 500200, '武隆县');
INSERT INTO `sys_address_area` VALUES (500233, 0, 100, 500200, '忠　县');
INSERT INTO `sys_address_area` VALUES (500234, 0, 100, 500200, '开　县');
INSERT INTO `sys_address_area` VALUES (500235, 0, 100, 500200, '云阳县');
INSERT INTO `sys_address_area` VALUES (500236, 0, 100, 500200, '奉节县');
INSERT INTO `sys_address_area` VALUES (500237, 0, 100, 500200, '巫山县');
INSERT INTO `sys_address_area` VALUES (500238, 0, 100, 500200, '巫溪县');
INSERT INTO `sys_address_area` VALUES (500240, 0, 100, 500200, '石柱土家族自治县');
INSERT INTO `sys_address_area` VALUES (500241, 0, 100, 500200, '秀山土家族苗族自治县');
INSERT INTO `sys_address_area` VALUES (500242, 0, 100, 500200, '酉阳土家族苗族自治县');
INSERT INTO `sys_address_area` VALUES (500243, 0, 100, 500200, '彭水苗族土家族自治县');
INSERT INTO `sys_address_area` VALUES (500381, 0, 100, 500300, '江津市');
INSERT INTO `sys_address_area` VALUES (500382, 0, 100, 500300, '合川市');
INSERT INTO `sys_address_area` VALUES (500383, 0, 100, 500300, '永川市');
INSERT INTO `sys_address_area` VALUES (500384, 0, 100, 500300, '南川市');
INSERT INTO `sys_address_area` VALUES (510101, 0, 100, 510100, '市辖区');
INSERT INTO `sys_address_area` VALUES (510104, 0, 100, 510100, '锦江区');
INSERT INTO `sys_address_area` VALUES (510105, 0, 100, 510100, '青羊区');
INSERT INTO `sys_address_area` VALUES (510106, 0, 100, 510100, '金牛区');
INSERT INTO `sys_address_area` VALUES (510107, 0, 100, 510100, '武侯区');
INSERT INTO `sys_address_area` VALUES (510108, 0, 100, 510100, '成华区');
INSERT INTO `sys_address_area` VALUES (510112, 0, 100, 510100, '龙泉驿区');
INSERT INTO `sys_address_area` VALUES (510113, 0, 100, 510100, '青白江区');
INSERT INTO `sys_address_area` VALUES (510114, 0, 100, 510100, '新都区');
INSERT INTO `sys_address_area` VALUES (510115, 0, 100, 510100, '温江县');
INSERT INTO `sys_address_area` VALUES (510121, 0, 100, 510100, '金堂县');
INSERT INTO `sys_address_area` VALUES (510122, 0, 100, 510100, '双流县');
INSERT INTO `sys_address_area` VALUES (510124, 0, 100, 510100, '郫　县');
INSERT INTO `sys_address_area` VALUES (510129, 0, 100, 510100, '大邑县');
INSERT INTO `sys_address_area` VALUES (510131, 0, 100, 510100, '蒲江县');
INSERT INTO `sys_address_area` VALUES (510132, 0, 100, 510100, '新津县');
INSERT INTO `sys_address_area` VALUES (510181, 0, 100, 510100, '都江堰市');
INSERT INTO `sys_address_area` VALUES (510182, 0, 100, 510100, '彭州市');
INSERT INTO `sys_address_area` VALUES (510183, 0, 100, 510100, '邛崃市');
INSERT INTO `sys_address_area` VALUES (510184, 0, 100, 510100, '崇州市');
INSERT INTO `sys_address_area` VALUES (510301, 0, 100, 510300, '市辖区');
INSERT INTO `sys_address_area` VALUES (510302, 0, 100, 510300, '自流井区');
INSERT INTO `sys_address_area` VALUES (510303, 0, 100, 510300, '贡井区');
INSERT INTO `sys_address_area` VALUES (510304, 0, 100, 510300, '大安区');
INSERT INTO `sys_address_area` VALUES (510311, 0, 100, 510300, '沿滩区');
INSERT INTO `sys_address_area` VALUES (510321, 0, 100, 510300, '荣　县');
INSERT INTO `sys_address_area` VALUES (510322, 0, 100, 510300, '富顺县');
INSERT INTO `sys_address_area` VALUES (510401, 0, 100, 510400, '市辖区');
INSERT INTO `sys_address_area` VALUES (510402, 0, 100, 510400, '东　区');
INSERT INTO `sys_address_area` VALUES (510403, 0, 100, 510400, '西　区');
INSERT INTO `sys_address_area` VALUES (510411, 0, 100, 510400, '仁和区');
INSERT INTO `sys_address_area` VALUES (510421, 0, 100, 510400, '米易县');
INSERT INTO `sys_address_area` VALUES (510422, 0, 100, 510400, '盐边县');
INSERT INTO `sys_address_area` VALUES (510501, 0, 100, 510500, '市辖区');
INSERT INTO `sys_address_area` VALUES (510502, 0, 100, 510500, '江阳区');
INSERT INTO `sys_address_area` VALUES (510503, 0, 100, 510500, '纳溪区');
INSERT INTO `sys_address_area` VALUES (510504, 0, 100, 510500, '龙马潭区');
INSERT INTO `sys_address_area` VALUES (510521, 0, 100, 510500, '泸　县');
INSERT INTO `sys_address_area` VALUES (510522, 0, 100, 510500, '合江县');
INSERT INTO `sys_address_area` VALUES (510524, 0, 100, 510500, '叙永县');
INSERT INTO `sys_address_area` VALUES (510525, 0, 100, 510500, '古蔺县');
INSERT INTO `sys_address_area` VALUES (510601, 0, 100, 510600, '市辖区');
INSERT INTO `sys_address_area` VALUES (510603, 0, 100, 510600, '旌阳区');
INSERT INTO `sys_address_area` VALUES (510623, 0, 100, 510600, '中江县');
INSERT INTO `sys_address_area` VALUES (510626, 0, 100, 510600, '罗江县');
INSERT INTO `sys_address_area` VALUES (510681, 0, 100, 510600, '广汉市');
INSERT INTO `sys_address_area` VALUES (510682, 0, 100, 510600, '什邡市');
INSERT INTO `sys_address_area` VALUES (510683, 0, 100, 510600, '绵竹市');
INSERT INTO `sys_address_area` VALUES (510701, 0, 100, 510700, '市辖区');
INSERT INTO `sys_address_area` VALUES (510703, 0, 100, 510700, '涪城区');
INSERT INTO `sys_address_area` VALUES (510704, 0, 100, 510700, '游仙区');
INSERT INTO `sys_address_area` VALUES (510722, 0, 100, 510700, '三台县');
INSERT INTO `sys_address_area` VALUES (510723, 0, 100, 510700, '盐亭县');
INSERT INTO `sys_address_area` VALUES (510724, 0, 100, 510700, '安　县');
INSERT INTO `sys_address_area` VALUES (510725, 0, 100, 510700, '梓潼县');
INSERT INTO `sys_address_area` VALUES (510726, 0, 100, 510700, '北川羌族自治县');
INSERT INTO `sys_address_area` VALUES (510727, 0, 100, 510700, '平武县');
INSERT INTO `sys_address_area` VALUES (510781, 0, 100, 510700, '江油市');
INSERT INTO `sys_address_area` VALUES (510801, 0, 100, 510800, '市辖区');
INSERT INTO `sys_address_area` VALUES (510802, 0, 100, 510800, '市中区');
INSERT INTO `sys_address_area` VALUES (510811, 0, 100, 510800, '元坝区');
INSERT INTO `sys_address_area` VALUES (510812, 0, 100, 510800, '朝天区');
INSERT INTO `sys_address_area` VALUES (510821, 0, 100, 510800, '旺苍县');
INSERT INTO `sys_address_area` VALUES (510822, 0, 100, 510800, '青川县');
INSERT INTO `sys_address_area` VALUES (510823, 0, 100, 510800, '剑阁县');
INSERT INTO `sys_address_area` VALUES (510824, 0, 100, 510800, '苍溪县');
INSERT INTO `sys_address_area` VALUES (510901, 0, 100, 510900, '市辖区');
INSERT INTO `sys_address_area` VALUES (510903, 0, 100, 510900, '船山区');
INSERT INTO `sys_address_area` VALUES (510904, 0, 100, 510900, '安居区');
INSERT INTO `sys_address_area` VALUES (510921, 0, 100, 510900, '蓬溪县');
INSERT INTO `sys_address_area` VALUES (510922, 0, 100, 510900, '射洪县');
INSERT INTO `sys_address_area` VALUES (510923, 0, 100, 510900, '大英县');
INSERT INTO `sys_address_area` VALUES (511001, 0, 100, 511000, '市辖区');
INSERT INTO `sys_address_area` VALUES (511002, 0, 100, 511000, '市中区');
INSERT INTO `sys_address_area` VALUES (511011, 0, 100, 511000, '东兴区');
INSERT INTO `sys_address_area` VALUES (511024, 0, 100, 511000, '威远县');
INSERT INTO `sys_address_area` VALUES (511025, 0, 100, 511000, '资中县');
INSERT INTO `sys_address_area` VALUES (511028, 0, 100, 511000, '隆昌县');
INSERT INTO `sys_address_area` VALUES (511101, 0, 100, 511100, '市辖区');
INSERT INTO `sys_address_area` VALUES (511102, 0, 100, 511100, '市中区');
INSERT INTO `sys_address_area` VALUES (511111, 0, 100, 511100, '沙湾区');
INSERT INTO `sys_address_area` VALUES (511112, 0, 100, 511100, '五通桥区');
INSERT INTO `sys_address_area` VALUES (511113, 0, 100, 511100, '金口河区');
INSERT INTO `sys_address_area` VALUES (511123, 0, 100, 511100, '犍为县');
INSERT INTO `sys_address_area` VALUES (511124, 0, 100, 511100, '井研县');
INSERT INTO `sys_address_area` VALUES (511126, 0, 100, 511100, '夹江县');
INSERT INTO `sys_address_area` VALUES (511129, 0, 100, 511100, '沐川县');
INSERT INTO `sys_address_area` VALUES (511132, 0, 100, 511100, '峨边彝族自治县');
INSERT INTO `sys_address_area` VALUES (511133, 0, 100, 511100, '马边彝族自治县');
INSERT INTO `sys_address_area` VALUES (511181, 0, 100, 511100, '峨眉山市');
INSERT INTO `sys_address_area` VALUES (511301, 0, 100, 511300, '市辖区');
INSERT INTO `sys_address_area` VALUES (511302, 0, 100, 511300, '顺庆区');
INSERT INTO `sys_address_area` VALUES (511303, 0, 100, 511300, '高坪区');
INSERT INTO `sys_address_area` VALUES (511304, 0, 100, 511300, '嘉陵区');
INSERT INTO `sys_address_area` VALUES (511321, 0, 100, 511300, '南部县');
INSERT INTO `sys_address_area` VALUES (511322, 0, 100, 511300, '营山县');
INSERT INTO `sys_address_area` VALUES (511323, 0, 100, 511300, '蓬安县');
INSERT INTO `sys_address_area` VALUES (511324, 0, 100, 511300, '仪陇县');
INSERT INTO `sys_address_area` VALUES (511325, 0, 100, 511300, '西充县');
INSERT INTO `sys_address_area` VALUES (511381, 0, 100, 511300, '阆中市');
INSERT INTO `sys_address_area` VALUES (511401, 0, 100, 511400, '市辖区');
INSERT INTO `sys_address_area` VALUES (511402, 0, 100, 511400, '东坡区');
INSERT INTO `sys_address_area` VALUES (511421, 0, 100, 511400, '仁寿县');
INSERT INTO `sys_address_area` VALUES (511422, 0, 100, 511400, '彭山县');
INSERT INTO `sys_address_area` VALUES (511423, 0, 100, 511400, '洪雅县');
INSERT INTO `sys_address_area` VALUES (511424, 0, 100, 511400, '丹棱县');
INSERT INTO `sys_address_area` VALUES (511425, 0, 100, 511400, '青神县');
INSERT INTO `sys_address_area` VALUES (511501, 0, 100, 511500, '市辖区');
INSERT INTO `sys_address_area` VALUES (511502, 0, 100, 511500, '翠屏区');
INSERT INTO `sys_address_area` VALUES (511521, 0, 100, 511500, '宜宾县');
INSERT INTO `sys_address_area` VALUES (511522, 0, 100, 511500, '南溪县');
INSERT INTO `sys_address_area` VALUES (511523, 0, 100, 511500, '江安县');
INSERT INTO `sys_address_area` VALUES (511524, 0, 100, 511500, '长宁县');
INSERT INTO `sys_address_area` VALUES (511525, 0, 100, 511500, '高　县');
INSERT INTO `sys_address_area` VALUES (511526, 0, 100, 511500, '珙　县');
INSERT INTO `sys_address_area` VALUES (511527, 0, 100, 511500, '筠连县');
INSERT INTO `sys_address_area` VALUES (511528, 0, 100, 511500, '兴文县');
INSERT INTO `sys_address_area` VALUES (511529, 0, 100, 511500, '屏山县');
INSERT INTO `sys_address_area` VALUES (511601, 0, 100, 511600, '市辖区');
INSERT INTO `sys_address_area` VALUES (511602, 0, 100, 511600, '广安区');
INSERT INTO `sys_address_area` VALUES (511621, 0, 100, 511600, '岳池县');
INSERT INTO `sys_address_area` VALUES (511622, 0, 100, 511600, '武胜县');
INSERT INTO `sys_address_area` VALUES (511623, 0, 100, 511600, '邻水县');
INSERT INTO `sys_address_area` VALUES (511681, 0, 100, 511600, '华莹市');
INSERT INTO `sys_address_area` VALUES (511701, 0, 100, 511700, '市辖区');
INSERT INTO `sys_address_area` VALUES (511702, 0, 100, 511700, '通川区');
INSERT INTO `sys_address_area` VALUES (511721, 0, 100, 511700, '达　县');
INSERT INTO `sys_address_area` VALUES (511722, 0, 100, 511700, '宣汉县');
INSERT INTO `sys_address_area` VALUES (511723, 0, 100, 511700, '开江县');
INSERT INTO `sys_address_area` VALUES (511724, 0, 100, 511700, '大竹县');
INSERT INTO `sys_address_area` VALUES (511725, 0, 100, 511700, '渠　县');
INSERT INTO `sys_address_area` VALUES (511781, 0, 100, 511700, '万源市');
INSERT INTO `sys_address_area` VALUES (511801, 0, 100, 511800, '市辖区');
INSERT INTO `sys_address_area` VALUES (511802, 0, 100, 511800, '雨城区');
INSERT INTO `sys_address_area` VALUES (511821, 0, 100, 511800, '名山县');
INSERT INTO `sys_address_area` VALUES (511822, 0, 100, 511800, '荥经县');
INSERT INTO `sys_address_area` VALUES (511823, 0, 100, 511800, '汉源县');
INSERT INTO `sys_address_area` VALUES (511824, 0, 100, 511800, '石棉县');
INSERT INTO `sys_address_area` VALUES (511825, 0, 100, 511800, '天全县');
INSERT INTO `sys_address_area` VALUES (511826, 0, 100, 511800, '芦山县');
INSERT INTO `sys_address_area` VALUES (511827, 0, 100, 511800, '宝兴县');
INSERT INTO `sys_address_area` VALUES (511901, 0, 100, 511900, '市辖区');
INSERT INTO `sys_address_area` VALUES (511902, 0, 100, 511900, '巴州区');
INSERT INTO `sys_address_area` VALUES (511921, 0, 100, 511900, '通江县');
INSERT INTO `sys_address_area` VALUES (511922, 0, 100, 511900, '南江县');
INSERT INTO `sys_address_area` VALUES (511923, 0, 100, 511900, '平昌县');
INSERT INTO `sys_address_area` VALUES (512001, 0, 100, 512000, '市辖区');
INSERT INTO `sys_address_area` VALUES (512002, 0, 100, 512000, '雁江区');
INSERT INTO `sys_address_area` VALUES (512021, 0, 100, 512000, '安岳县');
INSERT INTO `sys_address_area` VALUES (512022, 0, 100, 512000, '乐至县');
INSERT INTO `sys_address_area` VALUES (512081, 0, 100, 512000, '简阳市');
INSERT INTO `sys_address_area` VALUES (513221, 0, 100, 513200, '汶川县');
INSERT INTO `sys_address_area` VALUES (513222, 0, 100, 513200, '理　县');
INSERT INTO `sys_address_area` VALUES (513223, 0, 100, 513200, '茂　县');
INSERT INTO `sys_address_area` VALUES (513224, 0, 100, 513200, '松潘县');
INSERT INTO `sys_address_area` VALUES (513225, 0, 100, 513200, '九寨沟县');
INSERT INTO `sys_address_area` VALUES (513226, 0, 100, 513200, '金川县');
INSERT INTO `sys_address_area` VALUES (513227, 0, 100, 513200, '小金县');
INSERT INTO `sys_address_area` VALUES (513228, 0, 100, 513200, '黑水县');
INSERT INTO `sys_address_area` VALUES (513229, 0, 100, 513200, '马尔康县');
INSERT INTO `sys_address_area` VALUES (513230, 0, 100, 513200, '壤塘县');
INSERT INTO `sys_address_area` VALUES (513231, 0, 100, 513200, '阿坝县');
INSERT INTO `sys_address_area` VALUES (513232, 0, 100, 513200, '若尔盖县');
INSERT INTO `sys_address_area` VALUES (513233, 0, 100, 513200, '红原县');
INSERT INTO `sys_address_area` VALUES (513321, 0, 100, 513300, '康定县');
INSERT INTO `sys_address_area` VALUES (513322, 0, 100, 513300, '泸定县');
INSERT INTO `sys_address_area` VALUES (513323, 0, 100, 513300, '丹巴县');
INSERT INTO `sys_address_area` VALUES (513324, 0, 100, 513300, '九龙县');
INSERT INTO `sys_address_area` VALUES (513325, 0, 100, 513300, '雅江县');
INSERT INTO `sys_address_area` VALUES (513326, 0, 100, 513300, '道孚县');
INSERT INTO `sys_address_area` VALUES (513327, 0, 100, 513300, '炉霍县');
INSERT INTO `sys_address_area` VALUES (513328, 0, 100, 513300, '甘孜县');
INSERT INTO `sys_address_area` VALUES (513329, 0, 100, 513300, '新龙县');
INSERT INTO `sys_address_area` VALUES (513330, 0, 100, 513300, '德格县');
INSERT INTO `sys_address_area` VALUES (513331, 0, 100, 513300, '白玉县');
INSERT INTO `sys_address_area` VALUES (513332, 0, 100, 513300, '石渠县');
INSERT INTO `sys_address_area` VALUES (513333, 0, 100, 513300, '色达县');
INSERT INTO `sys_address_area` VALUES (513334, 0, 100, 513300, '理塘县');
INSERT INTO `sys_address_area` VALUES (513335, 0, 100, 513300, '巴塘县');
INSERT INTO `sys_address_area` VALUES (513336, 0, 100, 513300, '乡城县');
INSERT INTO `sys_address_area` VALUES (513337, 0, 100, 513300, '稻城县');
INSERT INTO `sys_address_area` VALUES (513338, 0, 100, 513300, '得荣县');
INSERT INTO `sys_address_area` VALUES (513401, 0, 100, 513400, '西昌市');
INSERT INTO `sys_address_area` VALUES (513422, 0, 100, 513400, '木里藏族自治县');
INSERT INTO `sys_address_area` VALUES (513423, 0, 100, 513400, '盐源县');
INSERT INTO `sys_address_area` VALUES (513424, 0, 100, 513400, '德昌县');
INSERT INTO `sys_address_area` VALUES (513425, 0, 100, 513400, '会理县');
INSERT INTO `sys_address_area` VALUES (513426, 0, 100, 513400, '会东县');
INSERT INTO `sys_address_area` VALUES (513427, 0, 100, 513400, '宁南县');
INSERT INTO `sys_address_area` VALUES (513428, 0, 100, 513400, '普格县');
INSERT INTO `sys_address_area` VALUES (513429, 0, 100, 513400, '布拖县');
INSERT INTO `sys_address_area` VALUES (513430, 0, 100, 513400, '金阳县');
INSERT INTO `sys_address_area` VALUES (513431, 0, 100, 513400, '昭觉县');
INSERT INTO `sys_address_area` VALUES (513432, 0, 100, 513400, '喜德县');
INSERT INTO `sys_address_area` VALUES (513433, 0, 100, 513400, '冕宁县');
INSERT INTO `sys_address_area` VALUES (513434, 0, 100, 513400, '越西县');
INSERT INTO `sys_address_area` VALUES (513435, 0, 100, 513400, '甘洛县');
INSERT INTO `sys_address_area` VALUES (513436, 0, 100, 513400, '美姑县');
INSERT INTO `sys_address_area` VALUES (513437, 0, 100, 513400, '雷波县');
INSERT INTO `sys_address_area` VALUES (520101, 0, 100, 520100, '市辖区');
INSERT INTO `sys_address_area` VALUES (520102, 0, 100, 520100, '南明区');
INSERT INTO `sys_address_area` VALUES (520103, 0, 100, 520100, '云岩区');
INSERT INTO `sys_address_area` VALUES (520111, 0, 100, 520100, '花溪区');
INSERT INTO `sys_address_area` VALUES (520112, 0, 100, 520100, '乌当区');
INSERT INTO `sys_address_area` VALUES (520113, 0, 100, 520100, '白云区');
INSERT INTO `sys_address_area` VALUES (520114, 0, 100, 520100, '小河区');
INSERT INTO `sys_address_area` VALUES (520121, 0, 100, 520100, '开阳县');
INSERT INTO `sys_address_area` VALUES (520122, 0, 100, 520100, '息烽县');
INSERT INTO `sys_address_area` VALUES (520123, 0, 100, 520100, '修文县');
INSERT INTO `sys_address_area` VALUES (520181, 0, 100, 520100, '清镇市');
INSERT INTO `sys_address_area` VALUES (520201, 0, 100, 520200, '钟山区');
INSERT INTO `sys_address_area` VALUES (520203, 0, 100, 520200, '六枝特区');
INSERT INTO `sys_address_area` VALUES (520221, 0, 100, 520200, '水城县');
INSERT INTO `sys_address_area` VALUES (520222, 0, 100, 520200, '盘　县');
INSERT INTO `sys_address_area` VALUES (520301, 0, 100, 520300, '市辖区');
INSERT INTO `sys_address_area` VALUES (520302, 0, 100, 520300, '红花岗区');
INSERT INTO `sys_address_area` VALUES (520303, 0, 100, 520300, '汇川区');
INSERT INTO `sys_address_area` VALUES (520321, 0, 100, 520300, '遵义县');
INSERT INTO `sys_address_area` VALUES (520322, 0, 100, 520300, '桐梓县');
INSERT INTO `sys_address_area` VALUES (520323, 0, 100, 520300, '绥阳县');
INSERT INTO `sys_address_area` VALUES (520324, 0, 100, 520300, '正安县');
INSERT INTO `sys_address_area` VALUES (520325, 0, 100, 520300, '道真仡佬族苗族自治县');
INSERT INTO `sys_address_area` VALUES (520326, 0, 100, 520300, '务川仡佬族苗族自治县');
INSERT INTO `sys_address_area` VALUES (520327, 0, 100, 520300, '凤冈县');
INSERT INTO `sys_address_area` VALUES (520328, 0, 100, 520300, '湄潭县');
INSERT INTO `sys_address_area` VALUES (520329, 0, 100, 520300, '余庆县');
INSERT INTO `sys_address_area` VALUES (520330, 0, 100, 520300, '习水县');
INSERT INTO `sys_address_area` VALUES (520381, 0, 100, 520300, '赤水市');
INSERT INTO `sys_address_area` VALUES (520382, 0, 100, 520300, '仁怀市');
INSERT INTO `sys_address_area` VALUES (520401, 0, 100, 520400, '市辖区');
INSERT INTO `sys_address_area` VALUES (520402, 0, 100, 520400, '西秀区');
INSERT INTO `sys_address_area` VALUES (520421, 0, 100, 520400, '平坝县');
INSERT INTO `sys_address_area` VALUES (520422, 0, 100, 520400, '普定县');
INSERT INTO `sys_address_area` VALUES (520423, 0, 100, 520400, '镇宁布依族苗族自治县');
INSERT INTO `sys_address_area` VALUES (520424, 0, 100, 520400, '关岭布依族苗族自治县');
INSERT INTO `sys_address_area` VALUES (520425, 0, 100, 520400, '紫云苗族布依族自治县');
INSERT INTO `sys_address_area` VALUES (522201, 0, 100, 522200, '铜仁市');
INSERT INTO `sys_address_area` VALUES (522222, 0, 100, 522200, '江口县');
INSERT INTO `sys_address_area` VALUES (522223, 0, 100, 522200, '玉屏侗族自治县');
INSERT INTO `sys_address_area` VALUES (522224, 0, 100, 522200, '石阡县');
INSERT INTO `sys_address_area` VALUES (522225, 0, 100, 522200, '思南县');
INSERT INTO `sys_address_area` VALUES (522226, 0, 100, 522200, '印江土家族苗族自治县');
INSERT INTO `sys_address_area` VALUES (522227, 0, 100, 522200, '德江县');
INSERT INTO `sys_address_area` VALUES (522228, 0, 100, 522200, '沿河土家族自治县');
INSERT INTO `sys_address_area` VALUES (522229, 0, 100, 522200, '松桃苗族自治县');
INSERT INTO `sys_address_area` VALUES (522230, 0, 100, 522200, '万山特区');
INSERT INTO `sys_address_area` VALUES (522301, 0, 100, 522300, '兴义市');
INSERT INTO `sys_address_area` VALUES (522322, 0, 100, 522300, '兴仁县');
INSERT INTO `sys_address_area` VALUES (522323, 0, 100, 522300, '普安县');
INSERT INTO `sys_address_area` VALUES (522324, 0, 100, 522300, '晴隆县');
INSERT INTO `sys_address_area` VALUES (522325, 0, 100, 522300, '贞丰县');
INSERT INTO `sys_address_area` VALUES (522326, 0, 100, 522300, '望谟县');
INSERT INTO `sys_address_area` VALUES (522327, 0, 100, 522300, '册亨县');
INSERT INTO `sys_address_area` VALUES (522328, 0, 100, 522300, '安龙县');
INSERT INTO `sys_address_area` VALUES (522401, 0, 100, 522400, '毕节市');
INSERT INTO `sys_address_area` VALUES (522422, 0, 100, 522400, '大方县');
INSERT INTO `sys_address_area` VALUES (522423, 0, 100, 522400, '黔西县');
INSERT INTO `sys_address_area` VALUES (522424, 0, 100, 522400, '金沙县');
INSERT INTO `sys_address_area` VALUES (522425, 0, 100, 522400, '织金县');
INSERT INTO `sys_address_area` VALUES (522426, 0, 100, 522400, '纳雍县');
INSERT INTO `sys_address_area` VALUES (522427, 0, 100, 522400, '威宁彝族回族苗族自治县');
INSERT INTO `sys_address_area` VALUES (522428, 0, 100, 522400, '赫章县');
INSERT INTO `sys_address_area` VALUES (522601, 0, 100, 522600, '凯里市');
INSERT INTO `sys_address_area` VALUES (522622, 0, 100, 522600, '黄平县');
INSERT INTO `sys_address_area` VALUES (522623, 0, 100, 522600, '施秉县');
INSERT INTO `sys_address_area` VALUES (522624, 0, 100, 522600, '三穗县');
INSERT INTO `sys_address_area` VALUES (522625, 0, 100, 522600, '镇远县');
INSERT INTO `sys_address_area` VALUES (522626, 0, 100, 522600, '岑巩县');
INSERT INTO `sys_address_area` VALUES (522627, 0, 100, 522600, '天柱县');
INSERT INTO `sys_address_area` VALUES (522628, 0, 100, 522600, '锦屏县');
INSERT INTO `sys_address_area` VALUES (522629, 0, 100, 522600, '剑河县');
INSERT INTO `sys_address_area` VALUES (522630, 0, 100, 522600, '台江县');
INSERT INTO `sys_address_area` VALUES (522631, 0, 100, 522600, '黎平县');
INSERT INTO `sys_address_area` VALUES (522632, 0, 100, 522600, '榕江县');
INSERT INTO `sys_address_area` VALUES (522633, 0, 100, 522600, '从江县');
INSERT INTO `sys_address_area` VALUES (522634, 0, 100, 522600, '雷山县');
INSERT INTO `sys_address_area` VALUES (522635, 0, 100, 522600, '麻江县');
INSERT INTO `sys_address_area` VALUES (522636, 0, 100, 522600, '丹寨县');
INSERT INTO `sys_address_area` VALUES (522701, 0, 100, 522700, '都匀市');
INSERT INTO `sys_address_area` VALUES (522702, 0, 100, 522700, '福泉市');
INSERT INTO `sys_address_area` VALUES (522722, 0, 100, 522700, '荔波县');
INSERT INTO `sys_address_area` VALUES (522723, 0, 100, 522700, '贵定县');
INSERT INTO `sys_address_area` VALUES (522725, 0, 100, 522700, '瓮安县');
INSERT INTO `sys_address_area` VALUES (522726, 0, 100, 522700, '独山县');
INSERT INTO `sys_address_area` VALUES (522727, 0, 100, 522700, '平塘县');
INSERT INTO `sys_address_area` VALUES (522728, 0, 100, 522700, '罗甸县');
INSERT INTO `sys_address_area` VALUES (522729, 0, 100, 522700, '长顺县');
INSERT INTO `sys_address_area` VALUES (522730, 0, 100, 522700, '龙里县');
INSERT INTO `sys_address_area` VALUES (522731, 0, 100, 522700, '惠水县');
INSERT INTO `sys_address_area` VALUES (522732, 0, 100, 522700, '三都水族自治县');
INSERT INTO `sys_address_area` VALUES (530101, 0, 100, 530100, '市辖区');
INSERT INTO `sys_address_area` VALUES (530102, 0, 100, 530100, '五华区');
INSERT INTO `sys_address_area` VALUES (530103, 0, 100, 530100, '盘龙区');
INSERT INTO `sys_address_area` VALUES (530111, 0, 100, 530100, '官渡区');
INSERT INTO `sys_address_area` VALUES (530112, 0, 100, 530100, '西山区');
INSERT INTO `sys_address_area` VALUES (530113, 0, 100, 530100, '东川区');
INSERT INTO `sys_address_area` VALUES (530121, 0, 100, 530100, '呈贡县');
INSERT INTO `sys_address_area` VALUES (530122, 0, 100, 530100, '晋宁县');
INSERT INTO `sys_address_area` VALUES (530124, 0, 100, 530100, '富民县');
INSERT INTO `sys_address_area` VALUES (530125, 0, 100, 530100, '宜良县');
INSERT INTO `sys_address_area` VALUES (530126, 0, 100, 530100, '石林彝族自治县');
INSERT INTO `sys_address_area` VALUES (530127, 0, 100, 530100, '嵩明县');
INSERT INTO `sys_address_area` VALUES (530128, 0, 100, 530100, '禄劝彝族苗族自治县');
INSERT INTO `sys_address_area` VALUES (530129, 0, 100, 530100, '寻甸回族彝族自治县');
INSERT INTO `sys_address_area` VALUES (530181, 0, 100, 530100, '安宁市');
INSERT INTO `sys_address_area` VALUES (530301, 0, 100, 530300, '市辖区');
INSERT INTO `sys_address_area` VALUES (530302, 0, 100, 530300, '麒麟区');
INSERT INTO `sys_address_area` VALUES (530321, 0, 100, 530300, '马龙县');
INSERT INTO `sys_address_area` VALUES (530322, 0, 100, 530300, '陆良县');
INSERT INTO `sys_address_area` VALUES (530323, 0, 100, 530300, '师宗县');
INSERT INTO `sys_address_area` VALUES (530324, 0, 100, 530300, '罗平县');
INSERT INTO `sys_address_area` VALUES (530325, 0, 100, 530300, '富源县');
INSERT INTO `sys_address_area` VALUES (530326, 0, 100, 530300, '会泽县');
INSERT INTO `sys_address_area` VALUES (530328, 0, 100, 530300, '沾益县');
INSERT INTO `sys_address_area` VALUES (530381, 0, 100, 530300, '宣威市');
INSERT INTO `sys_address_area` VALUES (530401, 0, 100, 530400, '市辖区');
INSERT INTO `sys_address_area` VALUES (530402, 0, 100, 530400, '红塔区');
INSERT INTO `sys_address_area` VALUES (530421, 0, 100, 530400, '江川县');
INSERT INTO `sys_address_area` VALUES (530422, 0, 100, 530400, '澄江县');
INSERT INTO `sys_address_area` VALUES (530423, 0, 100, 530400, '通海县');
INSERT INTO `sys_address_area` VALUES (530424, 0, 100, 530400, '华宁县');
INSERT INTO `sys_address_area` VALUES (530425, 0, 100, 530400, '易门县');
INSERT INTO `sys_address_area` VALUES (530426, 0, 100, 530400, '峨山彝族自治县');
INSERT INTO `sys_address_area` VALUES (530427, 0, 100, 530400, '新平彝族傣族自治县');
INSERT INTO `sys_address_area` VALUES (530428, 0, 100, 530400, '元江哈尼族彝族傣族自治县');
INSERT INTO `sys_address_area` VALUES (530501, 0, 100, 530500, '市辖区');
INSERT INTO `sys_address_area` VALUES (530502, 0, 100, 530500, '隆阳区');
INSERT INTO `sys_address_area` VALUES (530521, 0, 100, 530500, '施甸县');
INSERT INTO `sys_address_area` VALUES (530522, 0, 100, 530500, '腾冲县');
INSERT INTO `sys_address_area` VALUES (530523, 0, 100, 530500, '龙陵县');
INSERT INTO `sys_address_area` VALUES (530524, 0, 100, 530500, '昌宁县');
INSERT INTO `sys_address_area` VALUES (530601, 0, 100, 530600, '市辖区');
INSERT INTO `sys_address_area` VALUES (530602, 0, 100, 530600, '昭阳区');
INSERT INTO `sys_address_area` VALUES (530621, 0, 100, 530600, '鲁甸县');
INSERT INTO `sys_address_area` VALUES (530622, 0, 100, 530600, '巧家县');
INSERT INTO `sys_address_area` VALUES (530623, 0, 100, 530600, '盐津县');
INSERT INTO `sys_address_area` VALUES (530624, 0, 100, 530600, '大关县');
INSERT INTO `sys_address_area` VALUES (530625, 0, 100, 530600, '永善县');
INSERT INTO `sys_address_area` VALUES (530626, 0, 100, 530600, '绥江县');
INSERT INTO `sys_address_area` VALUES (530627, 0, 100, 530600, '镇雄县');
INSERT INTO `sys_address_area` VALUES (530628, 0, 100, 530600, '彝良县');
INSERT INTO `sys_address_area` VALUES (530629, 0, 100, 530600, '威信县');
INSERT INTO `sys_address_area` VALUES (530630, 0, 100, 530600, '水富县');
INSERT INTO `sys_address_area` VALUES (530701, 0, 100, 530700, '市辖区');
INSERT INTO `sys_address_area` VALUES (530702, 0, 100, 530700, '古城区');
INSERT INTO `sys_address_area` VALUES (530721, 0, 100, 530700, '玉龙纳西族自治县');
INSERT INTO `sys_address_area` VALUES (530722, 0, 100, 530700, '永胜县');
INSERT INTO `sys_address_area` VALUES (530723, 0, 100, 530700, '华坪县');
INSERT INTO `sys_address_area` VALUES (530724, 0, 100, 530700, '宁蒗彝族自治县');
INSERT INTO `sys_address_area` VALUES (530801, 0, 100, 530800, '市辖区');
INSERT INTO `sys_address_area` VALUES (530802, 0, 100, 530800, '翠云区');
INSERT INTO `sys_address_area` VALUES (530821, 0, 100, 530800, '普洱哈尼族彝族自治县');
INSERT INTO `sys_address_area` VALUES (530822, 0, 100, 530800, '墨江哈尼族自治县');
INSERT INTO `sys_address_area` VALUES (530823, 0, 100, 530800, '景东彝族自治县');
INSERT INTO `sys_address_area` VALUES (530824, 0, 100, 530800, '景谷傣族彝族自治县');
INSERT INTO `sys_address_area` VALUES (530825, 0, 100, 530800, '镇沅彝族哈尼族拉祜族自治县');
INSERT INTO `sys_address_area` VALUES (530826, 0, 100, 530800, '江城哈尼族彝族自治县');
INSERT INTO `sys_address_area` VALUES (530827, 0, 100, 530800, '孟连傣族拉祜族佤族自治县');
INSERT INTO `sys_address_area` VALUES (530828, 0, 100, 530800, '澜沧拉祜族自治县');
INSERT INTO `sys_address_area` VALUES (530829, 0, 100, 530800, '西盟佤族自治县');
INSERT INTO `sys_address_area` VALUES (530901, 0, 100, 530900, '市辖区');
INSERT INTO `sys_address_area` VALUES (530902, 0, 100, 530900, '临翔区');
INSERT INTO `sys_address_area` VALUES (530921, 0, 100, 530900, '凤庆县');
INSERT INTO `sys_address_area` VALUES (530922, 0, 100, 530900, '云　县');
INSERT INTO `sys_address_area` VALUES (530923, 0, 100, 530900, '永德县');
INSERT INTO `sys_address_area` VALUES (530924, 0, 100, 530900, '镇康县');
INSERT INTO `sys_address_area` VALUES (530925, 0, 100, 530900, '双江拉祜族佤族布朗族傣族自治县');
INSERT INTO `sys_address_area` VALUES (530926, 0, 100, 530900, '耿马傣族佤族自治县');
INSERT INTO `sys_address_area` VALUES (530927, 0, 100, 530900, '沧源佤族自治县');
INSERT INTO `sys_address_area` VALUES (532301, 0, 100, 532300, '楚雄市');
INSERT INTO `sys_address_area` VALUES (532322, 0, 100, 532300, '双柏县');
INSERT INTO `sys_address_area` VALUES (532323, 0, 100, 532300, '牟定县');
INSERT INTO `sys_address_area` VALUES (532324, 0, 100, 532300, '南华县');
INSERT INTO `sys_address_area` VALUES (532325, 0, 100, 532300, '姚安县');
INSERT INTO `sys_address_area` VALUES (532326, 0, 100, 532300, '大姚县');
INSERT INTO `sys_address_area` VALUES (532327, 0, 100, 532300, '永仁县');
INSERT INTO `sys_address_area` VALUES (532328, 0, 100, 532300, '元谋县');
INSERT INTO `sys_address_area` VALUES (532329, 0, 100, 532300, '武定县');
INSERT INTO `sys_address_area` VALUES (532331, 0, 100, 532300, '禄丰县');
INSERT INTO `sys_address_area` VALUES (532501, 0, 100, 532500, '个旧市');
INSERT INTO `sys_address_area` VALUES (532502, 0, 100, 532500, '开远市');
INSERT INTO `sys_address_area` VALUES (532522, 0, 100, 532500, '蒙自县');
INSERT INTO `sys_address_area` VALUES (532523, 0, 100, 532500, '屏边苗族自治县');
INSERT INTO `sys_address_area` VALUES (532524, 0, 100, 532500, '建水县');
INSERT INTO `sys_address_area` VALUES (532525, 0, 100, 532500, '石屏县');
INSERT INTO `sys_address_area` VALUES (532526, 0, 100, 532500, '弥勒县');
INSERT INTO `sys_address_area` VALUES (532527, 0, 100, 532500, '泸西县');
INSERT INTO `sys_address_area` VALUES (532528, 0, 100, 532500, '元阳县');
INSERT INTO `sys_address_area` VALUES (532529, 0, 100, 532500, '红河县');
INSERT INTO `sys_address_area` VALUES (532530, 0, 100, 532500, '金平苗族瑶族傣族自治县');
INSERT INTO `sys_address_area` VALUES (532531, 0, 100, 532500, '绿春县');
INSERT INTO `sys_address_area` VALUES (532532, 0, 100, 532500, '河口瑶族自治县');
INSERT INTO `sys_address_area` VALUES (532621, 0, 100, 532600, '文山县');
INSERT INTO `sys_address_area` VALUES (532622, 0, 100, 532600, '砚山县');
INSERT INTO `sys_address_area` VALUES (532623, 0, 100, 532600, '西畴县');
INSERT INTO `sys_address_area` VALUES (532624, 0, 100, 532600, '麻栗坡县');
INSERT INTO `sys_address_area` VALUES (532625, 0, 100, 532600, '马关县');
INSERT INTO `sys_address_area` VALUES (532626, 0, 100, 532600, '丘北县');
INSERT INTO `sys_address_area` VALUES (532627, 0, 100, 532600, '广南县');
INSERT INTO `sys_address_area` VALUES (532628, 0, 100, 532600, '富宁县');
INSERT INTO `sys_address_area` VALUES (532801, 0, 100, 532800, '景洪市');
INSERT INTO `sys_address_area` VALUES (532822, 0, 100, 532800, '勐海县');
INSERT INTO `sys_address_area` VALUES (532823, 0, 100, 532800, '勐腊县');
INSERT INTO `sys_address_area` VALUES (532901, 0, 100, 532900, '大理市');
INSERT INTO `sys_address_area` VALUES (532922, 0, 100, 532900, '漾濞彝族自治县');
INSERT INTO `sys_address_area` VALUES (532923, 0, 100, 532900, '祥云县');
INSERT INTO `sys_address_area` VALUES (532924, 0, 100, 532900, '宾川县');
INSERT INTO `sys_address_area` VALUES (532925, 0, 100, 532900, '弥渡县');
INSERT INTO `sys_address_area` VALUES (532926, 0, 100, 532900, '南涧彝族自治县');
INSERT INTO `sys_address_area` VALUES (532927, 0, 100, 532900, '巍山彝族回族自治县');
INSERT INTO `sys_address_area` VALUES (532928, 0, 100, 532900, '永平县');
INSERT INTO `sys_address_area` VALUES (532929, 0, 100, 532900, '云龙县');
INSERT INTO `sys_address_area` VALUES (532930, 0, 100, 532900, '洱源县');
INSERT INTO `sys_address_area` VALUES (532931, 0, 100, 532900, '剑川县');
INSERT INTO `sys_address_area` VALUES (532932, 0, 100, 532900, '鹤庆县');
INSERT INTO `sys_address_area` VALUES (533102, 0, 100, 533100, '瑞丽市');
INSERT INTO `sys_address_area` VALUES (533103, 0, 100, 533100, '潞西市');
INSERT INTO `sys_address_area` VALUES (533122, 0, 100, 533100, '梁河县');
INSERT INTO `sys_address_area` VALUES (533123, 0, 100, 533100, '盈江县');
INSERT INTO `sys_address_area` VALUES (533124, 0, 100, 533100, '陇川县');
INSERT INTO `sys_address_area` VALUES (533321, 0, 100, 533300, '泸水县');
INSERT INTO `sys_address_area` VALUES (533323, 0, 100, 533300, '福贡县');
INSERT INTO `sys_address_area` VALUES (533324, 0, 100, 533300, '贡山独龙族怒族自治县');
INSERT INTO `sys_address_area` VALUES (533325, 0, 100, 533300, '兰坪白族普米族自治县');
INSERT INTO `sys_address_area` VALUES (533421, 0, 100, 533400, '香格里拉县');
INSERT INTO `sys_address_area` VALUES (533422, 0, 100, 533400, '德钦县');
INSERT INTO `sys_address_area` VALUES (533423, 0, 100, 533400, '维西傈僳族自治县');
INSERT INTO `sys_address_area` VALUES (540101, 0, 100, 540100, '市辖区');
INSERT INTO `sys_address_area` VALUES (540102, 0, 100, 540100, '城关区');
INSERT INTO `sys_address_area` VALUES (540121, 0, 100, 540100, '林周县');
INSERT INTO `sys_address_area` VALUES (540122, 0, 100, 540100, '当雄县');
INSERT INTO `sys_address_area` VALUES (540123, 0, 100, 540100, '尼木县');
INSERT INTO `sys_address_area` VALUES (540124, 0, 100, 540100, '曲水县');
INSERT INTO `sys_address_area` VALUES (540125, 0, 100, 540100, '堆龙德庆县');
INSERT INTO `sys_address_area` VALUES (540126, 0, 100, 540100, '达孜县');
INSERT INTO `sys_address_area` VALUES (540127, 0, 100, 540100, '墨竹工卡县');
INSERT INTO `sys_address_area` VALUES (542121, 0, 100, 542100, '昌都县');
INSERT INTO `sys_address_area` VALUES (542122, 0, 100, 542100, '江达县');
INSERT INTO `sys_address_area` VALUES (542123, 0, 100, 542100, '贡觉县');
INSERT INTO `sys_address_area` VALUES (542124, 0, 100, 542100, '类乌齐县');
INSERT INTO `sys_address_area` VALUES (542125, 0, 100, 542100, '丁青县');
INSERT INTO `sys_address_area` VALUES (542126, 0, 100, 542100, '察雅县');
INSERT INTO `sys_address_area` VALUES (542127, 0, 100, 542100, '八宿县');
INSERT INTO `sys_address_area` VALUES (542128, 0, 100, 542100, '左贡县');
INSERT INTO `sys_address_area` VALUES (542129, 0, 100, 542100, '芒康县');
INSERT INTO `sys_address_area` VALUES (542132, 0, 100, 542100, '洛隆县');
INSERT INTO `sys_address_area` VALUES (542133, 0, 100, 542100, '边坝县');
INSERT INTO `sys_address_area` VALUES (542221, 0, 100, 542200, '乃东县');
INSERT INTO `sys_address_area` VALUES (542222, 0, 100, 542200, '扎囊县');
INSERT INTO `sys_address_area` VALUES (542223, 0, 100, 542200, '贡嘎县');
INSERT INTO `sys_address_area` VALUES (542224, 0, 100, 542200, '桑日县');
INSERT INTO `sys_address_area` VALUES (542225, 0, 100, 542200, '琼结县');
INSERT INTO `sys_address_area` VALUES (542226, 0, 100, 542200, '曲松县');
INSERT INTO `sys_address_area` VALUES (542227, 0, 100, 542200, '措美县');
INSERT INTO `sys_address_area` VALUES (542228, 0, 100, 542200, '洛扎县');
INSERT INTO `sys_address_area` VALUES (542229, 0, 100, 542200, '加查县');
INSERT INTO `sys_address_area` VALUES (542231, 0, 100, 542200, '隆子县');
INSERT INTO `sys_address_area` VALUES (542232, 0, 100, 542200, '错那县');
INSERT INTO `sys_address_area` VALUES (542233, 0, 100, 542200, '浪卡子县');
INSERT INTO `sys_address_area` VALUES (542301, 0, 100, 542300, '日喀则市');
INSERT INTO `sys_address_area` VALUES (542322, 0, 100, 542300, '南木林县');
INSERT INTO `sys_address_area` VALUES (542323, 0, 100, 542300, '江孜县');
INSERT INTO `sys_address_area` VALUES (542324, 0, 100, 542300, '定日县');
INSERT INTO `sys_address_area` VALUES (542325, 0, 100, 542300, '萨迦县');
INSERT INTO `sys_address_area` VALUES (542326, 0, 100, 542300, '拉孜县');
INSERT INTO `sys_address_area` VALUES (542327, 0, 100, 542300, '昂仁县');
INSERT INTO `sys_address_area` VALUES (542328, 0, 100, 542300, '谢通门县');
INSERT INTO `sys_address_area` VALUES (542329, 0, 100, 542300, '白朗县');
INSERT INTO `sys_address_area` VALUES (542330, 0, 100, 542300, '仁布县');
INSERT INTO `sys_address_area` VALUES (542331, 0, 100, 542300, '康马县');
INSERT INTO `sys_address_area` VALUES (542332, 0, 100, 542300, '定结县');
INSERT INTO `sys_address_area` VALUES (542333, 0, 100, 542300, '仲巴县');
INSERT INTO `sys_address_area` VALUES (542334, 0, 100, 542300, '亚东县');
INSERT INTO `sys_address_area` VALUES (542335, 0, 100, 542300, '吉隆县');
INSERT INTO `sys_address_area` VALUES (542336, 0, 100, 542300, '聂拉木县');
INSERT INTO `sys_address_area` VALUES (542337, 0, 100, 542300, '萨嘎县');
INSERT INTO `sys_address_area` VALUES (542338, 0, 100, 542300, '岗巴县');
INSERT INTO `sys_address_area` VALUES (542421, 0, 100, 542400, '那曲县');
INSERT INTO `sys_address_area` VALUES (542422, 0, 100, 542400, '嘉黎县');
INSERT INTO `sys_address_area` VALUES (542423, 0, 100, 542400, '比如县');
INSERT INTO `sys_address_area` VALUES (542424, 0, 100, 542400, '聂荣县');
INSERT INTO `sys_address_area` VALUES (542425, 0, 100, 542400, '安多县');
INSERT INTO `sys_address_area` VALUES (542426, 0, 100, 542400, '申扎县');
INSERT INTO `sys_address_area` VALUES (542427, 0, 100, 542400, '索　县');
INSERT INTO `sys_address_area` VALUES (542428, 0, 100, 542400, '班戈县');
INSERT INTO `sys_address_area` VALUES (542429, 0, 100, 542400, '巴青县');
INSERT INTO `sys_address_area` VALUES (542430, 0, 100, 542400, '尼玛县');
INSERT INTO `sys_address_area` VALUES (542521, 0, 100, 542500, '普兰县');
INSERT INTO `sys_address_area` VALUES (542522, 0, 100, 542500, '札达县');
INSERT INTO `sys_address_area` VALUES (542523, 0, 100, 542500, '噶尔县');
INSERT INTO `sys_address_area` VALUES (542524, 0, 100, 542500, '日土县');
INSERT INTO `sys_address_area` VALUES (542525, 0, 100, 542500, '革吉县');
INSERT INTO `sys_address_area` VALUES (542526, 0, 100, 542500, '改则县');
INSERT INTO `sys_address_area` VALUES (542527, 0, 100, 542500, '措勤县');
INSERT INTO `sys_address_area` VALUES (542621, 0, 100, 542600, '林芝县');
INSERT INTO `sys_address_area` VALUES (542622, 0, 100, 542600, '工布江达县');
INSERT INTO `sys_address_area` VALUES (542623, 0, 100, 542600, '米林县');
INSERT INTO `sys_address_area` VALUES (542624, 0, 100, 542600, '墨脱县');
INSERT INTO `sys_address_area` VALUES (542625, 0, 100, 542600, '波密县');
INSERT INTO `sys_address_area` VALUES (542626, 0, 100, 542600, '察隅县');
INSERT INTO `sys_address_area` VALUES (542627, 0, 100, 542600, '朗　县');
INSERT INTO `sys_address_area` VALUES (610101, 0, 100, 610100, '市辖区');
INSERT INTO `sys_address_area` VALUES (610102, 0, 100, 610100, '新城区');
INSERT INTO `sys_address_area` VALUES (610103, 0, 100, 610100, '碑林区');
INSERT INTO `sys_address_area` VALUES (610104, 0, 100, 610100, '莲湖区');
INSERT INTO `sys_address_area` VALUES (610111, 0, 100, 610100, '灞桥区');
INSERT INTO `sys_address_area` VALUES (610112, 0, 100, 610100, '未央区');
INSERT INTO `sys_address_area` VALUES (610113, 0, 100, 610100, '雁塔区');
INSERT INTO `sys_address_area` VALUES (610114, 0, 100, 610100, '阎良区');
INSERT INTO `sys_address_area` VALUES (610115, 0, 100, 610100, '临潼区');
INSERT INTO `sys_address_area` VALUES (610116, 0, 100, 610100, '长安区');
INSERT INTO `sys_address_area` VALUES (610122, 0, 100, 610100, '蓝田县');
INSERT INTO `sys_address_area` VALUES (610124, 0, 100, 610100, '周至县');
INSERT INTO `sys_address_area` VALUES (610125, 0, 100, 610100, '户　县');
INSERT INTO `sys_address_area` VALUES (610126, 0, 100, 610100, '高陵县');
INSERT INTO `sys_address_area` VALUES (610201, 0, 100, 610200, '市辖区');
INSERT INTO `sys_address_area` VALUES (610202, 0, 100, 610200, '王益区');
INSERT INTO `sys_address_area` VALUES (610203, 0, 100, 610200, '印台区');
INSERT INTO `sys_address_area` VALUES (610204, 0, 100, 610200, '耀州区');
INSERT INTO `sys_address_area` VALUES (610222, 0, 100, 610200, '宜君县');
INSERT INTO `sys_address_area` VALUES (610301, 0, 100, 610300, '市辖区');
INSERT INTO `sys_address_area` VALUES (610302, 0, 100, 610300, '渭滨区');
INSERT INTO `sys_address_area` VALUES (610303, 0, 100, 610300, '金台区');
INSERT INTO `sys_address_area` VALUES (610304, 0, 100, 610300, '陈仓区');
INSERT INTO `sys_address_area` VALUES (610322, 0, 100, 610300, '凤翔县');
INSERT INTO `sys_address_area` VALUES (610323, 0, 100, 610300, '岐山县');
INSERT INTO `sys_address_area` VALUES (610324, 0, 100, 610300, '扶风县');
INSERT INTO `sys_address_area` VALUES (610326, 0, 100, 610300, '眉　县');
INSERT INTO `sys_address_area` VALUES (610327, 0, 100, 610300, '陇　县');
INSERT INTO `sys_address_area` VALUES (610328, 0, 100, 610300, '千阳县');
INSERT INTO `sys_address_area` VALUES (610329, 0, 100, 610300, '麟游县');
INSERT INTO `sys_address_area` VALUES (610330, 0, 100, 610300, '凤　县');
INSERT INTO `sys_address_area` VALUES (610331, 0, 100, 610300, '太白县');
INSERT INTO `sys_address_area` VALUES (610401, 0, 100, 610400, '市辖区');
INSERT INTO `sys_address_area` VALUES (610402, 0, 100, 610400, '秦都区');
INSERT INTO `sys_address_area` VALUES (610403, 0, 100, 610400, '杨凌区');
INSERT INTO `sys_address_area` VALUES (610404, 0, 100, 610400, '渭城区');
INSERT INTO `sys_address_area` VALUES (610422, 0, 100, 610400, '三原县');
INSERT INTO `sys_address_area` VALUES (610423, 0, 100, 610400, '泾阳县');
INSERT INTO `sys_address_area` VALUES (610424, 0, 100, 610400, '乾　县');
INSERT INTO `sys_address_area` VALUES (610425, 0, 100, 610400, '礼泉县');
INSERT INTO `sys_address_area` VALUES (610426, 0, 100, 610400, '永寿县');
INSERT INTO `sys_address_area` VALUES (610427, 0, 100, 610400, '彬　县');
INSERT INTO `sys_address_area` VALUES (610428, 0, 100, 610400, '长武县');
INSERT INTO `sys_address_area` VALUES (610429, 0, 100, 610400, '旬邑县');
INSERT INTO `sys_address_area` VALUES (610430, 0, 100, 610400, '淳化县');
INSERT INTO `sys_address_area` VALUES (610431, 0, 100, 610400, '武功县');
INSERT INTO `sys_address_area` VALUES (610481, 0, 100, 610400, '兴平市');
INSERT INTO `sys_address_area` VALUES (610501, 0, 100, 610500, '市辖区');
INSERT INTO `sys_address_area` VALUES (610502, 0, 100, 610500, '临渭区');
INSERT INTO `sys_address_area` VALUES (610521, 0, 100, 610500, '华　县');
INSERT INTO `sys_address_area` VALUES (610522, 0, 100, 610500, '潼关县');
INSERT INTO `sys_address_area` VALUES (610523, 0, 100, 610500, '大荔县');
INSERT INTO `sys_address_area` VALUES (610524, 0, 100, 610500, '合阳县');
INSERT INTO `sys_address_area` VALUES (610525, 0, 100, 610500, '澄城县');
INSERT INTO `sys_address_area` VALUES (610526, 0, 100, 610500, '蒲城县');
INSERT INTO `sys_address_area` VALUES (610527, 0, 100, 610500, '白水县');
INSERT INTO `sys_address_area` VALUES (610528, 0, 100, 610500, '富平县');
INSERT INTO `sys_address_area` VALUES (610581, 0, 100, 610500, '韩城市');
INSERT INTO `sys_address_area` VALUES (610582, 0, 100, 610500, '华阴市');
INSERT INTO `sys_address_area` VALUES (610601, 0, 100, 610600, '市辖区');
INSERT INTO `sys_address_area` VALUES (610602, 0, 100, 610600, '宝塔区');
INSERT INTO `sys_address_area` VALUES (610621, 0, 100, 610600, '延长县');
INSERT INTO `sys_address_area` VALUES (610622, 0, 100, 610600, '延川县');
INSERT INTO `sys_address_area` VALUES (610623, 0, 100, 610600, '子长县');
INSERT INTO `sys_address_area` VALUES (610624, 0, 100, 610600, '安塞县');
INSERT INTO `sys_address_area` VALUES (610625, 0, 100, 610600, '志丹县');
INSERT INTO `sys_address_area` VALUES (610626, 0, 100, 610600, '吴旗县');
INSERT INTO `sys_address_area` VALUES (610627, 0, 100, 610600, '甘泉县');
INSERT INTO `sys_address_area` VALUES (610628, 0, 100, 610600, '富　县');
INSERT INTO `sys_address_area` VALUES (610629, 0, 100, 610600, '洛川县');
INSERT INTO `sys_address_area` VALUES (610630, 0, 100, 610600, '宜川县');
INSERT INTO `sys_address_area` VALUES (610631, 0, 100, 610600, '黄龙县');
INSERT INTO `sys_address_area` VALUES (610632, 0, 100, 610600, '黄陵县');
INSERT INTO `sys_address_area` VALUES (610701, 0, 100, 610700, '市辖区');
INSERT INTO `sys_address_area` VALUES (610702, 0, 100, 610700, '汉台区');
INSERT INTO `sys_address_area` VALUES (610721, 0, 100, 610700, '南郑县');
INSERT INTO `sys_address_area` VALUES (610722, 0, 100, 610700, '城固县');
INSERT INTO `sys_address_area` VALUES (610723, 0, 100, 610700, '洋　县');
INSERT INTO `sys_address_area` VALUES (610724, 0, 100, 610700, '西乡县');
INSERT INTO `sys_address_area` VALUES (610725, 0, 100, 610700, '勉　县');
INSERT INTO `sys_address_area` VALUES (610726, 0, 100, 610700, '宁强县');
INSERT INTO `sys_address_area` VALUES (610727, 0, 100, 610700, '略阳县');
INSERT INTO `sys_address_area` VALUES (610728, 0, 100, 610700, '镇巴县');
INSERT INTO `sys_address_area` VALUES (610729, 0, 100, 610700, '留坝县');
INSERT INTO `sys_address_area` VALUES (610730, 0, 100, 610700, '佛坪县');
INSERT INTO `sys_address_area` VALUES (610801, 0, 100, 610800, '市辖区');
INSERT INTO `sys_address_area` VALUES (610802, 0, 100, 610800, '榆阳区');
INSERT INTO `sys_address_area` VALUES (610821, 0, 100, 610800, '神木县');
INSERT INTO `sys_address_area` VALUES (610822, 0, 100, 610800, '府谷县');
INSERT INTO `sys_address_area` VALUES (610823, 0, 100, 610800, '横山县');
INSERT INTO `sys_address_area` VALUES (610824, 0, 100, 610800, '靖边县');
INSERT INTO `sys_address_area` VALUES (610825, 0, 100, 610800, '定边县');
INSERT INTO `sys_address_area` VALUES (610826, 0, 100, 610800, '绥德县');
INSERT INTO `sys_address_area` VALUES (610827, 0, 100, 610800, '米脂县');
INSERT INTO `sys_address_area` VALUES (610828, 0, 100, 610800, '佳　县');
INSERT INTO `sys_address_area` VALUES (610829, 0, 100, 610800, '吴堡县');
INSERT INTO `sys_address_area` VALUES (610830, 0, 100, 610800, '清涧县');
INSERT INTO `sys_address_area` VALUES (610831, 0, 100, 610800, '子洲县');
INSERT INTO `sys_address_area` VALUES (610901, 0, 100, 610900, '市辖区');
INSERT INTO `sys_address_area` VALUES (610902, 0, 100, 610900, '汉滨区');
INSERT INTO `sys_address_area` VALUES (610921, 0, 100, 610900, '汉阴县');
INSERT INTO `sys_address_area` VALUES (610922, 0, 100, 610900, '石泉县');
INSERT INTO `sys_address_area` VALUES (610923, 0, 100, 610900, '宁陕县');
INSERT INTO `sys_address_area` VALUES (610924, 0, 100, 610900, '紫阳县');
INSERT INTO `sys_address_area` VALUES (610925, 0, 100, 610900, '岚皋县');
INSERT INTO `sys_address_area` VALUES (610926, 0, 100, 610900, '平利县');
INSERT INTO `sys_address_area` VALUES (610927, 0, 100, 610900, '镇坪县');
INSERT INTO `sys_address_area` VALUES (610928, 0, 100, 610900, '旬阳县');
INSERT INTO `sys_address_area` VALUES (610929, 0, 100, 610900, '白河县');
INSERT INTO `sys_address_area` VALUES (611001, 0, 100, 611000, '市辖区');
INSERT INTO `sys_address_area` VALUES (611002, 0, 100, 611000, '商州区');
INSERT INTO `sys_address_area` VALUES (611021, 0, 100, 611000, '洛南县');
INSERT INTO `sys_address_area` VALUES (611022, 0, 100, 611000, '丹凤县');
INSERT INTO `sys_address_area` VALUES (611023, 0, 100, 611000, '商南县');
INSERT INTO `sys_address_area` VALUES (611024, 0, 100, 611000, '山阳县');
INSERT INTO `sys_address_area` VALUES (611025, 0, 100, 611000, '镇安县');
INSERT INTO `sys_address_area` VALUES (611026, 0, 100, 611000, '柞水县');
INSERT INTO `sys_address_area` VALUES (620101, 0, 100, 620100, '市辖区');
INSERT INTO `sys_address_area` VALUES (620102, 0, 100, 620100, '城关区');
INSERT INTO `sys_address_area` VALUES (620103, 0, 100, 620100, '七里河区');
INSERT INTO `sys_address_area` VALUES (620104, 0, 100, 620100, '西固区');
INSERT INTO `sys_address_area` VALUES (620105, 0, 100, 620100, '安宁区');
INSERT INTO `sys_address_area` VALUES (620111, 0, 100, 620100, '红古区');
INSERT INTO `sys_address_area` VALUES (620121, 0, 100, 620100, '永登县');
INSERT INTO `sys_address_area` VALUES (620122, 0, 100, 620100, '皋兰县');
INSERT INTO `sys_address_area` VALUES (620123, 0, 100, 620100, '榆中县');
INSERT INTO `sys_address_area` VALUES (620201, 0, 100, 620200, '市辖区');
INSERT INTO `sys_address_area` VALUES (620301, 0, 100, 620300, '市辖区');
INSERT INTO `sys_address_area` VALUES (620302, 0, 100, 620300, '金川区');
INSERT INTO `sys_address_area` VALUES (620321, 0, 100, 620300, '永昌县');
INSERT INTO `sys_address_area` VALUES (620401, 0, 100, 620400, '市辖区');
INSERT INTO `sys_address_area` VALUES (620402, 0, 100, 620400, '白银区');
INSERT INTO `sys_address_area` VALUES (620403, 0, 100, 620400, '平川区');
INSERT INTO `sys_address_area` VALUES (620421, 0, 100, 620400, '靖远县');
INSERT INTO `sys_address_area` VALUES (620422, 0, 100, 620400, '会宁县');
INSERT INTO `sys_address_area` VALUES (620423, 0, 100, 620400, '景泰县');
INSERT INTO `sys_address_area` VALUES (620501, 0, 100, 620500, '市辖区');
INSERT INTO `sys_address_area` VALUES (620502, 0, 100, 620500, '秦城区');
INSERT INTO `sys_address_area` VALUES (620503, 0, 100, 620500, '北道区');
INSERT INTO `sys_address_area` VALUES (620521, 0, 100, 620500, '清水县');
INSERT INTO `sys_address_area` VALUES (620522, 0, 100, 620500, '秦安县');
INSERT INTO `sys_address_area` VALUES (620523, 0, 100, 620500, '甘谷县');
INSERT INTO `sys_address_area` VALUES (620524, 0, 100, 620500, '武山县');
INSERT INTO `sys_address_area` VALUES (620525, 0, 100, 620500, '张家川回族自治县');
INSERT INTO `sys_address_area` VALUES (620601, 0, 100, 620600, '市辖区');
INSERT INTO `sys_address_area` VALUES (620602, 0, 100, 620600, '凉州区');
INSERT INTO `sys_address_area` VALUES (620621, 0, 100, 620600, '民勤县');
INSERT INTO `sys_address_area` VALUES (620622, 0, 100, 620600, '古浪县');
INSERT INTO `sys_address_area` VALUES (620623, 0, 100, 620600, '天祝藏族自治县');
INSERT INTO `sys_address_area` VALUES (620701, 0, 100, 620700, '市辖区');
INSERT INTO `sys_address_area` VALUES (620702, 0, 100, 620700, '甘州区');
INSERT INTO `sys_address_area` VALUES (620721, 0, 100, 620700, '肃南裕固族自治县');
INSERT INTO `sys_address_area` VALUES (620722, 0, 100, 620700, '民乐县');
INSERT INTO `sys_address_area` VALUES (620723, 0, 100, 620700, '临泽县');
INSERT INTO `sys_address_area` VALUES (620724, 0, 100, 620700, '高台县');
INSERT INTO `sys_address_area` VALUES (620725, 0, 100, 620700, '山丹县');
INSERT INTO `sys_address_area` VALUES (620801, 0, 100, 620800, '市辖区');
INSERT INTO `sys_address_area` VALUES (620802, 0, 100, 620800, '崆峒区');
INSERT INTO `sys_address_area` VALUES (620821, 0, 100, 620800, '泾川县');
INSERT INTO `sys_address_area` VALUES (620822, 0, 100, 620800, '灵台县');
INSERT INTO `sys_address_area` VALUES (620823, 0, 100, 620800, '崇信县');
INSERT INTO `sys_address_area` VALUES (620824, 0, 100, 620800, '华亭县');
INSERT INTO `sys_address_area` VALUES (620825, 0, 100, 620800, '庄浪县');
INSERT INTO `sys_address_area` VALUES (620826, 0, 100, 620800, '静宁县');
INSERT INTO `sys_address_area` VALUES (620901, 0, 100, 620900, '市辖区');
INSERT INTO `sys_address_area` VALUES (620902, 0, 100, 620900, '肃州区');
INSERT INTO `sys_address_area` VALUES (620921, 0, 100, 620900, '金塔县');
INSERT INTO `sys_address_area` VALUES (620922, 0, 100, 620900, '安西县');
INSERT INTO `sys_address_area` VALUES (620923, 0, 100, 620900, '肃北蒙古族自治县');
INSERT INTO `sys_address_area` VALUES (620924, 0, 100, 620900, '阿克塞哈萨克族自治县');
INSERT INTO `sys_address_area` VALUES (620981, 0, 100, 620900, '玉门市');
INSERT INTO `sys_address_area` VALUES (620982, 0, 100, 620900, '敦煌市');
INSERT INTO `sys_address_area` VALUES (621001, 0, 100, 621000, '市辖区');
INSERT INTO `sys_address_area` VALUES (621002, 0, 100, 621000, '西峰区');
INSERT INTO `sys_address_area` VALUES (621021, 0, 100, 621000, '庆城县');
INSERT INTO `sys_address_area` VALUES (621022, 0, 100, 621000, '环　县');
INSERT INTO `sys_address_area` VALUES (621023, 0, 100, 621000, '华池县');
INSERT INTO `sys_address_area` VALUES (621024, 0, 100, 621000, '合水县');
INSERT INTO `sys_address_area` VALUES (621025, 0, 100, 621000, '正宁县');
INSERT INTO `sys_address_area` VALUES (621026, 0, 100, 621000, '宁　县');
INSERT INTO `sys_address_area` VALUES (621027, 0, 100, 621000, '镇原县');
INSERT INTO `sys_address_area` VALUES (621101, 0, 100, 621100, '市辖区');
INSERT INTO `sys_address_area` VALUES (621102, 0, 100, 621100, '安定区');
INSERT INTO `sys_address_area` VALUES (621121, 0, 100, 621100, '通渭县');
INSERT INTO `sys_address_area` VALUES (621122, 0, 100, 621100, '陇西县');
INSERT INTO `sys_address_area` VALUES (621123, 0, 100, 621100, '渭源县');
INSERT INTO `sys_address_area` VALUES (621124, 0, 100, 621100, '临洮县');
INSERT INTO `sys_address_area` VALUES (621125, 0, 100, 621100, '漳　县');
INSERT INTO `sys_address_area` VALUES (621126, 0, 100, 621100, '岷　县');
INSERT INTO `sys_address_area` VALUES (621201, 0, 100, 621200, '市辖区');
INSERT INTO `sys_address_area` VALUES (621202, 0, 100, 621200, '武都区');
INSERT INTO `sys_address_area` VALUES (621221, 0, 100, 621200, '成　县');
INSERT INTO `sys_address_area` VALUES (621222, 0, 100, 621200, '文　县');
INSERT INTO `sys_address_area` VALUES (621223, 0, 100, 621200, '宕昌县');
INSERT INTO `sys_address_area` VALUES (621224, 0, 100, 621200, '康　县');
INSERT INTO `sys_address_area` VALUES (621225, 0, 100, 621200, '西和县');
INSERT INTO `sys_address_area` VALUES (621226, 0, 100, 621200, '礼　县');
INSERT INTO `sys_address_area` VALUES (621227, 0, 100, 621200, '徽　县');
INSERT INTO `sys_address_area` VALUES (621228, 0, 100, 621200, '两当县');
INSERT INTO `sys_address_area` VALUES (622901, 0, 100, 622900, '临夏市');
INSERT INTO `sys_address_area` VALUES (622921, 0, 100, 622900, '临夏县');
INSERT INTO `sys_address_area` VALUES (622922, 0, 100, 622900, '康乐县');
INSERT INTO `sys_address_area` VALUES (622923, 0, 100, 622900, '永靖县');
INSERT INTO `sys_address_area` VALUES (622924, 0, 100, 622900, '广河县');
INSERT INTO `sys_address_area` VALUES (622925, 0, 100, 622900, '和政县');
INSERT INTO `sys_address_area` VALUES (622926, 0, 100, 622900, '东乡族自治县');
INSERT INTO `sys_address_area` VALUES (622927, 0, 100, 622900, '积石山保安族东乡族撒拉族自治县');
INSERT INTO `sys_address_area` VALUES (623001, 0, 100, 623000, '合作市');
INSERT INTO `sys_address_area` VALUES (623021, 0, 100, 623000, '临潭县');
INSERT INTO `sys_address_area` VALUES (623022, 0, 100, 623000, '卓尼县');
INSERT INTO `sys_address_area` VALUES (623023, 0, 100, 623000, '舟曲县');
INSERT INTO `sys_address_area` VALUES (623024, 0, 100, 623000, '迭部县');
INSERT INTO `sys_address_area` VALUES (623025, 0, 100, 623000, '玛曲县');
INSERT INTO `sys_address_area` VALUES (623026, 0, 100, 623000, '碌曲县');
INSERT INTO `sys_address_area` VALUES (623027, 0, 100, 623000, '夏河县');
INSERT INTO `sys_address_area` VALUES (630101, 0, 100, 630100, '市辖区');
INSERT INTO `sys_address_area` VALUES (630102, 0, 100, 630100, '城东区');
INSERT INTO `sys_address_area` VALUES (630103, 0, 100, 630100, '城中区');
INSERT INTO `sys_address_area` VALUES (630104, 0, 100, 630100, '城西区');
INSERT INTO `sys_address_area` VALUES (630105, 0, 100, 630100, '城北区');
INSERT INTO `sys_address_area` VALUES (630121, 0, 100, 630100, '大通回族土族自治县');
INSERT INTO `sys_address_area` VALUES (630122, 0, 100, 630100, '湟中县');
INSERT INTO `sys_address_area` VALUES (630123, 0, 100, 630100, '湟源县');
INSERT INTO `sys_address_area` VALUES (632121, 0, 100, 632100, '平安县');
INSERT INTO `sys_address_area` VALUES (632122, 0, 100, 632100, '民和回族土族自治县');
INSERT INTO `sys_address_area` VALUES (632123, 0, 100, 632100, '乐都县');
INSERT INTO `sys_address_area` VALUES (632126, 0, 100, 632100, '互助土族自治县');
INSERT INTO `sys_address_area` VALUES (632127, 0, 100, 632100, '化隆回族自治县');
INSERT INTO `sys_address_area` VALUES (632128, 0, 100, 632100, '循化撒拉族自治县');
INSERT INTO `sys_address_area` VALUES (632221, 0, 100, 632200, '门源回族自治县');
INSERT INTO `sys_address_area` VALUES (632222, 0, 100, 632200, '祁连县');
INSERT INTO `sys_address_area` VALUES (632223, 0, 100, 632200, '海晏县');
INSERT INTO `sys_address_area` VALUES (632224, 0, 100, 632200, '刚察县');
INSERT INTO `sys_address_area` VALUES (632321, 0, 100, 632300, '同仁县');
INSERT INTO `sys_address_area` VALUES (632322, 0, 100, 632300, '尖扎县');
INSERT INTO `sys_address_area` VALUES (632323, 0, 100, 632300, '泽库县');
INSERT INTO `sys_address_area` VALUES (632324, 0, 100, 632300, '河南蒙古族自治县');
INSERT INTO `sys_address_area` VALUES (632521, 0, 100, 632500, '共和县');
INSERT INTO `sys_address_area` VALUES (632522, 0, 100, 632500, '同德县');
INSERT INTO `sys_address_area` VALUES (632523, 0, 100, 632500, '贵德县');
INSERT INTO `sys_address_area` VALUES (632524, 0, 100, 632500, '兴海县');
INSERT INTO `sys_address_area` VALUES (632525, 0, 100, 632500, '贵南县');
INSERT INTO `sys_address_area` VALUES (632621, 0, 100, 632600, '玛沁县');
INSERT INTO `sys_address_area` VALUES (632622, 0, 100, 632600, '班玛县');
INSERT INTO `sys_address_area` VALUES (632623, 0, 100, 632600, '甘德县');
INSERT INTO `sys_address_area` VALUES (632624, 0, 100, 632600, '达日县');
INSERT INTO `sys_address_area` VALUES (632625, 0, 100, 632600, '久治县');
INSERT INTO `sys_address_area` VALUES (632626, 0, 100, 632600, '玛多县');
INSERT INTO `sys_address_area` VALUES (632721, 0, 100, 632700, '玉树县');
INSERT INTO `sys_address_area` VALUES (632722, 0, 100, 632700, '杂多县');
INSERT INTO `sys_address_area` VALUES (632723, 0, 100, 632700, '称多县');
INSERT INTO `sys_address_area` VALUES (632724, 0, 100, 632700, '治多县');
INSERT INTO `sys_address_area` VALUES (632725, 0, 100, 632700, '囊谦县');
INSERT INTO `sys_address_area` VALUES (632726, 0, 100, 632700, '曲麻莱县');
INSERT INTO `sys_address_area` VALUES (632801, 0, 100, 632800, '格尔木市');
INSERT INTO `sys_address_area` VALUES (632802, 0, 100, 632800, '德令哈市');
INSERT INTO `sys_address_area` VALUES (632821, 0, 100, 632800, '乌兰县');
INSERT INTO `sys_address_area` VALUES (632822, 0, 100, 632800, '都兰县');
INSERT INTO `sys_address_area` VALUES (632823, 0, 100, 632800, '天峻县');
INSERT INTO `sys_address_area` VALUES (640101, 0, 100, 640100, '市辖区');
INSERT INTO `sys_address_area` VALUES (640104, 0, 100, 640100, '兴庆区');
INSERT INTO `sys_address_area` VALUES (640105, 0, 100, 640100, '西夏区');
INSERT INTO `sys_address_area` VALUES (640106, 0, 100, 640100, '金凤区');
INSERT INTO `sys_address_area` VALUES (640121, 0, 100, 640100, '永宁县');
INSERT INTO `sys_address_area` VALUES (640122, 0, 100, 640100, '贺兰县');
INSERT INTO `sys_address_area` VALUES (640181, 0, 100, 640100, '灵武市');
INSERT INTO `sys_address_area` VALUES (640201, 0, 100, 640200, '市辖区');
INSERT INTO `sys_address_area` VALUES (640202, 0, 100, 640200, '大武口区');
INSERT INTO `sys_address_area` VALUES (640205, 0, 100, 640200, '惠农区');
INSERT INTO `sys_address_area` VALUES (640221, 0, 100, 640200, '平罗县');
INSERT INTO `sys_address_area` VALUES (640301, 0, 100, 640300, '市辖区');
INSERT INTO `sys_address_area` VALUES (640302, 0, 100, 640300, '利通区');
INSERT INTO `sys_address_area` VALUES (640323, 0, 100, 640300, '盐池县');
INSERT INTO `sys_address_area` VALUES (640324, 0, 100, 640300, '同心县');
INSERT INTO `sys_address_area` VALUES (640381, 0, 100, 640300, '青铜峡市');
INSERT INTO `sys_address_area` VALUES (640401, 0, 100, 640400, '市辖区');
INSERT INTO `sys_address_area` VALUES (640402, 0, 100, 640400, '原州区');
INSERT INTO `sys_address_area` VALUES (640422, 0, 100, 640400, '西吉县');
INSERT INTO `sys_address_area` VALUES (640423, 0, 100, 640400, '隆德县');
INSERT INTO `sys_address_area` VALUES (640424, 0, 100, 640400, '泾源县');
INSERT INTO `sys_address_area` VALUES (640425, 0, 100, 640400, '彭阳县');
INSERT INTO `sys_address_area` VALUES (640501, 0, 100, 640500, '市辖区');
INSERT INTO `sys_address_area` VALUES (640502, 0, 100, 640500, '沙坡头区');
INSERT INTO `sys_address_area` VALUES (640521, 0, 100, 640500, '中宁县');
INSERT INTO `sys_address_area` VALUES (640522, 0, 100, 640400, '海原县');
INSERT INTO `sys_address_area` VALUES (650101, 0, 100, 650100, '市辖区');
INSERT INTO `sys_address_area` VALUES (650102, 0, 100, 650100, '天山区');
INSERT INTO `sys_address_area` VALUES (650103, 0, 100, 650100, '沙依巴克区');
INSERT INTO `sys_address_area` VALUES (650104, 0, 100, 650100, '新市区');
INSERT INTO `sys_address_area` VALUES (650105, 0, 100, 650100, '水磨沟区');
INSERT INTO `sys_address_area` VALUES (650106, 0, 100, 650100, '头屯河区');
INSERT INTO `sys_address_area` VALUES (650107, 0, 100, 650100, '达坂城区');
INSERT INTO `sys_address_area` VALUES (650108, 0, 100, 650100, '东山区');
INSERT INTO `sys_address_area` VALUES (650121, 0, 100, 650100, '乌鲁木齐县');
INSERT INTO `sys_address_area` VALUES (650201, 0, 100, 650200, '市辖区');
INSERT INTO `sys_address_area` VALUES (650202, 0, 100, 650200, '独山子区');
INSERT INTO `sys_address_area` VALUES (650203, 0, 100, 650200, '克拉玛依区');
INSERT INTO `sys_address_area` VALUES (650204, 0, 100, 650200, '白碱滩区');
INSERT INTO `sys_address_area` VALUES (650205, 0, 100, 650200, '乌尔禾区');
INSERT INTO `sys_address_area` VALUES (652101, 0, 100, 652100, '吐鲁番市');
INSERT INTO `sys_address_area` VALUES (652122, 0, 100, 652100, '鄯善县');
INSERT INTO `sys_address_area` VALUES (652123, 0, 100, 652100, '托克逊县');
INSERT INTO `sys_address_area` VALUES (652201, 0, 100, 652200, '哈密市');
INSERT INTO `sys_address_area` VALUES (652222, 0, 100, 652200, '巴里坤哈萨克自治县');
INSERT INTO `sys_address_area` VALUES (652223, 0, 100, 652200, '伊吾县');
INSERT INTO `sys_address_area` VALUES (652301, 0, 100, 652300, '昌吉市');
INSERT INTO `sys_address_area` VALUES (652302, 0, 100, 652300, '阜康市');
INSERT INTO `sys_address_area` VALUES (652303, 0, 100, 652300, '米泉市');
INSERT INTO `sys_address_area` VALUES (652323, 0, 100, 652300, '呼图壁县');
INSERT INTO `sys_address_area` VALUES (652324, 0, 100, 652300, '玛纳斯县');
INSERT INTO `sys_address_area` VALUES (652325, 0, 100, 652300, '奇台县');
INSERT INTO `sys_address_area` VALUES (652327, 0, 100, 652300, '吉木萨尔县');
INSERT INTO `sys_address_area` VALUES (652328, 0, 100, 652300, '木垒哈萨克自治县');
INSERT INTO `sys_address_area` VALUES (652701, 0, 100, 652700, '博乐市');
INSERT INTO `sys_address_area` VALUES (652722, 0, 100, 652700, '精河县');
INSERT INTO `sys_address_area` VALUES (652723, 0, 100, 652700, '温泉县');
INSERT INTO `sys_address_area` VALUES (652801, 0, 100, 652800, '库尔勒市');
INSERT INTO `sys_address_area` VALUES (652822, 0, 100, 652800, '轮台县');
INSERT INTO `sys_address_area` VALUES (652823, 0, 100, 652800, '尉犁县');
INSERT INTO `sys_address_area` VALUES (652824, 0, 100, 652800, '若羌县');
INSERT INTO `sys_address_area` VALUES (652825, 0, 100, 652800, '且末县');
INSERT INTO `sys_address_area` VALUES (652826, 0, 100, 652800, '焉耆回族自治县');
INSERT INTO `sys_address_area` VALUES (652827, 0, 100, 652800, '和静县');
INSERT INTO `sys_address_area` VALUES (652828, 0, 100, 652800, '和硕县');
INSERT INTO `sys_address_area` VALUES (652829, 0, 100, 652800, '博湖县');
INSERT INTO `sys_address_area` VALUES (652901, 0, 100, 652900, '阿克苏市');
INSERT INTO `sys_address_area` VALUES (652922, 0, 100, 652900, '温宿县');
INSERT INTO `sys_address_area` VALUES (652923, 0, 100, 652900, '库车县');
INSERT INTO `sys_address_area` VALUES (652924, 0, 100, 652900, '沙雅县');
INSERT INTO `sys_address_area` VALUES (652925, 0, 100, 652900, '新和县');
INSERT INTO `sys_address_area` VALUES (652926, 0, 100, 652900, '拜城县');
INSERT INTO `sys_address_area` VALUES (652927, 0, 100, 652900, '乌什县');
INSERT INTO `sys_address_area` VALUES (652928, 0, 100, 652900, '阿瓦提县');
INSERT INTO `sys_address_area` VALUES (652929, 0, 100, 652900, '柯坪县');
INSERT INTO `sys_address_area` VALUES (653001, 0, 100, 653000, '阿图什市');
INSERT INTO `sys_address_area` VALUES (653022, 0, 100, 653000, '阿克陶县');
INSERT INTO `sys_address_area` VALUES (653023, 0, 100, 653000, '阿合奇县');
INSERT INTO `sys_address_area` VALUES (653024, 0, 100, 653000, '乌恰县');
INSERT INTO `sys_address_area` VALUES (653101, 0, 100, 653100, '喀什市');
INSERT INTO `sys_address_area` VALUES (653121, 0, 100, 653100, '疏附县');
INSERT INTO `sys_address_area` VALUES (653122, 0, 100, 653100, '疏勒县');
INSERT INTO `sys_address_area` VALUES (653123, 0, 100, 653100, '英吉沙县');
INSERT INTO `sys_address_area` VALUES (653124, 0, 100, 653100, '泽普县');
INSERT INTO `sys_address_area` VALUES (653125, 0, 100, 653100, '莎车县');
INSERT INTO `sys_address_area` VALUES (653126, 0, 100, 653100, '叶城县');
INSERT INTO `sys_address_area` VALUES (653127, 0, 100, 653100, '麦盖提县');
INSERT INTO `sys_address_area` VALUES (653128, 0, 100, 653100, '岳普湖县');
INSERT INTO `sys_address_area` VALUES (653129, 0, 100, 653100, '伽师县');
INSERT INTO `sys_address_area` VALUES (653130, 0, 100, 653100, '巴楚县');
INSERT INTO `sys_address_area` VALUES (653131, 0, 100, 653100, '塔什库尔干塔吉克自治县');
INSERT INTO `sys_address_area` VALUES (653201, 0, 100, 653200, '和田市');
INSERT INTO `sys_address_area` VALUES (653221, 0, 100, 653200, '和田县');
INSERT INTO `sys_address_area` VALUES (653222, 0, 100, 653200, '墨玉县');
INSERT INTO `sys_address_area` VALUES (653223, 0, 100, 653200, '皮山县');
INSERT INTO `sys_address_area` VALUES (653224, 0, 100, 653200, '洛浦县');
INSERT INTO `sys_address_area` VALUES (653225, 0, 100, 653200, '策勒县');
INSERT INTO `sys_address_area` VALUES (653226, 0, 100, 653200, '于田县');
INSERT INTO `sys_address_area` VALUES (653227, 0, 100, 653200, '民丰县');
INSERT INTO `sys_address_area` VALUES (654002, 0, 100, 654000, '伊宁市');
INSERT INTO `sys_address_area` VALUES (654003, 0, 100, 654000, '奎屯市');
INSERT INTO `sys_address_area` VALUES (654021, 0, 100, 654000, '伊宁县');
INSERT INTO `sys_address_area` VALUES (654022, 0, 100, 654000, '察布查尔锡伯自治县');
INSERT INTO `sys_address_area` VALUES (654023, 0, 100, 654000, '霍城县');
INSERT INTO `sys_address_area` VALUES (654024, 0, 100, 654000, '巩留县');
INSERT INTO `sys_address_area` VALUES (654025, 0, 100, 654000, '新源县');
INSERT INTO `sys_address_area` VALUES (654026, 0, 100, 654000, '昭苏县');
INSERT INTO `sys_address_area` VALUES (654027, 0, 100, 654000, '特克斯县');
INSERT INTO `sys_address_area` VALUES (654028, 0, 100, 654000, '尼勒克县');
INSERT INTO `sys_address_area` VALUES (654201, 0, 100, 654200, '塔城市');
INSERT INTO `sys_address_area` VALUES (654202, 0, 100, 654200, '乌苏市');
INSERT INTO `sys_address_area` VALUES (654221, 0, 100, 654200, '额敏县');
INSERT INTO `sys_address_area` VALUES (654223, 0, 100, 654200, '沙湾县');
INSERT INTO `sys_address_area` VALUES (654224, 0, 100, 654200, '托里县');
INSERT INTO `sys_address_area` VALUES (654225, 0, 100, 654200, '裕民县');
INSERT INTO `sys_address_area` VALUES (654226, 0, 100, 654200, '和布克赛尔蒙古自治县');
INSERT INTO `sys_address_area` VALUES (654301, 0, 100, 654300, '阿勒泰市');
INSERT INTO `sys_address_area` VALUES (654321, 0, 100, 654300, '布尔津县');
INSERT INTO `sys_address_area` VALUES (654322, 0, 100, 654300, '富蕴县');
INSERT INTO `sys_address_area` VALUES (654323, 0, 100, 654300, '福海县');
INSERT INTO `sys_address_area` VALUES (654324, 0, 100, 654300, '哈巴河县');
INSERT INTO `sys_address_area` VALUES (654325, 0, 100, 654300, '青河县');
INSERT INTO `sys_address_area` VALUES (654326, 0, 100, 654300, '吉木乃县');
INSERT INTO `sys_address_area` VALUES (659001, 0, 100, 659000, '石河子市');
INSERT INTO `sys_address_area` VALUES (659002, 0, 100, 659000, '阿拉尔市');
INSERT INTO `sys_address_area` VALUES (659003, 0, 100, 659000, '图木舒克市');
INSERT INTO `sys_address_area` VALUES (659004, 0, 100, 659000, '五家渠市');

-- ----------------------------
-- Table structure for sys_address_city
-- ----------------------------
DROP TABLE IF EXISTS `sys_address_city`;
CREATE TABLE `sys_address_city`  (
  `city_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '城市ID：[1,8388607]',
  `show` smallint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否可见：[0,2]0为仅表单可见，1为仅表单和搜索时可见 ，2为均可见',
  `display` smallint(4) UNSIGNED NOT NULL DEFAULT 100 COMMENT '显示顺序：[0,1000]',
  `province_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '所属省份ID：[1,8388607]',
  `name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '城市名称：[0,16]',
  PRIMARY KEY (`city_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '城市：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_address_city
-- ----------------------------
INSERT INTO `sys_address_city` VALUES (110100, 0, 100, 110000, '市辖区');
INSERT INTO `sys_address_city` VALUES (110200, 0, 100, 110000, '县');
INSERT INTO `sys_address_city` VALUES (120100, 0, 100, 120000, '市辖区');
INSERT INTO `sys_address_city` VALUES (120200, 0, 100, 120000, '县');
INSERT INTO `sys_address_city` VALUES (130100, 0, 100, 130000, '石家庄市');
INSERT INTO `sys_address_city` VALUES (130200, 0, 100, 130000, '唐山市');
INSERT INTO `sys_address_city` VALUES (130300, 0, 100, 130000, '秦皇岛市');
INSERT INTO `sys_address_city` VALUES (130400, 0, 100, 130000, '邯郸市');
INSERT INTO `sys_address_city` VALUES (130500, 0, 100, 130000, '邢台市');
INSERT INTO `sys_address_city` VALUES (130600, 0, 100, 130000, '保定市');
INSERT INTO `sys_address_city` VALUES (130700, 0, 100, 130000, '张家口市');
INSERT INTO `sys_address_city` VALUES (130800, 0, 100, 130000, '承德市');
INSERT INTO `sys_address_city` VALUES (130900, 0, 100, 130000, '沧州市');
INSERT INTO `sys_address_city` VALUES (131000, 0, 100, 130000, '廊坊市');
INSERT INTO `sys_address_city` VALUES (131100, 0, 100, 130000, '衡水市');
INSERT INTO `sys_address_city` VALUES (140100, 0, 100, 140000, '太原市');
INSERT INTO `sys_address_city` VALUES (140200, 0, 100, 140000, '大同市');
INSERT INTO `sys_address_city` VALUES (140300, 0, 100, 140000, '阳泉市');
INSERT INTO `sys_address_city` VALUES (140400, 0, 100, 140000, '长治市');
INSERT INTO `sys_address_city` VALUES (140500, 0, 100, 140000, '晋城市');
INSERT INTO `sys_address_city` VALUES (140600, 0, 100, 140000, '朔州市');
INSERT INTO `sys_address_city` VALUES (140700, 0, 100, 140000, '晋中市');
INSERT INTO `sys_address_city` VALUES (140800, 0, 100, 140000, '运城市');
INSERT INTO `sys_address_city` VALUES (140900, 0, 100, 140000, '忻州市');
INSERT INTO `sys_address_city` VALUES (141000, 0, 100, 140000, '临汾市');
INSERT INTO `sys_address_city` VALUES (141100, 0, 100, 140000, '吕梁市');
INSERT INTO `sys_address_city` VALUES (150100, 0, 100, 150000, '呼和浩特市');
INSERT INTO `sys_address_city` VALUES (150200, 0, 100, 150000, '包头市');
INSERT INTO `sys_address_city` VALUES (150300, 0, 100, 150000, '乌海市');
INSERT INTO `sys_address_city` VALUES (150400, 0, 100, 150000, '赤峰市');
INSERT INTO `sys_address_city` VALUES (150500, 0, 100, 150000, '通辽市');
INSERT INTO `sys_address_city` VALUES (150600, 0, 100, 150000, '鄂尔多斯市');
INSERT INTO `sys_address_city` VALUES (150700, 0, 100, 150000, '呼伦贝尔市');
INSERT INTO `sys_address_city` VALUES (150800, 0, 100, 150000, '巴彦淖尔市');
INSERT INTO `sys_address_city` VALUES (150900, 0, 100, 150000, '乌兰察布市');
INSERT INTO `sys_address_city` VALUES (152200, 0, 100, 150000, '兴安盟');
INSERT INTO `sys_address_city` VALUES (152500, 0, 100, 150000, '锡林郭勒盟');
INSERT INTO `sys_address_city` VALUES (152900, 0, 100, 150000, '阿拉善盟');
INSERT INTO `sys_address_city` VALUES (210100, 0, 100, 210000, '沈阳市');
INSERT INTO `sys_address_city` VALUES (210200, 0, 100, 210000, '大连市');
INSERT INTO `sys_address_city` VALUES (210300, 0, 100, 210000, '鞍山市');
INSERT INTO `sys_address_city` VALUES (210400, 0, 100, 210000, '抚顺市');
INSERT INTO `sys_address_city` VALUES (210500, 0, 100, 210000, '本溪市');
INSERT INTO `sys_address_city` VALUES (210600, 0, 100, 210000, '丹东市');
INSERT INTO `sys_address_city` VALUES (210700, 0, 100, 210000, '锦州市');
INSERT INTO `sys_address_city` VALUES (210800, 0, 100, 210000, '营口市');
INSERT INTO `sys_address_city` VALUES (210900, 0, 100, 210000, '阜新市');
INSERT INTO `sys_address_city` VALUES (211000, 0, 100, 210000, '辽阳市');
INSERT INTO `sys_address_city` VALUES (211100, 0, 100, 210000, '盘锦市');
INSERT INTO `sys_address_city` VALUES (211200, 0, 100, 210000, '铁岭市');
INSERT INTO `sys_address_city` VALUES (211300, 0, 100, 210000, '朝阳市');
INSERT INTO `sys_address_city` VALUES (211400, 0, 100, 210000, '葫芦岛市');
INSERT INTO `sys_address_city` VALUES (220100, 0, 100, 220000, '长春市');
INSERT INTO `sys_address_city` VALUES (220200, 0, 100, 220000, '吉林市');
INSERT INTO `sys_address_city` VALUES (220300, 0, 100, 220000, '四平市');
INSERT INTO `sys_address_city` VALUES (220400, 0, 100, 220000, '辽源市');
INSERT INTO `sys_address_city` VALUES (220500, 0, 100, 220000, '通化市');
INSERT INTO `sys_address_city` VALUES (220600, 0, 100, 220000, '白山市');
INSERT INTO `sys_address_city` VALUES (220700, 0, 100, 220000, '松原市');
INSERT INTO `sys_address_city` VALUES (220800, 0, 100, 220000, '白城市');
INSERT INTO `sys_address_city` VALUES (222400, 0, 100, 220000, '延边朝鲜族自治州');
INSERT INTO `sys_address_city` VALUES (230100, 0, 100, 230000, '哈尔滨市');
INSERT INTO `sys_address_city` VALUES (230200, 0, 100, 230000, '齐齐哈尔市');
INSERT INTO `sys_address_city` VALUES (230300, 0, 100, 230000, '鸡西市');
INSERT INTO `sys_address_city` VALUES (230400, 0, 100, 230000, '鹤岗市');
INSERT INTO `sys_address_city` VALUES (230500, 0, 100, 230000, '双鸭山市');
INSERT INTO `sys_address_city` VALUES (230600, 0, 100, 230000, '大庆市');
INSERT INTO `sys_address_city` VALUES (230700, 0, 100, 230000, '伊春市');
INSERT INTO `sys_address_city` VALUES (230800, 0, 100, 230000, '佳木斯市');
INSERT INTO `sys_address_city` VALUES (230900, 0, 100, 230000, '七台河市');
INSERT INTO `sys_address_city` VALUES (231000, 0, 100, 230000, '牡丹江市');
INSERT INTO `sys_address_city` VALUES (231100, 0, 100, 230000, '黑河市');
INSERT INTO `sys_address_city` VALUES (231200, 0, 100, 230000, '绥化市');
INSERT INTO `sys_address_city` VALUES (232700, 0, 100, 230000, '大兴安岭地区');
INSERT INTO `sys_address_city` VALUES (310100, 0, 100, 310000, '市辖区');
INSERT INTO `sys_address_city` VALUES (310200, 0, 100, 310000, '县');
INSERT INTO `sys_address_city` VALUES (320100, 0, 100, 320000, '南京市');
INSERT INTO `sys_address_city` VALUES (320200, 0, 100, 320000, '无锡市');
INSERT INTO `sys_address_city` VALUES (320300, 0, 100, 320000, '徐州市');
INSERT INTO `sys_address_city` VALUES (320400, 0, 100, 320000, '常州市');
INSERT INTO `sys_address_city` VALUES (320500, 0, 100, 320000, '苏州市');
INSERT INTO `sys_address_city` VALUES (320600, 0, 100, 320000, '南通市');
INSERT INTO `sys_address_city` VALUES (320700, 0, 100, 320000, '连云港市');
INSERT INTO `sys_address_city` VALUES (320800, 0, 100, 320000, '淮安市');
INSERT INTO `sys_address_city` VALUES (320900, 0, 100, 320000, '盐城市');
INSERT INTO `sys_address_city` VALUES (321000, 0, 100, 320000, '扬州市');
INSERT INTO `sys_address_city` VALUES (321100, 0, 100, 320000, '镇江市');
INSERT INTO `sys_address_city` VALUES (321200, 0, 100, 320000, '泰州市');
INSERT INTO `sys_address_city` VALUES (321300, 0, 100, 320000, '宿迁市');
INSERT INTO `sys_address_city` VALUES (330100, 0, 100, 330000, '杭州市');
INSERT INTO `sys_address_city` VALUES (330200, 0, 100, 330000, '宁波市');
INSERT INTO `sys_address_city` VALUES (330300, 0, 100, 330000, '温州市');
INSERT INTO `sys_address_city` VALUES (330400, 0, 100, 330000, '嘉兴市');
INSERT INTO `sys_address_city` VALUES (330500, 0, 100, 330000, '湖州市');
INSERT INTO `sys_address_city` VALUES (330600, 0, 100, 330000, '绍兴市');
INSERT INTO `sys_address_city` VALUES (330700, 0, 100, 330000, '金华市');
INSERT INTO `sys_address_city` VALUES (330800, 0, 100, 330000, '衢州市');
INSERT INTO `sys_address_city` VALUES (330900, 0, 100, 330000, '舟山市');
INSERT INTO `sys_address_city` VALUES (331000, 0, 100, 330000, '台州市');
INSERT INTO `sys_address_city` VALUES (331100, 0, 100, 330000, '丽水市');
INSERT INTO `sys_address_city` VALUES (340100, 0, 100, 340000, '合肥市');
INSERT INTO `sys_address_city` VALUES (340200, 0, 100, 340000, '芜湖市');
INSERT INTO `sys_address_city` VALUES (340300, 0, 100, 340000, '蚌埠市');
INSERT INTO `sys_address_city` VALUES (340400, 0, 100, 340000, '淮南市');
INSERT INTO `sys_address_city` VALUES (340500, 0, 100, 340000, '马鞍山市');
INSERT INTO `sys_address_city` VALUES (340600, 0, 100, 340000, '淮北市');
INSERT INTO `sys_address_city` VALUES (340700, 0, 100, 340000, '铜陵市');
INSERT INTO `sys_address_city` VALUES (340800, 0, 100, 340000, '安庆市');
INSERT INTO `sys_address_city` VALUES (341000, 0, 100, 340000, '黄山市');
INSERT INTO `sys_address_city` VALUES (341100, 0, 100, 340000, '滁州市');
INSERT INTO `sys_address_city` VALUES (341200, 0, 100, 340000, '阜阳市');
INSERT INTO `sys_address_city` VALUES (341300, 0, 100, 340000, '宿州市');
INSERT INTO `sys_address_city` VALUES (341400, 0, 100, 340000, '巢湖市');
INSERT INTO `sys_address_city` VALUES (341500, 0, 100, 340000, '六安市');
INSERT INTO `sys_address_city` VALUES (341600, 0, 100, 340000, '亳州市');
INSERT INTO `sys_address_city` VALUES (341700, 0, 100, 340000, '池州市');
INSERT INTO `sys_address_city` VALUES (341800, 0, 100, 340000, '宣城市');
INSERT INTO `sys_address_city` VALUES (350100, 0, 100, 350000, '福州市');
INSERT INTO `sys_address_city` VALUES (350200, 0, 100, 350000, '厦门市');
INSERT INTO `sys_address_city` VALUES (350300, 0, 100, 350000, '莆田市');
INSERT INTO `sys_address_city` VALUES (350400, 0, 100, 350000, '三明市');
INSERT INTO `sys_address_city` VALUES (350500, 0, 100, 350000, '泉州市');
INSERT INTO `sys_address_city` VALUES (350600, 0, 100, 350000, '漳州市');
INSERT INTO `sys_address_city` VALUES (350700, 0, 100, 350000, '南平市');
INSERT INTO `sys_address_city` VALUES (350800, 0, 100, 350000, '龙岩市');
INSERT INTO `sys_address_city` VALUES (350900, 0, 100, 350000, '宁德市');
INSERT INTO `sys_address_city` VALUES (360100, 0, 100, 360000, '南昌市');
INSERT INTO `sys_address_city` VALUES (360200, 0, 100, 360000, '景德镇市');
INSERT INTO `sys_address_city` VALUES (360300, 0, 100, 360000, '萍乡市');
INSERT INTO `sys_address_city` VALUES (360400, 0, 100, 360000, '九江市');
INSERT INTO `sys_address_city` VALUES (360500, 0, 100, 360000, '新余市');
INSERT INTO `sys_address_city` VALUES (360600, 0, 100, 360000, '鹰潭市');
INSERT INTO `sys_address_city` VALUES (360700, 0, 100, 360000, '赣州市');
INSERT INTO `sys_address_city` VALUES (360800, 0, 100, 360000, '吉安市');
INSERT INTO `sys_address_city` VALUES (360900, 0, 100, 360000, '宜春市');
INSERT INTO `sys_address_city` VALUES (361000, 0, 100, 360000, '抚州市');
INSERT INTO `sys_address_city` VALUES (361100, 0, 100, 360000, '上饶市');
INSERT INTO `sys_address_city` VALUES (370100, 0, 100, 370000, '济南市');
INSERT INTO `sys_address_city` VALUES (370200, 0, 100, 370000, '青岛市');
INSERT INTO `sys_address_city` VALUES (370300, 0, 100, 370000, '淄博市');
INSERT INTO `sys_address_city` VALUES (370400, 0, 100, 370000, '枣庄市');
INSERT INTO `sys_address_city` VALUES (370500, 0, 100, 370000, '东营市');
INSERT INTO `sys_address_city` VALUES (370600, 0, 100, 370000, '烟台市');
INSERT INTO `sys_address_city` VALUES (370700, 0, 100, 370000, '潍坊市');
INSERT INTO `sys_address_city` VALUES (370800, 0, 100, 370000, '济宁市');
INSERT INTO `sys_address_city` VALUES (370900, 0, 100, 370000, '泰安市');
INSERT INTO `sys_address_city` VALUES (371000, 0, 100, 370000, '威海市');
INSERT INTO `sys_address_city` VALUES (371100, 0, 100, 370000, '日照市');
INSERT INTO `sys_address_city` VALUES (371200, 0, 100, 370000, '莱芜市');
INSERT INTO `sys_address_city` VALUES (371300, 0, 100, 370000, '临沂市');
INSERT INTO `sys_address_city` VALUES (371400, 0, 100, 370000, '德州市');
INSERT INTO `sys_address_city` VALUES (371500, 0, 100, 370000, '聊城市');
INSERT INTO `sys_address_city` VALUES (371600, 0, 100, 370000, '滨州市');
INSERT INTO `sys_address_city` VALUES (371700, 0, 100, 370000, '荷泽市');
INSERT INTO `sys_address_city` VALUES (410100, 0, 100, 410000, '郑州市');
INSERT INTO `sys_address_city` VALUES (410200, 0, 100, 410000, '开封市');
INSERT INTO `sys_address_city` VALUES (410300, 0, 100, 410000, '洛阳市');
INSERT INTO `sys_address_city` VALUES (410400, 0, 100, 410000, '平顶山市');
INSERT INTO `sys_address_city` VALUES (410500, 0, 100, 410000, '安阳市');
INSERT INTO `sys_address_city` VALUES (410600, 0, 100, 410000, '鹤壁市');
INSERT INTO `sys_address_city` VALUES (410700, 0, 100, 410000, '新乡市');
INSERT INTO `sys_address_city` VALUES (410800, 0, 100, 410000, '焦作市');
INSERT INTO `sys_address_city` VALUES (410900, 0, 100, 410000, '濮阳市');
INSERT INTO `sys_address_city` VALUES (411000, 0, 100, 410000, '许昌市');
INSERT INTO `sys_address_city` VALUES (411100, 0, 100, 410000, '漯河市');
INSERT INTO `sys_address_city` VALUES (411200, 0, 100, 410000, '三门峡市');
INSERT INTO `sys_address_city` VALUES (411300, 0, 100, 410000, '南阳市');
INSERT INTO `sys_address_city` VALUES (411400, 0, 100, 410000, '商丘市');
INSERT INTO `sys_address_city` VALUES (411500, 0, 100, 410000, '信阳市');
INSERT INTO `sys_address_city` VALUES (411600, 0, 100, 410000, '周口市');
INSERT INTO `sys_address_city` VALUES (411700, 0, 100, 410000, '驻马店市');
INSERT INTO `sys_address_city` VALUES (420100, 0, 100, 420000, '武汉市');
INSERT INTO `sys_address_city` VALUES (420200, 0, 100, 420000, '黄石市');
INSERT INTO `sys_address_city` VALUES (420300, 0, 100, 420000, '十堰市');
INSERT INTO `sys_address_city` VALUES (420500, 0, 100, 420000, '宜昌市');
INSERT INTO `sys_address_city` VALUES (420600, 0, 100, 420000, '襄樊市');
INSERT INTO `sys_address_city` VALUES (420700, 0, 100, 420000, '鄂州市');
INSERT INTO `sys_address_city` VALUES (420800, 0, 100, 420000, '荆门市');
INSERT INTO `sys_address_city` VALUES (420900, 0, 100, 420000, '孝感市');
INSERT INTO `sys_address_city` VALUES (421000, 0, 100, 420000, '荆州市');
INSERT INTO `sys_address_city` VALUES (421100, 0, 100, 420000, '黄冈市');
INSERT INTO `sys_address_city` VALUES (421200, 0, 100, 420000, '咸宁市');
INSERT INTO `sys_address_city` VALUES (421300, 0, 100, 420000, '随州市');
INSERT INTO `sys_address_city` VALUES (422800, 0, 100, 420000, '恩施土家族苗族自治州');
INSERT INTO `sys_address_city` VALUES (429000, 0, 100, 420000, '省直辖行政单位');
INSERT INTO `sys_address_city` VALUES (430100, 0, 100, 430000, '长沙市');
INSERT INTO `sys_address_city` VALUES (430200, 0, 100, 430000, '株洲市');
INSERT INTO `sys_address_city` VALUES (430300, 0, 100, 430000, '湘潭市');
INSERT INTO `sys_address_city` VALUES (430400, 0, 100, 430000, '衡阳市');
INSERT INTO `sys_address_city` VALUES (430500, 0, 100, 430000, '邵阳市');
INSERT INTO `sys_address_city` VALUES (430600, 0, 100, 430000, '岳阳市');
INSERT INTO `sys_address_city` VALUES (430700, 0, 100, 430000, '常德市');
INSERT INTO `sys_address_city` VALUES (430800, 0, 100, 430000, '张家界市');
INSERT INTO `sys_address_city` VALUES (430900, 0, 100, 430000, '益阳市');
INSERT INTO `sys_address_city` VALUES (431000, 0, 100, 430000, '郴州市');
INSERT INTO `sys_address_city` VALUES (431100, 0, 100, 430000, '永州市');
INSERT INTO `sys_address_city` VALUES (431200, 0, 100, 430000, '怀化市');
INSERT INTO `sys_address_city` VALUES (431300, 0, 100, 430000, '娄底市');
INSERT INTO `sys_address_city` VALUES (433100, 0, 100, 430000, '湘西土家族苗族自治州');
INSERT INTO `sys_address_city` VALUES (440100, 0, 100, 440000, '广州市');
INSERT INTO `sys_address_city` VALUES (440200, 0, 100, 440000, '韶关市');
INSERT INTO `sys_address_city` VALUES (440300, 0, 100, 440000, '深圳市');
INSERT INTO `sys_address_city` VALUES (440400, 0, 100, 440000, '珠海市');
INSERT INTO `sys_address_city` VALUES (440500, 0, 100, 440000, '汕头市');
INSERT INTO `sys_address_city` VALUES (440600, 0, 100, 440000, '佛山市');
INSERT INTO `sys_address_city` VALUES (440700, 0, 100, 440000, '江门市');
INSERT INTO `sys_address_city` VALUES (440800, 0, 100, 440000, '湛江市');
INSERT INTO `sys_address_city` VALUES (440900, 0, 100, 440000, '茂名市');
INSERT INTO `sys_address_city` VALUES (441200, 0, 100, 440000, '肇庆市');
INSERT INTO `sys_address_city` VALUES (441300, 0, 100, 440000, '惠州市');
INSERT INTO `sys_address_city` VALUES (441400, 0, 100, 440000, '梅州市');
INSERT INTO `sys_address_city` VALUES (441500, 0, 100, 440000, '汕尾市');
INSERT INTO `sys_address_city` VALUES (441600, 0, 100, 440000, '河源市');
INSERT INTO `sys_address_city` VALUES (441700, 0, 100, 440000, '阳江市');
INSERT INTO `sys_address_city` VALUES (441800, 0, 100, 440000, '清远市');
INSERT INTO `sys_address_city` VALUES (441900, 0, 100, 440000, '东莞市');
INSERT INTO `sys_address_city` VALUES (442000, 0, 100, 440000, '中山市');
INSERT INTO `sys_address_city` VALUES (445100, 0, 100, 440000, '潮州市');
INSERT INTO `sys_address_city` VALUES (445200, 0, 100, 440000, '揭阳市');
INSERT INTO `sys_address_city` VALUES (445300, 0, 100, 440000, '云浮市');
INSERT INTO `sys_address_city` VALUES (450100, 0, 100, 450000, '南宁市');
INSERT INTO `sys_address_city` VALUES (450200, 0, 100, 450000, '柳州市');
INSERT INTO `sys_address_city` VALUES (450300, 0, 100, 450000, '桂林市');
INSERT INTO `sys_address_city` VALUES (450400, 0, 100, 450000, '梧州市');
INSERT INTO `sys_address_city` VALUES (450500, 0, 100, 450000, '北海市');
INSERT INTO `sys_address_city` VALUES (450600, 0, 100, 450000, '防城港市');
INSERT INTO `sys_address_city` VALUES (450700, 0, 100, 450000, '钦州市');
INSERT INTO `sys_address_city` VALUES (450800, 0, 100, 450000, '贵港市');
INSERT INTO `sys_address_city` VALUES (450900, 0, 100, 450000, '玉林市');
INSERT INTO `sys_address_city` VALUES (451000, 0, 100, 450000, '百色市');
INSERT INTO `sys_address_city` VALUES (451100, 0, 100, 450000, '贺州市');
INSERT INTO `sys_address_city` VALUES (451200, 0, 100, 450000, '河池市');
INSERT INTO `sys_address_city` VALUES (451300, 0, 100, 450000, '来宾市');
INSERT INTO `sys_address_city` VALUES (451400, 0, 100, 450000, '崇左市');
INSERT INTO `sys_address_city` VALUES (460100, 0, 100, 460000, '海口市');
INSERT INTO `sys_address_city` VALUES (460200, 0, 100, 460000, '三亚市');
INSERT INTO `sys_address_city` VALUES (469000, 0, 100, 460000, '省直辖县级行政单位');
INSERT INTO `sys_address_city` VALUES (500100, 0, 100, 500000, '市辖区');
INSERT INTO `sys_address_city` VALUES (500200, 0, 100, 500000, '县');
INSERT INTO `sys_address_city` VALUES (500300, 0, 100, 500000, '市');
INSERT INTO `sys_address_city` VALUES (510100, 0, 100, 510000, '成都市');
INSERT INTO `sys_address_city` VALUES (510300, 0, 100, 510000, '自贡市');
INSERT INTO `sys_address_city` VALUES (510400, 0, 100, 510000, '攀枝花市');
INSERT INTO `sys_address_city` VALUES (510500, 0, 100, 510000, '泸州市');
INSERT INTO `sys_address_city` VALUES (510600, 0, 100, 510000, '德阳市');
INSERT INTO `sys_address_city` VALUES (510700, 0, 100, 510000, '绵阳市');
INSERT INTO `sys_address_city` VALUES (510800, 0, 100, 510000, '广元市');
INSERT INTO `sys_address_city` VALUES (510900, 0, 100, 510000, '遂宁市');
INSERT INTO `sys_address_city` VALUES (511000, 0, 100, 510000, '内江市');
INSERT INTO `sys_address_city` VALUES (511100, 0, 100, 510000, '乐山市');
INSERT INTO `sys_address_city` VALUES (511300, 0, 100, 510000, '南充市');
INSERT INTO `sys_address_city` VALUES (511400, 0, 100, 510000, '眉山市');
INSERT INTO `sys_address_city` VALUES (511500, 0, 100, 510000, '宜宾市');
INSERT INTO `sys_address_city` VALUES (511600, 0, 100, 510000, '广安市');
INSERT INTO `sys_address_city` VALUES (511700, 0, 100, 510000, '达州市');
INSERT INTO `sys_address_city` VALUES (511800, 0, 100, 510000, '雅安市');
INSERT INTO `sys_address_city` VALUES (511900, 0, 100, 510000, '巴中市');
INSERT INTO `sys_address_city` VALUES (512000, 0, 100, 510000, '资阳市');
INSERT INTO `sys_address_city` VALUES (513200, 0, 100, 510000, '阿坝藏族羌族自治州');
INSERT INTO `sys_address_city` VALUES (513300, 0, 100, 510000, '甘孜藏族自治州');
INSERT INTO `sys_address_city` VALUES (513400, 0, 100, 510000, '凉山彝族自治州');
INSERT INTO `sys_address_city` VALUES (520100, 0, 100, 520000, '贵阳市');
INSERT INTO `sys_address_city` VALUES (520200, 0, 100, 520000, '六盘水市');
INSERT INTO `sys_address_city` VALUES (520300, 0, 100, 520000, '遵义市');
INSERT INTO `sys_address_city` VALUES (520400, 0, 100, 520000, '安顺市');
INSERT INTO `sys_address_city` VALUES (522200, 0, 100, 520000, '铜仁地区');
INSERT INTO `sys_address_city` VALUES (522300, 0, 100, 520000, '黔西南布依族苗族自治州');
INSERT INTO `sys_address_city` VALUES (522400, 0, 100, 520000, '毕节地区');
INSERT INTO `sys_address_city` VALUES (522600, 0, 100, 520000, '黔东南苗族侗族自治州');
INSERT INTO `sys_address_city` VALUES (522700, 0, 100, 520000, '黔南布依族苗族自治州');
INSERT INTO `sys_address_city` VALUES (530100, 0, 100, 530000, '昆明市');
INSERT INTO `sys_address_city` VALUES (530300, 0, 100, 530000, '曲靖市');
INSERT INTO `sys_address_city` VALUES (530400, 0, 100, 530000, '玉溪市');
INSERT INTO `sys_address_city` VALUES (530500, 0, 100, 530000, '保山市');
INSERT INTO `sys_address_city` VALUES (530600, 0, 100, 530000, '昭通市');
INSERT INTO `sys_address_city` VALUES (530700, 0, 100, 530000, '丽江市');
INSERT INTO `sys_address_city` VALUES (530800, 0, 100, 530000, '思茅市');
INSERT INTO `sys_address_city` VALUES (530900, 0, 100, 530000, '临沧市');
INSERT INTO `sys_address_city` VALUES (532300, 0, 100, 530000, '楚雄彝族自治州');
INSERT INTO `sys_address_city` VALUES (532500, 0, 100, 530000, '红河哈尼族彝族自治州');
INSERT INTO `sys_address_city` VALUES (532600, 0, 100, 530000, '文山壮族苗族自治州');
INSERT INTO `sys_address_city` VALUES (532800, 0, 100, 530000, '西双版纳傣族自治州');
INSERT INTO `sys_address_city` VALUES (532900, 0, 100, 530000, '大理白族自治州');
INSERT INTO `sys_address_city` VALUES (533100, 0, 100, 530000, '德宏傣族景颇族自治州');
INSERT INTO `sys_address_city` VALUES (533300, 0, 100, 530000, '怒江傈僳族自治州');
INSERT INTO `sys_address_city` VALUES (533400, 0, 100, 530000, '迪庆藏族自治州');
INSERT INTO `sys_address_city` VALUES (540100, 0, 100, 540000, '拉萨市');
INSERT INTO `sys_address_city` VALUES (542100, 0, 100, 540000, '昌都地区');
INSERT INTO `sys_address_city` VALUES (542200, 0, 100, 540000, '山南地区');
INSERT INTO `sys_address_city` VALUES (542300, 0, 100, 540000, '日喀则地区');
INSERT INTO `sys_address_city` VALUES (542400, 0, 100, 540000, '那曲地区');
INSERT INTO `sys_address_city` VALUES (542500, 0, 100, 540000, '阿里地区');
INSERT INTO `sys_address_city` VALUES (542600, 0, 100, 540000, '林芝地区');
INSERT INTO `sys_address_city` VALUES (610100, 0, 100, 610000, '西安市');
INSERT INTO `sys_address_city` VALUES (610200, 0, 100, 610000, '铜川市');
INSERT INTO `sys_address_city` VALUES (610300, 0, 100, 610000, '宝鸡市');
INSERT INTO `sys_address_city` VALUES (610400, 0, 100, 610000, '咸阳市');
INSERT INTO `sys_address_city` VALUES (610500, 0, 100, 610000, '渭南市');
INSERT INTO `sys_address_city` VALUES (610600, 0, 100, 610000, '延安市');
INSERT INTO `sys_address_city` VALUES (610700, 0, 100, 610000, '汉中市');
INSERT INTO `sys_address_city` VALUES (610800, 0, 100, 610000, '榆林市');
INSERT INTO `sys_address_city` VALUES (610900, 0, 100, 610000, '安康市');
INSERT INTO `sys_address_city` VALUES (611000, 0, 100, 610000, '商洛市');
INSERT INTO `sys_address_city` VALUES (620100, 0, 100, 620000, '兰州市');
INSERT INTO `sys_address_city` VALUES (620200, 0, 100, 620000, '嘉峪关市');
INSERT INTO `sys_address_city` VALUES (620300, 0, 100, 620000, '金昌市');
INSERT INTO `sys_address_city` VALUES (620400, 0, 100, 620000, '白银市');
INSERT INTO `sys_address_city` VALUES (620500, 0, 100, 620000, '天水市');
INSERT INTO `sys_address_city` VALUES (620600, 0, 100, 620000, '武威市');
INSERT INTO `sys_address_city` VALUES (620700, 0, 100, 620000, '张掖市');
INSERT INTO `sys_address_city` VALUES (620800, 0, 100, 620000, '平凉市');
INSERT INTO `sys_address_city` VALUES (620900, 0, 100, 620000, '酒泉市');
INSERT INTO `sys_address_city` VALUES (621000, 0, 100, 620000, '庆阳市');
INSERT INTO `sys_address_city` VALUES (621100, 0, 100, 620000, '定西市');
INSERT INTO `sys_address_city` VALUES (621200, 0, 100, 620000, '陇南市');
INSERT INTO `sys_address_city` VALUES (622900, 0, 100, 620000, '临夏回族自治州');
INSERT INTO `sys_address_city` VALUES (623000, 0, 100, 620000, '甘南藏族自治州');
INSERT INTO `sys_address_city` VALUES (630100, 0, 100, 630000, '西宁市');
INSERT INTO `sys_address_city` VALUES (632100, 0, 100, 630000, '海东地区');
INSERT INTO `sys_address_city` VALUES (632200, 0, 100, 630000, '海北藏族自治州');
INSERT INTO `sys_address_city` VALUES (632300, 0, 100, 630000, '黄南藏族自治州');
INSERT INTO `sys_address_city` VALUES (632500, 0, 100, 630000, '海南藏族自治州');
INSERT INTO `sys_address_city` VALUES (632600, 0, 100, 630000, '果洛藏族自治州');
INSERT INTO `sys_address_city` VALUES (632700, 0, 100, 630000, '玉树藏族自治州');
INSERT INTO `sys_address_city` VALUES (632800, 0, 100, 630000, '海西蒙古族藏族自治州');
INSERT INTO `sys_address_city` VALUES (640100, 0, 100, 640000, '银川市');
INSERT INTO `sys_address_city` VALUES (640200, 0, 100, 640000, '石嘴山市');
INSERT INTO `sys_address_city` VALUES (640300, 0, 100, 640000, '吴忠市');
INSERT INTO `sys_address_city` VALUES (640400, 0, 100, 640000, '固原市');
INSERT INTO `sys_address_city` VALUES (640500, 0, 100, 640000, '中卫市');
INSERT INTO `sys_address_city` VALUES (650100, 0, 100, 650000, '乌鲁木齐市');
INSERT INTO `sys_address_city` VALUES (650200, 0, 100, 650000, '克拉玛依市');
INSERT INTO `sys_address_city` VALUES (652100, 0, 100, 650000, '吐鲁番地区');
INSERT INTO `sys_address_city` VALUES (652200, 0, 100, 650000, '哈密地区');
INSERT INTO `sys_address_city` VALUES (652300, 0, 100, 650000, '昌吉回族自治州');
INSERT INTO `sys_address_city` VALUES (652700, 0, 100, 650000, '博尔塔拉蒙古自治州');
INSERT INTO `sys_address_city` VALUES (652800, 0, 100, 650000, '巴音郭楞蒙古自治州');
INSERT INTO `sys_address_city` VALUES (652900, 0, 100, 650000, '阿克苏地区');
INSERT INTO `sys_address_city` VALUES (653000, 0, 100, 650000, '克孜勒苏柯尔克孜自治州');
INSERT INTO `sys_address_city` VALUES (653100, 0, 100, 650000, '喀什地区');
INSERT INTO `sys_address_city` VALUES (653200, 0, 100, 650000, '和田地区');
INSERT INTO `sys_address_city` VALUES (654000, 0, 100, 650000, '伊犁哈萨克自治州');
INSERT INTO `sys_address_city` VALUES (654200, 0, 100, 650000, '塔城地区');
INSERT INTO `sys_address_city` VALUES (654300, 0, 100, 650000, '阿勒泰地区');
INSERT INTO `sys_address_city` VALUES (659000, 0, 100, 650000, '省直辖行政单位');

-- ----------------------------
-- Table structure for sys_address_province
-- ----------------------------
DROP TABLE IF EXISTS `sys_address_province`;
CREATE TABLE `sys_address_province`  (
  `province_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '省份ID：[1,8388607]',
  `show` smallint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否可见：[0,2]0为仅表单可见，1为仅表单和搜索时可见 ，2为均可见',
  `display` smallint(4) UNSIGNED NOT NULL DEFAULT 100 COMMENT '显示顺序：[0,1000]',
  `name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '省份名称：[0,16]',
  PRIMARY KEY (`province_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '省份：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_address_province
-- ----------------------------
INSERT INTO `sys_address_province` VALUES (110000, 0, 100, '北京市');
INSERT INTO `sys_address_province` VALUES (120000, 0, 100, '天津市');
INSERT INTO `sys_address_province` VALUES (130000, 0, 100, '河北省');
INSERT INTO `sys_address_province` VALUES (140000, 0, 100, '山西省');
INSERT INTO `sys_address_province` VALUES (150000, 0, 100, '内蒙古自治区');
INSERT INTO `sys_address_province` VALUES (210000, 0, 100, '辽宁省');
INSERT INTO `sys_address_province` VALUES (220000, 0, 100, '吉林省');
INSERT INTO `sys_address_province` VALUES (230000, 0, 100, '黑龙江省');
INSERT INTO `sys_address_province` VALUES (310000, 0, 100, '上海市');
INSERT INTO `sys_address_province` VALUES (320000, 0, 100, '江苏省');
INSERT INTO `sys_address_province` VALUES (330000, 0, 100, '浙江省');
INSERT INTO `sys_address_province` VALUES (340000, 0, 100, '安徽省');
INSERT INTO `sys_address_province` VALUES (350000, 0, 100, '福建省');
INSERT INTO `sys_address_province` VALUES (360000, 0, 100, '江西省');
INSERT INTO `sys_address_province` VALUES (370000, 0, 100, '山东省');
INSERT INTO `sys_address_province` VALUES (410000, 0, 100, '河南省');
INSERT INTO `sys_address_province` VALUES (420000, 0, 100, '湖北省');
INSERT INTO `sys_address_province` VALUES (430000, 0, 100, '湖南省');
INSERT INTO `sys_address_province` VALUES (440000, 0, 100, '广东省');
INSERT INTO `sys_address_province` VALUES (450000, 0, 100, '广西壮族自治区');
INSERT INTO `sys_address_province` VALUES (460000, 0, 100, '海南省');
INSERT INTO `sys_address_province` VALUES (500000, 0, 100, '重庆市');
INSERT INTO `sys_address_province` VALUES (510000, 0, 100, '四川省');
INSERT INTO `sys_address_province` VALUES (520000, 0, 100, '贵州省');
INSERT INTO `sys_address_province` VALUES (530000, 0, 100, '云南省');
INSERT INTO `sys_address_province` VALUES (540000, 0, 100, '西藏自治区');
INSERT INTO `sys_address_province` VALUES (610000, 0, 100, '陕西省');
INSERT INTO `sys_address_province` VALUES (620000, 0, 100, '甘肃省');
INSERT INTO `sys_address_province` VALUES (630000, 0, 100, '青海省');
INSERT INTO `sys_address_province` VALUES (640000, 0, 100, '宁夏回族自治区');
INSERT INTO `sys_address_province` VALUES (650000, 0, 100, '新疆维吾尔自治区');
INSERT INTO `sys_address_province` VALUES (710000, 0, 100, '台湾省');
INSERT INTO `sys_address_province` VALUES (810000, 0, 100, '香港特别行政区');
INSERT INTO `sys_address_province` VALUES (820000, 0, 100, '澳门特别行政区');

-- ----------------------------
-- Table structure for sys_app
-- ----------------------------
DROP TABLE IF EXISTS `sys_app`;
CREATE TABLE `sys_app`  (
  `app_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '应用序号：[1,8388607]',
  `available` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否可用：[0,1]在未审核状态下， 该应用授权为不可用',
  `encrypt` smallint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '加解密方式：[0,10]0明文模式，1兼容模式，2安全模式',
  `times_allow` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '每日允许请求次数：[0,32767]用于限制应用每日可授权次数',
  `times_today` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '今日请求次数：[0,32767]用于记录今日请求授权次数，判断授权次数是否超限',
  `max_age` smallint(5) UNSIGNED NOT NULL DEFAULT 1825 COMMENT '有效期时长：[0,32767]授权应用可以使用的时长，超时需重新申请（单位：天）',
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '持有者ID：[1,8388607]该客户端所有人的ID',
  `times_count` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '请求总次数：[0,2147483647]用于记录授权总次数',
  `time_update` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '上次使用时间：用于记录上次授权时间，防止频繁操作',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '应用名称：[0,16]用于用户登陆时显示授权应用',
  `appid` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '应用ID：[0,16]用于应用授权访问时的账号',
  `token` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息访问令牌：[0,32]用于访问应用时验证身份',
  `encoding_aes_key` varchar(43) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息加密钥匙：[16,43]用于给应用发送消息时的加密钥匙',
  `appsecret` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '应用密钥：[0,64]用于应用授权访问时的密码',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '应用图标：[0,255]用于用户登录时显示',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息访问地址：[0,255]当接收到用户所发消息后回访该地址',
  `bind_ip` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '访问绑定IP：网站授权时确认重定向网址为已授权IP',
  `scope` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '允许使用的接口：多个接口用”，“分隔',
  `scope_not` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '不允许使用的接口：“多个接口用”，“分隔',
  `users` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '授权的用户：',
  PRIMARY KEY (`app_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '应用信息：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_app
-- ----------------------------

-- ----------------------------
-- Table structure for sys_app_refresh
-- ----------------------------
DROP TABLE IF EXISTS `sys_app_refresh`;
CREATE TABLE `sys_app_refresh`  (
  `refresh_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '刷新Token的ID：[1,2147483647]',
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID：[1,8388607]表示当前Token绑定的用户uid',
  `time_create` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '创建时间：用来判断刷新令牌有效期',
  `time_update` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间：用来判断是否频繁刷新访问牌',
  `appid` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '应用ID：[0,16]',
  `refresh_token` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '刷新令牌：[0,32]用来刷新访问牌，保留30天',
  PRIMARY KEY (`refresh_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '应用刷新：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_app_refresh
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '配置ID：[1,2147483647]',
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'string' COMMENT '数据类型：[0,16]string文本型、number数字型、boolean布尔型',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '变量名：[0,16]',
  `title` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '变量标题：[0,16]可以用中文名',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '变量值：[0,255]',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '变量描述：[0,255]描述该变量的作用',
  `model` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '数据模型：json格式，用于单选、多选模式',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统配置：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, 'string', 'name', '标题', '1', '描述', '{}');

-- ----------------------------
-- Table structure for user_account
-- ----------------------------
DROP TABLE IF EXISTS `user_account`;
CREATE TABLE `user_account`  (
  `user_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户ID：[1,8388607]用户获取其他与用户相关的数据',
  `state` smallint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '账户状态：[0,10]1为可用，2为异常，3为已冻结，4为已注销',
  `vip` smallint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员级别：[0,10]用于确定用户访问权限',
  `gm` smallint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '管理员级别：[0,10]用于确定用户管理权限',
  `mc` smallint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商家级别：[0,10]用于确定商家用户的管理权限',
  `referee_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '推荐人ID：[1,8388607]用于推荐注册时积分奖级',
  `login_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '上次登录时间：',
  `salt` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '短验证：[0,6]',
  `invite_code` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '邀请注册码：[0,8]随着用户注册而生成',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号码：[0,11]用户的手机号码，用于找回密码时或登录时',
  `phone_state` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '手机号码认证：[0,1]0为未认证，1为认证通过',
  `username` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户名：[0,16]用户登录时所用的账户名称',
  `nickname` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '昵称：[0,16]',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '密码：[0,32]用户登录所需的密码，由6-16位数字或英文组成',
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '邮箱：[0,64]用户的邮箱，用于找回密码时或登录时',
  `email_state` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '邮箱认证：[0,1]0为未认证，1为认证通过',
  `user_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在用户组：[0,64]多个用户组用“,“分隔',
  `user_admin` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在管理组：[0,64]多个管理组用“,“分隔',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上次登录时的IP地址：[0,128]',
  `signature` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个性签名：[0,255]',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像地址：[0,255]',
  `friends` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '好友：多个好友ID用“,”分隔',
  `admin_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在管理组：[0,64]多个管理组用“,“分隔',
  `create_time` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '创建时间：',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户账户：用于保存用户登录信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_account
-- ----------------------------
INSERT INTO `user_account` VALUES (1, 1, 5, 5, 5, 0, '2020-03-22 23:10:27', 'mm2019', 'df91d1', '15817188815', 0, 'admin', '管理员', 'd1d3ca239d5fb1703e8cdb39b4df91d1', '573242395@qq.com', 0, '5', '1', '::1', NULL, ' ', NULL, NULL, '1970-01-01 00:00:00');
INSERT INTO `user_account` VALUES (2, 1, 0, 0, 0, 0, '2020-03-23 00:10:56', '', '', '13728891819', 0, 'test', '测试', '', '', 0, '3', '2', NULL, NULL, NULL, NULL, NULL, '1970-01-01 00:00:00');
INSERT INTO `user_account` VALUES (3, 3, 0, 0, 0, 0, '2020-03-09 00:13:40', '', '', '15817188816', 0, 'tencs', '请问阿斯顿', '', '', 0, '1', '3', NULL, NULL, NULL, NULL, NULL, '1970-01-01 00:00:00');
INSERT INTO `user_account` VALUES (4, 4, 0, 0, 0, 0, '2020-03-09 00:13:48', '', '', '13223112388', 0, 'taable', '特色让他', '', '', 0, '1', '4', NULL, NULL, NULL, NULL, NULL, '1970-01-01 00:00:00');
INSERT INTO `user_account` VALUES (5, 2, 0, 0, 0, 0, '2020-03-09 00:13:54', '', '', '15819712331', 0, 'lande', '阿尔发', '', '', 0, '2', '5', NULL, NULL, NULL, NULL, NULL, '1970-01-01 00:00:00');
INSERT INTO `user_account` VALUES (8, 1, 2, 3, 3, 0, '2020-03-22 08:14:57', '', '', NULL, 0, 'asd123', '侧耳e', 'asd123', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1969-12-31 08:00:00');
INSERT INTO `user_account` VALUES (9, 1, 3, 3, 3, 0, '2020-03-22 08:14:57', '', '', NULL, 0, 'asd123', 'zxc', 'asd123', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1969-12-31 08:00:00');

-- ----------------------------
-- Table structure for user_admin
-- ----------------------------
DROP TABLE IF EXISTS `user_admin`;
CREATE TABLE `user_admin`  (
  `admin_id` smallint(3) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '管理组ID：[1,1000]',
  `display` smallint(4) UNSIGNED NOT NULL DEFAULT 100 COMMENT '显示顺序：[0,1000]',
  `type` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类：[0,12]用于区分用户组使用范围',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '管理组名称：[0,16]',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述：[0,255]描述该用户组的特点或权限范围',
  `icon` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '图标：[0,255]用于标识用户组',
  PRIMARY KEY (`admin_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '管理组：用于判断用户后台管理鉴权' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_admin
-- ----------------------------
INSERT INTO `user_admin` VALUES (1, 100, 'asf', '站长', 'asd', NULL);
INSERT INTO `user_admin` VALUES (2, 100, '123', '管理员', 'asd', NULL);
INSERT INTO `user_admin` VALUES (3, 100, '123', '财务', 'asd', NULL);
INSERT INTO `user_admin` VALUES (4, 100, '123', '客服', 'asd', NULL);
INSERT INTO `user_admin` VALUES (5, 100, '123', '文案', 'asd', NULL);
INSERT INTO `user_admin` VALUES (6, 3, '123', '推广员', 'asd', NULL);
INSERT INTO `user_admin` VALUES (9, 2, '123', 'dasd', 'saf', 'data:image/png;base64,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');
INSERT INTO `user_admin` VALUES (10, 100, '123', 'wewdasc', 'zxczsc', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMgAAADICAYAAACtWK6eAAAgAElEQVR4Xu2dCZgU1dnv/1XdPfvGMKwKAgqyuIC4izoYERPjJzhqEoyI92pyTfLFLdH4PfET470SY4zgzY0ak0/AJVFAwN2oMET8XBADcSMuiKOyyAwMs/RMT3d13eetnmKqq05Vnaqu7p7lnOfhQamz1XvOr9/znvc9pySIJCQgJGArAUnIRkhASMBeAgIQMTuEBBwkIAAR00NIQAAi5oCQgD8JCA3iT26i1ACRgABkgAy0eE1/EhCA+JObKDVAJCAAGSADLV7TnwQEIP7kJkoNEAkIQAbIQIvX9CcBAYg/uYlSA0QCApABMtDiNf1JQADiT26i1ACRgABkgAx0X37Ny2ZefCb1P6TiwNL6FVty+S4CkFxKW7TFJYEFtXPGJCFfrkpSrQTUMgo1SxLWqEnUy1DWLq1f08xVsY9MAhAfQhNFsiMBAkOVQ7eqKhZ4aKEZqrp4ef2Tt3kow51VAMItKpExmxK4rPbCBZIkPZRBGztkVZ4b9BJMAJLBiIiiwUjg8rPqHvKoNewablZV9bqH659cGkzPAAFIUJIU9fiSwPyzLloIVb3VV2GbQqqqXhEUJAKQIEdG1OVJAt+vrZsjS1jNKlRcrGL22QlMOlLBxCOVg1miUQmbt4Sw8bUwtn0Usm1PVuVpQSy3BCCehlRkDkoCC2rnVCWl0GcAqsx1HjdVwVVXxFBSojo2t+1fITz4UCEam5jTuFlWlbGZ7nAJQIIacVGPJwnMn1lHdsLl5kIzTk1ocPAm0iiLflOAhq/CrCLLlq9f5WVHzFKHAIR3JES+wCSwoPai2qSkrjdXOHpUErf/Z4fndqJft2PRknI0fF1sKdutRXZ4rrS7gADEr+REOd8SmD+zjpZWY8wV3P3rKGoGOy+rmI3u2o2GTxXcsmxC4FpEAOJ7mEVBPxKw27Wac34cc/+ty3uVCQXYTrwBDz4/ChvfqzbXsWP5+lVjvVecKiEA8Ss5Uc6zBLQQkpRhnpZIa9DSys0oZzbYfAD4eq/2qPFAAW7446RAl1kCEM/D3D8LUECgpCanAmr3rpK0Q5XkHSE1/vnS+jW+1/BGac2fWfcPAFPNErz5Z51pW7ncEk4kgM+/AJSebeAbHpiExpaCtCqSKuY+Ur9qDXe9howCED9S6ydlDLFPc1jbrYbX3CGp0hpVQv3y9SvX+nl9O285bele8+NOP1UCX+4EotG0sov+eji2fVGWXp8k3bZ83cqFfhoRgPiRWj8o0+2ko9gnix/C5fW04EAZyWW8msUODnIG/u9bO/wZ5m3twM5dlq4KQPrB5Mz3KwQQGKi9giRhqZRUbnMCxSnO6sorYjj91IR3cbS2Abt2M8sJQLyLs1+VSJ2VCJ0pyZiTVFElpTQAreubVUA7TCSpaj0g7ZChbDBP3qDgMApVUqXFEhIEStq5DCc4zvlGHJd+18euVWMTsG+/7ZjSVq/ZH5JJbJZYYvURfMi5pkjqrTYHiJzeQrMfJEjLFChTnULKJ4ZDKJEklEhAY1JFYzKp/c2ZmqFi4fL6VUu6HYH3sAxyqsurt1xrvz2aAqPD3pEYjYVw9b1HWbqbibNQAMI5+vnMNr/2wlshSb6MTJ5+jw7JuKq0CPS3OREkHyYUbIwlsI18Du6JtIitXeMZDmpz3z6AtnNd0urXhmPNfw9Ly6UCBx5ev8qrnXWwDgGIm9Tz+JwC+lQ5RGclaJcpa+n2ihImHMYGCY7VHV28kDD76hmOlhagaT8Qj7u+Oy2ryP4gLWJKGcVjCUBcRZ+fDN3RrhSvZPEbBNkj0hoEiFP6U3sMr3a5T1KnOuZ9pwuzz+asIxZLLafIGOdIBAXBIWKxOITVH7K4wVEsSTi9IIyJkRBKpfTfuM+VJLbFFTQoCpf9QHbHzeXWID9dji/G4ngsyh9da5Y/ecnnfSeG6dO4lmcpMOhPMsk1lOTzWLJ6DEtzUPmMtAdVIDQI1zDkLpMbHOcURnBpSaFrh+gXn3753ZITIFFVxQ0HoqC/vSb9wBN3fBUBsWsP0N7O1RRpjcfWjcSr1tgrrTzZHiFVGSPOg3CJs3dmoi1bRYocZuydhORiu2VV0HBQu06AbI4ncG8bv5eboCBNcdzUBL/GoE5QyMhXO4EY37YvBSQ+um6kndbohkOuFScKe+e8t+3VgtqLpyahXOBw35Nt2RpZwt2Vpa5v3KAkcUtLeviFXqi4sBAdtL43JNrWva+KXS8Z5Ws60ycthYawbAnjsVjXThozEBRffMm1pKJgRIrYtYSSGOojzUEXQPiNvTL3XSyxPI2mv8wZ+DAONsirPWhJRFuz5jR62FBc89063LDkPsszu10sFiC+w9JZouvoTMHhkmg59bfNNaBtXJe0VVblBUFoDr0dAYibyDN4TvaEIoVW+3DuWVolQ5qWQ07JbklEcNy8YB5Kiopwy/3/hYY9X6dVM6+kELMLI5aqWYBMnKDg5p/zL7ts+2s4x+H0Tk47VGnlJCyRk8rCTG0OoUEymPBeimrLKSlJN3ZYTs55qUfPywPIg+2d2NiVHttEy6rfXXu1BgelB9c8i41b303rQo0s4+5K61YvCzg6s3H3Ip9nN4yt7mgAupxtDj441A2yGro2SK1h7KbQIH5mq0uZbjjIh+Hbg2tugiYwTWSnRLYH2SDGNOfMGZhbO+PgPzXs3oNbHrBeYGi3zLp8v9UX4TvIUO8FHXBy8YyTvbFkzRimb4OqIVsDkrrw4XVP0qZG1pIAJGDRusFRXj0Ik085AVvWvYqYQ1yRuVs8GoQ1mW++fB4mjhmdVt0Ni+9D44H00I0ZBWEt3MSclrR14p14ulYi3wadH/eVDrQApiWeuR4Hr7ieda2sKguCXk6x3kcA4muU2YWc4CgsLsIZF1+AcccehSfvuQ976bAPI115wXl49IWXLbtNfgG5+5qrUVNVmdbS6vqNWLNho6V1lpaiEJNFrdYAQd9apOELoNPeP+O2rMokMtfPUAtA/EiNUcYJjoLiItRd9yMMOXQknn1gKT7d+p4tHKdPPRqLlj6GbZ83pOW5srQQpxdYDWljJpYGYQES7ezE1XdaVyZ2WuSGA+0Wr7wvW4RDezDPc3S/ZK7hoGYFIAEAwgvH31esxZb1rzrCQQ9ZhjTPNi9rIv/0Oxdi+kTrdTisNqhtlqay88qTU/CnP/Kwo+WiPVjRuNSnlFdcmrO0fmV9AMPlqQoBiCdxWTPzwkFLqr/c8TtXOCjDi29swmMvvpKWlyeokJZC5pB0s5GuV9rYfIDpE7Frh1U31cW91HLxedDSii5cYETjQlalmfmAQ2iQHMFBzTy5+D58+dGnlhbJ5qBllTFt29GARcse47IRjJlYfovRw4fh9h9ewXzT1c+8gDWbrV80Y/lF7Dz0tNSiW0noVkTHRAGIdBrQJtlqjwBvavcz3EKD+JEaAF7NQdW3NO3D0lvusLQ049ijcdWc85g9+F+/vsdiqLvZIXaOQpYdQoGB0WUrcH2sDWYTnMJPbq8otmwrswCkznPda/XVLsdARDoJaNUe6obl659kfYLN56h5LyYA8S4zT3BQ9R++sQkvLX88rSWzA8/cjSV/XYV3/vVx2j+7haZTZpahPm/2NzD75BN66qKo2eUrgZZWvBgCHmM46O3asltqkQYhTWJ7+dsn223jrSi2ioxzc8rn0krviwDEIyBeNIde9fpHn8C7r72V1pKT9qCMr255F39a+6znZRbTb1FVCdIiWjLAoVe+KAJsY8yEOUUFmFucfgkbhb5ffyCKDkYIvCMkH33ieXmFDO6z8jisttkFIB4k6QeOkqICrPzdH/DJe9vSWmLZHsYMtBV7/eL7LMss1qQ1lrNbZmntDRt6UHMYyzRKwC8jsCy1KA9rV8spYtgWEgdAnLZ2M7lwwcPQCkAyFZYfOIoLCzBicCV+/8tFFkBYHm5zH1lbsU7h6Xp51nZvTXkZ7o5L2rKKlV6VgT8xPrFB7REk5gsdnA5kEST0jY80w90BELb9keqlCtQ/vH7VzEzHz295oUE4JOcXjuGDKxGSJdz7H3f4AsQubsrNWLc7JntlAjjdYbPpwTCwkRHuRXAQJASLMTlBQrbIlQsMR20dALn8rmMdRyGftogAxAUQf3BEMHxwlQYHJb+AUFmWV90u+lZ/FTs7oUYFbo8Ddlc0UHQV2SMNjFnhBxLqDx2uogsbkAEg+dQiAhAHQPzAUVRAcFQibLhjigWImw2id8vOWPerReYowFyH+xMIjjts7BEKdaF2zcnt/DttA181azsmjmLfUuKmQai9fGkRAYgNIEHBQdU/sviPeGtdenCgnYeb1R1W9C0tdyi40LzsMZZn2SL0nLTIaId7GGhHizQJK9lBQh78xW2dzN0tvR4CZO5peyyg8ACSLy0iAGHMgiDhoOqf/8tq7Y8xTTxstHbKjydt3vYR7n38SUtWvztaBAdB4pTsjHYqYwcJ7W7RoS3zmRRzO6OHdmD6+AOYOCp1gwnLB8LqWz52tAQgppHwA0dhQRjDq6sQCbMPNL375jt48P+kR8/SCb/7brqWhw9g6wdYtPoppq/C7SAVyy9CjZ6jAJe6XFX1aAj4m80pXztIyP55NBqznGzke9GeXEVJFZ3dNpz+r6qkXpftA1LmfgpADBLxBUckrNkcEdvz4hISXTFcf9GVljnCs9VLcOCJFBysZY+bd50ucPhlSwdz6fPTBDDdJYTKbmeLXobavqasiLnM27KvHQ8pCpptfjScgJncEcegRBKvlVvsnYy+N+gVUsovAOmWmh84CrrhKHC4TCESDiMUkvGrq2/Cl9s/Txujc046Hpeee7b9uHXDoWewm6x2ly7o5eych7SbRUst2t1ySk6Q2O1uUX07G5rwclLVJrpZGzi199PdKV/NvcPLLdlyvcwSgHgMPNRHzAscVObx+5fhldXPpw04nfQ7GAJingomOOixncebx2BnXehAdZI9crPD1q8bnPTczplIz3a9t1PTXhvLC7G5tMBRo9Cy6uKmKEiDULpzZIUlfybfGxQaxIcEfGmOcGpZVRCxv4YnHA4hHOp53rRnL26e/++WHjIPNDHg0At6DS7Uy5FtQIGGLAOallm03HJLTpqEyrK2nrvau9D4Sc81Q9uLwvigOIKdBSF0ShL2h2WMiCuYEo1jensXCBI9rRhcgndK02PBIGHJ8nWrOI03tzdyfz6gNYgfOMjWIDgKI4y4jG55ExgEiDmxllnHHTleu9DtYHKAQ89jF1zottQiOO5oZdsj5GEnT7tbctrdorLTI2ENFOP2c+vuFrTuaXGr2vL85coivFJpvkgityHwAxaQbMERCoVsDfaXVz+HJ+5fbpkIB89rcMBBhZ2CC92+9eF0364XSB4Ns4Mb9SUXGe/Gi+4aP/4aXVG+u3d1AZG2eXCo6Yu1EIB4/qXxWsA3HNWVoC1du0TGOBnldina1q4tszroc2KGpIW+jx2r7VbxJrulFoWh0GEnJweik+fbzdOu98/J467noa3gOcUR7eCV0pXAng/ZH960e2cBCO9sCDCfHzhoyUTLqiIHOGRZBhnubumh396H11/aYNUiHLtJ5kJLwsA7DNeL29Yv1WNntNMzXk1CmC+xOUui95VAnV0UAV06geYONDfscxPRwee0+/XMIPO3S4QG4Rag14z+4JC74bC/cofgINtEMkW7svpnZ6zPSAJXcdgAxjppgl5fwF7q8NyCEgQk1J/VIWCN87XBmkYjUE5qbIfaxPcNEGGke53hGeT3AwctmUhzFDvcRyVJpDn44NC7H6QWoaXOLTbsugU0BqVJqB5yZJJdwooENg4bgTI52oVprTGM67T/RaCdroeHWD/LkOu7sQaEke4LDrkbDsat5/qAk8Ygm0M2hUS4cWynRSYmgZs9ahFqy2lniedGRidNQn26JmEfIm9+Vx5topehLd1xsQRGdima55z+0LYv2R7kMzGnoL4a5TY+xuf9HpDeBgcJv72zC4/c8wA2179mGSty2k30/sUz2PkonJx4xsadICFnIi3/nCKAjXXtaO/E0pIwPit0t8m8TNZc+0Cob/0aED9wkDagZVVJofUXrGcwJUQiIYRcbltnDT7B0RVPaDtZv7765+iMpl+643aoyWlC0VKLtcQJAhIKSyE/iVvsVktrB9q6v41ImoB8GQGBsnX5+lVZ/eIvS7b9FhDfcFRXgi5acEp6fJWnX79uzUFw6OmlJ9bi5SfWWqrhibRlte10ItDuritzPW5ftZ2tAPNsooCNcBjrJVBoR4rsCj+pe2k1dWn9mh1+ymdSpl8C4gsOqVtzuMARDofTTgvyCl/XHOb8pEX277XeOOh3qeXkn3AKLDT2y+2EIC21yC4xBjnawWGsl+wLgoTsi10FLtte3QVTcATzQU7eserXNogfOMjYpmVVqSsc6fFVvAK3g4PKb39/Gx649TeWqjJZarlBQt8BMd9SYu6AU1iKnpeO7pJjkQcOc/0U3bu9MIzNZQW2miXfcPQ7G8Q3HNWVKDVdkGYeULv4KjdInODQyz790F+w8dmXLFXxOuxYfXCChNcmoQDH25vasDNkv9A4NJHEN/dFHbds7WREWuSPQ8vsQ+HFxXFu04v/uR84qHbSHGXF1osIjC07xVc59ZAHDipPBvuSn93KXGq5XdXj1P5mGbjXZiOJF5KWnQfwUFKxRtWaGiafxjdaOrlBcYUjVf+W5etXTeOfBcHn7Bc2SFbhIC85RwiJeWh44dDL7dzRgCU/W2gZYdo9InuEd4vVXIGTj4QHkuj+qBYeQrYDebbdDj4RKBS2fly7fWAiJxzaq8iqMigXn1qzQ6vPA5JNOHjjqzKFQy9vt6uViT1CdZMmIT+J9UNqqZadPO7xjjgoEldVU2fECRKe3SjdCUjnPMgBqCeyOVhOQLsJmmvPubkffRoQv3AMq65EeYnzsspLfJVRqF41h3lAHrj1Tmx//1+W+eLXy65X5BZ9S99Jp/MkrLT3oz0gUPREgDw9qNjXeXM7EEZ0KShSVavPJMcHpPoNIP7hqEB5SfohHILBGC1Cu1pklFPsIV1izuvYzhQOGhw7ByI9y8Rop/JukLAOO1E5WmLRUsucyLdBjkC3ZZcdFPq/Exw/+LpNO5ZrPSCVXzukT2qQTOCoKC3W/BjkBaerQelvjiDcblDU1N8aNCoMp0O18BGjE9BtUjg9t7NHqAw56chZ5ze5QULbv+Zt4La9rSBjnZUIDprYXi9mMMNBSzL2+Q9g+fpVeZuneWvY7wD7hWNETSWqy0u1yFuZhwjODiZVFR2xOKKxOBQjMZzl7bK9vf41rPh/f2Y+zmRniyp08rjTczLe6bsg2hkOALHWGJq273V8IwLlfXIClhVwh5aQIX/+/o60c+g3j66ytJNPQ71PAeIXjvGHDEFZaVGgYBwcxaQCqCkjNJZIoov+KEnEFd6Fmf28e+L3f2YGNFKJICCh8HTWbe56j/QlV5GiguwQJc6nurSI3MKwphHov3dFQtoyrIoidpWkthVMO11G411vkw2I+Iin6++tXzgmjh6GUhc/h2vjdhkMcJizECidiSQ64oq2JPOb7CDJdPtX74/d0V39OWkTOl8+pGE/Yq0ePvns84UFID4E5xeOYw6rQaTI7rJ/Hx0xFnGAw5iNll0ESmdc8aVVyGinna1dO76wdDgoSNy2ganhYxQVc3e1pC2HMpQgs7gAxKNU/cJx1KhqFJaYb8Tw2LgPzeHUgg5KZ9zlvk9TJbmAhG5KIV8J61uFenfIkD77QCdOa40FJEhrNWxA5GlL61dYv1edtV70VNyrbRC/cIwfUoTyqsGQZL6IUU9y5tQcTnWSfRLtUrTlF29ygoTqyNQm0fvBcyKQtmW/3dzBHVbC+45iF4tXUj6vA6Xqx9cUo6y8DHKB+TYMD40HrDnsqiNjvkMDhU+j0PbvA/95p+WQlV5/UJDQVjDdmEJaxSl5jb9yGwG6wYRxYfXny9evGuNWNlvPe6UG8as5jqgpRnlZCaRQBFLY+dCTZ4EGoDlsQUkkEY0r4Fl65QoS2gomA97tthJ6J574Kzd5U3wW67LqfByzNfa11wHiH44ilJelbsGQIkXBLq+yCIdxMGibmHwqnS4rL4Jk+Z3/lxn9S/U5nfpzm6jm5zy2iV6GbBTaviUbhbWFa9c2bQFT2DvrEJWs5s/+0OaSV4FlM79vOAYXoby854qYQAHJERxGubZHo2hXQmmeerPc3WwSOjtOS66g9vAoKpi0iduyS+/nIEXFuM64pl3otnbjpdR6HvKR0OXU5Ilnh6vk9pI41tzuNYD4hePwwUWoMMARqAbJAxzUfy1yNtqOLkTQ4aBNYh0dmk3y1WcNzN8tr7eRuP34dcbieDqR8B1/VayqGJlIan7V7YXOGyj5PIfe65ZY/uEoREW5dSs3EA2SJzj0wVEScc0Yl8IRtCmyRZvQ7St08wpBct9td+Pjdz9kzm/e20h44Ni3P3UjYqbxV25tdf9IXPFw/ZNLefJmM0/eNYhvOKoLUVHB9nNkDEie4dAHvCvWiXgsptlTcSmMDiU1XDocxgvrlt19P954+e+2c4XsEjo/7mfJRZpDh8PcAJ3t8BJ/xTOZ830GpNdoEL9wjKsuRKUNHNoSK1Sg/fL6Sr0EDr3vHe1tSCrd66xwBO3JsKY5WLc5rlvzPFY88LDta/tZcjnBYWyI7AnaoqWART/fJdTr6k1waHPJ1yQKoJBfOA4fzF5WpXVJCkEuMH94haPTvQwO6nEi3qUto7TBouO/RaVQpBDsPCcf/fMD3P+r31k+sWB8e/q6Ld295ZZ44TDXo1/vQ46/nZEQNzC9DY68AeIbjuoCVFRYP+zIGmi5oARcBz30wr0QDr1rZLAnk0lECos1SOh3LSnJSNgEQdLdvwSJ+aOhRjmRNrk0YX/NqV847KBzO9PeG+HICyC5gEN7sXAhpBDn3bC9GA56F0VJIJlMaRBjUqUQ4g6RwiseWI51a15wVBR0SnGeaTs4aDic/Bwp1Zjb7w66aU7j85wusfzDEUFFRYWX9wLkMOSI87lzrcJeDoe2CqYvNCUobJ6xsJJkdKn2w7j19bdBBrz5q1ZGYZLhTpfA0bIr53BogEi3LV+30nqli7cRz0runAHiF44jqiMo9wpHt6hcd7P6CBzakiqZRFKx+TaCCyQEx7K778PW1zc7TqISFTi1JRWty3LseZ2BrppDr3CgA+IbjkERlFd61BzGUXTSIn0IDv2VEol46kA8K7lAQkV4tAnlIzhmtMa0u628hIwYu8UNx0DXIP7hCKO8stLrj5YlP9MW6YNwaKvBpNKz5esTEtImzzyy0tU20aunMBG628rpIjhzVzzBMZAByTccKQNQhhwp7tnQ7qNw0KvQTSpKvOd+KrYmCaGL44gv7XDRJ6ntPPCsuimuir4IRX9XKakvQhkTfQeEtnbtY6vYv3dJFXMfqV+1JuNfwyxUkDUbpFfAodsiuuOwD8Ohj72SSLCNdePkkPggoSLkN3nmkVWeQPE7D8+46AL8faX1eyiyqozNx7c/eN4jK4A4wVFYXIQLr/sRhhw60tK/IwaFUF5pvfaF50Wc80igj21KoSycMMy8czrG2m6Vm+/W0Vj3CUkuQJk1/zuIRTstgFBQ4sPrV2Vj0AMZmcABcYajGBdedzUTjvGDQijLChxAor0ZSHShoHqktuTqfSm1lesGh95v8q7zJDc/CasOWnq9svp5x7gunrb1PAXFRZg1/7s4dMLh+Msd96ClyfKd9GXL169a4KXOXOYNFBAnOIpKijH3Wjs4ZJRVDsrKexMcyY5Wre5QURkiVcOy0o7/Sr3BQe047maldcTZ427X53hcwfbPd+L9Te/g0y3vYfs/3/f1epNOPh4nnXcOKgZX4+8r1mLL+lct9eT7QJTbiwUGyILaOVVJKfQZAIu6JDgu+dlPUDXcOjnHVYVQWZUdDWuEQxdEuKwa4bLswOgmbOtz73BQHVx2iN6YJEGBDN577AiOr/buR0esR0tRLNiXH32Krz76FHu/3Im9X36Frg72HVk1h47E4cceBYKDwKD04Rub8NLyxxniyf+BKLcxCwyQy2bWrZeAWnODBMdl/3EdiqtTwjKm0RVhDK7OfCuX9ZIsOPR8pEVIm+Q3+YOD+kzRvbTly50kGXFVcr2EmwWHUxsES6z7K71DRo1EYbH1ogx7OOjbH/m7MZFXdoEA8v3aujmyhNUsOH6w8EaEKyuRUNK3BKuLQzhsWHY0h9LeDKV7WWUnCLJHsnLzCZfk/cOhAeLmD2H1wWVnyyscPK/pBEdvDi8xvlsggMyfWUdLq7SrWUhz/PBXN6Fi6FAcaLNenT9pRDmKHL9FzjME1jw8cOil8gNJZnD4BoTAkkLMCOCcw4Hev7Q6uEL1Nw17SnUb5v8w13P+gu9hxrdnobG5FbGudOfWoVWFGFIV/BLHCxz5gSRzODIBhHbwzIGNuYcDW2VVqc3nZ9W8zPmMNcj8s+oWQ8U1xkYHDRmMX9x3F+IJBV/vS/+uBH2cZsohlYiEg/VJ+IEjt5AEA0dGgJA33hAin4Jjn3bVUFDJcVmFvgUHySRzQGbWkfaYahSwrj1a2jvQ2p7+Zbzh5QUYMZjv0BPvoGUCR24g8Q/Hvr1NKC4tQXFJjwHsaRfLLERJQgIyYl0CDp75FQQglsifa367ECPHjMbuxmYodNLHkCYOL0VxkY/jsDZvEwQcByEZNAJyoZ9rDZxE7R+Ovz7wCJ5f8bRW+bRTj8e3Lj4fE46e6MEPwu5XEjI+2dkoNAcHIRkBYmd/3Lnyv5BMqtjVuD+tC8URCRMPsW73cvSTmUVpPwClo8VvcWa5cGkVwuWDA6rTPxxNXzfi+nk/tvRjdt15OGfuuaga7H8HMN7ZgYZ9HWgLaGnV35ZVRqFnCMhFtUlJXW+scMSYUbj2t7cx7Y+hZREcUpPB+Q5DQ9mAQ+Xb/gYAABEKSURBVK+etn+1sJSMkn84qNltWz/AohtuY/agZlgNZtd9C2edP8tzDwkOOngVTUho2Je65yqT1J/hILkEDsi4KUfih7fdhM6uOJqaUyEeeho7uBhV5ZkvYbIJh95XugA7UjnU3+0o3cdkMxQvfnLRVWhttteQk6ZO0UA5+vhjuOa4DgdlViUZ/9rTxlXOLlN/hyOrgLR3xNDcmv4LNXlEOQoz9H3kAo6eCSEhUlmDULEXrZeZ5jBOxo1/24CnH1uN3V/ucpzIZ3xzJs6t+xaGHTLcNp8RDj3Tp00dvr56ReUHAhxZBYS1g3XMoZUIhTlvGmEMdW7h6OkAf/xWcHDorbc0t+DZv67FCyufcYSkrLIcM84+HdNPPxHjjjw8LS8LDsrQ0qViZ3P6LiOPShkocGQFENq9ol0sswahYO5jRlf5/ixBvuDQJwzZJRTkaB+eEjwcxsn63ttb8NyKZ/D+5ndd5/BR04/G9Bkn4vgZJyISlmwve4glJXzW6M0OGUhwBADIxVOTUtLiRaddLLMNUiQnMXHUEE93uekzId9wGGckW5tkDw7zAalXnnoJzz/xNPY3pe8QsqiprK7CcSdPw7RTpuGISUdYsngFZKDBkTEgVMH8mXUWP8jCZb9HuLAwzYteHEoB4jX1JjjY2iSbcLAvaWjcsxfPPfEMNjy3jlucE46agJNrT9b+6MkLIAMRjqAA2QHgMONIzb/xJ5h0wjTs2tvzK1cgq5gyuoZ7QCljb4QjTZtU1IA0Sqa7VWah0PdBKKSdeVGcIfPWN/+B51c8g4/f/4hbruddch7oDyVeQAYqHEEBQrdRXGAcoRnnzcL5V3xP0yAUj0UpJKmg75bzpt4OB11rGiodpN3eSN9DpG1h3kRbt+GCSFr4CJXVwEgqUE3RB271vv3qW9j06pugv91SaVkp7lp6FzcgAxmOYAA566KFUNVbjQNjZ6hPHT3Icr8sa0D7ChzGu3/pGx48oLzy1N+w/N4/a69N4SPfvOjbGH/UBO3mRNtL4dxmfffznTs+xxvrX8c7r7+DXV+wt4bHjB+DGxfdqJXY3ZZAc9T+fPtAhyMQQOzCTX7xh9+goqZai8fS0+QRZSgsdL4vty/C0TN/JSAUhiSHAcs32lU0fPo5br36Zst0p9ARcvhVDfZ/FDjeGU27VO7Df36IN9a9gU0bN6W1N++H8zBj1gzt8optDo5CAUdKbBl50nXJXzazrlkC0s7OXvzj/4njZ56GfQfaDp5vHldTgsoy+++XK9EDUKLBxlZx/vhyZdOXVVy3xocKtNByuu5NT2sfXY2nHnmS2VZm4SPpcBgbSMQTeH396yB/ytgJYzF56uTU8kqV8Nle9havgCPtJ49rbjhmmj+zjr4ld7kx0+QTpuHym/4d0c4Y9rekBmJ4eQQjBrO90v0KDqMgyDaRw5p9QVuzP/v+Tx1l6T18xB4Ou4bojrCvWmJo6bCeAxFwpEstEA1idyadllmDhtbg630tiCcSoA+bThpZZbnArd/CYZS1tuwKY+NLr+LZx5/Cnq92O4LCFz7iBw4Je6MKGlutt5IIOKxDEgggVC1rmXX2JRdg1iUXpHnVxw8pRllpT8AiLakIkN6aPC2reF5CktHa2oHnVjyLF5983rEEhY+cMftMnFR7Cg4dOzotr9nm4Gma8sSVJD5tEnDwyiswQFjLLNIepEUo6VpkUCFw2LBqSLKk2RsDCg7TqGx772M8t/J5vMcRPnLimSdroEw9+Tj4gSMUCmnRDQIOXjRS+QIDxG43SzfWjbFZEwbJKIqEBjQcxmF65Zl1eG7lC1zhI2RoHz/jeJww4wSUOXzpV69flmXIyS7saW7H3i6rr0Ysq5yBCQwQamb+zAvrAelMY5MsLVIZVnBoUcwbyjnMHfiyiqPvjXsaNUjqX9jAkRuoqKrQIDl55sk45LBDDpYhIOiKOElVACUOtbMVX3dFBBxcUs2iDaLZIbUXLpAk6SFzM7oWMe5ojS6KoTzs4XZAny/otVg+4DD2ceumf2rLro8/+ISr61XVlbjsqjocM20ykolOulUurZyAg0uMtpkC1SApLVJnic3SPev0vOlAGzpjXSgNKRhT3Lu0SCZwtB5oRTgStoSP+B2et17dBPrzzuuWYGlLlRMmjcUNN19h+fc9XRE0imWV3yEI1gbRe+GmRbriCezdn3IGjizswqCIzYcpM3ot74UzgWPds+vxyP2PaY1OPWkqzp17DiZMGe+9E4wSDR9+gNc3bMLbb76HJkNUgjErCxABRyDiD85IN3aHpUXIFrnmroXaHU90FWlbtBMU4TumuBMRieObYcG8L7OWTOBo2P4FFl7zK0u951wwC+deeA6qqv3fPpJobYKa6ImV2vzW+3htw2a8/2768uuSS7+Jb8w+5WAfBBzBTZbAl1jUNTstovtF6Eog0iIJRdE0CGmSfKVM4KA+r/3L01j72FPM7tcMHYxzL5yNs86b6fn1zHAYK9i/r0UDhdK4I0Zh8tE9h6H2xCJojIvdKs8CtymQFUCorfkz67YAONbYLmkP0iKkTYwGO+1o0c5WrlOmcFB/9zc144YFP3fs+qRjJ2nLrqOnH8X1ik5wOFWwOxZBk4CDS8a8mbIGyIJa651Z2i/elIn44W2pcGs9kLFQTmJscUw7M5KrFAQcel9fe+W/8eyK57D7qz2O3T9z9hnasmvYSPuvXPmHowBNceuFGMLPkdmMyhog3VrEcphK+/cbf4IpJx4HRUlqt7/TUmtwJIHhOVpqBQmHLn7axaLt2RfXvOQ4IuUVZThj9hk4pfYkjBydfjmdgCOzyZyN0lkFZEHtnDGKFNpiDoWnpdZNf/iNZrAbL3c4pKgLVeHs7mplAw7jwGz75zY8t+oFvPeO83f9yKF3ykw6I34SpkydDAFHNqZ35nVmFRDq3mVnXXitpEr3mLtKGoQ0CSXa0aKdLVpiHVYcQ7Gc7uzK/DVTNWQbDmM/U+Ejz2s2iluadPR4nHTK0Tjp1GNA4PCm3TGxrOKVld98WQeke6llMdjp3/XPJNB/05kRMtzJgUiQBN2xXMKhD4bX8JGRhwzFiaceg1nfPA1hl++n7IoVYJ+wOfzOe+5yQc9DZsMUyKhIyXrWUusHt92ofSqBtn6bDrSCHInVkQRGBGiP5AMOoyC8ho+Q4+/yK+egZgj7CK6Ag3t+Z5wxJ4A4LbUIDoKE7BGCg4x2On0XlJc933AYR8hL+MiZZ52AeQvOtwywgCPjOe+pgpwBklpqWaN96d/p7DoFNFIy+kdoqVUW8u8fyQSOLW9uxV///IR2EcKhY0cFHD7yPl7f8LZj+MjEKeNw3U0L0gZTwOFpbgeSOaeALKidU6VIoR3mpZbZHmmNdqClrQOypGr+Ebq21GvKBI6dDTvxyx+n3WSkNR9M+Egj1ETPWXBW+EhBQQTX/WKB5iXXk4DD6wwIJn9OAaEu2zkQ6Rk5EMmRSKm5NYr2jk6EJRWHl6T+5k2ZwEFtGIMPzW1mFj6SDoexbj18hOyOqkEVIA2ip52xAuwXBjnv8AeaL+eAUO/ttn7JDtGNdsqne9opqHF8Cd81/ZnCQe3SFTnXXnaDo6A9h4+0NEJVvH9NVsAR6Hz3XFleAKFezp9Zx/SyG52IlI+CGsl4p2UWaRKnFAQcev2bNr6N1Y+sCSZ8xCccYlnleT4HXiBvgJA9kpRC9eaARnpD484W/f/upmYtLKUkRDFbbEiChEOXciDhIwKOwCdtLivMGyApe8TeaDdDsnPvPu3qWgpsPMKkSbIBh3EQfIePCDhyOZez0lZeAUlBwnYi6pqEvlalJ12T0AGr8aUdmrc923AYpe4pfOSoI7TQERE+kpV5m7NK8w4IvandzYz0zOgjof8nR2KsK67tao0rU1BcXqlBkqvkN3zk1NOnobKq3LGbIrYqV6PI306vAIS6a3cKkQWJvgVMwY1jq8IoKyvjf+OAcnoNHyE4rr7mexh7+KHMHgg4AhqYgKvpNYC4QULRvxf/+H9oISmUDjoT6fNWFUBlRWWA1+DxS9lL+MjwETW47U7r5dXimCy/vHOds1cB4gaJ2XBv6+jEgdaoJrNRZSqqK8otF2PnSqANH7qHj5D2+MWtP0jrkrhgIVcj5K+dXgcIvcb8s+oWQ8U1rFcyQ2KM3aopUjGiqhShCP/n0PyJLb1UotVf+IiAIwjpZ7eOXgmImyahSx/osBXBQqkj1qXFbtHR3dKQilGDS1BUWJBdyXXXznP7CCt8RNx4mJPhybiRXguIGyTmsBRyJNKpRIKFXuqwQRFUlfV8ZiFjSTEq8HtMVsCRjdHITp29GhA3SOi5fu+vLp7W9g60tKfitoaWyBhaWYxwOPhtYAFHdiZkb6u11wNCAiM/iSRhKStMnp6bfSV0EURLW1T7BHVRWMKoqgKUFhcFJnu/cNDnB0h7mJO4miewoQm8oj4BCL21k8ednpuNdyWZ1CCJdqZubTykIoKa8iKuz1A7SdkvHCIqN/C5m5MK+wwgKUjmjElKIYoCTruxUZcU2SXkKyGfiZ7oxhTymdCZ9/ICCSMrClDsU5v4gaMzKYP8HG0KffE2PQnNkZM5nlEjfQqQbkgoCpi+qnuB3ZvP+PYsnH3xBQedirS7RbaJrk2GlEioKStCoYedLj9w0E2HtKxSVKuYBRwZzducFe5zgOiSmX/WRQuhqtZzsd0ZaMl1/hXfPXhCkf6ZfCat7Z3adjClYWURVJcVojBi/XU3joBXODoUGXvjEbQm2PUKOHI2vzNuqM8CQm/uZrxTHrM2IduEIKHjvHoaXBJGVUkEpUWF2jl4P3CQlmhJhLQ/rOWUXqeAI+M5m9MK+jQgPHYJ5SHb5PwrvofptacdFG5nLI72zk7Q33qKhGTUlEZQUVKIgrAMtY085PafZkh0Q0FARBWZuZQyjqaAI6dzO5DG+jwgvEsuykcXQsy65N/Sll0sUChvUUEEiXiXdkDLmEhTKJCgqECSYVvYjYqAI5D5mvNK+g0gKW1y8dSklCQDnrnLpUuX/CZkxFPIip7sQAliRAQcQUgxP3X0K0C6l1xVSTm00C7Y0ShmAuW082YdjOmiZ3RBBBnztONFNzxmmgQcmUowv+X7HSC6OFPaRFls/m47S9y09CJYjDYK7XQRJPRFXvLI+0kCDj9S611l+i0gupi7j/MupvhFN9GTMT+9GxQ9UpjKJJSkplnoTzyR+tstvfzw4/jg9U122bbKqlK7tH6N+7cR3BoSz7MqgX4PSM+yK3ytqqrX2sVzmaVM9smUE6fh8CkTMXbykQedjpSPVl5diYS2BNP/kKe+IxrFuxvfxFsvrsP+vU0CjqxO3dxUPiAA6Vl2zalKyt5A0csSMIOG1ODwKUdaRobA2P7ev7BzR4PbqAnN4SahXvZ8QAFiBgWqStenuy69ghkzdYOsJueIZVUw0sxVLQMSEKNwu29TudZtazijAZGwZPm6VdSGSH1MAgMeEINWGaPI8hxJlUirOPpR+MeYtIa8cGn9SrpiVaQ+KAEBCGPQtLMnslIrqdJUALVelmEqcEAC6mVVWizA6INEmLosAOEYQ7pDGAhPVeTkVAlylVZEVacCahUkWdMOKpLNoWSofmn9CvpgqUj9RAICkH4ykOI1siMBAUh25Cpq7ScSEID0k4EUr5EdCQhAsiNXUWs/kYAApJ8MpHiN7EhAAJIduYpa+4kEBCD9ZCDFa2RHAgKQ7MhV1NpPJCAA6ScDKV4jOxIQgGRHrqLWfiIBAUg/GUjxGtmRgAAkO3IVtfYTCQhA+slAitfIjgQEINmRq6i1n0hAANJPBlK8RnYk8P8B+i7BQECWBisAAAAASUVORK5CYII=');
INSERT INTO `user_admin` VALUES (11, 100, '123', 'awww', NULL, 'data:image/png;base64,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');
INSERT INTO `user_admin` VALUES (12, 100, '123', 'aevzxcs', NULL, 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMgAAADICAYAAACtWK6eAAAgAElEQVR4Xu2dCZgU1dnv/1XdPfvGMKwKAgqyuIC4izoYERPjJzhqEoyI92pyTfLFLdH4PfET470SY4zgzY0ak0/AJVFAwN2oMET8XBADcSMuiKOyyAwMs/RMT3d13eetnmKqq05Vnaqu7p7lnOfhQamz1XvOr9/znvc9pySIJCQgJGArAUnIRkhASMBeAgIQMTuEBBwkIAAR00NIQAAi5oCQgD8JCA3iT26i1ACRgABkgAy0eE1/EhCA+JObKDVAJCAAGSADLV7TnwQEIP7kJkoNEAkIQAbIQIvX9CcBAYg/uYlSA0QCApABMtDiNf1JQADiT26i1ACRgABkgAx0X37Ny2ZefCb1P6TiwNL6FVty+S4CkFxKW7TFJYEFtXPGJCFfrkpSrQTUMgo1SxLWqEnUy1DWLq1f08xVsY9MAhAfQhNFsiMBAkOVQ7eqKhZ4aKEZqrp4ef2Tt3kow51VAMItKpExmxK4rPbCBZIkPZRBGztkVZ4b9BJMAJLBiIiiwUjg8rPqHvKoNewablZV9bqH659cGkzPAAFIUJIU9fiSwPyzLloIVb3VV2GbQqqqXhEUJAKQIEdG1OVJAt+vrZsjS1jNKlRcrGL22QlMOlLBxCOVg1miUQmbt4Sw8bUwtn0Usm1PVuVpQSy3BCCehlRkDkoCC2rnVCWl0GcAqsx1HjdVwVVXxFBSojo2t+1fITz4UCEam5jTuFlWlbGZ7nAJQIIacVGPJwnMn1lHdsLl5kIzTk1ocPAm0iiLflOAhq/CrCLLlq9f5WVHzFKHAIR3JES+wCSwoPai2qSkrjdXOHpUErf/Z4fndqJft2PRknI0fF1sKdutRXZ4rrS7gADEr+REOd8SmD+zjpZWY8wV3P3rKGoGOy+rmI3u2o2GTxXcsmxC4FpEAOJ7mEVBPxKw27Wac34cc/+ty3uVCQXYTrwBDz4/ChvfqzbXsWP5+lVjvVecKiEA8Ss5Uc6zBLQQkpRhnpZIa9DSys0oZzbYfAD4eq/2qPFAAW7446RAl1kCEM/D3D8LUECgpCanAmr3rpK0Q5XkHSE1/vnS+jW+1/BGac2fWfcPAFPNErz5Z51pW7ncEk4kgM+/AJSebeAbHpiExpaCtCqSKuY+Ur9qDXe9howCED9S6ydlDLFPc1jbrYbX3CGp0hpVQv3y9SvX+nl9O285bele8+NOP1UCX+4EotG0sov+eji2fVGWXp8k3bZ83cqFfhoRgPiRWj8o0+2ko9gnix/C5fW04EAZyWW8msUODnIG/u9bO/wZ5m3twM5dlq4KQPrB5Mz3KwQQGKi9giRhqZRUbnMCxSnO6sorYjj91IR3cbS2Abt2M8sJQLyLs1+VSJ2VCJ0pyZiTVFElpTQAreubVUA7TCSpaj0g7ZChbDBP3qDgMApVUqXFEhIEStq5DCc4zvlGHJd+18euVWMTsG+/7ZjSVq/ZH5JJbJZYYvURfMi5pkjqrTYHiJzeQrMfJEjLFChTnULKJ4ZDKJEklEhAY1JFYzKp/c2ZmqFi4fL6VUu6HYH3sAxyqsurt1xrvz2aAqPD3pEYjYVw9b1HWbqbibNQAMI5+vnMNr/2wlshSb6MTJ5+jw7JuKq0CPS3OREkHyYUbIwlsI18Du6JtIitXeMZDmpz3z6AtnNd0urXhmPNfw9Ly6UCBx5ev8qrnXWwDgGIm9Tz+JwC+lQ5RGclaJcpa+n2ihImHMYGCY7VHV28kDD76hmOlhagaT8Qj7u+Oy2ryP4gLWJKGcVjCUBcRZ+fDN3RrhSvZPEbBNkj0hoEiFP6U3sMr3a5T1KnOuZ9pwuzz+asIxZLLafIGOdIBAXBIWKxOITVH7K4wVEsSTi9IIyJkRBKpfTfuM+VJLbFFTQoCpf9QHbHzeXWID9dji/G4ngsyh9da5Y/ecnnfSeG6dO4lmcpMOhPMsk1lOTzWLJ6DEtzUPmMtAdVIDQI1zDkLpMbHOcURnBpSaFrh+gXn3753ZITIFFVxQ0HoqC/vSb9wBN3fBUBsWsP0N7O1RRpjcfWjcSr1tgrrTzZHiFVGSPOg3CJs3dmoi1bRYocZuydhORiu2VV0HBQu06AbI4ncG8bv5eboCBNcdzUBL/GoE5QyMhXO4EY37YvBSQ+um6kndbohkOuFScKe+e8t+3VgtqLpyahXOBw35Nt2RpZwt2Vpa5v3KAkcUtLeviFXqi4sBAdtL43JNrWva+KXS8Z5Ws60ycthYawbAnjsVjXThozEBRffMm1pKJgRIrYtYSSGOojzUEXQPiNvTL3XSyxPI2mv8wZ+DAONsirPWhJRFuz5jR62FBc89063LDkPsszu10sFiC+w9JZouvoTMHhkmg59bfNNaBtXJe0VVblBUFoDr0dAYibyDN4TvaEIoVW+3DuWVolQ5qWQ07JbklEcNy8YB5Kiopwy/3/hYY9X6dVM6+kELMLI5aqWYBMnKDg5p/zL7ts+2s4x+H0Tk47VGnlJCyRk8rCTG0OoUEymPBeimrLKSlJN3ZYTs55qUfPywPIg+2d2NiVHttEy6rfXXu1BgelB9c8i41b303rQo0s4+5K61YvCzg6s3H3Ip9nN4yt7mgAupxtDj441A2yGro2SK1h7KbQIH5mq0uZbjjIh+Hbg2tugiYwTWSnRLYH2SDGNOfMGZhbO+PgPzXs3oNbHrBeYGi3zLp8v9UX4TvIUO8FHXBy8YyTvbFkzRimb4OqIVsDkrrw4XVP0qZG1pIAJGDRusFRXj0Ik085AVvWvYqYQ1yRuVs8GoQ1mW++fB4mjhmdVt0Ni+9D44H00I0ZBWEt3MSclrR14p14ulYi3wadH/eVDrQApiWeuR4Hr7ieda2sKguCXk6x3kcA4muU2YWc4CgsLsIZF1+AcccehSfvuQ976bAPI115wXl49IWXLbtNfgG5+5qrUVNVmdbS6vqNWLNho6V1lpaiEJNFrdYAQd9apOELoNPeP+O2rMokMtfPUAtA/EiNUcYJjoLiItRd9yMMOXQknn1gKT7d+p4tHKdPPRqLlj6GbZ83pOW5srQQpxdYDWljJpYGYQES7ezE1XdaVyZ2WuSGA+0Wr7wvW4RDezDPc3S/ZK7hoGYFIAEAwgvH31esxZb1rzrCQQ9ZhjTPNi9rIv/0Oxdi+kTrdTisNqhtlqay88qTU/CnP/Kwo+WiPVjRuNSnlFdcmrO0fmV9AMPlqQoBiCdxWTPzwkFLqr/c8TtXOCjDi29swmMvvpKWlyeokJZC5pB0s5GuV9rYfIDpE7Frh1U31cW91HLxedDSii5cYETjQlalmfmAQ2iQHMFBzTy5+D58+dGnlhbJ5qBllTFt29GARcse47IRjJlYfovRw4fh9h9ewXzT1c+8gDWbrV80Y/lF7Dz0tNSiW0noVkTHRAGIdBrQJtlqjwBvavcz3EKD+JEaAF7NQdW3NO3D0lvusLQ049ijcdWc85g9+F+/vsdiqLvZIXaOQpYdQoGB0WUrcH2sDWYTnMJPbq8otmwrswCkznPda/XVLsdARDoJaNUe6obl659kfYLN56h5LyYA8S4zT3BQ9R++sQkvLX88rSWzA8/cjSV/XYV3/vVx2j+7haZTZpahPm/2NzD75BN66qKo2eUrgZZWvBgCHmM46O3asltqkQYhTWJ7+dsn223jrSi2ioxzc8rn0krviwDEIyBeNIde9fpHn8C7r72V1pKT9qCMr255F39a+6znZRbTb1FVCdIiWjLAoVe+KAJsY8yEOUUFmFucfgkbhb5ffyCKDkYIvCMkH33ieXmFDO6z8jisttkFIB4k6QeOkqICrPzdH/DJe9vSWmLZHsYMtBV7/eL7LMss1qQ1lrNbZmntDRt6UHMYyzRKwC8jsCy1KA9rV8spYtgWEgdAnLZ2M7lwwcPQCkAyFZYfOIoLCzBicCV+/8tFFkBYHm5zH1lbsU7h6Xp51nZvTXkZ7o5L2rKKlV6VgT8xPrFB7REk5gsdnA5kEST0jY80w90BELb9keqlCtQ/vH7VzEzHz295oUE4JOcXjuGDKxGSJdz7H3f4AsQubsrNWLc7JntlAjjdYbPpwTCwkRHuRXAQJASLMTlBQrbIlQsMR20dALn8rmMdRyGftogAxAUQf3BEMHxwlQYHJb+AUFmWV90u+lZ/FTs7oUYFbo8Ddlc0UHQV2SMNjFnhBxLqDx2uogsbkAEg+dQiAhAHQPzAUVRAcFQibLhjigWImw2id8vOWPerReYowFyH+xMIjjts7BEKdaF2zcnt/DttA181azsmjmLfUuKmQai9fGkRAYgNIEHBQdU/sviPeGtdenCgnYeb1R1W9C0tdyi40LzsMZZn2SL0nLTIaId7GGhHizQJK9lBQh78xW2dzN0tvR4CZO5peyyg8ACSLy0iAGHMgiDhoOqf/8tq7Y8xTTxstHbKjydt3vYR7n38SUtWvztaBAdB4pTsjHYqYwcJ7W7RoS3zmRRzO6OHdmD6+AOYOCp1gwnLB8LqWz52tAQgppHwA0dhQRjDq6sQCbMPNL375jt48P+kR8/SCb/7brqWhw9g6wdYtPoppq/C7SAVyy9CjZ6jAJe6XFX1aAj4m80pXztIyP55NBqznGzke9GeXEVJFZ3dNpz+r6qkXpftA1LmfgpADBLxBUckrNkcEdvz4hISXTFcf9GVljnCs9VLcOCJFBysZY+bd50ucPhlSwdz6fPTBDDdJYTKbmeLXobavqasiLnM27KvHQ8pCpptfjScgJncEcegRBKvlVvsnYy+N+gVUsovAOmWmh84CrrhKHC4TCESDiMUkvGrq2/Cl9s/Txujc046Hpeee7b9uHXDoWewm6x2ly7o5eych7SbRUst2t1ySk6Q2O1uUX07G5rwclLVJrpZGzi199PdKV/NvcPLLdlyvcwSgHgMPNRHzAscVObx+5fhldXPpw04nfQ7GAJingomOOixncebx2BnXehAdZI9crPD1q8bnPTczplIz3a9t1PTXhvLC7G5tMBRo9Cy6uKmKEiDULpzZIUlfybfGxQaxIcEfGmOcGpZVRCxv4YnHA4hHOp53rRnL26e/++WHjIPNDHg0At6DS7Uy5FtQIGGLAOallm03HJLTpqEyrK2nrvau9D4Sc81Q9uLwvigOIKdBSF0ShL2h2WMiCuYEo1jensXCBI9rRhcgndK02PBIGHJ8nWrOI03tzdyfz6gNYgfOMjWIDgKI4y4jG55ExgEiDmxllnHHTleu9DtYHKAQ89jF1zottQiOO5oZdsj5GEnT7tbctrdorLTI2ENFOP2c+vuFrTuaXGr2vL85coivFJpvkgityHwAxaQbMERCoVsDfaXVz+HJ+5fbpkIB89rcMBBhZ2CC92+9eF0364XSB4Ns4Mb9SUXGe/Gi+4aP/4aXVG+u3d1AZG2eXCo6Yu1EIB4/qXxWsA3HNWVoC1du0TGOBnldina1q4tszroc2KGpIW+jx2r7VbxJrulFoWh0GEnJweik+fbzdOu98/J467noa3gOcUR7eCV0pXAng/ZH960e2cBCO9sCDCfHzhoyUTLqiIHOGRZBhnubumh396H11/aYNUiHLtJ5kJLwsA7DNeL29Yv1WNntNMzXk1CmC+xOUui95VAnV0UAV06geYONDfscxPRwee0+/XMIPO3S4QG4Rag14z+4JC74bC/cofgINtEMkW7svpnZ6zPSAJXcdgAxjppgl5fwF7q8NyCEgQk1J/VIWCN87XBmkYjUE5qbIfaxPcNEGGke53hGeT3AwctmUhzFDvcRyVJpDn44NC7H6QWoaXOLTbsugU0BqVJqB5yZJJdwooENg4bgTI52oVprTGM67T/RaCdroeHWD/LkOu7sQaEke4LDrkbDsat5/qAk8Ygm0M2hUS4cWynRSYmgZs9ahFqy2lniedGRidNQn26JmEfIm9+Vx5topehLd1xsQRGdima55z+0LYv2R7kMzGnoL4a5TY+xuf9HpDeBgcJv72zC4/c8wA2179mGSty2k30/sUz2PkonJx4xsadICFnIi3/nCKAjXXtaO/E0pIwPit0t8m8TNZc+0Cob/0aED9wkDagZVVJofUXrGcwJUQiIYRcbltnDT7B0RVPaDtZv7765+iMpl+643aoyWlC0VKLtcQJAhIKSyE/iVvsVktrB9q6v41ImoB8GQGBsnX5+lVZ/eIvS7b9FhDfcFRXgi5acEp6fJWnX79uzUFw6OmlJ9bi5SfWWqrhibRlte10ItDuritzPW5ftZ2tAPNsooCNcBjrJVBoR4rsCj+pe2k1dWn9mh1+ymdSpl8C4gsOqVtzuMARDofTTgvyCl/XHOb8pEX277XeOOh3qeXkn3AKLDT2y+2EIC21yC4xBjnawWGsl+wLgoTsi10FLtte3QVTcATzQU7eserXNogfOMjYpmVVqSsc6fFVvAK3g4PKb39/Gx649TeWqjJZarlBQt8BMd9SYu6AU1iKnpeO7pJjkQcOc/0U3bu9MIzNZQW2miXfcPQ7G8Q3HNWVKDVdkGYeULv4KjdInODQyz790F+w8dmXLFXxOuxYfXCChNcmoQDH25vasDNkv9A4NJHEN/dFHbds7WREWuSPQ8vsQ+HFxXFu04v/uR84qHbSHGXF1osIjC07xVc59ZAHDipPBvuSn93KXGq5XdXj1P5mGbjXZiOJF5KWnQfwUFKxRtWaGiafxjdaOrlBcYUjVf+W5etXTeOfBcHn7Bc2SFbhIC85RwiJeWh44dDL7dzRgCU/W2gZYdo9InuEd4vVXIGTj4QHkuj+qBYeQrYDebbdDj4RKBS2fly7fWAiJxzaq8iqMigXn1qzQ6vPA5JNOHjjqzKFQy9vt6uViT1CdZMmIT+J9UNqqZadPO7xjjgoEldVU2fECRKe3SjdCUjnPMgBqCeyOVhOQLsJmmvPubkffRoQv3AMq65EeYnzsspLfJVRqF41h3lAHrj1Tmx//1+W+eLXy65X5BZ9S99Jp/MkrLT3oz0gUPREgDw9qNjXeXM7EEZ0KShSVavPJMcHpPoNIP7hqEB5SfohHILBGC1Cu1pklFPsIV1izuvYzhQOGhw7ByI9y8Rop/JukLAOO1E5WmLRUsucyLdBjkC3ZZcdFPq/Exw/+LpNO5ZrPSCVXzukT2qQTOCoKC3W/BjkBaerQelvjiDcblDU1N8aNCoMp0O18BGjE9BtUjg9t7NHqAw56chZ5ze5QULbv+Zt4La9rSBjnZUIDprYXi9mMMNBSzL2+Q9g+fpVeZuneWvY7wD7hWNETSWqy0u1yFuZhwjODiZVFR2xOKKxOBQjMZzl7bK9vf41rPh/f2Y+zmRniyp08rjTczLe6bsg2hkOALHWGJq273V8IwLlfXIClhVwh5aQIX/+/o60c+g3j66ytJNPQ71PAeIXjvGHDEFZaVGgYBwcxaQCqCkjNJZIoov+KEnEFd6Fmf28e+L3f2YGNFKJICCh8HTWbe56j/QlV5GiguwQJc6nurSI3MKwphHov3dFQtoyrIoidpWkthVMO11G411vkw2I+Iin6++tXzgmjh6GUhc/h2vjdhkMcJizECidiSQ64oq2JPOb7CDJdPtX74/d0V39OWkTOl8+pGE/Yq0ePvns84UFID4E5xeOYw6rQaTI7rJ/Hx0xFnGAw5iNll0ESmdc8aVVyGinna1dO76wdDgoSNy2ganhYxQVc3e1pC2HMpQgs7gAxKNU/cJx1KhqFJaYb8Tw2LgPzeHUgg5KZ9zlvk9TJbmAhG5KIV8J61uFenfIkD77QCdOa40FJEhrNWxA5GlL61dYv1edtV70VNyrbRC/cIwfUoTyqsGQZL6IUU9y5tQcTnWSfRLtUrTlF29ygoTqyNQm0fvBcyKQtmW/3dzBHVbC+45iF4tXUj6vA6Xqx9cUo6y8DHKB+TYMD40HrDnsqiNjvkMDhU+j0PbvA/95p+WQlV5/UJDQVjDdmEJaxSl5jb9yGwG6wYRxYfXny9evGuNWNlvPe6UG8as5jqgpRnlZCaRQBFLY+dCTZ4EGoDlsQUkkEY0r4Fl65QoS2gomA97tthJ6J574Kzd5U3wW67LqfByzNfa11wHiH44ilJelbsGQIkXBLq+yCIdxMGibmHwqnS4rL4Jk+Z3/lxn9S/U5nfpzm6jm5zy2iV6GbBTaviUbhbWFa9c2bQFT2DvrEJWs5s/+0OaSV4FlM79vOAYXoby854qYQAHJERxGubZHo2hXQmmeerPc3WwSOjtOS66g9vAoKpi0iduyS+/nIEXFuM64pl3otnbjpdR6HvKR0OXU5Ilnh6vk9pI41tzuNYD4hePwwUWoMMARqAbJAxzUfy1yNtqOLkTQ4aBNYh0dmk3y1WcNzN8tr7eRuP34dcbieDqR8B1/VayqGJlIan7V7YXOGyj5PIfe65ZY/uEoREW5dSs3EA2SJzj0wVEScc0Yl8IRtCmyRZvQ7St08wpBct9td+Pjdz9kzm/e20h44Ni3P3UjYqbxV25tdf9IXPFw/ZNLefJmM0/eNYhvOKoLUVHB9nNkDEie4dAHvCvWiXgsptlTcSmMDiU1XDocxgvrlt19P954+e+2c4XsEjo/7mfJRZpDh8PcAJ3t8BJ/xTOZ830GpNdoEL9wjKsuRKUNHNoSK1Sg/fL6Sr0EDr3vHe1tSCrd66xwBO3JsKY5WLc5rlvzPFY88LDta/tZcjnBYWyI7AnaoqWART/fJdTr6k1waHPJ1yQKoJBfOA4fzF5WpXVJCkEuMH94haPTvQwO6nEi3qUto7TBouO/RaVQpBDsPCcf/fMD3P+r31k+sWB8e/q6Ld295ZZ44TDXo1/vQ46/nZEQNzC9DY68AeIbjuoCVFRYP+zIGmi5oARcBz30wr0QDr1rZLAnk0lECos1SOh3LSnJSNgEQdLdvwSJ+aOhRjmRNrk0YX/NqV847KBzO9PeG+HICyC5gEN7sXAhpBDn3bC9GA56F0VJIJlMaRBjUqUQ4g6RwiseWI51a15wVBR0SnGeaTs4aDic/Bwp1Zjb7w66aU7j85wusfzDEUFFRYWX9wLkMOSI87lzrcJeDoe2CqYvNCUobJ6xsJJkdKn2w7j19bdBBrz5q1ZGYZLhTpfA0bIr53BogEi3LV+30nqli7cRz0runAHiF44jqiMo9wpHt6hcd7P6CBzakiqZRFKx+TaCCyQEx7K778PW1zc7TqISFTi1JRWty3LseZ2BrppDr3CgA+IbjkERlFd61BzGUXTSIn0IDv2VEol46kA8K7lAQkV4tAnlIzhmtMa0u628hIwYu8UNx0DXIP7hCKO8stLrj5YlP9MW6YNwaKvBpNKz5esTEtImzzyy0tU20aunMBG628rpIjhzVzzBMZAByTccKQNQhhwp7tnQ7qNw0KvQTSpKvOd+KrYmCaGL44gv7XDRJ6ntPPCsuimuir4IRX9XKakvQhkTfQeEtnbtY6vYv3dJFXMfqV+1JuNfwyxUkDUbpFfAodsiuuOwD8Ohj72SSLCNdePkkPggoSLkN3nmkVWeQPE7D8+46AL8faX1eyiyqozNx7c/eN4jK4A4wVFYXIQLr/sRhhw60tK/IwaFUF5pvfaF50Wc80igj21KoSycMMy8czrG2m6Vm+/W0Vj3CUkuQJk1/zuIRTstgFBQ4sPrV2Vj0AMZmcABcYajGBdedzUTjvGDQijLChxAor0ZSHShoHqktuTqfSm1lesGh95v8q7zJDc/CasOWnq9svp5x7gunrb1PAXFRZg1/7s4dMLh+Msd96ClyfKd9GXL169a4KXOXOYNFBAnOIpKijH3Wjs4ZJRVDsrKexMcyY5Wre5QURkiVcOy0o7/Sr3BQe047maldcTZ427X53hcwfbPd+L9Te/g0y3vYfs/3/f1epNOPh4nnXcOKgZX4+8r1mLL+lct9eT7QJTbiwUGyILaOVVJKfQZAIu6JDgu+dlPUDXcOjnHVYVQWZUdDWuEQxdEuKwa4bLswOgmbOtz73BQHVx2iN6YJEGBDN577AiOr/buR0esR0tRLNiXH32Krz76FHu/3Im9X36Frg72HVk1h47E4cceBYKDwKD04Rub8NLyxxniyf+BKLcxCwyQy2bWrZeAWnODBMdl/3EdiqtTwjKm0RVhDK7OfCuX9ZIsOPR8pEVIm+Q3+YOD+kzRvbTly50kGXFVcr2EmwWHUxsES6z7K71DRo1EYbH1ogx7OOjbH/m7MZFXdoEA8v3aujmyhNUsOH6w8EaEKyuRUNK3BKuLQzhsWHY0h9LeDKV7WWUnCLJHsnLzCZfk/cOhAeLmD2H1wWVnyyscPK/pBEdvDi8xvlsggMyfWUdLq7SrWUhz/PBXN6Fi6FAcaLNenT9pRDmKHL9FzjME1jw8cOil8gNJZnD4BoTAkkLMCOCcw4Hev7Q6uEL1Nw17SnUb5v8w13P+gu9hxrdnobG5FbGudOfWoVWFGFIV/BLHCxz5gSRzODIBhHbwzIGNuYcDW2VVqc3nZ9W8zPmMNcj8s+oWQ8U1xkYHDRmMX9x3F+IJBV/vS/+uBH2cZsohlYiEg/VJ+IEjt5AEA0dGgJA33hAin4Jjn3bVUFDJcVmFvgUHySRzQGbWkfaYahSwrj1a2jvQ2p7+Zbzh5QUYMZjv0BPvoGUCR24g8Q/Hvr1NKC4tQXFJjwHsaRfLLERJQgIyYl0CDp75FQQglsifa367ECPHjMbuxmYodNLHkCYOL0VxkY/jsDZvEwQcByEZNAJyoZ9rDZxE7R+Ovz7wCJ5f8bRW+bRTj8e3Lj4fE46e6MEPwu5XEjI+2dkoNAcHIRkBYmd/3Lnyv5BMqtjVuD+tC8URCRMPsW73cvSTmUVpPwClo8VvcWa5cGkVwuWDA6rTPxxNXzfi+nk/tvRjdt15OGfuuaga7H8HMN7ZgYZ9HWgLaGnV35ZVRqFnCMhFtUlJXW+scMSYUbj2t7cx7Y+hZREcUpPB+Q5DQ9mAQ+Xb/gYAABEKSURBVK+etn+1sJSMkn84qNltWz/AohtuY/agZlgNZtd9C2edP8tzDwkOOngVTUho2Je65yqT1J/hILkEDsi4KUfih7fdhM6uOJqaUyEeeho7uBhV5ZkvYbIJh95XugA7UjnU3+0o3cdkMxQvfnLRVWhttteQk6ZO0UA5+vhjuOa4DgdlViUZ/9rTxlXOLlN/hyOrgLR3xNDcmv4LNXlEOQoz9H3kAo6eCSEhUlmDULEXrZeZ5jBOxo1/24CnH1uN3V/ucpzIZ3xzJs6t+xaGHTLcNp8RDj3Tp00dvr56ReUHAhxZBYS1g3XMoZUIhTlvGmEMdW7h6OkAf/xWcHDorbc0t+DZv67FCyufcYSkrLIcM84+HdNPPxHjjjw8LS8LDsrQ0qViZ3P6LiOPShkocGQFENq9ol0sswahYO5jRlf5/ixBvuDQJwzZJRTkaB+eEjwcxsn63ttb8NyKZ/D+5ndd5/BR04/G9Bkn4vgZJyISlmwve4glJXzW6M0OGUhwBADIxVOTUtLiRaddLLMNUiQnMXHUEE93uekzId9wGGckW5tkDw7zAalXnnoJzz/xNPY3pe8QsqiprK7CcSdPw7RTpuGISUdYsngFZKDBkTEgVMH8mXUWP8jCZb9HuLAwzYteHEoB4jX1JjjY2iSbcLAvaWjcsxfPPfEMNjy3jlucE46agJNrT9b+6MkLIAMRjqAA2QHgMONIzb/xJ5h0wjTs2tvzK1cgq5gyuoZ7QCljb4QjTZtU1IA0Sqa7VWah0PdBKKSdeVGcIfPWN/+B51c8g4/f/4hbruddch7oDyVeQAYqHEEBQrdRXGAcoRnnzcL5V3xP0yAUj0UpJKmg75bzpt4OB11rGiodpN3eSN9DpG1h3kRbt+GCSFr4CJXVwEgqUE3RB271vv3qW9j06pugv91SaVkp7lp6FzcgAxmOYAA566KFUNVbjQNjZ6hPHT3Icr8sa0D7ChzGu3/pGx48oLzy1N+w/N4/a69N4SPfvOjbGH/UBO3mRNtL4dxmfffznTs+xxvrX8c7r7+DXV+wt4bHjB+DGxfdqJXY3ZZAc9T+fPtAhyMQQOzCTX7xh9+goqZai8fS0+QRZSgsdL4vty/C0TN/JSAUhiSHAcs32lU0fPo5br36Zst0p9ARcvhVDfZ/FDjeGU27VO7Df36IN9a9gU0bN6W1N++H8zBj1gzt8optDo5CAUdKbBl50nXJXzazrlkC0s7OXvzj/4njZ56GfQfaDp5vHldTgsoy+++XK9EDUKLBxlZx/vhyZdOXVVy3xocKtNByuu5NT2sfXY2nHnmS2VZm4SPpcBgbSMQTeH396yB/ytgJYzF56uTU8kqV8Nle9havgCPtJ49rbjhmmj+zjr4ld7kx0+QTpuHym/4d0c4Y9rekBmJ4eQQjBrO90v0KDqMgyDaRw5p9QVuzP/v+Tx1l6T18xB4Ou4bojrCvWmJo6bCeAxFwpEstEA1idyadllmDhtbg630tiCcSoA+bThpZZbnArd/CYZS1tuwKY+NLr+LZx5/Cnq92O4LCFz7iBw4Je6MKGlutt5IIOKxDEgggVC1rmXX2JRdg1iUXpHnVxw8pRllpT8AiLakIkN6aPC2reF5CktHa2oHnVjyLF5983rEEhY+cMftMnFR7Cg4dOzotr9nm4Gma8sSVJD5tEnDwyiswQFjLLNIepEUo6VpkUCFw2LBqSLKk2RsDCg7TqGx772M8t/J5vMcRPnLimSdroEw9+Tj4gSMUCmnRDQIOXjRS+QIDxG43SzfWjbFZEwbJKIqEBjQcxmF65Zl1eG7lC1zhI2RoHz/jeJww4wSUOXzpV69flmXIyS7saW7H3i6rr0Ysq5yBCQwQamb+zAvrAelMY5MsLVIZVnBoUcwbyjnMHfiyiqPvjXsaNUjqX9jAkRuoqKrQIDl55sk45LBDDpYhIOiKOElVACUOtbMVX3dFBBxcUs2iDaLZIbUXLpAk6SFzM7oWMe5ojS6KoTzs4XZAny/otVg+4DD2ceumf2rLro8/+ISr61XVlbjsqjocM20ykolOulUurZyAg0uMtpkC1SApLVJnic3SPev0vOlAGzpjXSgNKRhT3Lu0SCZwtB5oRTgStoSP+B2et17dBPrzzuuWYGlLlRMmjcUNN19h+fc9XRE0imWV3yEI1gbRe+GmRbriCezdn3IGjizswqCIzYcpM3ot74UzgWPds+vxyP2PaY1OPWkqzp17DiZMGe+9E4wSDR9+gNc3bMLbb76HJkNUgjErCxABRyDiD85IN3aHpUXIFrnmroXaHU90FWlbtBMU4TumuBMRieObYcG8L7OWTOBo2P4FFl7zK0u951wwC+deeA6qqv3fPpJobYKa6ImV2vzW+3htw2a8/2768uuSS7+Jb8w+5WAfBBzBTZbAl1jUNTstovtF6Eog0iIJRdE0CGmSfKVM4KA+r/3L01j72FPM7tcMHYxzL5yNs86b6fn1zHAYK9i/r0UDhdK4I0Zh8tE9h6H2xCJojIvdKs8CtymQFUCorfkz67YAONbYLmkP0iKkTYwGO+1o0c5WrlOmcFB/9zc144YFP3fs+qRjJ2nLrqOnH8X1ik5wOFWwOxZBk4CDS8a8mbIGyIJa651Z2i/elIn44W2pcGs9kLFQTmJscUw7M5KrFAQcel9fe+W/8eyK57D7qz2O3T9z9hnasmvYSPuvXPmHowBNceuFGMLPkdmMyhog3VrEcphK+/cbf4IpJx4HRUlqt7/TUmtwJIHhOVpqBQmHLn7axaLt2RfXvOQ4IuUVZThj9hk4pfYkjBydfjmdgCOzyZyN0lkFZEHtnDGKFNpiDoWnpdZNf/iNZrAbL3c4pKgLVeHs7mplAw7jwGz75zY8t+oFvPeO83f9yKF3ykw6I34SpkydDAFHNqZ35nVmFRDq3mVnXXitpEr3mLtKGoQ0CSXa0aKdLVpiHVYcQ7Gc7uzK/DVTNWQbDmM/U+Ejz2s2iluadPR4nHTK0Tjp1GNA4PCm3TGxrOKVld98WQeke6llMdjp3/XPJNB/05kRMtzJgUiQBN2xXMKhD4bX8JGRhwzFiaceg1nfPA1hl++n7IoVYJ+wOfzOe+5yQc9DZsMUyKhIyXrWUusHt92ofSqBtn6bDrSCHInVkQRGBGiP5AMOoyC8ho+Q4+/yK+egZgj7CK6Ag3t+Z5wxJ4A4LbUIDoKE7BGCg4x2On0XlJc933AYR8hL+MiZZ52AeQvOtwywgCPjOe+pgpwBklpqWaN96d/p7DoFNFIy+kdoqVUW8u8fyQSOLW9uxV///IR2EcKhY0cFHD7yPl7f8LZj+MjEKeNw3U0L0gZTwOFpbgeSOaeALKidU6VIoR3mpZbZHmmNdqClrQOypGr+Ebq21GvKBI6dDTvxyx+n3WSkNR9M+Egj1ETPWXBW+EhBQQTX/WKB5iXXk4DD6wwIJn9OAaEu2zkQ6Rk5EMmRSKm5NYr2jk6EJRWHl6T+5k2ZwEFtGIMPzW1mFj6SDoexbj18hOyOqkEVIA2ip52xAuwXBjnv8AeaL+eAUO/ttn7JDtGNdsqne9opqHF8Cd81/ZnCQe3SFTnXXnaDo6A9h4+0NEJVvH9NVsAR6Hz3XFleAKFezp9Zx/SyG52IlI+CGsl4p2UWaRKnFAQcev2bNr6N1Y+sCSZ8xCccYlnleT4HXiBvgJA9kpRC9eaARnpD484W/f/upmYtLKUkRDFbbEiChEOXciDhIwKOwCdtLivMGyApe8TeaDdDsnPvPu3qWgpsPMKkSbIBh3EQfIePCDhyOZez0lZeAUlBwnYi6pqEvlalJ12T0AGr8aUdmrc923AYpe4pfOSoI7TQERE+kpV5m7NK8w4IvandzYz0zOgjof8nR2KsK67tao0rU1BcXqlBkqvkN3zk1NOnobKq3LGbIrYqV6PI306vAIS6a3cKkQWJvgVMwY1jq8IoKyvjf+OAcnoNHyE4rr7mexh7+KHMHgg4AhqYgKvpNYC4QULRvxf/+H9oISmUDjoT6fNWFUBlRWWA1+DxS9lL+MjwETW47U7r5dXimCy/vHOds1cB4gaJ2XBv6+jEgdaoJrNRZSqqK8otF2PnSqANH7qHj5D2+MWtP0jrkrhgIVcj5K+dXgcIvcb8s+oWQ8U1rFcyQ2KM3aopUjGiqhShCP/n0PyJLb1UotVf+IiAIwjpZ7eOXgmImyahSx/osBXBQqkj1qXFbtHR3dKQilGDS1BUWJBdyXXXznP7CCt8RNx4mJPhybiRXguIGyTmsBRyJNKpRIKFXuqwQRFUlfV8ZiFjSTEq8HtMVsCRjdHITp29GhA3SOi5fu+vLp7W9g60tKfitoaWyBhaWYxwOPhtYAFHdiZkb6u11wNCAiM/iSRhKStMnp6bfSV0EURLW1T7BHVRWMKoqgKUFhcFJnu/cNDnB0h7mJO4miewoQm8oj4BCL21k8ednpuNdyWZ1CCJdqZubTykIoKa8iKuz1A7SdkvHCIqN/C5m5MK+wwgKUjmjElKIYoCTruxUZcU2SXkKyGfiZ7oxhTymdCZ9/ICCSMrClDsU5v4gaMzKYP8HG0KffE2PQnNkZM5nlEjfQqQbkgoCpi+qnuB3ZvP+PYsnH3xBQedirS7RbaJrk2GlEioKStCoYedLj9w0E2HtKxSVKuYBRwZzducFe5zgOiSmX/WRQuhqtZzsd0ZaMl1/hXfPXhCkf6ZfCat7Z3adjClYWURVJcVojBi/XU3joBXODoUGXvjEbQm2PUKOHI2vzNuqM8CQm/uZrxTHrM2IduEIKHjvHoaXBJGVUkEpUWF2jl4P3CQlmhJhLQ/rOWUXqeAI+M5m9MK+jQgPHYJ5SHb5PwrvofptacdFG5nLI72zk7Q33qKhGTUlEZQUVKIgrAMtY085PafZkh0Q0FARBWZuZQyjqaAI6dzO5DG+jwgvEsuykcXQsy65N/Sll0sUChvUUEEiXiXdkDLmEhTKJCgqECSYVvYjYqAI5D5mvNK+g0gKW1y8dSklCQDnrnLpUuX/CZkxFPIip7sQAliRAQcQUgxP3X0K0C6l1xVSTm00C7Y0ShmAuW082YdjOmiZ3RBBBnztONFNzxmmgQcmUowv+X7HSC6OFPaRFls/m47S9y09CJYjDYK7XQRJPRFXvLI+0kCDj9S611l+i0gupi7j/MupvhFN9GTMT+9GxQ9UpjKJJSkplnoTzyR+tstvfzw4/jg9U122bbKqlK7tH6N+7cR3BoSz7MqgX4PSM+yK3ytqqrX2sVzmaVM9smUE6fh8CkTMXbykQedjpSPVl5diYS2BNP/kKe+IxrFuxvfxFsvrsP+vU0CjqxO3dxUPiAA6Vl2zalKyt5A0csSMIOG1ODwKUdaRobA2P7ev7BzR4PbqAnN4SahXvZ8QAFiBgWqStenuy69ghkzdYOsJueIZVUw0sxVLQMSEKNwu29TudZtazijAZGwZPm6VdSGSH1MAgMeEINWGaPI8hxJlUirOPpR+MeYtIa8cGn9SrpiVaQ+KAEBCGPQtLMnslIrqdJUALVelmEqcEAC6mVVWizA6INEmLosAOEYQ7pDGAhPVeTkVAlylVZEVacCahUkWdMOKpLNoWSofmn9CvpgqUj9RAICkH4ykOI1siMBAUh25Cpq7ScSEID0k4EUr5EdCQhAsiNXUWs/kYAApJ8MpHiN7EhAAJIduYpa+4kEBCD9ZCDFa2RHAgKQ7MhV1NpPJCAA6ScDKV4jOxIQgGRHrqLWfiIBAUg/GUjxGtmRgAAkO3IVtfYTCQhA+slAitfIjgQEINmRq6i1n0hAANJPBlK8RnYk8P8B+i7BQECWBisAAAAASUVORK5CYII=');
INSERT INTO `user_admin` VALUES (13, 100, '123', '123123', '123', 'data:image/png;base64,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');

-- ----------------------------
-- Table structure for user_count
-- ----------------------------
DROP TABLE IF EXISTS `user_count`;
CREATE TABLE `user_count`  (
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID：[1,8388607]',
  `level` smallint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '等级：[0,1000]',
  `iq` smallint(3) UNSIGNED NOT NULL DEFAULT 100 COMMENT 'IQ智商：[80,200]用于激励用户评论和发帖',
  `credit` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '信用度：[0,2147483647]用于评估用户信誉',
  `credit_points` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '积分：[0,2147483647]用于代金消费或兑换商品',
  `exp` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '经验值：[0,2147483647]',
  `extcredits1` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '拓展积分1：[0,2147483647]',
  `extcredits2` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '拓展积分2：[0,2147483647]',
  `extcredits3` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '拓展积分3：[0,2147483647]',
  `extcredits4` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '拓展积分4：[0,2147483647]',
  `extcredits5` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '拓展积分5：[0,2147483647]',
  `extcredits6` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '拓展积分6：[0,2147483647]',
  `extcredits7` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '拓展积分7：[0,2147483647]',
  `extcredits8` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '拓展积分8：[0,2147483647]',
  `money` double(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '钱：用于现金业务',
  `coin` decimal(16, 8) NOT NULL COMMENT '货币：用于游戏或数字货币业务',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户统计：用于统计用户等级、经验、积分等' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of user_count
-- ----------------------------
INSERT INTO `user_count` VALUES (1, 4, 100, 5000, 2, 0, 3, 4, 0, 0, 0, 0, 0, 0, 0.00, 0.00000000);
INSERT INTO `user_count` VALUES (2, 4, 80, 5000, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1233.00, 0.00000000);

-- ----------------------------
-- Table structure for user_group
-- ----------------------------
DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group`  (
  `group_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户组ID：[1,8388607]',
  `display` smallint(4) UNSIGNED NOT NULL DEFAULT 100 COMMENT '显示顺序：[0,1000]',
  `level` smallint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '等级划分：[0,1000]用于识别级别分组',
  `next_group_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '下级用户组ID：[1,8388607]决定用户升级后所属用户组',
  `exp` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '升级所需经验：[0,2147483647]用于确定用户的升级',
  `discount` double(3, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '折扣：用于确定用户的消费折扣',
  `bonus` double(3, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '奖励比例：用于确定用户的积分奖励',
  `app` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '应用：[0,12]用于区分用户组使用范围，cms内容管理系统、bbs社区、mall商城',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户名称：[0,16]',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述：[0,255]描述该用户组的特点或权限范围',
  `icon` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '图标：[0,255]用于标识用户组',
  PRIMARY KEY (`group_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户组：用于用户前端身份和鉴权' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_group
-- ----------------------------
INSERT INTO `user_group` VALUES (1, 0, 1, 2, 0, 0.00, 0.00, 'mall', '普通会员', '通过消费积分评估，用于激励用户消费', NULL);
INSERT INTO `user_group` VALUES (2, 0, 2, 3, 5000, 0.98, 0.00, 'mall', '黄金会员', '通过消费积分评估，用于激励用户消费', NULL);
INSERT INTO `user_group` VALUES (3, 0, 3, 4, 20000, 0.97, 1.50, 'mall', '白金会员', '通过消费积分评估，用于激励用户消费', NULL);
INSERT INTO `user_group` VALUES (4, 0, 4, 5, 100000, 0.95, 2.00, 'mall', '钻石会员', '通过消费积分评估，用于激励用户消费', NULL);
INSERT INTO `user_group` VALUES (5, 0, 5, 0, 500000, 0.90, 3.00, 'mall', '至尊会员', '通过消费积分评估，用于激励用户消费', NULL);
INSERT INTO `user_group` VALUES (6, 0, 1, 2, 0, 0.00, 0.00, 'bbs', '学徒', '通过IQ值评估，激励用户评论和发表', NULL);
INSERT INTO `user_group` VALUES (7, 0, 2, 3, 120, 0.98, 0.00, 'bbs', '才子', '通过IQ值评估，激励用户评论和发表', NULL);
INSERT INTO `user_group` VALUES (8, 0, 3, 4, 140, 0.97, 1.50, 'bbs', '达人', '通过IQ值评估，激励用户评论和发表', NULL);
INSERT INTO `user_group` VALUES (9, 0, 4, 5, 160, 0.95, 2.00, 'bbs', '导师', '通过IQ值评估，激励用户评论和发表', NULL);
INSERT INTO `user_group` VALUES (10, 0, 5, 0, 180, 0.90, 3.00, 'bbs', '贤者', '123', 'data:image/png;base64,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');
INSERT INTO `user_group` VALUES (12, 2, 2, 0, 3, 5.00, 5.00, NULL, 'asdas', NULL, 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAnYAAAAnCAYAAACCGQWCAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAFwmlUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNS42LWMxNDIgNzkuMTYwOTI0LCAyMDE3LzA3LzEzLTAxOjA2OjM5ICAgICAgICAiPiA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtbG5zOmRjPSJodHRwOi8vcHVybC5vcmcvZGMvZWxlbWVudHMvMS4xLyIgeG1sbnM6cGhvdG9zaG9wPSJodHRwOi8vbnMuYWRvYmUuY29tL3Bob3Rvc2hvcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RFdnQ9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZUV2ZW50IyIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKFdpbmRvd3MpIiB4bXA6Q3JlYXRlRGF0ZT0iMjAyMC0wMy0zMFQyMTo1Mjo0MSswODowMCIgeG1wOk1vZGlmeURhdGU9IjIwMjAtMDMtMzBUMjE6NTk6MTYrMDg6MDAiIHhtcDpNZXRhZGF0YURhdGU9IjIwMjAtMDMtMzBUMjE6NTk6MTYrMDg6MDAiIGRjOmZvcm1hdD0iaW1hZ2UvcG5nIiBwaG90b3Nob3A6Q29sb3JNb2RlPSIzIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOjgzNjc3YjlmLWUyZGMtOTA0NC1iOGUzLTVkNmRlNDIyNGYyMCIgeG1wTU06RG9jdW1lbnRJRD0iYWRv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');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID：[1,8388607]',
  `sex` smallint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '性别：[0,2]0未设置、1男、2女',
  `idcard_state` smallint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '身份实名认证：[0,10]1为未认证，2为认证中，3为认证通过',
  `age` smallint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '年龄：[0,150]',
  `province_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '省份ID：[1,2147483647]用户所在地的省份',
  `city_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '所在城市ID：[1,2147483647]',
  `birthday` date NOT NULL DEFAULT '1970-01-01' COMMENT '生日：',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名：[2,16]',
  `job` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '职业：[0,16]',
  `school` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '毕业学校：[0,16]',
  `major` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所学专业：[0,16]',
  `idcard` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证号：[0,64]',
  `company_address` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公司地址：[0,125]用户当前就职的公司地址',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细地址：[0,255]用户居住地的详细地址',
  `job_scope` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工作范围：[0,255]',
  `company_business` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公司经营范围：[0,255]',
  `idcard_img` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '身份证图片：保存json格式',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息：用于保存用户个人信息，如年龄、住址等' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (1, 0, 0, 0, 0, 0, '1970-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for user_sns
-- ----------------------------
DROP TABLE IF EXISTS `user_sns`;
CREATE TABLE `user_sns`  (
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID：[1,8388607]',
  `qq` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'QQ号：[5,12]',
  `qq_state` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'QQ认证：[0,1]0未认证，1已认证',
  `wechat` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信号：[5,16]',
  `wechat_state` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '微信认证：[0,1]0未认证，1已认证',
  `mm` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'MM号：[5,16]',
  `mm_state` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'MM认证：[0,1]0未认证，1已认证',
  `baidu` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '百度账号：[5,14]',
  `baidu_state` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '百度认证：[0,1]0未认证，1已认证',
  `taobao` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '淘宝账号：[5,10]',
  `taobao_state` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '淘宝认证：[0,1]0未认证，1已认证',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '社交账户：用于保存用的社交平台账户，方便同步登录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_sns
-- ----------------------------
INSERT INTO `user_sns` VALUES (1, '573242395', 1, 'qiuwenwu91', 1, 'qiuwenwu91', 0, '', 0, '', 0);
INSERT INTO `user_sns` VALUES (2, 'afwwqe', 1, 'fafwa', 0, 'sad', 1, 'wqrqwr', 0, 'asf', 0);

-- ----------------------------
-- Table structure for wechat_app
-- ----------------------------
DROP TABLE IF EXISTS `wechat_app`;
CREATE TABLE `wechat_app`  (
  `app_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '应用序号：[1,8388607]',
  `available` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否可用：[0,1]在未审核状态下， 该应用授权为不可用',
  `encrypt` smallint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '加解密方式：[0,10]0明文模式，1兼容模式，2安全模式',
  `times_allow` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '每日允许请求次数：[0,32767]用于限制应用每日可授权次数',
  `times_today` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '今日请求次数：[0,32767]用于记录今日请求授权次数，判断授权次数是否超限',
  `max_age` smallint(5) UNSIGNED NOT NULL DEFAULT 1825 COMMENT '有效期时长：[0,32767]授权应用可以使用的时长，超时需重新申请（单位：天）',
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '持有者ID：[1,8388607]该客户端所有人的ID',
  `times_count` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '请求总次数：[0,2147483647]用于记录授权总次数',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '应用名称：[0,16]用于用户登陆时显示授权应用',
  `appid` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '应用ID：[0,16]用于应用授权访问时的账号',
  `token` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息访问令牌：[0,32]用于访问应用时验证身份',
  `encoding_aes_key` varchar(43) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息加密钥匙：[16,43]用于给应用发送消息时的加密钥匙',
  `appsecret` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '应用密钥：[0,64]用于应用授权访问时的密码',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '应用图标：[0,255]用于用户登录时显示',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息访问地址：[0,255]当接收到用户所发消息后回访该地址',
  `bind_ip` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '访问绑定IP：网站授权时确认重定向网址为已授权IP',
  `scope` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '允许使用的接口：多个接口用”，“分隔',
  `scope_not` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '不允许使用的接口：“多个接口用”，“分隔',
  `users` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '授权的用户：',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '上次使用时间：用于记录上次授权时间，防止频繁操作',
  PRIMARY KEY (`app_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '微信应用：用于管理微信公众号、小程序' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wechat_app
-- ----------------------------

-- ----------------------------
-- Table structure for wechat_app_refresh
-- ----------------------------
DROP TABLE IF EXISTS `wechat_app_refresh`;
CREATE TABLE `wechat_app_refresh`  (
  `refresh_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '刷新Token的ID：[1,2147483647]',
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID：[1,8388607]表示当前Token绑定的用户uid',
  `appid` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '应用ID：[0,16]',
  `refresh_token` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '刷新令牌：[0,32]用来刷新访问牌，保留30天',
  `create_time` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '创建时间：用来判断刷新令牌有效期',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间：用来判断是否频繁刷新访问牌',
  PRIMARY KEY (`refresh_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '微信刷新访问牌：用于微信公众号Oauth2.0刷新临时访问牌Token' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wechat_app_refresh
-- ----------------------------

-- ----------------------------
-- Table structure for wechat_message
-- ----------------------------
DROP TABLE IF EXISTS `wechat_message`;
CREATE TABLE `wechat_message`  (
  `message_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '消息ID：[1,2147483647]',
  `end` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '结束会话：[0,1]1已结束,0为未结束会话,如果未结束则查询当前正文',
  `group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户群组：[0,64]',
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '会话类型：[0,16]一般情况下，1永久会话/群、2临时会话/群',
  `from_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会话发起人：[0,64]',
  `to_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会话接收人：[0,64]',
  `robot` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务的机器人：[0,64]',
  `cmd` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所使用的指令：[0,24]',
  `keyword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关键词句：[0,255]除指令外，过滤、抽取后的词句',
  `check` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '复查指令：[0,255]当用户再驱动指令而缺少参数时，执行该语句',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '会话正文：',
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注信息：',
  `msg_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息类型：[0,16]',
  `form` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '表单：用于记录用户已填参数',
  `stage` smallint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '阶段：[null,9]第1阶段用于补全信息，第二阶段用于校验信息',
  `create_time` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '会话创建时间：',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '会话更新时间：',
  PRIMARY KEY (`message_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '微信消息：用于查询和保存聊天记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wechat_message
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
