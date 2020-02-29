/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2020-02-22 22:28:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `cms_article`
-- ----------------------------
DROP TABLE IF EXISTS `cms_article`;
CREATE TABLE `cms_article` (
  `article_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章id：[1,8388607]',
  `available` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否启用：[0,1]启用后前台才会显示该文章',
  `state` smallint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态：[1,5]1正常，2推荐，3认证，4官方，5违规',
  `type_id` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '文章分类ID：[1,1000]用来搜索指定类型的文章',
  `display` smallint(5) unsigned NOT NULL DEFAULT '100' COMMENT '排序：[0,10000]决定文章显示的顺序',
  `channel_id` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '频道ID：[1,10000]该文章所属频道，仅该频道列表可以看到该文章',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID：[1,8388607]编辑这篇文章到本站的用户ID',
  `city_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '所属城市ID：[1,8388607]对于一些地方文章，可以通过该ID筛看',
  `hot` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '热度：[0,1000000000]访问这篇文章的人次',
  `praise` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点赞次数：[0,1000000000]',
  `collect_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '采集规则ID：[1,1000000000]如果文章是通过采集的方式获得，那么具有采集ID',
  `create_time` datetime NOT NULL DEFAULT '1997-01-01 00:00:00' COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `author` varchar(16) DEFAULT NULL COMMENT '作者：[0,16]写出该文章的人',
  `title` varchar(125) DEFAULT NULL COMMENT '标题：[0,125]用于文章和html的<title>标签中',
  `keywords` varchar(125) DEFAULT NULL COMMENT '关键词：[0,125]用于搜索引擎收录',
  `description` varchar(255) DEFAULT NULL COMMENT '描述：[0,255]用于文章提纲和搜索引擎收录',
  `img` varchar(255) DEFAULT NULL COMMENT '封面图：[0,255]用于显示于文章列表页，多个封面图用换行分隔',
  `source` varchar(255) DEFAULT NULL COMMENT '来源：[0,255]文章的出处',
  `url` varchar(255) DEFAULT NULL COMMENT '来源地址：[0,255]用于跳转到发布该文章的网站',
  `tag` varchar(255) DEFAULT NULL COMMENT '标签：[0,255]用于标注文章所属相关内容，多个标签用空格隔开',
  `content` text COMMENT '正文：文章的主体内容',
  `collecter` text COMMENT '收藏者：多个收藏者用”,“分隔',
  PRIMARY KEY (`article_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cms_article
-- ----------------------------

-- ----------------------------
-- Table structure for `cms_article_channel`
-- ----------------------------
DROP TABLE IF EXISTS `cms_article_channel`;
CREATE TABLE `cms_article_channel` (
  `channel_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '频道ID：[1,10000]',
  `available` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否启用：[0,1]启用后才可以看到该频道',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏：[0,1]隐藏非管理员该频道无法查看. 0为不隐藏，1为隐藏',
  `can_comment` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可评论：[0,1]不可评论则用户只能看，无法点评。0为不可评论，1为可评论',
  `display` smallint(4) unsigned NOT NULL DEFAULT '100' COMMENT '显示顺序：[0,1000]决定频道显示的先后顺序',
  `father_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '上级ID：[1,10000]在频道列表操作时，当上级频道展开时，才显示该频道',
  `city_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '所属城市：[1,8388607]一些地方频道，可以通过该条判断是否可查看',
  `type` varchar(16) NOT NULL DEFAULT 'article' COMMENT '频道类型：[0,16]question问答、info资讯、news新闻、article文章、activity活动',
  `name` varchar(16) NOT NULL DEFAULT '' COMMENT '频道名称：[2,16]',
  `template` varchar(64) DEFAULT NULL COMMENT '风格模板：[0,64]频道和文章都使用的样式',
  `description` varchar(255) DEFAULT NULL COMMENT '描述：[0,255]描述该频道的作用',
  `icon` varchar(255) DEFAULT NULL COMMENT '频道图标：[0,255]',
  `url` varchar(255) DEFAULT NULL COMMENT '外链地址：[0,255]如果该频道是跳转到其他网站的情况下，就在该URL上设置',
  PRIMARY KEY (`channel_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cms_article_channel
-- ----------------------------

-- ----------------------------
-- Table structure for `cms_article_comment`
-- ----------------------------
DROP TABLE IF EXISTS `cms_article_comment`;
CREATE TABLE `cms_article_comment` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论id：[1,2147483647]',
  `available` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否启用：[0,1]启用则显示该评论',
  `score` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '评分：[0,5]最低1分、最多5分',
  `display` smallint(4) unsigned NOT NULL DEFAULT '100' COMMENT '显示排序：[0,1000]决定显示的顺序',
  `article_id` mediumint(8) unsigned NOT NULL DEFAULT '1' COMMENT '所属文章id：[1,8388607]',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID：[1,8388607]编辑评论的用户ID',
  `name` varchar(16) DEFAULT NULL COMMENT '留言者姓名：[2,16]用于实名回复',
  `tag` varchar(64) DEFAULT NULL COMMENT '标签：[0,64]评论人给的标签，多个标签用空格隔开',
  `content` text COMMENT '正文：评论内容',
  `reply` text COMMENT '评论回复：对评论人的评论做出的回复。通过form-url格式保存，多个人的回复用换行分隔',
  PRIMARY KEY (`comment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cms_article_comment
-- ----------------------------

-- ----------------------------
-- Table structure for `cms_article_section`
-- ----------------------------
DROP TABLE IF EXISTS `cms_article_section`;
CREATE TABLE `cms_article_section` (
  `content_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '内容模块ID：[1,2147483647]',
  `article_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '对应文章ID：[1,2147483647]',
  `title` varchar(255) DEFAULT NULL COMMENT '章节标题：[0,255]',
  `content` text COMMENT '章节内容：',
  `img` text COMMENT '章节图片：',
  PRIMARY KEY (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cms_article_section
-- ----------------------------

-- ----------------------------
-- Table structure for `cms_article_type`
-- ----------------------------
DROP TABLE IF EXISTS `cms_article_type`;
CREATE TABLE `cms_article_type` (
  `type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章分类ID：[1,30000]',
  `display` smallint(4) unsigned NOT NULL DEFAULT '100' COMMENT '显示顺序：[0,1000]',
  `channel_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '频道ID：[1,10000]',
  `father_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID：[1,32767]',
  `name` varchar(16) DEFAULT NULL COMMENT '分类名称：[0,16]',
  `description` varchar(255) DEFAULT NULL COMMENT '分类描述：[0,255]',
  `icon` varchar(255) DEFAULT NULL COMMENT '分类图标：[0,255]',
  PRIMARY KEY (`type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cms_article_type
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_ad`
-- ----------------------------
DROP TABLE IF EXISTS `sys_ad`;
CREATE TABLE `sys_ad` (
  `ad_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '广告ID：[1,32767]',
  `display` smallint(5) unsigned NOT NULL DEFAULT '100' COMMENT '显示顺序：[0,10000]数值越小，越优先显示',
  `city_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '投放城市ID：[1,8388607]',
  `area_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '投放地区：[1,8388607]',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '广告主ID：[1,8388607]表示是谁打的广告',
  `times_user` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '访客数：[0,2147483647]',
  `times_max` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '次数上限：[0,2147483647]表示点击或展现达多少次后不再打该广告',
  `times_show` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '展现量：[0,2147483647]',
  `times_click` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击量：[0,2147483647]',
  `fee` double(5,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '费用：每次点击或展现、增加访客所需的费用',
  `fee_max` double(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '费用上限：表示打广告消费到多少钱后不再打广告',
  `name` varchar(16) DEFAULT NULL COMMENT '广告名称：[0,16]',
  `type` varchar(16) DEFAULT NULL COMMENT '广告类型：[0,16]text文字、img图片、video视频、flash交互动画',
  `location` varchar(16) DEFAULT NULL COMMENT '投放位置：[0,16]',
  `fee_way` varchar(16) DEFAULT NULL COMMENT '付费方式：[0,16]click点击付费、show展现付费、user访客付费',
  `app` varchar(16) DEFAULT NULL COMMENT '展现应用：[0,16]将在指定的应用下才展现广告',
  `trade` varchar(24) DEFAULT NULL COMMENT '所属行业：[0,24]可以根据不同的行业定制不同的投放',
  `title` varchar(32) DEFAULT NULL COMMENT '广告标题：[0,32]',
  `description` varchar(255) DEFAULT NULL COMMENT '广告描述：[0,255]',
  `img` varchar(255) DEFAULT NULL COMMENT '广告图：[0,255]',
  `url` varchar(255) DEFAULT NULL COMMENT '跳转链接：[0,255]',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键词：[0,255]在出现于关键词相关的情况下才打广告，多个关键词用空格分隔',
  PRIMARY KEY (`ad_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_ad
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_address_area`
-- ----------------------------
DROP TABLE IF EXISTS `sys_address_area`;
CREATE TABLE `sys_address_area` (
  `area_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '地区ID：[1,8388607]',
  `show` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否可见：[0,2]0为仅表单可见，1为仅表单和搜索时可见 ，2为均可见',
  `display` smallint(4) unsigned NOT NULL DEFAULT '100' COMMENT '显示顺序：[0,1000]',
  `city_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '所属城市ID：[1,8388607]',
  `name` varchar(16) NOT NULL DEFAULT '' COMMENT '地区名称：[0,16]',
  PRIMARY KEY (`area_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='行政区域县区信息表';

-- ----------------------------
-- Records of sys_address_area
-- ----------------------------
INSERT INTO `sys_address_area` VALUES ('110101', '0', '100', '110100', '东城区');
INSERT INTO `sys_address_area` VALUES ('110102', '0', '100', '110100', '西城区');
INSERT INTO `sys_address_area` VALUES ('110103', '0', '100', '110100', '崇文区');
INSERT INTO `sys_address_area` VALUES ('110104', '0', '100', '110100', '宣武区');
INSERT INTO `sys_address_area` VALUES ('110105', '0', '100', '110100', '朝阳区');
INSERT INTO `sys_address_area` VALUES ('110106', '0', '100', '110100', '丰台区');
INSERT INTO `sys_address_area` VALUES ('110107', '0', '100', '110100', '石景山区');
INSERT INTO `sys_address_area` VALUES ('110108', '0', '100', '110100', '海淀区');
INSERT INTO `sys_address_area` VALUES ('110109', '0', '100', '110100', '门头沟区');
INSERT INTO `sys_address_area` VALUES ('110111', '0', '100', '110100', '房山区');
INSERT INTO `sys_address_area` VALUES ('110112', '0', '100', '110100', '通州区');
INSERT INTO `sys_address_area` VALUES ('110113', '0', '100', '110100', '顺义区');
INSERT INTO `sys_address_area` VALUES ('110114', '0', '100', '110100', '昌平区');
INSERT INTO `sys_address_area` VALUES ('110115', '0', '100', '110100', '大兴区');
INSERT INTO `sys_address_area` VALUES ('110116', '0', '100', '110100', '怀柔区');
INSERT INTO `sys_address_area` VALUES ('110117', '0', '100', '110100', '平谷区');
INSERT INTO `sys_address_area` VALUES ('110228', '0', '100', '110200', '密云县');
INSERT INTO `sys_address_area` VALUES ('110229', '0', '100', '110200', '延庆县');
INSERT INTO `sys_address_area` VALUES ('120101', '0', '100', '120100', '和平区');
INSERT INTO `sys_address_area` VALUES ('120102', '0', '100', '120100', '河东区');
INSERT INTO `sys_address_area` VALUES ('120103', '0', '100', '120100', '河西区');
INSERT INTO `sys_address_area` VALUES ('120104', '0', '100', '120100', '南开区');
INSERT INTO `sys_address_area` VALUES ('120105', '0', '100', '120100', '河北区');
INSERT INTO `sys_address_area` VALUES ('120106', '0', '100', '120100', '红桥区');
INSERT INTO `sys_address_area` VALUES ('120107', '0', '100', '120100', '塘沽区');
INSERT INTO `sys_address_area` VALUES ('120108', '0', '100', '120100', '汉沽区');
INSERT INTO `sys_address_area` VALUES ('120109', '0', '100', '120100', '大港区');
INSERT INTO `sys_address_area` VALUES ('120110', '0', '100', '120100', '东丽区');
INSERT INTO `sys_address_area` VALUES ('120111', '0', '100', '120100', '西青区');
INSERT INTO `sys_address_area` VALUES ('120112', '0', '100', '120100', '津南区');
INSERT INTO `sys_address_area` VALUES ('120113', '0', '100', '120100', '北辰区');
INSERT INTO `sys_address_area` VALUES ('120114', '0', '100', '120100', '武清区');
INSERT INTO `sys_address_area` VALUES ('120115', '0', '100', '120100', '宝坻区');
INSERT INTO `sys_address_area` VALUES ('120221', '0', '100', '120200', '宁河县');
INSERT INTO `sys_address_area` VALUES ('120223', '0', '100', '120200', '静海县');
INSERT INTO `sys_address_area` VALUES ('120225', '0', '100', '120200', '蓟　县');
INSERT INTO `sys_address_area` VALUES ('130101', '0', '100', '130100', '市辖区');
INSERT INTO `sys_address_area` VALUES ('130102', '0', '100', '130100', '长安区');
INSERT INTO `sys_address_area` VALUES ('130103', '0', '100', '130100', '桥东区');
INSERT INTO `sys_address_area` VALUES ('130104', '0', '100', '130100', '桥西区');
INSERT INTO `sys_address_area` VALUES ('130105', '0', '100', '130100', '新华区');
INSERT INTO `sys_address_area` VALUES ('130107', '0', '100', '130100', '井陉矿区');
INSERT INTO `sys_address_area` VALUES ('130108', '0', '100', '130100', '裕华区');
INSERT INTO `sys_address_area` VALUES ('130121', '0', '100', '130100', '井陉县');
INSERT INTO `sys_address_area` VALUES ('130123', '0', '100', '130100', '正定县');
INSERT INTO `sys_address_area` VALUES ('130124', '0', '100', '130100', '栾城县');
INSERT INTO `sys_address_area` VALUES ('130125', '0', '100', '130100', '行唐县');
INSERT INTO `sys_address_area` VALUES ('130126', '0', '100', '130100', '灵寿县');
INSERT INTO `sys_address_area` VALUES ('130127', '0', '100', '130100', '高邑县');
INSERT INTO `sys_address_area` VALUES ('130128', '0', '100', '130100', '深泽县');
INSERT INTO `sys_address_area` VALUES ('130129', '0', '100', '130100', '赞皇县');
INSERT INTO `sys_address_area` VALUES ('130130', '0', '100', '130100', '无极县');
INSERT INTO `sys_address_area` VALUES ('130131', '0', '100', '130100', '平山县');
INSERT INTO `sys_address_area` VALUES ('130132', '0', '100', '130100', '元氏县');
INSERT INTO `sys_address_area` VALUES ('130133', '0', '100', '130100', '赵　县');
INSERT INTO `sys_address_area` VALUES ('130181', '0', '100', '130100', '辛集市');
INSERT INTO `sys_address_area` VALUES ('130182', '0', '100', '130100', '藁城市');
INSERT INTO `sys_address_area` VALUES ('130183', '0', '100', '130100', '晋州市');
INSERT INTO `sys_address_area` VALUES ('130184', '0', '100', '130100', '新乐市');
INSERT INTO `sys_address_area` VALUES ('130185', '0', '100', '130100', '鹿泉市');
INSERT INTO `sys_address_area` VALUES ('130201', '0', '100', '130200', '市辖区');
INSERT INTO `sys_address_area` VALUES ('130202', '0', '100', '130200', '路南区');
INSERT INTO `sys_address_area` VALUES ('130203', '0', '100', '130200', '路北区');
INSERT INTO `sys_address_area` VALUES ('130204', '0', '100', '130200', '古冶区');
INSERT INTO `sys_address_area` VALUES ('130205', '0', '100', '130200', '开平区');
INSERT INTO `sys_address_area` VALUES ('130207', '0', '100', '130200', '丰南区');
INSERT INTO `sys_address_area` VALUES ('130208', '0', '100', '130200', '丰润区');
INSERT INTO `sys_address_area` VALUES ('130223', '0', '100', '130200', '滦　县');
INSERT INTO `sys_address_area` VALUES ('130224', '0', '100', '130200', '滦南县');
INSERT INTO `sys_address_area` VALUES ('130225', '0', '100', '130200', '乐亭县');
INSERT INTO `sys_address_area` VALUES ('130227', '0', '100', '130200', '迁西县');
INSERT INTO `sys_address_area` VALUES ('130229', '0', '100', '130200', '玉田县');
INSERT INTO `sys_address_area` VALUES ('130230', '0', '100', '130200', '唐海县');
INSERT INTO `sys_address_area` VALUES ('130281', '0', '100', '130200', '遵化市');
INSERT INTO `sys_address_area` VALUES ('130283', '0', '100', '130200', '迁安市');
INSERT INTO `sys_address_area` VALUES ('130301', '0', '100', '130300', '市辖区');
INSERT INTO `sys_address_area` VALUES ('130302', '0', '100', '130300', '海港区');
INSERT INTO `sys_address_area` VALUES ('130303', '0', '100', '130300', '山海关区');
INSERT INTO `sys_address_area` VALUES ('130304', '0', '100', '130300', '北戴河区');
INSERT INTO `sys_address_area` VALUES ('130321', '0', '100', '130300', '青龙满族自治县');
INSERT INTO `sys_address_area` VALUES ('130322', '0', '100', '130300', '昌黎县');
INSERT INTO `sys_address_area` VALUES ('130323', '0', '100', '130300', '抚宁县');
INSERT INTO `sys_address_area` VALUES ('130324', '0', '100', '130300', '卢龙县');
INSERT INTO `sys_address_area` VALUES ('130401', '0', '100', '130400', '市辖区');
INSERT INTO `sys_address_area` VALUES ('130402', '0', '100', '130400', '邯山区');
INSERT INTO `sys_address_area` VALUES ('130403', '0', '100', '130400', '丛台区');
INSERT INTO `sys_address_area` VALUES ('130404', '0', '100', '130400', '复兴区');
INSERT INTO `sys_address_area` VALUES ('130406', '0', '100', '130400', '峰峰矿区');
INSERT INTO `sys_address_area` VALUES ('130421', '0', '100', '130400', '邯郸县');
INSERT INTO `sys_address_area` VALUES ('130423', '0', '100', '130400', '临漳县');
INSERT INTO `sys_address_area` VALUES ('130424', '0', '100', '130400', '成安县');
INSERT INTO `sys_address_area` VALUES ('130425', '0', '100', '130400', '大名县');
INSERT INTO `sys_address_area` VALUES ('130426', '0', '100', '130400', '涉　县');
INSERT INTO `sys_address_area` VALUES ('130427', '0', '100', '130400', '磁　县');
INSERT INTO `sys_address_area` VALUES ('130428', '0', '100', '130400', '肥乡县');
INSERT INTO `sys_address_area` VALUES ('130429', '0', '100', '130400', '永年县');
INSERT INTO `sys_address_area` VALUES ('130430', '0', '100', '130400', '邱　县');
INSERT INTO `sys_address_area` VALUES ('130431', '0', '100', '130400', '鸡泽县');
INSERT INTO `sys_address_area` VALUES ('130432', '0', '100', '130400', '广平县');
INSERT INTO `sys_address_area` VALUES ('130433', '0', '100', '130400', '馆陶县');
INSERT INTO `sys_address_area` VALUES ('130434', '0', '100', '130400', '魏　县');
INSERT INTO `sys_address_area` VALUES ('130435', '0', '100', '130400', '曲周县');
INSERT INTO `sys_address_area` VALUES ('130481', '0', '100', '130400', '武安市');
INSERT INTO `sys_address_area` VALUES ('130501', '0', '100', '130500', '市辖区');
INSERT INTO `sys_address_area` VALUES ('130502', '0', '100', '130500', '桥东区');
INSERT INTO `sys_address_area` VALUES ('130503', '0', '100', '130500', '桥西区');
INSERT INTO `sys_address_area` VALUES ('130521', '0', '100', '130500', '邢台县');
INSERT INTO `sys_address_area` VALUES ('130522', '0', '100', '130500', '临城县');
INSERT INTO `sys_address_area` VALUES ('130523', '0', '100', '130500', '内丘县');
INSERT INTO `sys_address_area` VALUES ('130524', '0', '100', '130500', '柏乡县');
INSERT INTO `sys_address_area` VALUES ('130525', '0', '100', '130500', '隆尧县');
INSERT INTO `sys_address_area` VALUES ('130526', '0', '100', '130500', '任　县');
INSERT INTO `sys_address_area` VALUES ('130527', '0', '100', '130500', '南和县');
INSERT INTO `sys_address_area` VALUES ('130528', '0', '100', '130500', '宁晋县');
INSERT INTO `sys_address_area` VALUES ('130529', '0', '100', '130500', '巨鹿县');
INSERT INTO `sys_address_area` VALUES ('130530', '0', '100', '130500', '新河县');
INSERT INTO `sys_address_area` VALUES ('130531', '0', '100', '130500', '广宗县');
INSERT INTO `sys_address_area` VALUES ('130532', '0', '100', '130500', '平乡县');
INSERT INTO `sys_address_area` VALUES ('130533', '0', '100', '130500', '威　县');
INSERT INTO `sys_address_area` VALUES ('130534', '0', '100', '130500', '清河县');
INSERT INTO `sys_address_area` VALUES ('130535', '0', '100', '130500', '临西县');
INSERT INTO `sys_address_area` VALUES ('130581', '0', '100', '130500', '南宫市');
INSERT INTO `sys_address_area` VALUES ('130582', '0', '100', '130500', '沙河市');
INSERT INTO `sys_address_area` VALUES ('130601', '0', '100', '130600', '市辖区');
INSERT INTO `sys_address_area` VALUES ('130602', '0', '100', '130600', '新市区');
INSERT INTO `sys_address_area` VALUES ('130603', '0', '100', '130600', '北市区');
INSERT INTO `sys_address_area` VALUES ('130604', '0', '100', '130600', '南市区');
INSERT INTO `sys_address_area` VALUES ('130621', '0', '100', '130600', '满城县');
INSERT INTO `sys_address_area` VALUES ('130622', '0', '100', '130600', '清苑县');
INSERT INTO `sys_address_area` VALUES ('130623', '0', '100', '130600', '涞水县');
INSERT INTO `sys_address_area` VALUES ('130624', '0', '100', '130600', '阜平县');
INSERT INTO `sys_address_area` VALUES ('130625', '0', '100', '130600', '徐水县');
INSERT INTO `sys_address_area` VALUES ('130626', '0', '100', '130600', '定兴县');
INSERT INTO `sys_address_area` VALUES ('130627', '0', '100', '130600', '唐　县');
INSERT INTO `sys_address_area` VALUES ('130628', '0', '100', '130600', '高阳县');
INSERT INTO `sys_address_area` VALUES ('130629', '0', '100', '130600', '容城县');
INSERT INTO `sys_address_area` VALUES ('130630', '0', '100', '130600', '涞源县');
INSERT INTO `sys_address_area` VALUES ('130631', '0', '100', '130600', '望都县');
INSERT INTO `sys_address_area` VALUES ('130632', '0', '100', '130600', '安新县');
INSERT INTO `sys_address_area` VALUES ('130633', '0', '100', '130600', '易　县');
INSERT INTO `sys_address_area` VALUES ('130634', '0', '100', '130600', '曲阳县');
INSERT INTO `sys_address_area` VALUES ('130635', '0', '100', '130600', '蠡　县');
INSERT INTO `sys_address_area` VALUES ('130636', '0', '100', '130600', '顺平县');
INSERT INTO `sys_address_area` VALUES ('130637', '0', '100', '130600', '博野县');
INSERT INTO `sys_address_area` VALUES ('130638', '0', '100', '130600', '雄　县');
INSERT INTO `sys_address_area` VALUES ('130681', '0', '100', '130600', '涿州市');
INSERT INTO `sys_address_area` VALUES ('130682', '0', '100', '130600', '定州市');
INSERT INTO `sys_address_area` VALUES ('130683', '0', '100', '130600', '安国市');
INSERT INTO `sys_address_area` VALUES ('130684', '0', '100', '130600', '高碑店市');
INSERT INTO `sys_address_area` VALUES ('130701', '0', '100', '130700', '市辖区');
INSERT INTO `sys_address_area` VALUES ('130702', '0', '100', '130700', '桥东区');
INSERT INTO `sys_address_area` VALUES ('130703', '0', '100', '130700', '桥西区');
INSERT INTO `sys_address_area` VALUES ('130705', '0', '100', '130700', '宣化区');
INSERT INTO `sys_address_area` VALUES ('130706', '0', '100', '130700', '下花园区');
INSERT INTO `sys_address_area` VALUES ('130721', '0', '100', '130700', '宣化县');
INSERT INTO `sys_address_area` VALUES ('130722', '0', '100', '130700', '张北县');
INSERT INTO `sys_address_area` VALUES ('130723', '0', '100', '130700', '康保县');
INSERT INTO `sys_address_area` VALUES ('130724', '0', '100', '130700', '沽源县');
INSERT INTO `sys_address_area` VALUES ('130725', '0', '100', '130700', '尚义县');
INSERT INTO `sys_address_area` VALUES ('130726', '0', '100', '130700', '蔚　县');
INSERT INTO `sys_address_area` VALUES ('130727', '0', '100', '130700', '阳原县');
INSERT INTO `sys_address_area` VALUES ('130728', '0', '100', '130700', '怀安县');
INSERT INTO `sys_address_area` VALUES ('130729', '0', '100', '130700', '万全县');
INSERT INTO `sys_address_area` VALUES ('130730', '0', '100', '130700', '怀来县');
INSERT INTO `sys_address_area` VALUES ('130731', '0', '100', '130700', '涿鹿县');
INSERT INTO `sys_address_area` VALUES ('130732', '0', '100', '130700', '赤城县');
INSERT INTO `sys_address_area` VALUES ('130733', '0', '100', '130700', '崇礼县');
INSERT INTO `sys_address_area` VALUES ('130801', '0', '100', '130800', '市辖区');
INSERT INTO `sys_address_area` VALUES ('130802', '0', '100', '130800', '双桥区');
INSERT INTO `sys_address_area` VALUES ('130803', '0', '100', '130800', '双滦区');
INSERT INTO `sys_address_area` VALUES ('130804', '0', '100', '130800', '鹰手营子矿区');
INSERT INTO `sys_address_area` VALUES ('130821', '0', '100', '130800', '承德县');
INSERT INTO `sys_address_area` VALUES ('130822', '0', '100', '130800', '兴隆县');
INSERT INTO `sys_address_area` VALUES ('130823', '0', '100', '130800', '平泉县');
INSERT INTO `sys_address_area` VALUES ('130824', '0', '100', '130800', '滦平县');
INSERT INTO `sys_address_area` VALUES ('130825', '0', '100', '130800', '隆化县');
INSERT INTO `sys_address_area` VALUES ('130826', '0', '100', '130800', '丰宁满族自治县');
INSERT INTO `sys_address_area` VALUES ('130827', '0', '100', '130800', '宽城满族自治县');
INSERT INTO `sys_address_area` VALUES ('130828', '0', '100', '130800', '围场满族蒙古族自治县');
INSERT INTO `sys_address_area` VALUES ('130901', '0', '100', '130900', '市辖区');
INSERT INTO `sys_address_area` VALUES ('130902', '0', '100', '130900', '新华区');
INSERT INTO `sys_address_area` VALUES ('130903', '0', '100', '130900', '运河区');
INSERT INTO `sys_address_area` VALUES ('130921', '0', '100', '130900', '沧　县');
INSERT INTO `sys_address_area` VALUES ('130922', '0', '100', '130900', '青　县');
INSERT INTO `sys_address_area` VALUES ('130923', '0', '100', '130900', '东光县');
INSERT INTO `sys_address_area` VALUES ('130924', '0', '100', '130900', '海兴县');
INSERT INTO `sys_address_area` VALUES ('130925', '0', '100', '130900', '盐山县');
INSERT INTO `sys_address_area` VALUES ('130926', '0', '100', '130900', '肃宁县');
INSERT INTO `sys_address_area` VALUES ('130927', '0', '100', '130900', '南皮县');
INSERT INTO `sys_address_area` VALUES ('130928', '0', '100', '130900', '吴桥县');
INSERT INTO `sys_address_area` VALUES ('130929', '0', '100', '130900', '献　县');
INSERT INTO `sys_address_area` VALUES ('130930', '0', '100', '130900', '孟村回族自治县');
INSERT INTO `sys_address_area` VALUES ('130981', '0', '100', '130900', '泊头市');
INSERT INTO `sys_address_area` VALUES ('130982', '0', '100', '130900', '任丘市');
INSERT INTO `sys_address_area` VALUES ('130983', '0', '100', '130900', '黄骅市');
INSERT INTO `sys_address_area` VALUES ('130984', '0', '100', '130900', '河间市');
INSERT INTO `sys_address_area` VALUES ('131001', '0', '100', '131000', '市辖区');
INSERT INTO `sys_address_area` VALUES ('131002', '0', '100', '131000', '安次区');
INSERT INTO `sys_address_area` VALUES ('131003', '0', '100', '131000', '广阳区');
INSERT INTO `sys_address_area` VALUES ('131022', '0', '100', '131000', '固安县');
INSERT INTO `sys_address_area` VALUES ('131023', '0', '100', '131000', '永清县');
INSERT INTO `sys_address_area` VALUES ('131024', '0', '100', '131000', '香河县');
INSERT INTO `sys_address_area` VALUES ('131025', '0', '100', '131000', '大城县');
INSERT INTO `sys_address_area` VALUES ('131026', '0', '100', '131000', '文安县');
INSERT INTO `sys_address_area` VALUES ('131028', '0', '100', '131000', '大厂回族自治县');
INSERT INTO `sys_address_area` VALUES ('131081', '0', '100', '131000', '霸州市');
INSERT INTO `sys_address_area` VALUES ('131082', '0', '100', '131000', '三河市');
INSERT INTO `sys_address_area` VALUES ('131101', '0', '100', '131100', '市辖区');
INSERT INTO `sys_address_area` VALUES ('131102', '0', '100', '131100', '桃城区');
INSERT INTO `sys_address_area` VALUES ('131121', '0', '100', '131100', '枣强县');
INSERT INTO `sys_address_area` VALUES ('131122', '0', '100', '131100', '武邑县');
INSERT INTO `sys_address_area` VALUES ('131123', '0', '100', '131100', '武强县');
INSERT INTO `sys_address_area` VALUES ('131124', '0', '100', '131100', '饶阳县');
INSERT INTO `sys_address_area` VALUES ('131125', '0', '100', '131100', '安平县');
INSERT INTO `sys_address_area` VALUES ('131126', '0', '100', '131100', '故城县');
INSERT INTO `sys_address_area` VALUES ('131127', '0', '100', '131100', '景　县');
INSERT INTO `sys_address_area` VALUES ('131128', '0', '100', '131100', '阜城县');
INSERT INTO `sys_address_area` VALUES ('131181', '0', '100', '131100', '冀州市');
INSERT INTO `sys_address_area` VALUES ('131182', '0', '100', '131100', '深州市');
INSERT INTO `sys_address_area` VALUES ('140101', '0', '100', '140100', '市辖区');
INSERT INTO `sys_address_area` VALUES ('140105', '0', '100', '140100', '小店区');
INSERT INTO `sys_address_area` VALUES ('140106', '0', '100', '140100', '迎泽区');
INSERT INTO `sys_address_area` VALUES ('140107', '0', '100', '140100', '杏花岭区');
INSERT INTO `sys_address_area` VALUES ('140108', '0', '100', '140100', '尖草坪区');
INSERT INTO `sys_address_area` VALUES ('140109', '0', '100', '140100', '万柏林区');
INSERT INTO `sys_address_area` VALUES ('140110', '0', '100', '140100', '晋源区');
INSERT INTO `sys_address_area` VALUES ('140121', '0', '100', '140100', '清徐县');
INSERT INTO `sys_address_area` VALUES ('140122', '0', '100', '140100', '阳曲县');
INSERT INTO `sys_address_area` VALUES ('140123', '0', '100', '140100', '娄烦县');
INSERT INTO `sys_address_area` VALUES ('140181', '0', '100', '140100', '古交市');
INSERT INTO `sys_address_area` VALUES ('140201', '0', '100', '140200', '市辖区');
INSERT INTO `sys_address_area` VALUES ('140202', '0', '100', '140200', '城　区');
INSERT INTO `sys_address_area` VALUES ('140203', '0', '100', '140200', '矿　区');
INSERT INTO `sys_address_area` VALUES ('140211', '0', '100', '140200', '南郊区');
INSERT INTO `sys_address_area` VALUES ('140212', '0', '100', '140200', '新荣区');
INSERT INTO `sys_address_area` VALUES ('140221', '0', '100', '140200', '阳高县');
INSERT INTO `sys_address_area` VALUES ('140222', '0', '100', '140200', '天镇县');
INSERT INTO `sys_address_area` VALUES ('140223', '0', '100', '140200', '广灵县');
INSERT INTO `sys_address_area` VALUES ('140224', '0', '100', '140200', '灵丘县');
INSERT INTO `sys_address_area` VALUES ('140225', '0', '100', '140200', '浑源县');
INSERT INTO `sys_address_area` VALUES ('140226', '0', '100', '140200', '左云县');
INSERT INTO `sys_address_area` VALUES ('140227', '0', '100', '140200', '大同县');
INSERT INTO `sys_address_area` VALUES ('140301', '0', '100', '140300', '市辖区');
INSERT INTO `sys_address_area` VALUES ('140302', '0', '100', '140300', '城　区');
INSERT INTO `sys_address_area` VALUES ('140303', '0', '100', '140300', '矿　区');
INSERT INTO `sys_address_area` VALUES ('140311', '0', '100', '140300', '郊　区');
INSERT INTO `sys_address_area` VALUES ('140321', '0', '100', '140300', '平定县');
INSERT INTO `sys_address_area` VALUES ('140322', '0', '100', '140300', '盂　县');
INSERT INTO `sys_address_area` VALUES ('140401', '0', '100', '140400', '市辖区');
INSERT INTO `sys_address_area` VALUES ('140402', '0', '100', '140400', '城　区');
INSERT INTO `sys_address_area` VALUES ('140411', '0', '100', '140400', '郊　区');
INSERT INTO `sys_address_area` VALUES ('140421', '0', '100', '140400', '长治县');
INSERT INTO `sys_address_area` VALUES ('140423', '0', '100', '140400', '襄垣县');
INSERT INTO `sys_address_area` VALUES ('140424', '0', '100', '140400', '屯留县');
INSERT INTO `sys_address_area` VALUES ('140425', '0', '100', '140400', '平顺县');
INSERT INTO `sys_address_area` VALUES ('140426', '0', '100', '140400', '黎城县');
INSERT INTO `sys_address_area` VALUES ('140427', '0', '100', '140400', '壶关县');
INSERT INTO `sys_address_area` VALUES ('140428', '0', '100', '140400', '长子县');
INSERT INTO `sys_address_area` VALUES ('140429', '0', '100', '140400', '武乡县');
INSERT INTO `sys_address_area` VALUES ('140430', '0', '100', '140400', '沁　县');
INSERT INTO `sys_address_area` VALUES ('140431', '0', '100', '140400', '沁源县');
INSERT INTO `sys_address_area` VALUES ('140481', '0', '100', '140400', '潞城市');
INSERT INTO `sys_address_area` VALUES ('140501', '0', '100', '140500', '市辖区');
INSERT INTO `sys_address_area` VALUES ('140502', '0', '100', '140500', '城　区');
INSERT INTO `sys_address_area` VALUES ('140521', '0', '100', '140500', '沁水县');
INSERT INTO `sys_address_area` VALUES ('140522', '0', '100', '140500', '阳城县');
INSERT INTO `sys_address_area` VALUES ('140524', '0', '100', '140500', '陵川县');
INSERT INTO `sys_address_area` VALUES ('140525', '0', '100', '140500', '泽州县');
INSERT INTO `sys_address_area` VALUES ('140581', '0', '100', '140500', '高平市');
INSERT INTO `sys_address_area` VALUES ('140601', '0', '100', '140600', '市辖区');
INSERT INTO `sys_address_area` VALUES ('140602', '0', '100', '140600', '朔城区');
INSERT INTO `sys_address_area` VALUES ('140603', '0', '100', '140600', '平鲁区');
INSERT INTO `sys_address_area` VALUES ('140621', '0', '100', '140600', '山阴县');
INSERT INTO `sys_address_area` VALUES ('140622', '0', '100', '140600', '应　县');
INSERT INTO `sys_address_area` VALUES ('140623', '0', '100', '140600', '右玉县');
INSERT INTO `sys_address_area` VALUES ('140624', '0', '100', '140600', '怀仁县');
INSERT INTO `sys_address_area` VALUES ('140701', '0', '100', '140700', '市辖区');
INSERT INTO `sys_address_area` VALUES ('140702', '0', '100', '140700', '榆次区');
INSERT INTO `sys_address_area` VALUES ('140721', '0', '100', '140700', '榆社县');
INSERT INTO `sys_address_area` VALUES ('140722', '0', '100', '140700', '左权县');
INSERT INTO `sys_address_area` VALUES ('140723', '0', '100', '140700', '和顺县');
INSERT INTO `sys_address_area` VALUES ('140724', '0', '100', '140700', '昔阳县');
INSERT INTO `sys_address_area` VALUES ('140725', '0', '100', '140700', '寿阳县');
INSERT INTO `sys_address_area` VALUES ('140726', '0', '100', '140700', '太谷县');
INSERT INTO `sys_address_area` VALUES ('140727', '0', '100', '140700', '祁　县');
INSERT INTO `sys_address_area` VALUES ('140728', '0', '100', '140700', '平遥县');
INSERT INTO `sys_address_area` VALUES ('140729', '0', '100', '140700', '灵石县');
INSERT INTO `sys_address_area` VALUES ('140781', '0', '100', '140700', '介休市');
INSERT INTO `sys_address_area` VALUES ('140801', '0', '100', '140800', '市辖区');
INSERT INTO `sys_address_area` VALUES ('140802', '0', '100', '140800', '盐湖区');
INSERT INTO `sys_address_area` VALUES ('140821', '0', '100', '140800', '临猗县');
INSERT INTO `sys_address_area` VALUES ('140822', '0', '100', '140800', '万荣县');
INSERT INTO `sys_address_area` VALUES ('140823', '0', '100', '140800', '闻喜县');
INSERT INTO `sys_address_area` VALUES ('140824', '0', '100', '140800', '稷山县');
INSERT INTO `sys_address_area` VALUES ('140825', '0', '100', '140800', '新绛县');
INSERT INTO `sys_address_area` VALUES ('140826', '0', '100', '140800', '绛　县');
INSERT INTO `sys_address_area` VALUES ('140827', '0', '100', '140800', '垣曲县');
INSERT INTO `sys_address_area` VALUES ('140828', '0', '100', '140800', '夏　县');
INSERT INTO `sys_address_area` VALUES ('140829', '0', '100', '140800', '平陆县');
INSERT INTO `sys_address_area` VALUES ('140830', '0', '100', '140800', '芮城县');
INSERT INTO `sys_address_area` VALUES ('140881', '0', '100', '140800', '永济市');
INSERT INTO `sys_address_area` VALUES ('140882', '0', '100', '140800', '河津市');
INSERT INTO `sys_address_area` VALUES ('140901', '0', '100', '140900', '市辖区');
INSERT INTO `sys_address_area` VALUES ('140902', '0', '100', '140900', '忻府区');
INSERT INTO `sys_address_area` VALUES ('140921', '0', '100', '140900', '定襄县');
INSERT INTO `sys_address_area` VALUES ('140922', '0', '100', '140900', '五台县');
INSERT INTO `sys_address_area` VALUES ('140923', '0', '100', '140900', '代　县');
INSERT INTO `sys_address_area` VALUES ('140924', '0', '100', '140900', '繁峙县');
INSERT INTO `sys_address_area` VALUES ('140925', '0', '100', '140900', '宁武县');
INSERT INTO `sys_address_area` VALUES ('140926', '0', '100', '140900', '静乐县');
INSERT INTO `sys_address_area` VALUES ('140927', '0', '100', '140900', '神池县');
INSERT INTO `sys_address_area` VALUES ('140928', '0', '100', '140900', '五寨县');
INSERT INTO `sys_address_area` VALUES ('140929', '0', '100', '140900', '岢岚县');
INSERT INTO `sys_address_area` VALUES ('140930', '0', '100', '140900', '河曲县');
INSERT INTO `sys_address_area` VALUES ('140931', '0', '100', '140900', '保德县');
INSERT INTO `sys_address_area` VALUES ('140932', '0', '100', '140900', '偏关县');
INSERT INTO `sys_address_area` VALUES ('140981', '0', '100', '140900', '原平市');
INSERT INTO `sys_address_area` VALUES ('141001', '0', '100', '141000', '市辖区');
INSERT INTO `sys_address_area` VALUES ('141002', '0', '100', '141000', '尧都区');
INSERT INTO `sys_address_area` VALUES ('141021', '0', '100', '141000', '曲沃县');
INSERT INTO `sys_address_area` VALUES ('141022', '0', '100', '141000', '翼城县');
INSERT INTO `sys_address_area` VALUES ('141023', '0', '100', '141000', '襄汾县');
INSERT INTO `sys_address_area` VALUES ('141024', '0', '100', '141000', '洪洞县');
INSERT INTO `sys_address_area` VALUES ('141025', '0', '100', '141000', '古　县');
INSERT INTO `sys_address_area` VALUES ('141026', '0', '100', '141000', '安泽县');
INSERT INTO `sys_address_area` VALUES ('141027', '0', '100', '141000', '浮山县');
INSERT INTO `sys_address_area` VALUES ('141028', '0', '100', '141000', '吉　县');
INSERT INTO `sys_address_area` VALUES ('141029', '0', '100', '141000', '乡宁县');
INSERT INTO `sys_address_area` VALUES ('141030', '0', '100', '141000', '大宁县');
INSERT INTO `sys_address_area` VALUES ('141031', '0', '100', '141000', '隰　县');
INSERT INTO `sys_address_area` VALUES ('141032', '0', '100', '141000', '永和县');
INSERT INTO `sys_address_area` VALUES ('141033', '0', '100', '141000', '蒲　县');
INSERT INTO `sys_address_area` VALUES ('141034', '0', '100', '141000', '汾西县');
INSERT INTO `sys_address_area` VALUES ('141081', '0', '100', '141000', '侯马市');
INSERT INTO `sys_address_area` VALUES ('141082', '0', '100', '141000', '霍州市');
INSERT INTO `sys_address_area` VALUES ('141101', '0', '100', '141100', '市辖区');
INSERT INTO `sys_address_area` VALUES ('141102', '0', '100', '141100', '离石区');
INSERT INTO `sys_address_area` VALUES ('141121', '0', '100', '141100', '文水县');
INSERT INTO `sys_address_area` VALUES ('141122', '0', '100', '141100', '交城县');
INSERT INTO `sys_address_area` VALUES ('141123', '0', '100', '141100', '兴　县');
INSERT INTO `sys_address_area` VALUES ('141124', '0', '100', '141100', '临　县');
INSERT INTO `sys_address_area` VALUES ('141125', '0', '100', '141100', '柳林县');
INSERT INTO `sys_address_area` VALUES ('141126', '0', '100', '141100', '石楼县');
INSERT INTO `sys_address_area` VALUES ('141127', '0', '100', '141100', '岚　县');
INSERT INTO `sys_address_area` VALUES ('141128', '0', '100', '141100', '方山县');
INSERT INTO `sys_address_area` VALUES ('141129', '0', '100', '141100', '中阳县');
INSERT INTO `sys_address_area` VALUES ('141130', '0', '100', '141100', '交口县');
INSERT INTO `sys_address_area` VALUES ('141181', '0', '100', '141100', '孝义市');
INSERT INTO `sys_address_area` VALUES ('141182', '0', '100', '141100', '汾阳市');
INSERT INTO `sys_address_area` VALUES ('150101', '0', '100', '150100', '市辖区');
INSERT INTO `sys_address_area` VALUES ('150102', '0', '100', '150100', '新城区');
INSERT INTO `sys_address_area` VALUES ('150103', '0', '100', '150100', '回民区');
INSERT INTO `sys_address_area` VALUES ('150104', '0', '100', '150100', '玉泉区');
INSERT INTO `sys_address_area` VALUES ('150105', '0', '100', '150100', '赛罕区');
INSERT INTO `sys_address_area` VALUES ('150121', '0', '100', '150100', '土默特左旗');
INSERT INTO `sys_address_area` VALUES ('150122', '0', '100', '150100', '托克托县');
INSERT INTO `sys_address_area` VALUES ('150123', '0', '100', '150100', '和林格尔县');
INSERT INTO `sys_address_area` VALUES ('150124', '0', '100', '150100', '清水河县');
INSERT INTO `sys_address_area` VALUES ('150125', '0', '100', '150100', '武川县');
INSERT INTO `sys_address_area` VALUES ('150201', '0', '100', '150200', '市辖区');
INSERT INTO `sys_address_area` VALUES ('150202', '0', '100', '150200', '东河区');
INSERT INTO `sys_address_area` VALUES ('150203', '0', '100', '150200', '昆都仑区');
INSERT INTO `sys_address_area` VALUES ('150204', '0', '100', '150200', '青山区');
INSERT INTO `sys_address_area` VALUES ('150205', '0', '100', '150200', '石拐区');
INSERT INTO `sys_address_area` VALUES ('150206', '0', '100', '150200', '白云矿区');
INSERT INTO `sys_address_area` VALUES ('150207', '0', '100', '150200', '九原区');
INSERT INTO `sys_address_area` VALUES ('150221', '0', '100', '150200', '土默特右旗');
INSERT INTO `sys_address_area` VALUES ('150222', '0', '100', '150200', '固阳县');
INSERT INTO `sys_address_area` VALUES ('150223', '0', '100', '150200', '达尔罕茂明安联合旗');
INSERT INTO `sys_address_area` VALUES ('150301', '0', '100', '150300', '市辖区');
INSERT INTO `sys_address_area` VALUES ('150302', '0', '100', '150300', '海勃湾区');
INSERT INTO `sys_address_area` VALUES ('150303', '0', '100', '150300', '海南区');
INSERT INTO `sys_address_area` VALUES ('150304', '0', '100', '150300', '乌达区');
INSERT INTO `sys_address_area` VALUES ('150401', '0', '100', '150400', '市辖区');
INSERT INTO `sys_address_area` VALUES ('150402', '0', '100', '150400', '红山区');
INSERT INTO `sys_address_area` VALUES ('150403', '0', '100', '150400', '元宝山区');
INSERT INTO `sys_address_area` VALUES ('150404', '0', '100', '150400', '松山区');
INSERT INTO `sys_address_area` VALUES ('150421', '0', '100', '150400', '阿鲁科尔沁旗');
INSERT INTO `sys_address_area` VALUES ('150422', '0', '100', '150400', '巴林左旗');
INSERT INTO `sys_address_area` VALUES ('150423', '0', '100', '150400', '巴林右旗');
INSERT INTO `sys_address_area` VALUES ('150424', '0', '100', '150400', '林西县');
INSERT INTO `sys_address_area` VALUES ('150425', '0', '100', '150400', '克什克腾旗');
INSERT INTO `sys_address_area` VALUES ('150426', '0', '100', '150400', '翁牛特旗');
INSERT INTO `sys_address_area` VALUES ('150428', '0', '100', '150400', '喀喇沁旗');
INSERT INTO `sys_address_area` VALUES ('150429', '0', '100', '150400', '宁城县');
INSERT INTO `sys_address_area` VALUES ('150430', '0', '100', '150400', '敖汉旗');
INSERT INTO `sys_address_area` VALUES ('150501', '0', '100', '150500', '市辖区');
INSERT INTO `sys_address_area` VALUES ('150502', '0', '100', '150500', '科尔沁区');
INSERT INTO `sys_address_area` VALUES ('150521', '0', '100', '150500', '科尔沁左翼中旗');
INSERT INTO `sys_address_area` VALUES ('150522', '0', '100', '150500', '科尔沁左翼后旗');
INSERT INTO `sys_address_area` VALUES ('150523', '0', '100', '150500', '开鲁县');
INSERT INTO `sys_address_area` VALUES ('150524', '0', '100', '150500', '库伦旗');
INSERT INTO `sys_address_area` VALUES ('150525', '0', '100', '150500', '奈曼旗');
INSERT INTO `sys_address_area` VALUES ('150526', '0', '100', '150500', '扎鲁特旗');
INSERT INTO `sys_address_area` VALUES ('150581', '0', '100', '150500', '霍林郭勒市');
INSERT INTO `sys_address_area` VALUES ('150602', '0', '100', '150600', '东胜区');
INSERT INTO `sys_address_area` VALUES ('150621', '0', '100', '150600', '达拉特旗');
INSERT INTO `sys_address_area` VALUES ('150622', '0', '100', '150600', '准格尔旗');
INSERT INTO `sys_address_area` VALUES ('150623', '0', '100', '150600', '鄂托克前旗');
INSERT INTO `sys_address_area` VALUES ('150624', '0', '100', '150600', '鄂托克旗');
INSERT INTO `sys_address_area` VALUES ('150625', '0', '100', '150600', '杭锦旗');
INSERT INTO `sys_address_area` VALUES ('150626', '0', '100', '150600', '乌审旗');
INSERT INTO `sys_address_area` VALUES ('150627', '0', '100', '150600', '伊金霍洛旗');
INSERT INTO `sys_address_area` VALUES ('150701', '0', '100', '150700', '市辖区');
INSERT INTO `sys_address_area` VALUES ('150702', '0', '100', '150700', '海拉尔区');
INSERT INTO `sys_address_area` VALUES ('150721', '0', '100', '150700', '阿荣旗');
INSERT INTO `sys_address_area` VALUES ('150722', '0', '100', '150700', '莫力达瓦达斡尔族自治旗');
INSERT INTO `sys_address_area` VALUES ('150723', '0', '100', '150700', '鄂伦春自治旗');
INSERT INTO `sys_address_area` VALUES ('150724', '0', '100', '150700', '鄂温克族自治旗');
INSERT INTO `sys_address_area` VALUES ('150725', '0', '100', '150700', '陈巴尔虎旗');
INSERT INTO `sys_address_area` VALUES ('150726', '0', '100', '150700', '新巴尔虎左旗');
INSERT INTO `sys_address_area` VALUES ('150727', '0', '100', '150700', '新巴尔虎右旗');
INSERT INTO `sys_address_area` VALUES ('150781', '0', '100', '150700', '满洲里市');
INSERT INTO `sys_address_area` VALUES ('150782', '0', '100', '150700', '牙克石市');
INSERT INTO `sys_address_area` VALUES ('150783', '0', '100', '150700', '扎兰屯市');
INSERT INTO `sys_address_area` VALUES ('150784', '0', '100', '150700', '额尔古纳市');
INSERT INTO `sys_address_area` VALUES ('150785', '0', '100', '150700', '根河市');
INSERT INTO `sys_address_area` VALUES ('150801', '0', '100', '150800', '市辖区');
INSERT INTO `sys_address_area` VALUES ('150802', '0', '100', '150800', '临河区');
INSERT INTO `sys_address_area` VALUES ('150821', '0', '100', '150800', '五原县');
INSERT INTO `sys_address_area` VALUES ('150822', '0', '100', '150800', '磴口县');
INSERT INTO `sys_address_area` VALUES ('150823', '0', '100', '150800', '乌拉特前旗');
INSERT INTO `sys_address_area` VALUES ('150824', '0', '100', '150800', '乌拉特中旗');
INSERT INTO `sys_address_area` VALUES ('150825', '0', '100', '150800', '乌拉特后旗');
INSERT INTO `sys_address_area` VALUES ('150826', '0', '100', '150800', '杭锦后旗');
INSERT INTO `sys_address_area` VALUES ('150901', '0', '100', '150900', '市辖区');
INSERT INTO `sys_address_area` VALUES ('150902', '0', '100', '150900', '集宁区');
INSERT INTO `sys_address_area` VALUES ('150921', '0', '100', '150900', '卓资县');
INSERT INTO `sys_address_area` VALUES ('150922', '0', '100', '150900', '化德县');
INSERT INTO `sys_address_area` VALUES ('150923', '0', '100', '150900', '商都县');
INSERT INTO `sys_address_area` VALUES ('150924', '0', '100', '150900', '兴和县');
INSERT INTO `sys_address_area` VALUES ('150925', '0', '100', '150900', '凉城县');
INSERT INTO `sys_address_area` VALUES ('150926', '0', '100', '150900', '察哈尔右翼前旗');
INSERT INTO `sys_address_area` VALUES ('150927', '0', '100', '150900', '察哈尔右翼中旗');
INSERT INTO `sys_address_area` VALUES ('150928', '0', '100', '150900', '察哈尔右翼后旗');
INSERT INTO `sys_address_area` VALUES ('150929', '0', '100', '150900', '四子王旗');
INSERT INTO `sys_address_area` VALUES ('150981', '0', '100', '150900', '丰镇市');
INSERT INTO `sys_address_area` VALUES ('152201', '0', '100', '152200', '乌兰浩特市');
INSERT INTO `sys_address_area` VALUES ('152202', '0', '100', '152200', '阿尔山市');
INSERT INTO `sys_address_area` VALUES ('152221', '0', '100', '152200', '科尔沁右翼前旗');
INSERT INTO `sys_address_area` VALUES ('152222', '0', '100', '152200', '科尔沁右翼中旗');
INSERT INTO `sys_address_area` VALUES ('152223', '0', '100', '152200', '扎赉特旗');
INSERT INTO `sys_address_area` VALUES ('152224', '0', '100', '152200', '突泉县');
INSERT INTO `sys_address_area` VALUES ('152501', '0', '100', '152500', '二连浩特市');
INSERT INTO `sys_address_area` VALUES ('152502', '0', '100', '152500', '锡林浩特市');
INSERT INTO `sys_address_area` VALUES ('152522', '0', '100', '152500', '阿巴嘎旗');
INSERT INTO `sys_address_area` VALUES ('152523', '0', '100', '152500', '苏尼特左旗');
INSERT INTO `sys_address_area` VALUES ('152524', '0', '100', '152500', '苏尼特右旗');
INSERT INTO `sys_address_area` VALUES ('152525', '0', '100', '152500', '东乌珠穆沁旗');
INSERT INTO `sys_address_area` VALUES ('152526', '0', '100', '152500', '西乌珠穆沁旗');
INSERT INTO `sys_address_area` VALUES ('152527', '0', '100', '152500', '太仆寺旗');
INSERT INTO `sys_address_area` VALUES ('152528', '0', '100', '152500', '镶黄旗');
INSERT INTO `sys_address_area` VALUES ('152529', '0', '100', '152500', '正镶白旗');
INSERT INTO `sys_address_area` VALUES ('152530', '0', '100', '152500', '正蓝旗');
INSERT INTO `sys_address_area` VALUES ('152531', '0', '100', '152500', '多伦县');
INSERT INTO `sys_address_area` VALUES ('152921', '0', '100', '152900', '阿拉善左旗');
INSERT INTO `sys_address_area` VALUES ('152922', '0', '100', '152900', '阿拉善右旗');
INSERT INTO `sys_address_area` VALUES ('152923', '0', '100', '152900', '额济纳旗');
INSERT INTO `sys_address_area` VALUES ('210101', '0', '100', '210100', '市辖区');
INSERT INTO `sys_address_area` VALUES ('210102', '0', '100', '210100', '和平区');
INSERT INTO `sys_address_area` VALUES ('210103', '0', '100', '210100', '沈河区');
INSERT INTO `sys_address_area` VALUES ('210104', '0', '100', '210100', '大东区');
INSERT INTO `sys_address_area` VALUES ('210105', '0', '100', '210100', '皇姑区');
INSERT INTO `sys_address_area` VALUES ('210106', '0', '100', '210100', '铁西区');
INSERT INTO `sys_address_area` VALUES ('210111', '0', '100', '210100', '苏家屯区');
INSERT INTO `sys_address_area` VALUES ('210112', '0', '100', '210100', '东陵区');
INSERT INTO `sys_address_area` VALUES ('210113', '0', '100', '210100', '新城子区');
INSERT INTO `sys_address_area` VALUES ('210114', '0', '100', '210100', '于洪区');
INSERT INTO `sys_address_area` VALUES ('210122', '0', '100', '210100', '辽中县');
INSERT INTO `sys_address_area` VALUES ('210123', '0', '100', '210100', '康平县');
INSERT INTO `sys_address_area` VALUES ('210124', '0', '100', '210100', '法库县');
INSERT INTO `sys_address_area` VALUES ('210181', '0', '100', '210100', '新民市');
INSERT INTO `sys_address_area` VALUES ('210201', '0', '100', '210200', '市辖区');
INSERT INTO `sys_address_area` VALUES ('210202', '0', '100', '210200', '中山区');
INSERT INTO `sys_address_area` VALUES ('210203', '0', '100', '210200', '西岗区');
INSERT INTO `sys_address_area` VALUES ('210204', '0', '100', '210200', '沙河口区');
INSERT INTO `sys_address_area` VALUES ('210211', '0', '100', '210200', '甘井子区');
INSERT INTO `sys_address_area` VALUES ('210212', '0', '100', '210200', '旅顺口区');
INSERT INTO `sys_address_area` VALUES ('210213', '0', '100', '210200', '金州区');
INSERT INTO `sys_address_area` VALUES ('210224', '0', '100', '210200', '长海县');
INSERT INTO `sys_address_area` VALUES ('210281', '0', '100', '210200', '瓦房店市');
INSERT INTO `sys_address_area` VALUES ('210282', '0', '100', '210200', '普兰店市');
INSERT INTO `sys_address_area` VALUES ('210283', '0', '100', '210200', '庄河市');
INSERT INTO `sys_address_area` VALUES ('210301', '0', '100', '210300', '市辖区');
INSERT INTO `sys_address_area` VALUES ('210302', '0', '100', '210300', '铁东区');
INSERT INTO `sys_address_area` VALUES ('210303', '0', '100', '210300', '铁西区');
INSERT INTO `sys_address_area` VALUES ('210304', '0', '100', '210300', '立山区');
INSERT INTO `sys_address_area` VALUES ('210311', '0', '100', '210300', '千山区');
INSERT INTO `sys_address_area` VALUES ('210321', '0', '100', '210300', '台安县');
INSERT INTO `sys_address_area` VALUES ('210323', '0', '100', '210300', '岫岩满族自治县');
INSERT INTO `sys_address_area` VALUES ('210381', '0', '100', '210300', '海城市');
INSERT INTO `sys_address_area` VALUES ('210401', '0', '100', '210400', '市辖区');
INSERT INTO `sys_address_area` VALUES ('210402', '0', '100', '210400', '新抚区');
INSERT INTO `sys_address_area` VALUES ('210403', '0', '100', '210400', '东洲区');
INSERT INTO `sys_address_area` VALUES ('210404', '0', '100', '210400', '望花区');
INSERT INTO `sys_address_area` VALUES ('210411', '0', '100', '210400', '顺城区');
INSERT INTO `sys_address_area` VALUES ('210421', '0', '100', '210400', '抚顺县');
INSERT INTO `sys_address_area` VALUES ('210422', '0', '100', '210400', '新宾满族自治县');
INSERT INTO `sys_address_area` VALUES ('210423', '0', '100', '210400', '清原满族自治县');
INSERT INTO `sys_address_area` VALUES ('210501', '0', '100', '210500', '市辖区');
INSERT INTO `sys_address_area` VALUES ('210502', '0', '100', '210500', '平山区');
INSERT INTO `sys_address_area` VALUES ('210503', '0', '100', '210500', '溪湖区');
INSERT INTO `sys_address_area` VALUES ('210504', '0', '100', '210500', '明山区');
INSERT INTO `sys_address_area` VALUES ('210505', '0', '100', '210500', '南芬区');
INSERT INTO `sys_address_area` VALUES ('210521', '0', '100', '210500', '本溪满族自治县');
INSERT INTO `sys_address_area` VALUES ('210522', '0', '100', '210500', '桓仁满族自治县');
INSERT INTO `sys_address_area` VALUES ('210601', '0', '100', '210600', '市辖区');
INSERT INTO `sys_address_area` VALUES ('210602', '0', '100', '210600', '元宝区');
INSERT INTO `sys_address_area` VALUES ('210603', '0', '100', '210600', '振兴区');
INSERT INTO `sys_address_area` VALUES ('210604', '0', '100', '210600', '振安区');
INSERT INTO `sys_address_area` VALUES ('210624', '0', '100', '210600', '宽甸满族自治县');
INSERT INTO `sys_address_area` VALUES ('210681', '0', '100', '210600', '东港市');
INSERT INTO `sys_address_area` VALUES ('210682', '0', '100', '210600', '凤城市');
INSERT INTO `sys_address_area` VALUES ('210701', '0', '100', '210700', '市辖区');
INSERT INTO `sys_address_area` VALUES ('210702', '0', '100', '210700', '古塔区');
INSERT INTO `sys_address_area` VALUES ('210703', '0', '100', '210700', '凌河区');
INSERT INTO `sys_address_area` VALUES ('210711', '0', '100', '210700', '太和区');
INSERT INTO `sys_address_area` VALUES ('210726', '0', '100', '210700', '黑山县');
INSERT INTO `sys_address_area` VALUES ('210727', '0', '100', '210700', '义　县');
INSERT INTO `sys_address_area` VALUES ('210781', '0', '100', '210700', '凌海市');
INSERT INTO `sys_address_area` VALUES ('210782', '0', '100', '210700', '北宁市');
INSERT INTO `sys_address_area` VALUES ('210801', '0', '100', '210800', '市辖区');
INSERT INTO `sys_address_area` VALUES ('210802', '0', '100', '210800', '站前区');
INSERT INTO `sys_address_area` VALUES ('210803', '0', '100', '210800', '西市区');
INSERT INTO `sys_address_area` VALUES ('210804', '0', '100', '210800', '鲅鱼圈区');
INSERT INTO `sys_address_area` VALUES ('210811', '0', '100', '210800', '老边区');
INSERT INTO `sys_address_area` VALUES ('210881', '0', '100', '210800', '盖州市');
INSERT INTO `sys_address_area` VALUES ('210882', '0', '100', '210800', '大石桥市');
INSERT INTO `sys_address_area` VALUES ('210901', '0', '100', '210900', '市辖区');
INSERT INTO `sys_address_area` VALUES ('210902', '0', '100', '210900', '海州区');
INSERT INTO `sys_address_area` VALUES ('210903', '0', '100', '210900', '新邱区');
INSERT INTO `sys_address_area` VALUES ('210904', '0', '100', '210900', '太平区');
INSERT INTO `sys_address_area` VALUES ('210905', '0', '100', '210900', '清河门区');
INSERT INTO `sys_address_area` VALUES ('210911', '0', '100', '210900', '细河区');
INSERT INTO `sys_address_area` VALUES ('210921', '0', '100', '210900', '阜新蒙古族自治县');
INSERT INTO `sys_address_area` VALUES ('210922', '0', '100', '210900', '彰武县');
INSERT INTO `sys_address_area` VALUES ('211001', '0', '100', '211000', '市辖区');
INSERT INTO `sys_address_area` VALUES ('211002', '0', '100', '211000', '白塔区');
INSERT INTO `sys_address_area` VALUES ('211003', '0', '100', '211000', '文圣区');
INSERT INTO `sys_address_area` VALUES ('211004', '0', '100', '211000', '宏伟区');
INSERT INTO `sys_address_area` VALUES ('211005', '0', '100', '211000', '弓长岭区');
INSERT INTO `sys_address_area` VALUES ('211011', '0', '100', '211000', '太子河区');
INSERT INTO `sys_address_area` VALUES ('211021', '0', '100', '211000', '辽阳县');
INSERT INTO `sys_address_area` VALUES ('211081', '0', '100', '211000', '灯塔市');
INSERT INTO `sys_address_area` VALUES ('211101', '0', '100', '211100', '市辖区');
INSERT INTO `sys_address_area` VALUES ('211102', '0', '100', '211100', '双台子区');
INSERT INTO `sys_address_area` VALUES ('211103', '0', '100', '211100', '兴隆台区');
INSERT INTO `sys_address_area` VALUES ('211121', '0', '100', '211100', '大洼县');
INSERT INTO `sys_address_area` VALUES ('211122', '0', '100', '211100', '盘山县');
INSERT INTO `sys_address_area` VALUES ('211201', '0', '100', '211200', '市辖区');
INSERT INTO `sys_address_area` VALUES ('211202', '0', '100', '211200', '银州区');
INSERT INTO `sys_address_area` VALUES ('211204', '0', '100', '211200', '清河区');
INSERT INTO `sys_address_area` VALUES ('211221', '0', '100', '211200', '铁岭县');
INSERT INTO `sys_address_area` VALUES ('211223', '0', '100', '211200', '西丰县');
INSERT INTO `sys_address_area` VALUES ('211224', '0', '100', '211200', '昌图县');
INSERT INTO `sys_address_area` VALUES ('211281', '0', '100', '211200', '调兵山市');
INSERT INTO `sys_address_area` VALUES ('211282', '0', '100', '211200', '开原市');
INSERT INTO `sys_address_area` VALUES ('211301', '0', '100', '211300', '市辖区');
INSERT INTO `sys_address_area` VALUES ('211302', '0', '100', '211300', '双塔区');
INSERT INTO `sys_address_area` VALUES ('211303', '0', '100', '211300', '龙城区');
INSERT INTO `sys_address_area` VALUES ('211321', '0', '100', '211300', '朝阳县');
INSERT INTO `sys_address_area` VALUES ('211322', '0', '100', '211300', '建平县');
INSERT INTO `sys_address_area` VALUES ('211324', '0', '100', '211300', '喀喇沁左翼蒙古族自治县');
INSERT INTO `sys_address_area` VALUES ('211381', '0', '100', '211300', '北票市');
INSERT INTO `sys_address_area` VALUES ('211382', '0', '100', '211300', '凌源市');
INSERT INTO `sys_address_area` VALUES ('211401', '0', '100', '211400', '市辖区');
INSERT INTO `sys_address_area` VALUES ('211402', '0', '100', '211400', '连山区');
INSERT INTO `sys_address_area` VALUES ('211403', '0', '100', '211400', '龙港区');
INSERT INTO `sys_address_area` VALUES ('211404', '0', '100', '211400', '南票区');
INSERT INTO `sys_address_area` VALUES ('211421', '0', '100', '211400', '绥中县');
INSERT INTO `sys_address_area` VALUES ('211422', '0', '100', '211400', '建昌县');
INSERT INTO `sys_address_area` VALUES ('211481', '0', '100', '211400', '兴城市');
INSERT INTO `sys_address_area` VALUES ('220101', '0', '100', '220100', '市辖区');
INSERT INTO `sys_address_area` VALUES ('220102', '0', '100', '220100', '南关区');
INSERT INTO `sys_address_area` VALUES ('220103', '0', '100', '220100', '宽城区');
INSERT INTO `sys_address_area` VALUES ('220104', '0', '100', '220100', '朝阳区');
INSERT INTO `sys_address_area` VALUES ('220105', '0', '100', '220100', '二道区');
INSERT INTO `sys_address_area` VALUES ('220106', '0', '100', '220100', '绿园区');
INSERT INTO `sys_address_area` VALUES ('220112', '0', '100', '220100', '双阳区');
INSERT INTO `sys_address_area` VALUES ('220122', '0', '100', '220100', '农安县');
INSERT INTO `sys_address_area` VALUES ('220181', '0', '100', '220100', '九台市');
INSERT INTO `sys_address_area` VALUES ('220182', '0', '100', '220100', '榆树市');
INSERT INTO `sys_address_area` VALUES ('220183', '0', '100', '220100', '德惠市');
INSERT INTO `sys_address_area` VALUES ('220201', '0', '100', '220200', '市辖区');
INSERT INTO `sys_address_area` VALUES ('220202', '0', '100', '220200', '昌邑区');
INSERT INTO `sys_address_area` VALUES ('220203', '0', '100', '220200', '龙潭区');
INSERT INTO `sys_address_area` VALUES ('220204', '0', '100', '220200', '船营区');
INSERT INTO `sys_address_area` VALUES ('220211', '0', '100', '220200', '丰满区');
INSERT INTO `sys_address_area` VALUES ('220221', '0', '100', '220200', '永吉县');
INSERT INTO `sys_address_area` VALUES ('220281', '0', '100', '220200', '蛟河市');
INSERT INTO `sys_address_area` VALUES ('220282', '0', '100', '220200', '桦甸市');
INSERT INTO `sys_address_area` VALUES ('220283', '0', '100', '220200', '舒兰市');
INSERT INTO `sys_address_area` VALUES ('220284', '0', '100', '220200', '磐石市');
INSERT INTO `sys_address_area` VALUES ('220301', '0', '100', '220300', '市辖区');
INSERT INTO `sys_address_area` VALUES ('220302', '0', '100', '220300', '铁西区');
INSERT INTO `sys_address_area` VALUES ('220303', '0', '100', '220300', '铁东区');
INSERT INTO `sys_address_area` VALUES ('220322', '0', '100', '220300', '梨树县');
INSERT INTO `sys_address_area` VALUES ('220323', '0', '100', '220300', '伊通满族自治县');
INSERT INTO `sys_address_area` VALUES ('220381', '0', '100', '220300', '公主岭市');
INSERT INTO `sys_address_area` VALUES ('220382', '0', '100', '220300', '双辽市');
INSERT INTO `sys_address_area` VALUES ('220401', '0', '100', '220400', '市辖区');
INSERT INTO `sys_address_area` VALUES ('220402', '0', '100', '220400', '龙山区');
INSERT INTO `sys_address_area` VALUES ('220403', '0', '100', '220400', '西安区');
INSERT INTO `sys_address_area` VALUES ('220421', '0', '100', '220400', '东丰县');
INSERT INTO `sys_address_area` VALUES ('220422', '0', '100', '220400', '东辽县');
INSERT INTO `sys_address_area` VALUES ('220501', '0', '100', '220500', '市辖区');
INSERT INTO `sys_address_area` VALUES ('220502', '0', '100', '220500', '东昌区');
INSERT INTO `sys_address_area` VALUES ('220503', '0', '100', '220500', '二道江区');
INSERT INTO `sys_address_area` VALUES ('220521', '0', '100', '220500', '通化县');
INSERT INTO `sys_address_area` VALUES ('220523', '0', '100', '220500', '辉南县');
INSERT INTO `sys_address_area` VALUES ('220524', '0', '100', '220500', '柳河县');
INSERT INTO `sys_address_area` VALUES ('220581', '0', '100', '220500', '梅河口市');
INSERT INTO `sys_address_area` VALUES ('220582', '0', '100', '220500', '集安市');
INSERT INTO `sys_address_area` VALUES ('220601', '0', '100', '220600', '市辖区');
INSERT INTO `sys_address_area` VALUES ('220602', '0', '100', '220600', '八道江区');
INSERT INTO `sys_address_area` VALUES ('220621', '0', '100', '220600', '抚松县');
INSERT INTO `sys_address_area` VALUES ('220622', '0', '100', '220600', '靖宇县');
INSERT INTO `sys_address_area` VALUES ('220623', '0', '100', '220600', '长白朝鲜族自治县');
INSERT INTO `sys_address_area` VALUES ('220625', '0', '100', '220600', '江源县');
INSERT INTO `sys_address_area` VALUES ('220681', '0', '100', '220600', '临江市');
INSERT INTO `sys_address_area` VALUES ('220701', '0', '100', '220700', '市辖区');
INSERT INTO `sys_address_area` VALUES ('220702', '0', '100', '220700', '宁江区');
INSERT INTO `sys_address_area` VALUES ('220721', '0', '100', '220700', '前郭尔罗斯蒙古族自治县');
INSERT INTO `sys_address_area` VALUES ('220722', '0', '100', '220700', '长岭县');
INSERT INTO `sys_address_area` VALUES ('220723', '0', '100', '220700', '乾安县');
INSERT INTO `sys_address_area` VALUES ('220724', '0', '100', '220700', '扶余县');
INSERT INTO `sys_address_area` VALUES ('220801', '0', '100', '220800', '市辖区');
INSERT INTO `sys_address_area` VALUES ('220802', '0', '100', '220800', '洮北区');
INSERT INTO `sys_address_area` VALUES ('220821', '0', '100', '220800', '镇赉县');
INSERT INTO `sys_address_area` VALUES ('220822', '0', '100', '220800', '通榆县');
INSERT INTO `sys_address_area` VALUES ('220881', '0', '100', '220800', '洮南市');
INSERT INTO `sys_address_area` VALUES ('220882', '0', '100', '220800', '大安市');
INSERT INTO `sys_address_area` VALUES ('222401', '0', '100', '222400', '延吉市');
INSERT INTO `sys_address_area` VALUES ('222402', '0', '100', '222400', '图们市');
INSERT INTO `sys_address_area` VALUES ('222403', '0', '100', '222400', '敦化市');
INSERT INTO `sys_address_area` VALUES ('222404', '0', '100', '222400', '珲春市');
INSERT INTO `sys_address_area` VALUES ('222405', '0', '100', '222400', '龙井市');
INSERT INTO `sys_address_area` VALUES ('222406', '0', '100', '222400', '和龙市');
INSERT INTO `sys_address_area` VALUES ('222424', '0', '100', '222400', '汪清县');
INSERT INTO `sys_address_area` VALUES ('222426', '0', '100', '222400', '安图县');
INSERT INTO `sys_address_area` VALUES ('230101', '0', '100', '230100', '市辖区');
INSERT INTO `sys_address_area` VALUES ('230102', '0', '100', '230100', '道里区');
INSERT INTO `sys_address_area` VALUES ('230103', '0', '100', '230100', '南岗区');
INSERT INTO `sys_address_area` VALUES ('230104', '0', '100', '230100', '道外区');
INSERT INTO `sys_address_area` VALUES ('230106', '0', '100', '230100', '香坊区');
INSERT INTO `sys_address_area` VALUES ('230107', '0', '100', '230100', '动力区');
INSERT INTO `sys_address_area` VALUES ('230108', '0', '100', '230100', '平房区');
INSERT INTO `sys_address_area` VALUES ('230109', '0', '100', '230100', '松北区');
INSERT INTO `sys_address_area` VALUES ('230111', '0', '100', '230100', '呼兰区');
INSERT INTO `sys_address_area` VALUES ('230123', '0', '100', '230100', '依兰县');
INSERT INTO `sys_address_area` VALUES ('230124', '0', '100', '230100', '方正县');
INSERT INTO `sys_address_area` VALUES ('230125', '0', '100', '230100', '宾　县');
INSERT INTO `sys_address_area` VALUES ('230126', '0', '100', '230100', '巴彦县');
INSERT INTO `sys_address_area` VALUES ('230127', '0', '100', '230100', '木兰县');
INSERT INTO `sys_address_area` VALUES ('230128', '0', '100', '230100', '通河县');
INSERT INTO `sys_address_area` VALUES ('230129', '0', '100', '230100', '延寿县');
INSERT INTO `sys_address_area` VALUES ('230181', '0', '100', '230100', '阿城市');
INSERT INTO `sys_address_area` VALUES ('230182', '0', '100', '230100', '双城市');
INSERT INTO `sys_address_area` VALUES ('230183', '0', '100', '230100', '尚志市');
INSERT INTO `sys_address_area` VALUES ('230184', '0', '100', '230100', '五常市');
INSERT INTO `sys_address_area` VALUES ('230201', '0', '100', '230200', '市辖区');
INSERT INTO `sys_address_area` VALUES ('230202', '0', '100', '230200', '龙沙区');
INSERT INTO `sys_address_area` VALUES ('230203', '0', '100', '230200', '建华区');
INSERT INTO `sys_address_area` VALUES ('230204', '0', '100', '230200', '铁锋区');
INSERT INTO `sys_address_area` VALUES ('230205', '0', '100', '230200', '昂昂溪区');
INSERT INTO `sys_address_area` VALUES ('230206', '0', '100', '230200', '富拉尔基区');
INSERT INTO `sys_address_area` VALUES ('230207', '0', '100', '230200', '碾子山区');
INSERT INTO `sys_address_area` VALUES ('230208', '0', '100', '230200', '梅里斯达斡尔族区');
INSERT INTO `sys_address_area` VALUES ('230221', '0', '100', '230200', '龙江县');
INSERT INTO `sys_address_area` VALUES ('230223', '0', '100', '230200', '依安县');
INSERT INTO `sys_address_area` VALUES ('230224', '0', '100', '230200', '泰来县');
INSERT INTO `sys_address_area` VALUES ('230225', '0', '100', '230200', '甘南县');
INSERT INTO `sys_address_area` VALUES ('230227', '0', '100', '230200', '富裕县');
INSERT INTO `sys_address_area` VALUES ('230229', '0', '100', '230200', '克山县');
INSERT INTO `sys_address_area` VALUES ('230230', '0', '100', '230200', '克东县');
INSERT INTO `sys_address_area` VALUES ('230231', '0', '100', '230200', '拜泉县');
INSERT INTO `sys_address_area` VALUES ('230281', '0', '100', '230200', '讷河市');
INSERT INTO `sys_address_area` VALUES ('230301', '0', '100', '230300', '市辖区');
INSERT INTO `sys_address_area` VALUES ('230302', '0', '100', '230300', '鸡冠区');
INSERT INTO `sys_address_area` VALUES ('230303', '0', '100', '230300', '恒山区');
INSERT INTO `sys_address_area` VALUES ('230304', '0', '100', '230300', '滴道区');
INSERT INTO `sys_address_area` VALUES ('230305', '0', '100', '230300', '梨树区');
INSERT INTO `sys_address_area` VALUES ('230306', '0', '100', '230300', '城子河区');
INSERT INTO `sys_address_area` VALUES ('230307', '0', '100', '230300', '麻山区');
INSERT INTO `sys_address_area` VALUES ('230321', '0', '100', '230300', '鸡东县');
INSERT INTO `sys_address_area` VALUES ('230381', '0', '100', '230300', '虎林市');
INSERT INTO `sys_address_area` VALUES ('230382', '0', '100', '230300', '密山市');
INSERT INTO `sys_address_area` VALUES ('230401', '0', '100', '230400', '市辖区');
INSERT INTO `sys_address_area` VALUES ('230402', '0', '100', '230400', '向阳区');
INSERT INTO `sys_address_area` VALUES ('230403', '0', '100', '230400', '工农区');
INSERT INTO `sys_address_area` VALUES ('230404', '0', '100', '230400', '南山区');
INSERT INTO `sys_address_area` VALUES ('230405', '0', '100', '230400', '兴安区');
INSERT INTO `sys_address_area` VALUES ('230406', '0', '100', '230400', '东山区');
INSERT INTO `sys_address_area` VALUES ('230407', '0', '100', '230400', '兴山区');
INSERT INTO `sys_address_area` VALUES ('230421', '0', '100', '230400', '萝北县');
INSERT INTO `sys_address_area` VALUES ('230422', '0', '100', '230400', '绥滨县');
INSERT INTO `sys_address_area` VALUES ('230501', '0', '100', '230500', '市辖区');
INSERT INTO `sys_address_area` VALUES ('230502', '0', '100', '230500', '尖山区');
INSERT INTO `sys_address_area` VALUES ('230503', '0', '100', '230500', '岭东区');
INSERT INTO `sys_address_area` VALUES ('230505', '0', '100', '230500', '四方台区');
INSERT INTO `sys_address_area` VALUES ('230506', '0', '100', '230500', '宝山区');
INSERT INTO `sys_address_area` VALUES ('230521', '0', '100', '230500', '集贤县');
INSERT INTO `sys_address_area` VALUES ('230522', '0', '100', '230500', '友谊县');
INSERT INTO `sys_address_area` VALUES ('230523', '0', '100', '230500', '宝清县');
INSERT INTO `sys_address_area` VALUES ('230524', '0', '100', '230500', '饶河县');
INSERT INTO `sys_address_area` VALUES ('230601', '0', '100', '230600', '市辖区');
INSERT INTO `sys_address_area` VALUES ('230602', '0', '100', '230600', '萨尔图区');
INSERT INTO `sys_address_area` VALUES ('230603', '0', '100', '230600', '龙凤区');
INSERT INTO `sys_address_area` VALUES ('230604', '0', '100', '230600', '让胡路区');
INSERT INTO `sys_address_area` VALUES ('230605', '0', '100', '230600', '红岗区');
INSERT INTO `sys_address_area` VALUES ('230606', '0', '100', '230600', '大同区');
INSERT INTO `sys_address_area` VALUES ('230621', '0', '100', '230600', '肇州县');
INSERT INTO `sys_address_area` VALUES ('230622', '0', '100', '230600', '肇源县');
INSERT INTO `sys_address_area` VALUES ('230623', '0', '100', '230600', '林甸县');
INSERT INTO `sys_address_area` VALUES ('230624', '0', '100', '230600', '杜尔伯特蒙古族自治县');
INSERT INTO `sys_address_area` VALUES ('230701', '0', '100', '230700', '市辖区');
INSERT INTO `sys_address_area` VALUES ('230702', '0', '100', '230700', '伊春区');
INSERT INTO `sys_address_area` VALUES ('230703', '0', '100', '230700', '南岔区');
INSERT INTO `sys_address_area` VALUES ('230704', '0', '100', '230700', '友好区');
INSERT INTO `sys_address_area` VALUES ('230705', '0', '100', '230700', '西林区');
INSERT INTO `sys_address_area` VALUES ('230706', '0', '100', '230700', '翠峦区');
INSERT INTO `sys_address_area` VALUES ('230707', '0', '100', '230700', '新青区');
INSERT INTO `sys_address_area` VALUES ('230708', '0', '100', '230700', '美溪区');
INSERT INTO `sys_address_area` VALUES ('230709', '0', '100', '230700', '金山屯区');
INSERT INTO `sys_address_area` VALUES ('230710', '0', '100', '230700', '五营区');
INSERT INTO `sys_address_area` VALUES ('230711', '0', '100', '230700', '乌马河区');
INSERT INTO `sys_address_area` VALUES ('230712', '0', '100', '230700', '汤旺河区');
INSERT INTO `sys_address_area` VALUES ('230713', '0', '100', '230700', '带岭区');
INSERT INTO `sys_address_area` VALUES ('230714', '0', '100', '230700', '乌伊岭区');
INSERT INTO `sys_address_area` VALUES ('230715', '0', '100', '230700', '红星区');
INSERT INTO `sys_address_area` VALUES ('230716', '0', '100', '230700', '上甘岭区');
INSERT INTO `sys_address_area` VALUES ('230722', '0', '100', '230700', '嘉荫县');
INSERT INTO `sys_address_area` VALUES ('230781', '0', '100', '230700', '铁力市');
INSERT INTO `sys_address_area` VALUES ('230801', '0', '100', '230800', '市辖区');
INSERT INTO `sys_address_area` VALUES ('230802', '0', '100', '230800', '永红区');
INSERT INTO `sys_address_area` VALUES ('230803', '0', '100', '230800', '向阳区');
INSERT INTO `sys_address_area` VALUES ('230804', '0', '100', '230800', '前进区');
INSERT INTO `sys_address_area` VALUES ('230805', '0', '100', '230800', '东风区');
INSERT INTO `sys_address_area` VALUES ('230811', '0', '100', '230800', '郊　区');
INSERT INTO `sys_address_area` VALUES ('230822', '0', '100', '230800', '桦南县');
INSERT INTO `sys_address_area` VALUES ('230826', '0', '100', '230800', '桦川县');
INSERT INTO `sys_address_area` VALUES ('230828', '0', '100', '230800', '汤原县');
INSERT INTO `sys_address_area` VALUES ('230833', '0', '100', '230800', '抚远县');
INSERT INTO `sys_address_area` VALUES ('230881', '0', '100', '230800', '同江市');
INSERT INTO `sys_address_area` VALUES ('230882', '0', '100', '230800', '富锦市');
INSERT INTO `sys_address_area` VALUES ('230901', '0', '100', '230900', '市辖区');
INSERT INTO `sys_address_area` VALUES ('230902', '0', '100', '230900', '新兴区');
INSERT INTO `sys_address_area` VALUES ('230903', '0', '100', '230900', '桃山区');
INSERT INTO `sys_address_area` VALUES ('230904', '0', '100', '230900', '茄子河区');
INSERT INTO `sys_address_area` VALUES ('230921', '0', '100', '230900', '勃利县');
INSERT INTO `sys_address_area` VALUES ('231001', '0', '100', '231000', '市辖区');
INSERT INTO `sys_address_area` VALUES ('231002', '0', '100', '231000', '东安区');
INSERT INTO `sys_address_area` VALUES ('231003', '0', '100', '231000', '阳明区');
INSERT INTO `sys_address_area` VALUES ('231004', '0', '100', '231000', '爱民区');
INSERT INTO `sys_address_area` VALUES ('231005', '0', '100', '231000', '西安区');
INSERT INTO `sys_address_area` VALUES ('231024', '0', '100', '231000', '东宁县');
INSERT INTO `sys_address_area` VALUES ('231025', '0', '100', '231000', '林口县');
INSERT INTO `sys_address_area` VALUES ('231081', '0', '100', '231000', '绥芬河市');
INSERT INTO `sys_address_area` VALUES ('231083', '0', '100', '231000', '海林市');
INSERT INTO `sys_address_area` VALUES ('231084', '0', '100', '231000', '宁安市');
INSERT INTO `sys_address_area` VALUES ('231085', '0', '100', '231000', '穆棱市');
INSERT INTO `sys_address_area` VALUES ('231101', '0', '100', '231100', '市辖区');
INSERT INTO `sys_address_area` VALUES ('231102', '0', '100', '231100', '爱辉区');
INSERT INTO `sys_address_area` VALUES ('231121', '0', '100', '231100', '嫩江县');
INSERT INTO `sys_address_area` VALUES ('231123', '0', '100', '231100', '逊克县');
INSERT INTO `sys_address_area` VALUES ('231124', '0', '100', '231100', '孙吴县');
INSERT INTO `sys_address_area` VALUES ('231181', '0', '100', '231100', '北安市');
INSERT INTO `sys_address_area` VALUES ('231182', '0', '100', '231100', '五大连池市');
INSERT INTO `sys_address_area` VALUES ('231201', '0', '100', '231200', '市辖区');
INSERT INTO `sys_address_area` VALUES ('231202', '0', '100', '231200', '北林区');
INSERT INTO `sys_address_area` VALUES ('231221', '0', '100', '231200', '望奎县');
INSERT INTO `sys_address_area` VALUES ('231222', '0', '100', '231200', '兰西县');
INSERT INTO `sys_address_area` VALUES ('231223', '0', '100', '231200', '青冈县');
INSERT INTO `sys_address_area` VALUES ('231224', '0', '100', '231200', '庆安县');
INSERT INTO `sys_address_area` VALUES ('231225', '0', '100', '231200', '明水县');
INSERT INTO `sys_address_area` VALUES ('231226', '0', '100', '231200', '绥棱县');
INSERT INTO `sys_address_area` VALUES ('231281', '0', '100', '231200', '安达市');
INSERT INTO `sys_address_area` VALUES ('231282', '0', '100', '231200', '肇东市');
INSERT INTO `sys_address_area` VALUES ('231283', '0', '100', '231200', '海伦市');
INSERT INTO `sys_address_area` VALUES ('232721', '0', '100', '232700', '呼玛县');
INSERT INTO `sys_address_area` VALUES ('232722', '0', '100', '232700', '塔河县');
INSERT INTO `sys_address_area` VALUES ('232723', '0', '100', '232700', '漠河县');
INSERT INTO `sys_address_area` VALUES ('310101', '0', '100', '310100', '黄浦区');
INSERT INTO `sys_address_area` VALUES ('310103', '0', '100', '310100', '卢湾区');
INSERT INTO `sys_address_area` VALUES ('310104', '0', '100', '310100', '徐汇区');
INSERT INTO `sys_address_area` VALUES ('310105', '0', '100', '310100', '长宁区');
INSERT INTO `sys_address_area` VALUES ('310106', '0', '100', '310100', '静安区');
INSERT INTO `sys_address_area` VALUES ('310107', '0', '100', '310100', '普陀区');
INSERT INTO `sys_address_area` VALUES ('310108', '0', '100', '310100', '闸北区');
INSERT INTO `sys_address_area` VALUES ('310109', '0', '100', '310100', '虹口区');
INSERT INTO `sys_address_area` VALUES ('310110', '0', '100', '310100', '杨浦区');
INSERT INTO `sys_address_area` VALUES ('310112', '0', '100', '310100', '闵行区');
INSERT INTO `sys_address_area` VALUES ('310113', '0', '100', '310100', '宝山区');
INSERT INTO `sys_address_area` VALUES ('310114', '0', '100', '310100', '嘉定区');
INSERT INTO `sys_address_area` VALUES ('310115', '0', '100', '310100', '浦东新区');
INSERT INTO `sys_address_area` VALUES ('310116', '0', '100', '310100', '金山区');
INSERT INTO `sys_address_area` VALUES ('310117', '0', '100', '310100', '松江区');
INSERT INTO `sys_address_area` VALUES ('310118', '0', '100', '310100', '青浦区');
INSERT INTO `sys_address_area` VALUES ('310119', '0', '100', '310100', '南汇区');
INSERT INTO `sys_address_area` VALUES ('310120', '0', '100', '310100', '奉贤区');
INSERT INTO `sys_address_area` VALUES ('310230', '0', '100', '310200', '崇明县');
INSERT INTO `sys_address_area` VALUES ('320101', '0', '100', '320100', '市辖区');
INSERT INTO `sys_address_area` VALUES ('320102', '0', '100', '320100', '玄武区');
INSERT INTO `sys_address_area` VALUES ('320103', '0', '100', '320100', '白下区');
INSERT INTO `sys_address_area` VALUES ('320104', '0', '100', '320100', '秦淮区');
INSERT INTO `sys_address_area` VALUES ('320105', '0', '100', '320100', '建邺区');
INSERT INTO `sys_address_area` VALUES ('320106', '0', '100', '320100', '鼓楼区');
INSERT INTO `sys_address_area` VALUES ('320107', '0', '100', '320100', '下关区');
INSERT INTO `sys_address_area` VALUES ('320111', '0', '100', '320100', '浦口区');
INSERT INTO `sys_address_area` VALUES ('320113', '0', '100', '320100', '栖霞区');
INSERT INTO `sys_address_area` VALUES ('320114', '0', '100', '320100', '雨花台区');
INSERT INTO `sys_address_area` VALUES ('320115', '0', '100', '320100', '江宁区');
INSERT INTO `sys_address_area` VALUES ('320116', '0', '100', '320100', '六合区');
INSERT INTO `sys_address_area` VALUES ('320124', '0', '100', '320100', '溧水县');
INSERT INTO `sys_address_area` VALUES ('320125', '0', '100', '320100', '高淳县');
INSERT INTO `sys_address_area` VALUES ('320201', '0', '100', '320200', '市辖区');
INSERT INTO `sys_address_area` VALUES ('320202', '0', '100', '320200', '崇安区');
INSERT INTO `sys_address_area` VALUES ('320203', '0', '100', '320200', '南长区');
INSERT INTO `sys_address_area` VALUES ('320204', '0', '100', '320200', '北塘区');
INSERT INTO `sys_address_area` VALUES ('320205', '0', '100', '320200', '锡山区');
INSERT INTO `sys_address_area` VALUES ('320206', '0', '100', '320200', '惠山区');
INSERT INTO `sys_address_area` VALUES ('320211', '0', '100', '320200', '滨湖区');
INSERT INTO `sys_address_area` VALUES ('320281', '0', '100', '320200', '江阴市');
INSERT INTO `sys_address_area` VALUES ('320282', '0', '100', '320200', '宜兴市');
INSERT INTO `sys_address_area` VALUES ('320301', '0', '100', '320300', '市辖区');
INSERT INTO `sys_address_area` VALUES ('320302', '0', '100', '320300', '鼓楼区');
INSERT INTO `sys_address_area` VALUES ('320303', '0', '100', '320300', '云龙区');
INSERT INTO `sys_address_area` VALUES ('320304', '0', '100', '320300', '九里区');
INSERT INTO `sys_address_area` VALUES ('320305', '0', '100', '320300', '贾汪区');
INSERT INTO `sys_address_area` VALUES ('320311', '0', '100', '320300', '泉山区');
INSERT INTO `sys_address_area` VALUES ('320321', '0', '100', '320300', '丰　县');
INSERT INTO `sys_address_area` VALUES ('320322', '0', '100', '320300', '沛　县');
INSERT INTO `sys_address_area` VALUES ('320323', '0', '100', '320300', '铜山县');
INSERT INTO `sys_address_area` VALUES ('320324', '0', '100', '320300', '睢宁县');
INSERT INTO `sys_address_area` VALUES ('320381', '0', '100', '320300', '新沂市');
INSERT INTO `sys_address_area` VALUES ('320382', '0', '100', '320300', '邳州市');
INSERT INTO `sys_address_area` VALUES ('320401', '0', '100', '320400', '市辖区');
INSERT INTO `sys_address_area` VALUES ('320402', '0', '100', '320400', '天宁区');
INSERT INTO `sys_address_area` VALUES ('320404', '0', '100', '320400', '钟楼区');
INSERT INTO `sys_address_area` VALUES ('320405', '0', '100', '320400', '戚墅堰区');
INSERT INTO `sys_address_area` VALUES ('320411', '0', '100', '320400', '新北区');
INSERT INTO `sys_address_area` VALUES ('320412', '0', '100', '320400', '武进区');
INSERT INTO `sys_address_area` VALUES ('320481', '0', '100', '320400', '溧阳市');
INSERT INTO `sys_address_area` VALUES ('320482', '0', '100', '320400', '金坛市');
INSERT INTO `sys_address_area` VALUES ('320501', '0', '100', '320500', '市辖区');
INSERT INTO `sys_address_area` VALUES ('320502', '0', '100', '320500', '沧浪区');
INSERT INTO `sys_address_area` VALUES ('320503', '0', '100', '320500', '平江区');
INSERT INTO `sys_address_area` VALUES ('320504', '0', '100', '320500', '金阊区');
INSERT INTO `sys_address_area` VALUES ('320505', '0', '100', '320500', '虎丘区');
INSERT INTO `sys_address_area` VALUES ('320506', '0', '100', '320500', '吴中区');
INSERT INTO `sys_address_area` VALUES ('320507', '0', '100', '320500', '相城区');
INSERT INTO `sys_address_area` VALUES ('320581', '0', '100', '320500', '常熟市');
INSERT INTO `sys_address_area` VALUES ('320582', '0', '100', '320500', '张家港市');
INSERT INTO `sys_address_area` VALUES ('320583', '0', '100', '320500', '昆山市');
INSERT INTO `sys_address_area` VALUES ('320584', '0', '100', '320500', '吴江市');
INSERT INTO `sys_address_area` VALUES ('320585', '0', '100', '320500', '太仓市');
INSERT INTO `sys_address_area` VALUES ('320601', '0', '100', '320600', '市辖区');
INSERT INTO `sys_address_area` VALUES ('320602', '0', '100', '320600', '崇川区');
INSERT INTO `sys_address_area` VALUES ('320611', '0', '100', '320600', '港闸区');
INSERT INTO `sys_address_area` VALUES ('320621', '0', '100', '320600', '海安县');
INSERT INTO `sys_address_area` VALUES ('320623', '0', '100', '320600', '如东县');
INSERT INTO `sys_address_area` VALUES ('320681', '0', '100', '320600', '启东市');
INSERT INTO `sys_address_area` VALUES ('320682', '0', '100', '320600', '如皋市');
INSERT INTO `sys_address_area` VALUES ('320683', '0', '100', '320600', '通州市');
INSERT INTO `sys_address_area` VALUES ('320684', '0', '100', '320600', '海门市');
INSERT INTO `sys_address_area` VALUES ('320701', '0', '100', '320700', '市辖区');
INSERT INTO `sys_address_area` VALUES ('320703', '0', '100', '320700', '连云区');
INSERT INTO `sys_address_area` VALUES ('320705', '0', '100', '320700', '新浦区');
INSERT INTO `sys_address_area` VALUES ('320706', '0', '100', '320700', '海州区');
INSERT INTO `sys_address_area` VALUES ('320721', '0', '100', '320700', '赣榆县');
INSERT INTO `sys_address_area` VALUES ('320722', '0', '100', '320700', '东海县');
INSERT INTO `sys_address_area` VALUES ('320723', '0', '100', '320700', '灌云县');
INSERT INTO `sys_address_area` VALUES ('320724', '0', '100', '320700', '灌南县');
INSERT INTO `sys_address_area` VALUES ('320801', '0', '100', '320800', '市辖区');
INSERT INTO `sys_address_area` VALUES ('320802', '0', '100', '320800', '清河区');
INSERT INTO `sys_address_area` VALUES ('320803', '0', '100', '320800', '楚州区');
INSERT INTO `sys_address_area` VALUES ('320804', '0', '100', '320800', '淮阴区');
INSERT INTO `sys_address_area` VALUES ('320811', '0', '100', '320800', '清浦区');
INSERT INTO `sys_address_area` VALUES ('320826', '0', '100', '320800', '涟水县');
INSERT INTO `sys_address_area` VALUES ('320829', '0', '100', '320800', '洪泽县');
INSERT INTO `sys_address_area` VALUES ('320830', '0', '100', '320800', '盱眙县');
INSERT INTO `sys_address_area` VALUES ('320831', '0', '100', '320800', '金湖县');
INSERT INTO `sys_address_area` VALUES ('320901', '0', '100', '320900', '市辖区');
INSERT INTO `sys_address_area` VALUES ('320902', '0', '100', '320900', '亭湖区');
INSERT INTO `sys_address_area` VALUES ('320903', '0', '100', '320900', '盐都区');
INSERT INTO `sys_address_area` VALUES ('320921', '0', '100', '320900', '响水县');
INSERT INTO `sys_address_area` VALUES ('320922', '0', '100', '320900', '滨海县');
INSERT INTO `sys_address_area` VALUES ('320923', '0', '100', '320900', '阜宁县');
INSERT INTO `sys_address_area` VALUES ('320924', '0', '100', '320900', '射阳县');
INSERT INTO `sys_address_area` VALUES ('320925', '0', '100', '320900', '建湖县');
INSERT INTO `sys_address_area` VALUES ('320981', '0', '100', '320900', '东台市');
INSERT INTO `sys_address_area` VALUES ('320982', '0', '100', '320900', '大丰市');
INSERT INTO `sys_address_area` VALUES ('321001', '0', '100', '321000', '市辖区');
INSERT INTO `sys_address_area` VALUES ('321002', '0', '100', '321000', '广陵区');
INSERT INTO `sys_address_area` VALUES ('321003', '0', '100', '321000', '邗江区');
INSERT INTO `sys_address_area` VALUES ('321011', '0', '100', '321000', '郊　区');
INSERT INTO `sys_address_area` VALUES ('321023', '0', '100', '321000', '宝应县');
INSERT INTO `sys_address_area` VALUES ('321081', '0', '100', '321000', '仪征市');
INSERT INTO `sys_address_area` VALUES ('321084', '0', '100', '321000', '高邮市');
INSERT INTO `sys_address_area` VALUES ('321088', '0', '100', '321000', '江都市');
INSERT INTO `sys_address_area` VALUES ('321101', '0', '100', '321100', '市辖区');
INSERT INTO `sys_address_area` VALUES ('321102', '0', '100', '321100', '京口区');
INSERT INTO `sys_address_area` VALUES ('321111', '0', '100', '321100', '润州区');
INSERT INTO `sys_address_area` VALUES ('321112', '0', '100', '321100', '丹徒区');
INSERT INTO `sys_address_area` VALUES ('321181', '0', '100', '321100', '丹阳市');
INSERT INTO `sys_address_area` VALUES ('321182', '0', '100', '321100', '扬中市');
INSERT INTO `sys_address_area` VALUES ('321183', '0', '100', '321100', '句容市');
INSERT INTO `sys_address_area` VALUES ('321201', '0', '100', '321200', '市辖区');
INSERT INTO `sys_address_area` VALUES ('321202', '0', '100', '321200', '海陵区');
INSERT INTO `sys_address_area` VALUES ('321203', '0', '100', '321200', '高港区');
INSERT INTO `sys_address_area` VALUES ('321281', '0', '100', '321200', '兴化市');
INSERT INTO `sys_address_area` VALUES ('321282', '0', '100', '321200', '靖江市');
INSERT INTO `sys_address_area` VALUES ('321283', '0', '100', '321200', '泰兴市');
INSERT INTO `sys_address_area` VALUES ('321284', '0', '100', '321200', '姜堰市');
INSERT INTO `sys_address_area` VALUES ('321301', '0', '100', '321300', '市辖区');
INSERT INTO `sys_address_area` VALUES ('321302', '0', '100', '321300', '宿城区');
INSERT INTO `sys_address_area` VALUES ('321311', '0', '100', '321300', '宿豫区');
INSERT INTO `sys_address_area` VALUES ('321322', '0', '100', '321300', '沭阳县');
INSERT INTO `sys_address_area` VALUES ('321323', '0', '100', '321300', '泗阳县');
INSERT INTO `sys_address_area` VALUES ('321324', '0', '100', '321300', '泗洪县');
INSERT INTO `sys_address_area` VALUES ('330101', '0', '100', '330100', '市辖区');
INSERT INTO `sys_address_area` VALUES ('330102', '0', '100', '330100', '上城区');
INSERT INTO `sys_address_area` VALUES ('330103', '0', '100', '330100', '下城区');
INSERT INTO `sys_address_area` VALUES ('330104', '0', '100', '330100', '江干区');
INSERT INTO `sys_address_area` VALUES ('330105', '0', '100', '330100', '拱墅区');
INSERT INTO `sys_address_area` VALUES ('330106', '0', '100', '330100', '西湖区');
INSERT INTO `sys_address_area` VALUES ('330108', '0', '100', '330100', '滨江区');
INSERT INTO `sys_address_area` VALUES ('330109', '0', '100', '330100', '萧山区');
INSERT INTO `sys_address_area` VALUES ('330110', '0', '100', '330100', '余杭区');
INSERT INTO `sys_address_area` VALUES ('330122', '0', '100', '330100', '桐庐县');
INSERT INTO `sys_address_area` VALUES ('330127', '0', '100', '330100', '淳安县');
INSERT INTO `sys_address_area` VALUES ('330182', '0', '100', '330100', '建德市');
INSERT INTO `sys_address_area` VALUES ('330183', '0', '100', '330100', '富阳市');
INSERT INTO `sys_address_area` VALUES ('330185', '0', '100', '330100', '临安市');
INSERT INTO `sys_address_area` VALUES ('330201', '0', '100', '330200', '市辖区');
INSERT INTO `sys_address_area` VALUES ('330203', '0', '100', '330200', '海曙区');
INSERT INTO `sys_address_area` VALUES ('330204', '0', '100', '330200', '江东区');
INSERT INTO `sys_address_area` VALUES ('330205', '0', '100', '330200', '江北区');
INSERT INTO `sys_address_area` VALUES ('330206', '0', '100', '330200', '北仑区');
INSERT INTO `sys_address_area` VALUES ('330211', '0', '100', '330200', '镇海区');
INSERT INTO `sys_address_area` VALUES ('330212', '0', '100', '330200', '鄞州区');
INSERT INTO `sys_address_area` VALUES ('330225', '0', '100', '330200', '象山县');
INSERT INTO `sys_address_area` VALUES ('330226', '0', '100', '330200', '宁海县');
INSERT INTO `sys_address_area` VALUES ('330281', '0', '100', '330200', '余姚市');
INSERT INTO `sys_address_area` VALUES ('330282', '0', '100', '330200', '慈溪市');
INSERT INTO `sys_address_area` VALUES ('330283', '0', '100', '330200', '奉化市');
INSERT INTO `sys_address_area` VALUES ('330301', '0', '100', '330300', '市辖区');
INSERT INTO `sys_address_area` VALUES ('330302', '0', '100', '330300', '鹿城区');
INSERT INTO `sys_address_area` VALUES ('330303', '0', '100', '330300', '龙湾区');
INSERT INTO `sys_address_area` VALUES ('330304', '0', '100', '330300', '瓯海区');
INSERT INTO `sys_address_area` VALUES ('330322', '0', '100', '330300', '洞头县');
INSERT INTO `sys_address_area` VALUES ('330324', '0', '100', '330300', '永嘉县');
INSERT INTO `sys_address_area` VALUES ('330326', '0', '100', '330300', '平阳县');
INSERT INTO `sys_address_area` VALUES ('330327', '0', '100', '330300', '苍南县');
INSERT INTO `sys_address_area` VALUES ('330328', '0', '100', '330300', '文成县');
INSERT INTO `sys_address_area` VALUES ('330329', '0', '100', '330300', '泰顺县');
INSERT INTO `sys_address_area` VALUES ('330381', '0', '100', '330300', '瑞安市');
INSERT INTO `sys_address_area` VALUES ('330382', '0', '100', '330300', '乐清市');
INSERT INTO `sys_address_area` VALUES ('330401', '0', '100', '330400', '市辖区');
INSERT INTO `sys_address_area` VALUES ('330402', '0', '100', '330400', '秀城区');
INSERT INTO `sys_address_area` VALUES ('330411', '0', '100', '330400', '秀洲区');
INSERT INTO `sys_address_area` VALUES ('330421', '0', '100', '330400', '嘉善县');
INSERT INTO `sys_address_area` VALUES ('330424', '0', '100', '330400', '海盐县');
INSERT INTO `sys_address_area` VALUES ('330481', '0', '100', '330400', '海宁市');
INSERT INTO `sys_address_area` VALUES ('330482', '0', '100', '330400', '平湖市');
INSERT INTO `sys_address_area` VALUES ('330483', '0', '100', '330400', '桐乡市');
INSERT INTO `sys_address_area` VALUES ('330501', '0', '100', '330500', '市辖区');
INSERT INTO `sys_address_area` VALUES ('330502', '0', '100', '330500', '吴兴区');
INSERT INTO `sys_address_area` VALUES ('330503', '0', '100', '330500', '南浔区');
INSERT INTO `sys_address_area` VALUES ('330521', '0', '100', '330500', '德清县');
INSERT INTO `sys_address_area` VALUES ('330522', '0', '100', '330500', '长兴县');
INSERT INTO `sys_address_area` VALUES ('330523', '0', '100', '330500', '安吉县');
INSERT INTO `sys_address_area` VALUES ('330601', '0', '100', '330600', '市辖区');
INSERT INTO `sys_address_area` VALUES ('330602', '0', '100', '330600', '越城区');
INSERT INTO `sys_address_area` VALUES ('330621', '0', '100', '330600', '绍兴县');
INSERT INTO `sys_address_area` VALUES ('330624', '0', '100', '330600', '新昌县');
INSERT INTO `sys_address_area` VALUES ('330681', '0', '100', '330600', '诸暨市');
INSERT INTO `sys_address_area` VALUES ('330682', '0', '100', '330600', '上虞市');
INSERT INTO `sys_address_area` VALUES ('330683', '0', '100', '330600', '嵊州市');
INSERT INTO `sys_address_area` VALUES ('330701', '0', '100', '330700', '市辖区');
INSERT INTO `sys_address_area` VALUES ('330702', '0', '100', '330700', '婺城区');
INSERT INTO `sys_address_area` VALUES ('330703', '0', '100', '330700', '金东区');
INSERT INTO `sys_address_area` VALUES ('330723', '0', '100', '330700', '武义县');
INSERT INTO `sys_address_area` VALUES ('330726', '0', '100', '330700', '浦江县');
INSERT INTO `sys_address_area` VALUES ('330727', '0', '100', '330700', '磐安县');
INSERT INTO `sys_address_area` VALUES ('330781', '0', '100', '330700', '兰溪市');
INSERT INTO `sys_address_area` VALUES ('330782', '0', '100', '330700', '义乌市');
INSERT INTO `sys_address_area` VALUES ('330783', '0', '100', '330700', '东阳市');
INSERT INTO `sys_address_area` VALUES ('330784', '0', '100', '330700', '永康市');
INSERT INTO `sys_address_area` VALUES ('330801', '0', '100', '330800', '市辖区');
INSERT INTO `sys_address_area` VALUES ('330802', '0', '100', '330800', '柯城区');
INSERT INTO `sys_address_area` VALUES ('330803', '0', '100', '330800', '衢江区');
INSERT INTO `sys_address_area` VALUES ('330822', '0', '100', '330800', '常山县');
INSERT INTO `sys_address_area` VALUES ('330824', '0', '100', '330800', '开化县');
INSERT INTO `sys_address_area` VALUES ('330825', '0', '100', '330800', '龙游县');
INSERT INTO `sys_address_area` VALUES ('330881', '0', '100', '330800', '江山市');
INSERT INTO `sys_address_area` VALUES ('330901', '0', '100', '330900', '市辖区');
INSERT INTO `sys_address_area` VALUES ('330902', '0', '100', '330900', '定海区');
INSERT INTO `sys_address_area` VALUES ('330903', '0', '100', '330900', '普陀区');
INSERT INTO `sys_address_area` VALUES ('330921', '0', '100', '330900', '岱山县');
INSERT INTO `sys_address_area` VALUES ('330922', '0', '100', '330900', '嵊泗县');
INSERT INTO `sys_address_area` VALUES ('331001', '0', '100', '331000', '市辖区');
INSERT INTO `sys_address_area` VALUES ('331002', '0', '100', '331000', '椒江区');
INSERT INTO `sys_address_area` VALUES ('331003', '0', '100', '331000', '黄岩区');
INSERT INTO `sys_address_area` VALUES ('331004', '0', '100', '331000', '路桥区');
INSERT INTO `sys_address_area` VALUES ('331021', '0', '100', '331000', '玉环县');
INSERT INTO `sys_address_area` VALUES ('331022', '0', '100', '331000', '三门县');
INSERT INTO `sys_address_area` VALUES ('331023', '0', '100', '331000', '天台县');
INSERT INTO `sys_address_area` VALUES ('331024', '0', '100', '331000', '仙居县');
INSERT INTO `sys_address_area` VALUES ('331081', '0', '100', '331000', '温岭市');
INSERT INTO `sys_address_area` VALUES ('331082', '0', '100', '331000', '临海市');
INSERT INTO `sys_address_area` VALUES ('331101', '0', '100', '331100', '市辖区');
INSERT INTO `sys_address_area` VALUES ('331102', '0', '100', '331100', '莲都区');
INSERT INTO `sys_address_area` VALUES ('331121', '0', '100', '331100', '青田县');
INSERT INTO `sys_address_area` VALUES ('331122', '0', '100', '331100', '缙云县');
INSERT INTO `sys_address_area` VALUES ('331123', '0', '100', '331100', '遂昌县');
INSERT INTO `sys_address_area` VALUES ('331124', '0', '100', '331100', '松阳县');
INSERT INTO `sys_address_area` VALUES ('331125', '0', '100', '331100', '云和县');
INSERT INTO `sys_address_area` VALUES ('331126', '0', '100', '331100', '庆元县');
INSERT INTO `sys_address_area` VALUES ('331127', '0', '100', '331100', '景宁畲族自治县');
INSERT INTO `sys_address_area` VALUES ('331181', '0', '100', '331100', '龙泉市');
INSERT INTO `sys_address_area` VALUES ('340101', '0', '100', '340100', '市辖区');
INSERT INTO `sys_address_area` VALUES ('340102', '0', '100', '340100', '瑶海区');
INSERT INTO `sys_address_area` VALUES ('340103', '0', '100', '340100', '庐阳区');
INSERT INTO `sys_address_area` VALUES ('340104', '0', '100', '340100', '蜀山区');
INSERT INTO `sys_address_area` VALUES ('340111', '0', '100', '340100', '包河区');
INSERT INTO `sys_address_area` VALUES ('340121', '0', '100', '340100', '长丰县');
INSERT INTO `sys_address_area` VALUES ('340122', '0', '100', '340100', '肥东县');
INSERT INTO `sys_address_area` VALUES ('340123', '0', '100', '340100', '肥西县');
INSERT INTO `sys_address_area` VALUES ('340201', '0', '100', '340200', '市辖区');
INSERT INTO `sys_address_area` VALUES ('340202', '0', '100', '340200', '镜湖区');
INSERT INTO `sys_address_area` VALUES ('340203', '0', '100', '340200', '马塘区');
INSERT INTO `sys_address_area` VALUES ('340204', '0', '100', '340200', '新芜区');
INSERT INTO `sys_address_area` VALUES ('340207', '0', '100', '340200', '鸠江区');
INSERT INTO `sys_address_area` VALUES ('340221', '0', '100', '340200', '芜湖县');
INSERT INTO `sys_address_area` VALUES ('340222', '0', '100', '340200', '繁昌县');
INSERT INTO `sys_address_area` VALUES ('340223', '0', '100', '340200', '南陵县');
INSERT INTO `sys_address_area` VALUES ('340301', '0', '100', '340300', '市辖区');
INSERT INTO `sys_address_area` VALUES ('340302', '0', '100', '340300', '龙子湖区');
INSERT INTO `sys_address_area` VALUES ('340303', '0', '100', '340300', '蚌山区');
INSERT INTO `sys_address_area` VALUES ('340304', '0', '100', '340300', '禹会区');
INSERT INTO `sys_address_area` VALUES ('340311', '0', '100', '340300', '淮上区');
INSERT INTO `sys_address_area` VALUES ('340321', '0', '100', '340300', '怀远县');
INSERT INTO `sys_address_area` VALUES ('340322', '0', '100', '340300', '五河县');
INSERT INTO `sys_address_area` VALUES ('340323', '0', '100', '340300', '固镇县');
INSERT INTO `sys_address_area` VALUES ('340401', '0', '100', '340400', '市辖区');
INSERT INTO `sys_address_area` VALUES ('340402', '0', '100', '340400', '大通区');
INSERT INTO `sys_address_area` VALUES ('340403', '0', '100', '340400', '田家庵区');
INSERT INTO `sys_address_area` VALUES ('340404', '0', '100', '340400', '谢家集区');
INSERT INTO `sys_address_area` VALUES ('340405', '0', '100', '340400', '八公山区');
INSERT INTO `sys_address_area` VALUES ('340406', '0', '100', '340400', '潘集区');
INSERT INTO `sys_address_area` VALUES ('340421', '0', '100', '340400', '凤台县');
INSERT INTO `sys_address_area` VALUES ('340501', '0', '100', '340500', '市辖区');
INSERT INTO `sys_address_area` VALUES ('340502', '0', '100', '340500', '金家庄区');
INSERT INTO `sys_address_area` VALUES ('340503', '0', '100', '340500', '花山区');
INSERT INTO `sys_address_area` VALUES ('340504', '0', '100', '340500', '雨山区');
INSERT INTO `sys_address_area` VALUES ('340521', '0', '100', '340500', '当涂县');
INSERT INTO `sys_address_area` VALUES ('340601', '0', '100', '340600', '市辖区');
INSERT INTO `sys_address_area` VALUES ('340602', '0', '100', '340600', '杜集区');
INSERT INTO `sys_address_area` VALUES ('340603', '0', '100', '340600', '相山区');
INSERT INTO `sys_address_area` VALUES ('340604', '0', '100', '340600', '烈山区');
INSERT INTO `sys_address_area` VALUES ('340621', '0', '100', '340600', '濉溪县');
INSERT INTO `sys_address_area` VALUES ('340701', '0', '100', '340700', '市辖区');
INSERT INTO `sys_address_area` VALUES ('340702', '0', '100', '340700', '铜官山区');
INSERT INTO `sys_address_area` VALUES ('340703', '0', '100', '340700', '狮子山区');
INSERT INTO `sys_address_area` VALUES ('340711', '0', '100', '340700', '郊　区');
INSERT INTO `sys_address_area` VALUES ('340721', '0', '100', '340700', '铜陵县');
INSERT INTO `sys_address_area` VALUES ('340801', '0', '100', '340800', '市辖区');
INSERT INTO `sys_address_area` VALUES ('340802', '0', '100', '340800', '迎江区');
INSERT INTO `sys_address_area` VALUES ('340803', '0', '100', '340800', '大观区');
INSERT INTO `sys_address_area` VALUES ('340811', '0', '100', '340800', '郊　区');
INSERT INTO `sys_address_area` VALUES ('340822', '0', '100', '340800', '怀宁县');
INSERT INTO `sys_address_area` VALUES ('340823', '0', '100', '340800', '枞阳县');
INSERT INTO `sys_address_area` VALUES ('340824', '0', '100', '340800', '潜山县');
INSERT INTO `sys_address_area` VALUES ('340825', '0', '100', '340800', '太湖县');
INSERT INTO `sys_address_area` VALUES ('340826', '0', '100', '340800', '宿松县');
INSERT INTO `sys_address_area` VALUES ('340827', '0', '100', '340800', '望江县');
INSERT INTO `sys_address_area` VALUES ('340828', '0', '100', '340800', '岳西县');
INSERT INTO `sys_address_area` VALUES ('340881', '0', '100', '340800', '桐城市');
INSERT INTO `sys_address_area` VALUES ('341001', '0', '100', '341000', '市辖区');
INSERT INTO `sys_address_area` VALUES ('341002', '0', '100', '341000', '屯溪区');
INSERT INTO `sys_address_area` VALUES ('341003', '0', '100', '341000', '黄山区');
INSERT INTO `sys_address_area` VALUES ('341004', '0', '100', '341000', '徽州区');
INSERT INTO `sys_address_area` VALUES ('341021', '0', '100', '341000', '歙　县');
INSERT INTO `sys_address_area` VALUES ('341022', '0', '100', '341000', '休宁县');
INSERT INTO `sys_address_area` VALUES ('341023', '0', '100', '341000', '黟　县');
INSERT INTO `sys_address_area` VALUES ('341024', '0', '100', '341000', '祁门县');
INSERT INTO `sys_address_area` VALUES ('341101', '0', '100', '341100', '市辖区');
INSERT INTO `sys_address_area` VALUES ('341102', '0', '100', '341100', '琅琊区');
INSERT INTO `sys_address_area` VALUES ('341103', '0', '100', '341100', '南谯区');
INSERT INTO `sys_address_area` VALUES ('341122', '0', '100', '341100', '来安县');
INSERT INTO `sys_address_area` VALUES ('341124', '0', '100', '341100', '全椒县');
INSERT INTO `sys_address_area` VALUES ('341125', '0', '100', '341100', '定远县');
INSERT INTO `sys_address_area` VALUES ('341126', '0', '100', '341100', '凤阳县');
INSERT INTO `sys_address_area` VALUES ('341181', '0', '100', '341100', '天长市');
INSERT INTO `sys_address_area` VALUES ('341182', '0', '100', '341100', '明光市');
INSERT INTO `sys_address_area` VALUES ('341201', '0', '100', '341200', '市辖区');
INSERT INTO `sys_address_area` VALUES ('341202', '0', '100', '341200', '颍州区');
INSERT INTO `sys_address_area` VALUES ('341203', '0', '100', '341200', '颍东区');
INSERT INTO `sys_address_area` VALUES ('341204', '0', '100', '341200', '颍泉区');
INSERT INTO `sys_address_area` VALUES ('341221', '0', '100', '341200', '临泉县');
INSERT INTO `sys_address_area` VALUES ('341222', '0', '100', '341200', '太和县');
INSERT INTO `sys_address_area` VALUES ('341225', '0', '100', '341200', '阜南县');
INSERT INTO `sys_address_area` VALUES ('341226', '0', '100', '341200', '颍上县');
INSERT INTO `sys_address_area` VALUES ('341282', '0', '100', '341200', '界首市');
INSERT INTO `sys_address_area` VALUES ('341301', '0', '100', '341300', '市辖区');
INSERT INTO `sys_address_area` VALUES ('341302', '0', '100', '341300', '墉桥区');
INSERT INTO `sys_address_area` VALUES ('341321', '0', '100', '341300', '砀山县');
INSERT INTO `sys_address_area` VALUES ('341322', '0', '100', '341300', '萧　县');
INSERT INTO `sys_address_area` VALUES ('341323', '0', '100', '341300', '灵璧县');
INSERT INTO `sys_address_area` VALUES ('341324', '0', '100', '341300', '泗　县');
INSERT INTO `sys_address_area` VALUES ('341401', '0', '100', '341400', '市辖区');
INSERT INTO `sys_address_area` VALUES ('341402', '0', '100', '341400', '居巢区');
INSERT INTO `sys_address_area` VALUES ('341421', '0', '100', '341400', '庐江县');
INSERT INTO `sys_address_area` VALUES ('341422', '0', '100', '341400', '无为县');
INSERT INTO `sys_address_area` VALUES ('341423', '0', '100', '341400', '含山县');
INSERT INTO `sys_address_area` VALUES ('341424', '0', '100', '341400', '和　县');
INSERT INTO `sys_address_area` VALUES ('341501', '0', '100', '341500', '市辖区');
INSERT INTO `sys_address_area` VALUES ('341502', '0', '100', '341500', '金安区');
INSERT INTO `sys_address_area` VALUES ('341503', '0', '100', '341500', '裕安区');
INSERT INTO `sys_address_area` VALUES ('341521', '0', '100', '341500', '寿　县');
INSERT INTO `sys_address_area` VALUES ('341522', '0', '100', '341500', '霍邱县');
INSERT INTO `sys_address_area` VALUES ('341523', '0', '100', '341500', '舒城县');
INSERT INTO `sys_address_area` VALUES ('341524', '0', '100', '341500', '金寨县');
INSERT INTO `sys_address_area` VALUES ('341525', '0', '100', '341500', '霍山县');
INSERT INTO `sys_address_area` VALUES ('341601', '0', '100', '341600', '市辖区');
INSERT INTO `sys_address_area` VALUES ('341602', '0', '100', '341600', '谯城区');
INSERT INTO `sys_address_area` VALUES ('341621', '0', '100', '341600', '涡阳县');
INSERT INTO `sys_address_area` VALUES ('341622', '0', '100', '341600', '蒙城县');
INSERT INTO `sys_address_area` VALUES ('341623', '0', '100', '341600', '利辛县');
INSERT INTO `sys_address_area` VALUES ('341701', '0', '100', '341700', '市辖区');
INSERT INTO `sys_address_area` VALUES ('341702', '0', '100', '341700', '贵池区');
INSERT INTO `sys_address_area` VALUES ('341721', '0', '100', '341700', '东至县');
INSERT INTO `sys_address_area` VALUES ('341722', '0', '100', '341700', '石台县');
INSERT INTO `sys_address_area` VALUES ('341723', '0', '100', '341700', '青阳县');
INSERT INTO `sys_address_area` VALUES ('341801', '0', '100', '341800', '市辖区');
INSERT INTO `sys_address_area` VALUES ('341802', '0', '100', '341800', '宣州区');
INSERT INTO `sys_address_area` VALUES ('341821', '0', '100', '341800', '郎溪县');
INSERT INTO `sys_address_area` VALUES ('341822', '0', '100', '341800', '广德县');
INSERT INTO `sys_address_area` VALUES ('341823', '0', '100', '341800', '泾　县');
INSERT INTO `sys_address_area` VALUES ('341824', '0', '100', '341800', '绩溪县');
INSERT INTO `sys_address_area` VALUES ('341825', '0', '100', '341800', '旌德县');
INSERT INTO `sys_address_area` VALUES ('341881', '0', '100', '341800', '宁国市');
INSERT INTO `sys_address_area` VALUES ('350101', '0', '100', '350100', '市辖区');
INSERT INTO `sys_address_area` VALUES ('350102', '0', '100', '350100', '鼓楼区');
INSERT INTO `sys_address_area` VALUES ('350103', '0', '100', '350100', '台江区');
INSERT INTO `sys_address_area` VALUES ('350104', '0', '100', '350100', '仓山区');
INSERT INTO `sys_address_area` VALUES ('350105', '0', '100', '350100', '马尾区');
INSERT INTO `sys_address_area` VALUES ('350111', '0', '100', '350100', '晋安区');
INSERT INTO `sys_address_area` VALUES ('350121', '0', '100', '350100', '闽侯县');
INSERT INTO `sys_address_area` VALUES ('350122', '0', '100', '350100', '连江县');
INSERT INTO `sys_address_area` VALUES ('350123', '0', '100', '350100', '罗源县');
INSERT INTO `sys_address_area` VALUES ('350124', '0', '100', '350100', '闽清县');
INSERT INTO `sys_address_area` VALUES ('350125', '0', '100', '350100', '永泰县');
INSERT INTO `sys_address_area` VALUES ('350128', '0', '100', '350100', '平潭县');
INSERT INTO `sys_address_area` VALUES ('350181', '0', '100', '350100', '福清市');
INSERT INTO `sys_address_area` VALUES ('350182', '0', '100', '350100', '长乐市');
INSERT INTO `sys_address_area` VALUES ('350201', '0', '100', '350200', '市辖区');
INSERT INTO `sys_address_area` VALUES ('350203', '0', '100', '350200', '思明区');
INSERT INTO `sys_address_area` VALUES ('350205', '0', '100', '350200', '海沧区');
INSERT INTO `sys_address_area` VALUES ('350206', '0', '100', '350200', '湖里区');
INSERT INTO `sys_address_area` VALUES ('350211', '0', '100', '350200', '集美区');
INSERT INTO `sys_address_area` VALUES ('350212', '0', '100', '350200', '同安区');
INSERT INTO `sys_address_area` VALUES ('350213', '0', '100', '350200', '翔安区');
INSERT INTO `sys_address_area` VALUES ('350301', '0', '100', '350300', '市辖区');
INSERT INTO `sys_address_area` VALUES ('350302', '0', '100', '350300', '城厢区');
INSERT INTO `sys_address_area` VALUES ('350303', '0', '100', '350300', '涵江区');
INSERT INTO `sys_address_area` VALUES ('350304', '0', '100', '350300', '荔城区');
INSERT INTO `sys_address_area` VALUES ('350305', '0', '100', '350300', '秀屿区');
INSERT INTO `sys_address_area` VALUES ('350322', '0', '100', '350300', '仙游县');
INSERT INTO `sys_address_area` VALUES ('350401', '0', '100', '350400', '市辖区');
INSERT INTO `sys_address_area` VALUES ('350402', '0', '100', '350400', '梅列区');
INSERT INTO `sys_address_area` VALUES ('350403', '0', '100', '350400', '三元区');
INSERT INTO `sys_address_area` VALUES ('350421', '0', '100', '350400', '明溪县');
INSERT INTO `sys_address_area` VALUES ('350423', '0', '100', '350400', '清流县');
INSERT INTO `sys_address_area` VALUES ('350424', '0', '100', '350400', '宁化县');
INSERT INTO `sys_address_area` VALUES ('350425', '0', '100', '350400', '大田县');
INSERT INTO `sys_address_area` VALUES ('350426', '0', '100', '350400', '尤溪县');
INSERT INTO `sys_address_area` VALUES ('350427', '0', '100', '350400', '沙　县');
INSERT INTO `sys_address_area` VALUES ('350428', '0', '100', '350400', '将乐县');
INSERT INTO `sys_address_area` VALUES ('350429', '0', '100', '350400', '泰宁县');
INSERT INTO `sys_address_area` VALUES ('350430', '0', '100', '350400', '建宁县');
INSERT INTO `sys_address_area` VALUES ('350481', '0', '100', '350400', '永安市');
INSERT INTO `sys_address_area` VALUES ('350501', '0', '100', '350500', '市辖区');
INSERT INTO `sys_address_area` VALUES ('350502', '0', '100', '350500', '鲤城区');
INSERT INTO `sys_address_area` VALUES ('350503', '0', '100', '350500', '丰泽区');
INSERT INTO `sys_address_area` VALUES ('350504', '0', '100', '350500', '洛江区');
INSERT INTO `sys_address_area` VALUES ('350505', '0', '100', '350500', '泉港区');
INSERT INTO `sys_address_area` VALUES ('350521', '0', '100', '350500', '惠安县');
INSERT INTO `sys_address_area` VALUES ('350524', '0', '100', '350500', '安溪县');
INSERT INTO `sys_address_area` VALUES ('350525', '0', '100', '350500', '永春县');
INSERT INTO `sys_address_area` VALUES ('350526', '0', '100', '350500', '德化县');
INSERT INTO `sys_address_area` VALUES ('350527', '0', '100', '350500', '金门县');
INSERT INTO `sys_address_area` VALUES ('350581', '0', '100', '350500', '石狮市');
INSERT INTO `sys_address_area` VALUES ('350582', '0', '100', '350500', '晋江市');
INSERT INTO `sys_address_area` VALUES ('350583', '0', '100', '350500', '南安市');
INSERT INTO `sys_address_area` VALUES ('350601', '0', '100', '350600', '市辖区');
INSERT INTO `sys_address_area` VALUES ('350602', '0', '100', '350600', '芗城区');
INSERT INTO `sys_address_area` VALUES ('350603', '0', '100', '350600', '龙文区');
INSERT INTO `sys_address_area` VALUES ('350622', '0', '100', '350600', '云霄县');
INSERT INTO `sys_address_area` VALUES ('350623', '0', '100', '350600', '漳浦县');
INSERT INTO `sys_address_area` VALUES ('350624', '0', '100', '350600', '诏安县');
INSERT INTO `sys_address_area` VALUES ('350625', '0', '100', '350600', '长泰县');
INSERT INTO `sys_address_area` VALUES ('350626', '0', '100', '350600', '东山县');
INSERT INTO `sys_address_area` VALUES ('350627', '0', '100', '350600', '南靖县');
INSERT INTO `sys_address_area` VALUES ('350628', '0', '100', '350600', '平和县');
INSERT INTO `sys_address_area` VALUES ('350629', '0', '100', '350600', '华安县');
INSERT INTO `sys_address_area` VALUES ('350681', '0', '100', '350600', '龙海市');
INSERT INTO `sys_address_area` VALUES ('350701', '0', '100', '350700', '市辖区');
INSERT INTO `sys_address_area` VALUES ('350702', '0', '100', '350700', '延平区');
INSERT INTO `sys_address_area` VALUES ('350721', '0', '100', '350700', '顺昌县');
INSERT INTO `sys_address_area` VALUES ('350722', '0', '100', '350700', '浦城县');
INSERT INTO `sys_address_area` VALUES ('350723', '0', '100', '350700', '光泽县');
INSERT INTO `sys_address_area` VALUES ('350724', '0', '100', '350700', '松溪县');
INSERT INTO `sys_address_area` VALUES ('350725', '0', '100', '350700', '政和县');
INSERT INTO `sys_address_area` VALUES ('350781', '0', '100', '350700', '邵武市');
INSERT INTO `sys_address_area` VALUES ('350782', '0', '100', '350700', '武夷山市');
INSERT INTO `sys_address_area` VALUES ('350783', '0', '100', '350700', '建瓯市');
INSERT INTO `sys_address_area` VALUES ('350784', '0', '100', '350700', '建阳市');
INSERT INTO `sys_address_area` VALUES ('350801', '0', '100', '350800', '市辖区');
INSERT INTO `sys_address_area` VALUES ('350802', '0', '100', '350800', '新罗区');
INSERT INTO `sys_address_area` VALUES ('350821', '0', '100', '350800', '长汀县');
INSERT INTO `sys_address_area` VALUES ('350822', '0', '100', '350800', '永定县');
INSERT INTO `sys_address_area` VALUES ('350823', '0', '100', '350800', '上杭县');
INSERT INTO `sys_address_area` VALUES ('350824', '0', '100', '350800', '武平县');
INSERT INTO `sys_address_area` VALUES ('350825', '0', '100', '350800', '连城县');
INSERT INTO `sys_address_area` VALUES ('350881', '0', '100', '350800', '漳平市');
INSERT INTO `sys_address_area` VALUES ('350901', '0', '100', '350900', '市辖区');
INSERT INTO `sys_address_area` VALUES ('350902', '0', '100', '350900', '蕉城区');
INSERT INTO `sys_address_area` VALUES ('350921', '0', '100', '350900', '霞浦县');
INSERT INTO `sys_address_area` VALUES ('350922', '0', '100', '350900', '古田县');
INSERT INTO `sys_address_area` VALUES ('350923', '0', '100', '350900', '屏南县');
INSERT INTO `sys_address_area` VALUES ('350924', '0', '100', '350900', '寿宁县');
INSERT INTO `sys_address_area` VALUES ('350925', '0', '100', '350900', '周宁县');
INSERT INTO `sys_address_area` VALUES ('350926', '0', '100', '350900', '柘荣县');
INSERT INTO `sys_address_area` VALUES ('350981', '0', '100', '350900', '福安市');
INSERT INTO `sys_address_area` VALUES ('350982', '0', '100', '350900', '福鼎市');
INSERT INTO `sys_address_area` VALUES ('360101', '0', '100', '360100', '市辖区');
INSERT INTO `sys_address_area` VALUES ('360102', '0', '100', '360100', '东湖区');
INSERT INTO `sys_address_area` VALUES ('360103', '0', '100', '360100', '西湖区');
INSERT INTO `sys_address_area` VALUES ('360104', '0', '100', '360100', '青云谱区');
INSERT INTO `sys_address_area` VALUES ('360105', '0', '100', '360100', '湾里区');
INSERT INTO `sys_address_area` VALUES ('360111', '0', '100', '360100', '青山湖区');
INSERT INTO `sys_address_area` VALUES ('360121', '0', '100', '360100', '南昌县');
INSERT INTO `sys_address_area` VALUES ('360122', '0', '100', '360100', '新建县');
INSERT INTO `sys_address_area` VALUES ('360123', '0', '100', '360100', '安义县');
INSERT INTO `sys_address_area` VALUES ('360124', '0', '100', '360100', '进贤县');
INSERT INTO `sys_address_area` VALUES ('360201', '0', '100', '360200', '市辖区');
INSERT INTO `sys_address_area` VALUES ('360202', '0', '100', '360200', '昌江区');
INSERT INTO `sys_address_area` VALUES ('360203', '0', '100', '360200', '珠山区');
INSERT INTO `sys_address_area` VALUES ('360222', '0', '100', '360200', '浮梁县');
INSERT INTO `sys_address_area` VALUES ('360281', '0', '100', '360200', '乐平市');
INSERT INTO `sys_address_area` VALUES ('360301', '0', '100', '360300', '市辖区');
INSERT INTO `sys_address_area` VALUES ('360302', '0', '100', '360300', '安源区');
INSERT INTO `sys_address_area` VALUES ('360313', '0', '100', '360300', '湘东区');
INSERT INTO `sys_address_area` VALUES ('360321', '0', '100', '360300', '莲花县');
INSERT INTO `sys_address_area` VALUES ('360322', '0', '100', '360300', '上栗县');
INSERT INTO `sys_address_area` VALUES ('360323', '0', '100', '360300', '芦溪县');
INSERT INTO `sys_address_area` VALUES ('360401', '0', '100', '360400', '市辖区');
INSERT INTO `sys_address_area` VALUES ('360402', '0', '100', '360400', '庐山区');
INSERT INTO `sys_address_area` VALUES ('360403', '0', '100', '360400', '浔阳区');
INSERT INTO `sys_address_area` VALUES ('360421', '0', '100', '360400', '九江县');
INSERT INTO `sys_address_area` VALUES ('360423', '0', '100', '360400', '武宁县');
INSERT INTO `sys_address_area` VALUES ('360424', '0', '100', '360400', '修水县');
INSERT INTO `sys_address_area` VALUES ('360425', '0', '100', '360400', '永修县');
INSERT INTO `sys_address_area` VALUES ('360426', '0', '100', '360400', '德安县');
INSERT INTO `sys_address_area` VALUES ('360427', '0', '100', '360400', '星子县');
INSERT INTO `sys_address_area` VALUES ('360428', '0', '100', '360400', '都昌县');
INSERT INTO `sys_address_area` VALUES ('360429', '0', '100', '360400', '湖口县');
INSERT INTO `sys_address_area` VALUES ('360430', '0', '100', '360400', '彭泽县');
INSERT INTO `sys_address_area` VALUES ('360481', '0', '100', '360400', '瑞昌市');
INSERT INTO `sys_address_area` VALUES ('360501', '0', '100', '360500', '市辖区');
INSERT INTO `sys_address_area` VALUES ('360502', '0', '100', '360500', '渝水区');
INSERT INTO `sys_address_area` VALUES ('360521', '0', '100', '360500', '分宜县');
INSERT INTO `sys_address_area` VALUES ('360601', '0', '100', '360600', '市辖区');
INSERT INTO `sys_address_area` VALUES ('360602', '0', '100', '360600', '月湖区');
INSERT INTO `sys_address_area` VALUES ('360622', '0', '100', '360600', '余江县');
INSERT INTO `sys_address_area` VALUES ('360681', '0', '100', '360600', '贵溪市');
INSERT INTO `sys_address_area` VALUES ('360701', '0', '100', '360700', '市辖区');
INSERT INTO `sys_address_area` VALUES ('360702', '0', '100', '360700', '章贡区');
INSERT INTO `sys_address_area` VALUES ('360721', '0', '100', '360700', '赣　县');
INSERT INTO `sys_address_area` VALUES ('360722', '0', '100', '360700', '信丰县');
INSERT INTO `sys_address_area` VALUES ('360723', '0', '100', '360700', '大余县');
INSERT INTO `sys_address_area` VALUES ('360724', '0', '100', '360700', '上犹县');
INSERT INTO `sys_address_area` VALUES ('360725', '0', '100', '360700', '崇义县');
INSERT INTO `sys_address_area` VALUES ('360726', '0', '100', '360700', '安远县');
INSERT INTO `sys_address_area` VALUES ('360727', '0', '100', '360700', '龙南县');
INSERT INTO `sys_address_area` VALUES ('360728', '0', '100', '360700', '定南县');
INSERT INTO `sys_address_area` VALUES ('360729', '0', '100', '360700', '全南县');
INSERT INTO `sys_address_area` VALUES ('360730', '0', '100', '360700', '宁都县');
INSERT INTO `sys_address_area` VALUES ('360731', '0', '100', '360700', '于都县');
INSERT INTO `sys_address_area` VALUES ('360732', '0', '100', '360700', '兴国县');
INSERT INTO `sys_address_area` VALUES ('360733', '0', '100', '360700', '会昌县');
INSERT INTO `sys_address_area` VALUES ('360734', '0', '100', '360700', '寻乌县');
INSERT INTO `sys_address_area` VALUES ('360735', '0', '100', '360700', '石城县');
INSERT INTO `sys_address_area` VALUES ('360781', '0', '100', '360700', '瑞金市');
INSERT INTO `sys_address_area` VALUES ('360782', '0', '100', '360700', '南康市');
INSERT INTO `sys_address_area` VALUES ('360801', '0', '100', '360800', '市辖区');
INSERT INTO `sys_address_area` VALUES ('360802', '0', '100', '360800', '吉州区');
INSERT INTO `sys_address_area` VALUES ('360803', '0', '100', '360800', '青原区');
INSERT INTO `sys_address_area` VALUES ('360821', '0', '100', '360800', '吉安县');
INSERT INTO `sys_address_area` VALUES ('360822', '0', '100', '360800', '吉水县');
INSERT INTO `sys_address_area` VALUES ('360823', '0', '100', '360800', '峡江县');
INSERT INTO `sys_address_area` VALUES ('360824', '0', '100', '360800', '新干县');
INSERT INTO `sys_address_area` VALUES ('360825', '0', '100', '360800', '永丰县');
INSERT INTO `sys_address_area` VALUES ('360826', '0', '100', '360800', '泰和县');
INSERT INTO `sys_address_area` VALUES ('360827', '0', '100', '360800', '遂川县');
INSERT INTO `sys_address_area` VALUES ('360828', '0', '100', '360800', '万安县');
INSERT INTO `sys_address_area` VALUES ('360829', '0', '100', '360800', '安福县');
INSERT INTO `sys_address_area` VALUES ('360830', '0', '100', '360800', '永新县');
INSERT INTO `sys_address_area` VALUES ('360881', '0', '100', '360800', '井冈山市');
INSERT INTO `sys_address_area` VALUES ('360901', '0', '100', '360900', '市辖区');
INSERT INTO `sys_address_area` VALUES ('360902', '0', '100', '360900', '袁州区');
INSERT INTO `sys_address_area` VALUES ('360921', '0', '100', '360900', '奉新县');
INSERT INTO `sys_address_area` VALUES ('360922', '0', '100', '360900', '万载县');
INSERT INTO `sys_address_area` VALUES ('360923', '0', '100', '360900', '上高县');
INSERT INTO `sys_address_area` VALUES ('360924', '0', '100', '360900', '宜丰县');
INSERT INTO `sys_address_area` VALUES ('360925', '0', '100', '360900', '靖安县');
INSERT INTO `sys_address_area` VALUES ('360926', '0', '100', '360900', '铜鼓县');
INSERT INTO `sys_address_area` VALUES ('360981', '0', '100', '360900', '丰城市');
INSERT INTO `sys_address_area` VALUES ('360982', '0', '100', '360900', '樟树市');
INSERT INTO `sys_address_area` VALUES ('360983', '0', '100', '360900', '高安市');
INSERT INTO `sys_address_area` VALUES ('361001', '0', '100', '361000', '市辖区');
INSERT INTO `sys_address_area` VALUES ('361002', '0', '100', '361000', '临川区');
INSERT INTO `sys_address_area` VALUES ('361021', '0', '100', '361000', '南城县');
INSERT INTO `sys_address_area` VALUES ('361022', '0', '100', '361000', '黎川县');
INSERT INTO `sys_address_area` VALUES ('361023', '0', '100', '361000', '南丰县');
INSERT INTO `sys_address_area` VALUES ('361024', '0', '100', '361000', '崇仁县');
INSERT INTO `sys_address_area` VALUES ('361025', '0', '100', '361000', '乐安县');
INSERT INTO `sys_address_area` VALUES ('361026', '0', '100', '361000', '宜黄县');
INSERT INTO `sys_address_area` VALUES ('361027', '0', '100', '361000', '金溪县');
INSERT INTO `sys_address_area` VALUES ('361028', '0', '100', '361000', '资溪县');
INSERT INTO `sys_address_area` VALUES ('361029', '0', '100', '361000', '东乡县');
INSERT INTO `sys_address_area` VALUES ('361030', '0', '100', '361000', '广昌县');
INSERT INTO `sys_address_area` VALUES ('361101', '0', '100', '361100', '市辖区');
INSERT INTO `sys_address_area` VALUES ('361102', '0', '100', '361100', '信州区');
INSERT INTO `sys_address_area` VALUES ('361121', '0', '100', '361100', '上饶县');
INSERT INTO `sys_address_area` VALUES ('361122', '0', '100', '361100', '广丰县');
INSERT INTO `sys_address_area` VALUES ('361123', '0', '100', '361100', '玉山县');
INSERT INTO `sys_address_area` VALUES ('361124', '0', '100', '361100', '铅山县');
INSERT INTO `sys_address_area` VALUES ('361125', '0', '100', '361100', '横峰县');
INSERT INTO `sys_address_area` VALUES ('361126', '0', '100', '361100', '弋阳县');
INSERT INTO `sys_address_area` VALUES ('361127', '0', '100', '361100', '余干县');
INSERT INTO `sys_address_area` VALUES ('361128', '0', '100', '361100', '鄱阳县');
INSERT INTO `sys_address_area` VALUES ('361129', '0', '100', '361100', '万年县');
INSERT INTO `sys_address_area` VALUES ('361130', '0', '100', '361100', '婺源县');
INSERT INTO `sys_address_area` VALUES ('361181', '0', '100', '361100', '德兴市');
INSERT INTO `sys_address_area` VALUES ('370101', '0', '100', '370100', '市辖区');
INSERT INTO `sys_address_area` VALUES ('370102', '0', '100', '370100', '历下区');
INSERT INTO `sys_address_area` VALUES ('370103', '0', '100', '370100', '市中区');
INSERT INTO `sys_address_area` VALUES ('370104', '0', '100', '370100', '槐荫区');
INSERT INTO `sys_address_area` VALUES ('370105', '0', '100', '370100', '天桥区');
INSERT INTO `sys_address_area` VALUES ('370112', '0', '100', '370100', '历城区');
INSERT INTO `sys_address_area` VALUES ('370113', '0', '100', '370100', '长清区');
INSERT INTO `sys_address_area` VALUES ('370124', '0', '100', '370100', '平阴县');
INSERT INTO `sys_address_area` VALUES ('370125', '0', '100', '370100', '济阳县');
INSERT INTO `sys_address_area` VALUES ('370126', '0', '100', '370100', '商河县');
INSERT INTO `sys_address_area` VALUES ('370181', '0', '100', '370100', '章丘市');
INSERT INTO `sys_address_area` VALUES ('370201', '0', '100', '370200', '市辖区');
INSERT INTO `sys_address_area` VALUES ('370202', '0', '100', '370200', '市南区');
INSERT INTO `sys_address_area` VALUES ('370203', '0', '100', '370200', '市北区');
INSERT INTO `sys_address_area` VALUES ('370205', '0', '100', '370200', '四方区');
INSERT INTO `sys_address_area` VALUES ('370211', '0', '100', '370200', '黄岛区');
INSERT INTO `sys_address_area` VALUES ('370212', '0', '100', '370200', '崂山区');
INSERT INTO `sys_address_area` VALUES ('370213', '0', '100', '370200', '李沧区');
INSERT INTO `sys_address_area` VALUES ('370214', '0', '100', '370200', '城阳区');
INSERT INTO `sys_address_area` VALUES ('370281', '0', '100', '370200', '胶州市');
INSERT INTO `sys_address_area` VALUES ('370282', '0', '100', '370200', '即墨市');
INSERT INTO `sys_address_area` VALUES ('370283', '0', '100', '370200', '平度市');
INSERT INTO `sys_address_area` VALUES ('370284', '0', '100', '370200', '胶南市');
INSERT INTO `sys_address_area` VALUES ('370285', '0', '100', '370200', '莱西市');
INSERT INTO `sys_address_area` VALUES ('370301', '0', '100', '370300', '市辖区');
INSERT INTO `sys_address_area` VALUES ('370302', '0', '100', '370300', '淄川区');
INSERT INTO `sys_address_area` VALUES ('370303', '0', '100', '370300', '张店区');
INSERT INTO `sys_address_area` VALUES ('370304', '0', '100', '370300', '博山区');
INSERT INTO `sys_address_area` VALUES ('370305', '0', '100', '370300', '临淄区');
INSERT INTO `sys_address_area` VALUES ('370306', '0', '100', '370300', '周村区');
INSERT INTO `sys_address_area` VALUES ('370321', '0', '100', '370300', '桓台县');
INSERT INTO `sys_address_area` VALUES ('370322', '0', '100', '370300', '高青县');
INSERT INTO `sys_address_area` VALUES ('370323', '0', '100', '370300', '沂源县');
INSERT INTO `sys_address_area` VALUES ('370401', '0', '100', '370400', '市辖区');
INSERT INTO `sys_address_area` VALUES ('370402', '0', '100', '370400', '市中区');
INSERT INTO `sys_address_area` VALUES ('370403', '0', '100', '370400', '薛城区');
INSERT INTO `sys_address_area` VALUES ('370404', '0', '100', '370400', '峄城区');
INSERT INTO `sys_address_area` VALUES ('370405', '0', '100', '370400', '台儿庄区');
INSERT INTO `sys_address_area` VALUES ('370406', '0', '100', '370400', '山亭区');
INSERT INTO `sys_address_area` VALUES ('370481', '0', '100', '370400', '滕州市');
INSERT INTO `sys_address_area` VALUES ('370501', '0', '100', '370500', '市辖区');
INSERT INTO `sys_address_area` VALUES ('370502', '0', '100', '370500', '东营区');
INSERT INTO `sys_address_area` VALUES ('370503', '0', '100', '370500', '河口区');
INSERT INTO `sys_address_area` VALUES ('370521', '0', '100', '370500', '垦利县');
INSERT INTO `sys_address_area` VALUES ('370522', '0', '100', '370500', '利津县');
INSERT INTO `sys_address_area` VALUES ('370523', '0', '100', '370500', '广饶县');
INSERT INTO `sys_address_area` VALUES ('370601', '0', '100', '370600', '市辖区');
INSERT INTO `sys_address_area` VALUES ('370602', '0', '100', '370600', '芝罘区');
INSERT INTO `sys_address_area` VALUES ('370611', '0', '100', '370600', '福山区');
INSERT INTO `sys_address_area` VALUES ('370612', '0', '100', '370600', '牟平区');
INSERT INTO `sys_address_area` VALUES ('370613', '0', '100', '370600', '莱山区');
INSERT INTO `sys_address_area` VALUES ('370634', '0', '100', '370600', '长岛县');
INSERT INTO `sys_address_area` VALUES ('370681', '0', '100', '370600', '龙口市');
INSERT INTO `sys_address_area` VALUES ('370682', '0', '100', '370600', '莱阳市');
INSERT INTO `sys_address_area` VALUES ('370683', '0', '100', '370600', '莱州市');
INSERT INTO `sys_address_area` VALUES ('370684', '0', '100', '370600', '蓬莱市');
INSERT INTO `sys_address_area` VALUES ('370685', '0', '100', '370600', '招远市');
INSERT INTO `sys_address_area` VALUES ('370686', '0', '100', '370600', '栖霞市');
INSERT INTO `sys_address_area` VALUES ('370687', '0', '100', '370600', '海阳市');
INSERT INTO `sys_address_area` VALUES ('370701', '0', '100', '370700', '市辖区');
INSERT INTO `sys_address_area` VALUES ('370702', '0', '100', '370700', '潍城区');
INSERT INTO `sys_address_area` VALUES ('370703', '0', '100', '370700', '寒亭区');
INSERT INTO `sys_address_area` VALUES ('370704', '0', '100', '370700', '坊子区');
INSERT INTO `sys_address_area` VALUES ('370705', '0', '100', '370700', '奎文区');
INSERT INTO `sys_address_area` VALUES ('370724', '0', '100', '370700', '临朐县');
INSERT INTO `sys_address_area` VALUES ('370725', '0', '100', '370700', '昌乐县');
INSERT INTO `sys_address_area` VALUES ('370781', '0', '100', '370700', '青州市');
INSERT INTO `sys_address_area` VALUES ('370782', '0', '100', '370700', '诸城市');
INSERT INTO `sys_address_area` VALUES ('370783', '0', '100', '370700', '寿光市');
INSERT INTO `sys_address_area` VALUES ('370784', '0', '100', '370700', '安丘市');
INSERT INTO `sys_address_area` VALUES ('370785', '0', '100', '370700', '高密市');
INSERT INTO `sys_address_area` VALUES ('370786', '0', '100', '370700', '昌邑市');
INSERT INTO `sys_address_area` VALUES ('370801', '0', '100', '370800', '市辖区');
INSERT INTO `sys_address_area` VALUES ('370802', '0', '100', '370800', '市中区');
INSERT INTO `sys_address_area` VALUES ('370811', '0', '100', '370800', '任城区');
INSERT INTO `sys_address_area` VALUES ('370826', '0', '100', '370800', '微山县');
INSERT INTO `sys_address_area` VALUES ('370827', '0', '100', '370800', '鱼台县');
INSERT INTO `sys_address_area` VALUES ('370828', '0', '100', '370800', '金乡县');
INSERT INTO `sys_address_area` VALUES ('370829', '0', '100', '370800', '嘉祥县');
INSERT INTO `sys_address_area` VALUES ('370830', '0', '100', '370800', '汶上县');
INSERT INTO `sys_address_area` VALUES ('370831', '0', '100', '370800', '泗水县');
INSERT INTO `sys_address_area` VALUES ('370832', '0', '100', '370800', '梁山县');
INSERT INTO `sys_address_area` VALUES ('370881', '0', '100', '370800', '曲阜市');
INSERT INTO `sys_address_area` VALUES ('370882', '0', '100', '370800', '兖州市');
INSERT INTO `sys_address_area` VALUES ('370883', '0', '100', '370800', '邹城市');
INSERT INTO `sys_address_area` VALUES ('370901', '0', '100', '370900', '市辖区');
INSERT INTO `sys_address_area` VALUES ('370902', '0', '100', '370900', '泰山区');
INSERT INTO `sys_address_area` VALUES ('370903', '0', '100', '370900', '岱岳区');
INSERT INTO `sys_address_area` VALUES ('370921', '0', '100', '370900', '宁阳县');
INSERT INTO `sys_address_area` VALUES ('370923', '0', '100', '370900', '东平县');
INSERT INTO `sys_address_area` VALUES ('370982', '0', '100', '370900', '新泰市');
INSERT INTO `sys_address_area` VALUES ('370983', '0', '100', '370900', '肥城市');
INSERT INTO `sys_address_area` VALUES ('371001', '0', '100', '371000', '市辖区');
INSERT INTO `sys_address_area` VALUES ('371002', '0', '100', '371000', '环翠区');
INSERT INTO `sys_address_area` VALUES ('371081', '0', '100', '371000', '文登市');
INSERT INTO `sys_address_area` VALUES ('371082', '0', '100', '371000', '荣成市');
INSERT INTO `sys_address_area` VALUES ('371083', '0', '100', '371000', '乳山市');
INSERT INTO `sys_address_area` VALUES ('371101', '0', '100', '371100', '市辖区');
INSERT INTO `sys_address_area` VALUES ('371102', '0', '100', '371100', '东港区');
INSERT INTO `sys_address_area` VALUES ('371103', '0', '100', '371100', '岚山区');
INSERT INTO `sys_address_area` VALUES ('371121', '0', '100', '371100', '五莲县');
INSERT INTO `sys_address_area` VALUES ('371122', '0', '100', '371100', '莒　县');
INSERT INTO `sys_address_area` VALUES ('371201', '0', '100', '371200', '市辖区');
INSERT INTO `sys_address_area` VALUES ('371202', '0', '100', '371200', '莱城区');
INSERT INTO `sys_address_area` VALUES ('371203', '0', '100', '371200', '钢城区');
INSERT INTO `sys_address_area` VALUES ('371301', '0', '100', '371300', '市辖区');
INSERT INTO `sys_address_area` VALUES ('371302', '0', '100', '371300', '兰山区');
INSERT INTO `sys_address_area` VALUES ('371311', '0', '100', '371300', '罗庄区');
INSERT INTO `sys_address_area` VALUES ('371312', '0', '100', '371300', '河东区');
INSERT INTO `sys_address_area` VALUES ('371321', '0', '100', '371300', '沂南县');
INSERT INTO `sys_address_area` VALUES ('371322', '0', '100', '371300', '郯城县');
INSERT INTO `sys_address_area` VALUES ('371323', '0', '100', '371300', '沂水县');
INSERT INTO `sys_address_area` VALUES ('371324', '0', '100', '371300', '苍山县');
INSERT INTO `sys_address_area` VALUES ('371325', '0', '100', '371300', '费　县');
INSERT INTO `sys_address_area` VALUES ('371326', '0', '100', '371300', '平邑县');
INSERT INTO `sys_address_area` VALUES ('371327', '0', '100', '371300', '莒南县');
INSERT INTO `sys_address_area` VALUES ('371328', '0', '100', '371300', '蒙阴县');
INSERT INTO `sys_address_area` VALUES ('371329', '0', '100', '371300', '临沭县');
INSERT INTO `sys_address_area` VALUES ('371401', '0', '100', '371400', '市辖区');
INSERT INTO `sys_address_area` VALUES ('371402', '0', '100', '371400', '德城区');
INSERT INTO `sys_address_area` VALUES ('371421', '0', '100', '371400', '陵　县');
INSERT INTO `sys_address_area` VALUES ('371422', '0', '100', '371400', '宁津县');
INSERT INTO `sys_address_area` VALUES ('371423', '0', '100', '371400', '庆云县');
INSERT INTO `sys_address_area` VALUES ('371424', '0', '100', '371400', '临邑县');
INSERT INTO `sys_address_area` VALUES ('371425', '0', '100', '371400', '齐河县');
INSERT INTO `sys_address_area` VALUES ('371426', '0', '100', '371400', '平原县');
INSERT INTO `sys_address_area` VALUES ('371427', '0', '100', '371400', '夏津县');
INSERT INTO `sys_address_area` VALUES ('371428', '0', '100', '371400', '武城县');
INSERT INTO `sys_address_area` VALUES ('371481', '0', '100', '371400', '乐陵市');
INSERT INTO `sys_address_area` VALUES ('371482', '0', '100', '371400', '禹城市');
INSERT INTO `sys_address_area` VALUES ('371501', '0', '100', '371500', '市辖区');
INSERT INTO `sys_address_area` VALUES ('371502', '0', '100', '371500', '东昌府区');
INSERT INTO `sys_address_area` VALUES ('371521', '0', '100', '371500', '阳谷县');
INSERT INTO `sys_address_area` VALUES ('371522', '0', '100', '371500', '莘　县');
INSERT INTO `sys_address_area` VALUES ('371523', '0', '100', '371500', '茌平县');
INSERT INTO `sys_address_area` VALUES ('371524', '0', '100', '371500', '东阿县');
INSERT INTO `sys_address_area` VALUES ('371525', '0', '100', '371500', '冠　县');
INSERT INTO `sys_address_area` VALUES ('371526', '0', '100', '371500', '高唐县');
INSERT INTO `sys_address_area` VALUES ('371581', '0', '100', '371500', '临清市');
INSERT INTO `sys_address_area` VALUES ('371601', '0', '100', '371600', '市辖区');
INSERT INTO `sys_address_area` VALUES ('371602', '0', '100', '371600', '滨城区');
INSERT INTO `sys_address_area` VALUES ('371621', '0', '100', '371600', '惠民县');
INSERT INTO `sys_address_area` VALUES ('371622', '0', '100', '371600', '阳信县');
INSERT INTO `sys_address_area` VALUES ('371623', '0', '100', '371600', '无棣县');
INSERT INTO `sys_address_area` VALUES ('371624', '0', '100', '371600', '沾化县');
INSERT INTO `sys_address_area` VALUES ('371625', '0', '100', '371600', '博兴县');
INSERT INTO `sys_address_area` VALUES ('371626', '0', '100', '371600', '邹平县');
INSERT INTO `sys_address_area` VALUES ('371701', '0', '100', '371700', '市辖区');
INSERT INTO `sys_address_area` VALUES ('371702', '0', '100', '371700', '牡丹区');
INSERT INTO `sys_address_area` VALUES ('371721', '0', '100', '371700', '曹　县');
INSERT INTO `sys_address_area` VALUES ('371722', '0', '100', '371700', '单　县');
INSERT INTO `sys_address_area` VALUES ('371723', '0', '100', '371700', '成武县');
INSERT INTO `sys_address_area` VALUES ('371724', '0', '100', '371700', '巨野县');
INSERT INTO `sys_address_area` VALUES ('371725', '0', '100', '371700', '郓城县');
INSERT INTO `sys_address_area` VALUES ('371726', '0', '100', '371700', '鄄城县');
INSERT INTO `sys_address_area` VALUES ('371727', '0', '100', '371700', '定陶县');
INSERT INTO `sys_address_area` VALUES ('371728', '0', '100', '371700', '东明县');
INSERT INTO `sys_address_area` VALUES ('410101', '0', '100', '410100', '市辖区');
INSERT INTO `sys_address_area` VALUES ('410102', '0', '100', '410100', '中原区');
INSERT INTO `sys_address_area` VALUES ('410103', '0', '100', '410100', '二七区');
INSERT INTO `sys_address_area` VALUES ('410104', '0', '100', '410100', '管城回族区');
INSERT INTO `sys_address_area` VALUES ('410105', '0', '100', '410100', '金水区');
INSERT INTO `sys_address_area` VALUES ('410106', '0', '100', '410100', '上街区');
INSERT INTO `sys_address_area` VALUES ('410108', '0', '100', '410100', '邙山区');
INSERT INTO `sys_address_area` VALUES ('410122', '0', '100', '410100', '中牟县');
INSERT INTO `sys_address_area` VALUES ('410181', '0', '100', '410100', '巩义市');
INSERT INTO `sys_address_area` VALUES ('410182', '0', '100', '410100', '荥阳市');
INSERT INTO `sys_address_area` VALUES ('410183', '0', '100', '410100', '新密市');
INSERT INTO `sys_address_area` VALUES ('410184', '0', '100', '410100', '新郑市');
INSERT INTO `sys_address_area` VALUES ('410185', '0', '100', '410100', '登封市');
INSERT INTO `sys_address_area` VALUES ('410201', '0', '100', '410200', '市辖区');
INSERT INTO `sys_address_area` VALUES ('410202', '0', '100', '410200', '龙亭区');
INSERT INTO `sys_address_area` VALUES ('410203', '0', '100', '410200', '顺河回族区');
INSERT INTO `sys_address_area` VALUES ('410204', '0', '100', '410200', '鼓楼区');
INSERT INTO `sys_address_area` VALUES ('410205', '0', '100', '410200', '南关区');
INSERT INTO `sys_address_area` VALUES ('410211', '0', '100', '410200', '郊　区');
INSERT INTO `sys_address_area` VALUES ('410221', '0', '100', '410200', '杞　县');
INSERT INTO `sys_address_area` VALUES ('410222', '0', '100', '410200', '通许县');
INSERT INTO `sys_address_area` VALUES ('410223', '0', '100', '410200', '尉氏县');
INSERT INTO `sys_address_area` VALUES ('410224', '0', '100', '410200', '开封县');
INSERT INTO `sys_address_area` VALUES ('410225', '0', '100', '410200', '兰考县');
INSERT INTO `sys_address_area` VALUES ('410301', '0', '100', '410300', '市辖区');
INSERT INTO `sys_address_area` VALUES ('410302', '0', '100', '410300', '老城区');
INSERT INTO `sys_address_area` VALUES ('410303', '0', '100', '410300', '西工区');
INSERT INTO `sys_address_area` VALUES ('410304', '0', '100', '410300', '廛河回族区');
INSERT INTO `sys_address_area` VALUES ('410305', '0', '100', '410300', '涧西区');
INSERT INTO `sys_address_area` VALUES ('410306', '0', '100', '410300', '吉利区');
INSERT INTO `sys_address_area` VALUES ('410307', '0', '100', '410300', '洛龙区');
INSERT INTO `sys_address_area` VALUES ('410322', '0', '100', '410300', '孟津县');
INSERT INTO `sys_address_area` VALUES ('410323', '0', '100', '410300', '新安县');
INSERT INTO `sys_address_area` VALUES ('410324', '0', '100', '410300', '栾川县');
INSERT INTO `sys_address_area` VALUES ('410325', '0', '100', '410300', '嵩　县');
INSERT INTO `sys_address_area` VALUES ('410326', '0', '100', '410300', '汝阳县');
INSERT INTO `sys_address_area` VALUES ('410327', '0', '100', '410300', '宜阳县');
INSERT INTO `sys_address_area` VALUES ('410328', '0', '100', '410300', '洛宁县');
INSERT INTO `sys_address_area` VALUES ('410329', '0', '100', '410300', '伊川县');
INSERT INTO `sys_address_area` VALUES ('410381', '0', '100', '410300', '偃师市');
INSERT INTO `sys_address_area` VALUES ('410401', '0', '100', '410400', '市辖区');
INSERT INTO `sys_address_area` VALUES ('410402', '0', '100', '410400', '新华区');
INSERT INTO `sys_address_area` VALUES ('410403', '0', '100', '410400', '卫东区');
INSERT INTO `sys_address_area` VALUES ('410404', '0', '100', '410400', '石龙区');
INSERT INTO `sys_address_area` VALUES ('410411', '0', '100', '410400', '湛河区');
INSERT INTO `sys_address_area` VALUES ('410421', '0', '100', '410400', '宝丰县');
INSERT INTO `sys_address_area` VALUES ('410422', '0', '100', '410400', '叶　县');
INSERT INTO `sys_address_area` VALUES ('410423', '0', '100', '410400', '鲁山县');
INSERT INTO `sys_address_area` VALUES ('410425', '0', '100', '410400', '郏　县');
INSERT INTO `sys_address_area` VALUES ('410481', '0', '100', '410400', '舞钢市');
INSERT INTO `sys_address_area` VALUES ('410482', '0', '100', '410400', '汝州市');
INSERT INTO `sys_address_area` VALUES ('410501', '0', '100', '410500', '市辖区');
INSERT INTO `sys_address_area` VALUES ('410502', '0', '100', '410500', '文峰区');
INSERT INTO `sys_address_area` VALUES ('410503', '0', '100', '410500', '北关区');
INSERT INTO `sys_address_area` VALUES ('410505', '0', '100', '410500', '殷都区');
INSERT INTO `sys_address_area` VALUES ('410506', '0', '100', '410500', '龙安区');
INSERT INTO `sys_address_area` VALUES ('410522', '0', '100', '410500', '安阳县');
INSERT INTO `sys_address_area` VALUES ('410523', '0', '100', '410500', '汤阴县');
INSERT INTO `sys_address_area` VALUES ('410526', '0', '100', '410500', '滑　县');
INSERT INTO `sys_address_area` VALUES ('410527', '0', '100', '410500', '内黄县');
INSERT INTO `sys_address_area` VALUES ('410581', '0', '100', '410500', '林州市');
INSERT INTO `sys_address_area` VALUES ('410601', '0', '100', '410600', '市辖区');
INSERT INTO `sys_address_area` VALUES ('410602', '0', '100', '410600', '鹤山区');
INSERT INTO `sys_address_area` VALUES ('410603', '0', '100', '410600', '山城区');
INSERT INTO `sys_address_area` VALUES ('410611', '0', '100', '410600', '淇滨区');
INSERT INTO `sys_address_area` VALUES ('410621', '0', '100', '410600', '浚　县');
INSERT INTO `sys_address_area` VALUES ('410622', '0', '100', '410600', '淇　县');
INSERT INTO `sys_address_area` VALUES ('410701', '0', '100', '410700', '市辖区');
INSERT INTO `sys_address_area` VALUES ('410702', '0', '100', '410700', '红旗区');
INSERT INTO `sys_address_area` VALUES ('410703', '0', '100', '410700', '卫滨区');
INSERT INTO `sys_address_area` VALUES ('410704', '0', '100', '410700', '凤泉区');
INSERT INTO `sys_address_area` VALUES ('410711', '0', '100', '410700', '牧野区');
INSERT INTO `sys_address_area` VALUES ('410721', '0', '100', '410700', '新乡县');
INSERT INTO `sys_address_area` VALUES ('410724', '0', '100', '410700', '获嘉县');
INSERT INTO `sys_address_area` VALUES ('410725', '0', '100', '410700', '原阳县');
INSERT INTO `sys_address_area` VALUES ('410726', '0', '100', '410700', '延津县');
INSERT INTO `sys_address_area` VALUES ('410727', '0', '100', '410700', '封丘县');
INSERT INTO `sys_address_area` VALUES ('410728', '0', '100', '410700', '长垣县');
INSERT INTO `sys_address_area` VALUES ('410781', '0', '100', '410700', '卫辉市');
INSERT INTO `sys_address_area` VALUES ('410782', '0', '100', '410700', '辉县市');
INSERT INTO `sys_address_area` VALUES ('410801', '0', '100', '410800', '市辖区');
INSERT INTO `sys_address_area` VALUES ('410802', '0', '100', '410800', '解放区');
INSERT INTO `sys_address_area` VALUES ('410803', '0', '100', '410800', '中站区');
INSERT INTO `sys_address_area` VALUES ('410804', '0', '100', '410800', '马村区');
INSERT INTO `sys_address_area` VALUES ('410811', '0', '100', '410800', '山阳区');
INSERT INTO `sys_address_area` VALUES ('410821', '0', '100', '410800', '修武县');
INSERT INTO `sys_address_area` VALUES ('410822', '0', '100', '410800', '博爱县');
INSERT INTO `sys_address_area` VALUES ('410823', '0', '100', '410800', '武陟县');
INSERT INTO `sys_address_area` VALUES ('410825', '0', '100', '410800', '温　县');
INSERT INTO `sys_address_area` VALUES ('410881', '0', '100', '410800', '济源市');
INSERT INTO `sys_address_area` VALUES ('410882', '0', '100', '410800', '沁阳市');
INSERT INTO `sys_address_area` VALUES ('410883', '0', '100', '410800', '孟州市');
INSERT INTO `sys_address_area` VALUES ('410901', '0', '100', '410900', '市辖区');
INSERT INTO `sys_address_area` VALUES ('410902', '0', '100', '410900', '华龙区');
INSERT INTO `sys_address_area` VALUES ('410922', '0', '100', '410900', '清丰县');
INSERT INTO `sys_address_area` VALUES ('410923', '0', '100', '410900', '南乐县');
INSERT INTO `sys_address_area` VALUES ('410926', '0', '100', '410900', '范　县');
INSERT INTO `sys_address_area` VALUES ('410927', '0', '100', '410900', '台前县');
INSERT INTO `sys_address_area` VALUES ('410928', '0', '100', '410900', '濮阳县');
INSERT INTO `sys_address_area` VALUES ('411001', '0', '100', '411000', '市辖区');
INSERT INTO `sys_address_area` VALUES ('411002', '0', '100', '411000', '魏都区');
INSERT INTO `sys_address_area` VALUES ('411023', '0', '100', '411000', '许昌县');
INSERT INTO `sys_address_area` VALUES ('411024', '0', '100', '411000', '鄢陵县');
INSERT INTO `sys_address_area` VALUES ('411025', '0', '100', '411000', '襄城县');
INSERT INTO `sys_address_area` VALUES ('411081', '0', '100', '411000', '禹州市');
INSERT INTO `sys_address_area` VALUES ('411082', '0', '100', '411000', '长葛市');
INSERT INTO `sys_address_area` VALUES ('411101', '0', '100', '411100', '市辖区');
INSERT INTO `sys_address_area` VALUES ('411102', '0', '100', '411100', '源汇区');
INSERT INTO `sys_address_area` VALUES ('411103', '0', '100', '411100', '郾城区');
INSERT INTO `sys_address_area` VALUES ('411104', '0', '100', '411100', '召陵区');
INSERT INTO `sys_address_area` VALUES ('411121', '0', '100', '411100', '舞阳县');
INSERT INTO `sys_address_area` VALUES ('411122', '0', '100', '411100', '临颍县');
INSERT INTO `sys_address_area` VALUES ('411201', '0', '100', '411200', '市辖区');
INSERT INTO `sys_address_area` VALUES ('411202', '0', '100', '411200', '湖滨区');
INSERT INTO `sys_address_area` VALUES ('411221', '0', '100', '411200', '渑池县');
INSERT INTO `sys_address_area` VALUES ('411222', '0', '100', '411200', '陕　县');
INSERT INTO `sys_address_area` VALUES ('411224', '0', '100', '411200', '卢氏县');
INSERT INTO `sys_address_area` VALUES ('411281', '0', '100', '411200', '义马市');
INSERT INTO `sys_address_area` VALUES ('411282', '0', '100', '411200', '灵宝市');
INSERT INTO `sys_address_area` VALUES ('411301', '0', '100', '411300', '市辖区');
INSERT INTO `sys_address_area` VALUES ('411302', '0', '100', '411300', '宛城区');
INSERT INTO `sys_address_area` VALUES ('411303', '0', '100', '411300', '卧龙区');
INSERT INTO `sys_address_area` VALUES ('411321', '0', '100', '411300', '南召县');
INSERT INTO `sys_address_area` VALUES ('411322', '0', '100', '411300', '方城县');
INSERT INTO `sys_address_area` VALUES ('411323', '0', '100', '411300', '西峡县');
INSERT INTO `sys_address_area` VALUES ('411324', '0', '100', '411300', '镇平县');
INSERT INTO `sys_address_area` VALUES ('411325', '0', '100', '411300', '内乡县');
INSERT INTO `sys_address_area` VALUES ('411326', '0', '100', '411300', '淅川县');
INSERT INTO `sys_address_area` VALUES ('411327', '0', '100', '411300', '社旗县');
INSERT INTO `sys_address_area` VALUES ('411328', '0', '100', '411300', '唐河县');
INSERT INTO `sys_address_area` VALUES ('411329', '0', '100', '411300', '新野县');
INSERT INTO `sys_address_area` VALUES ('411330', '0', '100', '411300', '桐柏县');
INSERT INTO `sys_address_area` VALUES ('411381', '0', '100', '411300', '邓州市');
INSERT INTO `sys_address_area` VALUES ('411401', '0', '100', '411400', '市辖区');
INSERT INTO `sys_address_area` VALUES ('411402', '0', '100', '411400', '梁园区');
INSERT INTO `sys_address_area` VALUES ('411403', '0', '100', '411400', '睢阳区');
INSERT INTO `sys_address_area` VALUES ('411421', '0', '100', '411400', '民权县');
INSERT INTO `sys_address_area` VALUES ('411422', '0', '100', '411400', '睢　县');
INSERT INTO `sys_address_area` VALUES ('411423', '0', '100', '411400', '宁陵县');
INSERT INTO `sys_address_area` VALUES ('411424', '0', '100', '411400', '柘城县');
INSERT INTO `sys_address_area` VALUES ('411425', '0', '100', '411400', '虞城县');
INSERT INTO `sys_address_area` VALUES ('411426', '0', '100', '411400', '夏邑县');
INSERT INTO `sys_address_area` VALUES ('411481', '0', '100', '411400', '永城市');
INSERT INTO `sys_address_area` VALUES ('411501', '0', '100', '411500', '市辖区');
INSERT INTO `sys_address_area` VALUES ('411502', '0', '100', '411500', '师河区');
INSERT INTO `sys_address_area` VALUES ('411503', '0', '100', '411500', '平桥区');
INSERT INTO `sys_address_area` VALUES ('411521', '0', '100', '411500', '罗山县');
INSERT INTO `sys_address_area` VALUES ('411522', '0', '100', '411500', '光山县');
INSERT INTO `sys_address_area` VALUES ('411523', '0', '100', '411500', '新　县');
INSERT INTO `sys_address_area` VALUES ('411524', '0', '100', '411500', '商城县');
INSERT INTO `sys_address_area` VALUES ('411525', '0', '100', '411500', '固始县');
INSERT INTO `sys_address_area` VALUES ('411526', '0', '100', '411500', '潢川县');
INSERT INTO `sys_address_area` VALUES ('411527', '0', '100', '411500', '淮滨县');
INSERT INTO `sys_address_area` VALUES ('411528', '0', '100', '411500', '息　县');
INSERT INTO `sys_address_area` VALUES ('411601', '0', '100', '411600', '市辖区');
INSERT INTO `sys_address_area` VALUES ('411602', '0', '100', '411600', '川汇区');
INSERT INTO `sys_address_area` VALUES ('411621', '0', '100', '411600', '扶沟县');
INSERT INTO `sys_address_area` VALUES ('411622', '0', '100', '411600', '西华县');
INSERT INTO `sys_address_area` VALUES ('411623', '0', '100', '411600', '商水县');
INSERT INTO `sys_address_area` VALUES ('411624', '0', '100', '411600', '沈丘县');
INSERT INTO `sys_address_area` VALUES ('411625', '0', '100', '411600', '郸城县');
INSERT INTO `sys_address_area` VALUES ('411626', '0', '100', '411600', '淮阳县');
INSERT INTO `sys_address_area` VALUES ('411627', '0', '100', '411600', '太康县');
INSERT INTO `sys_address_area` VALUES ('411628', '0', '100', '411600', '鹿邑县');
INSERT INTO `sys_address_area` VALUES ('411681', '0', '100', '411600', '项城市');
INSERT INTO `sys_address_area` VALUES ('411701', '0', '100', '411700', '市辖区');
INSERT INTO `sys_address_area` VALUES ('411702', '0', '100', '411700', '驿城区');
INSERT INTO `sys_address_area` VALUES ('411721', '0', '100', '411700', '西平县');
INSERT INTO `sys_address_area` VALUES ('411722', '0', '100', '411700', '上蔡县');
INSERT INTO `sys_address_area` VALUES ('411723', '0', '100', '411700', '平舆县');
INSERT INTO `sys_address_area` VALUES ('411724', '0', '100', '411700', '正阳县');
INSERT INTO `sys_address_area` VALUES ('411725', '0', '100', '411700', '确山县');
INSERT INTO `sys_address_area` VALUES ('411726', '0', '100', '411700', '泌阳县');
INSERT INTO `sys_address_area` VALUES ('411727', '0', '100', '411700', '汝南县');
INSERT INTO `sys_address_area` VALUES ('411728', '0', '100', '411700', '遂平县');
INSERT INTO `sys_address_area` VALUES ('411729', '0', '100', '411700', '新蔡县');
INSERT INTO `sys_address_area` VALUES ('420101', '0', '100', '420100', '市辖区');
INSERT INTO `sys_address_area` VALUES ('420102', '0', '100', '420100', '江岸区');
INSERT INTO `sys_address_area` VALUES ('420103', '0', '100', '420100', '江汉区');
INSERT INTO `sys_address_area` VALUES ('420104', '0', '100', '420100', '乔口区');
INSERT INTO `sys_address_area` VALUES ('420105', '0', '100', '420100', '汉阳区');
INSERT INTO `sys_address_area` VALUES ('420106', '0', '100', '420100', '武昌区');
INSERT INTO `sys_address_area` VALUES ('420107', '0', '100', '420100', '青山区');
INSERT INTO `sys_address_area` VALUES ('420111', '0', '100', '420100', '洪山区');
INSERT INTO `sys_address_area` VALUES ('420112', '0', '100', '420100', '东西湖区');
INSERT INTO `sys_address_area` VALUES ('420113', '0', '100', '420100', '汉南区');
INSERT INTO `sys_address_area` VALUES ('420114', '0', '100', '420100', '蔡甸区');
INSERT INTO `sys_address_area` VALUES ('420115', '0', '100', '420100', '江夏区');
INSERT INTO `sys_address_area` VALUES ('420116', '0', '100', '420100', '黄陂区');
INSERT INTO `sys_address_area` VALUES ('420117', '0', '100', '420100', '新洲区');
INSERT INTO `sys_address_area` VALUES ('420201', '0', '100', '420200', '市辖区');
INSERT INTO `sys_address_area` VALUES ('420202', '0', '100', '420200', '黄石港区');
INSERT INTO `sys_address_area` VALUES ('420203', '0', '100', '420200', '西塞山区');
INSERT INTO `sys_address_area` VALUES ('420204', '0', '100', '420200', '下陆区');
INSERT INTO `sys_address_area` VALUES ('420205', '0', '100', '420200', '铁山区');
INSERT INTO `sys_address_area` VALUES ('420222', '0', '100', '420200', '阳新县');
INSERT INTO `sys_address_area` VALUES ('420281', '0', '100', '420200', '大冶市');
INSERT INTO `sys_address_area` VALUES ('420301', '0', '100', '420300', '市辖区');
INSERT INTO `sys_address_area` VALUES ('420302', '0', '100', '420300', '茅箭区');
INSERT INTO `sys_address_area` VALUES ('420303', '0', '100', '420300', '张湾区');
INSERT INTO `sys_address_area` VALUES ('420321', '0', '100', '420300', '郧　县');
INSERT INTO `sys_address_area` VALUES ('420322', '0', '100', '420300', '郧西县');
INSERT INTO `sys_address_area` VALUES ('420323', '0', '100', '420300', '竹山县');
INSERT INTO `sys_address_area` VALUES ('420324', '0', '100', '420300', '竹溪县');
INSERT INTO `sys_address_area` VALUES ('420325', '0', '100', '420300', '房　县');
INSERT INTO `sys_address_area` VALUES ('420381', '0', '100', '420300', '丹江口市');
INSERT INTO `sys_address_area` VALUES ('420501', '0', '100', '420500', '市辖区');
INSERT INTO `sys_address_area` VALUES ('420502', '0', '100', '420500', '西陵区');
INSERT INTO `sys_address_area` VALUES ('420503', '0', '100', '420500', '伍家岗区');
INSERT INTO `sys_address_area` VALUES ('420504', '0', '100', '420500', '点军区');
INSERT INTO `sys_address_area` VALUES ('420505', '0', '100', '420500', '猇亭区');
INSERT INTO `sys_address_area` VALUES ('420506', '0', '100', '420500', '夷陵区');
INSERT INTO `sys_address_area` VALUES ('420525', '0', '100', '420500', '远安县');
INSERT INTO `sys_address_area` VALUES ('420526', '0', '100', '420500', '兴山县');
INSERT INTO `sys_address_area` VALUES ('420527', '0', '100', '420500', '秭归县');
INSERT INTO `sys_address_area` VALUES ('420528', '0', '100', '420500', '长阳土家族自治县');
INSERT INTO `sys_address_area` VALUES ('420529', '0', '100', '420500', '五峰土家族自治县');
INSERT INTO `sys_address_area` VALUES ('420581', '0', '100', '420500', '宜都市');
INSERT INTO `sys_address_area` VALUES ('420582', '0', '100', '420500', '当阳市');
INSERT INTO `sys_address_area` VALUES ('420583', '0', '100', '420500', '枝江市');
INSERT INTO `sys_address_area` VALUES ('420601', '0', '100', '420600', '市辖区');
INSERT INTO `sys_address_area` VALUES ('420602', '0', '100', '420600', '襄城区');
INSERT INTO `sys_address_area` VALUES ('420606', '0', '100', '420600', '樊城区');
INSERT INTO `sys_address_area` VALUES ('420607', '0', '100', '420600', '襄阳区');
INSERT INTO `sys_address_area` VALUES ('420624', '0', '100', '420600', '南漳县');
INSERT INTO `sys_address_area` VALUES ('420625', '0', '100', '420600', '谷城县');
INSERT INTO `sys_address_area` VALUES ('420626', '0', '100', '420600', '保康县');
INSERT INTO `sys_address_area` VALUES ('420682', '0', '100', '420600', '老河口市');
INSERT INTO `sys_address_area` VALUES ('420683', '0', '100', '420600', '枣阳市');
INSERT INTO `sys_address_area` VALUES ('420684', '0', '100', '420600', '宜城市');
INSERT INTO `sys_address_area` VALUES ('420701', '0', '100', '420700', '市辖区');
INSERT INTO `sys_address_area` VALUES ('420702', '0', '100', '420700', '梁子湖区');
INSERT INTO `sys_address_area` VALUES ('420703', '0', '100', '420700', '华容区');
INSERT INTO `sys_address_area` VALUES ('420704', '0', '100', '420700', '鄂城区');
INSERT INTO `sys_address_area` VALUES ('420801', '0', '100', '420800', '市辖区');
INSERT INTO `sys_address_area` VALUES ('420802', '0', '100', '420800', '东宝区');
INSERT INTO `sys_address_area` VALUES ('420804', '0', '100', '420800', '掇刀区');
INSERT INTO `sys_address_area` VALUES ('420821', '0', '100', '420800', '京山县');
INSERT INTO `sys_address_area` VALUES ('420822', '0', '100', '420800', '沙洋县');
INSERT INTO `sys_address_area` VALUES ('420881', '0', '100', '420800', '钟祥市');
INSERT INTO `sys_address_area` VALUES ('420901', '0', '100', '420900', '市辖区');
INSERT INTO `sys_address_area` VALUES ('420902', '0', '100', '420900', '孝南区');
INSERT INTO `sys_address_area` VALUES ('420921', '0', '100', '420900', '孝昌县');
INSERT INTO `sys_address_area` VALUES ('420922', '0', '100', '420900', '大悟县');
INSERT INTO `sys_address_area` VALUES ('420923', '0', '100', '420900', '云梦县');
INSERT INTO `sys_address_area` VALUES ('420981', '0', '100', '420900', '应城市');
INSERT INTO `sys_address_area` VALUES ('420982', '0', '100', '420900', '安陆市');
INSERT INTO `sys_address_area` VALUES ('420984', '0', '100', '420900', '汉川市');
INSERT INTO `sys_address_area` VALUES ('421001', '0', '100', '421000', '市辖区');
INSERT INTO `sys_address_area` VALUES ('421002', '0', '100', '421000', '沙市区');
INSERT INTO `sys_address_area` VALUES ('421003', '0', '100', '421000', '荆州区');
INSERT INTO `sys_address_area` VALUES ('421022', '0', '100', '421000', '公安县');
INSERT INTO `sys_address_area` VALUES ('421023', '0', '100', '421000', '监利县');
INSERT INTO `sys_address_area` VALUES ('421024', '0', '100', '421000', '江陵县');
INSERT INTO `sys_address_area` VALUES ('421081', '0', '100', '421000', '石首市');
INSERT INTO `sys_address_area` VALUES ('421083', '0', '100', '421000', '洪湖市');
INSERT INTO `sys_address_area` VALUES ('421087', '0', '100', '421000', '松滋市');
INSERT INTO `sys_address_area` VALUES ('421101', '0', '100', '421100', '市辖区');
INSERT INTO `sys_address_area` VALUES ('421102', '0', '100', '421100', '黄州区');
INSERT INTO `sys_address_area` VALUES ('421121', '0', '100', '421100', '团风县');
INSERT INTO `sys_address_area` VALUES ('421122', '0', '100', '421100', '红安县');
INSERT INTO `sys_address_area` VALUES ('421123', '0', '100', '421100', '罗田县');
INSERT INTO `sys_address_area` VALUES ('421124', '0', '100', '421100', '英山县');
INSERT INTO `sys_address_area` VALUES ('421125', '0', '100', '421100', '浠水县');
INSERT INTO `sys_address_area` VALUES ('421126', '0', '100', '421100', '蕲春县');
INSERT INTO `sys_address_area` VALUES ('421127', '0', '100', '421100', '黄梅县');
INSERT INTO `sys_address_area` VALUES ('421181', '0', '100', '421100', '麻城市');
INSERT INTO `sys_address_area` VALUES ('421182', '0', '100', '421100', '武穴市');
INSERT INTO `sys_address_area` VALUES ('421201', '0', '100', '421200', '市辖区');
INSERT INTO `sys_address_area` VALUES ('421202', '0', '100', '421200', '咸安区');
INSERT INTO `sys_address_area` VALUES ('421221', '0', '100', '421200', '嘉鱼县');
INSERT INTO `sys_address_area` VALUES ('421222', '0', '100', '421200', '通城县');
INSERT INTO `sys_address_area` VALUES ('421223', '0', '100', '421200', '崇阳县');
INSERT INTO `sys_address_area` VALUES ('421224', '0', '100', '421200', '通山县');
INSERT INTO `sys_address_area` VALUES ('421281', '0', '100', '421200', '赤壁市');
INSERT INTO `sys_address_area` VALUES ('421301', '0', '100', '421300', '市辖区');
INSERT INTO `sys_address_area` VALUES ('421302', '0', '100', '421300', '曾都区');
INSERT INTO `sys_address_area` VALUES ('421381', '0', '100', '421300', '广水市');
INSERT INTO `sys_address_area` VALUES ('422801', '0', '100', '422800', '恩施市');
INSERT INTO `sys_address_area` VALUES ('422802', '0', '100', '422800', '利川市');
INSERT INTO `sys_address_area` VALUES ('422822', '0', '100', '422800', '建始县');
INSERT INTO `sys_address_area` VALUES ('422823', '0', '100', '422800', '巴东县');
INSERT INTO `sys_address_area` VALUES ('422825', '0', '100', '422800', '宣恩县');
INSERT INTO `sys_address_area` VALUES ('422826', '0', '100', '422800', '咸丰县');
INSERT INTO `sys_address_area` VALUES ('422827', '0', '100', '422800', '来凤县');
INSERT INTO `sys_address_area` VALUES ('422828', '0', '100', '422800', '鹤峰县');
INSERT INTO `sys_address_area` VALUES ('429004', '0', '100', '429000', '仙桃市');
INSERT INTO `sys_address_area` VALUES ('429005', '0', '100', '429000', '潜江市');
INSERT INTO `sys_address_area` VALUES ('429006', '0', '100', '429000', '天门市');
INSERT INTO `sys_address_area` VALUES ('429021', '0', '100', '429000', '神农架林区');
INSERT INTO `sys_address_area` VALUES ('430101', '0', '100', '430100', '市辖区');
INSERT INTO `sys_address_area` VALUES ('430102', '0', '100', '430100', '芙蓉区');
INSERT INTO `sys_address_area` VALUES ('430103', '0', '100', '430100', '天心区');
INSERT INTO `sys_address_area` VALUES ('430104', '0', '100', '430100', '岳麓区');
INSERT INTO `sys_address_area` VALUES ('430105', '0', '100', '430100', '开福区');
INSERT INTO `sys_address_area` VALUES ('430111', '0', '100', '430100', '雨花区');
INSERT INTO `sys_address_area` VALUES ('430121', '0', '100', '430100', '长沙县');
INSERT INTO `sys_address_area` VALUES ('430122', '0', '100', '430100', '望城县');
INSERT INTO `sys_address_area` VALUES ('430124', '0', '100', '430100', '宁乡县');
INSERT INTO `sys_address_area` VALUES ('430181', '0', '100', '430100', '浏阳市');
INSERT INTO `sys_address_area` VALUES ('430201', '0', '100', '430200', '市辖区');
INSERT INTO `sys_address_area` VALUES ('430202', '0', '100', '430200', '荷塘区');
INSERT INTO `sys_address_area` VALUES ('430203', '0', '100', '430200', '芦淞区');
INSERT INTO `sys_address_area` VALUES ('430204', '0', '100', '430200', '石峰区');
INSERT INTO `sys_address_area` VALUES ('430211', '0', '100', '430200', '天元区');
INSERT INTO `sys_address_area` VALUES ('430221', '0', '100', '430200', '株洲县');
INSERT INTO `sys_address_area` VALUES ('430223', '0', '100', '430200', '攸　县');
INSERT INTO `sys_address_area` VALUES ('430224', '0', '100', '430200', '茶陵县');
INSERT INTO `sys_address_area` VALUES ('430225', '0', '100', '430200', '炎陵县');
INSERT INTO `sys_address_area` VALUES ('430281', '0', '100', '430200', '醴陵市');
INSERT INTO `sys_address_area` VALUES ('430301', '0', '100', '430300', '市辖区');
INSERT INTO `sys_address_area` VALUES ('430302', '0', '100', '430300', '雨湖区');
INSERT INTO `sys_address_area` VALUES ('430304', '0', '100', '430300', '岳塘区');
INSERT INTO `sys_address_area` VALUES ('430321', '0', '100', '430300', '湘潭县');
INSERT INTO `sys_address_area` VALUES ('430381', '0', '100', '430300', '湘乡市');
INSERT INTO `sys_address_area` VALUES ('430382', '0', '100', '430300', '韶山市');
INSERT INTO `sys_address_area` VALUES ('430401', '0', '100', '430400', '市辖区');
INSERT INTO `sys_address_area` VALUES ('430405', '0', '100', '430400', '珠晖区');
INSERT INTO `sys_address_area` VALUES ('430406', '0', '100', '430400', '雁峰区');
INSERT INTO `sys_address_area` VALUES ('430407', '0', '100', '430400', '石鼓区');
INSERT INTO `sys_address_area` VALUES ('430408', '0', '100', '430400', '蒸湘区');
INSERT INTO `sys_address_area` VALUES ('430412', '0', '100', '430400', '南岳区');
INSERT INTO `sys_address_area` VALUES ('430421', '0', '100', '430400', '衡阳县');
INSERT INTO `sys_address_area` VALUES ('430422', '0', '100', '430400', '衡南县');
INSERT INTO `sys_address_area` VALUES ('430423', '0', '100', '430400', '衡山县');
INSERT INTO `sys_address_area` VALUES ('430424', '0', '100', '430400', '衡东县');
INSERT INTO `sys_address_area` VALUES ('430426', '0', '100', '430400', '祁东县');
INSERT INTO `sys_address_area` VALUES ('430481', '0', '100', '430400', '耒阳市');
INSERT INTO `sys_address_area` VALUES ('430482', '0', '100', '430400', '常宁市');
INSERT INTO `sys_address_area` VALUES ('430501', '0', '100', '430500', '市辖区');
INSERT INTO `sys_address_area` VALUES ('430502', '0', '100', '430500', '双清区');
INSERT INTO `sys_address_area` VALUES ('430503', '0', '100', '430500', '大祥区');
INSERT INTO `sys_address_area` VALUES ('430511', '0', '100', '430500', '北塔区');
INSERT INTO `sys_address_area` VALUES ('430521', '0', '100', '430500', '邵东县');
INSERT INTO `sys_address_area` VALUES ('430522', '0', '100', '430500', '新邵县');
INSERT INTO `sys_address_area` VALUES ('430523', '0', '100', '430500', '邵阳县');
INSERT INTO `sys_address_area` VALUES ('430524', '0', '100', '430500', '隆回县');
INSERT INTO `sys_address_area` VALUES ('430525', '0', '100', '430500', '洞口县');
INSERT INTO `sys_address_area` VALUES ('430527', '0', '100', '430500', '绥宁县');
INSERT INTO `sys_address_area` VALUES ('430528', '0', '100', '430500', '新宁县');
INSERT INTO `sys_address_area` VALUES ('430529', '0', '100', '430500', '城步苗族自治县');
INSERT INTO `sys_address_area` VALUES ('430581', '0', '100', '430500', '武冈市');
INSERT INTO `sys_address_area` VALUES ('430601', '0', '100', '430600', '市辖区');
INSERT INTO `sys_address_area` VALUES ('430602', '0', '100', '430600', '岳阳楼区');
INSERT INTO `sys_address_area` VALUES ('430603', '0', '100', '430600', '云溪区');
INSERT INTO `sys_address_area` VALUES ('430611', '0', '100', '430600', '君山区');
INSERT INTO `sys_address_area` VALUES ('430621', '0', '100', '430600', '岳阳县');
INSERT INTO `sys_address_area` VALUES ('430623', '0', '100', '430600', '华容县');
INSERT INTO `sys_address_area` VALUES ('430624', '0', '100', '430600', '湘阴县');
INSERT INTO `sys_address_area` VALUES ('430626', '0', '100', '430600', '平江县');
INSERT INTO `sys_address_area` VALUES ('430681', '0', '100', '430600', '汨罗市');
INSERT INTO `sys_address_area` VALUES ('430682', '0', '100', '430600', '临湘市');
INSERT INTO `sys_address_area` VALUES ('430701', '0', '100', '430700', '市辖区');
INSERT INTO `sys_address_area` VALUES ('430702', '0', '100', '430700', '武陵区');
INSERT INTO `sys_address_area` VALUES ('430703', '0', '100', '430700', '鼎城区');
INSERT INTO `sys_address_area` VALUES ('430721', '0', '100', '430700', '安乡县');
INSERT INTO `sys_address_area` VALUES ('430722', '0', '100', '430700', '汉寿县');
INSERT INTO `sys_address_area` VALUES ('430723', '0', '100', '430700', '澧　县');
INSERT INTO `sys_address_area` VALUES ('430724', '0', '100', '430700', '临澧县');
INSERT INTO `sys_address_area` VALUES ('430725', '0', '100', '430700', '桃源县');
INSERT INTO `sys_address_area` VALUES ('430726', '0', '100', '430700', '石门县');
INSERT INTO `sys_address_area` VALUES ('430781', '0', '100', '430700', '津市市');
INSERT INTO `sys_address_area` VALUES ('430801', '0', '100', '430800', '市辖区');
INSERT INTO `sys_address_area` VALUES ('430802', '0', '100', '430800', '永定区');
INSERT INTO `sys_address_area` VALUES ('430811', '0', '100', '430800', '武陵源区');
INSERT INTO `sys_address_area` VALUES ('430821', '0', '100', '430800', '慈利县');
INSERT INTO `sys_address_area` VALUES ('430822', '0', '100', '430800', '桑植县');
INSERT INTO `sys_address_area` VALUES ('430901', '0', '100', '430900', '市辖区');
INSERT INTO `sys_address_area` VALUES ('430902', '0', '100', '430900', '资阳区');
INSERT INTO `sys_address_area` VALUES ('430903', '0', '100', '430900', '赫山区');
INSERT INTO `sys_address_area` VALUES ('430921', '0', '100', '430900', '南　县');
INSERT INTO `sys_address_area` VALUES ('430922', '0', '100', '430900', '桃江县');
INSERT INTO `sys_address_area` VALUES ('430923', '0', '100', '430900', '安化县');
INSERT INTO `sys_address_area` VALUES ('430981', '0', '100', '430900', '沅江市');
INSERT INTO `sys_address_area` VALUES ('431001', '0', '100', '431000', '市辖区');
INSERT INTO `sys_address_area` VALUES ('431002', '0', '100', '431000', '北湖区');
INSERT INTO `sys_address_area` VALUES ('431003', '0', '100', '431000', '苏仙区');
INSERT INTO `sys_address_area` VALUES ('431021', '0', '100', '431000', '桂阳县');
INSERT INTO `sys_address_area` VALUES ('431022', '0', '100', '431000', '宜章县');
INSERT INTO `sys_address_area` VALUES ('431023', '0', '100', '431000', '永兴县');
INSERT INTO `sys_address_area` VALUES ('431024', '0', '100', '431000', '嘉禾县');
INSERT INTO `sys_address_area` VALUES ('431025', '0', '100', '431000', '临武县');
INSERT INTO `sys_address_area` VALUES ('431026', '0', '100', '431000', '汝城县');
INSERT INTO `sys_address_area` VALUES ('431027', '0', '100', '431000', '桂东县');
INSERT INTO `sys_address_area` VALUES ('431028', '0', '100', '431000', '安仁县');
INSERT INTO `sys_address_area` VALUES ('431081', '0', '100', '431000', '资兴市');
INSERT INTO `sys_address_area` VALUES ('431101', '0', '100', '431100', '市辖区');
INSERT INTO `sys_address_area` VALUES ('431102', '0', '100', '431100', '芝山区');
INSERT INTO `sys_address_area` VALUES ('431103', '0', '100', '431100', '冷水滩区');
INSERT INTO `sys_address_area` VALUES ('431121', '0', '100', '431100', '祁阳县');
INSERT INTO `sys_address_area` VALUES ('431122', '0', '100', '431100', '东安县');
INSERT INTO `sys_address_area` VALUES ('431123', '0', '100', '431100', '双牌县');
INSERT INTO `sys_address_area` VALUES ('431124', '0', '100', '431100', '道　县');
INSERT INTO `sys_address_area` VALUES ('431125', '0', '100', '431100', '江永县');
INSERT INTO `sys_address_area` VALUES ('431126', '0', '100', '431100', '宁远县');
INSERT INTO `sys_address_area` VALUES ('431127', '0', '100', '431100', '蓝山县');
INSERT INTO `sys_address_area` VALUES ('431128', '0', '100', '431100', '新田县');
INSERT INTO `sys_address_area` VALUES ('431129', '0', '100', '431100', '江华瑶族自治县');
INSERT INTO `sys_address_area` VALUES ('431201', '0', '100', '431200', '市辖区');
INSERT INTO `sys_address_area` VALUES ('431202', '0', '100', '431200', '鹤城区');
INSERT INTO `sys_address_area` VALUES ('431221', '0', '100', '431200', '中方县');
INSERT INTO `sys_address_area` VALUES ('431222', '0', '100', '431200', '沅陵县');
INSERT INTO `sys_address_area` VALUES ('431223', '0', '100', '431200', '辰溪县');
INSERT INTO `sys_address_area` VALUES ('431224', '0', '100', '431200', '溆浦县');
INSERT INTO `sys_address_area` VALUES ('431225', '0', '100', '431200', '会同县');
INSERT INTO `sys_address_area` VALUES ('431226', '0', '100', '431200', '麻阳苗族自治县');
INSERT INTO `sys_address_area` VALUES ('431227', '0', '100', '431200', '新晃侗族自治县');
INSERT INTO `sys_address_area` VALUES ('431228', '0', '100', '431200', '芷江侗族自治县');
INSERT INTO `sys_address_area` VALUES ('431229', '0', '100', '431200', '靖州苗族侗族自治县');
INSERT INTO `sys_address_area` VALUES ('431230', '0', '100', '431200', '通道侗族自治县');
INSERT INTO `sys_address_area` VALUES ('431281', '0', '100', '431200', '洪江市');
INSERT INTO `sys_address_area` VALUES ('431301', '0', '100', '431300', '市辖区');
INSERT INTO `sys_address_area` VALUES ('431302', '0', '100', '431300', '娄星区');
INSERT INTO `sys_address_area` VALUES ('431321', '0', '100', '431300', '双峰县');
INSERT INTO `sys_address_area` VALUES ('431322', '0', '100', '431300', '新化县');
INSERT INTO `sys_address_area` VALUES ('431381', '0', '100', '431300', '冷水江市');
INSERT INTO `sys_address_area` VALUES ('431382', '0', '100', '431300', '涟源市');
INSERT INTO `sys_address_area` VALUES ('433101', '0', '100', '433100', '吉首市');
INSERT INTO `sys_address_area` VALUES ('433122', '0', '100', '433100', '泸溪县');
INSERT INTO `sys_address_area` VALUES ('433123', '0', '100', '433100', '凤凰县');
INSERT INTO `sys_address_area` VALUES ('433124', '0', '100', '433100', '花垣县');
INSERT INTO `sys_address_area` VALUES ('433125', '0', '100', '433100', '保靖县');
INSERT INTO `sys_address_area` VALUES ('433126', '0', '100', '433100', '古丈县');
INSERT INTO `sys_address_area` VALUES ('433127', '0', '100', '433100', '永顺县');
INSERT INTO `sys_address_area` VALUES ('433130', '0', '100', '433100', '龙山县');
INSERT INTO `sys_address_area` VALUES ('440101', '0', '100', '440100', '市辖区');
INSERT INTO `sys_address_area` VALUES ('440102', '0', '100', '440100', '东山区');
INSERT INTO `sys_address_area` VALUES ('440103', '0', '100', '440100', '荔湾区');
INSERT INTO `sys_address_area` VALUES ('440104', '0', '100', '440100', '越秀区');
INSERT INTO `sys_address_area` VALUES ('440105', '0', '100', '440100', '海珠区');
INSERT INTO `sys_address_area` VALUES ('440106', '0', '100', '440100', '天河区');
INSERT INTO `sys_address_area` VALUES ('440107', '0', '100', '440100', '芳村区');
INSERT INTO `sys_address_area` VALUES ('440111', '0', '100', '440100', '白云区');
INSERT INTO `sys_address_area` VALUES ('440112', '0', '100', '440100', '黄埔区');
INSERT INTO `sys_address_area` VALUES ('440113', '0', '100', '440100', '番禺区');
INSERT INTO `sys_address_area` VALUES ('440114', '0', '100', '440100', '花都区');
INSERT INTO `sys_address_area` VALUES ('440183', '0', '100', '440100', '增城市');
INSERT INTO `sys_address_area` VALUES ('440184', '0', '100', '440100', '从化市');
INSERT INTO `sys_address_area` VALUES ('440201', '0', '100', '440200', '市辖区');
INSERT INTO `sys_address_area` VALUES ('440203', '0', '100', '440200', '武江区');
INSERT INTO `sys_address_area` VALUES ('440204', '0', '100', '440200', '浈江区');
INSERT INTO `sys_address_area` VALUES ('440205', '0', '100', '440200', '曲江区');
INSERT INTO `sys_address_area` VALUES ('440222', '0', '100', '440200', '始兴县');
INSERT INTO `sys_address_area` VALUES ('440224', '0', '100', '440200', '仁化县');
INSERT INTO `sys_address_area` VALUES ('440229', '0', '100', '440200', '翁源县');
INSERT INTO `sys_address_area` VALUES ('440232', '0', '100', '440200', '乳源瑶族自治县');
INSERT INTO `sys_address_area` VALUES ('440233', '0', '100', '440200', '新丰县');
INSERT INTO `sys_address_area` VALUES ('440281', '0', '100', '440200', '乐昌市');
INSERT INTO `sys_address_area` VALUES ('440282', '0', '100', '440200', '南雄市');
INSERT INTO `sys_address_area` VALUES ('440301', '0', '100', '440300', '市辖区');
INSERT INTO `sys_address_area` VALUES ('440303', '0', '100', '440300', '罗湖区');
INSERT INTO `sys_address_area` VALUES ('440304', '0', '100', '440300', '福田区');
INSERT INTO `sys_address_area` VALUES ('440305', '0', '100', '440300', '南山区');
INSERT INTO `sys_address_area` VALUES ('440306', '0', '100', '440300', '宝安区');
INSERT INTO `sys_address_area` VALUES ('440307', '0', '100', '440300', '龙岗区');
INSERT INTO `sys_address_area` VALUES ('440308', '0', '100', '440300', '盐田区');
INSERT INTO `sys_address_area` VALUES ('440401', '0', '100', '440400', '市辖区');
INSERT INTO `sys_address_area` VALUES ('440402', '0', '100', '440400', '香洲区');
INSERT INTO `sys_address_area` VALUES ('440403', '0', '100', '440400', '斗门区');
INSERT INTO `sys_address_area` VALUES ('440404', '0', '100', '440400', '金湾区');
INSERT INTO `sys_address_area` VALUES ('440501', '0', '100', '440500', '市辖区');
INSERT INTO `sys_address_area` VALUES ('440507', '0', '100', '440500', '龙湖区');
INSERT INTO `sys_address_area` VALUES ('440511', '0', '100', '440500', '金平区');
INSERT INTO `sys_address_area` VALUES ('440512', '0', '100', '440500', '濠江区');
INSERT INTO `sys_address_area` VALUES ('440513', '0', '100', '440500', '潮阳区');
INSERT INTO `sys_address_area` VALUES ('440514', '0', '100', '440500', '潮南区');
INSERT INTO `sys_address_area` VALUES ('440515', '0', '100', '440500', '澄海区');
INSERT INTO `sys_address_area` VALUES ('440523', '0', '100', '440500', '南澳县');
INSERT INTO `sys_address_area` VALUES ('440601', '0', '100', '440600', '市辖区');
INSERT INTO `sys_address_area` VALUES ('440604', '0', '100', '440600', '禅城区');
INSERT INTO `sys_address_area` VALUES ('440605', '0', '100', '440600', '南海区');
INSERT INTO `sys_address_area` VALUES ('440606', '0', '100', '440600', '顺德区');
INSERT INTO `sys_address_area` VALUES ('440607', '0', '100', '440600', '三水区');
INSERT INTO `sys_address_area` VALUES ('440608', '0', '100', '440600', '高明区');
INSERT INTO `sys_address_area` VALUES ('440701', '0', '100', '440700', '市辖区');
INSERT INTO `sys_address_area` VALUES ('440703', '0', '100', '440700', '蓬江区');
INSERT INTO `sys_address_area` VALUES ('440704', '0', '100', '440700', '江海区');
INSERT INTO `sys_address_area` VALUES ('440705', '0', '100', '440700', '新会区');
INSERT INTO `sys_address_area` VALUES ('440781', '0', '100', '440700', '台山市');
INSERT INTO `sys_address_area` VALUES ('440783', '0', '100', '440700', '开平市');
INSERT INTO `sys_address_area` VALUES ('440784', '0', '100', '440700', '鹤山市');
INSERT INTO `sys_address_area` VALUES ('440785', '0', '100', '440700', '恩平市');
INSERT INTO `sys_address_area` VALUES ('440801', '0', '100', '440800', '市辖区');
INSERT INTO `sys_address_area` VALUES ('440802', '0', '100', '440800', '赤坎区');
INSERT INTO `sys_address_area` VALUES ('440803', '0', '100', '440800', '霞山区');
INSERT INTO `sys_address_area` VALUES ('440804', '0', '100', '440800', '坡头区');
INSERT INTO `sys_address_area` VALUES ('440811', '0', '100', '440800', '麻章区');
INSERT INTO `sys_address_area` VALUES ('440823', '0', '100', '440800', '遂溪县');
INSERT INTO `sys_address_area` VALUES ('440825', '0', '100', '440800', '徐闻县');
INSERT INTO `sys_address_area` VALUES ('440881', '0', '100', '440800', '廉江市');
INSERT INTO `sys_address_area` VALUES ('440882', '0', '100', '440800', '雷州市');
INSERT INTO `sys_address_area` VALUES ('440883', '0', '100', '440800', '吴川市');
INSERT INTO `sys_address_area` VALUES ('440901', '0', '100', '440900', '市辖区');
INSERT INTO `sys_address_area` VALUES ('440902', '0', '100', '440900', '茂南区');
INSERT INTO `sys_address_area` VALUES ('440903', '0', '100', '440900', '茂港区');
INSERT INTO `sys_address_area` VALUES ('440923', '0', '100', '440900', '电白县');
INSERT INTO `sys_address_area` VALUES ('440981', '0', '100', '440900', '高州市');
INSERT INTO `sys_address_area` VALUES ('440982', '0', '100', '440900', '化州市');
INSERT INTO `sys_address_area` VALUES ('440983', '0', '100', '440900', '信宜市');
INSERT INTO `sys_address_area` VALUES ('441201', '0', '100', '441200', '市辖区');
INSERT INTO `sys_address_area` VALUES ('441202', '0', '100', '441200', '端州区');
INSERT INTO `sys_address_area` VALUES ('441203', '0', '100', '441200', '鼎湖区');
INSERT INTO `sys_address_area` VALUES ('441223', '0', '100', '441200', '广宁县');
INSERT INTO `sys_address_area` VALUES ('441224', '0', '100', '441200', '怀集县');
INSERT INTO `sys_address_area` VALUES ('441225', '0', '100', '441200', '封开县');
INSERT INTO `sys_address_area` VALUES ('441226', '0', '100', '441200', '德庆县');
INSERT INTO `sys_address_area` VALUES ('441283', '0', '100', '441200', '高要市');
INSERT INTO `sys_address_area` VALUES ('441284', '0', '100', '441200', '四会市');
INSERT INTO `sys_address_area` VALUES ('441301', '0', '100', '441300', '市辖区');
INSERT INTO `sys_address_area` VALUES ('441302', '0', '100', '441300', '惠城区');
INSERT INTO `sys_address_area` VALUES ('441303', '0', '100', '441300', '惠阳区');
INSERT INTO `sys_address_area` VALUES ('441322', '0', '100', '441300', '博罗县');
INSERT INTO `sys_address_area` VALUES ('441323', '0', '100', '441300', '惠东县');
INSERT INTO `sys_address_area` VALUES ('441324', '0', '100', '441300', '龙门县');
INSERT INTO `sys_address_area` VALUES ('441401', '0', '100', '441400', '市辖区');
INSERT INTO `sys_address_area` VALUES ('441402', '0', '100', '441400', '梅江区');
INSERT INTO `sys_address_area` VALUES ('441421', '0', '100', '441400', '梅　县');
INSERT INTO `sys_address_area` VALUES ('441422', '0', '100', '441400', '大埔县');
INSERT INTO `sys_address_area` VALUES ('441423', '0', '100', '441400', '丰顺县');
INSERT INTO `sys_address_area` VALUES ('441424', '0', '100', '441400', '五华县');
INSERT INTO `sys_address_area` VALUES ('441426', '0', '100', '441400', '平远县');
INSERT INTO `sys_address_area` VALUES ('441427', '0', '100', '441400', '蕉岭县');
INSERT INTO `sys_address_area` VALUES ('441481', '0', '100', '441400', '兴宁市');
INSERT INTO `sys_address_area` VALUES ('441501', '0', '100', '441500', '市辖区');
INSERT INTO `sys_address_area` VALUES ('441502', '0', '100', '441500', '城　区');
INSERT INTO `sys_address_area` VALUES ('441521', '0', '100', '441500', '海丰县');
INSERT INTO `sys_address_area` VALUES ('441523', '0', '100', '441500', '陆河县');
INSERT INTO `sys_address_area` VALUES ('441581', '0', '100', '441500', '陆丰市');
INSERT INTO `sys_address_area` VALUES ('441601', '0', '100', '441600', '市辖区');
INSERT INTO `sys_address_area` VALUES ('441602', '0', '100', '441600', '源城区');
INSERT INTO `sys_address_area` VALUES ('441621', '0', '100', '441600', '紫金县');
INSERT INTO `sys_address_area` VALUES ('441622', '0', '100', '441600', '龙川县');
INSERT INTO `sys_address_area` VALUES ('441623', '0', '100', '441600', '连平县');
INSERT INTO `sys_address_area` VALUES ('441624', '0', '100', '441600', '和平县');
INSERT INTO `sys_address_area` VALUES ('441625', '0', '100', '441600', '东源县');
INSERT INTO `sys_address_area` VALUES ('441701', '0', '100', '441700', '市辖区');
INSERT INTO `sys_address_area` VALUES ('441702', '0', '100', '441700', '江城区');
INSERT INTO `sys_address_area` VALUES ('441721', '0', '100', '441700', '阳西县');
INSERT INTO `sys_address_area` VALUES ('441723', '0', '100', '441700', '阳东县');
INSERT INTO `sys_address_area` VALUES ('441781', '0', '100', '441700', '阳春市');
INSERT INTO `sys_address_area` VALUES ('441801', '0', '100', '441800', '市辖区');
INSERT INTO `sys_address_area` VALUES ('441802', '0', '100', '441800', '清城区');
INSERT INTO `sys_address_area` VALUES ('441821', '0', '100', '441800', '佛冈县');
INSERT INTO `sys_address_area` VALUES ('441823', '0', '100', '441800', '阳山县');
INSERT INTO `sys_address_area` VALUES ('441825', '0', '100', '441800', '连山壮族瑶族自治县');
INSERT INTO `sys_address_area` VALUES ('441826', '0', '100', '441800', '连南瑶族自治县');
INSERT INTO `sys_address_area` VALUES ('441827', '0', '100', '441800', '清新县');
INSERT INTO `sys_address_area` VALUES ('441881', '0', '100', '441800', '英德市');
INSERT INTO `sys_address_area` VALUES ('441882', '0', '100', '441800', '连州市');
INSERT INTO `sys_address_area` VALUES ('445101', '0', '100', '445100', '市辖区');
INSERT INTO `sys_address_area` VALUES ('445102', '0', '100', '445100', '湘桥区');
INSERT INTO `sys_address_area` VALUES ('445121', '0', '100', '445100', '潮安县');
INSERT INTO `sys_address_area` VALUES ('445122', '0', '100', '445100', '饶平县');
INSERT INTO `sys_address_area` VALUES ('445201', '0', '100', '445200', '市辖区');
INSERT INTO `sys_address_area` VALUES ('445202', '0', '100', '445200', '榕城区');
INSERT INTO `sys_address_area` VALUES ('445221', '0', '100', '445200', '揭东县');
INSERT INTO `sys_address_area` VALUES ('445222', '0', '100', '445200', '揭西县');
INSERT INTO `sys_address_area` VALUES ('445224', '0', '100', '445200', '惠来县');
INSERT INTO `sys_address_area` VALUES ('445281', '0', '100', '445200', '普宁市');
INSERT INTO `sys_address_area` VALUES ('445301', '0', '100', '445300', '市辖区');
INSERT INTO `sys_address_area` VALUES ('445302', '0', '100', '445300', '云城区');
INSERT INTO `sys_address_area` VALUES ('445321', '0', '100', '445300', '新兴县');
INSERT INTO `sys_address_area` VALUES ('445322', '0', '100', '445300', '郁南县');
INSERT INTO `sys_address_area` VALUES ('445323', '0', '100', '445300', '云安县');
INSERT INTO `sys_address_area` VALUES ('445381', '0', '100', '445300', '罗定市');
INSERT INTO `sys_address_area` VALUES ('450101', '0', '100', '450100', '市辖区');
INSERT INTO `sys_address_area` VALUES ('450102', '0', '100', '450100', '兴宁区');
INSERT INTO `sys_address_area` VALUES ('450103', '0', '100', '450100', '青秀区');
INSERT INTO `sys_address_area` VALUES ('450105', '0', '100', '450100', '江南区');
INSERT INTO `sys_address_area` VALUES ('450107', '0', '100', '450100', '西乡塘区');
INSERT INTO `sys_address_area` VALUES ('450108', '0', '100', '450100', '良庆区');
INSERT INTO `sys_address_area` VALUES ('450109', '0', '100', '450100', '邕宁区');
INSERT INTO `sys_address_area` VALUES ('450122', '0', '100', '450100', '武鸣县');
INSERT INTO `sys_address_area` VALUES ('450123', '0', '100', '450100', '隆安县');
INSERT INTO `sys_address_area` VALUES ('450124', '0', '100', '450100', '马山县');
INSERT INTO `sys_address_area` VALUES ('450125', '0', '100', '450100', '上林县');
INSERT INTO `sys_address_area` VALUES ('450126', '0', '100', '450100', '宾阳县');
INSERT INTO `sys_address_area` VALUES ('450127', '0', '100', '450100', '横　县');
INSERT INTO `sys_address_area` VALUES ('450201', '0', '100', '450200', '市辖区');
INSERT INTO `sys_address_area` VALUES ('450202', '0', '100', '450200', '城中区');
INSERT INTO `sys_address_area` VALUES ('450203', '0', '100', '450200', '鱼峰区');
INSERT INTO `sys_address_area` VALUES ('450204', '0', '100', '450200', '柳南区');
INSERT INTO `sys_address_area` VALUES ('450205', '0', '100', '450200', '柳北区');
INSERT INTO `sys_address_area` VALUES ('450221', '0', '100', '450200', '柳江县');
INSERT INTO `sys_address_area` VALUES ('450222', '0', '100', '450200', '柳城县');
INSERT INTO `sys_address_area` VALUES ('450223', '0', '100', '450200', '鹿寨县');
INSERT INTO `sys_address_area` VALUES ('450224', '0', '100', '450200', '融安县');
INSERT INTO `sys_address_area` VALUES ('450225', '0', '100', '450200', '融水苗族自治县');
INSERT INTO `sys_address_area` VALUES ('450226', '0', '100', '450200', '三江侗族自治县');
INSERT INTO `sys_address_area` VALUES ('450301', '0', '100', '450300', '市辖区');
INSERT INTO `sys_address_area` VALUES ('450302', '0', '100', '450300', '秀峰区');
INSERT INTO `sys_address_area` VALUES ('450303', '0', '100', '450300', '叠彩区');
INSERT INTO `sys_address_area` VALUES ('450304', '0', '100', '450300', '象山区');
INSERT INTO `sys_address_area` VALUES ('450305', '0', '100', '450300', '七星区');
INSERT INTO `sys_address_area` VALUES ('450311', '0', '100', '450300', '雁山区');
INSERT INTO `sys_address_area` VALUES ('450321', '0', '100', '450300', '阳朔县');
INSERT INTO `sys_address_area` VALUES ('450322', '0', '100', '450300', '临桂县');
INSERT INTO `sys_address_area` VALUES ('450323', '0', '100', '450300', '灵川县');
INSERT INTO `sys_address_area` VALUES ('450324', '0', '100', '450300', '全州县');
INSERT INTO `sys_address_area` VALUES ('450325', '0', '100', '450300', '兴安县');
INSERT INTO `sys_address_area` VALUES ('450326', '0', '100', '450300', '永福县');
INSERT INTO `sys_address_area` VALUES ('450327', '0', '100', '450300', '灌阳县');
INSERT INTO `sys_address_area` VALUES ('450328', '0', '100', '450300', '龙胜各族自治县');
INSERT INTO `sys_address_area` VALUES ('450329', '0', '100', '450300', '资源县');
INSERT INTO `sys_address_area` VALUES ('450330', '0', '100', '450300', '平乐县');
INSERT INTO `sys_address_area` VALUES ('450331', '0', '100', '450300', '荔蒲县');
INSERT INTO `sys_address_area` VALUES ('450332', '0', '100', '450300', '恭城瑶族自治县');
INSERT INTO `sys_address_area` VALUES ('450401', '0', '100', '450400', '市辖区');
INSERT INTO `sys_address_area` VALUES ('450403', '0', '100', '450400', '万秀区');
INSERT INTO `sys_address_area` VALUES ('450404', '0', '100', '450400', '蝶山区');
INSERT INTO `sys_address_area` VALUES ('450405', '0', '100', '450400', '长洲区');
INSERT INTO `sys_address_area` VALUES ('450421', '0', '100', '450400', '苍梧县');
INSERT INTO `sys_address_area` VALUES ('450422', '0', '100', '450400', '藤　县');
INSERT INTO `sys_address_area` VALUES ('450423', '0', '100', '450400', '蒙山县');
INSERT INTO `sys_address_area` VALUES ('450481', '0', '100', '450400', '岑溪市');
INSERT INTO `sys_address_area` VALUES ('450501', '0', '100', '450500', '市辖区');
INSERT INTO `sys_address_area` VALUES ('450502', '0', '100', '450500', '海城区');
INSERT INTO `sys_address_area` VALUES ('450503', '0', '100', '450500', '银海区');
INSERT INTO `sys_address_area` VALUES ('450512', '0', '100', '450500', '铁山港区');
INSERT INTO `sys_address_area` VALUES ('450521', '0', '100', '450500', '合浦县');
INSERT INTO `sys_address_area` VALUES ('450601', '0', '100', '450600', '市辖区');
INSERT INTO `sys_address_area` VALUES ('450602', '0', '100', '450600', '港口区');
INSERT INTO `sys_address_area` VALUES ('450603', '0', '100', '450600', '防城区');
INSERT INTO `sys_address_area` VALUES ('450621', '0', '100', '450600', '上思县');
INSERT INTO `sys_address_area` VALUES ('450681', '0', '100', '450600', '东兴市');
INSERT INTO `sys_address_area` VALUES ('450701', '0', '100', '450700', '市辖区');
INSERT INTO `sys_address_area` VALUES ('450702', '0', '100', '450700', '钦南区');
INSERT INTO `sys_address_area` VALUES ('450703', '0', '100', '450700', '钦北区');
INSERT INTO `sys_address_area` VALUES ('450721', '0', '100', '450700', '灵山县');
INSERT INTO `sys_address_area` VALUES ('450722', '0', '100', '450700', '浦北县');
INSERT INTO `sys_address_area` VALUES ('450801', '0', '100', '450800', '市辖区');
INSERT INTO `sys_address_area` VALUES ('450802', '0', '100', '450800', '港北区');
INSERT INTO `sys_address_area` VALUES ('450803', '0', '100', '450800', '港南区');
INSERT INTO `sys_address_area` VALUES ('450804', '0', '100', '450800', '覃塘区');
INSERT INTO `sys_address_area` VALUES ('450821', '0', '100', '450800', '平南县');
INSERT INTO `sys_address_area` VALUES ('450881', '0', '100', '450800', '桂平市');
INSERT INTO `sys_address_area` VALUES ('450901', '0', '100', '450900', '市辖区');
INSERT INTO `sys_address_area` VALUES ('450902', '0', '100', '450900', '玉州区');
INSERT INTO `sys_address_area` VALUES ('450921', '0', '100', '450900', '容　县');
INSERT INTO `sys_address_area` VALUES ('450922', '0', '100', '450900', '陆川县');
INSERT INTO `sys_address_area` VALUES ('450923', '0', '100', '450900', '博白县');
INSERT INTO `sys_address_area` VALUES ('450924', '0', '100', '450900', '兴业县');
INSERT INTO `sys_address_area` VALUES ('450981', '0', '100', '450900', '北流市');
INSERT INTO `sys_address_area` VALUES ('451001', '0', '100', '451000', '市辖区');
INSERT INTO `sys_address_area` VALUES ('451002', '0', '100', '451000', '右江区');
INSERT INTO `sys_address_area` VALUES ('451021', '0', '100', '451000', '田阳县');
INSERT INTO `sys_address_area` VALUES ('451022', '0', '100', '451000', '田东县');
INSERT INTO `sys_address_area` VALUES ('451023', '0', '100', '451000', '平果县');
INSERT INTO `sys_address_area` VALUES ('451024', '0', '100', '451000', '德保县');
INSERT INTO `sys_address_area` VALUES ('451025', '0', '100', '451000', '靖西县');
INSERT INTO `sys_address_area` VALUES ('451026', '0', '100', '451000', '那坡县');
INSERT INTO `sys_address_area` VALUES ('451027', '0', '100', '451000', '凌云县');
INSERT INTO `sys_address_area` VALUES ('451028', '0', '100', '451000', '乐业县');
INSERT INTO `sys_address_area` VALUES ('451029', '0', '100', '451000', '田林县');
INSERT INTO `sys_address_area` VALUES ('451030', '0', '100', '451000', '西林县');
INSERT INTO `sys_address_area` VALUES ('451031', '0', '100', '451000', '隆林各族自治县');
INSERT INTO `sys_address_area` VALUES ('451101', '0', '100', '451100', '市辖区');
INSERT INTO `sys_address_area` VALUES ('451102', '0', '100', '451100', '八步区');
INSERT INTO `sys_address_area` VALUES ('451121', '0', '100', '451100', '昭平县');
INSERT INTO `sys_address_area` VALUES ('451122', '0', '100', '451100', '钟山县');
INSERT INTO `sys_address_area` VALUES ('451123', '0', '100', '451100', '富川瑶族自治县');
INSERT INTO `sys_address_area` VALUES ('451201', '0', '100', '451200', '市辖区');
INSERT INTO `sys_address_area` VALUES ('451202', '0', '100', '451200', '金城江区');
INSERT INTO `sys_address_area` VALUES ('451221', '0', '100', '451200', '南丹县');
INSERT INTO `sys_address_area` VALUES ('451222', '0', '100', '451200', '天峨县');
INSERT INTO `sys_address_area` VALUES ('451223', '0', '100', '451200', '凤山县');
INSERT INTO `sys_address_area` VALUES ('451224', '0', '100', '451200', '东兰县');
INSERT INTO `sys_address_area` VALUES ('451225', '0', '100', '451200', '罗城仫佬族自治县');
INSERT INTO `sys_address_area` VALUES ('451226', '0', '100', '451200', '环江毛南族自治县');
INSERT INTO `sys_address_area` VALUES ('451227', '0', '100', '451200', '巴马瑶族自治县');
INSERT INTO `sys_address_area` VALUES ('451228', '0', '100', '451200', '都安瑶族自治县');
INSERT INTO `sys_address_area` VALUES ('451229', '0', '100', '451200', '大化瑶族自治县');
INSERT INTO `sys_address_area` VALUES ('451281', '0', '100', '451200', '宜州市');
INSERT INTO `sys_address_area` VALUES ('451301', '0', '100', '451300', '市辖区');
INSERT INTO `sys_address_area` VALUES ('451302', '0', '100', '451300', '兴宾区');
INSERT INTO `sys_address_area` VALUES ('451321', '0', '100', '451300', '忻城县');
INSERT INTO `sys_address_area` VALUES ('451322', '0', '100', '451300', '象州县');
INSERT INTO `sys_address_area` VALUES ('451323', '0', '100', '451300', '武宣县');
INSERT INTO `sys_address_area` VALUES ('451324', '0', '100', '451300', '金秀瑶族自治县');
INSERT INTO `sys_address_area` VALUES ('451381', '0', '100', '451300', '合山市');
INSERT INTO `sys_address_area` VALUES ('451401', '0', '100', '451400', '市辖区');
INSERT INTO `sys_address_area` VALUES ('451402', '0', '100', '451400', '江洲区');
INSERT INTO `sys_address_area` VALUES ('451421', '0', '100', '451400', '扶绥县');
INSERT INTO `sys_address_area` VALUES ('451422', '0', '100', '451400', '宁明县');
INSERT INTO `sys_address_area` VALUES ('451423', '0', '100', '451400', '龙州县');
INSERT INTO `sys_address_area` VALUES ('451424', '0', '100', '451400', '大新县');
INSERT INTO `sys_address_area` VALUES ('451425', '0', '100', '451400', '天等县');
INSERT INTO `sys_address_area` VALUES ('451481', '0', '100', '451400', '凭祥市');
INSERT INTO `sys_address_area` VALUES ('460101', '0', '100', '460100', '市辖区');
INSERT INTO `sys_address_area` VALUES ('460105', '0', '100', '460100', '秀英区');
INSERT INTO `sys_address_area` VALUES ('460106', '0', '100', '460100', '龙华区');
INSERT INTO `sys_address_area` VALUES ('460107', '0', '100', '460100', '琼山区');
INSERT INTO `sys_address_area` VALUES ('460108', '0', '100', '460100', '美兰区');
INSERT INTO `sys_address_area` VALUES ('460201', '0', '100', '460200', '市辖区');
INSERT INTO `sys_address_area` VALUES ('469001', '0', '100', '469000', '五指山市');
INSERT INTO `sys_address_area` VALUES ('469002', '0', '100', '469000', '琼海市');
INSERT INTO `sys_address_area` VALUES ('469003', '0', '100', '469000', '儋州市');
INSERT INTO `sys_address_area` VALUES ('469005', '0', '100', '469000', '文昌市');
INSERT INTO `sys_address_area` VALUES ('469006', '0', '100', '469000', '万宁市');
INSERT INTO `sys_address_area` VALUES ('469007', '0', '100', '469000', '东方市');
INSERT INTO `sys_address_area` VALUES ('469025', '0', '100', '469000', '定安县');
INSERT INTO `sys_address_area` VALUES ('469026', '0', '100', '469000', '屯昌县');
INSERT INTO `sys_address_area` VALUES ('469027', '0', '100', '469000', '澄迈县');
INSERT INTO `sys_address_area` VALUES ('469028', '0', '100', '469000', '临高县');
INSERT INTO `sys_address_area` VALUES ('469030', '0', '100', '469000', '白沙黎族自治县');
INSERT INTO `sys_address_area` VALUES ('469031', '0', '100', '469000', '昌江黎族自治县');
INSERT INTO `sys_address_area` VALUES ('469033', '0', '100', '469000', '乐东黎族自治县');
INSERT INTO `sys_address_area` VALUES ('469034', '0', '100', '469000', '陵水黎族自治县');
INSERT INTO `sys_address_area` VALUES ('469035', '0', '100', '469000', '保亭黎族苗族自治县');
INSERT INTO `sys_address_area` VALUES ('469036', '0', '100', '469000', '琼中黎族苗族自治县');
INSERT INTO `sys_address_area` VALUES ('469037', '0', '100', '469000', '西沙群岛');
INSERT INTO `sys_address_area` VALUES ('469038', '0', '100', '469000', '南沙群岛');
INSERT INTO `sys_address_area` VALUES ('469039', '0', '100', '469000', '中沙群岛的岛礁及其海域');
INSERT INTO `sys_address_area` VALUES ('500101', '0', '100', '500100', '万州区');
INSERT INTO `sys_address_area` VALUES ('500102', '0', '100', '500100', '涪陵区');
INSERT INTO `sys_address_area` VALUES ('500103', '0', '100', '500100', '渝中区');
INSERT INTO `sys_address_area` VALUES ('500104', '0', '100', '500100', '大渡口区');
INSERT INTO `sys_address_area` VALUES ('500105', '0', '100', '500100', '江北区');
INSERT INTO `sys_address_area` VALUES ('500106', '0', '100', '500100', '沙坪坝区');
INSERT INTO `sys_address_area` VALUES ('500107', '0', '100', '500100', '九龙坡区');
INSERT INTO `sys_address_area` VALUES ('500108', '0', '100', '500100', '南岸区');
INSERT INTO `sys_address_area` VALUES ('500109', '0', '100', '500100', '北碚区');
INSERT INTO `sys_address_area` VALUES ('500110', '0', '100', '500100', '万盛区');
INSERT INTO `sys_address_area` VALUES ('500111', '0', '100', '500100', '双桥区');
INSERT INTO `sys_address_area` VALUES ('500112', '0', '100', '500100', '渝北区');
INSERT INTO `sys_address_area` VALUES ('500113', '0', '100', '500100', '巴南区');
INSERT INTO `sys_address_area` VALUES ('500114', '0', '100', '500100', '黔江区');
INSERT INTO `sys_address_area` VALUES ('500115', '0', '100', '500100', '长寿区');
INSERT INTO `sys_address_area` VALUES ('500222', '0', '100', '500200', '綦江县');
INSERT INTO `sys_address_area` VALUES ('500223', '0', '100', '500200', '潼南县');
INSERT INTO `sys_address_area` VALUES ('500224', '0', '100', '500200', '铜梁县');
INSERT INTO `sys_address_area` VALUES ('500225', '0', '100', '500200', '大足县');
INSERT INTO `sys_address_area` VALUES ('500226', '0', '100', '500200', '荣昌县');
INSERT INTO `sys_address_area` VALUES ('500227', '0', '100', '500200', '璧山县');
INSERT INTO `sys_address_area` VALUES ('500228', '0', '100', '500200', '梁平县');
INSERT INTO `sys_address_area` VALUES ('500229', '0', '100', '500200', '城口县');
INSERT INTO `sys_address_area` VALUES ('500230', '0', '100', '500200', '丰都县');
INSERT INTO `sys_address_area` VALUES ('500231', '0', '100', '500200', '垫江县');
INSERT INTO `sys_address_area` VALUES ('500232', '0', '100', '500200', '武隆县');
INSERT INTO `sys_address_area` VALUES ('500233', '0', '100', '500200', '忠　县');
INSERT INTO `sys_address_area` VALUES ('500234', '0', '100', '500200', '开　县');
INSERT INTO `sys_address_area` VALUES ('500235', '0', '100', '500200', '云阳县');
INSERT INTO `sys_address_area` VALUES ('500236', '0', '100', '500200', '奉节县');
INSERT INTO `sys_address_area` VALUES ('500237', '0', '100', '500200', '巫山县');
INSERT INTO `sys_address_area` VALUES ('500238', '0', '100', '500200', '巫溪县');
INSERT INTO `sys_address_area` VALUES ('500240', '0', '100', '500200', '石柱土家族自治县');
INSERT INTO `sys_address_area` VALUES ('500241', '0', '100', '500200', '秀山土家族苗族自治县');
INSERT INTO `sys_address_area` VALUES ('500242', '0', '100', '500200', '酉阳土家族苗族自治县');
INSERT INTO `sys_address_area` VALUES ('500243', '0', '100', '500200', '彭水苗族土家族自治县');
INSERT INTO `sys_address_area` VALUES ('500381', '0', '100', '500300', '江津市');
INSERT INTO `sys_address_area` VALUES ('500382', '0', '100', '500300', '合川市');
INSERT INTO `sys_address_area` VALUES ('500383', '0', '100', '500300', '永川市');
INSERT INTO `sys_address_area` VALUES ('500384', '0', '100', '500300', '南川市');
INSERT INTO `sys_address_area` VALUES ('510101', '0', '100', '510100', '市辖区');
INSERT INTO `sys_address_area` VALUES ('510104', '0', '100', '510100', '锦江区');
INSERT INTO `sys_address_area` VALUES ('510105', '0', '100', '510100', '青羊区');
INSERT INTO `sys_address_area` VALUES ('510106', '0', '100', '510100', '金牛区');
INSERT INTO `sys_address_area` VALUES ('510107', '0', '100', '510100', '武侯区');
INSERT INTO `sys_address_area` VALUES ('510108', '0', '100', '510100', '成华区');
INSERT INTO `sys_address_area` VALUES ('510112', '0', '100', '510100', '龙泉驿区');
INSERT INTO `sys_address_area` VALUES ('510113', '0', '100', '510100', '青白江区');
INSERT INTO `sys_address_area` VALUES ('510114', '0', '100', '510100', '新都区');
INSERT INTO `sys_address_area` VALUES ('510115', '0', '100', '510100', '温江县');
INSERT INTO `sys_address_area` VALUES ('510121', '0', '100', '510100', '金堂县');
INSERT INTO `sys_address_area` VALUES ('510122', '0', '100', '510100', '双流县');
INSERT INTO `sys_address_area` VALUES ('510124', '0', '100', '510100', '郫　县');
INSERT INTO `sys_address_area` VALUES ('510129', '0', '100', '510100', '大邑县');
INSERT INTO `sys_address_area` VALUES ('510131', '0', '100', '510100', '蒲江县');
INSERT INTO `sys_address_area` VALUES ('510132', '0', '100', '510100', '新津县');
INSERT INTO `sys_address_area` VALUES ('510181', '0', '100', '510100', '都江堰市');
INSERT INTO `sys_address_area` VALUES ('510182', '0', '100', '510100', '彭州市');
INSERT INTO `sys_address_area` VALUES ('510183', '0', '100', '510100', '邛崃市');
INSERT INTO `sys_address_area` VALUES ('510184', '0', '100', '510100', '崇州市');
INSERT INTO `sys_address_area` VALUES ('510301', '0', '100', '510300', '市辖区');
INSERT INTO `sys_address_area` VALUES ('510302', '0', '100', '510300', '自流井区');
INSERT INTO `sys_address_area` VALUES ('510303', '0', '100', '510300', '贡井区');
INSERT INTO `sys_address_area` VALUES ('510304', '0', '100', '510300', '大安区');
INSERT INTO `sys_address_area` VALUES ('510311', '0', '100', '510300', '沿滩区');
INSERT INTO `sys_address_area` VALUES ('510321', '0', '100', '510300', '荣　县');
INSERT INTO `sys_address_area` VALUES ('510322', '0', '100', '510300', '富顺县');
INSERT INTO `sys_address_area` VALUES ('510401', '0', '100', '510400', '市辖区');
INSERT INTO `sys_address_area` VALUES ('510402', '0', '100', '510400', '东　区');
INSERT INTO `sys_address_area` VALUES ('510403', '0', '100', '510400', '西　区');
INSERT INTO `sys_address_area` VALUES ('510411', '0', '100', '510400', '仁和区');
INSERT INTO `sys_address_area` VALUES ('510421', '0', '100', '510400', '米易县');
INSERT INTO `sys_address_area` VALUES ('510422', '0', '100', '510400', '盐边县');
INSERT INTO `sys_address_area` VALUES ('510501', '0', '100', '510500', '市辖区');
INSERT INTO `sys_address_area` VALUES ('510502', '0', '100', '510500', '江阳区');
INSERT INTO `sys_address_area` VALUES ('510503', '0', '100', '510500', '纳溪区');
INSERT INTO `sys_address_area` VALUES ('510504', '0', '100', '510500', '龙马潭区');
INSERT INTO `sys_address_area` VALUES ('510521', '0', '100', '510500', '泸　县');
INSERT INTO `sys_address_area` VALUES ('510522', '0', '100', '510500', '合江县');
INSERT INTO `sys_address_area` VALUES ('510524', '0', '100', '510500', '叙永县');
INSERT INTO `sys_address_area` VALUES ('510525', '0', '100', '510500', '古蔺县');
INSERT INTO `sys_address_area` VALUES ('510601', '0', '100', '510600', '市辖区');
INSERT INTO `sys_address_area` VALUES ('510603', '0', '100', '510600', '旌阳区');
INSERT INTO `sys_address_area` VALUES ('510623', '0', '100', '510600', '中江县');
INSERT INTO `sys_address_area` VALUES ('510626', '0', '100', '510600', '罗江县');
INSERT INTO `sys_address_area` VALUES ('510681', '0', '100', '510600', '广汉市');
INSERT INTO `sys_address_area` VALUES ('510682', '0', '100', '510600', '什邡市');
INSERT INTO `sys_address_area` VALUES ('510683', '0', '100', '510600', '绵竹市');
INSERT INTO `sys_address_area` VALUES ('510701', '0', '100', '510700', '市辖区');
INSERT INTO `sys_address_area` VALUES ('510703', '0', '100', '510700', '涪城区');
INSERT INTO `sys_address_area` VALUES ('510704', '0', '100', '510700', '游仙区');
INSERT INTO `sys_address_area` VALUES ('510722', '0', '100', '510700', '三台县');
INSERT INTO `sys_address_area` VALUES ('510723', '0', '100', '510700', '盐亭县');
INSERT INTO `sys_address_area` VALUES ('510724', '0', '100', '510700', '安　县');
INSERT INTO `sys_address_area` VALUES ('510725', '0', '100', '510700', '梓潼县');
INSERT INTO `sys_address_area` VALUES ('510726', '0', '100', '510700', '北川羌族自治县');
INSERT INTO `sys_address_area` VALUES ('510727', '0', '100', '510700', '平武县');
INSERT INTO `sys_address_area` VALUES ('510781', '0', '100', '510700', '江油市');
INSERT INTO `sys_address_area` VALUES ('510801', '0', '100', '510800', '市辖区');
INSERT INTO `sys_address_area` VALUES ('510802', '0', '100', '510800', '市中区');
INSERT INTO `sys_address_area` VALUES ('510811', '0', '100', '510800', '元坝区');
INSERT INTO `sys_address_area` VALUES ('510812', '0', '100', '510800', '朝天区');
INSERT INTO `sys_address_area` VALUES ('510821', '0', '100', '510800', '旺苍县');
INSERT INTO `sys_address_area` VALUES ('510822', '0', '100', '510800', '青川县');
INSERT INTO `sys_address_area` VALUES ('510823', '0', '100', '510800', '剑阁县');
INSERT INTO `sys_address_area` VALUES ('510824', '0', '100', '510800', '苍溪县');
INSERT INTO `sys_address_area` VALUES ('510901', '0', '100', '510900', '市辖区');
INSERT INTO `sys_address_area` VALUES ('510903', '0', '100', '510900', '船山区');
INSERT INTO `sys_address_area` VALUES ('510904', '0', '100', '510900', '安居区');
INSERT INTO `sys_address_area` VALUES ('510921', '0', '100', '510900', '蓬溪县');
INSERT INTO `sys_address_area` VALUES ('510922', '0', '100', '510900', '射洪县');
INSERT INTO `sys_address_area` VALUES ('510923', '0', '100', '510900', '大英县');
INSERT INTO `sys_address_area` VALUES ('511001', '0', '100', '511000', '市辖区');
INSERT INTO `sys_address_area` VALUES ('511002', '0', '100', '511000', '市中区');
INSERT INTO `sys_address_area` VALUES ('511011', '0', '100', '511000', '东兴区');
INSERT INTO `sys_address_area` VALUES ('511024', '0', '100', '511000', '威远县');
INSERT INTO `sys_address_area` VALUES ('511025', '0', '100', '511000', '资中县');
INSERT INTO `sys_address_area` VALUES ('511028', '0', '100', '511000', '隆昌县');
INSERT INTO `sys_address_area` VALUES ('511101', '0', '100', '511100', '市辖区');
INSERT INTO `sys_address_area` VALUES ('511102', '0', '100', '511100', '市中区');
INSERT INTO `sys_address_area` VALUES ('511111', '0', '100', '511100', '沙湾区');
INSERT INTO `sys_address_area` VALUES ('511112', '0', '100', '511100', '五通桥区');
INSERT INTO `sys_address_area` VALUES ('511113', '0', '100', '511100', '金口河区');
INSERT INTO `sys_address_area` VALUES ('511123', '0', '100', '511100', '犍为县');
INSERT INTO `sys_address_area` VALUES ('511124', '0', '100', '511100', '井研县');
INSERT INTO `sys_address_area` VALUES ('511126', '0', '100', '511100', '夹江县');
INSERT INTO `sys_address_area` VALUES ('511129', '0', '100', '511100', '沐川县');
INSERT INTO `sys_address_area` VALUES ('511132', '0', '100', '511100', '峨边彝族自治县');
INSERT INTO `sys_address_area` VALUES ('511133', '0', '100', '511100', '马边彝族自治县');
INSERT INTO `sys_address_area` VALUES ('511181', '0', '100', '511100', '峨眉山市');
INSERT INTO `sys_address_area` VALUES ('511301', '0', '100', '511300', '市辖区');
INSERT INTO `sys_address_area` VALUES ('511302', '0', '100', '511300', '顺庆区');
INSERT INTO `sys_address_area` VALUES ('511303', '0', '100', '511300', '高坪区');
INSERT INTO `sys_address_area` VALUES ('511304', '0', '100', '511300', '嘉陵区');
INSERT INTO `sys_address_area` VALUES ('511321', '0', '100', '511300', '南部县');
INSERT INTO `sys_address_area` VALUES ('511322', '0', '100', '511300', '营山县');
INSERT INTO `sys_address_area` VALUES ('511323', '0', '100', '511300', '蓬安县');
INSERT INTO `sys_address_area` VALUES ('511324', '0', '100', '511300', '仪陇县');
INSERT INTO `sys_address_area` VALUES ('511325', '0', '100', '511300', '西充县');
INSERT INTO `sys_address_area` VALUES ('511381', '0', '100', '511300', '阆中市');
INSERT INTO `sys_address_area` VALUES ('511401', '0', '100', '511400', '市辖区');
INSERT INTO `sys_address_area` VALUES ('511402', '0', '100', '511400', '东坡区');
INSERT INTO `sys_address_area` VALUES ('511421', '0', '100', '511400', '仁寿县');
INSERT INTO `sys_address_area` VALUES ('511422', '0', '100', '511400', '彭山县');
INSERT INTO `sys_address_area` VALUES ('511423', '0', '100', '511400', '洪雅县');
INSERT INTO `sys_address_area` VALUES ('511424', '0', '100', '511400', '丹棱县');
INSERT INTO `sys_address_area` VALUES ('511425', '0', '100', '511400', '青神县');
INSERT INTO `sys_address_area` VALUES ('511501', '0', '100', '511500', '市辖区');
INSERT INTO `sys_address_area` VALUES ('511502', '0', '100', '511500', '翠屏区');
INSERT INTO `sys_address_area` VALUES ('511521', '0', '100', '511500', '宜宾县');
INSERT INTO `sys_address_area` VALUES ('511522', '0', '100', '511500', '南溪县');
INSERT INTO `sys_address_area` VALUES ('511523', '0', '100', '511500', '江安县');
INSERT INTO `sys_address_area` VALUES ('511524', '0', '100', '511500', '长宁县');
INSERT INTO `sys_address_area` VALUES ('511525', '0', '100', '511500', '高　县');
INSERT INTO `sys_address_area` VALUES ('511526', '0', '100', '511500', '珙　县');
INSERT INTO `sys_address_area` VALUES ('511527', '0', '100', '511500', '筠连县');
INSERT INTO `sys_address_area` VALUES ('511528', '0', '100', '511500', '兴文县');
INSERT INTO `sys_address_area` VALUES ('511529', '0', '100', '511500', '屏山县');
INSERT INTO `sys_address_area` VALUES ('511601', '0', '100', '511600', '市辖区');
INSERT INTO `sys_address_area` VALUES ('511602', '0', '100', '511600', '广安区');
INSERT INTO `sys_address_area` VALUES ('511621', '0', '100', '511600', '岳池县');
INSERT INTO `sys_address_area` VALUES ('511622', '0', '100', '511600', '武胜县');
INSERT INTO `sys_address_area` VALUES ('511623', '0', '100', '511600', '邻水县');
INSERT INTO `sys_address_area` VALUES ('511681', '0', '100', '511600', '华莹市');
INSERT INTO `sys_address_area` VALUES ('511701', '0', '100', '511700', '市辖区');
INSERT INTO `sys_address_area` VALUES ('511702', '0', '100', '511700', '通川区');
INSERT INTO `sys_address_area` VALUES ('511721', '0', '100', '511700', '达　县');
INSERT INTO `sys_address_area` VALUES ('511722', '0', '100', '511700', '宣汉县');
INSERT INTO `sys_address_area` VALUES ('511723', '0', '100', '511700', '开江县');
INSERT INTO `sys_address_area` VALUES ('511724', '0', '100', '511700', '大竹县');
INSERT INTO `sys_address_area` VALUES ('511725', '0', '100', '511700', '渠　县');
INSERT INTO `sys_address_area` VALUES ('511781', '0', '100', '511700', '万源市');
INSERT INTO `sys_address_area` VALUES ('511801', '0', '100', '511800', '市辖区');
INSERT INTO `sys_address_area` VALUES ('511802', '0', '100', '511800', '雨城区');
INSERT INTO `sys_address_area` VALUES ('511821', '0', '100', '511800', '名山县');
INSERT INTO `sys_address_area` VALUES ('511822', '0', '100', '511800', '荥经县');
INSERT INTO `sys_address_area` VALUES ('511823', '0', '100', '511800', '汉源县');
INSERT INTO `sys_address_area` VALUES ('511824', '0', '100', '511800', '石棉县');
INSERT INTO `sys_address_area` VALUES ('511825', '0', '100', '511800', '天全县');
INSERT INTO `sys_address_area` VALUES ('511826', '0', '100', '511800', '芦山县');
INSERT INTO `sys_address_area` VALUES ('511827', '0', '100', '511800', '宝兴县');
INSERT INTO `sys_address_area` VALUES ('511901', '0', '100', '511900', '市辖区');
INSERT INTO `sys_address_area` VALUES ('511902', '0', '100', '511900', '巴州区');
INSERT INTO `sys_address_area` VALUES ('511921', '0', '100', '511900', '通江县');
INSERT INTO `sys_address_area` VALUES ('511922', '0', '100', '511900', '南江县');
INSERT INTO `sys_address_area` VALUES ('511923', '0', '100', '511900', '平昌县');
INSERT INTO `sys_address_area` VALUES ('512001', '0', '100', '512000', '市辖区');
INSERT INTO `sys_address_area` VALUES ('512002', '0', '100', '512000', '雁江区');
INSERT INTO `sys_address_area` VALUES ('512021', '0', '100', '512000', '安岳县');
INSERT INTO `sys_address_area` VALUES ('512022', '0', '100', '512000', '乐至县');
INSERT INTO `sys_address_area` VALUES ('512081', '0', '100', '512000', '简阳市');
INSERT INTO `sys_address_area` VALUES ('513221', '0', '100', '513200', '汶川县');
INSERT INTO `sys_address_area` VALUES ('513222', '0', '100', '513200', '理　县');
INSERT INTO `sys_address_area` VALUES ('513223', '0', '100', '513200', '茂　县');
INSERT INTO `sys_address_area` VALUES ('513224', '0', '100', '513200', '松潘县');
INSERT INTO `sys_address_area` VALUES ('513225', '0', '100', '513200', '九寨沟县');
INSERT INTO `sys_address_area` VALUES ('513226', '0', '100', '513200', '金川县');
INSERT INTO `sys_address_area` VALUES ('513227', '0', '100', '513200', '小金县');
INSERT INTO `sys_address_area` VALUES ('513228', '0', '100', '513200', '黑水县');
INSERT INTO `sys_address_area` VALUES ('513229', '0', '100', '513200', '马尔康县');
INSERT INTO `sys_address_area` VALUES ('513230', '0', '100', '513200', '壤塘县');
INSERT INTO `sys_address_area` VALUES ('513231', '0', '100', '513200', '阿坝县');
INSERT INTO `sys_address_area` VALUES ('513232', '0', '100', '513200', '若尔盖县');
INSERT INTO `sys_address_area` VALUES ('513233', '0', '100', '513200', '红原县');
INSERT INTO `sys_address_area` VALUES ('513321', '0', '100', '513300', '康定县');
INSERT INTO `sys_address_area` VALUES ('513322', '0', '100', '513300', '泸定县');
INSERT INTO `sys_address_area` VALUES ('513323', '0', '100', '513300', '丹巴县');
INSERT INTO `sys_address_area` VALUES ('513324', '0', '100', '513300', '九龙县');
INSERT INTO `sys_address_area` VALUES ('513325', '0', '100', '513300', '雅江县');
INSERT INTO `sys_address_area` VALUES ('513326', '0', '100', '513300', '道孚县');
INSERT INTO `sys_address_area` VALUES ('513327', '0', '100', '513300', '炉霍县');
INSERT INTO `sys_address_area` VALUES ('513328', '0', '100', '513300', '甘孜县');
INSERT INTO `sys_address_area` VALUES ('513329', '0', '100', '513300', '新龙县');
INSERT INTO `sys_address_area` VALUES ('513330', '0', '100', '513300', '德格县');
INSERT INTO `sys_address_area` VALUES ('513331', '0', '100', '513300', '白玉县');
INSERT INTO `sys_address_area` VALUES ('513332', '0', '100', '513300', '石渠县');
INSERT INTO `sys_address_area` VALUES ('513333', '0', '100', '513300', '色达县');
INSERT INTO `sys_address_area` VALUES ('513334', '0', '100', '513300', '理塘县');
INSERT INTO `sys_address_area` VALUES ('513335', '0', '100', '513300', '巴塘县');
INSERT INTO `sys_address_area` VALUES ('513336', '0', '100', '513300', '乡城县');
INSERT INTO `sys_address_area` VALUES ('513337', '0', '100', '513300', '稻城县');
INSERT INTO `sys_address_area` VALUES ('513338', '0', '100', '513300', '得荣县');
INSERT INTO `sys_address_area` VALUES ('513401', '0', '100', '513400', '西昌市');
INSERT INTO `sys_address_area` VALUES ('513422', '0', '100', '513400', '木里藏族自治县');
INSERT INTO `sys_address_area` VALUES ('513423', '0', '100', '513400', '盐源县');
INSERT INTO `sys_address_area` VALUES ('513424', '0', '100', '513400', '德昌县');
INSERT INTO `sys_address_area` VALUES ('513425', '0', '100', '513400', '会理县');
INSERT INTO `sys_address_area` VALUES ('513426', '0', '100', '513400', '会东县');
INSERT INTO `sys_address_area` VALUES ('513427', '0', '100', '513400', '宁南县');
INSERT INTO `sys_address_area` VALUES ('513428', '0', '100', '513400', '普格县');
INSERT INTO `sys_address_area` VALUES ('513429', '0', '100', '513400', '布拖县');
INSERT INTO `sys_address_area` VALUES ('513430', '0', '100', '513400', '金阳县');
INSERT INTO `sys_address_area` VALUES ('513431', '0', '100', '513400', '昭觉县');
INSERT INTO `sys_address_area` VALUES ('513432', '0', '100', '513400', '喜德县');
INSERT INTO `sys_address_area` VALUES ('513433', '0', '100', '513400', '冕宁县');
INSERT INTO `sys_address_area` VALUES ('513434', '0', '100', '513400', '越西县');
INSERT INTO `sys_address_area` VALUES ('513435', '0', '100', '513400', '甘洛县');
INSERT INTO `sys_address_area` VALUES ('513436', '0', '100', '513400', '美姑县');
INSERT INTO `sys_address_area` VALUES ('513437', '0', '100', '513400', '雷波县');
INSERT INTO `sys_address_area` VALUES ('520101', '0', '100', '520100', '市辖区');
INSERT INTO `sys_address_area` VALUES ('520102', '0', '100', '520100', '南明区');
INSERT INTO `sys_address_area` VALUES ('520103', '0', '100', '520100', '云岩区');
INSERT INTO `sys_address_area` VALUES ('520111', '0', '100', '520100', '花溪区');
INSERT INTO `sys_address_area` VALUES ('520112', '0', '100', '520100', '乌当区');
INSERT INTO `sys_address_area` VALUES ('520113', '0', '100', '520100', '白云区');
INSERT INTO `sys_address_area` VALUES ('520114', '0', '100', '520100', '小河区');
INSERT INTO `sys_address_area` VALUES ('520121', '0', '100', '520100', '开阳县');
INSERT INTO `sys_address_area` VALUES ('520122', '0', '100', '520100', '息烽县');
INSERT INTO `sys_address_area` VALUES ('520123', '0', '100', '520100', '修文县');
INSERT INTO `sys_address_area` VALUES ('520181', '0', '100', '520100', '清镇市');
INSERT INTO `sys_address_area` VALUES ('520201', '0', '100', '520200', '钟山区');
INSERT INTO `sys_address_area` VALUES ('520203', '0', '100', '520200', '六枝特区');
INSERT INTO `sys_address_area` VALUES ('520221', '0', '100', '520200', '水城县');
INSERT INTO `sys_address_area` VALUES ('520222', '0', '100', '520200', '盘　县');
INSERT INTO `sys_address_area` VALUES ('520301', '0', '100', '520300', '市辖区');
INSERT INTO `sys_address_area` VALUES ('520302', '0', '100', '520300', '红花岗区');
INSERT INTO `sys_address_area` VALUES ('520303', '0', '100', '520300', '汇川区');
INSERT INTO `sys_address_area` VALUES ('520321', '0', '100', '520300', '遵义县');
INSERT INTO `sys_address_area` VALUES ('520322', '0', '100', '520300', '桐梓县');
INSERT INTO `sys_address_area` VALUES ('520323', '0', '100', '520300', '绥阳县');
INSERT INTO `sys_address_area` VALUES ('520324', '0', '100', '520300', '正安县');
INSERT INTO `sys_address_area` VALUES ('520325', '0', '100', '520300', '道真仡佬族苗族自治县');
INSERT INTO `sys_address_area` VALUES ('520326', '0', '100', '520300', '务川仡佬族苗族自治县');
INSERT INTO `sys_address_area` VALUES ('520327', '0', '100', '520300', '凤冈县');
INSERT INTO `sys_address_area` VALUES ('520328', '0', '100', '520300', '湄潭县');
INSERT INTO `sys_address_area` VALUES ('520329', '0', '100', '520300', '余庆县');
INSERT INTO `sys_address_area` VALUES ('520330', '0', '100', '520300', '习水县');
INSERT INTO `sys_address_area` VALUES ('520381', '0', '100', '520300', '赤水市');
INSERT INTO `sys_address_area` VALUES ('520382', '0', '100', '520300', '仁怀市');
INSERT INTO `sys_address_area` VALUES ('520401', '0', '100', '520400', '市辖区');
INSERT INTO `sys_address_area` VALUES ('520402', '0', '100', '520400', '西秀区');
INSERT INTO `sys_address_area` VALUES ('520421', '0', '100', '520400', '平坝县');
INSERT INTO `sys_address_area` VALUES ('520422', '0', '100', '520400', '普定县');
INSERT INTO `sys_address_area` VALUES ('520423', '0', '100', '520400', '镇宁布依族苗族自治县');
INSERT INTO `sys_address_area` VALUES ('520424', '0', '100', '520400', '关岭布依族苗族自治县');
INSERT INTO `sys_address_area` VALUES ('520425', '0', '100', '520400', '紫云苗族布依族自治县');
INSERT INTO `sys_address_area` VALUES ('522201', '0', '100', '522200', '铜仁市');
INSERT INTO `sys_address_area` VALUES ('522222', '0', '100', '522200', '江口县');
INSERT INTO `sys_address_area` VALUES ('522223', '0', '100', '522200', '玉屏侗族自治县');
INSERT INTO `sys_address_area` VALUES ('522224', '0', '100', '522200', '石阡县');
INSERT INTO `sys_address_area` VALUES ('522225', '0', '100', '522200', '思南县');
INSERT INTO `sys_address_area` VALUES ('522226', '0', '100', '522200', '印江土家族苗族自治县');
INSERT INTO `sys_address_area` VALUES ('522227', '0', '100', '522200', '德江县');
INSERT INTO `sys_address_area` VALUES ('522228', '0', '100', '522200', '沿河土家族自治县');
INSERT INTO `sys_address_area` VALUES ('522229', '0', '100', '522200', '松桃苗族自治县');
INSERT INTO `sys_address_area` VALUES ('522230', '0', '100', '522200', '万山特区');
INSERT INTO `sys_address_area` VALUES ('522301', '0', '100', '522300', '兴义市');
INSERT INTO `sys_address_area` VALUES ('522322', '0', '100', '522300', '兴仁县');
INSERT INTO `sys_address_area` VALUES ('522323', '0', '100', '522300', '普安县');
INSERT INTO `sys_address_area` VALUES ('522324', '0', '100', '522300', '晴隆县');
INSERT INTO `sys_address_area` VALUES ('522325', '0', '100', '522300', '贞丰县');
INSERT INTO `sys_address_area` VALUES ('522326', '0', '100', '522300', '望谟县');
INSERT INTO `sys_address_area` VALUES ('522327', '0', '100', '522300', '册亨县');
INSERT INTO `sys_address_area` VALUES ('522328', '0', '100', '522300', '安龙县');
INSERT INTO `sys_address_area` VALUES ('522401', '0', '100', '522400', '毕节市');
INSERT INTO `sys_address_area` VALUES ('522422', '0', '100', '522400', '大方县');
INSERT INTO `sys_address_area` VALUES ('522423', '0', '100', '522400', '黔西县');
INSERT INTO `sys_address_area` VALUES ('522424', '0', '100', '522400', '金沙县');
INSERT INTO `sys_address_area` VALUES ('522425', '0', '100', '522400', '织金县');
INSERT INTO `sys_address_area` VALUES ('522426', '0', '100', '522400', '纳雍县');
INSERT INTO `sys_address_area` VALUES ('522427', '0', '100', '522400', '威宁彝族回族苗族自治县');
INSERT INTO `sys_address_area` VALUES ('522428', '0', '100', '522400', '赫章县');
INSERT INTO `sys_address_area` VALUES ('522601', '0', '100', '522600', '凯里市');
INSERT INTO `sys_address_area` VALUES ('522622', '0', '100', '522600', '黄平县');
INSERT INTO `sys_address_area` VALUES ('522623', '0', '100', '522600', '施秉县');
INSERT INTO `sys_address_area` VALUES ('522624', '0', '100', '522600', '三穗县');
INSERT INTO `sys_address_area` VALUES ('522625', '0', '100', '522600', '镇远县');
INSERT INTO `sys_address_area` VALUES ('522626', '0', '100', '522600', '岑巩县');
INSERT INTO `sys_address_area` VALUES ('522627', '0', '100', '522600', '天柱县');
INSERT INTO `sys_address_area` VALUES ('522628', '0', '100', '522600', '锦屏县');
INSERT INTO `sys_address_area` VALUES ('522629', '0', '100', '522600', '剑河县');
INSERT INTO `sys_address_area` VALUES ('522630', '0', '100', '522600', '台江县');
INSERT INTO `sys_address_area` VALUES ('522631', '0', '100', '522600', '黎平县');
INSERT INTO `sys_address_area` VALUES ('522632', '0', '100', '522600', '榕江县');
INSERT INTO `sys_address_area` VALUES ('522633', '0', '100', '522600', '从江县');
INSERT INTO `sys_address_area` VALUES ('522634', '0', '100', '522600', '雷山县');
INSERT INTO `sys_address_area` VALUES ('522635', '0', '100', '522600', '麻江县');
INSERT INTO `sys_address_area` VALUES ('522636', '0', '100', '522600', '丹寨县');
INSERT INTO `sys_address_area` VALUES ('522701', '0', '100', '522700', '都匀市');
INSERT INTO `sys_address_area` VALUES ('522702', '0', '100', '522700', '福泉市');
INSERT INTO `sys_address_area` VALUES ('522722', '0', '100', '522700', '荔波县');
INSERT INTO `sys_address_area` VALUES ('522723', '0', '100', '522700', '贵定县');
INSERT INTO `sys_address_area` VALUES ('522725', '0', '100', '522700', '瓮安县');
INSERT INTO `sys_address_area` VALUES ('522726', '0', '100', '522700', '独山县');
INSERT INTO `sys_address_area` VALUES ('522727', '0', '100', '522700', '平塘县');
INSERT INTO `sys_address_area` VALUES ('522728', '0', '100', '522700', '罗甸县');
INSERT INTO `sys_address_area` VALUES ('522729', '0', '100', '522700', '长顺县');
INSERT INTO `sys_address_area` VALUES ('522730', '0', '100', '522700', '龙里县');
INSERT INTO `sys_address_area` VALUES ('522731', '0', '100', '522700', '惠水县');
INSERT INTO `sys_address_area` VALUES ('522732', '0', '100', '522700', '三都水族自治县');
INSERT INTO `sys_address_area` VALUES ('530101', '0', '100', '530100', '市辖区');
INSERT INTO `sys_address_area` VALUES ('530102', '0', '100', '530100', '五华区');
INSERT INTO `sys_address_area` VALUES ('530103', '0', '100', '530100', '盘龙区');
INSERT INTO `sys_address_area` VALUES ('530111', '0', '100', '530100', '官渡区');
INSERT INTO `sys_address_area` VALUES ('530112', '0', '100', '530100', '西山区');
INSERT INTO `sys_address_area` VALUES ('530113', '0', '100', '530100', '东川区');
INSERT INTO `sys_address_area` VALUES ('530121', '0', '100', '530100', '呈贡县');
INSERT INTO `sys_address_area` VALUES ('530122', '0', '100', '530100', '晋宁县');
INSERT INTO `sys_address_area` VALUES ('530124', '0', '100', '530100', '富民县');
INSERT INTO `sys_address_area` VALUES ('530125', '0', '100', '530100', '宜良县');
INSERT INTO `sys_address_area` VALUES ('530126', '0', '100', '530100', '石林彝族自治县');
INSERT INTO `sys_address_area` VALUES ('530127', '0', '100', '530100', '嵩明县');
INSERT INTO `sys_address_area` VALUES ('530128', '0', '100', '530100', '禄劝彝族苗族自治县');
INSERT INTO `sys_address_area` VALUES ('530129', '0', '100', '530100', '寻甸回族彝族自治县');
INSERT INTO `sys_address_area` VALUES ('530181', '0', '100', '530100', '安宁市');
INSERT INTO `sys_address_area` VALUES ('530301', '0', '100', '530300', '市辖区');
INSERT INTO `sys_address_area` VALUES ('530302', '0', '100', '530300', '麒麟区');
INSERT INTO `sys_address_area` VALUES ('530321', '0', '100', '530300', '马龙县');
INSERT INTO `sys_address_area` VALUES ('530322', '0', '100', '530300', '陆良县');
INSERT INTO `sys_address_area` VALUES ('530323', '0', '100', '530300', '师宗县');
INSERT INTO `sys_address_area` VALUES ('530324', '0', '100', '530300', '罗平县');
INSERT INTO `sys_address_area` VALUES ('530325', '0', '100', '530300', '富源县');
INSERT INTO `sys_address_area` VALUES ('530326', '0', '100', '530300', '会泽县');
INSERT INTO `sys_address_area` VALUES ('530328', '0', '100', '530300', '沾益县');
INSERT INTO `sys_address_area` VALUES ('530381', '0', '100', '530300', '宣威市');
INSERT INTO `sys_address_area` VALUES ('530401', '0', '100', '530400', '市辖区');
INSERT INTO `sys_address_area` VALUES ('530402', '0', '100', '530400', '红塔区');
INSERT INTO `sys_address_area` VALUES ('530421', '0', '100', '530400', '江川县');
INSERT INTO `sys_address_area` VALUES ('530422', '0', '100', '530400', '澄江县');
INSERT INTO `sys_address_area` VALUES ('530423', '0', '100', '530400', '通海县');
INSERT INTO `sys_address_area` VALUES ('530424', '0', '100', '530400', '华宁县');
INSERT INTO `sys_address_area` VALUES ('530425', '0', '100', '530400', '易门县');
INSERT INTO `sys_address_area` VALUES ('530426', '0', '100', '530400', '峨山彝族自治县');
INSERT INTO `sys_address_area` VALUES ('530427', '0', '100', '530400', '新平彝族傣族自治县');
INSERT INTO `sys_address_area` VALUES ('530428', '0', '100', '530400', '元江哈尼族彝族傣族自治县');
INSERT INTO `sys_address_area` VALUES ('530501', '0', '100', '530500', '市辖区');
INSERT INTO `sys_address_area` VALUES ('530502', '0', '100', '530500', '隆阳区');
INSERT INTO `sys_address_area` VALUES ('530521', '0', '100', '530500', '施甸县');
INSERT INTO `sys_address_area` VALUES ('530522', '0', '100', '530500', '腾冲县');
INSERT INTO `sys_address_area` VALUES ('530523', '0', '100', '530500', '龙陵县');
INSERT INTO `sys_address_area` VALUES ('530524', '0', '100', '530500', '昌宁县');
INSERT INTO `sys_address_area` VALUES ('530601', '0', '100', '530600', '市辖区');
INSERT INTO `sys_address_area` VALUES ('530602', '0', '100', '530600', '昭阳区');
INSERT INTO `sys_address_area` VALUES ('530621', '0', '100', '530600', '鲁甸县');
INSERT INTO `sys_address_area` VALUES ('530622', '0', '100', '530600', '巧家县');
INSERT INTO `sys_address_area` VALUES ('530623', '0', '100', '530600', '盐津县');
INSERT INTO `sys_address_area` VALUES ('530624', '0', '100', '530600', '大关县');
INSERT INTO `sys_address_area` VALUES ('530625', '0', '100', '530600', '永善县');
INSERT INTO `sys_address_area` VALUES ('530626', '0', '100', '530600', '绥江县');
INSERT INTO `sys_address_area` VALUES ('530627', '0', '100', '530600', '镇雄县');
INSERT INTO `sys_address_area` VALUES ('530628', '0', '100', '530600', '彝良县');
INSERT INTO `sys_address_area` VALUES ('530629', '0', '100', '530600', '威信县');
INSERT INTO `sys_address_area` VALUES ('530630', '0', '100', '530600', '水富县');
INSERT INTO `sys_address_area` VALUES ('530701', '0', '100', '530700', '市辖区');
INSERT INTO `sys_address_area` VALUES ('530702', '0', '100', '530700', '古城区');
INSERT INTO `sys_address_area` VALUES ('530721', '0', '100', '530700', '玉龙纳西族自治县');
INSERT INTO `sys_address_area` VALUES ('530722', '0', '100', '530700', '永胜县');
INSERT INTO `sys_address_area` VALUES ('530723', '0', '100', '530700', '华坪县');
INSERT INTO `sys_address_area` VALUES ('530724', '0', '100', '530700', '宁蒗彝族自治县');
INSERT INTO `sys_address_area` VALUES ('530801', '0', '100', '530800', '市辖区');
INSERT INTO `sys_address_area` VALUES ('530802', '0', '100', '530800', '翠云区');
INSERT INTO `sys_address_area` VALUES ('530821', '0', '100', '530800', '普洱哈尼族彝族自治县');
INSERT INTO `sys_address_area` VALUES ('530822', '0', '100', '530800', '墨江哈尼族自治县');
INSERT INTO `sys_address_area` VALUES ('530823', '0', '100', '530800', '景东彝族自治县');
INSERT INTO `sys_address_area` VALUES ('530824', '0', '100', '530800', '景谷傣族彝族自治县');
INSERT INTO `sys_address_area` VALUES ('530825', '0', '100', '530800', '镇沅彝族哈尼族拉祜族自治县');
INSERT INTO `sys_address_area` VALUES ('530826', '0', '100', '530800', '江城哈尼族彝族自治县');
INSERT INTO `sys_address_area` VALUES ('530827', '0', '100', '530800', '孟连傣族拉祜族佤族自治县');
INSERT INTO `sys_address_area` VALUES ('530828', '0', '100', '530800', '澜沧拉祜族自治县');
INSERT INTO `sys_address_area` VALUES ('530829', '0', '100', '530800', '西盟佤族自治县');
INSERT INTO `sys_address_area` VALUES ('530901', '0', '100', '530900', '市辖区');
INSERT INTO `sys_address_area` VALUES ('530902', '0', '100', '530900', '临翔区');
INSERT INTO `sys_address_area` VALUES ('530921', '0', '100', '530900', '凤庆县');
INSERT INTO `sys_address_area` VALUES ('530922', '0', '100', '530900', '云　县');
INSERT INTO `sys_address_area` VALUES ('530923', '0', '100', '530900', '永德县');
INSERT INTO `sys_address_area` VALUES ('530924', '0', '100', '530900', '镇康县');
INSERT INTO `sys_address_area` VALUES ('530925', '0', '100', '530900', '双江拉祜族佤族布朗族傣族自治县');
INSERT INTO `sys_address_area` VALUES ('530926', '0', '100', '530900', '耿马傣族佤族自治县');
INSERT INTO `sys_address_area` VALUES ('530927', '0', '100', '530900', '沧源佤族自治县');
INSERT INTO `sys_address_area` VALUES ('532301', '0', '100', '532300', '楚雄市');
INSERT INTO `sys_address_area` VALUES ('532322', '0', '100', '532300', '双柏县');
INSERT INTO `sys_address_area` VALUES ('532323', '0', '100', '532300', '牟定县');
INSERT INTO `sys_address_area` VALUES ('532324', '0', '100', '532300', '南华县');
INSERT INTO `sys_address_area` VALUES ('532325', '0', '100', '532300', '姚安县');
INSERT INTO `sys_address_area` VALUES ('532326', '0', '100', '532300', '大姚县');
INSERT INTO `sys_address_area` VALUES ('532327', '0', '100', '532300', '永仁县');
INSERT INTO `sys_address_area` VALUES ('532328', '0', '100', '532300', '元谋县');
INSERT INTO `sys_address_area` VALUES ('532329', '0', '100', '532300', '武定县');
INSERT INTO `sys_address_area` VALUES ('532331', '0', '100', '532300', '禄丰县');
INSERT INTO `sys_address_area` VALUES ('532501', '0', '100', '532500', '个旧市');
INSERT INTO `sys_address_area` VALUES ('532502', '0', '100', '532500', '开远市');
INSERT INTO `sys_address_area` VALUES ('532522', '0', '100', '532500', '蒙自县');
INSERT INTO `sys_address_area` VALUES ('532523', '0', '100', '532500', '屏边苗族自治县');
INSERT INTO `sys_address_area` VALUES ('532524', '0', '100', '532500', '建水县');
INSERT INTO `sys_address_area` VALUES ('532525', '0', '100', '532500', '石屏县');
INSERT INTO `sys_address_area` VALUES ('532526', '0', '100', '532500', '弥勒县');
INSERT INTO `sys_address_area` VALUES ('532527', '0', '100', '532500', '泸西县');
INSERT INTO `sys_address_area` VALUES ('532528', '0', '100', '532500', '元阳县');
INSERT INTO `sys_address_area` VALUES ('532529', '0', '100', '532500', '红河县');
INSERT INTO `sys_address_area` VALUES ('532530', '0', '100', '532500', '金平苗族瑶族傣族自治县');
INSERT INTO `sys_address_area` VALUES ('532531', '0', '100', '532500', '绿春县');
INSERT INTO `sys_address_area` VALUES ('532532', '0', '100', '532500', '河口瑶族自治县');
INSERT INTO `sys_address_area` VALUES ('532621', '0', '100', '532600', '文山县');
INSERT INTO `sys_address_area` VALUES ('532622', '0', '100', '532600', '砚山县');
INSERT INTO `sys_address_area` VALUES ('532623', '0', '100', '532600', '西畴县');
INSERT INTO `sys_address_area` VALUES ('532624', '0', '100', '532600', '麻栗坡县');
INSERT INTO `sys_address_area` VALUES ('532625', '0', '100', '532600', '马关县');
INSERT INTO `sys_address_area` VALUES ('532626', '0', '100', '532600', '丘北县');
INSERT INTO `sys_address_area` VALUES ('532627', '0', '100', '532600', '广南县');
INSERT INTO `sys_address_area` VALUES ('532628', '0', '100', '532600', '富宁县');
INSERT INTO `sys_address_area` VALUES ('532801', '0', '100', '532800', '景洪市');
INSERT INTO `sys_address_area` VALUES ('532822', '0', '100', '532800', '勐海县');
INSERT INTO `sys_address_area` VALUES ('532823', '0', '100', '532800', '勐腊县');
INSERT INTO `sys_address_area` VALUES ('532901', '0', '100', '532900', '大理市');
INSERT INTO `sys_address_area` VALUES ('532922', '0', '100', '532900', '漾濞彝族自治县');
INSERT INTO `sys_address_area` VALUES ('532923', '0', '100', '532900', '祥云县');
INSERT INTO `sys_address_area` VALUES ('532924', '0', '100', '532900', '宾川县');
INSERT INTO `sys_address_area` VALUES ('532925', '0', '100', '532900', '弥渡县');
INSERT INTO `sys_address_area` VALUES ('532926', '0', '100', '532900', '南涧彝族自治县');
INSERT INTO `sys_address_area` VALUES ('532927', '0', '100', '532900', '巍山彝族回族自治县');
INSERT INTO `sys_address_area` VALUES ('532928', '0', '100', '532900', '永平县');
INSERT INTO `sys_address_area` VALUES ('532929', '0', '100', '532900', '云龙县');
INSERT INTO `sys_address_area` VALUES ('532930', '0', '100', '532900', '洱源县');
INSERT INTO `sys_address_area` VALUES ('532931', '0', '100', '532900', '剑川县');
INSERT INTO `sys_address_area` VALUES ('532932', '0', '100', '532900', '鹤庆县');
INSERT INTO `sys_address_area` VALUES ('533102', '0', '100', '533100', '瑞丽市');
INSERT INTO `sys_address_area` VALUES ('533103', '0', '100', '533100', '潞西市');
INSERT INTO `sys_address_area` VALUES ('533122', '0', '100', '533100', '梁河县');
INSERT INTO `sys_address_area` VALUES ('533123', '0', '100', '533100', '盈江县');
INSERT INTO `sys_address_area` VALUES ('533124', '0', '100', '533100', '陇川县');
INSERT INTO `sys_address_area` VALUES ('533321', '0', '100', '533300', '泸水县');
INSERT INTO `sys_address_area` VALUES ('533323', '0', '100', '533300', '福贡县');
INSERT INTO `sys_address_area` VALUES ('533324', '0', '100', '533300', '贡山独龙族怒族自治县');
INSERT INTO `sys_address_area` VALUES ('533325', '0', '100', '533300', '兰坪白族普米族自治县');
INSERT INTO `sys_address_area` VALUES ('533421', '0', '100', '533400', '香格里拉县');
INSERT INTO `sys_address_area` VALUES ('533422', '0', '100', '533400', '德钦县');
INSERT INTO `sys_address_area` VALUES ('533423', '0', '100', '533400', '维西傈僳族自治县');
INSERT INTO `sys_address_area` VALUES ('540101', '0', '100', '540100', '市辖区');
INSERT INTO `sys_address_area` VALUES ('540102', '0', '100', '540100', '城关区');
INSERT INTO `sys_address_area` VALUES ('540121', '0', '100', '540100', '林周县');
INSERT INTO `sys_address_area` VALUES ('540122', '0', '100', '540100', '当雄县');
INSERT INTO `sys_address_area` VALUES ('540123', '0', '100', '540100', '尼木县');
INSERT INTO `sys_address_area` VALUES ('540124', '0', '100', '540100', '曲水县');
INSERT INTO `sys_address_area` VALUES ('540125', '0', '100', '540100', '堆龙德庆县');
INSERT INTO `sys_address_area` VALUES ('540126', '0', '100', '540100', '达孜县');
INSERT INTO `sys_address_area` VALUES ('540127', '0', '100', '540100', '墨竹工卡县');
INSERT INTO `sys_address_area` VALUES ('542121', '0', '100', '542100', '昌都县');
INSERT INTO `sys_address_area` VALUES ('542122', '0', '100', '542100', '江达县');
INSERT INTO `sys_address_area` VALUES ('542123', '0', '100', '542100', '贡觉县');
INSERT INTO `sys_address_area` VALUES ('542124', '0', '100', '542100', '类乌齐县');
INSERT INTO `sys_address_area` VALUES ('542125', '0', '100', '542100', '丁青县');
INSERT INTO `sys_address_area` VALUES ('542126', '0', '100', '542100', '察雅县');
INSERT INTO `sys_address_area` VALUES ('542127', '0', '100', '542100', '八宿县');
INSERT INTO `sys_address_area` VALUES ('542128', '0', '100', '542100', '左贡县');
INSERT INTO `sys_address_area` VALUES ('542129', '0', '100', '542100', '芒康县');
INSERT INTO `sys_address_area` VALUES ('542132', '0', '100', '542100', '洛隆县');
INSERT INTO `sys_address_area` VALUES ('542133', '0', '100', '542100', '边坝县');
INSERT INTO `sys_address_area` VALUES ('542221', '0', '100', '542200', '乃东县');
INSERT INTO `sys_address_area` VALUES ('542222', '0', '100', '542200', '扎囊县');
INSERT INTO `sys_address_area` VALUES ('542223', '0', '100', '542200', '贡嘎县');
INSERT INTO `sys_address_area` VALUES ('542224', '0', '100', '542200', '桑日县');
INSERT INTO `sys_address_area` VALUES ('542225', '0', '100', '542200', '琼结县');
INSERT INTO `sys_address_area` VALUES ('542226', '0', '100', '542200', '曲松县');
INSERT INTO `sys_address_area` VALUES ('542227', '0', '100', '542200', '措美县');
INSERT INTO `sys_address_area` VALUES ('542228', '0', '100', '542200', '洛扎县');
INSERT INTO `sys_address_area` VALUES ('542229', '0', '100', '542200', '加查县');
INSERT INTO `sys_address_area` VALUES ('542231', '0', '100', '542200', '隆子县');
INSERT INTO `sys_address_area` VALUES ('542232', '0', '100', '542200', '错那县');
INSERT INTO `sys_address_area` VALUES ('542233', '0', '100', '542200', '浪卡子县');
INSERT INTO `sys_address_area` VALUES ('542301', '0', '100', '542300', '日喀则市');
INSERT INTO `sys_address_area` VALUES ('542322', '0', '100', '542300', '南木林县');
INSERT INTO `sys_address_area` VALUES ('542323', '0', '100', '542300', '江孜县');
INSERT INTO `sys_address_area` VALUES ('542324', '0', '100', '542300', '定日县');
INSERT INTO `sys_address_area` VALUES ('542325', '0', '100', '542300', '萨迦县');
INSERT INTO `sys_address_area` VALUES ('542326', '0', '100', '542300', '拉孜县');
INSERT INTO `sys_address_area` VALUES ('542327', '0', '100', '542300', '昂仁县');
INSERT INTO `sys_address_area` VALUES ('542328', '0', '100', '542300', '谢通门县');
INSERT INTO `sys_address_area` VALUES ('542329', '0', '100', '542300', '白朗县');
INSERT INTO `sys_address_area` VALUES ('542330', '0', '100', '542300', '仁布县');
INSERT INTO `sys_address_area` VALUES ('542331', '0', '100', '542300', '康马县');
INSERT INTO `sys_address_area` VALUES ('542332', '0', '100', '542300', '定结县');
INSERT INTO `sys_address_area` VALUES ('542333', '0', '100', '542300', '仲巴县');
INSERT INTO `sys_address_area` VALUES ('542334', '0', '100', '542300', '亚东县');
INSERT INTO `sys_address_area` VALUES ('542335', '0', '100', '542300', '吉隆县');
INSERT INTO `sys_address_area` VALUES ('542336', '0', '100', '542300', '聂拉木县');
INSERT INTO `sys_address_area` VALUES ('542337', '0', '100', '542300', '萨嘎县');
INSERT INTO `sys_address_area` VALUES ('542338', '0', '100', '542300', '岗巴县');
INSERT INTO `sys_address_area` VALUES ('542421', '0', '100', '542400', '那曲县');
INSERT INTO `sys_address_area` VALUES ('542422', '0', '100', '542400', '嘉黎县');
INSERT INTO `sys_address_area` VALUES ('542423', '0', '100', '542400', '比如县');
INSERT INTO `sys_address_area` VALUES ('542424', '0', '100', '542400', '聂荣县');
INSERT INTO `sys_address_area` VALUES ('542425', '0', '100', '542400', '安多县');
INSERT INTO `sys_address_area` VALUES ('542426', '0', '100', '542400', '申扎县');
INSERT INTO `sys_address_area` VALUES ('542427', '0', '100', '542400', '索　县');
INSERT INTO `sys_address_area` VALUES ('542428', '0', '100', '542400', '班戈县');
INSERT INTO `sys_address_area` VALUES ('542429', '0', '100', '542400', '巴青县');
INSERT INTO `sys_address_area` VALUES ('542430', '0', '100', '542400', '尼玛县');
INSERT INTO `sys_address_area` VALUES ('542521', '0', '100', '542500', '普兰县');
INSERT INTO `sys_address_area` VALUES ('542522', '0', '100', '542500', '札达县');
INSERT INTO `sys_address_area` VALUES ('542523', '0', '100', '542500', '噶尔县');
INSERT INTO `sys_address_area` VALUES ('542524', '0', '100', '542500', '日土县');
INSERT INTO `sys_address_area` VALUES ('542525', '0', '100', '542500', '革吉县');
INSERT INTO `sys_address_area` VALUES ('542526', '0', '100', '542500', '改则县');
INSERT INTO `sys_address_area` VALUES ('542527', '0', '100', '542500', '措勤县');
INSERT INTO `sys_address_area` VALUES ('542621', '0', '100', '542600', '林芝县');
INSERT INTO `sys_address_area` VALUES ('542622', '0', '100', '542600', '工布江达县');
INSERT INTO `sys_address_area` VALUES ('542623', '0', '100', '542600', '米林县');
INSERT INTO `sys_address_area` VALUES ('542624', '0', '100', '542600', '墨脱县');
INSERT INTO `sys_address_area` VALUES ('542625', '0', '100', '542600', '波密县');
INSERT INTO `sys_address_area` VALUES ('542626', '0', '100', '542600', '察隅县');
INSERT INTO `sys_address_area` VALUES ('542627', '0', '100', '542600', '朗　县');
INSERT INTO `sys_address_area` VALUES ('610101', '0', '100', '610100', '市辖区');
INSERT INTO `sys_address_area` VALUES ('610102', '0', '100', '610100', '新城区');
INSERT INTO `sys_address_area` VALUES ('610103', '0', '100', '610100', '碑林区');
INSERT INTO `sys_address_area` VALUES ('610104', '0', '100', '610100', '莲湖区');
INSERT INTO `sys_address_area` VALUES ('610111', '0', '100', '610100', '灞桥区');
INSERT INTO `sys_address_area` VALUES ('610112', '0', '100', '610100', '未央区');
INSERT INTO `sys_address_area` VALUES ('610113', '0', '100', '610100', '雁塔区');
INSERT INTO `sys_address_area` VALUES ('610114', '0', '100', '610100', '阎良区');
INSERT INTO `sys_address_area` VALUES ('610115', '0', '100', '610100', '临潼区');
INSERT INTO `sys_address_area` VALUES ('610116', '0', '100', '610100', '长安区');
INSERT INTO `sys_address_area` VALUES ('610122', '0', '100', '610100', '蓝田县');
INSERT INTO `sys_address_area` VALUES ('610124', '0', '100', '610100', '周至县');
INSERT INTO `sys_address_area` VALUES ('610125', '0', '100', '610100', '户　县');
INSERT INTO `sys_address_area` VALUES ('610126', '0', '100', '610100', '高陵县');
INSERT INTO `sys_address_area` VALUES ('610201', '0', '100', '610200', '市辖区');
INSERT INTO `sys_address_area` VALUES ('610202', '0', '100', '610200', '王益区');
INSERT INTO `sys_address_area` VALUES ('610203', '0', '100', '610200', '印台区');
INSERT INTO `sys_address_area` VALUES ('610204', '0', '100', '610200', '耀州区');
INSERT INTO `sys_address_area` VALUES ('610222', '0', '100', '610200', '宜君县');
INSERT INTO `sys_address_area` VALUES ('610301', '0', '100', '610300', '市辖区');
INSERT INTO `sys_address_area` VALUES ('610302', '0', '100', '610300', '渭滨区');
INSERT INTO `sys_address_area` VALUES ('610303', '0', '100', '610300', '金台区');
INSERT INTO `sys_address_area` VALUES ('610304', '0', '100', '610300', '陈仓区');
INSERT INTO `sys_address_area` VALUES ('610322', '0', '100', '610300', '凤翔县');
INSERT INTO `sys_address_area` VALUES ('610323', '0', '100', '610300', '岐山县');
INSERT INTO `sys_address_area` VALUES ('610324', '0', '100', '610300', '扶风县');
INSERT INTO `sys_address_area` VALUES ('610326', '0', '100', '610300', '眉　县');
INSERT INTO `sys_address_area` VALUES ('610327', '0', '100', '610300', '陇　县');
INSERT INTO `sys_address_area` VALUES ('610328', '0', '100', '610300', '千阳县');
INSERT INTO `sys_address_area` VALUES ('610329', '0', '100', '610300', '麟游县');
INSERT INTO `sys_address_area` VALUES ('610330', '0', '100', '610300', '凤　县');
INSERT INTO `sys_address_area` VALUES ('610331', '0', '100', '610300', '太白县');
INSERT INTO `sys_address_area` VALUES ('610401', '0', '100', '610400', '市辖区');
INSERT INTO `sys_address_area` VALUES ('610402', '0', '100', '610400', '秦都区');
INSERT INTO `sys_address_area` VALUES ('610403', '0', '100', '610400', '杨凌区');
INSERT INTO `sys_address_area` VALUES ('610404', '0', '100', '610400', '渭城区');
INSERT INTO `sys_address_area` VALUES ('610422', '0', '100', '610400', '三原县');
INSERT INTO `sys_address_area` VALUES ('610423', '0', '100', '610400', '泾阳县');
INSERT INTO `sys_address_area` VALUES ('610424', '0', '100', '610400', '乾　县');
INSERT INTO `sys_address_area` VALUES ('610425', '0', '100', '610400', '礼泉县');
INSERT INTO `sys_address_area` VALUES ('610426', '0', '100', '610400', '永寿县');
INSERT INTO `sys_address_area` VALUES ('610427', '0', '100', '610400', '彬　县');
INSERT INTO `sys_address_area` VALUES ('610428', '0', '100', '610400', '长武县');
INSERT INTO `sys_address_area` VALUES ('610429', '0', '100', '610400', '旬邑县');
INSERT INTO `sys_address_area` VALUES ('610430', '0', '100', '610400', '淳化县');
INSERT INTO `sys_address_area` VALUES ('610431', '0', '100', '610400', '武功县');
INSERT INTO `sys_address_area` VALUES ('610481', '0', '100', '610400', '兴平市');
INSERT INTO `sys_address_area` VALUES ('610501', '0', '100', '610500', '市辖区');
INSERT INTO `sys_address_area` VALUES ('610502', '0', '100', '610500', '临渭区');
INSERT INTO `sys_address_area` VALUES ('610521', '0', '100', '610500', '华　县');
INSERT INTO `sys_address_area` VALUES ('610522', '0', '100', '610500', '潼关县');
INSERT INTO `sys_address_area` VALUES ('610523', '0', '100', '610500', '大荔县');
INSERT INTO `sys_address_area` VALUES ('610524', '0', '100', '610500', '合阳县');
INSERT INTO `sys_address_area` VALUES ('610525', '0', '100', '610500', '澄城县');
INSERT INTO `sys_address_area` VALUES ('610526', '0', '100', '610500', '蒲城县');
INSERT INTO `sys_address_area` VALUES ('610527', '0', '100', '610500', '白水县');
INSERT INTO `sys_address_area` VALUES ('610528', '0', '100', '610500', '富平县');
INSERT INTO `sys_address_area` VALUES ('610581', '0', '100', '610500', '韩城市');
INSERT INTO `sys_address_area` VALUES ('610582', '0', '100', '610500', '华阴市');
INSERT INTO `sys_address_area` VALUES ('610601', '0', '100', '610600', '市辖区');
INSERT INTO `sys_address_area` VALUES ('610602', '0', '100', '610600', '宝塔区');
INSERT INTO `sys_address_area` VALUES ('610621', '0', '100', '610600', '延长县');
INSERT INTO `sys_address_area` VALUES ('610622', '0', '100', '610600', '延川县');
INSERT INTO `sys_address_area` VALUES ('610623', '0', '100', '610600', '子长县');
INSERT INTO `sys_address_area` VALUES ('610624', '0', '100', '610600', '安塞县');
INSERT INTO `sys_address_area` VALUES ('610625', '0', '100', '610600', '志丹县');
INSERT INTO `sys_address_area` VALUES ('610626', '0', '100', '610600', '吴旗县');
INSERT INTO `sys_address_area` VALUES ('610627', '0', '100', '610600', '甘泉县');
INSERT INTO `sys_address_area` VALUES ('610628', '0', '100', '610600', '富　县');
INSERT INTO `sys_address_area` VALUES ('610629', '0', '100', '610600', '洛川县');
INSERT INTO `sys_address_area` VALUES ('610630', '0', '100', '610600', '宜川县');
INSERT INTO `sys_address_area` VALUES ('610631', '0', '100', '610600', '黄龙县');
INSERT INTO `sys_address_area` VALUES ('610632', '0', '100', '610600', '黄陵县');
INSERT INTO `sys_address_area` VALUES ('610701', '0', '100', '610700', '市辖区');
INSERT INTO `sys_address_area` VALUES ('610702', '0', '100', '610700', '汉台区');
INSERT INTO `sys_address_area` VALUES ('610721', '0', '100', '610700', '南郑县');
INSERT INTO `sys_address_area` VALUES ('610722', '0', '100', '610700', '城固县');
INSERT INTO `sys_address_area` VALUES ('610723', '0', '100', '610700', '洋　县');
INSERT INTO `sys_address_area` VALUES ('610724', '0', '100', '610700', '西乡县');
INSERT INTO `sys_address_area` VALUES ('610725', '0', '100', '610700', '勉　县');
INSERT INTO `sys_address_area` VALUES ('610726', '0', '100', '610700', '宁强县');
INSERT INTO `sys_address_area` VALUES ('610727', '0', '100', '610700', '略阳县');
INSERT INTO `sys_address_area` VALUES ('610728', '0', '100', '610700', '镇巴县');
INSERT INTO `sys_address_area` VALUES ('610729', '0', '100', '610700', '留坝县');
INSERT INTO `sys_address_area` VALUES ('610730', '0', '100', '610700', '佛坪县');
INSERT INTO `sys_address_area` VALUES ('610801', '0', '100', '610800', '市辖区');
INSERT INTO `sys_address_area` VALUES ('610802', '0', '100', '610800', '榆阳区');
INSERT INTO `sys_address_area` VALUES ('610821', '0', '100', '610800', '神木县');
INSERT INTO `sys_address_area` VALUES ('610822', '0', '100', '610800', '府谷县');
INSERT INTO `sys_address_area` VALUES ('610823', '0', '100', '610800', '横山县');
INSERT INTO `sys_address_area` VALUES ('610824', '0', '100', '610800', '靖边县');
INSERT INTO `sys_address_area` VALUES ('610825', '0', '100', '610800', '定边县');
INSERT INTO `sys_address_area` VALUES ('610826', '0', '100', '610800', '绥德县');
INSERT INTO `sys_address_area` VALUES ('610827', '0', '100', '610800', '米脂县');
INSERT INTO `sys_address_area` VALUES ('610828', '0', '100', '610800', '佳　县');
INSERT INTO `sys_address_area` VALUES ('610829', '0', '100', '610800', '吴堡县');
INSERT INTO `sys_address_area` VALUES ('610830', '0', '100', '610800', '清涧县');
INSERT INTO `sys_address_area` VALUES ('610831', '0', '100', '610800', '子洲县');
INSERT INTO `sys_address_area` VALUES ('610901', '0', '100', '610900', '市辖区');
INSERT INTO `sys_address_area` VALUES ('610902', '0', '100', '610900', '汉滨区');
INSERT INTO `sys_address_area` VALUES ('610921', '0', '100', '610900', '汉阴县');
INSERT INTO `sys_address_area` VALUES ('610922', '0', '100', '610900', '石泉县');
INSERT INTO `sys_address_area` VALUES ('610923', '0', '100', '610900', '宁陕县');
INSERT INTO `sys_address_area` VALUES ('610924', '0', '100', '610900', '紫阳县');
INSERT INTO `sys_address_area` VALUES ('610925', '0', '100', '610900', '岚皋县');
INSERT INTO `sys_address_area` VALUES ('610926', '0', '100', '610900', '平利县');
INSERT INTO `sys_address_area` VALUES ('610927', '0', '100', '610900', '镇坪县');
INSERT INTO `sys_address_area` VALUES ('610928', '0', '100', '610900', '旬阳县');
INSERT INTO `sys_address_area` VALUES ('610929', '0', '100', '610900', '白河县');
INSERT INTO `sys_address_area` VALUES ('611001', '0', '100', '611000', '市辖区');
INSERT INTO `sys_address_area` VALUES ('611002', '0', '100', '611000', '商州区');
INSERT INTO `sys_address_area` VALUES ('611021', '0', '100', '611000', '洛南县');
INSERT INTO `sys_address_area` VALUES ('611022', '0', '100', '611000', '丹凤县');
INSERT INTO `sys_address_area` VALUES ('611023', '0', '100', '611000', '商南县');
INSERT INTO `sys_address_area` VALUES ('611024', '0', '100', '611000', '山阳县');
INSERT INTO `sys_address_area` VALUES ('611025', '0', '100', '611000', '镇安县');
INSERT INTO `sys_address_area` VALUES ('611026', '0', '100', '611000', '柞水县');
INSERT INTO `sys_address_area` VALUES ('620101', '0', '100', '620100', '市辖区');
INSERT INTO `sys_address_area` VALUES ('620102', '0', '100', '620100', '城关区');
INSERT INTO `sys_address_area` VALUES ('620103', '0', '100', '620100', '七里河区');
INSERT INTO `sys_address_area` VALUES ('620104', '0', '100', '620100', '西固区');
INSERT INTO `sys_address_area` VALUES ('620105', '0', '100', '620100', '安宁区');
INSERT INTO `sys_address_area` VALUES ('620111', '0', '100', '620100', '红古区');
INSERT INTO `sys_address_area` VALUES ('620121', '0', '100', '620100', '永登县');
INSERT INTO `sys_address_area` VALUES ('620122', '0', '100', '620100', '皋兰县');
INSERT INTO `sys_address_area` VALUES ('620123', '0', '100', '620100', '榆中县');
INSERT INTO `sys_address_area` VALUES ('620201', '0', '100', '620200', '市辖区');
INSERT INTO `sys_address_area` VALUES ('620301', '0', '100', '620300', '市辖区');
INSERT INTO `sys_address_area` VALUES ('620302', '0', '100', '620300', '金川区');
INSERT INTO `sys_address_area` VALUES ('620321', '0', '100', '620300', '永昌县');
INSERT INTO `sys_address_area` VALUES ('620401', '0', '100', '620400', '市辖区');
INSERT INTO `sys_address_area` VALUES ('620402', '0', '100', '620400', '白银区');
INSERT INTO `sys_address_area` VALUES ('620403', '0', '100', '620400', '平川区');
INSERT INTO `sys_address_area` VALUES ('620421', '0', '100', '620400', '靖远县');
INSERT INTO `sys_address_area` VALUES ('620422', '0', '100', '620400', '会宁县');
INSERT INTO `sys_address_area` VALUES ('620423', '0', '100', '620400', '景泰县');
INSERT INTO `sys_address_area` VALUES ('620501', '0', '100', '620500', '市辖区');
INSERT INTO `sys_address_area` VALUES ('620502', '0', '100', '620500', '秦城区');
INSERT INTO `sys_address_area` VALUES ('620503', '0', '100', '620500', '北道区');
INSERT INTO `sys_address_area` VALUES ('620521', '0', '100', '620500', '清水县');
INSERT INTO `sys_address_area` VALUES ('620522', '0', '100', '620500', '秦安县');
INSERT INTO `sys_address_area` VALUES ('620523', '0', '100', '620500', '甘谷县');
INSERT INTO `sys_address_area` VALUES ('620524', '0', '100', '620500', '武山县');
INSERT INTO `sys_address_area` VALUES ('620525', '0', '100', '620500', '张家川回族自治县');
INSERT INTO `sys_address_area` VALUES ('620601', '0', '100', '620600', '市辖区');
INSERT INTO `sys_address_area` VALUES ('620602', '0', '100', '620600', '凉州区');
INSERT INTO `sys_address_area` VALUES ('620621', '0', '100', '620600', '民勤县');
INSERT INTO `sys_address_area` VALUES ('620622', '0', '100', '620600', '古浪县');
INSERT INTO `sys_address_area` VALUES ('620623', '0', '100', '620600', '天祝藏族自治县');
INSERT INTO `sys_address_area` VALUES ('620701', '0', '100', '620700', '市辖区');
INSERT INTO `sys_address_area` VALUES ('620702', '0', '100', '620700', '甘州区');
INSERT INTO `sys_address_area` VALUES ('620721', '0', '100', '620700', '肃南裕固族自治县');
INSERT INTO `sys_address_area` VALUES ('620722', '0', '100', '620700', '民乐县');
INSERT INTO `sys_address_area` VALUES ('620723', '0', '100', '620700', '临泽县');
INSERT INTO `sys_address_area` VALUES ('620724', '0', '100', '620700', '高台县');
INSERT INTO `sys_address_area` VALUES ('620725', '0', '100', '620700', '山丹县');
INSERT INTO `sys_address_area` VALUES ('620801', '0', '100', '620800', '市辖区');
INSERT INTO `sys_address_area` VALUES ('620802', '0', '100', '620800', '崆峒区');
INSERT INTO `sys_address_area` VALUES ('620821', '0', '100', '620800', '泾川县');
INSERT INTO `sys_address_area` VALUES ('620822', '0', '100', '620800', '灵台县');
INSERT INTO `sys_address_area` VALUES ('620823', '0', '100', '620800', '崇信县');
INSERT INTO `sys_address_area` VALUES ('620824', '0', '100', '620800', '华亭县');
INSERT INTO `sys_address_area` VALUES ('620825', '0', '100', '620800', '庄浪县');
INSERT INTO `sys_address_area` VALUES ('620826', '0', '100', '620800', '静宁县');
INSERT INTO `sys_address_area` VALUES ('620901', '0', '100', '620900', '市辖区');
INSERT INTO `sys_address_area` VALUES ('620902', '0', '100', '620900', '肃州区');
INSERT INTO `sys_address_area` VALUES ('620921', '0', '100', '620900', '金塔县');
INSERT INTO `sys_address_area` VALUES ('620922', '0', '100', '620900', '安西县');
INSERT INTO `sys_address_area` VALUES ('620923', '0', '100', '620900', '肃北蒙古族自治县');
INSERT INTO `sys_address_area` VALUES ('620924', '0', '100', '620900', '阿克塞哈萨克族自治县');
INSERT INTO `sys_address_area` VALUES ('620981', '0', '100', '620900', '玉门市');
INSERT INTO `sys_address_area` VALUES ('620982', '0', '100', '620900', '敦煌市');
INSERT INTO `sys_address_area` VALUES ('621001', '0', '100', '621000', '市辖区');
INSERT INTO `sys_address_area` VALUES ('621002', '0', '100', '621000', '西峰区');
INSERT INTO `sys_address_area` VALUES ('621021', '0', '100', '621000', '庆城县');
INSERT INTO `sys_address_area` VALUES ('621022', '0', '100', '621000', '环　县');
INSERT INTO `sys_address_area` VALUES ('621023', '0', '100', '621000', '华池县');
INSERT INTO `sys_address_area` VALUES ('621024', '0', '100', '621000', '合水县');
INSERT INTO `sys_address_area` VALUES ('621025', '0', '100', '621000', '正宁县');
INSERT INTO `sys_address_area` VALUES ('621026', '0', '100', '621000', '宁　县');
INSERT INTO `sys_address_area` VALUES ('621027', '0', '100', '621000', '镇原县');
INSERT INTO `sys_address_area` VALUES ('621101', '0', '100', '621100', '市辖区');
INSERT INTO `sys_address_area` VALUES ('621102', '0', '100', '621100', '安定区');
INSERT INTO `sys_address_area` VALUES ('621121', '0', '100', '621100', '通渭县');
INSERT INTO `sys_address_area` VALUES ('621122', '0', '100', '621100', '陇西县');
INSERT INTO `sys_address_area` VALUES ('621123', '0', '100', '621100', '渭源县');
INSERT INTO `sys_address_area` VALUES ('621124', '0', '100', '621100', '临洮县');
INSERT INTO `sys_address_area` VALUES ('621125', '0', '100', '621100', '漳　县');
INSERT INTO `sys_address_area` VALUES ('621126', '0', '100', '621100', '岷　县');
INSERT INTO `sys_address_area` VALUES ('621201', '0', '100', '621200', '市辖区');
INSERT INTO `sys_address_area` VALUES ('621202', '0', '100', '621200', '武都区');
INSERT INTO `sys_address_area` VALUES ('621221', '0', '100', '621200', '成　县');
INSERT INTO `sys_address_area` VALUES ('621222', '0', '100', '621200', '文　县');
INSERT INTO `sys_address_area` VALUES ('621223', '0', '100', '621200', '宕昌县');
INSERT INTO `sys_address_area` VALUES ('621224', '0', '100', '621200', '康　县');
INSERT INTO `sys_address_area` VALUES ('621225', '0', '100', '621200', '西和县');
INSERT INTO `sys_address_area` VALUES ('621226', '0', '100', '621200', '礼　县');
INSERT INTO `sys_address_area` VALUES ('621227', '0', '100', '621200', '徽　县');
INSERT INTO `sys_address_area` VALUES ('621228', '0', '100', '621200', '两当县');
INSERT INTO `sys_address_area` VALUES ('622901', '0', '100', '622900', '临夏市');
INSERT INTO `sys_address_area` VALUES ('622921', '0', '100', '622900', '临夏县');
INSERT INTO `sys_address_area` VALUES ('622922', '0', '100', '622900', '康乐县');
INSERT INTO `sys_address_area` VALUES ('622923', '0', '100', '622900', '永靖县');
INSERT INTO `sys_address_area` VALUES ('622924', '0', '100', '622900', '广河县');
INSERT INTO `sys_address_area` VALUES ('622925', '0', '100', '622900', '和政县');
INSERT INTO `sys_address_area` VALUES ('622926', '0', '100', '622900', '东乡族自治县');
INSERT INTO `sys_address_area` VALUES ('622927', '0', '100', '622900', '积石山保安族东乡族撒拉族自治县');
INSERT INTO `sys_address_area` VALUES ('623001', '0', '100', '623000', '合作市');
INSERT INTO `sys_address_area` VALUES ('623021', '0', '100', '623000', '临潭县');
INSERT INTO `sys_address_area` VALUES ('623022', '0', '100', '623000', '卓尼县');
INSERT INTO `sys_address_area` VALUES ('623023', '0', '100', '623000', '舟曲县');
INSERT INTO `sys_address_area` VALUES ('623024', '0', '100', '623000', '迭部县');
INSERT INTO `sys_address_area` VALUES ('623025', '0', '100', '623000', '玛曲县');
INSERT INTO `sys_address_area` VALUES ('623026', '0', '100', '623000', '碌曲县');
INSERT INTO `sys_address_area` VALUES ('623027', '0', '100', '623000', '夏河县');
INSERT INTO `sys_address_area` VALUES ('630101', '0', '100', '630100', '市辖区');
INSERT INTO `sys_address_area` VALUES ('630102', '0', '100', '630100', '城东区');
INSERT INTO `sys_address_area` VALUES ('630103', '0', '100', '630100', '城中区');
INSERT INTO `sys_address_area` VALUES ('630104', '0', '100', '630100', '城西区');
INSERT INTO `sys_address_area` VALUES ('630105', '0', '100', '630100', '城北区');
INSERT INTO `sys_address_area` VALUES ('630121', '0', '100', '630100', '大通回族土族自治县');
INSERT INTO `sys_address_area` VALUES ('630122', '0', '100', '630100', '湟中县');
INSERT INTO `sys_address_area` VALUES ('630123', '0', '100', '630100', '湟源县');
INSERT INTO `sys_address_area` VALUES ('632121', '0', '100', '632100', '平安县');
INSERT INTO `sys_address_area` VALUES ('632122', '0', '100', '632100', '民和回族土族自治县');
INSERT INTO `sys_address_area` VALUES ('632123', '0', '100', '632100', '乐都县');
INSERT INTO `sys_address_area` VALUES ('632126', '0', '100', '632100', '互助土族自治县');
INSERT INTO `sys_address_area` VALUES ('632127', '0', '100', '632100', '化隆回族自治县');
INSERT INTO `sys_address_area` VALUES ('632128', '0', '100', '632100', '循化撒拉族自治县');
INSERT INTO `sys_address_area` VALUES ('632221', '0', '100', '632200', '门源回族自治县');
INSERT INTO `sys_address_area` VALUES ('632222', '0', '100', '632200', '祁连县');
INSERT INTO `sys_address_area` VALUES ('632223', '0', '100', '632200', '海晏县');
INSERT INTO `sys_address_area` VALUES ('632224', '0', '100', '632200', '刚察县');
INSERT INTO `sys_address_area` VALUES ('632321', '0', '100', '632300', '同仁县');
INSERT INTO `sys_address_area` VALUES ('632322', '0', '100', '632300', '尖扎县');
INSERT INTO `sys_address_area` VALUES ('632323', '0', '100', '632300', '泽库县');
INSERT INTO `sys_address_area` VALUES ('632324', '0', '100', '632300', '河南蒙古族自治县');
INSERT INTO `sys_address_area` VALUES ('632521', '0', '100', '632500', '共和县');
INSERT INTO `sys_address_area` VALUES ('632522', '0', '100', '632500', '同德县');
INSERT INTO `sys_address_area` VALUES ('632523', '0', '100', '632500', '贵德县');
INSERT INTO `sys_address_area` VALUES ('632524', '0', '100', '632500', '兴海县');
INSERT INTO `sys_address_area` VALUES ('632525', '0', '100', '632500', '贵南县');
INSERT INTO `sys_address_area` VALUES ('632621', '0', '100', '632600', '玛沁县');
INSERT INTO `sys_address_area` VALUES ('632622', '0', '100', '632600', '班玛县');
INSERT INTO `sys_address_area` VALUES ('632623', '0', '100', '632600', '甘德县');
INSERT INTO `sys_address_area` VALUES ('632624', '0', '100', '632600', '达日县');
INSERT INTO `sys_address_area` VALUES ('632625', '0', '100', '632600', '久治县');
INSERT INTO `sys_address_area` VALUES ('632626', '0', '100', '632600', '玛多县');
INSERT INTO `sys_address_area` VALUES ('632721', '0', '100', '632700', '玉树县');
INSERT INTO `sys_address_area` VALUES ('632722', '0', '100', '632700', '杂多县');
INSERT INTO `sys_address_area` VALUES ('632723', '0', '100', '632700', '称多县');
INSERT INTO `sys_address_area` VALUES ('632724', '0', '100', '632700', '治多县');
INSERT INTO `sys_address_area` VALUES ('632725', '0', '100', '632700', '囊谦县');
INSERT INTO `sys_address_area` VALUES ('632726', '0', '100', '632700', '曲麻莱县');
INSERT INTO `sys_address_area` VALUES ('632801', '0', '100', '632800', '格尔木市');
INSERT INTO `sys_address_area` VALUES ('632802', '0', '100', '632800', '德令哈市');
INSERT INTO `sys_address_area` VALUES ('632821', '0', '100', '632800', '乌兰县');
INSERT INTO `sys_address_area` VALUES ('632822', '0', '100', '632800', '都兰县');
INSERT INTO `sys_address_area` VALUES ('632823', '0', '100', '632800', '天峻县');
INSERT INTO `sys_address_area` VALUES ('640101', '0', '100', '640100', '市辖区');
INSERT INTO `sys_address_area` VALUES ('640104', '0', '100', '640100', '兴庆区');
INSERT INTO `sys_address_area` VALUES ('640105', '0', '100', '640100', '西夏区');
INSERT INTO `sys_address_area` VALUES ('640106', '0', '100', '640100', '金凤区');
INSERT INTO `sys_address_area` VALUES ('640121', '0', '100', '640100', '永宁县');
INSERT INTO `sys_address_area` VALUES ('640122', '0', '100', '640100', '贺兰县');
INSERT INTO `sys_address_area` VALUES ('640181', '0', '100', '640100', '灵武市');
INSERT INTO `sys_address_area` VALUES ('640201', '0', '100', '640200', '市辖区');
INSERT INTO `sys_address_area` VALUES ('640202', '0', '100', '640200', '大武口区');
INSERT INTO `sys_address_area` VALUES ('640205', '0', '100', '640200', '惠农区');
INSERT INTO `sys_address_area` VALUES ('640221', '0', '100', '640200', '平罗县');
INSERT INTO `sys_address_area` VALUES ('640301', '0', '100', '640300', '市辖区');
INSERT INTO `sys_address_area` VALUES ('640302', '0', '100', '640300', '利通区');
INSERT INTO `sys_address_area` VALUES ('640323', '0', '100', '640300', '盐池县');
INSERT INTO `sys_address_area` VALUES ('640324', '0', '100', '640300', '同心县');
INSERT INTO `sys_address_area` VALUES ('640381', '0', '100', '640300', '青铜峡市');
INSERT INTO `sys_address_area` VALUES ('640401', '0', '100', '640400', '市辖区');
INSERT INTO `sys_address_area` VALUES ('640402', '0', '100', '640400', '原州区');
INSERT INTO `sys_address_area` VALUES ('640422', '0', '100', '640400', '西吉县');
INSERT INTO `sys_address_area` VALUES ('640423', '0', '100', '640400', '隆德县');
INSERT INTO `sys_address_area` VALUES ('640424', '0', '100', '640400', '泾源县');
INSERT INTO `sys_address_area` VALUES ('640425', '0', '100', '640400', '彭阳县');
INSERT INTO `sys_address_area` VALUES ('640501', '0', '100', '640500', '市辖区');
INSERT INTO `sys_address_area` VALUES ('640502', '0', '100', '640500', '沙坡头区');
INSERT INTO `sys_address_area` VALUES ('640521', '0', '100', '640500', '中宁县');
INSERT INTO `sys_address_area` VALUES ('640522', '0', '100', '640400', '海原县');
INSERT INTO `sys_address_area` VALUES ('650101', '0', '100', '650100', '市辖区');
INSERT INTO `sys_address_area` VALUES ('650102', '0', '100', '650100', '天山区');
INSERT INTO `sys_address_area` VALUES ('650103', '0', '100', '650100', '沙依巴克区');
INSERT INTO `sys_address_area` VALUES ('650104', '0', '100', '650100', '新市区');
INSERT INTO `sys_address_area` VALUES ('650105', '0', '100', '650100', '水磨沟区');
INSERT INTO `sys_address_area` VALUES ('650106', '0', '100', '650100', '头屯河区');
INSERT INTO `sys_address_area` VALUES ('650107', '0', '100', '650100', '达坂城区');
INSERT INTO `sys_address_area` VALUES ('650108', '0', '100', '650100', '东山区');
INSERT INTO `sys_address_area` VALUES ('650121', '0', '100', '650100', '乌鲁木齐县');
INSERT INTO `sys_address_area` VALUES ('650201', '0', '100', '650200', '市辖区');
INSERT INTO `sys_address_area` VALUES ('650202', '0', '100', '650200', '独山子区');
INSERT INTO `sys_address_area` VALUES ('650203', '0', '100', '650200', '克拉玛依区');
INSERT INTO `sys_address_area` VALUES ('650204', '0', '100', '650200', '白碱滩区');
INSERT INTO `sys_address_area` VALUES ('650205', '0', '100', '650200', '乌尔禾区');
INSERT INTO `sys_address_area` VALUES ('652101', '0', '100', '652100', '吐鲁番市');
INSERT INTO `sys_address_area` VALUES ('652122', '0', '100', '652100', '鄯善县');
INSERT INTO `sys_address_area` VALUES ('652123', '0', '100', '652100', '托克逊县');
INSERT INTO `sys_address_area` VALUES ('652201', '0', '100', '652200', '哈密市');
INSERT INTO `sys_address_area` VALUES ('652222', '0', '100', '652200', '巴里坤哈萨克自治县');
INSERT INTO `sys_address_area` VALUES ('652223', '0', '100', '652200', '伊吾县');
INSERT INTO `sys_address_area` VALUES ('652301', '0', '100', '652300', '昌吉市');
INSERT INTO `sys_address_area` VALUES ('652302', '0', '100', '652300', '阜康市');
INSERT INTO `sys_address_area` VALUES ('652303', '0', '100', '652300', '米泉市');
INSERT INTO `sys_address_area` VALUES ('652323', '0', '100', '652300', '呼图壁县');
INSERT INTO `sys_address_area` VALUES ('652324', '0', '100', '652300', '玛纳斯县');
INSERT INTO `sys_address_area` VALUES ('652325', '0', '100', '652300', '奇台县');
INSERT INTO `sys_address_area` VALUES ('652327', '0', '100', '652300', '吉木萨尔县');
INSERT INTO `sys_address_area` VALUES ('652328', '0', '100', '652300', '木垒哈萨克自治县');
INSERT INTO `sys_address_area` VALUES ('652701', '0', '100', '652700', '博乐市');
INSERT INTO `sys_address_area` VALUES ('652722', '0', '100', '652700', '精河县');
INSERT INTO `sys_address_area` VALUES ('652723', '0', '100', '652700', '温泉县');
INSERT INTO `sys_address_area` VALUES ('652801', '0', '100', '652800', '库尔勒市');
INSERT INTO `sys_address_area` VALUES ('652822', '0', '100', '652800', '轮台县');
INSERT INTO `sys_address_area` VALUES ('652823', '0', '100', '652800', '尉犁县');
INSERT INTO `sys_address_area` VALUES ('652824', '0', '100', '652800', '若羌县');
INSERT INTO `sys_address_area` VALUES ('652825', '0', '100', '652800', '且末县');
INSERT INTO `sys_address_area` VALUES ('652826', '0', '100', '652800', '焉耆回族自治县');
INSERT INTO `sys_address_area` VALUES ('652827', '0', '100', '652800', '和静县');
INSERT INTO `sys_address_area` VALUES ('652828', '0', '100', '652800', '和硕县');
INSERT INTO `sys_address_area` VALUES ('652829', '0', '100', '652800', '博湖县');
INSERT INTO `sys_address_area` VALUES ('652901', '0', '100', '652900', '阿克苏市');
INSERT INTO `sys_address_area` VALUES ('652922', '0', '100', '652900', '温宿县');
INSERT INTO `sys_address_area` VALUES ('652923', '0', '100', '652900', '库车县');
INSERT INTO `sys_address_area` VALUES ('652924', '0', '100', '652900', '沙雅县');
INSERT INTO `sys_address_area` VALUES ('652925', '0', '100', '652900', '新和县');
INSERT INTO `sys_address_area` VALUES ('652926', '0', '100', '652900', '拜城县');
INSERT INTO `sys_address_area` VALUES ('652927', '0', '100', '652900', '乌什县');
INSERT INTO `sys_address_area` VALUES ('652928', '0', '100', '652900', '阿瓦提县');
INSERT INTO `sys_address_area` VALUES ('652929', '0', '100', '652900', '柯坪县');
INSERT INTO `sys_address_area` VALUES ('653001', '0', '100', '653000', '阿图什市');
INSERT INTO `sys_address_area` VALUES ('653022', '0', '100', '653000', '阿克陶县');
INSERT INTO `sys_address_area` VALUES ('653023', '0', '100', '653000', '阿合奇县');
INSERT INTO `sys_address_area` VALUES ('653024', '0', '100', '653000', '乌恰县');
INSERT INTO `sys_address_area` VALUES ('653101', '0', '100', '653100', '喀什市');
INSERT INTO `sys_address_area` VALUES ('653121', '0', '100', '653100', '疏附县');
INSERT INTO `sys_address_area` VALUES ('653122', '0', '100', '653100', '疏勒县');
INSERT INTO `sys_address_area` VALUES ('653123', '0', '100', '653100', '英吉沙县');
INSERT INTO `sys_address_area` VALUES ('653124', '0', '100', '653100', '泽普县');
INSERT INTO `sys_address_area` VALUES ('653125', '0', '100', '653100', '莎车县');
INSERT INTO `sys_address_area` VALUES ('653126', '0', '100', '653100', '叶城县');
INSERT INTO `sys_address_area` VALUES ('653127', '0', '100', '653100', '麦盖提县');
INSERT INTO `sys_address_area` VALUES ('653128', '0', '100', '653100', '岳普湖县');
INSERT INTO `sys_address_area` VALUES ('653129', '0', '100', '653100', '伽师县');
INSERT INTO `sys_address_area` VALUES ('653130', '0', '100', '653100', '巴楚县');
INSERT INTO `sys_address_area` VALUES ('653131', '0', '100', '653100', '塔什库尔干塔吉克自治县');
INSERT INTO `sys_address_area` VALUES ('653201', '0', '100', '653200', '和田市');
INSERT INTO `sys_address_area` VALUES ('653221', '0', '100', '653200', '和田县');
INSERT INTO `sys_address_area` VALUES ('653222', '0', '100', '653200', '墨玉县');
INSERT INTO `sys_address_area` VALUES ('653223', '0', '100', '653200', '皮山县');
INSERT INTO `sys_address_area` VALUES ('653224', '0', '100', '653200', '洛浦县');
INSERT INTO `sys_address_area` VALUES ('653225', '0', '100', '653200', '策勒县');
INSERT INTO `sys_address_area` VALUES ('653226', '0', '100', '653200', '于田县');
INSERT INTO `sys_address_area` VALUES ('653227', '0', '100', '653200', '民丰县');
INSERT INTO `sys_address_area` VALUES ('654002', '0', '100', '654000', '伊宁市');
INSERT INTO `sys_address_area` VALUES ('654003', '0', '100', '654000', '奎屯市');
INSERT INTO `sys_address_area` VALUES ('654021', '0', '100', '654000', '伊宁县');
INSERT INTO `sys_address_area` VALUES ('654022', '0', '100', '654000', '察布查尔锡伯自治县');
INSERT INTO `sys_address_area` VALUES ('654023', '0', '100', '654000', '霍城县');
INSERT INTO `sys_address_area` VALUES ('654024', '0', '100', '654000', '巩留县');
INSERT INTO `sys_address_area` VALUES ('654025', '0', '100', '654000', '新源县');
INSERT INTO `sys_address_area` VALUES ('654026', '0', '100', '654000', '昭苏县');
INSERT INTO `sys_address_area` VALUES ('654027', '0', '100', '654000', '特克斯县');
INSERT INTO `sys_address_area` VALUES ('654028', '0', '100', '654000', '尼勒克县');
INSERT INTO `sys_address_area` VALUES ('654201', '0', '100', '654200', '塔城市');
INSERT INTO `sys_address_area` VALUES ('654202', '0', '100', '654200', '乌苏市');
INSERT INTO `sys_address_area` VALUES ('654221', '0', '100', '654200', '额敏县');
INSERT INTO `sys_address_area` VALUES ('654223', '0', '100', '654200', '沙湾县');
INSERT INTO `sys_address_area` VALUES ('654224', '0', '100', '654200', '托里县');
INSERT INTO `sys_address_area` VALUES ('654225', '0', '100', '654200', '裕民县');
INSERT INTO `sys_address_area` VALUES ('654226', '0', '100', '654200', '和布克赛尔蒙古自治县');
INSERT INTO `sys_address_area` VALUES ('654301', '0', '100', '654300', '阿勒泰市');
INSERT INTO `sys_address_area` VALUES ('654321', '0', '100', '654300', '布尔津县');
INSERT INTO `sys_address_area` VALUES ('654322', '0', '100', '654300', '富蕴县');
INSERT INTO `sys_address_area` VALUES ('654323', '0', '100', '654300', '福海县');
INSERT INTO `sys_address_area` VALUES ('654324', '0', '100', '654300', '哈巴河县');
INSERT INTO `sys_address_area` VALUES ('654325', '0', '100', '654300', '青河县');
INSERT INTO `sys_address_area` VALUES ('654326', '0', '100', '654300', '吉木乃县');
INSERT INTO `sys_address_area` VALUES ('659001', '0', '100', '659000', '石河子市');
INSERT INTO `sys_address_area` VALUES ('659002', '0', '100', '659000', '阿拉尔市');
INSERT INTO `sys_address_area` VALUES ('659003', '0', '100', '659000', '图木舒克市');
INSERT INTO `sys_address_area` VALUES ('659004', '0', '100', '659000', '五家渠市');

-- ----------------------------
-- Table structure for `sys_address_city`
-- ----------------------------
DROP TABLE IF EXISTS `sys_address_city`;
CREATE TABLE `sys_address_city` (
  `city_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '城市ID：[1,8388607]',
  `show` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否可见：[0,2]0为仅表单可见，1为仅表单和搜索时可见 ，2为均可见',
  `display` smallint(4) unsigned NOT NULL DEFAULT '100' COMMENT '显示顺序：[0,1000]',
  `province_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '所属省份ID：[1,8388607]',
  `name` varchar(16) NOT NULL DEFAULT '' COMMENT '城市名称：[0,16]',
  PRIMARY KEY (`city_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='行政区域地州市信息表';

-- ----------------------------
-- Records of sys_address_city
-- ----------------------------
INSERT INTO `sys_address_city` VALUES ('110100', '0', '100', '110000', '市辖区');
INSERT INTO `sys_address_city` VALUES ('110200', '0', '100', '110000', '县');
INSERT INTO `sys_address_city` VALUES ('120100', '0', '100', '120000', '市辖区');
INSERT INTO `sys_address_city` VALUES ('120200', '0', '100', '120000', '县');
INSERT INTO `sys_address_city` VALUES ('130100', '0', '100', '130000', '石家庄市');
INSERT INTO `sys_address_city` VALUES ('130200', '0', '100', '130000', '唐山市');
INSERT INTO `sys_address_city` VALUES ('130300', '0', '100', '130000', '秦皇岛市');
INSERT INTO `sys_address_city` VALUES ('130400', '0', '100', '130000', '邯郸市');
INSERT INTO `sys_address_city` VALUES ('130500', '0', '100', '130000', '邢台市');
INSERT INTO `sys_address_city` VALUES ('130600', '0', '100', '130000', '保定市');
INSERT INTO `sys_address_city` VALUES ('130700', '0', '100', '130000', '张家口市');
INSERT INTO `sys_address_city` VALUES ('130800', '0', '100', '130000', '承德市');
INSERT INTO `sys_address_city` VALUES ('130900', '0', '100', '130000', '沧州市');
INSERT INTO `sys_address_city` VALUES ('131000', '0', '100', '130000', '廊坊市');
INSERT INTO `sys_address_city` VALUES ('131100', '0', '100', '130000', '衡水市');
INSERT INTO `sys_address_city` VALUES ('140100', '0', '100', '140000', '太原市');
INSERT INTO `sys_address_city` VALUES ('140200', '0', '100', '140000', '大同市');
INSERT INTO `sys_address_city` VALUES ('140300', '0', '100', '140000', '阳泉市');
INSERT INTO `sys_address_city` VALUES ('140400', '0', '100', '140000', '长治市');
INSERT INTO `sys_address_city` VALUES ('140500', '0', '100', '140000', '晋城市');
INSERT INTO `sys_address_city` VALUES ('140600', '0', '100', '140000', '朔州市');
INSERT INTO `sys_address_city` VALUES ('140700', '0', '100', '140000', '晋中市');
INSERT INTO `sys_address_city` VALUES ('140800', '0', '100', '140000', '运城市');
INSERT INTO `sys_address_city` VALUES ('140900', '0', '100', '140000', '忻州市');
INSERT INTO `sys_address_city` VALUES ('141000', '0', '100', '140000', '临汾市');
INSERT INTO `sys_address_city` VALUES ('141100', '0', '100', '140000', '吕梁市');
INSERT INTO `sys_address_city` VALUES ('150100', '0', '100', '150000', '呼和浩特市');
INSERT INTO `sys_address_city` VALUES ('150200', '0', '100', '150000', '包头市');
INSERT INTO `sys_address_city` VALUES ('150300', '0', '100', '150000', '乌海市');
INSERT INTO `sys_address_city` VALUES ('150400', '0', '100', '150000', '赤峰市');
INSERT INTO `sys_address_city` VALUES ('150500', '0', '100', '150000', '通辽市');
INSERT INTO `sys_address_city` VALUES ('150600', '0', '100', '150000', '鄂尔多斯市');
INSERT INTO `sys_address_city` VALUES ('150700', '0', '100', '150000', '呼伦贝尔市');
INSERT INTO `sys_address_city` VALUES ('150800', '0', '100', '150000', '巴彦淖尔市');
INSERT INTO `sys_address_city` VALUES ('150900', '0', '100', '150000', '乌兰察布市');
INSERT INTO `sys_address_city` VALUES ('152200', '0', '100', '150000', '兴安盟');
INSERT INTO `sys_address_city` VALUES ('152500', '0', '100', '150000', '锡林郭勒盟');
INSERT INTO `sys_address_city` VALUES ('152900', '0', '100', '150000', '阿拉善盟');
INSERT INTO `sys_address_city` VALUES ('210100', '0', '100', '210000', '沈阳市');
INSERT INTO `sys_address_city` VALUES ('210200', '0', '100', '210000', '大连市');
INSERT INTO `sys_address_city` VALUES ('210300', '0', '100', '210000', '鞍山市');
INSERT INTO `sys_address_city` VALUES ('210400', '0', '100', '210000', '抚顺市');
INSERT INTO `sys_address_city` VALUES ('210500', '0', '100', '210000', '本溪市');
INSERT INTO `sys_address_city` VALUES ('210600', '0', '100', '210000', '丹东市');
INSERT INTO `sys_address_city` VALUES ('210700', '0', '100', '210000', '锦州市');
INSERT INTO `sys_address_city` VALUES ('210800', '0', '100', '210000', '营口市');
INSERT INTO `sys_address_city` VALUES ('210900', '0', '100', '210000', '阜新市');
INSERT INTO `sys_address_city` VALUES ('211000', '0', '100', '210000', '辽阳市');
INSERT INTO `sys_address_city` VALUES ('211100', '0', '100', '210000', '盘锦市');
INSERT INTO `sys_address_city` VALUES ('211200', '0', '100', '210000', '铁岭市');
INSERT INTO `sys_address_city` VALUES ('211300', '0', '100', '210000', '朝阳市');
INSERT INTO `sys_address_city` VALUES ('211400', '0', '100', '210000', '葫芦岛市');
INSERT INTO `sys_address_city` VALUES ('220100', '0', '100', '220000', '长春市');
INSERT INTO `sys_address_city` VALUES ('220200', '0', '100', '220000', '吉林市');
INSERT INTO `sys_address_city` VALUES ('220300', '0', '100', '220000', '四平市');
INSERT INTO `sys_address_city` VALUES ('220400', '0', '100', '220000', '辽源市');
INSERT INTO `sys_address_city` VALUES ('220500', '0', '100', '220000', '通化市');
INSERT INTO `sys_address_city` VALUES ('220600', '0', '100', '220000', '白山市');
INSERT INTO `sys_address_city` VALUES ('220700', '0', '100', '220000', '松原市');
INSERT INTO `sys_address_city` VALUES ('220800', '0', '100', '220000', '白城市');
INSERT INTO `sys_address_city` VALUES ('222400', '0', '100', '220000', '延边朝鲜族自治州');
INSERT INTO `sys_address_city` VALUES ('230100', '0', '100', '230000', '哈尔滨市');
INSERT INTO `sys_address_city` VALUES ('230200', '0', '100', '230000', '齐齐哈尔市');
INSERT INTO `sys_address_city` VALUES ('230300', '0', '100', '230000', '鸡西市');
INSERT INTO `sys_address_city` VALUES ('230400', '0', '100', '230000', '鹤岗市');
INSERT INTO `sys_address_city` VALUES ('230500', '0', '100', '230000', '双鸭山市');
INSERT INTO `sys_address_city` VALUES ('230600', '0', '100', '230000', '大庆市');
INSERT INTO `sys_address_city` VALUES ('230700', '0', '100', '230000', '伊春市');
INSERT INTO `sys_address_city` VALUES ('230800', '0', '100', '230000', '佳木斯市');
INSERT INTO `sys_address_city` VALUES ('230900', '0', '100', '230000', '七台河市');
INSERT INTO `sys_address_city` VALUES ('231000', '0', '100', '230000', '牡丹江市');
INSERT INTO `sys_address_city` VALUES ('231100', '0', '100', '230000', '黑河市');
INSERT INTO `sys_address_city` VALUES ('231200', '0', '100', '230000', '绥化市');
INSERT INTO `sys_address_city` VALUES ('232700', '0', '100', '230000', '大兴安岭地区');
INSERT INTO `sys_address_city` VALUES ('310100', '0', '100', '310000', '市辖区');
INSERT INTO `sys_address_city` VALUES ('310200', '0', '100', '310000', '县');
INSERT INTO `sys_address_city` VALUES ('320100', '0', '100', '320000', '南京市');
INSERT INTO `sys_address_city` VALUES ('320200', '0', '100', '320000', '无锡市');
INSERT INTO `sys_address_city` VALUES ('320300', '0', '100', '320000', '徐州市');
INSERT INTO `sys_address_city` VALUES ('320400', '0', '100', '320000', '常州市');
INSERT INTO `sys_address_city` VALUES ('320500', '0', '100', '320000', '苏州市');
INSERT INTO `sys_address_city` VALUES ('320600', '0', '100', '320000', '南通市');
INSERT INTO `sys_address_city` VALUES ('320700', '0', '100', '320000', '连云港市');
INSERT INTO `sys_address_city` VALUES ('320800', '0', '100', '320000', '淮安市');
INSERT INTO `sys_address_city` VALUES ('320900', '0', '100', '320000', '盐城市');
INSERT INTO `sys_address_city` VALUES ('321000', '0', '100', '320000', '扬州市');
INSERT INTO `sys_address_city` VALUES ('321100', '0', '100', '320000', '镇江市');
INSERT INTO `sys_address_city` VALUES ('321200', '0', '100', '320000', '泰州市');
INSERT INTO `sys_address_city` VALUES ('321300', '0', '100', '320000', '宿迁市');
INSERT INTO `sys_address_city` VALUES ('330100', '0', '100', '330000', '杭州市');
INSERT INTO `sys_address_city` VALUES ('330200', '0', '100', '330000', '宁波市');
INSERT INTO `sys_address_city` VALUES ('330300', '0', '100', '330000', '温州市');
INSERT INTO `sys_address_city` VALUES ('330400', '0', '100', '330000', '嘉兴市');
INSERT INTO `sys_address_city` VALUES ('330500', '0', '100', '330000', '湖州市');
INSERT INTO `sys_address_city` VALUES ('330600', '0', '100', '330000', '绍兴市');
INSERT INTO `sys_address_city` VALUES ('330700', '0', '100', '330000', '金华市');
INSERT INTO `sys_address_city` VALUES ('330800', '0', '100', '330000', '衢州市');
INSERT INTO `sys_address_city` VALUES ('330900', '0', '100', '330000', '舟山市');
INSERT INTO `sys_address_city` VALUES ('331000', '0', '100', '330000', '台州市');
INSERT INTO `sys_address_city` VALUES ('331100', '0', '100', '330000', '丽水市');
INSERT INTO `sys_address_city` VALUES ('340100', '0', '100', '340000', '合肥市');
INSERT INTO `sys_address_city` VALUES ('340200', '0', '100', '340000', '芜湖市');
INSERT INTO `sys_address_city` VALUES ('340300', '0', '100', '340000', '蚌埠市');
INSERT INTO `sys_address_city` VALUES ('340400', '0', '100', '340000', '淮南市');
INSERT INTO `sys_address_city` VALUES ('340500', '0', '100', '340000', '马鞍山市');
INSERT INTO `sys_address_city` VALUES ('340600', '0', '100', '340000', '淮北市');
INSERT INTO `sys_address_city` VALUES ('340700', '0', '100', '340000', '铜陵市');
INSERT INTO `sys_address_city` VALUES ('340800', '0', '100', '340000', '安庆市');
INSERT INTO `sys_address_city` VALUES ('341000', '0', '100', '340000', '黄山市');
INSERT INTO `sys_address_city` VALUES ('341100', '0', '100', '340000', '滁州市');
INSERT INTO `sys_address_city` VALUES ('341200', '0', '100', '340000', '阜阳市');
INSERT INTO `sys_address_city` VALUES ('341300', '0', '100', '340000', '宿州市');
INSERT INTO `sys_address_city` VALUES ('341400', '0', '100', '340000', '巢湖市');
INSERT INTO `sys_address_city` VALUES ('341500', '0', '100', '340000', '六安市');
INSERT INTO `sys_address_city` VALUES ('341600', '0', '100', '340000', '亳州市');
INSERT INTO `sys_address_city` VALUES ('341700', '0', '100', '340000', '池州市');
INSERT INTO `sys_address_city` VALUES ('341800', '0', '100', '340000', '宣城市');
INSERT INTO `sys_address_city` VALUES ('350100', '0', '100', '350000', '福州市');
INSERT INTO `sys_address_city` VALUES ('350200', '0', '100', '350000', '厦门市');
INSERT INTO `sys_address_city` VALUES ('350300', '0', '100', '350000', '莆田市');
INSERT INTO `sys_address_city` VALUES ('350400', '0', '100', '350000', '三明市');
INSERT INTO `sys_address_city` VALUES ('350500', '0', '100', '350000', '泉州市');
INSERT INTO `sys_address_city` VALUES ('350600', '0', '100', '350000', '漳州市');
INSERT INTO `sys_address_city` VALUES ('350700', '0', '100', '350000', '南平市');
INSERT INTO `sys_address_city` VALUES ('350800', '0', '100', '350000', '龙岩市');
INSERT INTO `sys_address_city` VALUES ('350900', '0', '100', '350000', '宁德市');
INSERT INTO `sys_address_city` VALUES ('360100', '0', '100', '360000', '南昌市');
INSERT INTO `sys_address_city` VALUES ('360200', '0', '100', '360000', '景德镇市');
INSERT INTO `sys_address_city` VALUES ('360300', '0', '100', '360000', '萍乡市');
INSERT INTO `sys_address_city` VALUES ('360400', '0', '100', '360000', '九江市');
INSERT INTO `sys_address_city` VALUES ('360500', '0', '100', '360000', '新余市');
INSERT INTO `sys_address_city` VALUES ('360600', '0', '100', '360000', '鹰潭市');
INSERT INTO `sys_address_city` VALUES ('360700', '0', '100', '360000', '赣州市');
INSERT INTO `sys_address_city` VALUES ('360800', '0', '100', '360000', '吉安市');
INSERT INTO `sys_address_city` VALUES ('360900', '0', '100', '360000', '宜春市');
INSERT INTO `sys_address_city` VALUES ('361000', '0', '100', '360000', '抚州市');
INSERT INTO `sys_address_city` VALUES ('361100', '0', '100', '360000', '上饶市');
INSERT INTO `sys_address_city` VALUES ('370100', '0', '100', '370000', '济南市');
INSERT INTO `sys_address_city` VALUES ('370200', '0', '100', '370000', '青岛市');
INSERT INTO `sys_address_city` VALUES ('370300', '0', '100', '370000', '淄博市');
INSERT INTO `sys_address_city` VALUES ('370400', '0', '100', '370000', '枣庄市');
INSERT INTO `sys_address_city` VALUES ('370500', '0', '100', '370000', '东营市');
INSERT INTO `sys_address_city` VALUES ('370600', '0', '100', '370000', '烟台市');
INSERT INTO `sys_address_city` VALUES ('370700', '0', '100', '370000', '潍坊市');
INSERT INTO `sys_address_city` VALUES ('370800', '0', '100', '370000', '济宁市');
INSERT INTO `sys_address_city` VALUES ('370900', '0', '100', '370000', '泰安市');
INSERT INTO `sys_address_city` VALUES ('371000', '0', '100', '370000', '威海市');
INSERT INTO `sys_address_city` VALUES ('371100', '0', '100', '370000', '日照市');
INSERT INTO `sys_address_city` VALUES ('371200', '0', '100', '370000', '莱芜市');
INSERT INTO `sys_address_city` VALUES ('371300', '0', '100', '370000', '临沂市');
INSERT INTO `sys_address_city` VALUES ('371400', '0', '100', '370000', '德州市');
INSERT INTO `sys_address_city` VALUES ('371500', '0', '100', '370000', '聊城市');
INSERT INTO `sys_address_city` VALUES ('371600', '0', '100', '370000', '滨州市');
INSERT INTO `sys_address_city` VALUES ('371700', '0', '100', '370000', '荷泽市');
INSERT INTO `sys_address_city` VALUES ('410100', '0', '100', '410000', '郑州市');
INSERT INTO `sys_address_city` VALUES ('410200', '0', '100', '410000', '开封市');
INSERT INTO `sys_address_city` VALUES ('410300', '0', '100', '410000', '洛阳市');
INSERT INTO `sys_address_city` VALUES ('410400', '0', '100', '410000', '平顶山市');
INSERT INTO `sys_address_city` VALUES ('410500', '0', '100', '410000', '安阳市');
INSERT INTO `sys_address_city` VALUES ('410600', '0', '100', '410000', '鹤壁市');
INSERT INTO `sys_address_city` VALUES ('410700', '0', '100', '410000', '新乡市');
INSERT INTO `sys_address_city` VALUES ('410800', '0', '100', '410000', '焦作市');
INSERT INTO `sys_address_city` VALUES ('410900', '0', '100', '410000', '濮阳市');
INSERT INTO `sys_address_city` VALUES ('411000', '0', '100', '410000', '许昌市');
INSERT INTO `sys_address_city` VALUES ('411100', '0', '100', '410000', '漯河市');
INSERT INTO `sys_address_city` VALUES ('411200', '0', '100', '410000', '三门峡市');
INSERT INTO `sys_address_city` VALUES ('411300', '0', '100', '410000', '南阳市');
INSERT INTO `sys_address_city` VALUES ('411400', '0', '100', '410000', '商丘市');
INSERT INTO `sys_address_city` VALUES ('411500', '0', '100', '410000', '信阳市');
INSERT INTO `sys_address_city` VALUES ('411600', '0', '100', '410000', '周口市');
INSERT INTO `sys_address_city` VALUES ('411700', '0', '100', '410000', '驻马店市');
INSERT INTO `sys_address_city` VALUES ('420100', '0', '100', '420000', '武汉市');
INSERT INTO `sys_address_city` VALUES ('420200', '0', '100', '420000', '黄石市');
INSERT INTO `sys_address_city` VALUES ('420300', '0', '100', '420000', '十堰市');
INSERT INTO `sys_address_city` VALUES ('420500', '0', '100', '420000', '宜昌市');
INSERT INTO `sys_address_city` VALUES ('420600', '0', '100', '420000', '襄樊市');
INSERT INTO `sys_address_city` VALUES ('420700', '0', '100', '420000', '鄂州市');
INSERT INTO `sys_address_city` VALUES ('420800', '0', '100', '420000', '荆门市');
INSERT INTO `sys_address_city` VALUES ('420900', '0', '100', '420000', '孝感市');
INSERT INTO `sys_address_city` VALUES ('421000', '0', '100', '420000', '荆州市');
INSERT INTO `sys_address_city` VALUES ('421100', '0', '100', '420000', '黄冈市');
INSERT INTO `sys_address_city` VALUES ('421200', '0', '100', '420000', '咸宁市');
INSERT INTO `sys_address_city` VALUES ('421300', '0', '100', '420000', '随州市');
INSERT INTO `sys_address_city` VALUES ('422800', '0', '100', '420000', '恩施土家族苗族自治州');
INSERT INTO `sys_address_city` VALUES ('429000', '0', '100', '420000', '省直辖行政单位');
INSERT INTO `sys_address_city` VALUES ('430100', '0', '100', '430000', '长沙市');
INSERT INTO `sys_address_city` VALUES ('430200', '0', '100', '430000', '株洲市');
INSERT INTO `sys_address_city` VALUES ('430300', '0', '100', '430000', '湘潭市');
INSERT INTO `sys_address_city` VALUES ('430400', '0', '100', '430000', '衡阳市');
INSERT INTO `sys_address_city` VALUES ('430500', '0', '100', '430000', '邵阳市');
INSERT INTO `sys_address_city` VALUES ('430600', '0', '100', '430000', '岳阳市');
INSERT INTO `sys_address_city` VALUES ('430700', '0', '100', '430000', '常德市');
INSERT INTO `sys_address_city` VALUES ('430800', '0', '100', '430000', '张家界市');
INSERT INTO `sys_address_city` VALUES ('430900', '0', '100', '430000', '益阳市');
INSERT INTO `sys_address_city` VALUES ('431000', '0', '100', '430000', '郴州市');
INSERT INTO `sys_address_city` VALUES ('431100', '0', '100', '430000', '永州市');
INSERT INTO `sys_address_city` VALUES ('431200', '0', '100', '430000', '怀化市');
INSERT INTO `sys_address_city` VALUES ('431300', '0', '100', '430000', '娄底市');
INSERT INTO `sys_address_city` VALUES ('433100', '0', '100', '430000', '湘西土家族苗族自治州');
INSERT INTO `sys_address_city` VALUES ('440100', '0', '100', '440000', '广州市');
INSERT INTO `sys_address_city` VALUES ('440200', '0', '100', '440000', '韶关市');
INSERT INTO `sys_address_city` VALUES ('440300', '0', '100', '440000', '深圳市');
INSERT INTO `sys_address_city` VALUES ('440400', '0', '100', '440000', '珠海市');
INSERT INTO `sys_address_city` VALUES ('440500', '0', '100', '440000', '汕头市');
INSERT INTO `sys_address_city` VALUES ('440600', '0', '100', '440000', '佛山市');
INSERT INTO `sys_address_city` VALUES ('440700', '0', '100', '440000', '江门市');
INSERT INTO `sys_address_city` VALUES ('440800', '0', '100', '440000', '湛江市');
INSERT INTO `sys_address_city` VALUES ('440900', '0', '100', '440000', '茂名市');
INSERT INTO `sys_address_city` VALUES ('441200', '0', '100', '440000', '肇庆市');
INSERT INTO `sys_address_city` VALUES ('441300', '0', '100', '440000', '惠州市');
INSERT INTO `sys_address_city` VALUES ('441400', '0', '100', '440000', '梅州市');
INSERT INTO `sys_address_city` VALUES ('441500', '0', '100', '440000', '汕尾市');
INSERT INTO `sys_address_city` VALUES ('441600', '0', '100', '440000', '河源市');
INSERT INTO `sys_address_city` VALUES ('441700', '0', '100', '440000', '阳江市');
INSERT INTO `sys_address_city` VALUES ('441800', '0', '100', '440000', '清远市');
INSERT INTO `sys_address_city` VALUES ('441900', '0', '100', '440000', '东莞市');
INSERT INTO `sys_address_city` VALUES ('442000', '0', '100', '440000', '中山市');
INSERT INTO `sys_address_city` VALUES ('445100', '0', '100', '440000', '潮州市');
INSERT INTO `sys_address_city` VALUES ('445200', '0', '100', '440000', '揭阳市');
INSERT INTO `sys_address_city` VALUES ('445300', '0', '100', '440000', '云浮市');
INSERT INTO `sys_address_city` VALUES ('450100', '0', '100', '450000', '南宁市');
INSERT INTO `sys_address_city` VALUES ('450200', '0', '100', '450000', '柳州市');
INSERT INTO `sys_address_city` VALUES ('450300', '0', '100', '450000', '桂林市');
INSERT INTO `sys_address_city` VALUES ('450400', '0', '100', '450000', '梧州市');
INSERT INTO `sys_address_city` VALUES ('450500', '0', '100', '450000', '北海市');
INSERT INTO `sys_address_city` VALUES ('450600', '0', '100', '450000', '防城港市');
INSERT INTO `sys_address_city` VALUES ('450700', '0', '100', '450000', '钦州市');
INSERT INTO `sys_address_city` VALUES ('450800', '0', '100', '450000', '贵港市');
INSERT INTO `sys_address_city` VALUES ('450900', '0', '100', '450000', '玉林市');
INSERT INTO `sys_address_city` VALUES ('451000', '0', '100', '450000', '百色市');
INSERT INTO `sys_address_city` VALUES ('451100', '0', '100', '450000', '贺州市');
INSERT INTO `sys_address_city` VALUES ('451200', '0', '100', '450000', '河池市');
INSERT INTO `sys_address_city` VALUES ('451300', '0', '100', '450000', '来宾市');
INSERT INTO `sys_address_city` VALUES ('451400', '0', '100', '450000', '崇左市');
INSERT INTO `sys_address_city` VALUES ('460100', '0', '100', '460000', '海口市');
INSERT INTO `sys_address_city` VALUES ('460200', '0', '100', '460000', '三亚市');
INSERT INTO `sys_address_city` VALUES ('469000', '0', '100', '460000', '省直辖县级行政单位');
INSERT INTO `sys_address_city` VALUES ('500100', '0', '100', '500000', '市辖区');
INSERT INTO `sys_address_city` VALUES ('500200', '0', '100', '500000', '县');
INSERT INTO `sys_address_city` VALUES ('500300', '0', '100', '500000', '市');
INSERT INTO `sys_address_city` VALUES ('510100', '0', '100', '510000', '成都市');
INSERT INTO `sys_address_city` VALUES ('510300', '0', '100', '510000', '自贡市');
INSERT INTO `sys_address_city` VALUES ('510400', '0', '100', '510000', '攀枝花市');
INSERT INTO `sys_address_city` VALUES ('510500', '0', '100', '510000', '泸州市');
INSERT INTO `sys_address_city` VALUES ('510600', '0', '100', '510000', '德阳市');
INSERT INTO `sys_address_city` VALUES ('510700', '0', '100', '510000', '绵阳市');
INSERT INTO `sys_address_city` VALUES ('510800', '0', '100', '510000', '广元市');
INSERT INTO `sys_address_city` VALUES ('510900', '0', '100', '510000', '遂宁市');
INSERT INTO `sys_address_city` VALUES ('511000', '0', '100', '510000', '内江市');
INSERT INTO `sys_address_city` VALUES ('511100', '0', '100', '510000', '乐山市');
INSERT INTO `sys_address_city` VALUES ('511300', '0', '100', '510000', '南充市');
INSERT INTO `sys_address_city` VALUES ('511400', '0', '100', '510000', '眉山市');
INSERT INTO `sys_address_city` VALUES ('511500', '0', '100', '510000', '宜宾市');
INSERT INTO `sys_address_city` VALUES ('511600', '0', '100', '510000', '广安市');
INSERT INTO `sys_address_city` VALUES ('511700', '0', '100', '510000', '达州市');
INSERT INTO `sys_address_city` VALUES ('511800', '0', '100', '510000', '雅安市');
INSERT INTO `sys_address_city` VALUES ('511900', '0', '100', '510000', '巴中市');
INSERT INTO `sys_address_city` VALUES ('512000', '0', '100', '510000', '资阳市');
INSERT INTO `sys_address_city` VALUES ('513200', '0', '100', '510000', '阿坝藏族羌族自治州');
INSERT INTO `sys_address_city` VALUES ('513300', '0', '100', '510000', '甘孜藏族自治州');
INSERT INTO `sys_address_city` VALUES ('513400', '0', '100', '510000', '凉山彝族自治州');
INSERT INTO `sys_address_city` VALUES ('520100', '0', '100', '520000', '贵阳市');
INSERT INTO `sys_address_city` VALUES ('520200', '0', '100', '520000', '六盘水市');
INSERT INTO `sys_address_city` VALUES ('520300', '0', '100', '520000', '遵义市');
INSERT INTO `sys_address_city` VALUES ('520400', '0', '100', '520000', '安顺市');
INSERT INTO `sys_address_city` VALUES ('522200', '0', '100', '520000', '铜仁地区');
INSERT INTO `sys_address_city` VALUES ('522300', '0', '100', '520000', '黔西南布依族苗族自治州');
INSERT INTO `sys_address_city` VALUES ('522400', '0', '100', '520000', '毕节地区');
INSERT INTO `sys_address_city` VALUES ('522600', '0', '100', '520000', '黔东南苗族侗族自治州');
INSERT INTO `sys_address_city` VALUES ('522700', '0', '100', '520000', '黔南布依族苗族自治州');
INSERT INTO `sys_address_city` VALUES ('530100', '0', '100', '530000', '昆明市');
INSERT INTO `sys_address_city` VALUES ('530300', '0', '100', '530000', '曲靖市');
INSERT INTO `sys_address_city` VALUES ('530400', '0', '100', '530000', '玉溪市');
INSERT INTO `sys_address_city` VALUES ('530500', '0', '100', '530000', '保山市');
INSERT INTO `sys_address_city` VALUES ('530600', '0', '100', '530000', '昭通市');
INSERT INTO `sys_address_city` VALUES ('530700', '0', '100', '530000', '丽江市');
INSERT INTO `sys_address_city` VALUES ('530800', '0', '100', '530000', '思茅市');
INSERT INTO `sys_address_city` VALUES ('530900', '0', '100', '530000', '临沧市');
INSERT INTO `sys_address_city` VALUES ('532300', '0', '100', '530000', '楚雄彝族自治州');
INSERT INTO `sys_address_city` VALUES ('532500', '0', '100', '530000', '红河哈尼族彝族自治州');
INSERT INTO `sys_address_city` VALUES ('532600', '0', '100', '530000', '文山壮族苗族自治州');
INSERT INTO `sys_address_city` VALUES ('532800', '0', '100', '530000', '西双版纳傣族自治州');
INSERT INTO `sys_address_city` VALUES ('532900', '0', '100', '530000', '大理白族自治州');
INSERT INTO `sys_address_city` VALUES ('533100', '0', '100', '530000', '德宏傣族景颇族自治州');
INSERT INTO `sys_address_city` VALUES ('533300', '0', '100', '530000', '怒江傈僳族自治州');
INSERT INTO `sys_address_city` VALUES ('533400', '0', '100', '530000', '迪庆藏族自治州');
INSERT INTO `sys_address_city` VALUES ('540100', '0', '100', '540000', '拉萨市');
INSERT INTO `sys_address_city` VALUES ('542100', '0', '100', '540000', '昌都地区');
INSERT INTO `sys_address_city` VALUES ('542200', '0', '100', '540000', '山南地区');
INSERT INTO `sys_address_city` VALUES ('542300', '0', '100', '540000', '日喀则地区');
INSERT INTO `sys_address_city` VALUES ('542400', '0', '100', '540000', '那曲地区');
INSERT INTO `sys_address_city` VALUES ('542500', '0', '100', '540000', '阿里地区');
INSERT INTO `sys_address_city` VALUES ('542600', '0', '100', '540000', '林芝地区');
INSERT INTO `sys_address_city` VALUES ('610100', '0', '100', '610000', '西安市');
INSERT INTO `sys_address_city` VALUES ('610200', '0', '100', '610000', '铜川市');
INSERT INTO `sys_address_city` VALUES ('610300', '0', '100', '610000', '宝鸡市');
INSERT INTO `sys_address_city` VALUES ('610400', '0', '100', '610000', '咸阳市');
INSERT INTO `sys_address_city` VALUES ('610500', '0', '100', '610000', '渭南市');
INSERT INTO `sys_address_city` VALUES ('610600', '0', '100', '610000', '延安市');
INSERT INTO `sys_address_city` VALUES ('610700', '0', '100', '610000', '汉中市');
INSERT INTO `sys_address_city` VALUES ('610800', '0', '100', '610000', '榆林市');
INSERT INTO `sys_address_city` VALUES ('610900', '0', '100', '610000', '安康市');
INSERT INTO `sys_address_city` VALUES ('611000', '0', '100', '610000', '商洛市');
INSERT INTO `sys_address_city` VALUES ('620100', '0', '100', '620000', '兰州市');
INSERT INTO `sys_address_city` VALUES ('620200', '0', '100', '620000', '嘉峪关市');
INSERT INTO `sys_address_city` VALUES ('620300', '0', '100', '620000', '金昌市');
INSERT INTO `sys_address_city` VALUES ('620400', '0', '100', '620000', '白银市');
INSERT INTO `sys_address_city` VALUES ('620500', '0', '100', '620000', '天水市');
INSERT INTO `sys_address_city` VALUES ('620600', '0', '100', '620000', '武威市');
INSERT INTO `sys_address_city` VALUES ('620700', '0', '100', '620000', '张掖市');
INSERT INTO `sys_address_city` VALUES ('620800', '0', '100', '620000', '平凉市');
INSERT INTO `sys_address_city` VALUES ('620900', '0', '100', '620000', '酒泉市');
INSERT INTO `sys_address_city` VALUES ('621000', '0', '100', '620000', '庆阳市');
INSERT INTO `sys_address_city` VALUES ('621100', '0', '100', '620000', '定西市');
INSERT INTO `sys_address_city` VALUES ('621200', '0', '100', '620000', '陇南市');
INSERT INTO `sys_address_city` VALUES ('622900', '0', '100', '620000', '临夏回族自治州');
INSERT INTO `sys_address_city` VALUES ('623000', '0', '100', '620000', '甘南藏族自治州');
INSERT INTO `sys_address_city` VALUES ('630100', '0', '100', '630000', '西宁市');
INSERT INTO `sys_address_city` VALUES ('632100', '0', '100', '630000', '海东地区');
INSERT INTO `sys_address_city` VALUES ('632200', '0', '100', '630000', '海北藏族自治州');
INSERT INTO `sys_address_city` VALUES ('632300', '0', '100', '630000', '黄南藏族自治州');
INSERT INTO `sys_address_city` VALUES ('632500', '0', '100', '630000', '海南藏族自治州');
INSERT INTO `sys_address_city` VALUES ('632600', '0', '100', '630000', '果洛藏族自治州');
INSERT INTO `sys_address_city` VALUES ('632700', '0', '100', '630000', '玉树藏族自治州');
INSERT INTO `sys_address_city` VALUES ('632800', '0', '100', '630000', '海西蒙古族藏族自治州');
INSERT INTO `sys_address_city` VALUES ('640100', '0', '100', '640000', '银川市');
INSERT INTO `sys_address_city` VALUES ('640200', '0', '100', '640000', '石嘴山市');
INSERT INTO `sys_address_city` VALUES ('640300', '0', '100', '640000', '吴忠市');
INSERT INTO `sys_address_city` VALUES ('640400', '0', '100', '640000', '固原市');
INSERT INTO `sys_address_city` VALUES ('640500', '0', '100', '640000', '中卫市');
INSERT INTO `sys_address_city` VALUES ('650100', '0', '100', '650000', '乌鲁木齐市');
INSERT INTO `sys_address_city` VALUES ('650200', '0', '100', '650000', '克拉玛依市');
INSERT INTO `sys_address_city` VALUES ('652100', '0', '100', '650000', '吐鲁番地区');
INSERT INTO `sys_address_city` VALUES ('652200', '0', '100', '650000', '哈密地区');
INSERT INTO `sys_address_city` VALUES ('652300', '0', '100', '650000', '昌吉回族自治州');
INSERT INTO `sys_address_city` VALUES ('652700', '0', '100', '650000', '博尔塔拉蒙古自治州');
INSERT INTO `sys_address_city` VALUES ('652800', '0', '100', '650000', '巴音郭楞蒙古自治州');
INSERT INTO `sys_address_city` VALUES ('652900', '0', '100', '650000', '阿克苏地区');
INSERT INTO `sys_address_city` VALUES ('653000', '0', '100', '650000', '克孜勒苏柯尔克孜自治州');
INSERT INTO `sys_address_city` VALUES ('653100', '0', '100', '650000', '喀什地区');
INSERT INTO `sys_address_city` VALUES ('653200', '0', '100', '650000', '和田地区');
INSERT INTO `sys_address_city` VALUES ('654000', '0', '100', '650000', '伊犁哈萨克自治州');
INSERT INTO `sys_address_city` VALUES ('654200', '0', '100', '650000', '塔城地区');
INSERT INTO `sys_address_city` VALUES ('654300', '0', '100', '650000', '阿勒泰地区');
INSERT INTO `sys_address_city` VALUES ('659000', '0', '100', '650000', '省直辖行政单位');

-- ----------------------------
-- Table structure for `sys_address_province`
-- ----------------------------
DROP TABLE IF EXISTS `sys_address_province`;
CREATE TABLE `sys_address_province` (
  `province_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '省份ID：[1,8388607]',
  `show` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否可见：[0,2]0为仅表单可见，1为仅表单和搜索时可见 ，2为均可见',
  `display` smallint(4) unsigned NOT NULL DEFAULT '100' COMMENT '显示顺序：[0,1000]',
  `name` varchar(16) NOT NULL DEFAULT '' COMMENT '省份名称：[0,16]',
  PRIMARY KEY (`province_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='省份信息表';

-- ----------------------------
-- Records of sys_address_province
-- ----------------------------
INSERT INTO `sys_address_province` VALUES ('110000', '0', '100', '北京市');
INSERT INTO `sys_address_province` VALUES ('120000', '0', '100', '天津市');
INSERT INTO `sys_address_province` VALUES ('130000', '0', '100', '河北省');
INSERT INTO `sys_address_province` VALUES ('140000', '0', '100', '山西省');
INSERT INTO `sys_address_province` VALUES ('150000', '0', '100', '内蒙古自治区');
INSERT INTO `sys_address_province` VALUES ('210000', '0', '100', '辽宁省');
INSERT INTO `sys_address_province` VALUES ('220000', '0', '100', '吉林省');
INSERT INTO `sys_address_province` VALUES ('230000', '0', '100', '黑龙江省');
INSERT INTO `sys_address_province` VALUES ('310000', '0', '100', '上海市');
INSERT INTO `sys_address_province` VALUES ('320000', '0', '100', '江苏省');
INSERT INTO `sys_address_province` VALUES ('330000', '0', '100', '浙江省');
INSERT INTO `sys_address_province` VALUES ('340000', '0', '100', '安徽省');
INSERT INTO `sys_address_province` VALUES ('350000', '0', '100', '福建省');
INSERT INTO `sys_address_province` VALUES ('360000', '0', '100', '江西省');
INSERT INTO `sys_address_province` VALUES ('370000', '0', '100', '山东省');
INSERT INTO `sys_address_province` VALUES ('410000', '0', '100', '河南省');
INSERT INTO `sys_address_province` VALUES ('420000', '0', '100', '湖北省');
INSERT INTO `sys_address_province` VALUES ('430000', '0', '100', '湖南省');
INSERT INTO `sys_address_province` VALUES ('440000', '0', '100', '广东省');
INSERT INTO `sys_address_province` VALUES ('450000', '0', '100', '广西壮族自治区');
INSERT INTO `sys_address_province` VALUES ('460000', '0', '100', '海南省');
INSERT INTO `sys_address_province` VALUES ('500000', '0', '100', '重庆市');
INSERT INTO `sys_address_province` VALUES ('510000', '0', '100', '四川省');
INSERT INTO `sys_address_province` VALUES ('520000', '0', '100', '贵州省');
INSERT INTO `sys_address_province` VALUES ('530000', '0', '100', '云南省');
INSERT INTO `sys_address_province` VALUES ('540000', '0', '100', '西藏自治区');
INSERT INTO `sys_address_province` VALUES ('610000', '0', '100', '陕西省');
INSERT INTO `sys_address_province` VALUES ('620000', '0', '100', '甘肃省');
INSERT INTO `sys_address_province` VALUES ('630000', '0', '100', '青海省');
INSERT INTO `sys_address_province` VALUES ('640000', '0', '100', '宁夏回族自治区');
INSERT INTO `sys_address_province` VALUES ('650000', '0', '100', '新疆维吾尔自治区');
INSERT INTO `sys_address_province` VALUES ('710000', '0', '100', '台湾省');
INSERT INTO `sys_address_province` VALUES ('810000', '0', '100', '香港特别行政区');
INSERT INTO `sys_address_province` VALUES ('820000', '0', '100', '澳门特别行政区');

-- ----------------------------
-- Table structure for `sys_app`
-- ----------------------------
DROP TABLE IF EXISTS `sys_app`;
CREATE TABLE `sys_app` (
  `app_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '应用序号：[1,8388607]',
  `available` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否可用：[0,1]在未审核状态下， 该应用授权为不可用',
  `encrypt` smallint(1) unsigned NOT NULL DEFAULT '1' COMMENT '加解密方式：[0,10]0明文模式，1兼容模式，2安全模式',
  `times_allow` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '每日允许请求次数：[0,32767]用于限制应用每日可授权次数',
  `times_today` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '今日请求次数：[0,32767]用于记录今日请求授权次数，判断授权次数是否超限',
  `max_age` smallint(5) unsigned NOT NULL DEFAULT '1825' COMMENT '有效期时长：[0,32767]授权应用可以使用的时长，超时需重新申请（单位：天）',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '持有者ID：[1,8388607]该客户端所有人的ID',
  `times_count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '请求总次数：[0,2147483647]用于记录授权总次数',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '上次使用时间：用于记录上次授权时间，防止频繁操作',
  `name` varchar(16) NOT NULL DEFAULT '' COMMENT '应用名称：[0,16]用于用户登陆时显示授权应用',
  `appid` varchar(16) NOT NULL DEFAULT '' COMMENT '应用ID：[0,16]用于应用授权访问时的账号',
  `token` varchar(32) DEFAULT NULL COMMENT '消息访问令牌：[0,32]用于访问应用时验证身份',
  `encoding_aes_key` varchar(43) DEFAULT NULL COMMENT '消息加密钥匙：[16,43]用于给应用发送消息时的加密钥匙',
  `appsecret` varchar(64) NOT NULL DEFAULT '' COMMENT '应用密钥：[0,64]用于应用授权访问时的密码',
  `icon` varchar(255) DEFAULT NULL COMMENT '应用图标：[0,255]用于用户登录时显示',
  `url` varchar(255) DEFAULT NULL COMMENT '消息访问地址：[0,255]当接收到用户所发消息后回访该地址',
  `bind_ip` text COMMENT '访问绑定IP：网站授权时确认重定向网址为已授权IP',
  `scope` text COMMENT '允许使用的接口：多个接口用”，“分隔',
  `scope_not` text COMMENT '不允许使用的接口：“多个接口用”，“分隔',
  `users` text COMMENT '授权的用户：',
  PRIMARY KEY (`app_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_app
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_app_refresh`
-- ----------------------------
DROP TABLE IF EXISTS `sys_app_refresh`;
CREATE TABLE `sys_app_refresh` (
  `refresh_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '刷新Token的ID：[1,2147483647]',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID：[1,8388607]表示当前Token绑定的用户uid',
  `create_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '创建时间：用来判断刷新令牌有效期',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：用来判断是否频繁刷新访问牌',
  `appid` varchar(16) NOT NULL DEFAULT '' COMMENT '应用ID：[0,16]',
  `refresh_token` varchar(32) NOT NULL DEFAULT '' COMMENT '刷新令牌：[0,32]用来刷新访问牌，保留30天',
  PRIMARY KEY (`refresh_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_app_refresh
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_config`
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID：[1,2147483647]',
  `type` varchar(16) NOT NULL DEFAULT 'string' COMMENT '数据类型：[0,16]string文本型、number数字型、boolean布尔型',
  `name` varchar(16) NOT NULL DEFAULT '' COMMENT '变量名：[0,16]',
  `title` varchar(16) DEFAULT NULL COMMENT '变量标题：[0,16]可以用中文名',
  `value` varchar(255) DEFAULT NULL COMMENT '变量值：[0,255]',
  `description` varchar(255) DEFAULT NULL COMMENT '变量描述：[0,255]描述该变量的作用',
  `model` text COMMENT '数据模型：json格式，用于单选、多选模式',
  PRIMARY KEY (`config_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_config
-- ----------------------------

-- ----------------------------
-- Table structure for `user_account`
-- ----------------------------
DROP TABLE IF EXISTS `user_account`;
CREATE TABLE `user_account` (
  `user_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID：[1,8388607]用户获取其他与用户相关的数据',
  `state` smallint(1) unsigned NOT NULL DEFAULT '1' COMMENT '账户状态：[0,10]1为可用，2为异常，3为已冻结，4为已注销',
  `vip` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '会员级别：[0,10]用于确定用户访问权限',
  `gm` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '管理员级别：[0,10]用于确定用户管理权限',
  `mc` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '商家级别：[0,10]用于确定商家用户的管理权限',
  `referee_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '推荐人ID：[1,8388607]用于推荐注册时积分奖级',
  `create_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '创建时间：',
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '上次登录时间：',
  `salt` varchar(6) NOT NULL DEFAULT '' COMMENT '短验证：[0,6]',
  `invite_code` varchar(8) NOT NULL DEFAULT '' COMMENT '邀请注册码：[0,8]随着用户注册而生成',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号码：[0,11]用户的手机号码，用于找回密码时或登录时',
  `phone_state` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '手机号码认证：[0,1]0为未认证，1为认证通过',
  `username` varchar(16) NOT NULL DEFAULT '' COMMENT '用户名：[0,16]用户登录时所用的账户名称',
  `nickname` varchar(16) DEFAULT '' COMMENT '昵称：[0,16]',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码：[0,32]用户登录所需的密码，由6-16位数字或英文组成',
  `email` varchar(64) DEFAULT '' COMMENT '邮箱：[0,64]用户的邮箱，用于找回密码时或登录时',
  `email_state` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '邮箱认证：[0,1]0为未认证，1为认证通过',
  `user_group` varchar(64) DEFAULT NULL COMMENT '所在用户组：[0,64]多个用户组用“,“分隔',
  `user_admin` varchar(64) DEFAULT NULL COMMENT '所在管理组：[0,64]多个管理组用“,“分隔',
  `login_ip` varchar(128) DEFAULT NULL COMMENT '上次登录时的IP地址：[0,128]',
  `signature` varchar(255) DEFAULT NULL COMMENT '个性签名：[0,255]',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像地址：[0,255]',
  `friends` text COMMENT '好友：多个好友ID用“,”分隔',
  `admin_group` varchar(64) DEFAULT NULL COMMENT '所在管理组：[0,64]多个管理组用“,“分隔',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user_account
-- ----------------------------
INSERT INTO `user_account` VALUES ('1', '40', '5', '5', '5', '0', '1970-01-01 00:00:00', '2020-02-18 08:24:31', 'mm2019', 'df91d1', '15817188815', '0', 'admin', '管理员', 'd1d3ca239d5fb1703e8cdb39b4df91d1', '', '0', '5,5', '1', '127.0.0.1', null, null, null, null);

-- ----------------------------
-- Table structure for `user_admin`
-- ----------------------------
DROP TABLE IF EXISTS `user_admin`;
CREATE TABLE `user_admin` (
  `admin_id` smallint(3) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理组ID：[1,1000]',
  `display` smallint(4) unsigned NOT NULL DEFAULT '100' COMMENT '显示顺序：[0,1000]',
  `type` varchar(12) DEFAULT NULL COMMENT '分类：[0,12]用于区分用户组使用范围',
  `name` varchar(16) NOT NULL DEFAULT '' COMMENT '管理组名称：[0,16]',
  `description` varchar(255) DEFAULT NULL COMMENT '描述：[0,255]描述该用户组的特点或权限范围',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标：[0,255]用于标识用户组',
  PRIMARY KEY (`admin_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user_admin
-- ----------------------------
INSERT INTO `user_admin` VALUES ('1', '100', null, '站长', null, null);
INSERT INTO `user_admin` VALUES ('2', '100', null, '管理员', null, null);
INSERT INTO `user_admin` VALUES ('3', '100', null, '财务', null, null);
INSERT INTO `user_admin` VALUES ('4', '100', null, '客服', null, null);
INSERT INTO `user_admin` VALUES ('5', '100', null, '文案', null, null);
INSERT INTO `user_admin` VALUES ('6', '100', null, '推广员', null, null);

-- ----------------------------
-- Table structure for `user_count`
-- ----------------------------
DROP TABLE IF EXISTS `user_count`;
CREATE TABLE `user_count` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID：[1,8388607]',
  `level` smallint(3) unsigned NOT NULL DEFAULT '1' COMMENT '等级：[0,1000]',
  `iq` smallint(3) unsigned NOT NULL DEFAULT '100' COMMENT 'IQ智商：[80,200]用于激励用户评论和发帖',
  `credit` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '信用度：[0,2147483647]用于评估用户信誉',
  `credit_points` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '积分：[0,2147483647]用于代金消费或兑换商品',
  `exp` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '经验值：[0,2147483647]',
  `extcredits1` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '拓展积分1：[0,2147483647]',
  `extcredits2` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '拓展积分2：[0,2147483647]',
  `extcredits3` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '拓展积分3：[0,2147483647]',
  `extcredits4` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '拓展积分4：[0,2147483647]',
  `extcredits5` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '拓展积分5：[0,2147483647]',
  `extcredits6` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '拓展积分6：[0,2147483647]',
  `extcredits7` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '拓展积分7：[0,2147483647]',
  `extcredits8` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '拓展积分8：[0,2147483647]',
  `money` double(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '钱：用于现金业务',
  `coin` decimal(16,8) NOT NULL DEFAULT '0.00000000' COMMENT '货币：用于游戏或数字货币业务',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user_count
-- ----------------------------
INSERT INTO `user_count` VALUES ('1', '1', '100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.00', '0.00000000');

-- ----------------------------
-- Table structure for `user_group`
-- ----------------------------
DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group` (
  `group_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组ID：[1,8388607]',
  `display` smallint(4) unsigned NOT NULL DEFAULT '100' COMMENT '显示顺序：[0,1000]',
  `level` smallint(3) unsigned NOT NULL DEFAULT '1' COMMENT '等级划分：[0,1000]用于识别级别分组',
  `next_group_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '下级用户组ID：[1,8388607]决定用户升级后所属用户组',
  `exp` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '升级所需经验：[0,2147483647]用于确定用户的升级',
  `discount` double(3,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '折扣：用于确定用户的消费折扣',
  `bonus` double(3,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '奖励比例：用于确定用户的积分奖励',
  `app` varchar(12) DEFAULT NULL COMMENT '应用：[0,12]用于区分用户组使用范围，cms内容管理系统、bbs社区、mall商城',
  `name` varchar(16) NOT NULL DEFAULT '' COMMENT '用户名称：[0,16]',
  `description` varchar(255) DEFAULT NULL COMMENT '描述：[0,255]描述该用户组的特点或权限范围',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标：[0,255]用于标识用户组',
  PRIMARY KEY (`group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user_group
-- ----------------------------
INSERT INTO `user_group` VALUES ('1', '0', '1', '2', '0', '0.00', '0.00', 'mall', '普通会员', '通过消费积分评估，用于激励用户消费', null);
INSERT INTO `user_group` VALUES ('2', '0', '2', '3', '5000', '0.98', '0.00', 'mall', '黄金会员', '通过消费积分评估，用于激励用户消费', null);
INSERT INTO `user_group` VALUES ('3', '0', '3', '4', '20000', '0.97', '1.50', 'mall', '白金会员', '通过消费积分评估，用于激励用户消费', null);
INSERT INTO `user_group` VALUES ('4', '0', '4', '5', '100000', '0.95', '2.00', 'mall', '钻石会员', '通过消费积分评估，用于激励用户消费', null);
INSERT INTO `user_group` VALUES ('5', '0', '5', '0', '500000', '0.90', '3.00', 'mall', '至尊会员', '通过消费积分评估，用于激励用户消费', null);
INSERT INTO `user_group` VALUES ('6', '0', '1', '2', '0', '0.00', '0.00', 'bbs', '学徒', '通过IQ值评估，激励用户评论和发表', null);
INSERT INTO `user_group` VALUES ('7', '0', '2', '3', '120', '0.98', '0.00', 'bbs', '才子', '通过IQ值评估，激励用户评论和发表', null);
INSERT INTO `user_group` VALUES ('8', '0', '3', '4', '140', '0.97', '1.50', 'bbs', '达人', '通过IQ值评估，激励用户评论和发表', null);
INSERT INTO `user_group` VALUES ('9', '0', '4', '5', '160', '0.95', '2.00', 'bbs', '导师', '通过IQ值评估，激励用户评论和发表', null);
INSERT INTO `user_group` VALUES ('10', '0', '5', '0', '180', '0.90', '3.00', 'bbs', '贤者', '通过IQ值评估，激励用户评论和发表', null);

-- ----------------------------
-- Table structure for `user_info`
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID：[1,8388607]',
  `sex` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '性别：[0,2]0未设置、1男、2女',
  `idcard_state` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '身份实名认证：[0,10]1为未认证，2为认证中，3为认证通过',
  `age` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '年龄：[0,150]',
  `province_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '省份ID：[1,2147483647]用户所在地的省份',
  `city_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所在城市ID：[1,2147483647]',
  `birthday` date NOT NULL DEFAULT '1970-01-01' COMMENT '生日：',
  `name` varchar(16) DEFAULT NULL COMMENT '姓名：[2,16]',
  `job` varchar(16) DEFAULT NULL COMMENT '职业：[0,16]',
  `school` varchar(16) DEFAULT NULL COMMENT '毕业学校：[0,16]',
  `major` varchar(16) DEFAULT NULL COMMENT '所学专业：[0,16]',
  `idcard` varchar(64) DEFAULT NULL COMMENT '身份证号：[0,64]',
  `company_address` varchar(125) DEFAULT NULL COMMENT '公司地址：[0,125]用户当前就职的公司地址',
  `address` varchar(255) DEFAULT NULL COMMENT '详细地址：[0,255]用户居住地的详细地址',
  `job_scope` varchar(255) DEFAULT NULL COMMENT '工作范围：[0,255]',
  `company_business` varchar(255) DEFAULT NULL COMMENT '公司经营范围：[0,255]',
  `idcard_img` text COMMENT '身份证图片：保存json格式',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('1', '0', '0', '0', '0', '0', '1970-01-01', null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `user_sns`
-- ----------------------------
DROP TABLE IF EXISTS `user_sns`;
CREATE TABLE `user_sns` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID：[1,8388607]',
  `qq` varchar(12) DEFAULT NULL COMMENT 'QQ号：[5,12]',
  `qq_state` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'QQ认证：[0,1]0未认证，1已认证',
  `wechat` varchar(16) DEFAULT NULL COMMENT '微信号：[5,16]',
  `wechat_state` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '微信认证：[0,1]0未认证，1已认证',
  `mm` varchar(16) DEFAULT NULL COMMENT 'MM号：[5,16]',
  `mm_state` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'MM认证：[0,1]0未认证，1已认证',
  `baidu` varchar(14) DEFAULT NULL COMMENT '百度账号：[5,14]',
  `baidu_state` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '百度认证：[0,1]0未认证，1已认证',
  `taobao` varchar(10) DEFAULT NULL COMMENT '淘宝账号：[5,10]',
  `taobao_state` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '淘宝认证：[0,1]0未认证，1已认证',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user_sns
-- ----------------------------
INSERT INTO `user_sns` VALUES ('1', '573242395', '0', 'qiuwenwu91', '0', 'qiuwenwu91', '0', null, '0', null, '0');
