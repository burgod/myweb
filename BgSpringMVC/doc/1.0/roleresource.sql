/*
Navicat MySQL Data Transfer

Source Server         : 11
Source Server Version : 50635
Source Host           : localhost:3306
Source Database       : bgweb

Target Server Type    : MYSQL
Target Server Version : 50635
File Encoding         : 65001

Date: 2017-05-10 11:00:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `roleresource`
-- ----------------------------
DROP TABLE IF EXISTS `roleresource`;
CREATE TABLE `roleresource` (
  `roleid` int(32) NOT NULL,
  `resourceid` int(32) NOT NULL,
  PRIMARY KEY (`roleid`,`resourceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of roleresource
-- ----------------------------
INSERT INTO `roleresource` VALUES ('36', '1');
INSERT INTO `roleresource` VALUES ('36', '3');
INSERT INTO `roleresource` VALUES ('36', '4');
INSERT INTO `roleresource` VALUES ('36', '5');
INSERT INTO `roleresource` VALUES ('36', '6');
INSERT INTO `roleresource` VALUES ('36', '7');
