/*
Navicat MySQL Data Transfer

Source Server         : Magazin
Source Server Version : 50631
Source Host           : localhost:3306
Source Database       : notebook

Target Server Type    : MYSQL
Target Server Version : 50631
File Encoding         : 65001

Date: 2016-12-23 12:18:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for Alimentare
-- ----------------------------
DROP TABLE IF EXISTS `Alimentare`;
CREATE TABLE `Alimentare` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Alimentare` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Alimentare
-- ----------------------------
INSERT INTO `Alimentare` VALUES ('1', 'Li-Ion');
INSERT INTO `Alimentare` VALUES ('2', 'Lithium');
INSERT INTO `Alimentare` VALUES ('3', 'Li-Pol');

-- ----------------------------
-- Table structure for Culoare
-- ----------------------------
DROP TABLE IF EXISTS `Culoare`;
CREATE TABLE `Culoare` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Culoare` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Culoare
-- ----------------------------
INSERT INTO `Culoare` VALUES ('1', 'Black');
INSERT INTO `Culoare` VALUES ('2', 'White');
INSERT INTO `Culoare` VALUES ('3', 'Grey');
INSERT INTO `Culoare` VALUES ('4', 'Gold');
INSERT INTO `Culoare` VALUES ('5', 'Dark Blue');
INSERT INTO `Culoare` VALUES ('6', 'Aluminium');
INSERT INTO `Culoare` VALUES ('7', 'Pink');
INSERT INTO `Culoare` VALUES ('8', 'Blue');

-- ----------------------------
-- Table structure for Display
-- ----------------------------
DROP TABLE IF EXISTS `Display`;
CREATE TABLE `Display` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Display` varchar(255) DEFAULT NULL,
  `Rezolutie` varchar(255) DEFAULT NULL,
  `Diagonala` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Display
-- ----------------------------
INSERT INTO `Display` VALUES ('1', 'LED', '1366x768', '15.6');
INSERT INTO `Display` VALUES ('2', 'LED', '3840x2160', '15.6');
INSERT INTO `Display` VALUES ('3', 'Retina LED IPS', '2560x1600', '13.3');

-- ----------------------------
-- Table structure for Firma
-- ----------------------------
DROP TABLE IF EXISTS `Firma`;
CREATE TABLE `Firma` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Firma` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Firma
-- ----------------------------
INSERT INTO `Firma` VALUES ('1', 'Asus');
INSERT INTO `Firma` VALUES ('2', 'Acer');
INSERT INTO `Firma` VALUES ('3', 'Lenovo');
INSERT INTO `Firma` VALUES ('4', 'HP');
INSERT INTO `Firma` VALUES ('5', 'Dell');
INSERT INTO `Firma` VALUES ('6', 'Apple');

-- ----------------------------
-- Table structure for Model
-- ----------------------------
DROP TABLE IF EXISTS `Model`;
CREATE TABLE `Model` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Model` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Model
-- ----------------------------
INSERT INTO `Model` VALUES ('1', 'Y70');
INSERT INTO `Model` VALUES ('2', 'G50-30');
INSERT INTO `Model` VALUES ('3', 'DM080D');
INSERT INTO `Model` VALUES ('4', '13');

-- ----------------------------
-- Table structure for notebook
-- ----------------------------
DROP TABLE IF EXISTS `notebook`;
CREATE TABLE `notebook` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Firma` int(11) DEFAULT NULL,
  `ID_Serie` int(11) DEFAULT NULL,
  `ID_Model` int(11) DEFAULT NULL,
  `ID_Culoare` int(11) DEFAULT NULL,
  `Dimensiune` varchar(20) DEFAULT NULL,
  `Greutate` float(10,0) DEFAULT NULL COMMENT 'grame',
  `ID_Procesor` int(11) DEFAULT NULL,
  `ID_Display` int(11) DEFAULT NULL,
  `Ram` int(3) DEFAULT NULL,
  `Capacitate` varchar(255) DEFAULT NULL,
  `Tip_capacitate` enum('SSD','HDD','SSD/HDD') DEFAULT 'HDD' COMMENT 'hdd/ssd',
  `Video` enum('Integrata','Dedicata') DEFAULT 'Integrata',
  `Capacitate_Video` varchar(255) DEFAULT NULL,
  `Bluetooth` tinyint(1) DEFAULT NULL,
  `Wifi` tinyint(1) DEFAULT NULL,
  `USB2_0` tinyint(1) DEFAULT NULL,
  `USB3_0` tinyint(1) DEFAULT NULL,
  `HDMI` tinyint(1) DEFAULT NULL,
  `VGA` tinyint(1) DEFAULT NULL,
  `RJ_45` tinyint(1) DEFAULT NULL,
  `ID_Alimentare` int(11) DEFAULT NULL COMMENT 'Li-Ion',
  `Audio` tinyint(1) DEFAULT NULL,
  `DVD` tinyint(1) DEFAULT NULL,
  `Camera` varchar(255) DEFAULT NULL,
  `Microfon` tinyint(1) DEFAULT NULL,
  `Card_reader` tinyint(1) DEFAULT NULL,
  `Num_pad` tinyint(1) DEFAULT NULL,
  `ID_Sistem_Operare` int(11) DEFAULT NULL,
  `Cover` varchar(255) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `Sale` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `firma` (`ID_Firma`),
  KEY `serie` (`ID_Serie`),
  KEY `model` (`ID_Model`),
  KEY `culoare` (`ID_Culoare`),
  KEY `procesor` (`ID_Procesor`),
  KEY `display` (`ID_Display`),
  KEY `alimentare` (`ID_Alimentare`),
  KEY `sistem_operare` (`ID_Sistem_Operare`),
  CONSTRAINT `alimentare` FOREIGN KEY (`ID_Alimentare`) REFERENCES `Alimentare` (`ID`) ON UPDATE CASCADE,
  CONSTRAINT `culoare` FOREIGN KEY (`ID_Culoare`) REFERENCES `Culoare` (`ID`) ON UPDATE CASCADE,
  CONSTRAINT `display` FOREIGN KEY (`ID_Display`) REFERENCES `Display` (`ID`) ON UPDATE CASCADE,
  CONSTRAINT `firma` FOREIGN KEY (`ID_Firma`) REFERENCES `Firma` (`ID`) ON UPDATE CASCADE,
  CONSTRAINT `model` FOREIGN KEY (`ID_Model`) REFERENCES `Model` (`ID`) ON UPDATE CASCADE,
  CONSTRAINT `procesor` FOREIGN KEY (`ID_Procesor`) REFERENCES `Procesor` (`ID`) ON UPDATE CASCADE,
  CONSTRAINT `serie` FOREIGN KEY (`ID_Serie`) REFERENCES `Serie` (`ID`) ON UPDATE CASCADE,
  CONSTRAINT `sistem_operare` FOREIGN KEY (`ID_Sistem_Operare`) REFERENCES `Sistem_Operare` (`ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of notebook
-- ----------------------------
INSERT INTO `notebook` VALUES ('1', '3', '2', '2', '1', '384x265x25', '2500', '1', '1', '4', '500', 'HDD', 'Integrata', '1024', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'HD', '1', '1', '1', '1', 'img/notebook/1.jpg', '5000.00', null);
INSERT INTO `notebook` VALUES ('2', '1', '3', '3', '3', '382x255x21.7', '2000', '2', '2', '4', '1000', 'HDD', 'Integrata', '2048', '1', '1', '1', '1', '1', '1', '1', '2', '1', '1', 'HD', '1', '0', '1', '1', 'img/notebook/2.jpg', '20990.00', null);
INSERT INTO `notebook` VALUES ('3', '6', '5', '4', '6', '314x219x18', '1580', '3', '3', '8', '128', 'SSD', 'Integrata', '1024', '1', '1', '0', '1', '1', '1', '0', '3', '1', '1', 'FaceTime HD 720p', '1', '1', '0', '5', 'img/notebook/3.jpg', '27490.00', null);

-- ----------------------------
-- Table structure for Procesor
-- ----------------------------
DROP TABLE IF EXISTS `Procesor`;
CREATE TABLE `Procesor` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Procesor` enum('Intel','Amd') DEFAULT NULL,
  `Model_Procesor` varchar(255) DEFAULT NULL,
  `Nuclee` int(3) DEFAULT NULL,
  `Frecventa` varchar(255) DEFAULT NULL,
  `Tip_procesor` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `tip_procesor` (`Tip_procesor`),
  CONSTRAINT `tip_procesor` FOREIGN KEY (`Tip_procesor`) REFERENCES `Tip_Procesor` (`ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Procesor
-- ----------------------------
INSERT INTO `Procesor` VALUES ('1', 'Intel', 'N3530', '4', '2160', '2');
INSERT INTO `Procesor` VALUES ('2', 'Intel', '6500U', '2', '2500', '6');
INSERT INTO `Procesor` VALUES ('3', 'Intel', 'MF839', '2', '2700', '5');

-- ----------------------------
-- Table structure for Serie
-- ----------------------------
DROP TABLE IF EXISTS `Serie`;
CREATE TABLE `Serie` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Serie` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Serie
-- ----------------------------
INSERT INTO `Serie` VALUES ('1', 'ROG');
INSERT INTO `Serie` VALUES ('2', 'IdeaPad');
INSERT INTO `Serie` VALUES ('3', 'K501UX');
INSERT INTO `Serie` VALUES ('4', 'MacBook ');
INSERT INTO `Serie` VALUES ('5', 'MacBook Pro');

-- ----------------------------
-- Table structure for Sistem_Operare
-- ----------------------------
DROP TABLE IF EXISTS `Sistem_Operare`;
CREATE TABLE `Sistem_Operare` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Sistem_Operare` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Sistem_Operare
-- ----------------------------
INSERT INTO `Sistem_Operare` VALUES ('1', 'Free-DOS');
INSERT INTO `Sistem_Operare` VALUES ('2', 'Windows');
INSERT INTO `Sistem_Operare` VALUES ('3', 'Linux');
INSERT INTO `Sistem_Operare` VALUES ('4', 'Ubuntu');
INSERT INTO `Sistem_Operare` VALUES ('5', 'MacOS');

-- ----------------------------
-- Table structure for Tip_Procesor
-- ----------------------------
DROP TABLE IF EXISTS `Tip_Procesor`;
CREATE TABLE `Tip_Procesor` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Tip_Procesor` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Tip_Procesor
-- ----------------------------
INSERT INTO `Tip_Procesor` VALUES ('1', 'Dual Core');
INSERT INTO `Tip_Procesor` VALUES ('2', 'Quad Core');
INSERT INTO `Tip_Procesor` VALUES ('3', 'Octa Core');
INSERT INTO `Tip_Procesor` VALUES ('4', 'i3');
INSERT INTO `Tip_Procesor` VALUES ('5', 'i5');
INSERT INTO `Tip_Procesor` VALUES ('6', 'i7');
INSERT INTO `Tip_Procesor` VALUES ('7', 'i1');
SET FOREIGN_KEY_CHECKS=1;
