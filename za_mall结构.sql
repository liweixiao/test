/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 80012
Source Host           : 127.0.0.1:3306
Source Database       : za_mall

Target Server Type    : MYSQL
Target Server Version : 80012
File Encoding         : 65001

Date: 2020-04-09 10:14:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for erp_code
-- ----------------------------
DROP TABLE IF EXISTS `erp_code`;
CREATE TABLE `erp_code` (
  `sc_contacts` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sc_mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `erp_partner_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `erp_partner_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_account_distribut_log
-- ----------------------------
DROP TABLE IF EXISTS `tp_account_distribut_log`;
CREATE TABLE `tp_account_distribut_log` (
  `log_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '日志id',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `distribut_money` decimal(10,2) DEFAULT '0.00' COMMENT '分销佣金',
  `change_time` int(10) unsigned NOT NULL COMMENT '变动时间',
  `desc` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `order_sn` varchar(50) DEFAULT NULL COMMENT '订单编号',
  `order_id` int(10) DEFAULT NULL COMMENT '订单id',
  PRIMARY KEY (`log_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_account_log
-- ----------------------------
DROP TABLE IF EXISTS `tp_account_log`;
CREATE TABLE `tp_account_log` (
  `log_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '日志id',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `user_money` decimal(10,2) DEFAULT '0.00' COMMENT '用户金额',
  `frozen_money` decimal(10,2) DEFAULT '0.00' COMMENT '冻结金额',
  `pay_points` mediumint(9) NOT NULL DEFAULT '0' COMMENT '支付积分',
  `change_time` int(10) unsigned NOT NULL COMMENT '变动时间',
  `desc` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `order_sn` varchar(50) DEFAULT NULL COMMENT '订单编号',
  `order_id` int(10) DEFAULT NULL COMMENT '订单id',
  PRIMARY KEY (`log_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=908 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_account_log_supplier
-- ----------------------------
DROP TABLE IF EXISTS `tp_account_log_supplier`;
CREATE TABLE `tp_account_log_supplier` (
  `log_id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `suppliers_id` int(8) unsigned NOT NULL COMMENT '供应商id',
  `supplier_money` decimal(10,2) NOT NULL COMMENT '店铺金额',
  `change_time` int(10) unsigned NOT NULL COMMENT '变动时间',
  `desc` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`log_id`),
  KEY `user_id` (`suppliers_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_ad
-- ----------------------------
DROP TABLE IF EXISTS `tp_ad`;
CREATE TABLE `tp_ad` (
  `ad_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '广告id',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '广告位置ID',
  `media_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '广告类型',
  `ad_name` varchar(60) NOT NULL DEFAULT '' COMMENT '广告名称',
  `ad_link` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `ad_code` text NOT NULL COMMENT '图片地址',
  `start_time` int(11) NOT NULL DEFAULT '0' COMMENT '投放时间',
  `end_time` int(11) NOT NULL DEFAULT '0' COMMENT '结束时间',
  `link_man` varchar(60) NOT NULL DEFAULT '' COMMENT '添加人',
  `link_email` varchar(60) NOT NULL DEFAULT '' COMMENT '添加人邮箱',
  `link_phone` varchar(60) NOT NULL DEFAULT '' COMMENT '添加人联系电话',
  `click_count` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '点击量',
  `enabled` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `orderby` smallint(6) DEFAULT '50' COMMENT '排序',
  `target` tinyint(1) DEFAULT '0' COMMENT '是否开启浏览器新窗口',
  `bgcolor` varchar(20) DEFAULT NULL COMMENT '背景颜色',
  PRIMARY KEY (`ad_id`),
  KEY `enabled` (`enabled`),
  KEY `position_id` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_admin
-- ----------------------------
DROP TABLE IF EXISTS `tp_admin`;
CREATE TABLE `tp_admin` (
  `admin_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user_name` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `email` varchar(60) NOT NULL DEFAULT '' COMMENT 'email',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `ec_salt` varchar(10) DEFAULT NULL COMMENT '秘钥',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `last_login` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `nav_list` text COMMENT '权限',
  `lang_type` varchar(50) NOT NULL DEFAULT '' COMMENT 'lang_type',
  `agency_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'agency_id',
  `suppliers_id` smallint(5) unsigned DEFAULT '0' COMMENT 'suppliers_id',
  `todolist` longtext COMMENT 'todolist',
  `role_id` smallint(5) DEFAULT '0' COMMENT '角色id',
  `province_id` int(8) unsigned DEFAULT '0' COMMENT '加盟商省级id',
  `city_id` int(8) unsigned DEFAULT '0' COMMENT '加盟商市级id',
  `district_id` int(8) unsigned DEFAULT '0' COMMENT '加盟商区级id',
  `open_navigation` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0开启新手指导开 1不开',
  PRIMARY KEY (`admin_id`),
  KEY `user_name` (`user_name`) USING BTREE,
  KEY `agency_id` (`agency_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `tp_admin_log`;
CREATE TABLE `tp_admin_log` (
  `log_id` bigint(16) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `admin_id` int(10) DEFAULT NULL COMMENT '管理员id',
  `log_info` varchar(255) DEFAULT NULL COMMENT '日志描述',
  `log_ip` varchar(30) DEFAULT NULL COMMENT 'ip地址',
  `log_url` varchar(50) DEFAULT NULL COMMENT 'url',
  `log_time` int(10) DEFAULT NULL COMMENT '日志时间',
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM AUTO_INCREMENT=666 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `tp_admin_role`;
CREATE TABLE `tp_admin_role` (
  `role_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) DEFAULT NULL COMMENT '角色名称',
  `act_list` text COMMENT '权限列表',
  `role_desc` varchar(255) DEFAULT NULL COMMENT '角色描述',
  PRIMARY KEY (`role_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_ad_goods
-- ----------------------------
DROP TABLE IF EXISTS `tp_ad_goods`;
CREATE TABLE `tp_ad_goods` (
  `ad_goods_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品广告id',
  `media_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '广告类型',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '绑定的商品ID',
  `ad_name` varchar(60) NOT NULL DEFAULT '' COMMENT '广告名称',
  `ad_link` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `ad_code` text NOT NULL COMMENT '图片地址',
  `start_time` int(11) NOT NULL DEFAULT '0' COMMENT '投放时间',
  `end_time` int(11) NOT NULL DEFAULT '0' COMMENT '结束时间',
  `link_man` varchar(60) NOT NULL DEFAULT '' COMMENT '添加人',
  `link_email` varchar(60) NOT NULL DEFAULT '' COMMENT '添加人邮箱',
  `link_phone` varchar(60) NOT NULL DEFAULT '' COMMENT '添加人联系电话',
  `click_count` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '点击量',
  `enabled` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `orderby` smallint(6) DEFAULT '50' COMMENT '排序',
  `target` tinyint(1) DEFAULT '0' COMMENT '是否开启浏览器新窗口',
  `bgcolor` varchar(20) DEFAULT NULL COMMENT '背景颜色',
  PRIMARY KEY (`ad_goods_id`),
  KEY `enabled` (`enabled`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_ad_goods_config
-- ----------------------------
DROP TABLE IF EXISTS `tp_ad_goods_config`;
CREATE TABLE `tp_ad_goods_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `ad_goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品广告位ID',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '绑定的商品ID',
  PRIMARY KEY (`id`),
  KEY `ag` (`ad_goods_id`,`goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_ad_position
-- ----------------------------
DROP TABLE IF EXISTS `tp_ad_position`;
CREATE TABLE `tp_ad_position` (
  `position_id` int(3) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `position_name` varchar(60) NOT NULL DEFAULT '' COMMENT '广告位置名称',
  `ad_width` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '广告位宽度',
  `ad_height` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '广告位高度',
  `position_desc` varchar(255) NOT NULL DEFAULT '' COMMENT '广告描述',
  `position_style` text COMMENT '模板',
  `is_open` tinyint(1) DEFAULT '0' COMMENT '0关闭1开启',
  PRIMARY KEY (`position_id`)
) ENGINE=MyISAM AUTO_INCREMENT=511 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_album
-- ----------------------------
DROP TABLE IF EXISTS `tp_album`;
CREATE TABLE `tp_album` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '相册名称',
  `type` varchar(50) NOT NULL COMMENT '文件类型  ',
  `status` tinyint(255) NOT NULL DEFAULT '1' COMMENT '状态  1 正常  0 删除  ',
  `createtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `explain` varchar(50) NOT NULL DEFAULT '' COMMENT '说明',
  `number` int(11) NOT NULL DEFAULT '0' COMMENT '文件数量',
  PRIMARY KEY (`category_id`),
  KEY `type` (`type`,`status`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='相册列表';

-- ----------------------------
-- Table structure for tp_area_region
-- ----------------------------
DROP TABLE IF EXISTS `tp_area_region`;
CREATE TABLE `tp_area_region` (
  `shipping_area_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '物流配置id',
  `region_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '地区id对应region表id',
  PRIMARY KEY (`shipping_area_id`,`region_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_article
-- ----------------------------
DROP TABLE IF EXISTS `tp_article`;
CREATE TABLE `tp_article` (
  `article_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `cat_id` smallint(5) NOT NULL DEFAULT '0' COMMENT '类别ID',
  `title` varchar(150) NOT NULL DEFAULT '' COMMENT '文章标题',
  `content` longtext NOT NULL,
  `author` varchar(30) NOT NULL DEFAULT '' COMMENT '文章作者',
  `author_email` varchar(60) NOT NULL DEFAULT '' COMMENT '作者邮箱',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `article_type` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `is_open` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示,1:显示;0:不显示',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `file_url` varchar(255) NOT NULL DEFAULT '' COMMENT '附件地址',
  `open_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `link` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `description` mediumtext COMMENT '文章摘要',
  `click` int(11) DEFAULT '0' COMMENT '浏览量',
  `publish_time` int(11) DEFAULT NULL COMMENT '文章预告发布时间',
  `thumb` varchar(255) DEFAULT '' COMMENT '文章缩略图',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`article_id`),
  KEY `cat_id` (`cat_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_article2
-- ----------------------------
DROP TABLE IF EXISTS `tp_article2`;
CREATE TABLE `tp_article2` (
  `article_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `cat_id` smallint(5) NOT NULL DEFAULT '0' COMMENT '类别ID',
  `title` varchar(150) NOT NULL DEFAULT '' COMMENT '文章标题',
  `content` longtext NOT NULL COMMENT '文章内容',
  `author` varchar(30) NOT NULL DEFAULT '' COMMENT '文章作者',
  `author_email` varchar(60) NOT NULL DEFAULT '' COMMENT '作者邮箱',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `article_type` tinyint(1) unsigned NOT NULL DEFAULT '2' COMMENT '文章类型',
  `is_open` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否开启',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `file_url` varchar(255) NOT NULL DEFAULT '' COMMENT '附件地址',
  `open_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'open_type',
  `link` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `description` mediumtext COMMENT '文章摘要',
  `click` int(11) DEFAULT '0' COMMENT '浏览量',
  `publish_time` int(11) DEFAULT '0' COMMENT '文章发布时间',
  `thumb` varchar(255) DEFAULT '' COMMENT '文章缩略图',
  PRIMARY KEY (`article_id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_article_bak
-- ----------------------------
DROP TABLE IF EXISTS `tp_article_bak`;
CREATE TABLE `tp_article_bak` (
  `article_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `cat_id` smallint(5) NOT NULL DEFAULT '0' COMMENT '类别ID',
  `cat_id2` smallint(5) DEFAULT '0' COMMENT '扩展类别ID',
  `title` varchar(150) NOT NULL DEFAULT '' COMMENT '文章标题',
  `content` longtext NOT NULL COMMENT '文章内容',
  `author` varchar(30) NOT NULL DEFAULT '' COMMENT '文章作者',
  `author_email` varchar(60) NOT NULL DEFAULT '' COMMENT '作者邮箱',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `article_type` tinyint(1) unsigned NOT NULL DEFAULT '2' COMMENT '文章类型',
  `is_open` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否开启',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `file_url` varchar(255) NOT NULL DEFAULT '' COMMENT '附件地址',
  `open_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'open_type',
  `link` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `description` mediumtext COMMENT '文章摘要',
  `click` int(11) DEFAULT '0' COMMENT '浏览量',
  `publish_time` int(11) DEFAULT '0' COMMENT '文章发布时间',
  `thumb` varchar(255) DEFAULT '' COMMENT '文章缩略图',
  PRIMARY KEY (`article_id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_article_cat
-- ----------------------------
DROP TABLE IF EXISTS `tp_article_cat`;
CREATE TABLE `tp_article_cat` (
  `cat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(20) DEFAULT NULL COMMENT '类别名称',
  `cat_type` smallint(6) DEFAULT '0' COMMENT '默认分组',
  `parent_id` smallint(6) DEFAULT '0' COMMENT '夫级ID',
  `show_in_nav` tinyint(1) DEFAULT '0' COMMENT '是否导航显示',
  `sort_order` smallint(6) DEFAULT '50' COMMENT '排序',
  `cat_desc` varchar(255) DEFAULT NULL COMMENT '分类描述',
  `keywords` varchar(30) DEFAULT NULL COMMENT '搜索关键词',
  `cat_alias` varchar(20) DEFAULT NULL COMMENT '别名',
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_article_cat2
-- ----------------------------
DROP TABLE IF EXISTS `tp_article_cat2`;
CREATE TABLE `tp_article_cat2` (
  `cat_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `cat_name` varchar(20) DEFAULT NULL COMMENT '类别名称',
  `cat_type` smallint(6) DEFAULT '0' COMMENT '系统分组',
  `parent_id` smallint(6) DEFAULT NULL COMMENT '夫级ID',
  `show_in_nav` tinyint(1) DEFAULT '0' COMMENT '是否导航显示',
  `sort_order` smallint(6) DEFAULT '50' COMMENT '排序',
  `cat_desc` varchar(255) DEFAULT NULL COMMENT '分类描述',
  `keywords` varchar(30) DEFAULT NULL COMMENT '搜索关键词',
  `cat_alias` varchar(20) DEFAULT NULL COMMENT '别名',
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_askall_comment
-- ----------------------------
DROP TABLE IF EXISTS `tp_askall_comment`;
CREATE TABLE `tp_askall_comment` (
  `cid` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `qid` int(11) DEFAULT NULL COMMENT '问题id',
  `user_id` mediumint(8) DEFAULT NULL COMMENT '评论人id',
  `to_user_id` mediumint(8) DEFAULT NULL COMMENT '被回复人id',
  `content` varchar(255) DEFAULT NULL COMMENT '回复内容',
  `audit` tinyint(2) DEFAULT '0' COMMENT '是否审核：0未审核；1已审核；2不通过',
  `status` tinyint(2) DEFAULT '0' COMMENT '是否显示：0不显示；1显示',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_askall_question
-- ----------------------------
DROP TABLE IF EXISTS `tp_askall_question`;
CREATE TABLE `tp_askall_question` (
  `qid` int(11) NOT NULL AUTO_INCREMENT COMMENT '问题id',
  `user_id` mediumint(8) DEFAULT NULL COMMENT '用户id',
  `goods_id` mediumint(8) DEFAULT NULL COMMENT '商品id',
  `content` varchar(255) DEFAULT NULL COMMENT '问题内容',
  `audit` tinyint(2) DEFAULT '0' COMMENT '是否审核：0未审核；1已审核；2不通过',
  `status` tinyint(2) DEFAULT '0' COMMENT '是否显示：0不显示；1显示',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`qid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_assist_leader
-- ----------------------------
DROP TABLE IF EXISTS `tp_assist_leader`;
CREATE TABLE `tp_assist_leader` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `assist_id` int(11) NOT NULL COMMENT '助力活动id',
  `user_id` int(11) NOT NULL COMMENT '发起用户id',
  `receive_num` int(11) NOT NULL DEFAULT '0' COMMENT '收到助力总数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='助力互动发起表';

-- ----------------------------
-- Table structure for tp_assist_reward
-- ----------------------------
DROP TABLE IF EXISTS `tp_assist_reward`;
CREATE TABLE `tp_assist_reward` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `assist_id` int(11) NOT NULL COMMENT '助力活动id',
  `reward_level` int(2) NOT NULL COMMENT '奖品等级',
  `reward_name` varchar(10) NOT NULL COMMENT '奖品等级名称',
  `reward_img` varchar(128) NOT NULL COMMENT '奖品图片',
  `reward_num` int(2) NOT NULL DEFAULT '1' COMMENT '奖品数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='助力活动奖品表';

-- ----------------------------
-- Table structure for tp_assist_supply
-- ----------------------------
DROP TABLE IF EXISTS `tp_assist_supply`;
CREATE TABLE `tp_assist_supply` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `assist_id` int(11) DEFAULT NULL COMMENT '助力活动id',
  `sid` int(11) NOT NULL COMMENT '好友发起助力事件id',
  `user_id` int(11) NOT NULL COMMENT '提供助力用户id',
  `supply_num` int(2) NOT NULL COMMENT '提供助力数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='参与助力用户表';

-- ----------------------------
-- Table structure for tp_bargain_first
-- ----------------------------
DROP TABLE IF EXISTS `tp_bargain_first`;
CREATE TABLE `tp_bargain_first` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `bargain_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '活动id',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `order_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `item_id` int(11) unsigned NOT NULL DEFAULT '0',
  `goods_num` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '商品数量',
  `cut_count` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '被砍了几次',
  `end_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '剩下的价格(也就是成交价）',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `is_end` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1结束，0未结束（是否已经砍到最低价）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='发起砍价的第一人';

-- ----------------------------
-- Table structure for tp_bargain_list
-- ----------------------------
DROP TABLE IF EXISTS `tp_bargain_list`;
CREATE TABLE `tp_bargain_list` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `head_pic` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `nickname` varchar(255) NOT NULL DEFAULT '' COMMENT '名称',
  `bargain_first_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '帮助了哪个用户砍价',
  `cut_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '帮助砍价多少',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '砍价时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='帮助砍价';

-- ----------------------------
-- Table structure for tp_bespeak_template
-- ----------------------------
DROP TABLE IF EXISTS `tp_bespeak_template`;
CREATE TABLE `tp_bespeak_template` (
  `template_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模板id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '模板名称',
  `desc` text NOT NULL COMMENT '描述',
  `monday` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '星期一是否营业,0不是,1是',
  `tuesday` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '星期二是否营业，0不是1是',
  `wednesday` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '星期三是否营业，0不是1是',
  `thursday` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '星期四是否营业，0不是1是',
  `friday` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '星期五是否营业，0不是1是',
  `saturday` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '星期六是否营业，0不是1是',
  `sunday` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '星期日是否营业，0不是1是',
  `work_am_start_time` varchar(10) NOT NULL DEFAULT '' COMMENT '工作日上午营业开始时间',
  `work_am_end_time` varchar(10) NOT NULL DEFAULT '' COMMENT '工作日每天上午营业结束时间',
  `work_pm_start_time` varchar(10) NOT NULL DEFAULT '' COMMENT '工作日每天下午营业开始时间',
  `work_pm_end_time` varchar(10) NOT NULL DEFAULT '' COMMENT '工作日每天下午营业结束时间',
  `weekend_am_start_time` varchar(10) NOT NULL DEFAULT '' COMMENT '周末每天上午营业开始时间',
  `weekend_am_end_time` varchar(10) NOT NULL DEFAULT '' COMMENT '周末每天上午营业结束始时间',
  `weekend_pm_start_time` varchar(10) NOT NULL DEFAULT '' COMMENT '周末每天下午营业开始时间',
  `weekend_pm_end_time` varchar(10) NOT NULL DEFAULT '' COMMENT '周末每天下午营业结束时间',
  `reserved_days` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '保留天数',
  `numbers` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '可预约人数、每小时多少人',
  `equipment` varchar(255) NOT NULL DEFAULT '' COMMENT '场景设备',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否已删除,（1启用，）0不启用',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`template_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_bespeak_template_unit
-- ----------------------------
DROP TABLE IF EXISTS `tp_bespeak_template_unit`;
CREATE TABLE `tp_bespeak_template_unit` (
  `template_unit_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '组件id',
  `template_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '预约模板id',
  `type` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '组件类型:1(单行文本),2(多行文本),3(单选按钮组),4(复选框组),5(下拉框),6(单张图片),7(多张图片),8(时间控件)',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '组件表单name',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '组件表单名称',
  `value` varchar(255) NOT NULL DEFAULT '' COMMENT '组件值，用英文逗号分隔，单多行文本的默认值，下拉框的值',
  `desc` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `format` varchar(255) NOT NULL DEFAULT '' COMMENT '格式:空表示不用,1(mobile 手机号码)2(phone电话号码)3(email邮箱)4(id身份证)5(zip_code邮编)',
  `placeholder` varchar(255) NOT NULL DEFAULT '' COMMENT '提示文字',
  `required` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否必须0不是，1是',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否已删除',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序（时间戳）',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否显示1是',
  PRIMARY KEY (`template_unit_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_brand
-- ----------------------------
DROP TABLE IF EXISTS `tp_brand`;
CREATE TABLE `tp_brand` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '品牌表',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '品牌名称',
  `logo` varchar(255) NOT NULL DEFAULT '' COMMENT '品牌logo',
  `desc` text NOT NULL COMMENT '品牌描述',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '品牌地址',
  `sort` int(3) unsigned NOT NULL DEFAULT '50' COMMENT '排序',
  `cat_name` varchar(128) DEFAULT '' COMMENT '品牌分类',
  `parent_cat_id` int(11) DEFAULT '0' COMMENT '分类id',
  `cat_id` int(10) DEFAULT '0' COMMENT '分类id',
  `is_hot` tinyint(1) DEFAULT '0' COMMENT '是否推荐',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=375 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_cart
-- ----------------------------
DROP TABLE IF EXISTS `tp_cart`;
CREATE TABLE `tp_cart` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '购物车表',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `session_id` char(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'session',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `goods_sn` varchar(60) NOT NULL DEFAULT '' COMMENT '商品货号',
  `goods_name` varchar(120) NOT NULL DEFAULT '' COMMENT '商品名称',
  `market_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '市场价',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '本店价',
  `member_goods_price` decimal(10,2) DEFAULT '0.00' COMMENT '会员折扣价',
  `goods_num` smallint(5) unsigned DEFAULT '0' COMMENT '购买数量',
  `item_id` int(11) DEFAULT '0' COMMENT '规格ID',
  `spec_key` varchar(64) DEFAULT '' COMMENT '商品规格key 对应tp_spec_goods_price 表',
  `spec_key_name` varchar(64) DEFAULT '' COMMENT '商品规格组合名称',
  `bar_code` varchar(64) DEFAULT '' COMMENT '商品条码',
  `selected` tinyint(1) DEFAULT '1' COMMENT '购物车选中状态',
  `add_time` int(11) DEFAULT '0' COMMENT '加入购物车的时间',
  `prom_type` tinyint(1) DEFAULT '0' COMMENT '0 普通订单,1 限时抢购, 2 团购 , 3 促销优惠,7 搭配购',
  `prom_id` int(11) DEFAULT '0' COMMENT '活动id',
  `sku` varchar(128) DEFAULT '' COMMENT 'sku',
  `combination_group_id` int(8) unsigned NOT NULL DEFAULT '0' COMMENT ' 搭配购的组id/cart_id',
  PRIMARY KEY (`id`),
  KEY `session_id` (`session_id`),
  KEY `user_id` (`user_id`),
  KEY `goods_id` (`goods_id`),
  KEY `spec_key` (`spec_key`)
) ENGINE=InnoDB AUTO_INCREMENT=558 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_combination
-- ----------------------------
DROP TABLE IF EXISTS `tp_combination`;
CREATE TABLE `tp_combination` (
  `combination_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `desc` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `is_on_sale` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '上下架，0下，1上',
  `start_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '活动有效起始时间',
  `end_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '活动有效截止时间',
  PRIMARY KEY (`combination_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='组合促销表';

-- ----------------------------
-- Table structure for tp_combination_goods
-- ----------------------------
DROP TABLE IF EXISTS `tp_combination_goods`;
CREATE TABLE `tp_combination_goods` (
  `combination_id` int(10) NOT NULL,
  `goods_name` varchar(255) NOT NULL DEFAULT '' COMMENT '商品名称',
  `key_name` varchar(255) NOT NULL DEFAULT '' COMMENT '规格名称',
  `goods_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `original_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '原价/商城价',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '优惠价格',
  `is_master` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1主0从'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='组合促销商品映射关系表';

-- ----------------------------
-- Table structure for tp_comment
-- ----------------------------
DROP TABLE IF EXISTS `tp_comment`;
CREATE TABLE `tp_comment` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `email` varchar(60) NOT NULL DEFAULT '' COMMENT 'email邮箱',
  `username` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `content` text NOT NULL COMMENT '评论内容',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `ip_address` varchar(15) NOT NULL DEFAULT '' COMMENT 'ip地址',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否显示',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论用户',
  `img` text COMMENT '晒单图片',
  `order_id` mediumint(8) DEFAULT '0' COMMENT '订单id',
  `deliver_rank` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '物流评价等级',
  `goods_rank` tinyint(1) DEFAULT '0' COMMENT '商品评价等级',
  `service_rank` tinyint(1) DEFAULT '0' COMMENT '商家服务态度评价等级',
  `zan_num` int(10) NOT NULL DEFAULT '0' COMMENT '被赞数',
  `zan_userid` varchar(255) NOT NULL DEFAULT '' COMMENT '点赞用户id',
  `is_anonymous` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否匿名评价:0不是，1是',
  `rec_id` int(11) DEFAULT NULL COMMENT '订单商品表ID',
  `sort` int(4) unsigned NOT NULL DEFAULT '100' COMMENT '排序',
  PRIMARY KEY (`comment_id`),
  KEY `parent_id` (`parent_id`),
  KEY `id_value` (`goods_id`),
  KEY `order_id` (`order_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_company
-- ----------------------------
DROP TABLE IF EXISTS `tp_company`;
CREATE TABLE `tp_company` (
  `company_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '企业id',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `code` varchar(20) NOT NULL DEFAULT '' COMMENT 'ERP中的code',
  `name` varchar(55) NOT NULL DEFAULT '' COMMENT '企业名称',
  `type` int(2) unsigned NOT NULL DEFAULT '1' COMMENT '二级类型：1自用, 2经销',
  `source` int(2) unsigned NOT NULL DEFAULT '1' COMMENT '获得来源：1其他, 2朋友推荐, 3公众号, 4朋友圈, 5官网',
  `source_other` varchar(200) NOT NULL DEFAULT '' COMMENT '其他来源',
  `recommend_mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '推荐人手机号',
  `recommend_name` varchar(100) NOT NULL DEFAULT '' COMMENT '推荐人企业名称',
  `tags` varchar(100) NOT NULL DEFAULT '' COMMENT '标签',
  `contacts` varchar(255) NOT NULL DEFAULT '' COMMENT '联系人',
  `phone` varchar(20) NOT NULL COMMENT '联系电话',
  `detail_address` varchar(255) NOT NULL COMMENT '详细地址',
  `license_img` varchar(255) NOT NULL DEFAULT '' COMMENT '营业执照',
  `authorization_img` varchar(255) NOT NULL DEFAULT '' COMMENT '授权委托书',
  `auditing` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否审核  0：待审核  1：审核通过  2：审核不通过',
  `failure_note` varchar(255) NOT NULL DEFAULT '' COMMENT '驳回原因',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除  0：未删除 1：已删除',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`company_id`),
  UNIQUE KEY `user_id` (`user_id`) USING BTREE,
  KEY `code` (`code`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=683 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_config
-- ----------------------------
DROP TABLE IF EXISTS `tp_config`;
CREATE TABLE `tp_config` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `name` varchar(50) DEFAULT NULL COMMENT '配置的key键名',
  `value` varchar(512) DEFAULT NULL COMMENT '配置的val值',
  `inc_type` varchar(64) DEFAULT NULL COMMENT '配置分组',
  `desc` varchar(50) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=220 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_config_copy
-- ----------------------------
DROP TABLE IF EXISTS `tp_config_copy`;
CREATE TABLE `tp_config_copy` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `name` varchar(50) DEFAULT NULL COMMENT '配置的key键名',
  `value` varchar(512) DEFAULT NULL COMMENT '配置的val值',
  `inc_type` varchar(64) DEFAULT NULL COMMENT '配置分组',
  `desc` varchar(50) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=220 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_coupon
-- ----------------------------
DROP TABLE IF EXISTS `tp_coupon`;
CREATE TABLE `tp_coupon` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '表id',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '优惠券名字',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '发放类型 0下单赠送1 指定发放 2 免费领取 3线下发放',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '优惠券金额',
  `condition` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '使用条件',
  `createnum` int(11) DEFAULT '0' COMMENT '发放数量',
  `send_num` int(11) DEFAULT '0' COMMENT '已领取数量',
  `use_num` int(11) DEFAULT '0' COMMENT '已使用数量',
  `send_start_time` int(11) DEFAULT NULL COMMENT '发放开始时间',
  `send_end_time` int(11) DEFAULT NULL COMMENT '发放结束时间',
  `use_start_time` int(11) DEFAULT NULL COMMENT '使用开始时间',
  `use_end_time` int(11) DEFAULT NULL COMMENT '使用结束时间',
  `add_time` int(11) DEFAULT NULL COMMENT '添加时间',
  `status` int(2) DEFAULT NULL COMMENT '状态：1有效,2无效',
  `use_type` tinyint(1) DEFAULT '0' COMMENT '使用范围：0全店通用1指定商品可用2指定分类商品可用',
  PRIMARY KEY (`id`),
  KEY `use_end_time` (`use_end_time`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_coupon_list
-- ----------------------------
DROP TABLE IF EXISTS `tp_coupon_list`;
CREATE TABLE `tp_coupon_list` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '表id',
  `cid` int(8) NOT NULL DEFAULT '0' COMMENT '优惠券 对应coupon表id',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '发放类型 1 按订单发放 2 注册 3 邀请 4 按用户发放',
  `uid` int(8) NOT NULL DEFAULT '0' COMMENT '用户id',
  `order_id` int(8) NOT NULL DEFAULT '0' COMMENT '订单id',
  `get_order_id` int(11) DEFAULT '0' COMMENT '优惠券来自订单ID',
  `use_time` int(11) NOT NULL DEFAULT '0' COMMENT '使用时间',
  `code` varchar(10) DEFAULT '' COMMENT '优惠券兑换码',
  `send_time` int(11) NOT NULL DEFAULT '0' COMMENT '发放时间',
  `status` tinyint(1) DEFAULT '0' COMMENT '0未使用1已使用2已过期',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `uid` (`uid`),
  KEY `code` (`code`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_delivery_doc
-- ----------------------------
DROP TABLE IF EXISTS `tp_delivery_doc`;
CREATE TABLE `tp_delivery_doc` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '发货单ID',
  `order_id` int(11) unsigned NOT NULL COMMENT '订单ID',
  `order_sn` varchar(64) NOT NULL DEFAULT '' COMMENT '订单编号',
  `user_id` int(11) unsigned NOT NULL COMMENT '用户ID',
  `admin_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `consignee` varchar(64) NOT NULL DEFAULT '' COMMENT '收货人',
  `zipcode` varchar(6) DEFAULT NULL COMMENT '邮编',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '联系手机',
  `country` int(11) unsigned NOT NULL COMMENT '国ID',
  `province` int(11) unsigned NOT NULL COMMENT '省ID',
  `city` int(11) unsigned NOT NULL COMMENT '市ID',
  `district` int(11) unsigned NOT NULL COMMENT '区ID',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '地址',
  `shipping_code` varchar(32) DEFAULT NULL COMMENT '物流code',
  `shipping_name` varchar(64) DEFAULT NULL COMMENT '快递名称',
  `shipping_price` decimal(10,2) DEFAULT '0.00' COMMENT '运费',
  `invoice_no` varchar(255) DEFAULT '' COMMENT '物流单号',
  `tel` varchar(64) DEFAULT NULL COMMENT '座机电话',
  `note` text COMMENT '管理员添加的备注信息',
  `best_time` int(11) DEFAULT NULL COMMENT '友好收货时间',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  `send_type` tinyint(1) DEFAULT '0' COMMENT '发货方式0自填快递1在线预约2电子面单3无需物流',
  `group` tinyint(1) DEFAULT '0' COMMENT '0默认为后台管理人员；1供应商，此时此表下的admin_id为suppliers_id',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='发货单';

-- ----------------------------
-- Table structure for tp_distribut_goods
-- ----------------------------
DROP TABLE IF EXISTS `tp_distribut_goods`;
CREATE TABLE `tp_distribut_goods` (
  `user_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `goods_name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `goods_price` decimal(10,2) DEFAULT NULL COMMENT '商品价格',
  `sales` int(11) DEFAULT NULL COMMENT '销量'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分销商销售表';

-- ----------------------------
-- Table structure for tp_distribut_level
-- ----------------------------
DROP TABLE IF EXISTS `tp_distribut_level`;
CREATE TABLE `tp_distribut_level` (
  `level_id` tinyint(2) unsigned NOT NULL AUTO_INCREMENT,
  `level_type` tinyint(1) DEFAULT '0' COMMENT '分销等级类别',
  `rate1` decimal(6,2) DEFAULT '0.00' COMMENT '一级佣金比例',
  `rate2` decimal(6,2) DEFAULT '0.00' COMMENT '二级佣金比例',
  `rate3` decimal(6,2) DEFAULT '0.00' COMMENT '三级佣金比例',
  `order_money` decimal(12,2) DEFAULT '0.00' COMMENT '升级条件',
  `level_name` varchar(30) NOT NULL DEFAULT '',
  `join_price` decimal(10,2) DEFAULT '0.00' COMMENT '加盟资格购买价格',
  `reward` decimal(10,0) DEFAULT '0' COMMENT '推荐奖励',
  `income` smallint(4) DEFAULT '0' COMMENT '同级团队收益',
  `introduction` varchar(255) DEFAULT NULL,
  `level_intro` text,
  `is_switch` tinyint(1) DEFAULT '1' COMMENT '是否开放前台购买',
  PRIMARY KEY (`level_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_expense_log
-- ----------------------------
DROP TABLE IF EXISTS `tp_expense_log`;
CREATE TABLE `tp_expense_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) DEFAULT NULL COMMENT '操作管理员',
  `money` decimal(10,2) DEFAULT NULL COMMENT '支出金额',
  `integral` int(10) DEFAULT '0' COMMENT '赠送积分',
  `type` tinyint(1) DEFAULT '0' COMMENT '支出类型0用户提现,1订单退款,2其他,3注册,4邀请,5分享,6评论,7供应商提现',
  `addtime` int(11) DEFAULT NULL COMMENT '日志记录时间',
  `log_type_id` int(11) DEFAULT '0' COMMENT '业务关联ID',
  `user_id` int(10) DEFAULT '0' COMMENT '涉及会员id',
  `user_name` int(10) DEFAULT '0' COMMENT '涉及用户',
  `suppliers_id` int(11) DEFAULT '0' COMMENT '涉及供应商id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=latin1 COMMENT='平台支出金额或赠送积分日志';

-- ----------------------------
-- Table structure for tp_feedback
-- ----------------------------
DROP TABLE IF EXISTS `tp_feedback`;
CREATE TABLE `tp_feedback` (
  `msg_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '默认自增ID',
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '回复留言ID',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `user_name` varchar(60) NOT NULL DEFAULT '',
  `msg_title` varchar(200) NOT NULL DEFAULT '' COMMENT '留言标题',
  `msg_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '留言类型',
  `msg_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '处理状态',
  `msg_content` text NOT NULL COMMENT '留言内容',
  `msg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '留言时间',
  `message_img` varchar(255) NOT NULL DEFAULT '',
  `order_id` int(11) unsigned NOT NULL DEFAULT '0',
  `msg_area` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`msg_id`),
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_file
-- ----------------------------
DROP TABLE IF EXISTS `tp_file`;
CREATE TABLE `tp_file` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL DEFAULT '0' COMMENT '相册分类',
  `path` varchar(150) NOT NULL DEFAULT '' COMMENT '文件路径',
  `size` int(11) NOT NULL COMMENT '文件大小',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '文件名称',
  `file_name` varchar(100) NOT NULL DEFAULT '' COMMENT '文件保存名称',
  `type` varchar(10) NOT NULL COMMENT '文件类型 img video',
  `mini` varchar(50) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `source` varchar(10) NOT NULL DEFAULT '' COMMENT '文件来源',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '文件状态  0 删除 1 正常',
  `createtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `domain` varchar(50) NOT NULL DEFAULT '' COMMENT '域名',
  PRIMARY KEY (`file_id`)
) ENGINE=MyISAM AUTO_INCREMENT=172 DEFAULT CHARSET=utf8 COMMENT='上传文件列表';

-- ----------------------------
-- Table structure for tp_flash_sale
-- ----------------------------
DROP TABLE IF EXISTS `tp_flash_sale`;
CREATE TABLE `tp_flash_sale` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL DEFAULT '' COMMENT '活动标题',
  `goods_id` int(10) NOT NULL COMMENT '参团商品ID',
  `item_id` bigint(20) DEFAULT '0' COMMENT '对应spec_goods_price商品规格id',
  `price` float(10,2) NOT NULL COMMENT '活动价格',
  `goods_num` int(10) DEFAULT '1' COMMENT '商品参加活动数',
  `buy_limit` int(11) NOT NULL DEFAULT '1' COMMENT '每人限购数',
  `time_limit` int(5) NOT NULL DEFAULT '30' COMMENT '订单有效期-分钟(N分钟未付款有效)',
  `buy_num` int(11) NOT NULL DEFAULT '0' COMMENT '已购买人数',
  `order_num` int(10) DEFAULT '0' COMMENT '已下单数',
  `description` text COMMENT '活动描述',
  `start_time` int(11) NOT NULL COMMENT '开始时间',
  `end_time` int(11) NOT NULL COMMENT '结束时间',
  `is_end` tinyint(1) DEFAULT '0' COMMENT '是否已结束',
  `goods_name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_form
-- ----------------------------
DROP TABLE IF EXISTS `tp_form`;
CREATE TABLE `tp_form` (
  `form_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tpl_timeid` bigint(11) unsigned NOT NULL COMMENT '序号',
  `form_name` varchar(255) NOT NULL COMMENT '表单名称',
  `mobile` varchar(16) NOT NULL DEFAULT '' COMMENT '手机号',
  `submit_value` text NOT NULL COMMENT '提交内容',
  `submit_time` int(10) unsigned NOT NULL COMMENT '提交时间',
  PRIMARY KEY (`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_form_config
-- ----------------------------
DROP TABLE IF EXISTS `tp_form_config`;
CREATE TABLE `tp_form_config` (
  `form_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tpl_id` int(11) unsigned DEFAULT NULL COMMENT '关联tp_mobile_template.id',
  `tpl_timeid` bigint(11) unsigned NOT NULL COMMENT '序号',
  `form_name` varchar(255) NOT NULL COMMENT '表单名称',
  `config_value` text NOT NULL COMMENT '配置值',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  `industry_id` int(11) unsigned DEFAULT NULL COMMENT '可能关联行业模板tp_industry_template.id',
  PRIMARY KEY (`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_freight_config
-- ----------------------------
DROP TABLE IF EXISTS `tp_freight_config`;
CREATE TABLE `tp_freight_config` (
  `config_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置id',
  `first_unit` double(16,4) NOT NULL DEFAULT '0.0000' COMMENT '首(重：体积：件）',
  `first_money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '首(重：体积：件）运费',
  `continue_unit` double(16,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '继续加（件：重量：体积）区间',
  `continue_money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '继续加（件：重量：体积）的运费',
  `template_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '运费模板ID',
  `is_default` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否是默认运费配置.0不是，1是',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COMMENT='运费配置表';

-- ----------------------------
-- Table structure for tp_freight_region
-- ----------------------------
DROP TABLE IF EXISTS `tp_freight_region`;
CREATE TABLE `tp_freight_region` (
  `template_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '模板id',
  `config_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '运费模板配置ID',
  `region_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'region表id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_freight_template
-- ----------------------------
DROP TABLE IF EXISTS `tp_freight_template`;
CREATE TABLE `tp_freight_template` (
  `template_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '运费模板ID',
  `template_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板名称',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 件数；1 商品重量；2 商品体积',
  `is_enable_default` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否启用使用默认运费配置,0:不启用，1:启用',
  PRIMARY KEY (`template_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='运费模板表';

-- ----------------------------
-- Table structure for tp_friend_link
-- ----------------------------
DROP TABLE IF EXISTS `tp_friend_link`;
CREATE TABLE `tp_friend_link` (
  `link_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `link_name` varchar(255) NOT NULL DEFAULT '' COMMENT '链接名称',
  `link_url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `link_logo` varchar(255) NOT NULL DEFAULT '' COMMENT '链接logo',
  `orderby` tinyint(3) unsigned NOT NULL DEFAULT '50' COMMENT '排序',
  `is_show` tinyint(1) DEFAULT '1' COMMENT '是否显示',
  `target` tinyint(1) DEFAULT '1' COMMENT '是否新窗口打开',
  PRIMARY KEY (`link_id`),
  KEY `show_order` (`orderby`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_goods
-- ----------------------------
DROP TABLE IF EXISTS `tp_goods`;
CREATE TABLE `tp_goods` (
  `goods_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `cat_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `extend_cat_id` int(11) DEFAULT '0' COMMENT '扩展分类id',
  `goods_sn` varchar(60) NOT NULL DEFAULT '' COMMENT '商品编号',
  `goods_name` varchar(120) NOT NULL DEFAULT '' COMMENT '商品名称',
  `click_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击数',
  `brand_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '品牌id',
  `store_count` smallint(5) unsigned NOT NULL DEFAULT '10' COMMENT '库存数量',
  `comment_count` smallint(5) DEFAULT '0' COMMENT '商品评论数',
  `weight` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商品重量克为单位',
  `volume` double(10,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '商品体积。单位立方米',
  `market_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '市场价',
  `min_num` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '起订量',
  `distribut_type` tinyint(1) NOT NULL DEFAULT '2' COMMENT '合作类型:1必经营, 2可选',
  `shop_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '本店价',
  `cost_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品成本价',
  `price_ladder` text COMMENT '价格阶梯',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '商品关键词',
  `goods_remark` varchar(255) NOT NULL DEFAULT '' COMMENT '商品简单描述',
  `goods_content` text COMMENT '商品详细描述',
  `mobile_content` text COMMENT '手机端商品详情',
  `original_img` varchar(255) NOT NULL DEFAULT '' COMMENT '商品上传原始图',
  `is_virtual` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否为虚拟商品 0为实物 1电子卡券 2预约 3外卖',
  `virtual_indate` int(11) DEFAULT '0' COMMENT '虚拟商品有效期',
  `virtual_limit` smallint(6) DEFAULT '0' COMMENT '虚拟商品购买上限',
  `virtual_refund` tinyint(1) DEFAULT '1' COMMENT '是否允许过期退款， 1是，0否',
  `virtual_sales_sum` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '虚拟销售量',
  `virtual_collect_sum` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '虚拟收藏量',
  `virtual_comment_count` int(11) unsigned DEFAULT '0' COMMENT '虚拟商品评论数',
  `collect_sum` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '收藏量',
  `is_on_sale` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否上架',
  `is_free_shipping` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否包邮0否1是',
  `sort` smallint(4) unsigned NOT NULL DEFAULT '50' COMMENT '商品排序',
  `is_recommend` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `is_new` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否新品',
  `is_hot` tinyint(1) DEFAULT '0' COMMENT '是否热卖',
  `last_update` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后更新时间',
  `goods_type` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '商品所属类型id，取值表goods_type的cat_id',
  `give_integral` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '购买商品赠送积分',
  `exchange_integral` int(10) NOT NULL DEFAULT '0' COMMENT '积分兑换：0不参与积分兑换，积分和现金的兑换比例见后台配置',
  `suppliers_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '供货商ID',
  `sales_sum` int(11) DEFAULT '0' COMMENT '商品销量',
  `prom_type` tinyint(1) DEFAULT '0' COMMENT '0默认1抢购2团购3优惠促销4预售5虚拟(5其实没用)6拼团7搭配购8砍价',
  `prom_id` int(11) NOT NULL DEFAULT '0' COMMENT '优惠活动id',
  `commission` decimal(10,2) DEFAULT '0.00' COMMENT '佣金用于分销分成',
  `spu` varchar(128) DEFAULT '' COMMENT 'SPU',
  `sku` varchar(128) DEFAULT '' COMMENT 'SKU',
  `template_id` int(11) unsigned DEFAULT '0' COMMENT '运费模板ID',
  `video` varchar(255) DEFAULT '' COMMENT '视频',
  `label_id` varchar(255) DEFAULT NULL COMMENT '商品标签',
  `bespeak_template_id` int(11) DEFAULT '0' COMMENT '预约模板id',
  `invalid_refund` tinyint(1) DEFAULT '0' COMMENT '1为过期失效，2过期可退款(可继续使用商家协调)',
  `audit` tinyint(1) DEFAULT '0' COMMENT '0审核通过，1待审核，2未通过',
  PRIMARY KEY (`goods_id`),
  KEY `goods_sn` (`goods_sn`),
  KEY `cat_id` (`cat_id`),
  KEY `last_update` (`last_update`),
  KEY `brand_id` (`brand_id`),
  KEY `goods_number` (`store_count`),
  KEY `goods_weight` (`weight`),
  KEY `sort_order` (`sort`)
) ENGINE=MyISAM AUTO_INCREMENT=3034 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_goods_activity
-- ----------------------------
DROP TABLE IF EXISTS `tp_goods_activity`;
CREATE TABLE `tp_goods_activity` (
  `act_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '活动ID',
  `act_name` varchar(255) NOT NULL DEFAULT '' COMMENT '活动名称',
  `act_desc` text NOT NULL COMMENT '活动描述',
  `act_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '活动类型:1预售2拼团',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '参加活动商品ID',
  `spec_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商品规格ID',
  `goods_name` varchar(255) NOT NULL DEFAULT '' COMMENT '商品名称',
  `start_time` int(10) unsigned NOT NULL COMMENT '活动开始时间',
  `end_time` int(10) unsigned NOT NULL COMMENT '活动结束时间',
  `is_finished` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否已结束:0,正常；1,成功结束；2，失败结束。',
  `ext_info` text NOT NULL COMMENT '活动扩展配置',
  `act_count` mediumint(8) NOT NULL DEFAULT '0' COMMENT '商品购买数',
  PRIMARY KEY (`act_id`),
  KEY `act_name` (`act_name`,`act_type`,`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_goods_attr
-- ----------------------------
DROP TABLE IF EXISTS `tp_goods_attr`;
CREATE TABLE `tp_goods_attr` (
  `goods_attr_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品属性id自增',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `attr_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '属性id',
  `attr_value` text NOT NULL COMMENT '属性值',
  `attr_price` varchar(255) NOT NULL DEFAULT '' COMMENT '属性价格',
  PRIMARY KEY (`goods_attr_id`),
  KEY `goods_id` (`goods_id`),
  KEY `attr_id` (`attr_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3224 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_goods_attribute
-- ----------------------------
DROP TABLE IF EXISTS `tp_goods_attribute`;
CREATE TABLE `tp_goods_attribute` (
  `attr_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '属性id',
  `attr_name` varchar(60) NOT NULL DEFAULT '' COMMENT '属性名称',
  `type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '属性分类id',
  `attr_index` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否显示0不显示1显示',
  `attr_values` text NOT NULL COMMENT '可选值列表',
  `order` tinyint(3) unsigned NOT NULL DEFAULT '50' COMMENT '属性排序',
  PRIMARY KEY (`attr_id`),
  KEY `cat_id` (`type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=284 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_goods_category
-- ----------------------------
DROP TABLE IF EXISTS `tp_goods_category`;
CREATE TABLE `tp_goods_category` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品分类id',
  `name` varchar(90) NOT NULL DEFAULT '' COMMENT '商品分类名称',
  `mobile_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '手机端显示的商品分类名',
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `parent_id_path` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '家族图谱',
  `level` tinyint(1) DEFAULT '0' COMMENT '等级',
  `sort_order` tinyint(1) unsigned NOT NULL DEFAULT '50' COMMENT '顺序排序',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `image` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '分类图片',
  `is_hot` tinyint(1) DEFAULT '0' COMMENT '是否推荐为热门分类',
  `cat_group` tinyint(1) DEFAULT '0' COMMENT '分类分组默认0',
  `commission_rate` tinyint(1) DEFAULT '0' COMMENT '分佣比例',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1121 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_goods_collect
-- ----------------------------
DROP TABLE IF EXISTS `tp_goods_collect`;
CREATE TABLE `tp_goods_collect` (
  `collect_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`collect_id`),
  KEY `user_id` (`user_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_goods_consult
-- ----------------------------
DROP TABLE IF EXISTS `tp_goods_consult`;
CREATE TABLE `tp_goods_consult` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品咨询id',
  `goods_id` int(11) DEFAULT '0' COMMENT '商品id',
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '网名',
  `add_time` int(11) DEFAULT '0' COMMENT '咨询时间',
  `consult_type` tinyint(1) DEFAULT '1' COMMENT '1 商品咨询 2 支付咨询 3 配送 4 售后',
  `content` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '咨询内容',
  `parent_id` int(11) DEFAULT '0' COMMENT '父id 用于管理员回复',
  `is_show` tinyint(1) DEFAULT '0' COMMENT '是否显示',
  `status` tinyint(1) DEFAULT '0' COMMENT '管理员回复状态，0未回复，1已回复',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tp_goods_coupon
-- ----------------------------
DROP TABLE IF EXISTS `tp_goods_coupon`;
CREATE TABLE `tp_goods_coupon` (
  `coupon_id` int(8) NOT NULL COMMENT '优惠券id',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '指定的商品id：为零表示不指定商品',
  `goods_category_id` smallint(5) NOT NULL DEFAULT '0' COMMENT '指定的商品分类：为零表示不指定分类',
  PRIMARY KEY (`coupon_id`,`goods_id`,`goods_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tp_goods_images
-- ----------------------------
DROP TABLE IF EXISTS `tp_goods_images`;
CREATE TABLE `tp_goods_images` (
  `img_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '图片id 自增',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `image_url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片地址',
  PRIMARY KEY (`img_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3645 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_goods_label
-- ----------------------------
DROP TABLE IF EXISTS `tp_goods_label`;
CREATE TABLE `tp_goods_label` (
  `label_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `label_name` varchar(120) NOT NULL DEFAULT '' COMMENT '标签名称',
  `sort` smallint(4) unsigned NOT NULL DEFAULT '50' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`label_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品标签';

-- ----------------------------
-- Table structure for tp_goods_remark
-- ----------------------------
DROP TABLE IF EXISTS `tp_goods_remark`;
CREATE TABLE `tp_goods_remark` (
  `remark_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '索引',
  `goods_id` int(11) NOT NULL COMMENT '对应商品id',
  `content` text COMMENT '备注内容',
  `type` tinyint(1) DEFAULT '0' COMMENT '可拓展：0审核通过商品说明；1待审核商品说明；2审核未通过商品说明',
  PRIMARY KEY (`remark_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品备注';

-- ----------------------------
-- Table structure for tp_goods_type
-- ----------------------------
DROP TABLE IF EXISTS `tp_goods_type`;
CREATE TABLE `tp_goods_type` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id自增',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '类型名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_goods_visit
-- ----------------------------
DROP TABLE IF EXISTS `tp_goods_visit`;
CREATE TABLE `tp_goods_visit` (
  `visit_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `user_id` int(11) NOT NULL COMMENT '会员ID',
  `visittime` int(11) NOT NULL COMMENT '浏览时间',
  `cat_id` int(11) NOT NULL COMMENT '商品分类ID',
  `extend_cat_id` int(11) NOT NULL COMMENT '商品扩展分类ID',
  PRIMARY KEY (`goods_id`,`user_id`,`visit_id`),
  KEY `visit_id` (`visit_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3266 DEFAULT CHARSET=utf8 COMMENT='商品浏览历史表';

-- ----------------------------
-- Table structure for tp_group_buy
-- ----------------------------
DROP TABLE IF EXISTS `tp_group_buy`;
CREATE TABLE `tp_group_buy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '团购ID',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '活动名称',
  `start_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `item_id` bigint(20) DEFAULT '0' COMMENT '对应spec_goods_price商品规格id',
  `price` decimal(10,2) NOT NULL COMMENT '团购价格',
  `goods_num` int(10) DEFAULT '0' COMMENT '商品参团数',
  `buy_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品已购买数',
  `order_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '已下单人数',
  `virtual_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '虚拟购买数',
  `rebate` decimal(10,1) NOT NULL COMMENT '折扣',
  `intro` text COMMENT '本团介绍',
  `goods_price` decimal(10,2) NOT NULL COMMENT '商品原价',
  `goods_name` varchar(200) NOT NULL DEFAULT '' COMMENT '商品名称',
  `recommended` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐 0.未推荐 1.已推荐',
  `views` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '查看次数',
  `is_end` tinyint(1) DEFAULT '0' COMMENT '是否结束',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='团购商品表';

-- ----------------------------
-- Table structure for tp_hijack
-- ----------------------------
DROP TABLE IF EXISTS `tp_hijack`;
CREATE TABLE `tp_hijack` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `hijack_url` varchar(255) DEFAULT NULL COMMENT '劫持URL',
  `page_url` varchar(255) DEFAULT NULL COMMENT '发生页面url',
  `add_time` int(15) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_industry_template
-- ----------------------------
DROP TABLE IF EXISTS `tp_industry_template`;
CREATE TABLE `tp_industry_template` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `industry_id` int(11) unsigned NOT NULL COMMENT '行业id',
  `style_id` int(11) unsigned NOT NULL COMMENT '风格id',
  `template_name` varchar(64) NOT NULL COMMENT '模板名称',
  `template_html` longtext NOT NULL COMMENT '保存编辑后的HTML',
  `add_time` int(11) unsigned NOT NULL COMMENT '添加时间',
  `block_info` longtext NOT NULL COMMENT '接口数据',
  `thumb` varchar(255) DEFAULT NULL COMMENT '图片展示',
  `code_url` varchar(255) DEFAULT NULL COMMENT '二维码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_invoice
-- ----------------------------
DROP TABLE IF EXISTS `tp_invoice`;
CREATE TABLE `tp_invoice` (
  `invoice_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `invoice_type` tinyint(1) DEFAULT '0' COMMENT '0普通发票1电子发票2增值税发票',
  `invoice_money` decimal(10,2) DEFAULT '0.00' COMMENT '发票金额',
  `invoice_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '发票抬头',
  `invoice_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '发票内容',
  `invoice_rate` decimal(10,4) DEFAULT NULL COMMENT '发票税率',
  `taxpayer` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '纳税人识别号',
  `status` tinyint(1) DEFAULT '0' COMMENT '发票状态0待开1已开2作废',
  `atime` int(11) DEFAULT '0' COMMENT '开票时间',
  `ctime` int(11) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`invoice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1 COMMENT='发票信息表';

-- ----------------------------
-- Table structure for tp_jobs
-- ----------------------------
DROP TABLE IF EXISTS `tp_jobs`;
CREATE TABLE `tp_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_kf_access
-- ----------------------------
DROP TABLE IF EXISTS `tp_kf_access`;
CREATE TABLE `tp_kf_access` (
  `role_id` smallint(6) unsigned NOT NULL,
  `node_id` smallint(6) unsigned NOT NULL,
  `pid` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) NOT NULL,
  `module` varchar(50) DEFAULT NULL,
  KEY `groupId` (`role_id`),
  KEY `nodeId` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_kf_admin
-- ----------------------------
DROP TABLE IF EXISTS `tp_kf_admin`;
CREATE TABLE `tp_kf_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(155) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` smallint(6) unsigned NOT NULL COMMENT '组ID',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态 1:启用 0:禁止',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注说明',
  `last_login_time` int(11) unsigned NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(15) DEFAULT NULL COMMENT '最后登录IP',
  `last_location` varchar(100) DEFAULT NULL COMMENT '最后登录位置',
  `storeid` int(11) unsigned NOT NULL COMMENT '企业id（店铺id）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_kf_answer
-- ----------------------------
DROP TABLE IF EXISTS `tp_kf_answer`;
CREATE TABLE `tp_kf_answer` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `que_id` int(11) unsigned NOT NULL COMMENT '问题id',
  `content` varchar(255) NOT NULL COMMENT '内容',
  `add_time` int(11) unsigned NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_kf_attr_question
-- ----------------------------
DROP TABLE IF EXISTS `tp_kf_attr_question`;
CREATE TABLE `tp_kf_attr_question` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(255) NOT NULL COMMENT '问题分类名称',
  `pid` int(11) unsigned NOT NULL COMMENT '父分类id',
  `storeid` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '所属店铺id',
  `add_time` int(11) unsigned NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_kf_chatlog
-- ----------------------------
DROP TABLE IF EXISTS `tp_kf_chatlog`;
CREATE TABLE `tp_kf_chatlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_id` varchar(55) NOT NULL COMMENT '网页用户随机编号(仅为记录参考记录)',
  `kefu_id` varchar(55) NOT NULL COMMENT '客服的id',
  `content` text NOT NULL COMMENT '发送的内容',
  `timeline` int(10) NOT NULL COMMENT '记录时间',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除  0：未删除 1：已删除',
  `need_send` tinyint(1) DEFAULT '0' COMMENT '0 不需要推送 1 需要推送',
  `from_name` varchar(155) NOT NULL DEFAULT '' COMMENT '消息来源用户名',
  `to_name` varchar(155) NOT NULL DEFAULT '' COMMENT '接收消息用户名',
  `storeid` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '店铺id',
  `store_name` varchar(50) NOT NULL COMMENT '客服所属店铺名称',
  PRIMARY KEY (`id`),
  KEY `fromid` (`from_id`(4)),
  KEY `toid` (`kefu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_kf_kefu
-- ----------------------------
DROP TABLE IF EXISTS `tp_kf_kefu`;
CREATE TABLE `tp_kf_kefu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(155) DEFAULT NULL,
  `pwd` varchar(155) DEFAULT NULL COMMENT '密码',
  `sign` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0' COMMENT '0下线 1在线',
  `storeid` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '店铺id，默认1',
  `Auditing` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否审核  0：待审核  1：审核通过  2：审核不通过',
  `store_name` varchar(50) NOT NULL COMMENT '客服所属店铺名称',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除  0：未删除 1：已删除',
  `role` smallint(6) unsigned NOT NULL DEFAULT '5' COMMENT '组ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_kf_node
-- ----------------------------
DROP TABLE IF EXISTS `tp_kf_node`;
CREATE TABLE `tp_kf_node` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '节点名称',
  `title` varchar(50) NOT NULL COMMENT '菜单名称',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否激活 1：是 2：否',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注说明',
  `pid` smallint(6) unsigned NOT NULL COMMENT '父ID',
  `level` tinyint(1) unsigned NOT NULL COMMENT '节点等级',
  `data` varchar(255) DEFAULT NULL COMMENT '附加参数',
  `sort` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '排序权重',
  `display` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '菜单显示类型 0:不显示 1:导航菜单 2:左侧菜单',
  PRIMARY KEY (`id`),
  KEY `level` (`level`),
  KEY `pid` (`pid`),
  KEY `status` (`status`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_kf_question
-- ----------------------------
DROP TABLE IF EXISTS `tp_kf_question`;
CREATE TABLE `tp_kf_question` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `link` varchar(255) DEFAULT NULL COMMENT '连接',
  `add_time` int(11) unsigned NOT NULL COMMENT '添加时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用 0 ：不启用  1：启用',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `storeid` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '店铺id',
  `is_host` tinyint(1) unsigned NOT NULL COMMENT '是否热门  0：否 1：是',
  `is_common` tinyint(1) unsigned NOT NULL COMMENT '是否常见 0：否 1：是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='问题分类表';

-- ----------------------------
-- Table structure for tp_kf_robot
-- ----------------------------
DROP TABLE IF EXISTS `tp_kf_robot`;
CREATE TABLE `tp_kf_robot` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `robot_name` varchar(32) NOT NULL COMMENT '名称',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `storeid` int(11) unsigned NOT NULL COMMENT '店铺id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_kf_role
-- ----------------------------
DROP TABLE IF EXISTS `tp_kf_role`;
CREATE TABLE `tp_kf_role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '后台组名',
  `pid` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `status` tinyint(1) unsigned DEFAULT '0' COMMENT '是否激活 1：是 0：否',
  `sort` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '排序权重',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注说明',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_kf_role_user
-- ----------------------------
DROP TABLE IF EXISTS `tp_kf_role_user`;
CREATE TABLE `tp_kf_role_user` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` smallint(6) unsigned NOT NULL,
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_kf_slogan
-- ----------------------------
DROP TABLE IF EXISTS `tp_kf_slogan`;
CREATE TABLE `tp_kf_slogan` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '提示语id主键',
  `slogan` varchar(55) DEFAULT NULL COMMENT '标语（客服加载欢迎语）',
  `slogan_status` tinyint(1) unsigned DEFAULT '1' COMMENT '提示语状态  0：不开启  1：开启',
  `auditing` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否审核提示语  0：待审核  1：审核通过  2：审核不通过',
  `timeline` int(11) unsigned DEFAULT NULL COMMENT '提示语设置时间',
  `storeid` int(11) unsigned NOT NULL COMMENT '提示语所属店铺id',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除  0：未删除 1：已删除',
  `kefuid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '客服id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_kf_store
-- ----------------------------
DROP TABLE IF EXISTS `tp_kf_store`;
CREATE TABLE `tp_kf_store` (
  `storeid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '店铺id',
  `store_name` varchar(55) NOT NULL COMMENT '店铺名称',
  `avatar` varchar(255) NOT NULL COMMENT '店铺头像',
  `auditing` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否审核  0：待审核  1：审核通过  2：审核不通过',
  `timeline` int(11) unsigned DEFAULT NULL COMMENT '提示语设置时间',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除  0：未删除 1：已删除',
  `webid` varchar(255) NOT NULL COMMENT '网站域名',
  `phone` char(11) NOT NULL COMMENT '企业电话',
  `city` varchar(255) NOT NULL COMMENT '企业地址',
  `email` varchar(255) NOT NULL COMMENT '企业邮箱',
  PRIMARY KEY (`storeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_kf_suggest
-- ----------------------------
DROP TABLE IF EXISTS `tp_kf_suggest`;
CREATE TABLE `tp_kf_suggest` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '客户意见反馈主键id',
  `storeid` int(11) unsigned NOT NULL COMMENT '店铺id',
  `kehuid` varchar(255) NOT NULL COMMENT '客户id',
  `is_satisfied` tinyint(1) unsigned NOT NULL DEFAULT '3' COMMENT '满意度 0：很不满意  1：不满意 2：一般 3：满意 4：非常满意',
  `suggest` varchar(255) DEFAULT NULL COMMENT '建议',
  `timeline` int(11) unsigned DEFAULT NULL COMMENT '反馈时间',
  `is_delete` tinyint(1) unsigned NOT NULL COMMENT '是否删除  0：未删除   1：已删除',
  `kefu_id` int(11) unsigned NOT NULL COMMENT '客服id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户意见表';

-- ----------------------------
-- Table structure for tp_kf_weixin_merchant
-- ----------------------------
DROP TABLE IF EXISTS `tp_kf_weixin_merchant`;
CREATE TABLE `tp_kf_weixin_merchant` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '联关v1_store表主键',
  `storeid` int(11) DEFAULT NULL,
  `wx_type` tinyint(1) DEFAULT '0' COMMENT '众公号类型',
  `wx_url` varchar(100) DEFAULT NULL,
  `wx_token` varchar(50) DEFAULT NULL,
  `wx_EncodingAESKey` varchar(50) DEFAULT NULL COMMENT '消息加密密钥',
  `wx_raw_id` varchar(30) DEFAULT NULL COMMENT '微信原始ID',
  `wx_AppId` varchar(20) DEFAULT NULL,
  `wx_AppSecret` varchar(50) DEFAULT NULL,
  `wx_Random` tinyint(1) DEFAULT '0' COMMENT '是否随机回复',
  `wx_Subscribe` text COMMENT '关注后的回复',
  `wx_NoneReply` text COMMENT '无匹配时的回复',
  `media_id` varchar(255) DEFAULT NULL COMMENT '关注回复',
  `media_id2` varchar(255) DEFAULT NULL COMMENT '无匹配回复',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_logistics_code
-- ----------------------------
DROP TABLE IF EXISTS `tp_logistics_code`;
CREATE TABLE `tp_logistics_code` (
  `coding_id` int(11) NOT NULL AUTO_INCREMENT,
  `logistics_id` tinyint(4) NOT NULL DEFAULT '0' COMMENT '物流资源ID',
  `name` varchar(8) NOT NULL DEFAULT '' COMMENT '快递公司名称',
  `coding` varchar(20) NOT NULL DEFAULT '' COMMENT '快递编码',
  `shorthand` varchar(15) NOT NULL DEFAULT '' COMMENT '简写',
  PRIMARY KEY (`coding_id`),
  KEY `kind_id` (`logistics_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='快递公司编码表';

-- ----------------------------
-- Table structure for tp_menu_cfg
-- ----------------------------
DROP TABLE IF EXISTS `tp_menu_cfg`;
CREATE TABLE `tp_menu_cfg` (
  `menu_id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(100) NOT NULL DEFAULT '' COMMENT '自定义名称',
  `default_name` varchar(100) NOT NULL DEFAULT '' COMMENT '默认名称',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否显示',
  `is_tab` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否切块',
  `menu_url` varchar(255) NOT NULL DEFAULT '' COMMENT '手机端url',
  `mini_url` varchar(255) NOT NULL DEFAULT '' COMMENT '小程序链接',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for tp_message
-- ----------------------------
DROP TABLE IF EXISTS `tp_message`;
CREATE TABLE `tp_message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '管理者id',
  `message` text NOT NULL COMMENT '站内信内容',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '个体消息：0，全体消息1',
  `category` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT ' 系统消息：0，活动消息：1',
  `send_time` int(10) unsigned NOT NULL COMMENT '发送时间',
  `data` text COMMENT '消息序列化内容',
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_message_activity
-- ----------------------------
DROP TABLE IF EXISTS `tp_message_activity`;
CREATE TABLE `tp_message_activity` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `message_title` varchar(255) NOT NULL COMMENT '消息标题',
  `message_content` text COMMENT '消息内容',
  `img_uri` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `send_time` int(10) unsigned NOT NULL COMMENT '发送时间',
  `end_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '活动结束时间',
  `mmt_code` varchar(50) NOT NULL COMMENT '用户消息模板编号',
  `prom_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1抢购2团购3优惠促销4预售5虚拟6拼团7搭配购8自定义图文消息9订单促销',
  `prom_id` int(11) NOT NULL DEFAULT '0' COMMENT '活动id',
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='活动消息表';

-- ----------------------------
-- Table structure for tp_message_logistics
-- ----------------------------
DROP TABLE IF EXISTS `tp_message_logistics`;
CREATE TABLE `tp_message_logistics` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `message_title` varchar(255) DEFAULT NULL COMMENT '消息标题',
  `message_content` text NOT NULL COMMENT '消息内容',
  `img_uri` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `send_time` int(10) unsigned NOT NULL COMMENT '发送时间',
  `order_sn` varchar(20) NOT NULL DEFAULT '' COMMENT '单号',
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '物流订单id',
  `mmt_code` varchar(50) DEFAULT NULL COMMENT '用户消息模板编号',
  `type` tinyint(1) unsigned DEFAULT '0' COMMENT '1到货通知2发货提醒3签收提醒4评价提醒5退货提醒6退款提醒7虚拟商品',
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='物流消息表';

-- ----------------------------
-- Table structure for tp_message_notice
-- ----------------------------
DROP TABLE IF EXISTS `tp_message_notice`;
CREATE TABLE `tp_message_notice` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `message_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '个体消息：0，全体消息:1',
  `message_title` varchar(255) DEFAULT NULL COMMENT '消息标题',
  `message_content` text NOT NULL COMMENT '消息内容',
  `send_time` int(10) unsigned NOT NULL COMMENT '发送时间',
  `mmt_code` varchar(50) DEFAULT NULL COMMENT '用户消息模板编号',
  `type` tinyint(1) unsigned DEFAULT '0' COMMENT '0系统公告1降价通知2优惠券到账提醒3优惠券使用提醒4优惠券即将过期提醒5预售订单尾款支付提醒6提现到账提醒',
  `prom_id` int(11) NOT NULL DEFAULT '0' COMMENT '活动id',
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='通知消息表';

-- ----------------------------
-- Table structure for tp_message_private
-- ----------------------------
DROP TABLE IF EXISTS `tp_message_private`;
CREATE TABLE `tp_message_private` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `message_content` text NOT NULL COMMENT '消息内容',
  `send_time` int(10) unsigned NOT NULL COMMENT '发送时间',
  `send_user_id` mediumint(8) unsigned NOT NULL COMMENT '发送者',
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='私信消息表';

-- ----------------------------
-- Table structure for tp_mobile_block_info
-- ----------------------------
DROP TABLE IF EXISTS `tp_mobile_block_info`;
CREATE TABLE `tp_mobile_block_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `block_id` int(11) NOT NULL COMMENT '所属板块id',
  `block_type` int(8) unsigned NOT NULL COMMENT '板块类型',
  `title` varchar(120) DEFAULT NULL COMMENT '标题、描述、文字内容',
  `block_content` varchar(255) DEFAULT NULL COMMENT '其它信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_mobile_template
-- ----------------------------
DROP TABLE IF EXISTS `tp_mobile_template`;
CREATE TABLE `tp_mobile_template` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `is_index` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否设为首页 0否 1是',
  `template_name` varchar(64) NOT NULL COMMENT '模板名称',
  `template_html` longtext NOT NULL COMMENT '保存编辑后的HTML',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示 0不显示  1显示',
  `add_time` int(11) unsigned NOT NULL COMMENT '添加时间',
  `block_info` longtext NOT NULL COMMENT '接口数据',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '模板类型 0内页  1首页',
  `thumb` varchar(70) DEFAULT NULL COMMENT '模板缩略图',
  `style_id` int(11) DEFAULT '0' COMMENT '从模板库中添加风格id，',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_moments
-- ----------------------------
DROP TABLE IF EXISTS `tp_moments`;
CREATE TABLE `tp_moments` (
  `moments_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '动态id',
  `user_id` int(11) unsigned NOT NULL COMMENT '用户id',
  `moments_imgs` text COMMENT '图片集合',
  `moments_content` text COMMENT '动态内容',
  `moments_remark` varchar(255) NOT NULL DEFAULT '' COMMENT '审核备注',
  `like_sum` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '点赞量',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0待审核，1通过，2不通过',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0正常显示，1虚拟删除不显示',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '发表时间',
  PRIMARY KEY (`moments_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_moments_comment
-- ----------------------------
DROP TABLE IF EXISTS `tp_moments_comment`;
CREATE TABLE `tp_moments_comment` (
  `comment_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `user_id` int(11) unsigned NOT NULL COMMENT '用户id',
  `moments_id` int(11) unsigned NOT NULL COMMENT '动态id',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '回复评论上级id',
  `p_name` varchar(20) NOT NULL DEFAULT '' COMMENT '回复上级的用户名称',
  `comment_content` text COMMENT '回复内容',
  `comment_remark` varchar(255) NOT NULL DEFAULT '' COMMENT '审核备注',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0待审核，1通过，2不通过',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0正常显示，1虚拟删除不显示',
  `is_read` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0未读，1已读',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '发表时间',
  PRIMARY KEY (`comment_id`),
  KEY `user_id` (`user_id`),
  KEY `moments_id` (`moments_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_moments_like
-- ----------------------------
DROP TABLE IF EXISTS `tp_moments_like`;
CREATE TABLE `tp_moments_like` (
  `like_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '动态点赞id',
  `user_id` int(11) unsigned NOT NULL COMMENT '用户id',
  `moments_id` int(11) unsigned NOT NULL COMMENT '动态id',
  `is_read` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0未读，1已读',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`like_id`),
  KEY `user_id` (`user_id`),
  KEY `moments_id` (`moments_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_navigation
-- ----------------------------
DROP TABLE IF EXISTS `tp_navigation`;
CREATE TABLE `tp_navigation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '前台导航表',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '导航名称',
  `is_show` tinyint(1) DEFAULT '1' COMMENT '是否显示',
  `is_new` tinyint(1) DEFAULT '1' COMMENT '是否新窗口',
  `sort` smallint(6) DEFAULT '50' COMMENT '排序',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '链接地址',
  `position` enum('top','bottom') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'top' COMMENT '菜单位置，top顶部，bottom底部',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_news
-- ----------------------------
DROP TABLE IF EXISTS `tp_news`;
CREATE TABLE `tp_news` (
  `article_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `cat_id` smallint(5) NOT NULL DEFAULT '0' COMMENT '类别ID',
  `title` varchar(150) NOT NULL DEFAULT '' COMMENT '文章标题',
  `check_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '审核状态 0未审核  1通过 2拒绝',
  `check_describe` mediumtext COMMENT '审核理由描述',
  `tags` char(64) DEFAULT NULL COMMENT '新闻标签',
  `content` longtext NOT NULL,
  `author` varchar(30) NOT NULL DEFAULT '' COMMENT '文章作者',
  `author_email` varchar(60) NOT NULL DEFAULT '' COMMENT '作者邮箱',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `article_type` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `is_open` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `file_url` varchar(255) NOT NULL DEFAULT '' COMMENT '附件地址',
  `open_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `link` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `description` mediumtext COMMENT '文章摘要',
  `click` int(11) DEFAULT '0' COMMENT '浏览量',
  `publish_time` int(11) DEFAULT NULL COMMENT '文章预告发布时间',
  `thumb` varchar(255) DEFAULT '' COMMENT '文章缩略图',
  `pickup_id` int(8) unsigned DEFAULT NULL COMMENT '新闻来源  发布新闻的管理员角色id',
  `thumb2` varchar(255) DEFAULT '' COMMENT '文章缩略图2',
  `thumb3` varchar(255) DEFAULT '' COMMENT '文章缩略图3',
  `type` tinyint(1) unsigned DEFAULT '1' COMMENT '新闻列表显示样式 0不显示图片 1左右显示 2上下显示 3多图显示',
  PRIMARY KEY (`article_id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_news_cat
-- ----------------------------
DROP TABLE IF EXISTS `tp_news_cat`;
CREATE TABLE `tp_news_cat` (
  `cat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(20) DEFAULT NULL COMMENT '类别名称',
  `cat_type` smallint(6) DEFAULT '0' COMMENT '默认分组',
  `parent_id` smallint(6) DEFAULT '0' COMMENT '夫级ID',
  `show_in_nav` tinyint(1) DEFAULT '0' COMMENT '是否导航显示',
  `sort_order` smallint(6) DEFAULT '50' COMMENT '排序',
  `cat_desc` varchar(255) DEFAULT NULL COMMENT '分类描述',
  `keywords` varchar(30) DEFAULT NULL COMMENT '搜索关键词',
  `cat_alias` varchar(20) DEFAULT NULL COMMENT '别名',
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_news_collection
-- ----------------------------
DROP TABLE IF EXISTS `tp_news_collection`;
CREATE TABLE `tp_news_collection` (
  `collection_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL DEFAULT '0' COMMENT '新闻ID',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0已收藏 1取消收藏',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`collection_id`),
  KEY `user_id` (`user_id`),
  KEY `article_id` (`article_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_news_comment
-- ----------------------------
DROP TABLE IF EXISTS `tp_news_comment`;
CREATE TABLE `tp_news_comment` (
  `comment_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `article_id` smallint(5) NOT NULL DEFAULT '0' COMMENT '新闻ID',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '评论内容',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0正常显示，1虚拟删除不显示',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `like_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '点赞量',
  PRIMARY KEY (`comment_id`),
  KEY `user_id` (`user_id`),
  KEY `article_id` (`article_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_news_like
-- ----------------------------
DROP TABLE IF EXISTS `tp_news_like`;
CREATE TABLE `tp_news_like` (
  `like_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) NOT NULL DEFAULT '0' COMMENT '新闻评论ID',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0正常显示 1已取消',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`like_id`),
  KEY `user_id` (`user_id`),
  KEY `comment_id` (`comment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_oauth_users
-- ----------------------------
DROP TABLE IF EXISTS `tp_oauth_users`;
CREATE TABLE `tp_oauth_users` (
  `tu_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '表自增ID',
  `user_id` mediumint(8) NOT NULL COMMENT '用户表ID',
  `openid` varchar(255) NOT NULL COMMENT '第三方开放平台openid',
  `oauth` varchar(50) NOT NULL COMMENT '第三方授权平台',
  `unionid` varchar(255) DEFAULT NULL COMMENT 'unionid',
  `oauth_child` varchar(50) DEFAULT NULL COMMENT 'tt来自抖音，mp标识来自公众号, open标识来自开放平台,用于标识来自哪个第三方授权平台, 因为同是微信平台有来自公众号和开放平台',
  `nick_name` varchar(64) DEFAULT NULL COMMENT '绑定时的昵称',
  PRIMARY KEY (`tu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=649 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_order
-- ----------------------------
DROP TABLE IF EXISTS `tp_order`;
CREATE TABLE `tp_order` (
  `order_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `order_sn` varchar(20) NOT NULL DEFAULT '' COMMENT '订单编号',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `order_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '订单状态.0待确认，1已确认，2已收货，3已取消，4已完成，5已作废',
  `shipping_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '发货状态',
  `pay_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '支付状态.0待支付，1已支付，2部分支付，3已退款，4拒绝退款',
  `consignee` varchar(60) NOT NULL DEFAULT '' COMMENT '收货人',
  `country` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '国家',
  `province` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '省份',
  `city` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '城市',
  `district` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '县区',
  `twon` int(11) DEFAULT '0' COMMENT '乡镇',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '地址',
  `zipcode` varchar(60) NOT NULL DEFAULT '' COMMENT '邮政编码',
  `mobile` varchar(60) NOT NULL DEFAULT '' COMMENT '手机',
  `email` varchar(60) NOT NULL DEFAULT '' COMMENT '邮件',
  `shipping_code` varchar(32) NOT NULL DEFAULT '' COMMENT '物流code',
  `shipping_name` varchar(120) NOT NULL DEFAULT '' COMMENT '物流名称',
  `pay_code` varchar(32) NOT NULL DEFAULT '' COMMENT '支付code',
  `pay_name` varchar(120) NOT NULL DEFAULT '' COMMENT '支付方式名称',
  `invoice_title` varchar(256) DEFAULT '' COMMENT '发票抬头',
  `taxpayer` varchar(30) DEFAULT '' COMMENT '纳税人识别号',
  `invoice_desc` varchar(30) DEFAULT NULL COMMENT '发票内容',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品总价',
  `shipping_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '邮费',
  `user_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '使用余额',
  `coupon_price` decimal(10,2) DEFAULT '0.00' COMMENT '优惠券抵扣',
  `integral` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '使用积分',
  `integral_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '使用积分抵多少钱',
  `order_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '应付款金额',
  `total_amount` decimal(10,2) DEFAULT '0.00' COMMENT '订单总价',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下单时间',
  `shipping_time` int(11) DEFAULT '0' COMMENT '最后新发货时间',
  `confirm_time` int(10) DEFAULT '0' COMMENT '收货确认时间',
  `pay_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '支付时间',
  `transaction_id` varchar(255) DEFAULT NULL COMMENT '第三方平台交易流水号',
  `payment_voucher` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '付款凭证',
  `contract_documents` varchar(255) NOT NULL DEFAULT '' COMMENT '合同文件',
  `prom_id` int(11) unsigned DEFAULT '0' COMMENT '活动ID',
  `prom_type` tinyint(4) unsigned DEFAULT '0' COMMENT '订单类型：0普通订单4预售订单5虚拟订单6拼团订单7预约订单9自提订单',
  `order_prom_id` smallint(6) NOT NULL DEFAULT '0' COMMENT '活动id',
  `order_prom_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '活动优惠金额',
  `discount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格调整',
  `user_note` varchar(255) NOT NULL DEFAULT '' COMMENT '用户备注',
  `cancel_reason` varchar(255) NOT NULL DEFAULT '' COMMENT '取消原因',
  `admin_note` varchar(255) DEFAULT '' COMMENT '管理员备注',
  `parent_sn` varchar(100) DEFAULT NULL COMMENT '父单单号改为父单order_id',
  `is_distribut` tinyint(1) DEFAULT '0' COMMENT '是否已分成0未分成1已分成',
  `paid_money` decimal(10,2) DEFAULT '0.00' COMMENT '订金',
  `shop_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '自提点门店id',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户假删除标识,1:删除,0未删除',
  `suppliers_id` int(11) NOT NULL DEFAULT '0' COMMENT '0表示平台订单；-1表示复合订单，即多个供应商，将在付款后拆分订单；其它表示供应商订单',
  `order_statis_id` int(11) DEFAULT '0' COMMENT '订单结算统计表的id，0表示未结算',
  `real_shipping_price` decimal(10,2) DEFAULT '0.00' COMMENT '原本需要的运费（当平台免邮时记录本来需要的邮费，用于供应商结算时计算邮费，会员看不到）',
  `from_terminal` varchar(20) DEFAULT NULL COMMENT '下单的终端设备：ios = 苹果，android = 安卓 ， miniapp = 小程序 ， h5 = 移动端 ， pc = 电脑端 ， mp = 微商城',
  `card_price` decimal(10,2) DEFAULT '0.00' COMMENT '购物卡抵多少钱',
  `invalid_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '失效时间',
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `order_sn` (`order_sn`),
  KEY `user_id` (`user_id`),
  KEY `add_time` (`add_time`)
) ENGINE=MyISAM AUTO_INCREMENT=507 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_order_action
-- ----------------------------
DROP TABLE IF EXISTS `tp_order_action`;
CREATE TABLE `tp_order_action` (
  `action_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `order_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '订单ID',
  `action_user` int(11) DEFAULT '0' COMMENT '操作人 0 为用户操作，其他为管理员id',
  `order_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '订单状态',
  `shipping_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '配送状态',
  `pay_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '支付状态',
  `action_note` varchar(255) NOT NULL DEFAULT '' COMMENT '操作备注',
  `log_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  `status_desc` varchar(255) DEFAULT NULL COMMENT '状态描述',
  `group` tinyint(1) NOT NULL DEFAULT '0' COMMENT '操作群体：0用户或管理员；1供应商（action_user对应id，用户为0）',
  PRIMARY KEY (`action_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1322 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_order_bespeak
-- ----------------------------
DROP TABLE IF EXISTS `tp_order_bespeak`;
CREATE TABLE `tp_order_bespeak` (
  `order_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `template_unit_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模板组件id',
  `value` varchar(255) NOT NULL DEFAULT '' COMMENT '表单输入值，多值用英文逗号分隔'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `tp_order_goods`;
CREATE TABLE `tp_order_goods` (
  `rec_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id自增',
  `order_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `goods_name` varchar(120) NOT NULL DEFAULT '' COMMENT '商品名称',
  `goods_sn` varchar(60) NOT NULL DEFAULT '' COMMENT '商品货号',
  `goods_num` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '购买数量',
  `final_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品实际购买价',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '本店价',
  `cost_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品成本价',
  `member_goods_price` decimal(10,2) DEFAULT '0.00' COMMENT '会员折扣价',
  `give_integral` mediumint(8) unsigned DEFAULT '0' COMMENT '购买商品赠送积分',
  `item_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品规格id',
  `spec_key` varchar(128) DEFAULT '' COMMENT '商品规格key',
  `spec_key_name` varchar(128) DEFAULT '' COMMENT '规格对应的中文名字',
  `bar_code` varchar(64) NOT NULL DEFAULT '' COMMENT '条码',
  `is_comment` tinyint(1) DEFAULT '0' COMMENT '是否评价',
  `prom_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 普通订单,1 限时抢购, 2 团购 , 3 促销优惠,4预售',
  `prom_id` int(11) unsigned DEFAULT '0' COMMENT '活动id',
  `is_send` tinyint(1) DEFAULT '0' COMMENT '0未发货，1已发货，2已换货，3已退货',
  `delivery_id` int(11) DEFAULT '0' COMMENT '发货单ID',
  `sku` varchar(128) DEFAULT '' COMMENT 'sku',
  `suppliers_id` int(11) DEFAULT '0' COMMENT '对应供应商id，0表示平台商品',
  PRIMARY KEY (`rec_id`),
  KEY `order_id` (`order_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=MyISAM AUTO_INCREMENT=645 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_order_shopping_card
-- ----------------------------
DROP TABLE IF EXISTS `tp_order_shopping_card`;
CREATE TABLE `tp_order_shopping_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `num` int(11) NOT NULL COMMENT '数量',
  `shopping_card_id` int(11) NOT NULL COMMENT '购物卡ID',
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `shopping_card_discount_id` int(11) NOT NULL COMMENT '用户购物卡ID',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `shopping_card_id` (`shopping_card_id`),
  KEY `shopping_card_discount_id` (`shopping_card_discount_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='购物卡赠送记录';

-- ----------------------------
-- Table structure for tp_order_statis
-- ----------------------------
DROP TABLE IF EXISTS `tp_order_statis`;
CREATE TABLE `tp_order_statis` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `start_date` int(11) NOT NULL COMMENT '开始日期',
  `end_date` int(11) NOT NULL COMMENT '结束日期',
  `sum_cost_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单商品供货总金额',
  `sum_shipping_price` decimal(10,2) DEFAULT '0.00' COMMENT '物流运费',
  `create_date` int(11) DEFAULT NULL COMMENT '创建记录日期',
  `suppliers_id` int(11) DEFAULT NULL COMMENT '供应商id',
  `order_amount` decimal(10,2) DEFAULT '0.00' COMMENT '订单总价',
  `sum_real_postage` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '真实运费',
  `statis_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '应付金额（供货总额+真实运费）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商家订单结算表';

-- ----------------------------
-- Table structure for tp_order_sync
-- ----------------------------
DROP TABLE IF EXISTS `tp_order_sync`;
CREATE TABLE `tp_order_sync` (
  `sync_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '递增id',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `order_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '订单ID',
  `order_sn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '订单编号',
  `action_user` int(11) DEFAULT '0' COMMENT '操作人 0 为用户操作，其他为管理员id',
  `sync_note` varchar(255) NOT NULL DEFAULT '' COMMENT '备注(一般同步失败备注)',
  `sync_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '订单同步状态:0失败,1成功,2失败已处理',
  `log_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`sync_id`),
  UNIQUE KEY `order_id` (`order_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2929 DEFAULT CHARSET=utf8 COMMENT='商城订单同步日志';

-- ----------------------------
-- Table structure for tp_payment
-- ----------------------------
DROP TABLE IF EXISTS `tp_payment`;
CREATE TABLE `tp_payment` (
  `pay_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `pay_code` varchar(20) NOT NULL DEFAULT '' COMMENT '支付code',
  `pay_name` varchar(120) NOT NULL DEFAULT '' COMMENT '支付方式名称',
  `pay_fee` varchar(10) NOT NULL DEFAULT '' COMMENT '手续费',
  `pay_desc` text NOT NULL COMMENT '描述',
  `pay_order` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'pay_coder',
  `pay_config` text NOT NULL COMMENT '配置',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '开启',
  `is_cod` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否货到付款',
  `is_online` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否在线支付',
  PRIMARY KEY (`pay_id`),
  UNIQUE KEY `pay_code` (`pay_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_pick_up
-- ----------------------------
DROP TABLE IF EXISTS `tp_pick_up`;
CREATE TABLE `tp_pick_up` (
  `pickup_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自提点id',
  `pickup_name` varchar(255) NOT NULL DEFAULT '' COMMENT '自提点名称',
  `pickup_pic` varchar(255) DEFAULT NULL COMMENT '门店头像',
  `pickup_details` text COMMENT '门店简介',
  `pickup_address` varchar(255) NOT NULL DEFAULT '' COMMENT '自提点地址',
  `pickup_phone` varchar(30) NOT NULL DEFAULT '' COMMENT '自提点电话',
  `pickup_contact` varchar(20) NOT NULL DEFAULT '' COMMENT '自提点联系人',
  `province_id` int(11) NOT NULL COMMENT '省id',
  `city_id` int(11) NOT NULL COMMENT '市id',
  `district_id` int(11) NOT NULL COMMENT '区id',
  `longitude` decimal(10,7) DEFAULT '0.0000000' COMMENT '经度',
  `latitude` decimal(10,7) DEFAULT '0.0000000' COMMENT '纬度',
  `open` tinyint(2) DEFAULT '0' COMMENT '营业开始时间',
  `close` tinyint(2) DEFAULT '0' COMMENT '营业打烊时间',
  `suppliersid` int(11) NOT NULL COMMENT '供应商id',
  PRIMARY KEY (`pickup_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='自提点表';

-- ----------------------------
-- Table structure for tp_plugin
-- ----------------------------
DROP TABLE IF EXISTS `tp_plugin`;
CREATE TABLE `tp_plugin` (
  `code` varchar(25) DEFAULT NULL COMMENT '插件编码',
  `name` varchar(55) DEFAULT NULL COMMENT '中文名字',
  `version` varchar(255) DEFAULT NULL COMMENT '插件的版本',
  `author` varchar(30) DEFAULT NULL COMMENT '插件作者',
  `config` text COMMENT '配置信息',
  `config_value` text COMMENT '配置值信息',
  `desc` varchar(255) DEFAULT NULL COMMENT '插件描述',
  `status` tinyint(1) DEFAULT '0' COMMENT '是否启用',
  `type` varchar(50) DEFAULT NULL COMMENT '插件类型 payment支付 login 登陆 shipping物流',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `bank_code` text COMMENT '网银配置信息',
  `scene` tinyint(1) DEFAULT '0' COMMENT '使用场景 0PC+手机 1手机 2PC 3APP 4小程序'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_portrait_cart
-- ----------------------------
DROP TABLE IF EXISTS `tp_portrait_cart`;
CREATE TABLE `tp_portrait_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '加购率表',
  `session_id` char(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'session',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `order_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `pay_time` int(10) unsigned DEFAULT '0' COMMENT '支付时间',
  `goods_num` int(10) unsigned DEFAULT '1' COMMENT '商品数量',
  `is_first` tinyint(1) unsigned DEFAULT '1' COMMENT '1第一次加入购物车',
  `add_time` int(10) unsigned NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_portrait_collect
-- ----------------------------
DROP TABLE IF EXISTS `tp_portrait_collect`;
CREATE TABLE `tp_portrait_collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '收藏率表',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `order_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `pay_time` int(10) unsigned DEFAULT '0' COMMENT '支付时间',
  `is_collect` tinyint(1) unsigned DEFAULT '1' COMMENT '1收藏0取消',
  `is_first` tinyint(1) unsigned DEFAULT '1' COMMENT '1第一次收藏',
  `add_time` int(10) unsigned NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_portrait_visit
-- ----------------------------
DROP TABLE IF EXISTS `tp_portrait_visit`;
CREATE TABLE `tp_portrait_visit` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '访问表,每天每个用户只一条记录类型type',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `num` int(10) unsigned DEFAULT '1' COMMENT '访问次数,今天总次数',
  `type` tinyint(1) unsigned DEFAULT '1' COMMENT '0:pc,1:wap,2:安卓，3：苹果，4：小程序',
  `last_time` int(10) unsigned NOT NULL COMMENT '最后访问时间',
  `add_time` int(10) unsigned NOT NULL COMMENT '添加时间,首次访问时间',
  `is_reg` tinyint(1) unsigned DEFAULT '0' COMMENT '0:老会员,1:是今天注册',
  `is_buy` tinyint(1) unsigned DEFAULT '0' COMMENT '1:已支付过,0不是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=361 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_poster
-- ----------------------------
DROP TABLE IF EXISTS `tp_poster`;
CREATE TABLE `tp_poster` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `poster_name` char(10) DEFAULT '' COMMENT '海报名称',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '海报类型:0普通, 1银牌, 2金牌',
  `canvas_width` int(5) DEFAULT '0' COMMENT '画布宽度',
  `canvas_height` int(5) DEFAULT '0' COMMENT '画布高度',
  `poster_width` int(5) DEFAULT '0' COMMENT '海报宽度',
  `poster_height` int(5) DEFAULT '0' COMMENT '海报高度',
  `back_url` varchar(255) DEFAULT NULL COMMENT '海报路径',
  `canvas_x` int(5) DEFAULT '0' COMMENT '画布x轴',
  `canvas_y` int(5) DEFAULT '0' COMMENT '画布y轴',
  `enabled` tinyint(1) DEFAULT '0' COMMENT '是否启用 ： 0 = 未启用，1 = 已启用',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `add_time` int(11) DEFAULT NULL COMMENT '添加时间',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `qrcode_size` int(10) DEFAULT '150' COMMENT '二维码大小',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='自定义海报';

-- ----------------------------
-- Table structure for tp_pre_sell
-- ----------------------------
DROP TABLE IF EXISTS `tp_pre_sell`;
CREATE TABLE `tp_pre_sell` (
  `pre_sell_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '预售id',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `goods_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品名称',
  `item_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '规格id',
  `item_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '规格名称',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '预售标题',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '预售描述',
  `deposit_goods_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订购商品数',
  `deposit_order_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订购订单数',
  `stock_num` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '预售库存',
  `sell_start_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '活动开始时间',
  `sell_end_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '活动结束时间',
  `pay_start_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '尾款支付开始时间',
  `pay_end_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '尾款支付结束时间',
  `deposit_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '订金',
  `price_ladder` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '价格阶梯。预定人数达到多少个时，价格为多少钱',
  `delivery_time_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '开始发货时间描述',
  `is_finished` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否已结束:0,正常；1，结束（待处理）；2,成功结束；3，失败结束。',
  PRIMARY KEY (`pre_sell_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tp_promotion_assist
-- ----------------------------
DROP TABLE IF EXISTS `tp_promotion_assist`;
CREATE TABLE `tp_promotion_assist` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(10) NOT NULL COMMENT '助力活动标题',
  `start_time` int(11) NOT NULL COMMENT '活动开始时间',
  `end_time` int(11) NOT NULL COMMENT '活动结束时间',
  `done_reward` varchar(20) DEFAULT NULL COMMENT '用户助力获得奖励',
  `description` text COMMENT '活动描述',
  `is_end` int(1) NOT NULL DEFAULT '0' COMMENT '活动是否结束',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='助力活动列表';

-- ----------------------------
-- Table structure for tp_promotion_bargain
-- ----------------------------
DROP TABLE IF EXISTS `tp_promotion_bargain`;
CREATE TABLE `tp_promotion_bargain` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL DEFAULT '' COMMENT '活动标题',
  `goods_name` varchar(255) NOT NULL DEFAULT '' COMMENT '商品名称',
  `goods_id` int(10) NOT NULL COMMENT '参团商品ID',
  `cut_statr_range` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '砍价范围开始',
  `cut_end_range` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '砍价范围 结束',
  `buy_limit` int(11) NOT NULL DEFAULT '1' COMMENT '每人限购数',
  `virtual_num` int(11) NOT NULL DEFAULT '0' COMMENT '虚拟已参加人数',
  `cut_limit` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '0表示不限制，配置每个砍价活动每人可发起砍价的次数，一个用户，针对（同一商品，同一个发起砍价者），仅可协助砍价1次  ',
  `order_overtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单超时时间',
  `start_time` int(11) NOT NULL COMMENT '开始时间',
  `end_time` int(11) NOT NULL COMMENT '结束时间',
  `is_end` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否已结束',
  `description` text COMMENT '活动描述',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0没有删除，1虚拟删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='砍价活动表';

-- ----------------------------
-- Table structure for tp_promotion_bargain_goods_item
-- ----------------------------
DROP TABLE IF EXISTS `tp_promotion_bargain_goods_item`;
CREATE TABLE `tp_promotion_bargain_goods_item` (
  `bargain_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '活动id',
  `goods_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `item_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品规格ID',
  `start_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '商品初始价',
  `end_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '商品低价',
  `goods_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '参与的数量',
  `buy_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '已购买了多少件',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否已删除0否，1删除'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='砍价活动商品表';

-- ----------------------------
-- Table structure for tp_prom_goods
-- ----------------------------
DROP TABLE IF EXISTS `tp_prom_goods`;
CREATE TABLE `tp_prom_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '活动ID',
  `title` varchar(60) NOT NULL DEFAULT '' COMMENT '促销活动名称',
  `type` int(2) NOT NULL DEFAULT '0' COMMENT '促销类型',
  `expression` varchar(100) NOT NULL DEFAULT '' COMMENT '优惠体现',
  `description` text COMMENT '活动描述',
  `start_time` int(11) NOT NULL COMMENT '活动开始时间',
  `end_time` int(11) NOT NULL COMMENT '活动结束时间',
  `time_limit` int(5) NOT NULL DEFAULT '30' COMMENT '订单有效期-分钟(N分钟未付款有效)',
  `is_end` tinyint(1) DEFAULT '0' COMMENT '是否已结束',
  `group` varchar(255) DEFAULT NULL COMMENT '适用范围',
  `prom_img` varchar(150) DEFAULT NULL COMMENT '活动宣传图片',
  `buy_limit` int(10) DEFAULT NULL COMMENT '每人限购数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_prom_goods_item
-- ----------------------------
DROP TABLE IF EXISTS `tp_prom_goods_item`;
CREATE TABLE `tp_prom_goods_item` (
  `prom_id` int(10) unsigned NOT NULL COMMENT '活动id',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `item_id` int(11) NOT NULL COMMENT '商品规格id',
  `goods_name` varchar(120) NOT NULL COMMENT '商品名称',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `image` varchar(255) DEFAULT NULL COMMENT '商品图片'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_prom_order
-- ----------------------------
DROP TABLE IF EXISTS `tp_prom_order`;
CREATE TABLE `tp_prom_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '活动名称',
  `type` int(2) NOT NULL DEFAULT '0' COMMENT '活动类型',
  `money` float(10,2) DEFAULT '0.00' COMMENT '最小金额',
  `expression` varchar(100) DEFAULT NULL COMMENT '优惠体现',
  `description` text COMMENT '活动描述',
  `start_time` int(11) DEFAULT NULL COMMENT '活动开始时间',
  `end_time` int(11) DEFAULT NULL COMMENT '活动结束时间',
  `is_close` tinyint(1) DEFAULT '0',
  `group` varchar(255) DEFAULT NULL COMMENT '适用范围',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_rebate_log
-- ----------------------------
DROP TABLE IF EXISTS `tp_rebate_log`;
CREATE TABLE `tp_rebate_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分成记录表',
  `user_id` int(11) DEFAULT '0' COMMENT '获佣用户',
  `buy_user_id` int(11) DEFAULT '0' COMMENT '购买人id',
  `nickname` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '购买人名称',
  `order_sn` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '订单编号',
  `order_id` int(11) DEFAULT '0' COMMENT '订单id',
  `goods_price` decimal(10,2) DEFAULT '0.00' COMMENT '订单商品总额',
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '获佣金额',
  `level` tinyint(1) DEFAULT '1' COMMENT '获佣用户级别',
  `create_time` int(11) DEFAULT '0' COMMENT '分成记录生成时间',
  `confirm` int(11) DEFAULT '0' COMMENT '确定收货时间',
  `status` tinyint(1) DEFAULT '0' COMMENT '0未付款,1已付款, 2等待分成(已收货) 3已分成, 4已取消',
  `confirm_time` int(11) DEFAULT '0' COMMENT '确定分成或者取消时间',
  `remark` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '如果是取消, 有取消备注',
  `detail` varchar(1024) DEFAULT NULL COMMENT '记录该笔佣金中来自每个商品的分佣详情',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_recharge
-- ----------------------------
DROP TABLE IF EXISTS `tp_recharge`;
CREATE TABLE `tp_recharge` (
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '会员ID',
  `nickname` varchar(50) DEFAULT NULL COMMENT '会员昵称',
  `order_sn` varchar(30) NOT NULL DEFAULT '' COMMENT '充值单号',
  `account` decimal(10,2) DEFAULT '0.00' COMMENT '充值金额',
  `ctime` int(11) DEFAULT NULL COMMENT '充值时间',
  `pay_time` int(11) DEFAULT NULL COMMENT '支付时间',
  `pay_code` varchar(20) DEFAULT NULL,
  `pay_name` varchar(80) DEFAULT NULL COMMENT '支付方式',
  `pay_status` tinyint(1) DEFAULT '0' COMMENT '充值状态0:待支付 1:充值成功 2:交易关闭',
  `level_id` tinyint(2) DEFAULT '0' COMMENT '购买会员等级',
  `buy_vip` tinyint(2) DEFAULT '0',
  `shopping_card_discount_id` int(11) NOT NULL COMMENT '购物卡优惠类型',
  `card_list_id` int(10) DEFAULT '0' COMMENT '购物卡id',
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_recom_relationship
-- ----------------------------
DROP TABLE IF EXISTS `tp_recom_relationship`;
CREATE TABLE `tp_recom_relationship` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `unionid` varchar(255) NOT NULL DEFAULT '',
  `first_leader` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上级id',
  `is_entry` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '那个入口进来的，1小程序注册',
  `content` text NOT NULL COMMENT '缓存数据',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0',
  `up_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `unique_id` varchar(255) NOT NULL COMMENT 'unique_id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='推荐关系表，首次进来绑定上级id';

-- ----------------------------
-- Table structure for tp_region
-- ----------------------------
DROP TABLE IF EXISTS `tp_region`;
CREATE TABLE `tp_region` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '源于京东',
  `name` longtext,
  `level` tinyint(4) DEFAULT '1',
  `parent_id` int(10) DEFAULT '0',
  `is_hot` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0普通，1热门城市',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47504 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_region2
-- ----------------------------
DROP TABLE IF EXISTS `tp_region2`;
CREATE TABLE `tp_region2` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表id',
  `name` varchar(20) NOT NULL COMMENT '地区名称',
  `parent_id` int(11) DEFAULT NULL COMMENT '父id',
  `level` tinyint(1) DEFAULT NULL COMMENT '地区等级',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for tp_region_new
-- ----------------------------
DROP TABLE IF EXISTS `tp_region_new`;
CREATE TABLE `tp_region_new` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '源于京东',
  `name` longtext,
  `level` tinyint(4) DEFAULT '1',
  `parent_id` int(10) DEFAULT '0',
  `is_hot` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0普通，1热门城市',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=620201404 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_remittance
-- ----------------------------
DROP TABLE IF EXISTS `tp_remittance`;
CREATE TABLE `tp_remittance` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分销用户转账记录表',
  `user_id` int(11) DEFAULT '0' COMMENT '汇款的用户id',
  `bank_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '收款银行名称',
  `account_bank` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '银行账号',
  `account_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '开户人名称',
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '汇款金额',
  `status` tinyint(1) DEFAULT '0' COMMENT '0汇款失败 1汇款成功',
  `handle_time` int(11) DEFAULT '0' COMMENT '处理时间',
  `create_time` int(11) DEFAULT '0' COMMENT '申请时间',
  `remark` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '汇款备注',
  `admin_id` int(11) DEFAULT '0' COMMENT '处理管理员id',
  `withdrawals_id` int(11) DEFAULT '0' COMMENT '提现申请表id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_reply
-- ----------------------------
DROP TABLE IF EXISTS `tp_reply`;
CREATE TABLE `tp_reply` (
  `reply_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '回复id',
  `comment_id` int(10) NOT NULL COMMENT '评论id：关联评论表',
  `parent_id` int(10) NOT NULL DEFAULT '0' COMMENT '父类id，0为最顶级',
  `content` text NOT NULL COMMENT '回复内容',
  `user_name` varchar(255) NOT NULL DEFAULT '' COMMENT '回复人的昵称',
  `to_name` varchar(255) NOT NULL DEFAULT '' COMMENT '被回复人的昵称',
  `deleted` tinyint(1) unsigned zerofill NOT NULL DEFAULT '0' COMMENT '未删除0；删除：1',
  `reply_time` int(10) unsigned NOT NULL COMMENT '回复时间',
  PRIMARY KEY (`reply_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_return_goods
-- ----------------------------
DROP TABLE IF EXISTS `tp_return_goods`;
CREATE TABLE `tp_return_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '退货申请表id自增',
  `rec_id` int(11) DEFAULT '0' COMMENT 'order_goods表id',
  `order_id` int(11) DEFAULT '0' COMMENT '订单id',
  `order_sn` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '订单编号',
  `goods_id` int(11) DEFAULT '0' COMMENT '商品id',
  `goods_num` int(10) DEFAULT '1' COMMENT '退货数量',
  `type` tinyint(1) DEFAULT '0' COMMENT '0仅退款 1退货退款 2换货',
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '退换货原因',
  `describe` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '问题描述',
  `imgs` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '拍照图片路径',
  `addtime` int(11) DEFAULT '0' COMMENT '申请时间',
  `status` tinyint(1) DEFAULT '0' COMMENT '-2用户取消-1不同意0待审核1通过2已发货3已收货4换货完成5退款完成',
  `remark` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '客服备注',
  `user_id` int(11) DEFAULT '0' COMMENT '用户id',
  `spec_key` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '商品规格key 对应tp_spec_goods_price 表',
  `seller_delivery` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '换货服务，卖家重新发货信息',
  `refund_money` decimal(10,2) DEFAULT '0.00' COMMENT '退还金额',
  `refund_deposit` decimal(10,2) DEFAULT '0.00' COMMENT '退还余额',
  `refund_integral` int(11) DEFAULT '0' COMMENT '退还积分',
  `refund_type` tinyint(1) DEFAULT '0' COMMENT '退款类型',
  `refund_mark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '退款备注',
  `refund_time` int(11) DEFAULT '0' COMMENT '退款时间',
  `is_receive` tinyint(4) DEFAULT '0' COMMENT '申请售后时是否收到货物',
  `delivery` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '用户发货信息',
  `checktime` int(11) DEFAULT NULL COMMENT '卖家审核时间',
  `receivetime` int(11) DEFAULT NULL COMMENT '卖家收货时间',
  `canceltime` int(11) DEFAULT NULL COMMENT '用户取消时间',
  `suppliers_id` int(11) DEFAULT '0' COMMENT '供应商id',
  `receiving_address` tinyint(1) DEFAULT '0' COMMENT '收货方：0平台，1供应商',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tp_search_word
-- ----------------------------
DROP TABLE IF EXISTS `tp_search_word`;
CREATE TABLE `tp_search_word` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '搜索表ID',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '搜索关键词，商品关键词',
  `pinyin_full` varchar(255) NOT NULL DEFAULT '' COMMENT '拼音全拼',
  `pinyin_simple` varchar(255) NOT NULL DEFAULT '' COMMENT '拼音简写',
  `search_num` int(8) NOT NULL DEFAULT '0' COMMENT '搜索次数',
  `goods_num` int(8) NOT NULL DEFAULT '0' COMMENT '商品数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COMMENT='搜索关键词表';

-- ----------------------------
-- Table structure for tp_shipping
-- ----------------------------
DROP TABLE IF EXISTS `tp_shipping`;
CREATE TABLE `tp_shipping` (
  `shipping_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '物流公司id',
  `shipping_name` varchar(255) NOT NULL DEFAULT '' COMMENT '物流公司名称',
  `shipping_code` varchar(255) NOT NULL DEFAULT '' COMMENT '物流公司编码',
  `is_open` tinyint(1) DEFAULT '1' COMMENT '是否启用',
  `shipping_desc` varchar(255) NOT NULL DEFAULT '' COMMENT '物流描述',
  `shipping_logo` varchar(255) NOT NULL DEFAULT '' COMMENT '物流公司logo',
  `template_width` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '运单模板宽度',
  `template_height` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '运单模板高度',
  `template_offset_x` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '运单模板左偏移量',
  `template_offset_y` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '运单模板上偏移量',
  `template_img` varchar(255) NOT NULL DEFAULT '' COMMENT '运单模板图片',
  `template_html` text NOT NULL COMMENT '打印项偏移校正',
  PRIMARY KEY (`shipping_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_shipping_area
-- ----------------------------
DROP TABLE IF EXISTS `tp_shipping_area`;
CREATE TABLE `tp_shipping_area` (
  `shipping_area_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `shipping_area_name` varchar(150) NOT NULL DEFAULT '' COMMENT '配送区域名称',
  `shipping_code` varchar(50) NOT NULL DEFAULT '0' COMMENT '物流id',
  `config` text NOT NULL COMMENT '配置首重续重等...序列化存储',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `is_default` tinyint(1) DEFAULT '0' COMMENT '是否默认',
  PRIMARY KEY (`shipping_area_id`),
  KEY `shipping_id` (`shipping_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_shop
-- ----------------------------
DROP TABLE IF EXISTS `tp_shop`;
CREATE TABLE `tp_shop` (
  `shop_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '门店索引id',
  `shop_name` varchar(50) NOT NULL DEFAULT '' COMMENT '门店名称',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '会员id',
  `user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '会员名称',
  `shopper_name` varchar(50) NOT NULL DEFAULT '' COMMENT '店主卖家用户名',
  `province_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '门店所在省份ID',
  `city_id` mediumint(8) NOT NULL DEFAULT '0' COMMENT '门店所在城市ID',
  `district_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '门店所在地区ID',
  `shop_address` varchar(100) NOT NULL DEFAULT '' COMMENT '详细地区',
  `longitude` decimal(10,7) NOT NULL DEFAULT '0.0000000' COMMENT '门店地址经度',
  `latitude` decimal(10,7) NOT NULL DEFAULT '0.0000000' COMMENT '门店地址纬度',
  `shop_zip` varchar(10) NOT NULL DEFAULT '' COMMENT '邮政编码',
  `suppliers_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '供应商id，0表示没有',
  `shop_status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '门店状态，0关闭，1开启',
  `work_start_time` varchar(10) NOT NULL DEFAULT '' COMMENT '每天营业起始时间',
  `work_end_time` varchar(10) NOT NULL DEFAULT '' COMMENT '每天营业截止时间',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '开店时间',
  `shop_phone_code` varchar(20) NOT NULL DEFAULT '' COMMENT '联系电话区号',
  `shop_phone` varchar(20) NOT NULL DEFAULT '' COMMENT '商家电话',
  `monday` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '星期一是否营业,0不是,1是',
  `tuesday` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '星期二是否营业，0不是1是',
  `wednesday` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '星期三是否营业，0不是1是',
  `thursday` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '星期四是否营业，0不是1是',
  `friday` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '星期五是否营业，0不是1是',
  `saturday` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '星期六是否营业，0不是1是',
  `sunday` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '星期日是否营业，0不是1是',
  `deleted` tinyint(1) unsigned zerofill NOT NULL DEFAULT '0' COMMENT '未删除0，已删除1',
  `shop_desc` varchar(255) NOT NULL DEFAULT '' COMMENT '门店简介',
  PRIMARY KEY (`shop_id`),
  KEY `store_name` (`shop_name`),
  KEY `store_state` (`shop_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='门店自提点表';

-- ----------------------------
-- Table structure for tp_shopper
-- ----------------------------
DROP TABLE IF EXISTS `tp_shopper`;
CREATE TABLE `tp_shopper` (
  `shopper_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '门店id',
  `shopper_name` varchar(50) NOT NULL DEFAULT '' COMMENT '门店账号',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '门店Id',
  `last_login_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `add_time` int(11) unsigned DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`shopper_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='门店自提点管理员表';

-- ----------------------------
-- Table structure for tp_shopper_log
-- ----------------------------
DROP TABLE IF EXISTS `tp_shopper_log`;
CREATE TABLE `tp_shopper_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '日志编号',
  `log_content` varchar(50) NOT NULL DEFAULT '' COMMENT '日志内容',
  `log_time` int(10) unsigned NOT NULL COMMENT '日志时间',
  `log_shopper_id` int(10) unsigned NOT NULL COMMENT '卖家编号',
  `log_shopper_name` varchar(50) NOT NULL DEFAULT '' COMMENT '门店帐号',
  `log_shop_id` int(10) unsigned NOT NULL COMMENT '门店id',
  `log_shopper_ip` varchar(50) NOT NULL DEFAULT '' COMMENT '门店ip',
  `log_url` varchar(50) NOT NULL DEFAULT '' COMMENT '日志url',
  `log_state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '日志状态(0-失败 1-成功)',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='门店自提点管理员日志';

-- ----------------------------
-- Table structure for tp_shopping_card
-- ----------------------------
DROP TABLE IF EXISTS `tp_shopping_card`;
CREATE TABLE `tp_shopping_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `name` varchar(50) NOT NULL COMMENT '购物卡名称',
  `sort` tinyint(1) DEFAULT '0' COMMENT '购物卡类型 0 购物卡 1购物余额卡',
  `give` tinyint(1) DEFAULT '0' COMMENT '赠送类型 0 赠送金额 1折扣 2原价',
  `custom` tinyint(1) DEFAULT '0' COMMENT '是否自定义储值 0 否 1是',
  `back_img` varchar(255) NOT NULL DEFAULT '' COMMENT '卡片背景',
  `face_value` decimal(10,2) DEFAULT '0.00' COMMENT '面额',
  `validity_day` int(1) DEFAULT '0' COMMENT '使用有效期x天，0则永不过期',
  `repertory` int(10) DEFAULT '0' COMMENT '库存 0 无限制',
  `residue` int(10) DEFAULT '0' COMMENT '购物卡剩余数量',
  `user_rank` varchar(200) NOT NULL DEFAULT '' COMMENT '使用须知',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `status` int(2) DEFAULT NULL COMMENT '状态：1有效,2无效',
  `hot` tinyint(1) DEFAULT '0' COMMENT '是否热门',
  `recommend` tinyint(1) DEFAULT '0' COMMENT '是否推荐',
  `use_type` tinyint(1) DEFAULT '0' COMMENT '使用范围：0全店通用1指定商品可用2指定分类商品可用',
  `validity` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '有效期 0 永久有效',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='购物卡';

-- ----------------------------
-- Table structure for tp_shopping_card_account_log
-- ----------------------------
DROP TABLE IF EXISTS `tp_shopping_card_account_log`;
CREATE TABLE `tp_shopping_card_account_log` (
  `log_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '日志id',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `card_list_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '购物卡id',
  `user_money` decimal(10,2) DEFAULT '0.00' COMMENT '购物卡余额',
  `change_time` int(10) unsigned NOT NULL COMMENT '变动时间',
  `desc` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`log_id`),
  KEY `user_id` (`user_id`),
  KEY `card_list_id` (`card_list_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='购物卡余额变动记录';

-- ----------------------------
-- Table structure for tp_shopping_card_discount
-- ----------------------------
DROP TABLE IF EXISTS `tp_shopping_card_discount`;
CREATE TABLE `tp_shopping_card_discount` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `cid` int(8) NOT NULL DEFAULT '0' COMMENT '购物卡id 对应buy_card表id',
  `targer_money` decimal(10,2) DEFAULT '0.00' COMMENT '购买价格',
  `give_num` decimal(10,2) DEFAULT '0.00' COMMENT '优惠内容 0 原价出售',
  `is_face` tinyint(1) DEFAULT '0' COMMENT '是否是面额 1:是 0:不是',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='购物卡价格';

-- ----------------------------
-- Table structure for tp_shopping_card_goods
-- ----------------------------
DROP TABLE IF EXISTS `tp_shopping_card_goods`;
CREATE TABLE `tp_shopping_card_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `card_id` int(8) NOT NULL COMMENT '购物卡id',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '指定的商品id：为零表示不指定商品',
  `goods_category_id` smallint(5) NOT NULL DEFAULT '0' COMMENT '指定的商品分类：为零表示不指定分类',
  PRIMARY KEY (`id`),
  KEY `card_id` (`card_id`),
  KEY `goods_id` (`goods_id`),
  KEY `goods_category_id` (`goods_category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='购物卡品类';

-- ----------------------------
-- Table structure for tp_shopping_card_list
-- ----------------------------
DROP TABLE IF EXISTS `tp_shopping_card_list`;
CREATE TABLE `tp_shopping_card_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `sn` varchar(50) NOT NULL COMMENT '卡号',
  `cid` int(8) NOT NULL DEFAULT '0' COMMENT '购物卡id 对应buy_card表id',
  `uid` int(8) NOT NULL DEFAULT '0' COMMENT '用户id',
  `balance` decimal(10,2) DEFAULT '0.00' COMMENT '金额',
  `activate` tinyint(1) DEFAULT '0' COMMENT '是否激活0未激活 1已激活',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '获得时间',
  `order_id` mediumint(8) unsigned DEFAULT NULL COMMENT '订单id',
  `card_password` varchar(32) DEFAULT '' COMMENT '卡密',
  `status` tinyint(1) DEFAULT '0' COMMENT '是否停用 1:停用 0:未停用',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户购物卡';

-- ----------------------------
-- Table structure for tp_shopping_card_present_log
-- ----------------------------
DROP TABLE IF EXISTS `tp_shopping_card_present_log`;
CREATE TABLE `tp_shopping_card_present_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `card_list_id` int(11) NOT NULL COMMENT '赠送的购物卡',
  `give_id` int(11) NOT NULL COMMENT '赠送者ID',
  `get_id` int(11) DEFAULT NULL COMMENT '领取者ID',
  `remark` varchar(255) DEFAULT NULL COMMENT '赠语',
  `donate_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '设置昵称',
  `donate_time` int(10) unsigned DEFAULT '0' COMMENT '赠送时间',
  `add_time` int(10) unsigned DEFAULT '0' COMMENT '领取时间',
  PRIMARY KEY (`id`),
  KEY `card_list_id` (`card_list_id`),
  KEY `give_id` (`give_id`),
  KEY `get_id` (`get_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='购物卡赠送记录';

-- ----------------------------
-- Table structure for tp_shopping_card_variation
-- ----------------------------
DROP TABLE IF EXISTS `tp_shopping_card_variation`;
CREATE TABLE `tp_shopping_card_variation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '会员ID',
  `order_id` mediumint(8) unsigned DEFAULT NULL COMMENT '订单id',
  `add_time` int(11) DEFAULT '0' COMMENT '变化时间',
  `varuatuib_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变化余额',
  `card_list_id` int(11) NOT NULL COMMENT '购物卡ID',
  `is_return` tinyint(1) DEFAULT '0' COMMENT '是否退回 1退回',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='购物卡余额变化表';

-- ----------------------------
-- Table structure for tp_shop_images
-- ----------------------------
DROP TABLE IF EXISTS `tp_shop_images`;
CREATE TABLE `tp_shop_images` (
  `shop_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '门店id',
  `image_url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片地址',
  KEY `shop_id` (`shop_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_shop_order
-- ----------------------------
DROP TABLE IF EXISTS `tp_shop_order`;
CREATE TABLE `tp_shop_order` (
  `shop_order_id` int(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '提货核销码。主键',
  `order_id` mediumint(8) NOT NULL,
  `order_sn` varchar(20) NOT NULL,
  `goods_id` int(11) unsigned DEFAULT '0' COMMENT '预约商品id',
  `shop_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '门店id',
  `take_time` datetime NOT NULL COMMENT '提货时间',
  `is_write_off` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否核销。0未核销，1已核销',
  `write_off_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '核销时间',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '记录插入时间',
  `bar_code` char(10) DEFAULT NULL COMMENT '生成条形码数字',
  PRIMARY KEY (`shop_order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='门店订单表';

-- ----------------------------
-- Table structure for tp_slogan
-- ----------------------------
DROP TABLE IF EXISTS `tp_slogan`;
CREATE TABLE `tp_slogan` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '购物车表',
  `img` varchar(512) DEFAULT '' COMMENT '标语背景图',
  `remark` varchar(32) DEFAULT '' COMMENT '标语内容',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='平台标语 ';

-- ----------------------------
-- Table structure for tp_sms_log
-- ----------------------------
DROP TABLE IF EXISTS `tp_sms_log`;
CREATE TABLE `tp_sms_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表id',
  `mobile` varchar(11) DEFAULT '' COMMENT '手机号',
  `session_id` varchar(128) DEFAULT '' COMMENT 'session_id',
  `add_time` int(11) DEFAULT '0' COMMENT '发送时间',
  `code` varchar(10) DEFAULT '' COMMENT '验证码',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '发送状态,1:成功,0:失败',
  `msg` varchar(255) DEFAULT NULL COMMENT '短信内容',
  `scene` int(1) DEFAULT '0' COMMENT '发送场景,1:用户注册,2:找回密码,3:客户下单,4:客户支付,5:商家发货,6:身份验证',
  `error_msg` text COMMENT '发送短信异常内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=964 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_sms_template
-- ----------------------------
DROP TABLE IF EXISTS `tp_sms_template`;
CREATE TABLE `tp_sms_template` (
  `tpl_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `sms_sign` varchar(50) NOT NULL DEFAULT '' COMMENT '短信签名',
  `sms_tpl_code` varchar(100) NOT NULL DEFAULT '' COMMENT '短信模板ID',
  `tpl_content` varchar(512) NOT NULL DEFAULT '' COMMENT '发送短信内容',
  `send_scene` varchar(100) NOT NULL DEFAULT '' COMMENT '短信发送场景',
  `add_time` int(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`tpl_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_spec
-- ----------------------------
DROP TABLE IF EXISTS `tp_spec`;
CREATE TABLE `tp_spec` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '规格表',
  `type_id` int(11) DEFAULT '0' COMMENT '规格类型',
  `name` varchar(55) DEFAULT NULL COMMENT '规格名称',
  `order` int(11) DEFAULT '50' COMMENT '排序',
  `is_upload_image` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否可上传规格图.0不可，1可以',
  `search_index` tinyint(1) DEFAULT '1' COMMENT '是否需要检索：1是，0否',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=149 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_spec_goods_price
-- ----------------------------
DROP TABLE IF EXISTS `tp_spec_goods_price`;
CREATE TABLE `tp_spec_goods_price` (
  `item_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '规格商品id',
  `goods_id` int(11) DEFAULT '0' COMMENT '商品id',
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '规格键名',
  `key_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '规格键名中文',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `cost_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '成本价',
  `commission` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '佣金用于分销分成',
  `store_count` int(11) unsigned DEFAULT '10' COMMENT '库存数量',
  `bar_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '商品条形码',
  `sku` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT 'SKU',
  `spec_img` varchar(255) DEFAULT NULL COMMENT '规格商品主图',
  `prom_id` int(10) DEFAULT '0' COMMENT '活动id',
  `prom_type` tinyint(2) DEFAULT '0' COMMENT '参加活动类型',
  PRIMARY KEY (`item_id`),
  KEY `key` (`key`)
) ENGINE=MyISAM AUTO_INCREMENT=2949 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_spec_image
-- ----------------------------
DROP TABLE IF EXISTS `tp_spec_image`;
CREATE TABLE `tp_spec_image` (
  `goods_id` int(11) DEFAULT '0' COMMENT '商品规格图片表id',
  `spec_image_id` int(11) DEFAULT '0' COMMENT '规格项id',
  `src` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '商品规格图片路径'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tp_spec_item
-- ----------------------------
DROP TABLE IF EXISTS `tp_spec_item`;
CREATE TABLE `tp_spec_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '规格项id',
  `spec_id` int(11) DEFAULT NULL COMMENT '规格id',
  `item` varchar(54) DEFAULT NULL COMMENT '规格项',
  `order_index` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=691 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_stock_log
-- ----------------------------
DROP TABLE IF EXISTS `tp_stock_log`;
CREATE TABLE `tp_stock_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL COMMENT '商品ID',
  `goods_name` varchar(100) DEFAULT NULL COMMENT '商品名称',
  `goods_spec` varchar(50) DEFAULT NULL COMMENT '商品规格',
  `order_sn` varchar(30) DEFAULT NULL COMMENT '订单编号',
  `muid` int(11) DEFAULT NULL COMMENT '操作用户ID',
  `stock` int(11) DEFAULT NULL COMMENT '更改库存',
  `ctime` int(11) DEFAULT NULL COMMENT '操作时间',
  `change_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '更改操作类型 （默认）0订单出库 1商品录入 2退货入库 3盘点更改',
  `group` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0(默认)后台管理人员；1供应商，此时此表下的muid为suppliers_id；2用户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11132 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_storage
-- ----------------------------
DROP TABLE IF EXISTS `tp_storage`;
CREATE TABLE `tp_storage` (
  `storage_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `storage_name` varchar(128) NOT NULL COMMENT '仓储名称',
  `is_open` tinyint(1) unsigned DEFAULT '1' COMMENT '仓储是否启用  0不启用  1启用',
  `province_id` int(11) unsigned NOT NULL COMMENT '省id',
  `city_id` int(11) unsigned NOT NULL COMMENT '市id',
  `district_id` int(11) unsigned NOT NULL COMMENT '区id',
  `address` varchar(255) NOT NULL COMMENT '仓储详细地址',
  `name` varchar(120) NOT NULL COMMENT '仓储负责人姓名',
  `mobile` char(15) NOT NULL COMMENT '仓储负责人联系电话',
  `capacity` int(11) unsigned NOT NULL COMMENT '仓储容量(前台取用单位立方米)',
  PRIMARY KEY (`storage_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_suppliers
-- ----------------------------
DROP TABLE IF EXISTS `tp_suppliers`;
CREATE TABLE `tp_suppliers` (
  `suppliers_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '供应商ID',
  `suppliers_name` varchar(255) NOT NULL DEFAULT '' COMMENT '供应商名称',
  `suppliers_desc` mediumtext NOT NULL COMMENT '供应商描述',
  `is_check` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '供应商状态',
  `suppliers_contacts` varchar(255) NOT NULL DEFAULT '' COMMENT '供应商联系人',
  `suppliers_phone` varchar(20) NOT NULL DEFAULT '' COMMENT '供应商电话',
  `province_id` int(10) unsigned DEFAULT NULL COMMENT '所在省份id',
  `city_id` int(10) unsigned DEFAULT NULL COMMENT '所在城市id',
  `district_id` mediumint(8) NOT NULL COMMENT '供应商所在地区id',
  `add_time` int(10) DEFAULT '0' COMMENT '添加时间',
  `user_id` int(11) NOT NULL COMMENT '对应会员id',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `supplier_address` varchar(100) NOT NULL COMMENT '详细地址',
  `suppliers_account` varchar(60) NOT NULL COMMENT '后台账号',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '假删除：0正常，1删除',
  `supplier_money` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '供应商可用资金',
  `frozen_money` decimal(12,2) DEFAULT '0.00' COMMENT '供应商冻结资金（暂没用上）',
  PRIMARY KEY (`suppliers_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_supplier_log
-- ----------------------------
DROP TABLE IF EXISTS `tp_supplier_log`;
CREATE TABLE `tp_supplier_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '日志编号',
  `log_content` varchar(50) NOT NULL DEFAULT '' COMMENT '日志内容',
  `log_time` int(10) unsigned NOT NULL COMMENT '日志时间',
  `log_suppliers_id` int(10) unsigned NOT NULL COMMENT '供应商id',
  `log_suppliers_account` varchar(50) NOT NULL DEFAULT '' COMMENT '供应商帐号',
  `log_ip` varchar(50) NOT NULL DEFAULT '' COMMENT 'ip',
  `log_url` varchar(50) NOT NULL DEFAULT '' COMMENT '日志url',
  `log_state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '日志状态(0-失败 1-成功)',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='供应商管理员日志';

-- ----------------------------
-- Table structure for tp_supplier_withdrawals
-- ----------------------------
DROP TABLE IF EXISTS `tp_supplier_withdrawals`;
CREATE TABLE `tp_supplier_withdrawals` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商家提现申请表',
  `suppliers_id` int(11) DEFAULT '0' COMMENT '商家id',
  `create_time` int(11) DEFAULT '0' COMMENT '申请日期',
  `refuse_time` int(11) DEFAULT '0' COMMENT '拒绝时间',
  `pay_time` int(11) DEFAULT '0' COMMENT '支付时间',
  `check_time` int(11) DEFAULT '0' COMMENT '审核时间',
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '提现金额',
  `bank_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '银行名称 如支付宝 微信 中国银行 农业银行等',
  `bank_card` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '银行账号',
  `realname` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '银行账户名 可以是支付宝可以其他银行',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '提现备注',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态：-2删除作废-1审核失败0申请中1审核通过2已转款完成',
  `pay_code` varchar(100) DEFAULT NULL COMMENT '付款对账流水号',
  `taxfee` decimal(10,2) DEFAULT '0.00' COMMENT '手续费',
  `error_code` varchar(100) DEFAULT NULL COMMENT '转款失败错误代码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_system_article
-- ----------------------------
DROP TABLE IF EXISTS `tp_system_article`;
CREATE TABLE `tp_system_article` (
  `doc_id` mediumint(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `doc_code` varchar(255) NOT NULL COMMENT '调用标识码',
  `doc_title` varchar(255) NOT NULL COMMENT '标题',
  `doc_content` text NOT NULL COMMENT '内容',
  `doc_time` int(10) unsigned NOT NULL COMMENT '添加时间/修改时间',
  PRIMARY KEY (`doc_id`),
  UNIQUE KEY `doc_code` (`doc_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统文章表';

-- ----------------------------
-- Table structure for tp_system_menu
-- ----------------------------
DROP TABLE IF EXISTS `tp_system_menu`;
CREATE TABLE `tp_system_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '权限名字',
  `group` varchar(20) DEFAULT NULL COMMENT '所属分组',
  `right` text COMMENT '权限码(控制器+动作)',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '删除状态 1删除,0正常',
  `type` tinyint(2) DEFAULT '0' COMMENT '所属模块类型 0admin 1home 2mobile 3api',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=126 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_system_menu1
-- ----------------------------
DROP TABLE IF EXISTS `tp_system_menu1`;
CREATE TABLE `tp_system_menu1` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '权限名字',
  `group` varchar(20) DEFAULT NULL COMMENT '所属分组',
  `right` text COMMENT '权限码(控制器+动作)',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '删除状态 1删除,0正常',
  `type` tinyint(2) DEFAULT '0' COMMENT '所属模块类型 0admin 1home 2mobile 3api',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_system_module
-- ----------------------------
DROP TABLE IF EXISTS `tp_system_module`;
CREATE TABLE `tp_system_module` (
  `mod_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `module` enum('top','menu','module') DEFAULT 'module',
  `level` tinyint(1) DEFAULT '3',
  `ctl` varchar(20) DEFAULT '',
  `act` varchar(30) DEFAULT '',
  `title` varchar(20) DEFAULT '',
  `visible` tinyint(1) DEFAULT '1',
  `parent_id` smallint(6) DEFAULT '0',
  `orderby` smallint(6) DEFAULT '50',
  `icon` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`mod_id`)
) ENGINE=MyISAM AUTO_INCREMENT=155 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_team_activity
-- ----------------------------
DROP TABLE IF EXISTS `tp_team_activity`;
CREATE TABLE `tp_team_activity` (
  `team_id` int(10) NOT NULL AUTO_INCREMENT,
  `act_name` varchar(255) NOT NULL DEFAULT '' COMMENT '拼团活动标题',
  `team_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '拼团活动类型,0分享团1佣金团2抽奖团',
  `time_limit` int(11) NOT NULL DEFAULT '0' COMMENT '成团有效期。单位（秒)',
  `needer` int(10) NOT NULL DEFAULT '2' COMMENT '需要成团人数',
  `goods_name` varchar(255) NOT NULL DEFAULT '' COMMENT '商品名称',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  `bonus` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '团长佣金',
  `stock_limit` int(11) NOT NULL DEFAULT '0' COMMENT '抽奖限量',
  `buy_limit` smallint(4) NOT NULL DEFAULT '0' COMMENT '单次团购买限制数0为不限制',
  `sales_sum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '已拼多少件',
  `virtual_num` int(10) NOT NULL DEFAULT '0' COMMENT '虚拟销售基数',
  `share_title` varchar(100) NOT NULL COMMENT '分享标题',
  `share_desc` varchar(255) NOT NULL COMMENT '分享描述',
  `share_img` varchar(150) DEFAULT NULL COMMENT '分享图片',
  `sort` smallint(4) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_recommend` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0关闭1正常',
  `is_lottery` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已经抽奖.1是，0否',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否已删除0否，1删除',
  PRIMARY KEY (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='拼团活动表';

-- ----------------------------
-- Table structure for tp_team_follow
-- ----------------------------
DROP TABLE IF EXISTS `tp_team_follow`;
CREATE TABLE `tp_team_follow` (
  `follow_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `follow_user_id` int(11) DEFAULT '0' COMMENT '参团会员id',
  `follow_user_nickname` varchar(100) DEFAULT NULL COMMENT '参团会员昵称',
  `follow_user_head_pic` varchar(255) DEFAULT NULL COMMENT '会员头像',
  `follow_time` int(11) DEFAULT '0' COMMENT '参团时间',
  `order_id` int(11) DEFAULT '0' COMMENT '订单id',
  `found_id` int(10) DEFAULT '0' COMMENT '开团ID',
  `found_user_id` int(11) DEFAULT '0' COMMENT '开团人user_id',
  `team_id` int(10) DEFAULT '0' COMMENT '拼团活动id',
  `status` tinyint(1) DEFAULT '0' COMMENT '参团状态0:待拼单(表示已下单但是未支付)1拼单成功(已支付)2成团成功3成团失败',
  `is_win` tinyint(1) DEFAULT '0' COMMENT '抽奖团是否中奖',
  PRIMARY KEY (`follow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='参团表';

-- ----------------------------
-- Table structure for tp_team_found
-- ----------------------------
DROP TABLE IF EXISTS `tp_team_found`;
CREATE TABLE `tp_team_found` (
  `found_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `found_time` int(11) DEFAULT '0' COMMENT '开团时间',
  `found_end_time` int(11) DEFAULT '0' COMMENT '成团截止时间',
  `user_id` int(11) DEFAULT '0' COMMENT '团长id',
  `team_id` int(10) DEFAULT '0' COMMENT '拼团活动id',
  `nickname` varchar(100) DEFAULT NULL COMMENT '团长用户名昵称',
  `head_pic` varchar(255) DEFAULT '' COMMENT '团长头像',
  `order_id` int(11) DEFAULT '0' COMMENT '团长订单id',
  `join` int(8) DEFAULT '1' COMMENT '已参团人数',
  `need` int(8) DEFAULT '1' COMMENT '需多少人成团',
  `price` decimal(10,2) DEFAULT '0.00' COMMENT '拼团价格',
  `goods_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品原价',
  `status` tinyint(1) DEFAULT '0' COMMENT '拼团状态0:待开团(表示已下单但是未支付)1:已经开团(团长已支付)2:拼团成功,3拼团失败',
  `bonus_status` tinyint(1) DEFAULT '0' COMMENT '团长佣金领取状态：0无1领取',
  PRIMARY KEY (`found_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='开团表';

-- ----------------------------
-- Table structure for tp_team_goods_item
-- ----------------------------
DROP TABLE IF EXISTS `tp_team_goods_item`;
CREATE TABLE `tp_team_goods_item` (
  `team_id` int(10) unsigned NOT NULL,
  `goods_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `item_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品规格ID',
  `team_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '拼团价',
  `sales_sum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '已拼多少件',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否已删除0否，1删除'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_team_lottery
-- ----------------------------
DROP TABLE IF EXISTS `tp_team_lottery`;
CREATE TABLE `tp_team_lottery` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT '0' COMMENT '幸运儿手机',
  `order_id` int(11) DEFAULT '0' COMMENT '订单id',
  `order_sn` varchar(50) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT '' COMMENT '幸运儿手机',
  `team_id` int(11) DEFAULT '0' COMMENT '拼团活动ID',
  `nickname` varchar(100) DEFAULT '' COMMENT '会员昵称',
  `head_pic` varchar(150) DEFAULT '' COMMENT '幸运儿头像',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_template_class
-- ----------------------------
DROP TABLE IF EXISTS `tp_template_class`;
CREATE TABLE `tp_template_class` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) unsigned DEFAULT NULL,
  `type` tinyint(2) unsigned DEFAULT NULL COMMENT '类型  1行业  2风格',
  `name` varchar(64) DEFAULT NULL COMMENT '行业或风格名称',
  `sort_order` int(11) unsigned DEFAULT '0' COMMENT '排序',
  `add_time` int(11) unsigned DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_topic
-- ----------------------------
DROP TABLE IF EXISTS `tp_topic`;
CREATE TABLE `tp_topic` (
  `topic_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `topic_title` varchar(100) DEFAULT NULL COMMENT '专题标题',
  `topic_image` varchar(100) DEFAULT NULL COMMENT '专题封面',
  `topic_background_color` varchar(20) DEFAULT NULL COMMENT '专题背景颜色',
  `topic_background` varchar(100) DEFAULT NULL COMMENT '专题背景图',
  `topic_content` text COMMENT '专题详情',
  `topic_repeat` varchar(20) DEFAULT '' COMMENT '背景重复方式',
  `topic_state` tinyint(1) DEFAULT '1' COMMENT '专题状态1-草稿、2-已发布',
  `topic_margin_top` tinyint(3) DEFAULT '0' COMMENT '正文距顶部距离',
  `ctime` int(11) DEFAULT NULL COMMENT '专题创建时间',
  PRIMARY KEY (`topic_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_users
-- ----------------------------
DROP TABLE IF EXISTS `tp_users`;
CREATE TABLE `tp_users` (
  `user_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `email` varchar(60) NOT NULL DEFAULT '' COMMENT '邮件',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `paypwd` varchar(32) DEFAULT NULL COMMENT '支付密码',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 保密 1 男 2 女',
  `birthday` int(11) NOT NULL DEFAULT '0' COMMENT '生日',
  `withdrawal_total_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '用户提现累计总金额',
  `user_total_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '用户充值累计总金额',
  `user_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '用户金额',
  `frozen_money` decimal(10,2) DEFAULT '0.00' COMMENT '冻结金额',
  `distribut_money` decimal(10,2) DEFAULT '0.00' COMMENT '累积分佣金额',
  `distribut_withdrawals_money` decimal(10,2) DEFAULT '0.00' COMMENT '累积分销佣金提现',
  `underling_number` int(5) DEFAULT '0' COMMENT '用户下线总数',
  `pay_points` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '消费积分',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `qq` varchar(20) NOT NULL DEFAULT '' COMMENT 'QQ',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号码',
  `mobile_validated` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否验证手机',
  `oauth` varchar(10) DEFAULT '' COMMENT '第三方来源 wx weibo alipay',
  `openid` varchar(100) DEFAULT NULL COMMENT '第三方唯一标示',
  `unionid` varchar(100) DEFAULT NULL,
  `head_pic` varchar(255) DEFAULT NULL COMMENT '头像',
  `province` int(6) DEFAULT '0' COMMENT '省份',
  `city` int(6) DEFAULT '0' COMMENT '市区',
  `district` int(6) DEFAULT '0' COMMENT '县',
  `email_validated` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否验证电子邮箱',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '第三方返回昵称',
  `level` tinyint(1) DEFAULT '1' COMMENT '会员等级',
  `discount` decimal(10,2) DEFAULT '1.00' COMMENT '会员折扣，默认1不享受',
  `total_amount` decimal(10,2) DEFAULT '0.00' COMMENT '消费累计额度',
  `is_lock` tinyint(1) DEFAULT '0' COMMENT '是否被锁定冻结',
  `is_distribut` tinyint(1) DEFAULT '0' COMMENT '是否为分销商 0 否 1 是',
  `dis_auditing` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '合伙人审核状态  0:无 2:待审核 1:审核通过 3:审核不通过',
  `dis_failure_note` varchar(255) NOT NULL DEFAULT '' COMMENT '合伙人审核驳回原因',
  `dis_apply_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '申请合伙人时间',
  `first_leader` int(11) DEFAULT '0' COMMENT '第一个上级',
  `second_leader` int(11) DEFAULT '0' COMMENT '第二个上级',
  `third_leader` int(11) DEFAULT '0' COMMENT '第三个上级',
  `token` varchar(64) DEFAULT '' COMMENT '用于app 授权类似于session_id',
  `message_mask` tinyint(1) NOT NULL DEFAULT '63' COMMENT '消息掩码',
  `push_id` varchar(30) NOT NULL DEFAULT '' COMMENT '推送id',
  `distribut_level` tinyint(2) DEFAULT '0' COMMENT '分销商等级',
  `is_vip` tinyint(1) DEFAULT '0' COMMENT '是否为VIP ：0不是，1是',
  `xcx_qrcode` varchar(255) DEFAULT NULL COMMENT '小程序专属二维码',
  `poster` varchar(255) DEFAULT NULL COMMENT '专属推广海报',
  PRIMARY KEY (`user_id`),
  KEY `email` (`email`),
  KEY `underling_number` (`underling_number`),
  KEY `mobile` (`mobile_validated`),
  KEY `openid` (`openid`),
  KEY `unionid` (`unionid`)
) ENGINE=InnoDB AUTO_INCREMENT=690 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_user_address
-- ----------------------------
DROP TABLE IF EXISTS `tp_user_address`;
CREATE TABLE `tp_user_address` (
  `address_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `consignee` varchar(60) NOT NULL DEFAULT '' COMMENT '收货人',
  `email` varchar(60) NOT NULL DEFAULT '' COMMENT '邮箱地址',
  `country` int(11) NOT NULL DEFAULT '0' COMMENT '国家',
  `province` int(11) NOT NULL DEFAULT '0' COMMENT '省份',
  `city` int(11) NOT NULL DEFAULT '0' COMMENT '城市',
  `district` int(11) NOT NULL DEFAULT '0' COMMENT '地区',
  `twon` int(11) DEFAULT '0' COMMENT '乡镇',
  `address` varchar(120) NOT NULL DEFAULT '' COMMENT '地址',
  `zipcode` varchar(60) NOT NULL DEFAULT '' COMMENT '邮政编码',
  `mobile` varchar(60) NOT NULL DEFAULT '' COMMENT '手机',
  `is_default` tinyint(1) DEFAULT '0' COMMENT '默认收货地址',
  `longitude` decimal(10,7) NOT NULL DEFAULT '0.0000000' COMMENT '地址经度',
  `latitude` decimal(10,7) NOT NULL DEFAULT '0.0000000' COMMENT '地址纬度',
  PRIMARY KEY (`address_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=489 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_user_collection
-- ----------------------------
DROP TABLE IF EXISTS `tp_user_collection`;
CREATE TABLE `tp_user_collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户下载收集表',
  `mobile` varchar(11) DEFAULT '' COMMENT '用户手机号',
  `contact` varchar(32) DEFAULT '' COMMENT '联系人',
  `why_down` varchar(32) DEFAULT '' COMMENT '下载原因',
  `add_time` int(11) DEFAULT '0' COMMENT '申请时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_user_distribution
-- ----------------------------
DROP TABLE IF EXISTS `tp_user_distribution`;
CREATE TABLE `tp_user_distribution` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '分销会员id',
  `user_name` varchar(50) DEFAULT NULL COMMENT '会员昵称',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品id',
  `goods_name` varchar(150) DEFAULT NULL COMMENT '商品名称',
  `cat_id` smallint(6) DEFAULT '0' COMMENT '商品分类ID',
  `brand_id` mediumint(8) DEFAULT '0' COMMENT '商品品牌',
  `share_num` int(10) DEFAULT '0' COMMENT '分享次数',
  `sales_num` int(11) DEFAULT '0' COMMENT '分销销量',
  `addtime` int(11) DEFAULT NULL COMMENT '加入个人分销库时间',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户选择分销商品表';

-- ----------------------------
-- Table structure for tp_user_extend
-- ----------------------------
DROP TABLE IF EXISTS `tp_user_extend`;
CREATE TABLE `tp_user_extend` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT '0',
  `invoice_title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '发票抬头',
  `taxpayer` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '纳税人识别号',
  `invoice_desc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '不开发票/明细',
  `realname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '真实姓名',
  `idcard` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '身份证号',
  `cash_alipay` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '提现支付宝号',
  `cash_unionpay` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '提现银行卡号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tp_user_label
-- ----------------------------
DROP TABLE IF EXISTS `tp_user_label`;
CREATE TABLE `tp_user_label` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '标签名称',
  `label_name` char(30) NOT NULL COMMENT '标签名称',
  `label_order` tinyint(2) NOT NULL COMMENT '标签排序',
  `label_code` varchar(80) NOT NULL COMMENT '标签图片',
  `label_describe` varchar(255) DEFAULT NULL COMMENT '标签描述',
  `is_recommend` enum('1','0') NOT NULL DEFAULT '0' COMMENT '是否推荐:0=否,1=是',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_user_level
-- ----------------------------
DROP TABLE IF EXISTS `tp_user_level`;
CREATE TABLE `tp_user_level` (
  `level_id` smallint(4) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `level_name` varchar(30) DEFAULT NULL COMMENT '头衔名称',
  `amount` decimal(10,2) DEFAULT NULL COMMENT '等级必要金额',
  `discount` smallint(4) DEFAULT '0' COMMENT '折扣',
  `describe` varchar(200) DEFAULT NULL COMMENT '头街 描述',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员类别： 0 = 普通会员 ， 1 = 高级会员',
  PRIMARY KEY (`level_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_user_login
-- ----------------------------
DROP TABLE IF EXISTS `tp_user_login`;
CREATE TABLE `tp_user_login` (
  `login_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `login_ip` varchar(255) DEFAULT NULL COMMENT 'ip地址',
  `log_ip_location` varchar(255) DEFAULT NULL COMMENT 'ip地址所属地',
  `login_time` int(11) DEFAULT NULL COMMENT '登录时间',
  PRIMARY KEY (`login_id`)
) ENGINE=MyISAM AUTO_INCREMENT=601 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户登录记录';

-- ----------------------------
-- Table structure for tp_user_message
-- ----------------------------
DROP TABLE IF EXISTS `tp_user_message`;
CREATE TABLE `tp_user_message` (
  `rec_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `message_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '消息id',
  `category` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '通知消息：0, 活动消息：1, 物流:2, 私信:3',
  `is_see` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否查看：0未查看, 1已查看',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户假删除标识,1:删除,0未删除',
  PRIMARY KEY (`rec_id`),
  KEY `user_id` (`user_id`),
  KEY `message_id` (`message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='用户的消息表';

-- ----------------------------
-- Table structure for tp_user_msg_tpl
-- ----------------------------
DROP TABLE IF EXISTS `tp_user_msg_tpl`;
CREATE TABLE `tp_user_msg_tpl` (
  `mmt_code` varchar(50) NOT NULL COMMENT '用户消息模板编号',
  `mmt_name` varchar(50) NOT NULL COMMENT '模板名称',
  `mmt_message_switch` tinyint(3) unsigned NOT NULL COMMENT '站内信接收开关',
  `mmt_message_content` varchar(255) NOT NULL COMMENT '站内信消息内容',
  `mmt_short_switch` tinyint(3) unsigned NOT NULL COMMENT '短信接收开关',
  `mmt_short_content` varchar(255) DEFAULT NULL COMMENT '短信接收内容',
  `mmt_short_sign` varchar(50) DEFAULT NULL COMMENT '短信签名',
  `mmt_short_code` varchar(50) DEFAULT NULL COMMENT '短信模板ID',
  `mmt_mail_switch` tinyint(3) unsigned NOT NULL COMMENT '邮件接收开关',
  `mmt_mail_subject` varchar(255) DEFAULT NULL COMMENT '邮件标题',
  `mmt_mail_content` text COMMENT '邮件内容',
  PRIMARY KEY (`mmt_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户消息模板';

-- ----------------------------
-- Table structure for tp_user_sign
-- ----------------------------
DROP TABLE IF EXISTS `tp_user_sign`;
CREATE TABLE `tp_user_sign` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT '0' COMMENT '用户id',
  `sign_total` int(11) DEFAULT '0' COMMENT '累计签到天数',
  `sign_count` int(11) DEFAULT '0' COMMENT '连续签到天数',
  `sign_last` char(11) DEFAULT '0' COMMENT '最后签到时间，时间格式20170907',
  `sign_time` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '历史签到时间，以逗号隔开',
  `cumtrapz` int(11) DEFAULT '0' COMMENT '用户累计签到总积分',
  `this_month` int(6) DEFAULT NULL COMMENT '本月累计积分',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tp_user_store
-- ----------------------------
DROP TABLE IF EXISTS `tp_user_store`;
CREATE TABLE `tp_user_store` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `store_name` varchar(50) DEFAULT NULL COMMENT '店铺名',
  `true_name` varchar(50) DEFAULT NULL COMMENT '真名',
  `qq` varchar(20) NOT NULL DEFAULT '' COMMENT 'QQ',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号码',
  `store_img` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺图片',
  `store_time` int(10) unsigned NOT NULL COMMENT '开店时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `mobile` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='用户店铺信息表';

-- ----------------------------
-- Table structure for tp_virtual_shop
-- ----------------------------
DROP TABLE IF EXISTS `tp_virtual_shop`;
CREATE TABLE `tp_virtual_shop` (
  `user_id` int(11) DEFAULT NULL,
  `shop_name` varchar(100) DEFAULT NULL COMMENT '店铺名称',
  `shop_level` tinyint(1) DEFAULT '0' COMMENT '店铺等级',
  `shop_intro` text COMMENT '店铺介绍',
  `shop_logo` varchar(255) DEFAULT NULL COMMENT '店铺logo',
  `shop_phone` varchar(20) DEFAULT NULL,
  `shop_qq` varchar(20) DEFAULT NULL,
  `shop_theme` tinyint(1) DEFAULT '0' COMMENT '店铺模板风格'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分销商虚拟店铺表';

-- ----------------------------
-- Table structure for tp_vr_order_code
-- ----------------------------
DROP TABLE IF EXISTS `tp_vr_order_code`;
CREATE TABLE `tp_vr_order_code` (
  `rec_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '兑换码表索引id',
  `order_id` int(11) NOT NULL COMMENT '虚拟订单id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '买家ID',
  `vr_code` varchar(18) NOT NULL DEFAULT '' COMMENT '兑换码',
  `vr_state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '使用状态 0:(默认)未使用1:已使用2:已过期',
  `vr_usetime` int(11) NOT NULL DEFAULT '0' COMMENT '使用时间',
  `pay_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '实际支付金额(结算)',
  `vr_indate` int(11) NOT NULL DEFAULT '0' COMMENT '过期时间',
  `refund_lock` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '退款锁定状态:0为正常,1为锁定,2为同意,默认为0',
  `vr_invalid_refund` tinyint(4) NOT NULL DEFAULT '1' COMMENT '允许过期退款1是0否',
  PRIMARY KEY (`rec_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='兑换码表';

-- ----------------------------
-- Table structure for tp_withdrawals
-- ----------------------------
DROP TABLE IF EXISTS `tp_withdrawals`;
CREATE TABLE `tp_withdrawals` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '提现申请表',
  `user_id` int(11) DEFAULT '0' COMMENT '用户id',
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '提现金额',
  `create_time` int(11) DEFAULT '0' COMMENT '申请时间',
  `check_time` int(11) DEFAULT '0' COMMENT '审核时间',
  `pay_time` int(11) DEFAULT '0' COMMENT '支付时间',
  `refuse_time` int(11) DEFAULT '0' COMMENT '拒绝时间',
  `bank_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '银行名称 如支付宝 微信 中国银行 农业银行等',
  `bank_card` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '银行账号或支付宝账号',
  `realname` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '提款账号真实姓名',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '提现备注',
  `taxfee` decimal(10,2) DEFAULT '0.00' COMMENT '税收手续费',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态：-2删除作废-1审核失败0申请中1审核通过2付款成功3付款失败',
  `pay_code` varchar(100) DEFAULT NULL COMMENT '付款对账流水号',
  `error_code` varchar(255) DEFAULT NULL COMMENT '付款失败错误代码',
  `type` tinyint(1) DEFAULT '0' COMMENT '提现类型： 0 = 余额提现， 1 = 佣金提现',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_wx_img
-- ----------------------------
DROP TABLE IF EXISTS `tp_wx_img`;
CREATE TABLE `tp_wx_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表id',
  `keyword` char(255) NOT NULL COMMENT '关键词',
  `desc` text NOT NULL COMMENT '简介',
  `pic` char(255) NOT NULL COMMENT '封面图片',
  `url` char(255) NOT NULL COMMENT '图文外链地址',
  `createtime` varchar(13) NOT NULL COMMENT '创建时间',
  `uptatetime` varchar(13) NOT NULL COMMENT '更新时间',
  `token` char(30) NOT NULL COMMENT 'token',
  `title` varchar(60) NOT NULL COMMENT '标题',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  `goods_name` varchar(50) DEFAULT NULL COMMENT '商品名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='微信图文';

-- ----------------------------
-- Table structure for tp_wx_keyword
-- ----------------------------
DROP TABLE IF EXISTS `tp_wx_keyword`;
CREATE TABLE `tp_wx_keyword` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '微信关键词表',
  `keyword` char(255) NOT NULL,
  `pid` int(11) NOT NULL COMMENT '对应表ID，如wx_reply的id',
  `type` varchar(30) NOT NULL COMMENT '关键词操作类型 auto_reply',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_wx_material
-- ----------------------------
DROP TABLE IF EXISTS `tp_wx_material`;
CREATE TABLE `tp_wx_material` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '微信公众号素材',
  `media_id` varchar(64) DEFAULT '' COMMENT '微信媒体id',
  `type` varchar(10) NOT NULL COMMENT '素材类型：text、image、news、video',
  `data` text COMMENT 'json数据',
  `update_time` int(10) unsigned DEFAULT NULL COMMENT '更新时间',
  `key` char(32) DEFAULT NULL COMMENT '便于查询的key，现用于image',
  PRIMARY KEY (`id`),
  KEY `media_id` (`media_id`),
  KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_wx_menu
-- ----------------------------
DROP TABLE IF EXISTS `tp_wx_menu`;
CREATE TABLE `tp_wx_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` tinyint(1) DEFAULT '1' COMMENT '菜单级别',
  `name` varchar(50) NOT NULL DEFAULT '',
  `sort` int(5) DEFAULT '0' COMMENT '排序',
  `type` varchar(20) DEFAULT '' COMMENT '0 view 1 click',
  `value` varchar(255) DEFAULT NULL,
  `token` varchar(50) NOT NULL DEFAULT '',
  `pid` int(11) DEFAULT '0' COMMENT '上级菜单',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_wx_msg
-- ----------------------------
DROP TABLE IF EXISTS `tp_wx_msg`;
CREATE TABLE `tp_wx_msg` (
  `msgid` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL COMMENT '系统用户ID',
  `titile` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `createtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `sendtime` int(11) NOT NULL DEFAULT '0' COMMENT '发送时间',
  `issend` tinyint(1) DEFAULT '0' COMMENT '0未发送1成功2失败',
  `sendtype` tinyint(1) DEFAULT '1' COMMENT '0单人1所有',
  PRIMARY KEY (`msgid`),
  KEY `uid` (`admin_id`),
  KEY `createymd` (`sendtime`),
  KEY `fake_id` (`titile`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_wx_news
-- ----------------------------
DROP TABLE IF EXISTS `tp_wx_news`;
CREATE TABLE `tp_wx_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '图文子素材id',
  `update_time` int(10) unsigned DEFAULT NULL COMMENT '更新时间',
  `title` varchar(64) DEFAULT '' COMMENT '标题',
  `material_id` int(10) unsigned DEFAULT NULL COMMENT '图片素材id，一个图片为素材可包括几个子图文',
  `author` varchar(8) DEFAULT '' COMMENT '作者',
  `content` text COMMENT 'html内容',
  `digest` varchar(120) DEFAULT '' COMMENT '摘要',
  `thumb_url` text COMMENT '封面链接',
  `thumb_media_id` varchar(64) DEFAULT '' COMMENT '封面媒体id',
  `content_source_url` text COMMENT '原文链接',
  `show_cover_pic` int(1) DEFAULT '0' COMMENT '是否显示封面',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信图文';

-- ----------------------------
-- Table structure for tp_wx_reply
-- ----------------------------
DROP TABLE IF EXISTS `tp_wx_reply`;
CREATE TABLE `tp_wx_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '微信关键词回复表',
  `rule` varchar(32) DEFAULT NULL COMMENT '规则名',
  `update_time` int(10) unsigned DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL COMMENT '回复类型keyword,default,follow',
  `msg_type` varchar(10) DEFAULT NULL COMMENT '回复消息类型text,news',
  `data` text COMMENT 'text使用该自动存储文本',
  `material_id` int(10) unsigned DEFAULT NULL COMMENT 'news、image的素材id等',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_wx_text
-- ----------------------------
DROP TABLE IF EXISTS `tp_wx_text`;
CREATE TABLE `tp_wx_text` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `uname` varchar(90) NOT NULL COMMENT '用户名',
  `keyword` char(255) NOT NULL COMMENT '关键词',
  `precisions` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'precisions',
  `text` text NOT NULL COMMENT 'text',
  `createtime` varchar(13) NOT NULL COMMENT '创建时间',
  `updatetime` varchar(13) NOT NULL COMMENT '更新时间',
  `click` int(11) NOT NULL COMMENT '点击',
  `token` char(30) NOT NULL COMMENT 'token',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文本回复表';

-- ----------------------------
-- Table structure for tp_wx_tpl_msg
-- ----------------------------
DROP TABLE IF EXISTS `tp_wx_tpl_msg`;
CREATE TABLE `tp_wx_tpl_msg` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '微信模板消息',
  `title` varchar(32) CHARACTER SET gbk COLLATE gbk_chinese_ci DEFAULT '' COMMENT '模板标题',
  `template_sn` varchar(64) CHARACTER SET gbk COLLATE gbk_chinese_ci DEFAULT '' COMMENT '模板编号',
  `template_id` varchar(64) CHARACTER SET gbk COLLATE gbk_chinese_ci DEFAULT '' COMMENT '模板id',
  `remark` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci DEFAULT '' COMMENT '留言',
  `is_use` tinyint(1) DEFAULT '0' COMMENT '该模板是否启用',
  `add_time` int(10) unsigned DEFAULT NULL COMMENT '添加模板的时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_wx_user
-- ----------------------------
DROP TABLE IF EXISTS `tp_wx_user`;
CREATE TABLE `tp_wx_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表id',
  `uid` int(11) NOT NULL COMMENT 'uid',
  `wxname` varchar(60) NOT NULL DEFAULT '' COMMENT '公众号名称',
  `aeskey` varchar(256) NOT NULL DEFAULT '' COMMENT 'aeskey',
  `encode` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'encode',
  `appid` varchar(50) NOT NULL DEFAULT '' COMMENT 'appid',
  `appsecret` varchar(50) NOT NULL DEFAULT '' COMMENT 'appsecret',
  `wxid` varchar(64) NOT NULL DEFAULT '' COMMENT '公众号原始ID',
  `weixin` char(64) NOT NULL COMMENT '微信号',
  `headerpic` char(255) NOT NULL COMMENT '头像地址',
  `token` char(255) NOT NULL COMMENT 'token',
  `w_token` varchar(150) NOT NULL DEFAULT '' COMMENT '微信对接token',
  `create_time` int(11) NOT NULL COMMENT 'create_time',
  `updatetime` int(11) NOT NULL COMMENT 'updatetime',
  `tplcontentid` varchar(2) NOT NULL DEFAULT '' COMMENT '内容模版ID',
  `share_ticket` varchar(150) NOT NULL DEFAULT '' COMMENT '分享ticket',
  `share_dated` char(15) NOT NULL COMMENT 'share_dated',
  `authorizer_access_token` varchar(200) NOT NULL DEFAULT '' COMMENT 'authorizer_access_token',
  `authorizer_refresh_token` varchar(200) NOT NULL DEFAULT '' COMMENT 'authorizer_refresh_token',
  `authorizer_expires` char(10) NOT NULL COMMENT 'authorizer_expires',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '类型',
  `web_access_token` varchar(200) DEFAULT '' COMMENT ' 网页授权token',
  `web_refresh_token` varchar(200) DEFAULT '' COMMENT 'web_refresh_token',
  `web_expires` int(11) NOT NULL COMMENT '过期时间',
  `qr` varchar(200) NOT NULL DEFAULT '' COMMENT 'qr',
  `menu_config` text COMMENT '菜单',
  `wait_access` tinyint(1) DEFAULT '0' COMMENT '微信接入状态,0待接入1已接入',
  `bell_openid` text,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`) USING BTREE,
  KEY `uid_2` (`uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='微信公共帐号';

-- ----------------------------
-- Table structure for t_administrative_regions
-- ----------------------------
DROP TABLE IF EXISTS `t_administrative_regions`;
CREATE TABLE `t_administrative_regions` (
  `code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '行政区代码',
  `country_code` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '国家代码',
  `h_code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '上级行政区代码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '行政区名称',
  `level` int(11) NOT NULL COMMENT '行政级别：1:省、自治区、直辖市;2:市;3区、县',
  `area_code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '电话区号',
  `post_code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮政编码',
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`country_code`,`code`),
  UNIQUE KEY `UK_t_global_ar_code` (`country_code`,`code`),
  KEY `NAME` (`name`) USING BTREE,
  KEY `IDX_t_administrative_regions_code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='行政区域表';
