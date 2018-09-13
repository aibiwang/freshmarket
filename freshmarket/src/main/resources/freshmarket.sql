/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1_3306
Source Server Version : 50018
Source Host           : 127.0.0.1:3306
Source Database       : freshmarket

Target Server Type    : MYSQL
Target Server Version : 50018
File Encoding         : 65001

Date: 2018-09-13 14:18:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tbl_category
-- ----------------------------
DROP TABLE IF EXISTS `tbl_category`;
CREATE TABLE `tbl_category` (
  `category_id` int(11) NOT NULL auto_increment,
  `category_name` varchar(255) default NULL,
  `parent_id` int(11) default '0',
  PRIMARY KEY  (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_category
-- ----------------------------
INSERT INTO `tbl_category` VALUES ('1', '新鲜水果', '0');
INSERT INTO `tbl_category` VALUES ('2', '海鲜水产', '0');
INSERT INTO `tbl_category` VALUES ('3', '猪肉羊肉', '0');
INSERT INTO `tbl_category` VALUES ('4', '禽类蛋品', '0');
INSERT INTO `tbl_category` VALUES ('5', '新鲜蔬菜', '0');
INSERT INTO `tbl_category` VALUES ('6', '速冻食品', '0');

-- ----------------------------
-- Table structure for tbl_goods
-- ----------------------------
DROP TABLE IF EXISTS `tbl_goods`;
CREATE TABLE `tbl_goods` (
  `goods_id` int(11) NOT NULL auto_increment,
  `goods_name` varchar(255) default NULL,
  `inprice` double(10,2) default NULL,
  `saleprice` double(10,2) default NULL,
  `category_id` int(11) default NULL,
  `goods_reservenum` int(255) default NULL,
  `goods_desc` varchar(255) default NULL,
  `goods_putdate` date default NULL,
  `goods_putstatus` varchar(255) default '上架',
  `goods_pic` varchar(255) default NULL,
  PRIMARY KEY  (`goods_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `category_id` FOREIGN KEY (`category_id`) REFERENCES `tbl_category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_goods
-- ----------------------------
INSERT INTO `tbl_goods` VALUES ('1', '苹果', '3.50', '6.00', '1', '100', '红富士苹果', '2018-09-12', '上架', 'images/goods/qinpingguo.jpg');
INSERT INTO `tbl_goods` VALUES ('2', '葡萄', '4.50', '5.50', '1', '60', '水晶葡萄', '2018-09-10', '上架', 'images/goods/putao.jpg');
INSERT INTO `tbl_goods` VALUES ('3', '小龙虾', '35.00', '45.00', '2', '55', '鲜活小龙虾', '2018-09-12', '上架', 'images/goods/xiaolongxia.jpg');
INSERT INTO `tbl_goods` VALUES ('4', '草莓', '2.50', '3.00', '1', '45', '新鲜草莓', '2018-09-09', '上架', 'images/goods/caomei.jpg');
INSERT INTO `tbl_goods` VALUES ('5', '牛肉', '15.00', '20.00', '3', '55', '进口牛肉', '2018-09-12', '上架', 'images/goods/niurou.jpg');
INSERT INTO `tbl_goods` VALUES ('6', '秋刀鱼', '16.50', '22.50', '2', '60', '台北秋刀鱼', '2018-09-11', '上架', 'images/goods/qiudaoyu.jpg');
INSERT INTO `tbl_goods` VALUES ('7', '鸡蛋', '8.50', '10.50', '4', '20', '新鲜农家鸡蛋', '2018-09-12', '上架', 'images/goods/jidan.png');
INSERT INTO `tbl_goods` VALUES ('8', '土豆', '3.50', '5.00', '5', '50', '刚出土的土豆', '2018-09-11', '上架', 'images/goods/tudou.jpg');
INSERT INTO `tbl_goods` VALUES ('9', '速冻水饺', '8.50', '10.00', '6', '20', '速冻水饺', '2018-09-13', '上架', 'images/goods/suijiao.jpg');

-- ----------------------------
-- Table structure for tbl_opinion
-- ----------------------------
DROP TABLE IF EXISTS `tbl_opinion`;
CREATE TABLE `tbl_opinion` (
  `opinion_id` int(11) NOT NULL auto_increment,
  `order_id` int(11) default NULL,
  `content` varchar(255) default NULL,
  `satisfy` int(255) default NULL,
  `opinion_date` date default NULL,
  PRIMARY KEY  (`opinion_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `order_id
order_id
order_id` FOREIGN KEY (`order_id`) REFERENCES `tbl_order` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_id` FOREIGN KEY (`order_id`) REFERENCES `tbl_order` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_opinion
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_order
-- ----------------------------
DROP TABLE IF EXISTS `tbl_order`;
CREATE TABLE `tbl_order` (
  `order_id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `order_totalprice` double(10,0) default NULL,
  `receiver_addr` varchar(255) default NULL,
  `receiver_name` varchar(255) default NULL,
  `receiver_phone` varchar(255) default NULL,
  `payment` varchar(255) default NULL,
  `order_meno` int(11) default NULL,
  `order_date` datetime default NULL,
  `send_date` datetime default NULL,
  `tag` varchar(255) default NULL,
  PRIMARY KEY  (`order_id`),
  KEY `order_user_id` (`user_id`),
  CONSTRAINT `order_user_id` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_order
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_orderitem
-- ----------------------------
DROP TABLE IF EXISTS `tbl_orderitem`;
CREATE TABLE `tbl_orderitem` (
  `orderItem_id` int(11) NOT NULL auto_increment,
  `order_id` int(11) default NULL,
  `goods_id` int(11) default NULL,
  `goodscount` int(255) default NULL,
  `orderItem_totalprice` double default NULL,
  PRIMARY KEY  (`orderItem_id`),
  KEY `item_order_id` (`order_id`),
  KEY `item_goods_id` (`goods_id`),
  CONSTRAINT `item_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `tbl_goods` (`goods_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `item_order_id` FOREIGN KEY (`order_id`) REFERENCES `tbl_order` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_orderitem
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_picture
-- ----------------------------
DROP TABLE IF EXISTS `tbl_picture`;
CREATE TABLE `tbl_picture` (
  `pic_id` int(11) NOT NULL auto_increment,
  `pic_name` varchar(255) default NULL,
  `goods_id` int(11) default NULL,
  PRIMARY KEY  (`pic_id`),
  KEY `pic_goods_id` (`goods_id`),
  CONSTRAINT `pic_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `tbl_goods` (`goods_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_picture
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_shopcart
-- ----------------------------
DROP TABLE IF EXISTS `tbl_shopcart`;
CREATE TABLE `tbl_shopcart` (
  `cartitem_id` int(11) NOT NULL auto_increment,
  `cart_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `goodscount` double default NULL,
  PRIMARY KEY  (`cartitem_id`),
  KEY `cart_id` (`cart_id`),
  KEY `cart_goods_id` (`goods_id`),
  CONSTRAINT `cart_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `tbl_goods` (`goods_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cart_id` FOREIGN KEY (`cart_id`) REFERENCES `tbl_user` (`cart_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_shopcart
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_user
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user` (
  `user_id` int(11) NOT NULL auto_increment,
  `user_name` varchar(255) NOT NULL,
  `user_pwd` varchar(255) NOT NULL,
  `user_type` varchar(255) default '普通用户',
  `user_phone` varchar(255) NOT NULL,
  `user_email` varchar(255) default NULL,
  `user_addr` varchar(255) default NULL,
  `cart_id` int(11) NOT NULL,
  `user_money` double(255,0) NOT NULL,
  PRIMARY KEY  (`user_id`),
  KEY `cart_id` (`cart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_user
-- ----------------------------
