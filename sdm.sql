/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50626
Source Host           : localhost:3306
Source Database       : sdm

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2017-05-15 11:24:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for authority
-- ----------------------------
DROP TABLE IF EXISTS `authority`;
CREATE TABLE `authority` (
  `name` varchar(11) NOT NULL,
  `url` varchar(20) NOT NULL,
  `authority` int(20) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of authority
-- ----------------------------
INSERT INTO `authority` VALUES ('1', '下载模型', null);
INSERT INTO `authority` VALUES ('2', '上传模型', null);
INSERT INTO `authority` VALUES ('3', '修改模型', null);
INSERT INTO `authority` VALUES ('4', '删除模型', null);
INSERT INTO `authority` VALUES ('5', '用户管理', null);

-- ----------------------------
-- Table structure for cr
-- ----------------------------
DROP TABLE IF EXISTS `cr`;
CREATE TABLE `cr` (
  `eleID` int(20) NOT NULL,
  `vote` int(2) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `votor` varchar(20) NOT NULL,
  `CRID` int(20) NOT NULL AUTO_INCREMENT,
  `reason` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`CRID`),
  KEY `eleID` (`eleID`),
  KEY `votor` (`votor`),
  CONSTRAINT `eleID` FOREIGN KEY (`eleID`) REFERENCES `element` (`elementID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `votor` FOREIGN KEY (`votor`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cr
-- ----------------------------
INSERT INTO `cr` VALUES ('20', '-1', '1', '22', '6', 'aaaa');

-- ----------------------------
-- Table structure for element
-- ----------------------------
DROP TABLE IF EXISTS `element`;
CREATE TABLE `element` (
  `EnglishName` varchar(30) NOT NULL,
  `ChineseName` varchar(30) NOT NULL,
  `description` text,
  `fileID` int(20) DEFAULT NULL,
  `smallClass` int(20) DEFAULT NULL,
  `middleClass` int(20) DEFAULT NULL,
  `bigClass` int(20) DEFAULT NULL,
  `creator` varchar(20) DEFAULT NULL,
  `createTime` varchar(20) DEFAULT NULL,
  `state` int(2) DEFAULT NULL,
  `elementID` int(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`elementID`),
  KEY `creator` (`creator`),
  KEY `bigClass` (`bigClass`),
  KEY `middleClass` (`middleClass`),
  KEY `smallClass` (`smallClass`),
  KEY `fileID` (`fileID`),
  CONSTRAINT `bigClass` FOREIGN KEY (`bigClass`) REFERENCES `sdmclass` (`classID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `creator` FOREIGN KEY (`creator`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fileID` FOREIGN KEY (`fileID`) REFERENCES `sdmfile` (`fileID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `middleClass` FOREIGN KEY (`middleClass`) REFERENCES `sdmclass` (`classID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `smallClass` FOREIGN KEY (`smallClass`) REFERENCES `sdmclass` (`classID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of element
-- ----------------------------
INSERT INTO `element` VALUES ('temperature', '温度', 'ccc', '1', '6', '3', '1', '11', '2017-05-07', '1', '1');
INSERT INTO `element` VALUES ('speed', '速度', 'ddd', '1', '6', '3', '1', '11', '2017-05-06', '1', '2');
INSERT INTO `element` VALUES ('BSOLocation', 'BSOLocation', 'DDDD', '1', '15', '3', '2', '11', '2017-05-07', '1', '3');
INSERT INTO `element` VALUES ('22', '22', 'aa', '1', '6', '3', '1', '11', '2017-5-7', '-1', '20');
INSERT INTO `element` VALUES ('www', 'ww', 'ww', '1', '6', '3', '1', '11', '2017-5-8', '0', '21');
INSERT INTO `element` VALUES ('angle', '角度', 'Divergence of two straight lines from a common point or of two planes from a common line. ', '1', '6', '3', '1', '11', '2017-5-8', '0', '22');
INSERT INTO `element` VALUES ('qqq', 'qqq', 'qqq', '1', '6', '3', '1', '11', '2017-5-8', '0', '23');

-- ----------------------------
-- Table structure for sdmclass
-- ----------------------------
DROP TABLE IF EXISTS `sdmclass`;
CREATE TABLE `sdmclass` (
  `classID` int(20) NOT NULL,
  `ChineseName` varchar(30) NOT NULL,
  `EnglishName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`classID`),
  KEY `classID` (`classID`),
  KEY `classID_2` (`classID`),
  KEY `classID_3` (`classID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sdmclass
-- ----------------------------
INSERT INTO `sdmclass` VALUES ('1', '基础元素', 'basis');
INSERT INTO `sdmclass` VALUES ('2', '扩展元素', 'extends');
INSERT INTO `sdmclass` VALUES ('3', '概念模型', 'conceptual');
INSERT INTO `sdmclass` VALUES ('4', '逻辑模型', 'logical');
INSERT INTO `sdmclass` VALUES ('5', '平台模型', 'platform');
INSERT INTO `sdmclass` VALUES ('6', '可观测量', 'observable');
INSERT INTO `sdmclass` VALUES ('7', '度量', 'measurement');
INSERT INTO `sdmclass` VALUES ('8', '单位', 'unit');
INSERT INTO `sdmclass` VALUES ('9', '参考系', 'reference');
INSERT INTO `sdmclass` VALUES ('10', '值类型', 'valueType');
INSERT INTO `sdmclass` VALUES ('11', '坐标系', 'coordinateSystem');
INSERT INTO `sdmclass` VALUES ('15', '概念实体', 'conceptualEntity');
INSERT INTO `sdmclass` VALUES ('16', '逻辑实体', 'logicalEntity');
INSERT INTO `sdmclass` VALUES ('17', '平台实体', 'platformEntity');
INSERT INTO `sdmclass` VALUES ('18', '平台视图', 'platformView');

-- ----------------------------
-- Table structure for sdmfile
-- ----------------------------
DROP TABLE IF EXISTS `sdmfile`;
CREATE TABLE `sdmfile` (
  `fileID` int(20) NOT NULL,
  `creator` varchar(20) NOT NULL,
  `ChineseName` varchar(30) NOT NULL,
  `EnglishName` varchar(30) DEFAULT NULL,
  `url` varchar(30) DEFAULT NULL,
  `version` float(3,0) DEFAULT NULL,
  PRIMARY KEY (`fileID`),
  KEY `Filecreator` (`creator`),
  CONSTRAINT `Filecreator` FOREIGN KEY (`creator`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sdmfile
-- ----------------------------
INSERT INTO `sdmfile` VALUES ('1', '11', 'aaa', 'bbb', 'ccc', '1');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `username` varchar(20) NOT NULL,
  `email` varchar(20) DEFAULT NULL,
  `phone` int(20) DEFAULT NULL,
  `password` varchar(20) NOT NULL,
  `authority` int(2) NOT NULL,
  PRIMARY KEY (`username`),
  KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('11', '11', '11', '11', '0');
INSERT INTO `user` VALUES ('123', null, null, '123', '1');
INSERT INTO `user` VALUES ('22', '22', '22', '22', '1');
INSERT INTO `user` VALUES ('33', '55', '44', '33', '2');
INSERT INTO `user` VALUES ('44', '44', '44', '44', '0');
INSERT INTO `user` VALUES ('66', '66', '66', '66', '0');
