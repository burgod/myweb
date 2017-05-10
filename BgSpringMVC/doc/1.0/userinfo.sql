/*
Navicat MySQL Data Transfer

Source Server         : 11
Source Server Version : 50635
Source Host           : localhost:3306
Source Database       : bgweb

Target Server Type    : MYSQL
Target Server Version : 50635
File Encoding         : 65001

Date: 2017-05-10 11:00:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `ID` int(32) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `AGE` int(10) NOT NULL,
  `PASSWORD` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PHONE` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATETIME` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('29', 'nn', '33', null, '22', '45@qq.com', '2017-04-26 11:46:44');
INSERT INTO `userinfo` VALUES ('31', 'uu', '100', null, '3', '77@qq.com', '2017-04-26 13:39:53');
INSERT INTO `userinfo` VALUES ('32', '33', '22', null, '11', '22@qq.com', '2017-04-26 13:42:13');
INSERT INTO `userinfo` VALUES ('33', '测试我', '12', null, '33', '88@qq.com', '2017-04-26 15:16:34');
INSERT INTO `userinfo` VALUES ('34', 'lu', '26', '11', '133', '10086@qq.com', '2017-05-09 10:40:47');
