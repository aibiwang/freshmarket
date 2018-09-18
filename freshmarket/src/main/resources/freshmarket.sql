/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1_3306
Source Server Version : 50558
Source Host           : 127.0.0.1:3306
Source Database       : freshmarket

Target Server Type    : MYSQL
Target Server Version : 50558
File Encoding         : 65001

Date: 2018-09-18 09:02:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tbl_category
-- ----------------------------
DROP TABLE IF EXISTS `tbl_category`;
CREATE TABLE `tbl_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT '0',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

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
  `goods_id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(255) DEFAULT NULL,
  `inprice` double(10,2) DEFAULT NULL,
  `saleprice` double(10,2) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `goods_reservenum` int(255) DEFAULT NULL,
  `goods_desc` varchar(255) DEFAULT NULL,
  `goods_putdate` date DEFAULT NULL,
  `goods_putstatus` varchar(255) DEFAULT '上架',
  `goods_pic` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`goods_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `category_id` FOREIGN KEY (`category_id`) REFERENCES `tbl_category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

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
  `opinion_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `satisfy` int(255) DEFAULT NULL,
  `opinion_date` date DEFAULT NULL,
  PRIMARY KEY (`opinion_id`),
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
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `order_totalprice` double(10,2) DEFAULT NULL,
  `receiver_addr` varchar(255) DEFAULT NULL,
  `receiver_name` varchar(255) DEFAULT NULL,
  `receiver_phone` varchar(255) DEFAULT NULL,
  `payment` varchar(255) DEFAULT NULL,
  `order_meno` varchar(255) DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  `send_date` datetime DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `order_pingjiashijian` datetime DEFAULT NULL,
  `order_pingjianeirong` varchar(255) DEFAULT NULL,
  `order_pingjiamanyidu` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `order_user_id` (`user_id`),
  CONSTRAINT `order_user_id` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_order
-- ----------------------------
INSERT INTO `tbl_order` VALUES ('1', '1', '12.00', '衡阳', 'dbh', '183977189219', '支付宝', '请尽快送达', '2018-09-12 22:42:36', '2018-10-03 22:42:40', '待支付', '2018-09-17 22:45:52', '忽然回头', '3');
INSERT INTO `tbl_order` VALUES ('2', '1', '40.00', '衡阳', 'dbh', '183977189219', '支付宝', '请尽快送达', '2018-09-14 09:34:51', '2018-09-14 09:34:54', '已评价', '2018-09-18 00:21:01', 'haaaaaaaaaaaaaaaaaaaaa', '5');
INSERT INTO `tbl_order` VALUES ('3', '1', '30.00', '衡阳', 'dbh', '183977189219', '支付宝', '请尽快送达', '2018-09-19 09:35:47', '2018-09-14 09:35:50', '待评价', '2018-09-17 22:47:41', '不仅好吃', '4');
INSERT INTO `tbl_order` VALUES ('4', '1', '20.00', '长沙', 'dbh', '183977189219', '支付宝', '请尽快送达', '2018-09-12 09:36:37', '2018-09-14 09:36:40', '待评价', null, null, null);
INSERT INTO `tbl_order` VALUES ('5', '1', '1.00', '外国', 'dbh', '183977189219', '支付宝', '请尽快送达', '2018-08-28 23:53:23', '2018-09-19 23:53:26', '已评价', '2018-09-18 00:09:01', 'hahhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh', '5');

-- ----------------------------
-- Table structure for tbl_orderitem
-- ----------------------------
DROP TABLE IF EXISTS `tbl_orderitem`;
CREATE TABLE `tbl_orderitem` (
  `orderItem_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `goodscount` int(255) DEFAULT NULL,
  `orderItem_totalprice` double DEFAULT NULL,
  PRIMARY KEY (`orderItem_id`),
  KEY `item_order_id` (`order_id`),
  KEY `item_goods_id` (`goods_id`),
  CONSTRAINT `item_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `tbl_goods` (`goods_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `item_order_id` FOREIGN KEY (`order_id`) REFERENCES `tbl_order` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_orderitem
-- ----------------------------
INSERT INTO `tbl_orderitem` VALUES ('1', '1', '1', '5', '3');
INSERT INTO `tbl_orderitem` VALUES ('2', '1', '1', '6', '8');
INSERT INTO `tbl_orderitem` VALUES ('3', '2', '5', '2', '4');
INSERT INTO `tbl_orderitem` VALUES ('4', '3', '3', '4', '6');
INSERT INTO `tbl_orderitem` VALUES ('5', '4', '8', '1', '1');
INSERT INTO `tbl_orderitem` VALUES ('6', '5', '7', '8', '34');

-- ----------------------------
-- Table structure for tbl_picture
-- ----------------------------
DROP TABLE IF EXISTS `tbl_picture`;
CREATE TABLE `tbl_picture` (
  `pic_id` int(11) NOT NULL AUTO_INCREMENT,
  `pic_name` varchar(255) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`pic_id`),
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
  `cartitem_id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `goodscount` double DEFAULT NULL,
  PRIMARY KEY (`cartitem_id`),
  KEY `cart_id` (`cart_id`),
  KEY `cart_goods_id` (`goods_id`),
  CONSTRAINT `cart_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `tbl_goods` (`goods_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cart_id` FOREIGN KEY (`cart_id`) REFERENCES `tbl_user` (`cart_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_shopcart
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_user
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `user_pwd` varchar(255) NOT NULL,
  `user_type` varchar(255) DEFAULT '普通用户',
  `user_phone` varchar(255) NOT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `user_addr` varchar(255) DEFAULT NULL,
  `cart_id` int(11) NOT NULL,
  `user_money` double(255,2) DEFAULT '0.00',
  PRIMARY KEY (`user_id`),
  KEY `cart_id` (`cart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_user
-- ----------------------------
INSERT INTO `tbl_user` VALUES ('1', 'dbh', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', null, '0', null, null, '7325834', null);
INSERT INTO `tbl_user` VALUES ('4', '1', 'be777e1c1380a74447b462723b7002240abd5f2714187f240c63699ba9810ee5', '普通用户', '11', null, '我是地球人', '4479067', '0.00');
INSERT INTO `tbl_user` VALUES ('5', 'f', 'be777e1c1380a74447b462723b7002240abd5f2714187f240c63699ba9810ee5', '普通用户', 'a', null, '我是地球人', '8117964', '0.00');
INSERT INTO `tbl_user` VALUES ('6', 'a', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', '普通用户', '18397716486', null, '我是地球人', '4536034', '0.00');
INSERT INTO `tbl_user` VALUES ('7', 'jam', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', '普通用户', '18397716486', null, '我是地球人哈哈哈', '334429', '0.00');
