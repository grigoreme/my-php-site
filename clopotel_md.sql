/*
Navicat MySQL Data Transfer

Source Server         : Magazin
Source Server Version : 50631
Source Host           : localhost:3306
Source Database       : clopotel_md

Target Server Type    : MYSQL
Target Server Version : 50631
File Encoding         : 65001

Date: 2016-12-23 12:17:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for Categorie
-- ----------------------------
DROP TABLE IF EXISTS `Categorie`;
CREATE TABLE `Categorie` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nume` varchar(255) DEFAULT NULL,
  `Database` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Categorie
-- ----------------------------
INSERT INTO `Categorie` VALUES ('1', 'Laptopuri', 'notebook');
INSERT INTO `Categorie` VALUES ('2', 'Telefoane', 'phone');

-- ----------------------------
-- Table structure for Subcategorie
-- ----------------------------
DROP TABLE IF EXISTS `Subcategorie`;
CREATE TABLE `Subcategorie` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nume` varchar(255) DEFAULT NULL,
  `ID_Categorie` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `subcat_cat` (`ID_Categorie`),
  CONSTRAINT `subcat_cat` FOREIGN KEY (`ID_Categorie`) REFERENCES `Categorie` (`ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Subcategorie
-- ----------------------------
INSERT INTO `Subcategorie` VALUES ('1', 'Laptopuri si accesorii', '1');
INSERT INTO `Subcategorie` VALUES ('2', 'Telefoane mobile & accesorii', '1');
INSERT INTO `Subcategorie` VALUES ('3', 'Tablete & accesorii', '1');
INSERT INTO `Subcategorie` VALUES ('4', 'Wearables & Gadgeturi', '1');
INSERT INTO `Subcategorie` VALUES ('5', 'Desktop PC & Monitoare', '2');
INSERT INTO `Subcategorie` VALUES ('6', 'Componente PC', '2');
INSERT INTO `Subcategorie` VALUES ('7', 'Software', '2');
INSERT INTO `Subcategorie` VALUES ('8', 'Periferice PC', '2');

-- ----------------------------
-- Table structure for Tip
-- ----------------------------
DROP TABLE IF EXISTS `Tip`;
CREATE TABLE `Tip` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nume` varchar(255) DEFAULT NULL,
  `ID_Subcategorie` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Tip_subcategorie` (`ID_Subcategorie`),
  CONSTRAINT `Tip_subcategorie` FOREIGN KEY (`ID_Subcategorie`) REFERENCES `Subcategorie` (`ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Tip
-- ----------------------------
INSERT INTO `Tip` VALUES ('1', 'Laptopuri', '1');
INSERT INTO `Tip` VALUES ('2', 'Genti laptop', '1');
INSERT INTO `Tip` VALUES ('3', 'Standuri/Coolere notebook', '1');
INSERT INTO `Tip` VALUES ('4', 'Hard disk-uri notebook', '1');
INSERT INTO `Tip` VALUES ('5', 'Memorii Notebook', '1');
INSERT INTO `Tip` VALUES ('6', 'Incarcatoare laptop', '1');
INSERT INTO `Tip` VALUES ('7', 'Baterii laptop', '1');
INSERT INTO `Tip` VALUES ('8', 'Alte accesorii', '1');
INSERT INTO `Tip` VALUES ('9', 'Telefoane Mobile', '2');
INSERT INTO `Tip` VALUES ('10', 'Huse telefoane', '2');
INSERT INTO `Tip` VALUES ('11', 'Folii protectie telefoane', '2');
INSERT INTO `Tip` VALUES ('12', 'Incarcatoare telefoane', '2');
INSERT INTO `Tip` VALUES ('13', 'Acumulatori', '2');
INSERT INTO `Tip` VALUES ('14', 'Casti audio si Bluetooth', '2');
INSERT INTO `Tip` VALUES ('15', 'Cabluri si Adaptoare telefoane', '2');
INSERT INTO `Tip` VALUES ('16', 'Suport si Docking', '2');
INSERT INTO `Tip` VALUES ('17', 'Seturi accesorii', '2');
INSERT INTO `Tip` VALUES ('18', 'Alte accesorii telefoane', '2');
INSERT INTO `Tip` VALUES ('19', 'Carduri memorie', '2');
INSERT INTO `Tip` VALUES ('20', 'Telefoane cu fir', '2');
INSERT INTO `Tip` VALUES ('21', 'Telefoane fara fir', '2');
INSERT INTO `Tip` VALUES ('22', 'Sisteme de teleconferinta', '2');
INSERT INTO `Tip` VALUES ('23', 'Centrale Telefonice', '2');
INSERT INTO `Tip` VALUES ('24', 'Tablete', '3');
INSERT INTO `Tip` VALUES ('25', 'Huse tablete', '3');
INSERT INTO `Tip` VALUES ('26', 'Folii protectie tablete', '3');
INSERT INTO `Tip` VALUES ('27', 'Incarcatoare tablete', '3');
INSERT INTO `Tip` VALUES ('28', 'Suport auto si Docking', '3');
INSERT INTO `Tip` VALUES ('29', 'Tastaturi tablete', '3');
INSERT INTO `Tip` VALUES ('30', 'Cabluri si adaptoare tablete', '3');
INSERT INTO `Tip` VALUES ('31', 'Alte accesorii tablete', '3');
INSERT INTO `Tip` VALUES ('32', 'Smartwatch-uri si bratari fitness', '4');
INSERT INTO `Tip` VALUES ('33', 'Drone', '4');
INSERT INTO `Tip` VALUES ('34', 'Boxe portabile fara fir', '4');
INSERT INTO `Tip` VALUES ('35', 'Alte gadgeturi', '4');
INSERT INTO `Tip` VALUES ('36', 'Accesorii drone', '4');
INSERT INTO `Tip` VALUES ('37', 'Alarme & accesorii', '4');
INSERT INTO `Tip` VALUES ('38', 'Control acces & accesorii', '4');
INSERT INTO `Tip` VALUES ('39', 'Centrale si module smart home', '4');
INSERT INTO `Tip` VALUES ('40', 'Desktop PC', '5');
INSERT INTO `Tip` VALUES ('41', 'Monitoare LED', '5');
INSERT INTO `Tip` VALUES ('42', 'Placi video', '6');
INSERT INTO `Tip` VALUES ('43', 'Placi video', '6');
INSERT INTO `Tip` VALUES ('44', 'Placi de baza', '6');
INSERT INTO `Tip` VALUES ('45', 'Placi de sunet', '6');
INSERT INTO `Tip` VALUES ('46', 'Memorii', '6');
INSERT INTO `Tip` VALUES ('47', 'Procesoare', '6');
INSERT INTO `Tip` VALUES ('48', 'Solid-State Drive (SSD)', '6');
INSERT INTO `Tip` VALUES ('49', 'Hard Disk-uri', '6');
INSERT INTO `Tip` VALUES ('50', 'Carcase', '6');
INSERT INTO `Tip` VALUES ('51', 'Surse PC', '6');
INSERT INTO `Tip` VALUES ('52', 'Accesorii IT', '6');
INSERT INTO `Tip` VALUES ('53', 'DVD Writer', '6');
INSERT INTO `Tip` VALUES ('54', 'Blu Ray', '6');
INSERT INTO `Tip` VALUES ('55', 'Coolere Hard disk', '6');
INSERT INTO `Tip` VALUES ('56', 'Coolere Memorii', '6');
INSERT INTO `Tip` VALUES ('57', 'Ventilatoare PC', '6');
INSERT INTO `Tip` VALUES ('58', 'Coolere Procesor', '6');
INSERT INTO `Tip` VALUES ('59', 'Paste Termice', '6');
INSERT INTO `Tip` VALUES ('60', 'Fan Controllere', '6');
INSERT INTO `Tip` VALUES ('61', 'Rack Hard-disk', '6');
INSERT INTO `Tip` VALUES ('62', 'Sisteme de operare', '7');
INSERT INTO `Tip` VALUES ('63', 'Office & Aplicatii Desktop', '7');
INSERT INTO `Tip` VALUES ('64', 'Antivirus', '7');
INSERT INTO `Tip` VALUES ('65', 'Mouse', '8');
INSERT INTO `Tip` VALUES ('66', 'Tastaturi', '8');
INSERT INTO `Tip` VALUES ('67', 'Hard Disk-uri externe', '8');
INSERT INTO `Tip` VALUES ('68', 'SSD-uri externe', '8');
INSERT INTO `Tip` VALUES ('69', 'Memorii USB', '8');
INSERT INTO `Tip` VALUES ('70', 'Boxe PC', '8');
INSERT INTO `Tip` VALUES ('71', 'Casti PC', '8');
INSERT INTO `Tip` VALUES ('72', 'Mousepad', '8');
INSERT INTO `Tip` VALUES ('73', 'Camere Web', '8');
INSERT INTO `Tip` VALUES ('74', 'Tablete grafice', '8');
INSERT INTO `Tip` VALUES ('75', 'Accesorii hard disk-uri externe', '8');
INSERT INTO `Tip` VALUES ('76', 'Unitati optice externe', '8');
INSERT INTO `Tip` VALUES ('77', 'Periferice Diverse', '8');

-- ----------------------------
-- Table structure for Translate
-- ----------------------------
DROP TABLE IF EXISTS `Translate`;
CREATE TABLE `Translate` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Language` enum('EN','RO','RU') DEFAULT NULL,
  `KeyWord` varchar(255) DEFAULT NULL,
  `Translate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `translate` (`KeyWord`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=340 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Translate
-- ----------------------------
INSERT INTO `Translate` VALUES ('1', 'EN', 'myaccount', 'My Account');
INSERT INTO `Translate` VALUES ('2', 'EN', 'search', 'Search');
INSERT INTO `Translate` VALUES ('3', 'EN', 'register', 'Register');
INSERT INTO `Translate` VALUES ('4', 'EN', 'login', 'Login');
INSERT INTO `Translate` VALUES ('5', 'EN', 'currently_logged', 'Currently logged in as');
INSERT INTO `Translate` VALUES ('6', 'EN', 'mycart', 'My Cart');
INSERT INTO `Translate` VALUES ('7', 'EN', 'logout', 'Logout');
INSERT INTO `Translate` VALUES ('8', 'EN', 'admin_panel', 'Admin Panel');
INSERT INTO `Translate` VALUES ('9', 'EN', 'rights', 'Rights');
INSERT INTO `Translate` VALUES ('10', 'EN', 'database_manage', 'Database Manage');
INSERT INTO `Translate` VALUES ('11', 'EN', 'top_sell', 'Top Selling');
INSERT INTO `Translate` VALUES ('12', 'EN', 'phones', 'Phones');
INSERT INTO `Translate` VALUES ('13', 'EN', 'phone', 'Phone');
INSERT INTO `Translate` VALUES ('14', 'EN', 'sale', 'Sale');
INSERT INTO `Translate` VALUES ('15', 'EN', 'categories', 'Categories');
INSERT INTO `Translate` VALUES ('16', 'EN', 'info', 'Info');
INSERT INTO `Translate` VALUES ('17', 'EN', 'others', 'Others');
INSERT INTO `Translate` VALUES ('18', 'EN', 'news_subs', 'Newsletter Subscribe');
INSERT INTO `Translate` VALUES ('19', 'EN', 'email_subs', 'Email Subscribe');
INSERT INTO `Translate` VALUES ('20', 'EN', 'subscribe', 'Subscribe');
INSERT INTO `Translate` VALUES ('21', 'EN', 'about', 'About Us');
INSERT INTO `Translate` VALUES ('22', 'EN', 'team', 'Team');
INSERT INTO `Translate` VALUES ('23', 'EN', 'shops', 'Shops');
INSERT INTO `Translate` VALUES ('24', 'EN', 'refunds', 'Refunds');
INSERT INTO `Translate` VALUES ('25', 'EN', 'refund', 'Refund');
INSERT INTO `Translate` VALUES ('26', 'EN', 'delivery', 'Delivery');
INSERT INTO `Translate` VALUES ('27', 'EN', 'garanty', 'Garanty');
INSERT INTO `Translate` VALUES ('28', 'EN', 'copyright', 'Copyright Clopotel.md © online store 2016.');
INSERT INTO `Translate` VALUES ('29', 'EN', 'personal_info', 'Personal Information');
INSERT INTO `Translate` VALUES ('30', 'EN', 'username', 'Username');
INSERT INTO `Translate` VALUES ('31', 'EN', 'role', 'Role');
INSERT INTO `Translate` VALUES ('32', 'EN', 'first_name', 'First Name');
INSERT INTO `Translate` VALUES ('33', 'EN', 'last_name', 'Last Name');
INSERT INTO `Translate` VALUES ('34', 'EN', 'date_entered', 'Date Entered');
INSERT INTO `Translate` VALUES ('35', 'EN', 'adress', 'Adress');
INSERT INTO `Translate` VALUES ('36', 'EN', 'adresses', 'Adresses');
INSERT INTO `Translate` VALUES ('37', 'EN', 'billing_adress', 'Billing Adress');
INSERT INTO `Translate` VALUES ('38', 'EN', 'billing_adresses', 'Billing Adresses');
INSERT INTO `Translate` VALUES ('39', 'EN', 'change', 'Change');
INSERT INTO `Translate` VALUES ('40', 'EN', 'region', 'District');
INSERT INTO `Translate` VALUES ('41', 'EN', 'city', 'City');
INSERT INTO `Translate` VALUES ('42', 'EN', 'postal_code', 'Postal Code');
INSERT INTO `Translate` VALUES ('43', 'EN', 'street', 'Street');
INSERT INTO `Translate` VALUES ('44', 'EN', 'build', 'Build');
INSERT INTO `Translate` VALUES ('45', 'EN', 'door', 'Door');
INSERT INTO `Translate` VALUES ('46', 'EN', 'change_adress', 'Change Adress');
INSERT INTO `Translate` VALUES ('47', 'EN', 'back_to_acc', 'Back to My Account');
INSERT INTO `Translate` VALUES ('48', 'EN', 'change_pass', 'Change Password');
INSERT INTO `Translate` VALUES ('49', 'EN', 'error_login', 'Error Loggin in');
INSERT INTO `Translate` VALUES ('50', 'EN', 'pass', 'Password');
INSERT INTO `Translate` VALUES ('51', 'EN', 'old_pass', 'Old Password');
INSERT INTO `Translate` VALUES ('52', 'EN', 'repeat_pass', 'Repeat Password');
INSERT INTO `Translate` VALUES ('53', 'EN', 'not_set', 'Not set yet!');
INSERT INTO `Translate` VALUES ('54', 'EN', 'set', 'Set');
INSERT INTO `Translate` VALUES ('55', 'EN', 'pass_must_match', 'Your password and old password cant match');
INSERT INTO `Translate` VALUES ('56', 'EN', 'dont_have_account', 'If you don\'t have account please register!');
INSERT INTO `Translate` VALUES ('57', 'EN', 'contact', 'Contact');
INSERT INTO `Translate` VALUES ('58', 'EN', 'error', 'Something goes wrong!');
INSERT INTO `Translate` VALUES ('59', 'EN', 'complete_right', 'Complete right all the fields.');
INSERT INTO `Translate` VALUES ('60', 'EN', 'star_obligatory', '(Fields with * are obligatory)');
INSERT INTO `Translate` VALUES ('61', 'EN', 'yes', 'Yes');
INSERT INTO `Translate` VALUES ('62', 'EN', 'no', 'No');
INSERT INTO `Translate` VALUES ('63', 'EN', '4', 'Quad');
INSERT INTO `Translate` VALUES ('64', 'EN', '2', 'Dual');
INSERT INTO `Translate` VALUES ('65', 'EN', '8', 'Octa');
INSERT INTO `Translate` VALUES ('66', 'EN', '8', 'Octa');
INSERT INTO `Translate` VALUES ('67', 'EN', 'Card_reader', 'Card Reader');
INSERT INTO `Translate` VALUES ('68', 'EN', 'Num_pad', 'Numeric Pad');
INSERT INTO `Translate` VALUES ('69', 'EN', 'Microfon', 'Microphone');
INSERT INTO `Translate` VALUES ('70', 'EN', 'Camera', 'Camera');
INSERT INTO `Translate` VALUES ('71', 'EN', 'Audio', 'Audio');
INSERT INTO `Translate` VALUES ('72', 'EN', 'DVD', 'DVD');
INSERT INTO `Translate` VALUES ('73', 'EN', 'RJ_45', 'RJ 47');
INSERT INTO `Translate` VALUES ('74', 'EN', 'VGA', 'VGA');
INSERT INTO `Translate` VALUES ('75', 'EN', 'HDMI', 'HDMI');
INSERT INTO `Translate` VALUES ('76', 'EN', 'USB3_0', 'USB 3.0');
INSERT INTO `Translate` VALUES ('77', 'EN', 'USB2_0', 'USB 2.0');
INSERT INTO `Translate` VALUES ('78', 'EN', 'Wifi', 'Wifi');
INSERT INTO `Translate` VALUES ('79', 'EN', 'Bluetooth', 'Bluetooth');
INSERT INTO `Translate` VALUES ('80', 'EN', 'Price', 'Price');
INSERT INTO `Translate` VALUES ('81', 'EN', 'Cover', 'Cover');
INSERT INTO `Translate` VALUES ('82', 'EN', 'Capacitate_Video', 'Video Capacity');
INSERT INTO `Translate` VALUES ('83', 'EN', 'Video', 'Video');
INSERT INTO `Translate` VALUES ('84', 'EN', 'Tip_capacitate', 'Capacity Type');
INSERT INTO `Translate` VALUES ('85', 'EN', 'Capacitate', 'Capacity');
INSERT INTO `Translate` VALUES ('86', 'EN', 'RAM', 'RAM');
INSERT INTO `Translate` VALUES ('87', 'EN', 'Greutate', 'Weight');
INSERT INTO `Translate` VALUES ('88', 'EN', 'Dimensiune', 'Size');
INSERT INTO `Translate` VALUES ('89', 'EN', 'Sistem_Operare', 'Operation System');
INSERT INTO `Translate` VALUES ('90', 'EN', 'Alimentare', 'Power');
INSERT INTO `Translate` VALUES ('91', 'EN', 'Diagonala', 'Diagonal');
INSERT INTO `Translate` VALUES ('92', 'EN', 'Rezolutie', 'Resolution');
INSERT INTO `Translate` VALUES ('93', 'EN', 'Display', 'Display');
INSERT INTO `Translate` VALUES ('94', 'EN', 'Tip_Procesor', 'Processor Type');
INSERT INTO `Translate` VALUES ('95', 'EN', 'Frecventa', 'Frequency');
INSERT INTO `Translate` VALUES ('96', 'EN', 'Nuclee', 'Cores');
INSERT INTO `Translate` VALUES ('97', 'EN', 'Model_Procesor', 'Processor Model');
INSERT INTO `Translate` VALUES ('98', 'EN', 'Procesor', 'Processor');
INSERT INTO `Translate` VALUES ('99', 'EN', 'Culoare', 'Color');
INSERT INTO `Translate` VALUES ('100', 'EN', 'Serie', 'Series');
INSERT INTO `Translate` VALUES ('101', 'EN', 'Model', 'Model');
INSERT INTO `Translate` VALUES ('102', 'EN', 'Firma', 'Firm');
INSERT INTO `Translate` VALUES ('103', 'EN', 'Tastatura', 'Keyboard');
INSERT INTO `Translate` VALUES ('104', 'EN', '2G', '2G');
INSERT INTO `Translate` VALUES ('105', 'EN', '3G', '3G');
INSERT INTO `Translate` VALUES ('106', 'EN', '4G', '4G');
INSERT INTO `Translate` VALUES ('107', 'EN', 'SIM', 'SIM');
INSERT INTO `Translate` VALUES ('108', 'EN', 'SIM_Slots', 'Sim Slots');
INSERT INTO `Translate` VALUES ('109', 'EN', 'GPS', 'GPS');
INSERT INTO `Translate` VALUES ('110', 'EN', 'Rezolutie_Display', 'Display Resolution');
INSERT INTO `Translate` VALUES ('111', 'EN', 'TouchScreen', 'Touch Screen');
INSERT INTO `Translate` VALUES ('112', 'EN', 'Tehnologie_Display', 'Display Tehnologi');
INSERT INTO `Translate` VALUES ('113', 'EN', 'TouchScreen', 'Touch Screen');
INSERT INTO `Translate` VALUES ('114', 'EN', 'Culori_K', 'K Colors');
INSERT INTO `Translate` VALUES ('115', 'EN', 'SlotMemorie', 'Memory slot');
INSERT INTO `Translate` VALUES ('116', 'EN', 'SlotMemorie_Limit', 'Memory slot limit');
INSERT INTO `Translate` VALUES ('117', 'EN', 'Memorie', 'Memory');
INSERT INTO `Translate` VALUES ('118', 'EN', 'GPRS', 'GPRS');
INSERT INTO `Translate` VALUES ('119', 'EN', 'NFC', 'NFC');
INSERT INTO `Translate` VALUES ('120', 'EN', 'USB', 'USB');
INSERT INTO `Translate` VALUES ('121', 'EN', 'Audio_Jack', 'Audio Jack');
INSERT INTO `Translate` VALUES ('122', 'EN', 'Camera', 'Camera');
INSERT INTO `Translate` VALUES ('123', 'EN', 'Rezoltie_Camera', 'Camera Resolution');
INSERT INTO `Translate` VALUES ('124', 'EN', 'Rezolutie_Foto', 'Photo Resolutin');
INSERT INTO `Translate` VALUES ('125', 'EN', 'Rezolutie_Video', 'Video Resolution');
INSERT INTO `Translate` VALUES ('126', 'EN', 'Blitz', 'Flash');
INSERT INTO `Translate` VALUES ('127', 'EN', 'Camera_Frontala', 'Frontal Camera');
INSERT INTO `Translate` VALUES ('128', 'EN', 'Blitz_Frontal', 'Frontal Flash');
INSERT INTO `Translate` VALUES ('129', 'EN', 'Sensor_Frontal', 'Frontal Sensor');
INSERT INTO `Translate` VALUES ('130', 'EN', 'Baterie', 'Batery');
INSERT INTO `Translate` VALUES ('131', 'EN', 'Capacitate_Baterie', 'Batery Capacity');
INSERT INTO `Translate` VALUES ('132', 'EN', 'Producator_Chipset', 'Chipset Manufacturer');
INSERT INTO `Translate` VALUES ('133', 'EN', 'Serie_Chipset', 'Chipset Series');
INSERT INTO `Translate` VALUES ('134', 'EN', 'Model_Chipset', 'Chipset Model');
INSERT INTO `Translate` VALUES ('135', 'EN', 'FingerPrint', 'Finger Print');
INSERT INTO `Translate` VALUES ('136', 'EN', 'Radio', 'Radio');
INSERT INTO `Translate` VALUES ('137', 'EN', 'MultiTouch', 'Multi Touch');
INSERT INTO `Translate` VALUES ('138', 'RO', 'myaccount', 'Pagina Mea');
INSERT INTO `Translate` VALUES ('139', 'RO', 'search', 'Cautare');
INSERT INTO `Translate` VALUES ('140', 'RO', 'register', 'Inregistrare');
INSERT INTO `Translate` VALUES ('141', 'RO', 'login', 'Logare');
INSERT INTO `Translate` VALUES ('142', 'RO', 'currently_logged', 'Esti logat ca');
INSERT INTO `Translate` VALUES ('143', 'RO', 'mycart', 'Cosul Meu');
INSERT INTO `Translate` VALUES ('144', 'RO', 'logout', 'Delogare');
INSERT INTO `Translate` VALUES ('145', 'RO', 'admin_panel', 'Panoul Administratorului');
INSERT INTO `Translate` VALUES ('146', 'RO', 'rights', 'Privilegii');
INSERT INTO `Translate` VALUES ('147', 'RO', 'database_manage', 'Manipulare Baza de date');
INSERT INTO `Translate` VALUES ('148', 'RO', 'top_sell', 'Cele mai vindute');
INSERT INTO `Translate` VALUES ('149', 'RO', 'phones', 'Telefoane');
INSERT INTO `Translate` VALUES ('150', 'RO', 'phone', 'Telefon');
INSERT INTO `Translate` VALUES ('151', 'RO', 'sale', 'Reducere');
INSERT INTO `Translate` VALUES ('152', 'RO', 'categories', 'Categorii');
INSERT INTO `Translate` VALUES ('153', 'RO', 'info', 'Informatii');
INSERT INTO `Translate` VALUES ('154', 'RO', 'others', 'Altele');
INSERT INTO `Translate` VALUES ('155', 'RO', 'news_subs', 'Abonare Noutati');
INSERT INTO `Translate` VALUES ('156', 'RO', 'email_subs', 'Abonare Email');
INSERT INTO `Translate` VALUES ('157', 'RO', 'subscribe', 'Abonare');
INSERT INTO `Translate` VALUES ('158', 'RO', 'about', 'Despre Noi');
INSERT INTO `Translate` VALUES ('159', 'RO', 'team', 'Echipa');
INSERT INTO `Translate` VALUES ('160', 'RO', 'shops', 'Magazine');
INSERT INTO `Translate` VALUES ('161', 'RO', 'refunds', 'Returnari');
INSERT INTO `Translate` VALUES ('162', 'RO', 'refund', 'Returnare');
INSERT INTO `Translate` VALUES ('163', 'RO', 'delivery', 'Livrare');
INSERT INTO `Translate` VALUES ('164', 'RO', 'garanty', 'Garantii');
INSERT INTO `Translate` VALUES ('165', 'RO', 'copyright', 'Drepturi rezervate de catre Clopotel.md © Magazin Online 2016.');
INSERT INTO `Translate` VALUES ('166', 'RO', 'personal_info', 'Informatie personala');
INSERT INTO `Translate` VALUES ('167', 'RO', 'username', 'Nume utilizator');
INSERT INTO `Translate` VALUES ('168', 'RO', 'role', 'Rol');
INSERT INTO `Translate` VALUES ('169', 'RO', 'first_name', 'Nume');
INSERT INTO `Translate` VALUES ('170', 'RO', 'last_name', 'Prenume');
INSERT INTO `Translate` VALUES ('171', 'RO', 'date_entered', 'Data inregistrarii');
INSERT INTO `Translate` VALUES ('172', 'RO', 'adress', 'Adresa');
INSERT INTO `Translate` VALUES ('173', 'RO', 'adresses', 'Adrese');
INSERT INTO `Translate` VALUES ('174', 'RO', 'billing_adress', 'Adresa Facturare');
INSERT INTO `Translate` VALUES ('175', 'RO', 'billing_adresses', 'Adrese Facturare');
INSERT INTO `Translate` VALUES ('176', 'RO', 'change', 'Modifica');
INSERT INTO `Translate` VALUES ('177', 'RO', 'region', 'Raion/Judet');
INSERT INTO `Translate` VALUES ('178', 'RO', 'city', 'Oras');
INSERT INTO `Translate` VALUES ('179', 'RO', 'postal_code', 'Cod Postal');
INSERT INTO `Translate` VALUES ('180', 'RO', 'street', 'Strada');
INSERT INTO `Translate` VALUES ('181', 'RO', 'build', 'Cladire');
INSERT INTO `Translate` VALUES ('182', 'RO', 'door', 'Usa');
INSERT INTO `Translate` VALUES ('183', 'RO', 'change_adress', 'Schimba Adresa');
INSERT INTO `Translate` VALUES ('184', 'RO', 'back_to_acc', 'Inapoi la pagina mea');
INSERT INTO `Translate` VALUES ('185', 'RO', 'change_pass', 'Modifica Parola');
INSERT INTO `Translate` VALUES ('186', 'RO', 'error_login', 'Eroare Logare');
INSERT INTO `Translate` VALUES ('187', 'RO', 'pass', 'Parola');
INSERT INTO `Translate` VALUES ('188', 'RO', 'old_pass', 'Parola Veche');
INSERT INTO `Translate` VALUES ('189', 'RO', 'repeat_pass', 'Repeta Parola');
INSERT INTO `Translate` VALUES ('190', 'RO', 'not_set', 'Inca nu e setat');
INSERT INTO `Translate` VALUES ('191', 'RO', 'set', 'Seteaza');
INSERT INTO `Translate` VALUES ('192', 'RO', 'pass_must_match', 'Parolele trebuie sa coincida!');
INSERT INTO `Translate` VALUES ('193', 'RO', 'dont_have_account', 'Daca nu ai account te rog inregistreaza-te!');
INSERT INTO `Translate` VALUES ('194', 'RO', 'contact', 'Contact');
INSERT INTO `Translate` VALUES ('195', 'RO', 'error', 'Ceva nu a mers dupa planul nostru!..');
INSERT INTO `Translate` VALUES ('196', 'RO', 'complete_right', 'Trebuie sa completezi corect toate campurile!');
INSERT INTO `Translate` VALUES ('197', 'RO', 'star_obligatory', '(Cumpurile cu * sunt obligatorii)');
INSERT INTO `Translate` VALUES ('198', 'RO', 'yes', 'Da');
INSERT INTO `Translate` VALUES ('199', 'RO', 'no', 'Nu');
INSERT INTO `Translate` VALUES ('200', 'RO', '4', 'Quad');
INSERT INTO `Translate` VALUES ('201', 'RO', '2', 'Dual');
INSERT INTO `Translate` VALUES ('202', 'RO', '8', 'Octa');
INSERT INTO `Translate` VALUES ('203', 'RO', '8', 'Octa');
INSERT INTO `Translate` VALUES ('204', 'RO', 'Card_reader Cititor de Carduri', null);
INSERT INTO `Translate` VALUES ('205', 'RO', 'Num_pad', 'Tastatura Numerica');
INSERT INTO `Translate` VALUES ('206', 'RO', 'Microfon', 'Microfon');
INSERT INTO `Translate` VALUES ('207', 'RO', 'Camera', 'Camera');
INSERT INTO `Translate` VALUES ('208', 'RO', 'Audio', 'Audio');
INSERT INTO `Translate` VALUES ('209', 'RO', 'DVD', 'DVD');
INSERT INTO `Translate` VALUES ('210', 'RO', 'RJ_45', 'RJ 47');
INSERT INTO `Translate` VALUES ('211', 'RO', 'VGA', 'VGA');
INSERT INTO `Translate` VALUES ('212', 'RO', 'HDMI', 'HDMI');
INSERT INTO `Translate` VALUES ('213', 'RO', 'USB3_0', 'USB 3.0');
INSERT INTO `Translate` VALUES ('214', 'RO', 'USB2_0', 'USB 2.0');
INSERT INTO `Translate` VALUES ('215', 'RO', 'Wifi', 'Wifi');
INSERT INTO `Translate` VALUES ('216', 'RO', 'Bluetooth', 'Bluetooth');
INSERT INTO `Translate` VALUES ('217', 'RO', 'Price', 'Pret');
INSERT INTO `Translate` VALUES ('218', 'RO', 'Cover', 'Coperta');
INSERT INTO `Translate` VALUES ('219', 'RO', 'Capacitate_Video', 'Capacitate Video');
INSERT INTO `Translate` VALUES ('220', 'RO', 'Video', 'Video');
INSERT INTO `Translate` VALUES ('221', 'RO', 'Tip_capacitate', 'Tip Capacite');
INSERT INTO `Translate` VALUES ('222', 'RO', 'Capacitate', 'Capacite');
INSERT INTO `Translate` VALUES ('223', 'RO', 'RAM', 'RAM');
INSERT INTO `Translate` VALUES ('224', 'RO', 'Greutate', 'Greutate');
INSERT INTO `Translate` VALUES ('225', 'RO', 'Dimensiune', 'Dimensiune');
INSERT INTO `Translate` VALUES ('226', 'RO', 'Sistem_Operare', 'Sistem de operare');
INSERT INTO `Translate` VALUES ('227', 'RO', 'Alimentare', 'Alimentare');
INSERT INTO `Translate` VALUES ('228', 'RO', 'Diagonala', 'Diagonala');
INSERT INTO `Translate` VALUES ('229', 'RO', 'Rezolutie', 'Rezolutie');
INSERT INTO `Translate` VALUES ('230', 'RO', 'Display', 'Ecran');
INSERT INTO `Translate` VALUES ('231', 'RO', 'Tip_Procesor', 'Tip Procesor');
INSERT INTO `Translate` VALUES ('232', 'RO', 'Frecventa', 'Frecventa');
INSERT INTO `Translate` VALUES ('233', 'RO', 'Nuclee', 'Nuclee');
INSERT INTO `Translate` VALUES ('234', 'RO', 'Model_Procesor', 'Model Procesor');
INSERT INTO `Translate` VALUES ('235', 'RO', 'Procesor', 'Procesor');
INSERT INTO `Translate` VALUES ('236', 'RO', 'Culoare', 'Culoare');
INSERT INTO `Translate` VALUES ('237', 'RO', 'Serie', 'Serie');
INSERT INTO `Translate` VALUES ('238', 'RO', 'Model', 'Model');
INSERT INTO `Translate` VALUES ('239', 'RO', 'Firma', 'Firma');
INSERT INTO `Translate` VALUES ('240', 'RO', 'Tastatura', 'Tastatura');
INSERT INTO `Translate` VALUES ('241', 'RO', '2G', '2G');
INSERT INTO `Translate` VALUES ('242', 'RO', '3G', '3G');
INSERT INTO `Translate` VALUES ('243', 'RO', '4G', '4G');
INSERT INTO `Translate` VALUES ('244', 'RO', 'SIM', 'SIM');
INSERT INTO `Translate` VALUES ('245', 'RO', 'SIM_Slots', 'Sloturi Sim');
INSERT INTO `Translate` VALUES ('246', 'RO', 'GPS', 'GPS');
INSERT INTO `Translate` VALUES ('247', 'RO', 'Rezolutie_Display', 'Rezolutie Ecran');
INSERT INTO `Translate` VALUES ('248', 'RO', 'TouchScreen', 'Ecran Tactil');
INSERT INTO `Translate` VALUES ('249', 'RO', 'Tehnologie_Display', 'Tehnologie Ecran');
INSERT INTO `Translate` VALUES ('250', 'RO', 'Culori_K', 'Colori K');
INSERT INTO `Translate` VALUES ('251', 'RO', 'SlotMemorie', 'Slot Memorie');
INSERT INTO `Translate` VALUES ('252', 'RO', 'SlotMemorie_Limit', 'Limita Slot Memorie');
INSERT INTO `Translate` VALUES ('253', 'RO', 'Memorie', 'Memorie');
INSERT INTO `Translate` VALUES ('254', 'RO', 'GPRS', 'GPRS');
INSERT INTO `Translate` VALUES ('255', 'RO', 'NFC', 'NFC');
INSERT INTO `Translate` VALUES ('256', 'RO', 'USB', 'USB');
INSERT INTO `Translate` VALUES ('257', 'RO', 'Audio_Jack', 'Audio Jack');
INSERT INTO `Translate` VALUES ('258', 'RO', 'Camera', 'Camera');
INSERT INTO `Translate` VALUES ('259', 'RO', 'Rezoltie_Camera', 'Rezolutie Camera');
INSERT INTO `Translate` VALUES ('260', 'RO', 'Rezolutie_Foto', 'Rezolutie Poze');
INSERT INTO `Translate` VALUES ('261', 'RO', 'Rezolutie_Video', 'Rezolutie Video');
INSERT INTO `Translate` VALUES ('262', 'RO', 'Blitz', 'Blitz');
INSERT INTO `Translate` VALUES ('263', 'RO', 'Camera_Frontala', 'Camera Frontala');
INSERT INTO `Translate` VALUES ('264', 'RO', 'Blitz_Frontal', 'Blitz Frontal');
INSERT INTO `Translate` VALUES ('265', 'RO', 'Sensor_Frontal', 'Sensor Frontal');
INSERT INTO `Translate` VALUES ('266', 'RO', 'Baterie', 'Baterie');
INSERT INTO `Translate` VALUES ('267', 'RO', 'Capacitate_Baterie', 'Capacitate Baterie');
INSERT INTO `Translate` VALUES ('268', 'RO', 'Producator_Chipset', 'Producator Chipset');
INSERT INTO `Translate` VALUES ('269', 'RO', 'Serie_Chipset', 'Serie Chipset');
INSERT INTO `Translate` VALUES ('270', 'RO', 'Model_Chipset', 'Model Chipset');
INSERT INTO `Translate` VALUES ('271', 'RO', 'FingerPrint', 'Amprenta Digitala');
INSERT INTO `Translate` VALUES ('272', 'RO', 'Radio', 'Radio');
INSERT INTO `Translate` VALUES ('273', 'RO', 'MultiTouch', 'Atingera multipla');
INSERT INTO `Translate` VALUES ('274', 'EN', 'popularity', 'Popularity');
INSERT INTO `Translate` VALUES ('275', 'EN', 'rating', 'Rating');
INSERT INTO `Translate` VALUES ('276', 'EN', 'lower_up', 'Lower > Upper');
INSERT INTO `Translate` VALUES ('277', 'EN', 'upper_low', 'Upper > Lower');
INSERT INTO `Translate` VALUES ('278', 'EN', 'name', 'Name');
INSERT INTO `Translate` VALUES ('279', 'RO', 'popularity', 'Popularitate');
INSERT INTO `Translate` VALUES ('280', 'RO', 'rating', 'Rating');
INSERT INTO `Translate` VALUES ('281', 'RO', 'lower_up', 'Mic > Mare');
INSERT INTO `Translate` VALUES ('282', 'RO', 'upper_low', 'Mare > Mic');
INSERT INTO `Translate` VALUES ('283', 'RO', 'name', 'Nume');
INSERT INTO `Translate` VALUES ('284', 'EN', 'az', 'A-Z');
INSERT INTO `Translate` VALUES ('285', 'EN', 'za', 'Z-A');
INSERT INTO `Translate` VALUES ('286', 'RO', 'az', 'A-Z');
INSERT INTO `Translate` VALUES ('287', 'RO', 'za', 'Z-A');
INSERT INTO `Translate` VALUES ('288', 'EN', 'sort', 'Sort');
INSERT INTO `Translate` VALUES ('289', 'RO', 'sort', 'Sortare');
INSERT INTO `Translate` VALUES ('290', 'EN', 'Chipset', 'Chipset');
INSERT INTO `Translate` VALUES ('291', 'RO', 'Chipset', 'Chipset');
INSERT INTO `Translate` VALUES ('292', 'EN', 'filter', 'Filter');
INSERT INTO `Translate` VALUES ('293', 'RO', 'filter', 'Filtrare');
INSERT INTO `Translate` VALUES ('294', 'RO', 'top_sale', 'Top Vinzari');
INSERT INTO `Translate` VALUES ('295', 'EN', 'top_sale', 'Top Sales');
INSERT INTO `Translate` VALUES ('296', 'EN', 'notebooks', 'Notebooks');
INSERT INTO `Translate` VALUES ('297', 'EN', 'phones', 'Phones');
INSERT INTO `Translate` VALUES ('298', 'RO', 'notebooks', 'Laptopuri');
INSERT INTO `Translate` VALUES ('299', 'RO', 'phones', 'Telefoane');
INSERT INTO `Translate` VALUES ('300', 'RO', 'en', 'Engleza');
INSERT INTO `Translate` VALUES ('301', 'RO', 'ro', 'Romana');
INSERT INTO `Translate` VALUES ('302', 'RO', 'ru', 'Rusa');
INSERT INTO `Translate` VALUES ('303', 'EN', 'en', 'English');
INSERT INTO `Translate` VALUES ('304', 'EN', 'ro', 'Romanian');
INSERT INTO `Translate` VALUES ('305', 'EN', 'ru', 'Russian');
INSERT INTO `Translate` VALUES ('306', 'EN', 'registration', 'Registration');
INSERT INTO `Translate` VALUES ('307', 'RO', 'registration', 'Inregistrare');
INSERT INTO `Translate` VALUES ('308', 'RO', 'repeat_email', 'Repeta Adresa Email');
INSERT INTO `Translate` VALUES ('309', 'EN', 'repeat_email', 'Repeat Email Adress');
INSERT INTO `Translate` VALUES ('310', 'EN', 'sign_up_news', 'Signg up for our newsletter');
INSERT INTO `Translate` VALUES ('311', 'RO', 'sign_up_news', 'Aboneazate la noutatile noastre');
INSERT INTO `Translate` VALUES ('312', 'RO', 'send_notif', 'Trimite notificari la acest email');
INSERT INTO `Translate` VALUES ('313', 'EN', 'send_notif', 'Send notifications to this email');
INSERT INTO `Translate` VALUES ('314', 'EN', 'rules', 'Rules');
INSERT INTO `Translate` VALUES ('315', 'RO', 'rules', 'Reguli');
INSERT INTO `Translate` VALUES ('316', 'EN', 'rule1', 'Usernames may contain only digits, upper and lowercase letters and underscores');
INSERT INTO `Translate` VALUES ('317', 'EN', 'rule2', 'Emails must have a valid email format');
INSERT INTO `Translate` VALUES ('318', 'EN', 'rule3', 'Passwords must be at least 6 characters long');
INSERT INTO `Translate` VALUES ('319', 'EN', 'rule4', 'Passwords must contain');
INSERT INTO `Translate` VALUES ('320', 'EN', 'rule5', 'At least one uppercase letter (A..Z)');
INSERT INTO `Translate` VALUES ('321', 'EN', 'rule6', 'At least one lowercase letter (a..z)');
INSERT INTO `Translate` VALUES ('322', 'EN', 'rule7', 'At least one number (0..9)');
INSERT INTO `Translate` VALUES ('323', 'EN', 'rule8', 'Your password and confirmation must match exactly');
INSERT INTO `Translate` VALUES ('324', 'EN', 'back_to_login', 'Return to login Page.');
INSERT INTO `Translate` VALUES ('325', 'RO', 'rule1', 'Numele de utilizator poate contine doar cifre, litere mici si mari si subliniere.');
INSERT INTO `Translate` VALUES ('326', 'RO', 'rule2', 'Emailul trebuie sa contina un format valid!');
INSERT INTO `Translate` VALUES ('327', 'RO', 'rule3', 'Parola trebuie sa fie de cel putin 6 caractere lungime!');
INSERT INTO `Translate` VALUES ('328', 'RO', 'rule4', 'Parola trebuie sa contina');
INSERT INTO `Translate` VALUES ('329', 'RO', 'rule5', 'Cel putin o litera mare (A..Z)');
INSERT INTO `Translate` VALUES ('330', 'RO', 'rule6', 'Cel putin o litera mica(a..z)');
INSERT INTO `Translate` VALUES ('331', 'RO', 'rule7', 'Cel putin o cifra(0..9)');
INSERT INTO `Translate` VALUES ('332', 'RO', 'rule8', 'Parolele trebuie sa coincida!');
INSERT INTO `Translate` VALUES ('333', 'RO', 'back_to_login', 'Inapoi la pagina de logare.');
INSERT INTO `Translate` VALUES ('334', 'RO', 'email', 'Adresa Email');
INSERT INTO `Translate` VALUES ('335', 'EN', 'email', 'Email Adress');
INSERT INTO `Translate` VALUES ('336', 'RO', 'search_rule', 'Continutul cautarii trebuie sa contina minim 4 caractere!');
INSERT INTO `Translate` VALUES ('337', 'EN', 'search_rule', 'Search string must have at least 4 characters!');
INSERT INTO `Translate` VALUES ('338', 'EN', 'nothing_found', 'Nothing Found!');
INSERT INTO `Translate` VALUES ('339', 'RO', 'nothing_found', 'Nu am gasit nici un element!');

-- ----------------------------
-- Table structure for View
-- ----------------------------
DROP TABLE IF EXISTS `View`;
CREATE TABLE `View` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `User` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ItemName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of View
-- ----------------------------
SET FOREIGN_KEY_CHECKS=1;
