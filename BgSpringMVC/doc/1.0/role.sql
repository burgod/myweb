/*
Navicat MySQL Data Transfer

Source Server         : 11
Source Server Version : 50635
Source Host           : localhost:3306
Source Database       : bgweb

Target Server Type    : MYSQL
Target Server Version : 50635
File Encoding         : 65001

Date: 2017-05-10 11:00:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `roleid` int(32) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createuser` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('25', '啥了吧23', '2017-04-24 16:58:09', '2017-04-24 15:54:15', 'lu');
INSERT INTO `role` VALUES ('26', '傻了吧2', '2017-04-24 16:59:40', '2017-04-24 15:51:06', 'lu');
INSERT INTO `role` VALUES ('27', '什么鬼', '2017-04-24 17:12:39', '2017-04-24 17:20:31', 'lu');
INSERT INTO `role` VALUES ('28', '就是你2', '2017-04-24 17:01:00', '2017-04-24 15:53:05', 'lu');
INSERT INTO `role` VALUES ('29', '我你信', '2017-04-24 15:53:14', '2017-04-24 15:53:14', 'lu');
INSERT INTO `role` VALUES ('30', '你喜欢几乎', '2017-04-24 15:53:24', '2017-04-24 15:53:24', 'lu');
INSERT INTO `role` VALUES ('31', '他', '2017-04-24 15:53:34', '2017-04-24 15:53:34', 'lu');
INSERT INTO `role` VALUES ('32', '333', '2017-04-24 15:53:40', '2017-04-24 15:53:40', 'lu');
INSERT INTO `role` VALUES ('34', '哦哦', '2017-04-24 15:53:52', '2017-04-24 15:53:52', 'lu');
INSERT INTO `role` VALUES ('35', '测试', '2017-05-05 15:42:26', '2017-05-05 15:42:26', 'lu');
INSERT INTO `role` VALUES ('36', '8877', '2017-05-05 16:52:29', '2017-05-09 09:35:17', 'lu');
