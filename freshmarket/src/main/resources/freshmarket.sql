/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1_3306
Source Server Version : 50018
Source Host           : 127.0.0.1:3306
Source Database       : freshmarket

Target Server Type    : MYSQL
Target Server Version : 50018
File Encoding         : 65001

Date: 2018-09-28 04:12:58
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
INSERT INTO `tbl_goods` VALUES ('1', '苹果', '3.50', '6.00', '1', '100', '红富士苹果', '2018-09-12', '上架中', 'images/goods/qinpingguo.jpg');
INSERT INTO `tbl_goods` VALUES ('2', '葡萄', '4.50', '5.50', '1', '60', '水晶葡萄', '2018-09-10', '上架中', 'images/goods/putao.jpg');
INSERT INTO `tbl_goods` VALUES ('3', '小龙虾', '35.00', '45.00', '2', '55', '鲜活小龙虾', '2018-09-12', '上架中', 'images/goods/xiaolongxia.jpg');
INSERT INTO `tbl_goods` VALUES ('4', '草莓', '2.50', '3.00', '1', '45', '新鲜草莓', '2018-09-09', '上架中', 'images/goods/caomei.jpg');
INSERT INTO `tbl_goods` VALUES ('5', '牛肉', '15.00', '20.00', '3', '55', '进口牛肉', '2018-09-12', '上架中', 'images/goods/niurou.jpg');
INSERT INTO `tbl_goods` VALUES ('6', '秋刀鱼', '16.50', '22.50', '2', '60', '台北秋刀鱼', '2018-09-11', '上架中', 'images/goods/qiudaoyu.jpg');
INSERT INTO `tbl_goods` VALUES ('7', '鸡蛋', '8.50', '10.50', '4', '20', '新鲜农家鸡蛋', '2018-09-12', '上架中', 'images/goods/jidan.png');
INSERT INTO `tbl_goods` VALUES ('8', '土豆', '3.50', '5.00', '5', '50', '刚出土的土豆', '2018-09-11', '上架中', 'images/goods/tudou.jpg');
INSERT INTO `tbl_goods` VALUES ('9', '速冻水饺', '8.50', '10.00', '6', '20', '速冻水饺', '2018-09-13', '上架中', 'images/goods/suijiao.jpg');
INSERT INTO `tbl_goods` VALUES ('10', '黄金鱼', '10.00', '12.00', '2', '100', 'aaaaa', '2018-09-18', '上架中', '../upload/543r.jpg');

