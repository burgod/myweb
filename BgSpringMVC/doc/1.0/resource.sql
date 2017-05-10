/*
Navicat MySQL Data Transfer

Source Server         : 11
Source Server Version : 50635
Source Host           : localhost:3306
Source Database       : bgweb

Target Server Type    : MYSQL
Target Server Version : 50635
File Encoding         : 65001

Date: 2017-05-10 10:59:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `resource`
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource` (
  `RESOURCEID` int(32) NOT NULL AUTO_INCREMENT,
  `RESOURCENAME` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `RESOURCEURL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRESOURCEID` int(32) DEFAULT NULL,
  `RESOURCETYPE` int(32) NOT NULL,
  PRIMARY KEY (`RESOURCEID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO `resource` VALUES ('1', '权限管理', '', null, '0');
INSERT INTO `resource` VALUES ('3', '用户管理', '/userAction/myWelcome.htm', '1', '0');
INSERT INTO `resource` VALUES ('4', '角色管理', '/role/toView.htm', '1', '0');
INSERT INTO `resource` VALUES ('5', '资源权限', '/resource/toView.htm', '1', '0');
INSERT INTO `resource` VALUES ('6', '市场管理', '', null, '0');
INSERT INTO `resource` VALUES ('7', '管理者一', '/', '6', '0');
