/*
Navicat MySQL Data Transfer

Source Server         : Magazin
Source Server Version : 50631
Source Host           : localhost:3306
Source Database       : secure_login

Target Server Type    : MYSQL
Target Server Version : 50631
File Encoding         : 65001

Date: 2016-12-23 12:18:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for Adress
-- ----------------------------
DROP TABLE IF EXISTS `Adress`;
CREATE TABLE `Adress` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Region` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `PostalCode` varchar(255) DEFAULT NULL,
  `Fax` varchar(255) DEFAULT NULL,
  `DoorID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Adrees_door` (`DoorID`),
  CONSTRAINT `Adrees_door` FOREIGN KEY (`DoorID`) REFERENCES `Door` (`ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Adress
-- ----------------------------
INSERT INTO `Adress` VALUES ('1', 'Chisinau', 'Chisinau', '2068', '+373912313', '1');
INSERT INTO `Adress` VALUES ('2', 'Chisinau', 'Chisinau', '2067', '+373912312', '28');
INSERT INTO `Adress` VALUES ('13', 'Chisinau', 'Chisinau', '2061', '+373912312', '24');
INSERT INTO `Adress` VALUES ('14', 'Chisinau', 'Chisinau', '2065', '', '26');
INSERT INTO `Adress` VALUES ('15', 'Chisinau', 'Chisinau', '2063', '+373912312', '24');
INSERT INTO `Adress` VALUES ('16', 'Chisinau', 'Chisinau', '2071', '+373912312', '24');
INSERT INTO `Adress` VALUES ('17', 'Chisinau', 'Chisinau', '2087', '+31321231', '27');

-- ----------------------------
-- Table structure for Door
-- ----------------------------
DROP TABLE IF EXISTS `Door`;
CREATE TABLE `Door` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Street` varchar(255) DEFAULT NULL,
  `Build` varchar(255) DEFAULT NULL,
  `Door` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Door
-- ----------------------------
INSERT INTO `Door` VALUES ('1', 'Florilor', '12/3', '33');
INSERT INTO `Door` VALUES ('2', 'Miron Costin', '15', '10');
INSERT INTO `Door` VALUES ('21', 'Florilor', '12/3', '332');
INSERT INTO `Door` VALUES ('22', 'Florilor', '12/3', '31');
INSERT INTO `Door` VALUES ('23', 'Decebal', '1', '10');
INSERT INTO `Door` VALUES ('24', 'Miron Costin', '12', '10');
INSERT INTO `Door` VALUES ('25', 'Florilor', '13/3', '33');
INSERT INTO `Door` VALUES ('26', 'Decebal', '5', '7');
INSERT INTO `Door` VALUES ('27', 'Sarmisegetusa', '75', '1');
INSERT INTO `Door` VALUES ('28', 'Florilor', '13/3', '32');

-- ----------------------------
-- Table structure for login_attempts
-- ----------------------------
DROP TABLE IF EXISTS `login_attempts`;
CREATE TABLE `login_attempts` (
  `user_id` int(11) NOT NULL,
  `time` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of login_attempts
-- ----------------------------
INSERT INTO `login_attempts` VALUES ('2', '1480964773');
INSERT INTO `login_attempts` VALUES ('2', '1480964924');

-- ----------------------------
-- Table structure for members
-- ----------------------------
DROP TABLE IF EXISTS `members`;
CREATE TABLE `members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` char(128) NOT NULL,
  `salt` char(128) NOT NULL,
  `access` int(1) NOT NULL DEFAULT '0',
  `FirstName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `Phone` varchar(255) DEFAULT NULL,
  `Language` varchar(2) DEFAULT 'EN',
  `Adress1` int(255) DEFAULT NULL,
  `Adress2` int(255) DEFAULT NULL,
  `CreditCard` varchar(255) DEFAULT NULL,
  `CreditCardTypeID` int(11) DEFAULT NULL,
  `CreditCardMO` varchar(255) DEFAULT NULL,
  `CreditCardYr` varchar(255) DEFAULT NULL,
  `BillingAdress1` int(255) DEFAULT NULL,
  `BillingAdress2` int(255) DEFAULT NULL,
  `DateEntered` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `Adress1_adress` (`Adress1`),
  KEY `Adress2_adress` (`Adress2`),
  KEY `Billing1_adress` (`BillingAdress1`),
  KEY `Billing2_adress` (`BillingAdress2`),
  CONSTRAINT `Adress1_adress` FOREIGN KEY (`Adress1`) REFERENCES `Adress` (`ID`) ON UPDATE CASCADE,
  CONSTRAINT `Adress2_adress` FOREIGN KEY (`Adress2`) REFERENCES `Adress` (`ID`) ON UPDATE CASCADE,
  CONSTRAINT `Billing1_adress` FOREIGN KEY (`BillingAdress1`) REFERENCES `Adress` (`ID`) ON UPDATE CASCADE,
  CONSTRAINT `Billing2_adress` FOREIGN KEY (`BillingAdress2`) REFERENCES `Adress` (`ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of members
-- ----------------------------
INSERT INTO `members` VALUES ('1', 'test_user', 'test@example.com', '7a32cf5f4a8ee573ec814ef9bcf6b8e1ce47d5a42ced9e6bf5036380bfbcbafd97adc0d54dd768410c290b323baefe4c842591b0ea739c3a64581ec959af8b32', 'f9aab579fc1b41ed0c44fe4ecdbfcdb4cb99b9023abb241a6db833288f4eea3c02f76e0d35204a8695077dcf81932aa59006423976224be0390395bae152d4ef', '0', null, null, null, 'EN', null, null, null, null, null, null, null, null, '2016-12-07 19:43:30');
INSERT INTO `members` VALUES ('2', 'zaruba', 'grigore997@gmail.com', '8b5e2c98eca35f9b522418e8e942da95dbe592e2648aa730b75417e42a4abd9ceb3a0be758dc89874e6cc4093f95476b172bd48e45f4ac628252f17856946009', 'ace6de9dfd111abdf185768bb08b900a2442b0fa8dcd7e8ba9bb590c1a824a0f979990021e98665dccf4c003fa89515da2cc72ee51878a7f3058b158b43f32db', '9', 'Meleca', 'Grigore', null, 'EN', '2', '14', null, null, null, null, '13', '17', '2016-12-07 19:43:33');
INSERT INTO `members` VALUES ('3', 'admin_pass', 'grigore9972@gmail.com', '8b5e2c98eca35f9b522418e8e942da95dbe592e2648aa730b75417e42a4abd9ceb3a0be758dc89874e6cc4093f95476b172bd48e45f4ac628252f17856946009', 'ace6de9dfd111abdf185768bb08b900a2442b0fa8dcd7e8ba9bb590c1a824a0f979990021e98665dccf4c003fa89515da2cc72ee51878a7f3058b158b43f32db', '0', null, null, null, 'EN', null, null, null, null, null, null, null, null, '2016-12-07 19:43:34');
SET FOREIGN_KEY_CHECKS=1;