-- ----------------------------
-- Table structure for tbl_opinion
-- ----------------------------
DROP TABLE IF EXISTS `tbl_opinion`;
CREATE TABLE `tbl_opinion` (
  `opinion_id` int(11) NOT NULL auto_increment,
  `goods_id` int(11) default NULL,
  `content` varchar(255) default NULL,
  `user_id` int(11) default NULL,
  `satisfy` int(11) default NULL,
  `date` date default NULL,
  PRIMARY KEY  (`opinion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_opinion
-- ----------------------------
INSERT INTO `tbl_opinion` VALUES ('1', '2', '葡萄很甜', '10', '5', '2018-09-28');
INSERT INTO `tbl_opinion` VALUES ('2', '6', '秋刀鱼好吃，苹果甜', '10', '4', '2018-09-28');
INSERT INTO `tbl_opinion` VALUES ('3', '1', '秋刀鱼好吃，苹果甜', '10', '4', '2018-09-28');
INSERT INTO `tbl_opinion` VALUES ('4', '10', '小金鱼舍不得吃', '10', '5', '2018-09-28');
INSERT INTO `tbl_opinion` VALUES ('5', '10', '小金鱼好看发送到发送到发送到是范德萨发士大撒', '10', '4', '2018-09-28');
INSERT INTO `tbl_opinion` VALUES ('6', '6', '秋刀鱼不新鲜，苹果还好', '10', '3', '2018-09-28');
INSERT INTO `tbl_opinion` VALUES ('7', '1', '秋刀鱼不新鲜，苹果还好', '10', '3', '2018-09-28');
INSERT INTO `tbl_opinion` VALUES ('8', '2', '葡萄很甜，草莓很新鲜', '12', '5', '2018-09-28');
INSERT INTO `tbl_opinion` VALUES ('9', '4', '葡萄很甜，草莓很新鲜', '12', '5', '2018-09-28');
INSERT INTO `tbl_opinion` VALUES ('10', '2', '葡萄不好吃，草莓很酸，苹果一般般', '12', '2', '2018-09-28');
INSERT INTO `tbl_opinion` VALUES ('11', '4', '葡萄不好吃，草莓很酸，苹果一般般', '12', '2', '2018-09-28');
INSERT INTO `tbl_opinion` VALUES ('12', '1', '葡萄不好吃，草莓很酸，苹果一般般', '12', '2', '2018-09-28');

-- ----------------------------
-- Table structure for tbl_order
-- ----------------------------
DROP TABLE IF EXISTS `tbl_order`;
CREATE TABLE `tbl_order` (
  `order_id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `order_totalprice` double(10,2) default NULL,
  `receiver_addr` varchar(255) default NULL,
  `receiver_name` varchar(255) default NULL,
  `receiver_phone` varchar(255) default NULL,
  `payment` varchar(255) default NULL,
  `order_meno` varchar(255) default NULL,
  `order_date` datetime default NULL,
  `send_date` datetime default NULL,
  `tag` varchar(255) default NULL,
  `order_pingjiashijian` datetime default NULL,
  `order_pingjianeirong` varchar(255) default NULL,
  `order_pingjiamanyidu` int(11) default NULL,
  PRIMARY KEY  (`order_id`),
  KEY `order_user_id` (`user_id`),
  CONSTRAINT `order_user_id` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_order
-- ----------------------------
INSERT INTO `tbl_order` VALUES ('39', '10', '11.00', '湖南工学院', 'jam', '18570935120', null, null, '2018-09-27 23:44:47', null, '已评价', '2018-09-28 02:12:58', '葡萄很甜', '5');
INSERT INTO `tbl_order` VALUES ('40', '10', '6.00', '湖南工学院', 'jam', '18570935120', null, null, '2018-09-28 00:08:46', null, '已评价', '2018-09-28 00:40:27', '很好吃的苹果', '5');
INSERT INTO `tbl_order` VALUES ('41', '10', '12.00', '湖南工学院', 'jam', '18570935120', null, null, '2018-09-28 00:16:23', null, '已评价', '2018-09-28 02:17:36', '小金鱼舍不得吃', '5');
INSERT INTO `tbl_order` VALUES ('42', '10', '20.00', '湖南工学院', 'jam', '18570935120', null, null, '2018-09-28 00:28:29', null, '已评价', '2018-09-28 00:30:38', '很新鲜的牛肉', '5');
INSERT INTO `tbl_order` VALUES ('43', '10', '45.00', '湖南工学院', 'jam', '18570935120', null, null, '2018-09-28 00:33:46', null, '已评价', '2018-09-28 01:06:53', '秋刀鱼的滋味，猫跟你都想了解', '5');
INSERT INTO `tbl_order` VALUES ('44', '10', '51.00', '湖南工学院', 'jam', '18570935120', null, null, '2018-09-28 01:00:19', null, '已评价', '2018-09-28 02:16:21', '秋刀鱼好吃，苹果甜', '4');
INSERT INTO `tbl_order` VALUES ('45', '10', '51.00', '湖南工学院', 'jam', '18570935120', null, null, '2018-09-28 02:14:23', null, '已评价', '2018-09-28 03:57:48', '秋刀鱼不新鲜，苹果还好', '3');
INSERT INTO `tbl_order` VALUES ('46', '12', '8.50', '我是地球人', 'dbh', '15124564356', null, null, '2018-09-28 04:02:28', null, '已评价', '2018-09-28 04:05:28', '葡萄很甜，草莓很新鲜', '5');
INSERT INTO `tbl_order` VALUES ('47', '12', '14.50', '我是地球人', 'dbh', '15124564356', null, null, '2018-09-28 04:06:30', null, '已评价', '2018-09-28 04:08:26', '葡萄不好吃，草莓很酸，苹果一般般', '2');

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
INSERT INTO `tbl_orderitem` VALUES ('43', '39', '2', '2', '11');
INSERT INTO `tbl_orderitem` VALUES ('44', '40', '1', '1', '6');
INSERT INTO `tbl_orderitem` VALUES ('45', '41', '10', '1', '12');
INSERT INTO `tbl_orderitem` VALUES ('46', '42', '5', '1', '20');
INSERT INTO `tbl_orderitem` VALUES ('47', '43', '6', '2', '45');
INSERT INTO `tbl_orderitem` VALUES ('48', '44', '6', '2', '45');
INSERT INTO `tbl_orderitem` VALUES ('49', '44', '1', '1', '6');
INSERT INTO `tbl_orderitem` VALUES ('50', '45', '6', '2', '45');
INSERT INTO `tbl_orderitem` VALUES ('51', '45', '1', '1', '6');
INSERT INTO `tbl_orderitem` VALUES ('52', '46', '2', '1', '5.5');
INSERT INTO `tbl_orderitem` VALUES ('53', '46', '4', '1', '3');
INSERT INTO `tbl_orderitem` VALUES ('54', '47', '2', '1', '5.5');
INSERT INTO `tbl_orderitem` VALUES ('55', '47', '4', '1', '3');
INSERT INTO `tbl_orderitem` VALUES ('56', '47', '1', '1', '6');

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
INSERT INTO `tbl_shopcart` VALUES ('18', '9047742', '6', '2');
INSERT INTO `tbl_shopcart` VALUES ('19', '9047742', '1', '1');
INSERT INTO `tbl_shopcart` VALUES ('20', '9047742', '2', '1');
INSERT INTO `tbl_shopcart` VALUES ('21', '6425864', '2', '1');
INSERT INTO `tbl_shopcart` VALUES ('22', '6425864', '4', '1');
INSERT INTO `tbl_shopcart` VALUES ('23', '6425864', '1', '1');

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
  `user_money` double(255,2) default '0.00',
  PRIMARY KEY  (`user_id`),
  KEY `cart_id` (`cart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_user
-- ----------------------------
INSERT INTO `tbl_user` VALUES ('10', 'jam', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', '普通用户', '18570935120', null, '湖南工学院', '9047742', '0.00');
INSERT INTO `tbl_user` VALUES ('11', 'yc', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', '', '18570935120', null, '我是地球人', '8071043', '0.00');
INSERT INTO `tbl_user` VALUES ('12', 'dbh', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', '普通用户', '15124564356', null, '我是地球人', '6425864', '0.00');
