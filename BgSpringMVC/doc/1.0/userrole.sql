/*
Navicat MySQL Data Transfer

Source Server         : 11
Source Server Version : 50635
Source Host           : localhost:3306
Source Database       : bgweb

Target Server Type    : MYSQL
Target Server Version : 50635
File Encoding         : 65001

Date: 2017-05-10 11:00:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `userrole`
-- ----------------------------
DROP TABLE IF EXISTS `userrole`;
CREATE TABLE `userrole` (
  `roleid` int(32) NOT NULL,
  `username` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`roleid`,`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of userrole
-- ----------------------------
INSERT INTO `userrole` VALUES ('25', '测试我');
INSERT INTO `userrole` VALUES ('26', '测试我');
INSERT INTO `userrole` VALUES ('28', '测试我');
INSERT INTO `userrole` VALUES ('29', '33');
INSERT INTO `userrole` VALUES ('29', '测试我');
INSERT INTO `userrole` VALUES ('30', '33');
INSERT INTO `userrole` VALUES ('30', 'keyi');
INSERT INTO `userrole` VALUES ('30', 'uu');
INSERT INTO `userrole` VALUES ('31', 'keyi');
INSERT INTO `userrole` VALUES ('36', 'lu');
