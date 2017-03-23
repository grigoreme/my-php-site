/*
Navicat MySQL Data Transfer

Source Server         : Magazin
Source Server Version : 50631
Source Host           : localhost:3306
Source Database       : phone

Target Server Type    : MYSQL
Target Server Version : 50631
File Encoding         : 65001

Date: 2016-12-23 12:18:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for Altele
-- ----------------------------
DROP TABLE IF EXISTS `Altele`;
CREATE TABLE `Altele` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Phone` int(11) DEFAULT NULL,
  `Element` varchar(255) DEFAULT NULL,
  `Continut` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Altele
-- ----------------------------
INSERT INTO `Altele` VALUES ('1', '1', 'Browser', 'HTML5');
INSERT INTO `Altele` VALUES ('2', '1', 'Sensori', 'Accelerometru, proximitate');
INSERT INTO `Altele` VALUES ('3', '1', 'Organizer', '	Ceas cu alarm?, calculator, planificator');

-- ----------------------------
-- Table structure for Baterie
-- ----------------------------
DROP TABLE IF EXISTS `Baterie`;
CREATE TABLE `Baterie` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Baterie` varchar(255) DEFAULT NULL,
  `Capacitate` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Baterie
-- ----------------------------
INSERT INTO `Baterie` VALUES ('1', 'Li-Ion', '3100');

-- ----------------------------
-- Table structure for Camera
-- ----------------------------
DROP TABLE IF EXISTS `Camera`;
CREATE TABLE `Camera` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Camera` tinyint(1) DEFAULT NULL,
  `Rezolutie_Sensor` int(3) DEFAULT NULL,
  `Rezolutie_Foto` varchar(11) DEFAULT NULL,
  `Rezolutie_Video` varchar(11) DEFAULT NULL,
  `Blitz` tinyint(1) DEFAULT NULL,
  `Camera_Frontala` tinyint(1) DEFAULT NULL,
  `Blitz_Frontal` tinyint(1) DEFAULT NULL,
  `Sensor_Frontal` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Camera
-- ----------------------------
INSERT INTO `Camera` VALUES ('1', '1', '13', '4128x3096', '1920x1080', '1', '1', '0', '5');

-- ----------------------------
-- Table structure for Culoare
-- ----------------------------
DROP TABLE IF EXISTS `Culoare`;
CREATE TABLE `Culoare` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Culoare` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Culoare
-- ----------------------------
INSERT INTO `Culoare` VALUES ('1', 'Black');
INSERT INTO `Culoare` VALUES ('2', 'White');
INSERT INTO `Culoare` VALUES ('3', 'Grey');
INSERT INTO `Culoare` VALUES ('4', 'Gold');
INSERT INTO `Culoare` VALUES ('5', 'Dark Blue');
INSERT INTO `Culoare` VALUES ('6', 'Aluminium');

-- ----------------------------
-- Table structure for Display
-- ----------------------------
DROP TABLE IF EXISTS `Display`;
CREATE TABLE `Display` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Rezolutie` varchar(255) DEFAULT NULL,
  `Tehnologie` varchar(255) DEFAULT NULL,
  `TouchScreen` tinyint(1) DEFAULT '1',
  `Culori_K` int(11) DEFAULT NULL,
  `Diagonala` varchar(10) DEFAULT NULL,
  `Multitouch` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Display
-- ----------------------------
INSERT INTO `Display` VALUES ('1', '1280x720', 'Super AMOLED', '1', '16000', '5.2', '1');

-- ----------------------------
-- Table structure for Firma
-- ----------------------------
DROP TABLE IF EXISTS `Firma`;
CREATE TABLE `Firma` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Firma` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Firma
-- ----------------------------
INSERT INTO `Firma` VALUES ('1', 'Samsung');
INSERT INTO `Firma` VALUES ('2', 'Xiaomi');
INSERT INTO `Firma` VALUES ('3', 'HTC');
INSERT INTO `Firma` VALUES ('4', 'Asus');
INSERT INTO `Firma` VALUES ('5', 'ZTE');
INSERT INTO `Firma` VALUES ('6', 'LeEco');
INSERT INTO `Firma` VALUES ('7', 'Huawei');

-- ----------------------------
-- Table structure for Model
-- ----------------------------
DROP TABLE IF EXISTS `Model`;
CREATE TABLE `Model` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Model` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Model
-- ----------------------------
INSERT INTO `Model` VALUES ('1', 'J510H');
INSERT INTO `Model` VALUES ('2', 'J510S');
INSERT INTO `Model` VALUES ('3', 'GJ501');

-- ----------------------------
-- Table structure for Model_Chipset
-- ----------------------------
DROP TABLE IF EXISTS `Model_Chipset`;
CREATE TABLE `Model_Chipset` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Model_Chipset` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Model_Chipset
-- ----------------------------
INSERT INTO `Model_Chipset` VALUES ('1', 'Snapdragon 410');

-- ----------------------------
-- Table structure for phone
-- ----------------------------
DROP TABLE IF EXISTS `phone`;
CREATE TABLE `phone` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Firma` int(11) DEFAULT NULL,
  `ID_Serie` int(11) DEFAULT NULL,
  `ID_Model` int(11) DEFAULT NULL,
  `ID_Culoare` int(11) DEFAULT NULL,
  `Tastatura` enum('Virtuala','Fizica') DEFAULT NULL,
  `Greutate` decimal(10,0) DEFAULT NULL,
  `Dimensiune` varchar(255) DEFAULT NULL,
  `2G` set('850','900','1800','1900') DEFAULT '850',
  `3G` set('850','900','1900','2100') DEFAULT '850',
  `4G` set('LTE','0') DEFAULT '0',
  `SIM` enum('SIM','Micro-SIM','Nano-SIM') DEFAULT 'SIM',
  `SIM_Slots` int(2) DEFAULT NULL,
  `ID_Sistem_Operare` int(11) DEFAULT NULL,
  `GPS` tinyint(1) DEFAULT NULL,
  `ID_Display` int(11) DEFAULT NULL,
  `Slot_Memorie` tinyint(1) DEFAULT NULL,
  `Slot_Memorie_Limit` int(3) DEFAULT NULL,
  `Memorie` int(3) DEFAULT NULL,
  `RAM` int(3) DEFAULT NULL,
  `GPRS` tinyint(1) DEFAULT NULL,
  `Bluetooth` tinyint(1) DEFAULT NULL,
  `WIFI` tinyint(1) DEFAULT NULL,
  `NFC` tinyint(1) DEFAULT NULL,
  `USB` enum('Micro0USB','Type-C','MiniUSB') DEFAULT NULL,
  `AudioJack` tinyint(1) DEFAULT NULL,
  `ID_Camera` int(11) DEFAULT NULL,
  `ID_Baterie` int(11) DEFAULT NULL,
  `Radio` tinyint(1) DEFAULT NULL,
  `ID_Producator_Chipset` int(11) DEFAULT NULL,
  `ID_Serie_Chipset` int(11) DEFAULT NULL,
  `ID_Model_Chipset` int(11) DEFAULT NULL,
  `FingerPrint` tinyint(1) DEFAULT '0',
  `Price` decimal(10,2) DEFAULT NULL,
  `Cover` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `firma` (`ID_Firma`),
  KEY `serie` (`ID_Serie`),
  KEY `model` (`ID_Model`),
  KEY `culoare` (`ID_Culoare`),
  KEY `sistem_operare` (`ID_Sistem_Operare`),
  KEY `camera` (`ID_Camera`),
  KEY `baterie` (`ID_Baterie`),
  KEY `display` (`ID_Display`),
  KEY `Model_chipset` (`ID_Model_Chipset`),
  KEY `Producator_chipset` (`ID_Producator_Chipset`),
  KEY `Serie_chipset` (`ID_Serie_Chipset`),
  CONSTRAINT `Model_chipset` FOREIGN KEY (`ID_Model_Chipset`) REFERENCES `Model_Chipset` (`ID`) ON UPDATE CASCADE,
  CONSTRAINT `Producator_chipset` FOREIGN KEY (`ID_Producator_Chipset`) REFERENCES `Producator_Chipset` (`ID`) ON UPDATE CASCADE,
  CONSTRAINT `Serie_chipset` FOREIGN KEY (`ID_Serie_Chipset`) REFERENCES `Serie_Chipset` (`ID`) ON UPDATE CASCADE,
  CONSTRAINT `baterie` FOREIGN KEY (`ID_Baterie`) REFERENCES `Baterie` (`ID`) ON UPDATE CASCADE,
  CONSTRAINT `camera` FOREIGN KEY (`ID_Camera`) REFERENCES `Camera` (`ID`) ON UPDATE CASCADE,
  CONSTRAINT `culoare` FOREIGN KEY (`ID_Culoare`) REFERENCES `Culoare` (`ID`) ON UPDATE CASCADE,
  CONSTRAINT `display` FOREIGN KEY (`ID_Display`) REFERENCES `Display` (`ID`) ON UPDATE CASCADE,
  CONSTRAINT `firma` FOREIGN KEY (`ID_Firma`) REFERENCES `Firma` (`ID`) ON UPDATE CASCADE,
  CONSTRAINT `model` FOREIGN KEY (`ID_Model`) REFERENCES `Model` (`ID`) ON UPDATE CASCADE,
  CONSTRAINT `serie` FOREIGN KEY (`ID_Serie`) REFERENCES `Serie` (`ID`) ON UPDATE CASCADE,
  CONSTRAINT `sistem_operare` FOREIGN KEY (`ID_Sistem_Operare`) REFERENCES `Sistem_Operare` (`ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of phone
-- ----------------------------
INSERT INTO `phone` VALUES ('2', '1', '5', '3', '1', 'Virtuala', '159', '145.8x72.3x8.1', '850,900,1800,1900', '850,900,1900,2100', 'LTE', 'Nano-SIM', '2', '1', '1', '1', '1', '128', '16', '2', '1', '1', '1', '1', 'Micro0USB', '1', '1', '1', '1', '1', '1', '1', '0', '3200.00', 'img/phone/1.jpg');
INSERT INTO `phone` VALUES ('3', '1', '1', '2', '1', 'Virtuala', '159', '145.8x72.3x8.1', '850,900,1800,1900', '850,900,1900,2100', 'LTE', 'Nano-SIM', '2', '1', '1', '1', '1', '128', '16', '2', '1', '1', '1', '1', 'Micro0USB', '1', '1', '1', '1', '1', '1', '1', '0', '5900.00', 'img/phone/2.jpg');

-- ----------------------------
-- Table structure for Producator_Chipset
-- ----------------------------
DROP TABLE IF EXISTS `Producator_Chipset`;
CREATE TABLE `Producator_Chipset` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Producator` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Producator_Chipset
-- ----------------------------
INSERT INTO `Producator_Chipset` VALUES ('1', 'Qualcomm ');
INSERT INTO `Producator_Chipset` VALUES ('2', 'Altu');

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
INSERT INTO `Serie` VALUES ('1', 'J');
INSERT INTO `Serie` VALUES ('2', 'Mi');
INSERT INTO `Serie` VALUES ('3', 'Mix');
INSERT INTO `Serie` VALUES ('4', 'Honor');
INSERT INTO `Serie` VALUES ('5', 'Galaxy');

-- ----------------------------
-- Table structure for Serie_Chipset
-- ----------------------------
DROP TABLE IF EXISTS `Serie_Chipset`;
CREATE TABLE `Serie_Chipset` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Serie_Chipset` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Serie_Chipset
-- ----------------------------
INSERT INTO `Serie_Chipset` VALUES ('1', 'MSM8916');

-- ----------------------------
-- Table structure for Sistem_Operare
-- ----------------------------
DROP TABLE IF EXISTS `Sistem_Operare`;
CREATE TABLE `Sistem_Operare` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Sistem_Operare` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Sistem_Operare
-- ----------------------------
INSERT INTO `Sistem_Operare` VALUES ('1', 'Android');
INSERT INTO `Sistem_Operare` VALUES ('2', 'Windows');
SET FOREIGN_KEY_CHECKS=1;
