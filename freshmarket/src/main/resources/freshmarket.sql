/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1_3306
Source Server Version : 50558
Source Host           : 127.0.0.1:3306
Source Database       : freshmarket

Target Server Type    : MYSQL
Target Server Version : 50558
File Encoding         : 65001

Date: 2018-09-12 12:54:38
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_category
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_goods
-- ----------------------------
DROP TABLE IF EXISTS `tbl_goods`;
CREATE TABLE `tbl_goods` (
  `goods_id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(255) DEFAULT NULL,
  `inprice` double(10,0) DEFAULT NULL,
  `saleprice` double(10,0) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `goods_reservenum` int(255) DEFAULT NULL,
  `goods_desc` varchar(255) DEFAULT NULL,
  `goods_putdate` date DEFAULT NULL,
  `goods_putstatus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`goods_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `category_id` FOREIGN KEY (`category_id`) REFERENCES `tbl_category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_goods
-- ----------------------------

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
  `order_totalprice` double(10,0) DEFAULT NULL,
  `receiver_addr` varchar(255) DEFAULT NULL,
  `receiver_name` varchar(255) DEFAULT NULL,
  `receiver_phone` varchar(255) DEFAULT NULL,
  `payment` varchar(255) DEFAULT NULL,
  `order_meno` int(11) DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  `send_date` datetime DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_orderitem
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  PRIMARY KEY (`user_id`),
  KEY `cart_id` (`cart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_user
-- ----------------------------
INSERT INTO `tbl_user` VALUES ('1', 'k', '1', '普通用户', '12', '12', '21', '21');
