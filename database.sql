-- phpMyAdmin SQL Dump
-- version 4.4.15.8
-- https://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 28, 2017 at 10:12 AM
-- Server version: 5.6.31
-- PHP Version: 5.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clopotel_md`
--

-- --------------------------------------------------------

--
-- Table structure for table `Cart`
--

CREATE TABLE IF NOT EXISTS `Cart` (
  `ID` int(11) NOT NULL,
  `members` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `Count` int(11) NOT NULL DEFAULT '1',
  `Date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Cart`
--

INSERT INTO `Cart` (`ID`, `members`, `category`, `item`, `Count`, `Date`) VALUES
(9, 2, 2, 2, 4, '2017-03-27 14:01:51'),
(10, 2, 2, 3, 6, '2017-03-27 14:02:10'),
(11, 2, 1, 1, 1, '2017-03-28 05:00:31'),
(13, 3, 2, 2, 2, '2017-03-28 05:22:13'),
(14, 3, 2, 3, 1, '2017-03-28 05:22:15'),
(18, 3, 1, 1, 2, '2017-03-28 05:25:58'),
(19, 3, 1, 2, 6, '2017-03-28 05:25:59'),
(20, 3, 1, 3, 4, '2017-03-28 05:26:00');

-- --------------------------------------------------------

--
-- Table structure for table `Categorie`
--

CREATE TABLE IF NOT EXISTS `Categorie` (
  `ID` int(11) NOT NULL,
  `Nume` varchar(255) DEFAULT NULL,
  `Database` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Categorie`
--

INSERT INTO `Categorie` (`ID`, `Nume`, `Database`) VALUES
(1, 'Laptopuri', 'notebook'),
(2, 'Telefoane', 'phone');

-- --------------------------------------------------------

--
-- Table structure for table `Subcategorie`
--

CREATE TABLE IF NOT EXISTS `Subcategorie` (
  `ID` int(11) NOT NULL,
  `Nume` varchar(255) DEFAULT NULL,
  `ID_Categorie` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Subcategorie`
--

INSERT INTO `Subcategorie` (`ID`, `Nume`, `ID_Categorie`) VALUES
(1, 'Laptopuri si accesorii', 1),
(2, 'Telefoane mobile & accesorii', 1),
(3, 'Tablete & accesorii', 1),
(4, 'Wearables & Gadgeturi', 1),
(5, 'Desktop PC & Monitoare', 2),
(6, 'Componente PC', 2),
(7, 'Software', 2),
(8, 'Periferice PC', 2);

-- --------------------------------------------------------

--
-- Table structure for table `Tip`
--

CREATE TABLE IF NOT EXISTS `Tip` (
  `ID` int(11) NOT NULL,
  `Nume` varchar(255) DEFAULT NULL,
  `ID_Subcategorie` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Tip`
--

INSERT INTO `Tip` (`ID`, `Nume`, `ID_Subcategorie`) VALUES
(1, 'Laptopuri', 1),
(2, 'Genti laptop', 1),
(3, 'Standuri/Coolere notebook', 1),
(4, 'Hard disk-uri notebook', 1),
(5, 'Memorii Notebook', 1),
(6, 'Incarcatoare laptop', 1),
(7, 'Baterii laptop', 1),
(8, 'Alte accesorii', 1),
(9, 'Telefoane Mobile', 2),
(10, 'Huse telefoane', 2),
(11, 'Folii protectie telefoane', 2),
(12, 'Incarcatoare telefoane', 2),
(13, 'Acumulatori', 2),
(14, 'Casti audio si Bluetooth', 2),
(15, 'Cabluri si Adaptoare telefoane', 2),
(16, 'Suport si Docking', 2),
(17, 'Seturi accesorii', 2),
(18, 'Alte accesorii telefoane', 2),
(19, 'Carduri memorie', 2),
(20, 'Telefoane cu fir', 2),
(21, 'Telefoane fara fir', 2),
(22, 'Sisteme de teleconferinta', 2),
(23, 'Centrale Telefonice', 2),
(24, 'Tablete', 3),
(25, 'Huse tablete', 3),
(26, 'Folii protectie tablete', 3),
(27, 'Incarcatoare tablete', 3),
(28, 'Suport auto si Docking', 3),
(29, 'Tastaturi tablete', 3),
(30, 'Cabluri si adaptoare tablete', 3),
(31, 'Alte accesorii tablete', 3),
(32, 'Smartwatch-uri si bratari fitness', 4),
(33, 'Drone', 4),
(34, 'Boxe portabile fara fir', 4),
(35, 'Alte gadgeturi', 4),
(36, 'Accesorii drone', 4),
(37, 'Alarme & accesorii', 4),
(38, 'Control acces & accesorii', 4),
(39, 'Centrale si module smart home', 4),
(40, 'Desktop PC', 5),
(41, 'Monitoare LED', 5),
(42, 'Placi video', 6),
(43, 'Placi video', 6),
(44, 'Placi de baza', 6),
(45, 'Placi de sunet', 6),
(46, 'Memorii', 6),
(47, 'Procesoare', 6),
(48, 'Solid-State Drive (SSD)', 6),
(49, 'Hard Disk-uri', 6),
(50, 'Carcase', 6),
(51, 'Surse PC', 6),
(52, 'Accesorii IT', 6),
(53, 'DVD Writer', 6),
(54, 'Blu Ray', 6),
(55, 'Coolere Hard disk', 6),
(56, 'Coolere Memorii', 6),
(57, 'Ventilatoare PC', 6),
(58, 'Coolere Procesor', 6),
(59, 'Paste Termice', 6),
(60, 'Fan Controllere', 6),
(61, 'Rack Hard-disk', 6),
(62, 'Sisteme de operare', 7),
(63, 'Office & Aplicatii Desktop', 7),
(64, 'Antivirus', 7),
(65, 'Mouse', 8),
(66, 'Tastaturi', 8),
(67, 'Hard Disk-uri externe', 8),
(68, 'SSD-uri externe', 8),
(69, 'Memorii USB', 8),
(70, 'Boxe PC', 8),
(71, 'Casti PC', 8),
(72, 'Mousepad', 8),
(73, 'Camere Web', 8),
(74, 'Tablete grafice', 8),
(75, 'Accesorii hard disk-uri externe', 8),
(76, 'Unitati optice externe', 8),
(77, 'Periferice Diverse', 8);

-- --------------------------------------------------------

--
-- Table structure for table `Translate`
--

CREATE TABLE IF NOT EXISTS `Translate` (
  `ID` int(11) NOT NULL,
  `Language` enum('EN','RO','RU') DEFAULT NULL,
  `KeyWord` varchar(255) DEFAULT NULL,
  `Translate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=360 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Translate`
--

INSERT INTO `Translate` (`ID`, `Language`, `KeyWord`, `Translate`) VALUES
(1, 'EN', 'myaccount', 'My Account'),
(2, 'EN', 'search', 'Search'),
(3, 'EN', 'register', 'Register'),
(4, 'EN', 'login', 'Login'),
(5, 'EN', 'currently_logged', 'Currently logged in as'),
(6, 'EN', 'mycart', 'My Cart'),
(7, 'EN', 'logout', 'Logout'),
(8, 'EN', 'admin_panel', 'Admin Panel'),
(9, 'EN', 'rights', 'Rights'),
(10, 'EN', 'database_manage', 'Database Manage'),
(11, 'EN', 'top_sell', 'Top Selling'),
(12, 'EN', 'phones', 'Phones'),
(13, 'EN', 'phone', 'Phone'),
(14, 'EN', 'sale', 'Sale'),
(15, 'EN', 'categories', 'Categories'),
(16, 'EN', 'info', 'Info'),
(17, 'EN', 'others', 'Others'),
(18, 'EN', 'news_subs', 'Newsletter Subscribe'),
(19, 'EN', 'email_subs', 'Email Subscribe'),
(20, 'EN', 'subscribe', 'Subscribe'),
(21, 'EN', 'about', 'About Us'),
(22, 'EN', 'team', 'Team'),
(23, 'EN', 'shops', 'Shops'),
(24, 'EN', 'refunds', 'Refunds'),
(25, 'EN', 'refund', 'Refund'),
(26, 'EN', 'delivery', 'Delivery'),
(27, 'EN', 'garanty', 'Garanty'),
(28, 'EN', 'copyright', 'Copyright Clopotel.md © online store 2016.'),
(29, 'EN', 'personal_info', 'Personal Information'),
(30, 'EN', 'username', 'Username'),
(31, 'EN', 'role', 'Role'),
(32, 'EN', 'first_name', 'First Name'),
(33, 'EN', 'last_name', 'Last Name'),
(34, 'EN', 'date_entered', 'Date Entered'),
(35, 'EN', 'adress', 'Adress'),
(36, 'EN', 'adresses', 'Adresses'),
(37, 'EN', 'billing_adress', 'Billing Adress'),
(38, 'EN', 'billing_adresses', 'Billing Adresses'),
(39, 'EN', 'change', 'Change'),
(40, 'EN', 'region', 'District'),
(41, 'EN', 'city', 'City'),
(42, 'EN', 'postal_code', 'Postal Code'),
(43, 'EN', 'street', 'Street'),
(44, 'EN', 'build', 'Build'),
(45, 'EN', 'door', 'Door'),
(46, 'EN', 'change_adress', 'Change Adress'),
(47, 'EN', 'back_to_acc', 'Back to My Account'),
(48, 'EN', 'change_pass', 'Change Password'),
(49, 'EN', 'error_login', 'Error Loggin in'),
(50, 'EN', 'pass', 'Password'),
(51, 'EN', 'old_pass', 'Old Password'),
(52, 'EN', 'repeat_pass', 'Repeat Password'),
(53, 'EN', 'not_set', 'Not set yet!'),
(54, 'EN', 'set', 'Set'),
(55, 'EN', 'pass_must_match', 'Your password and old password cant match'),
(56, 'EN', 'dont_have_account', 'If you don''t have account please register!'),
(57, 'EN', 'contact', 'Contact'),
(58, 'EN', 'error', 'Something goes wrong!'),
(59, 'EN', 'complete_right', 'Complete right all the fields.'),
(60, 'EN', 'star_obligatory', '(Fields with * are obligatory)'),
(61, 'EN', 'yes', 'Yes'),
(62, 'EN', 'no', 'No'),
(63, 'EN', '4', 'Quad'),
(64, 'EN', '2', 'Dual'),
(65, 'EN', '8', 'Octa'),
(66, 'EN', '8', 'Octa'),
(67, 'EN', 'Card_reader', 'Card Reader'),
(68, 'EN', 'Num_pad', 'Numeric Pad'),
(69, 'EN', 'Microfon', 'Microphone'),
(70, 'EN', 'Camera', 'Camera'),
(71, 'EN', 'Audio', 'Audio'),
(72, 'EN', 'DVD', 'DVD'),
(73, 'EN', 'RJ_45', 'RJ 47'),
(74, 'EN', 'VGA', 'VGA'),
(75, 'EN', 'HDMI', 'HDMI'),
(76, 'EN', 'USB3_0', 'USB 3.0'),
(77, 'EN', 'USB2_0', 'USB 2.0'),
(78, 'EN', 'Wifi', 'Wifi'),
(79, 'EN', 'Bluetooth', 'Bluetooth'),
(80, 'EN', 'Price', 'Price'),
(81, 'EN', 'Cover', 'Cover'),
(82, 'EN', 'Capacitate_Video', 'Video Capacity'),
(83, 'EN', 'Video', 'Video'),
(84, 'EN', 'Tip_capacitate', 'Capacity Type'),
(85, 'EN', 'Capacitate', 'Capacity'),
(86, 'EN', 'RAM', 'RAM'),
(87, 'EN', 'Greutate', 'Weight'),
(88, 'EN', 'Dimensiune', 'Size'),
(89, 'EN', 'Sistem_Operare', 'Operation System'),
(90, 'EN', 'Alimentare', 'Power'),
(91, 'EN', 'Diagonala', 'Diagonal'),
(92, 'EN', 'Rezolutie', 'Resolution'),
(93, 'EN', 'Display', 'Display'),
(94, 'EN', 'Tip_Procesor', 'Processor Type'),
(95, 'EN', 'Frecventa', 'Frequency'),
(96, 'EN', 'Nuclee', 'Cores'),
(97, 'EN', 'Model_Procesor', 'Processor Model'),
(98, 'EN', 'Procesor', 'Processor'),
(99, 'EN', 'Culoare', 'Color'),
(100, 'EN', 'Serie', 'Series'),
(101, 'EN', 'Model', 'Model'),
(102, 'EN', 'Firma', 'Firm'),
(103, 'EN', 'Tastatura', 'Keyboard'),
(104, 'EN', '2G', '2G'),
(105, 'EN', '3G', '3G'),
(106, 'EN', '4G', '4G'),
(107, 'EN', 'SIM', 'SIM'),
(108, 'EN', 'SIM_Slots', 'Sim Slots'),
(109, 'EN', 'GPS', 'GPS'),
(110, 'EN', 'Rezolutie_Display', 'Display Resolution'),
(111, 'EN', 'TouchScreen', 'Touch Screen'),
(112, 'EN', 'Tehnologie_Display', 'Display Tehnologi'),
(113, 'EN', 'TouchScreen', 'Touch Screen'),
(114, 'EN', 'Culori_K', 'K Colors'),
(115, 'EN', 'SlotMemorie', 'Memory slot'),
(116, 'EN', 'SlotMemorie_Limit', 'Memory slot limit'),
(117, 'EN', 'Memorie', 'Memory'),
(118, 'EN', 'GPRS', 'GPRS'),
(119, 'EN', 'NFC', 'NFC'),
(120, 'EN', 'USB', 'USB'),
(121, 'EN', 'Audio_Jack', 'Audio Jack'),
(122, 'EN', 'Camera', 'Camera'),
(123, 'EN', 'Rezoltie_Camera', 'Camera Resolution'),
(124, 'EN', 'Rezolutie_Foto', 'Photo Resolutin'),
(125, 'EN', 'Rezolutie_Video', 'Video Resolution'),
(126, 'EN', 'Blitz', 'Flash'),
(127, 'EN', 'Camera_Frontala', 'Frontal Camera'),
(128, 'EN', 'Blitz_Frontal', 'Frontal Flash'),
(129, 'EN', 'Sensor_Frontal', 'Frontal Sensor'),
(130, 'EN', 'Baterie', 'Batery'),
(131, 'EN', 'Capacitate_Baterie', 'Batery Capacity'),
(132, 'EN', 'Producator_Chipset', 'Chipset Manufacturer'),
(133, 'EN', 'Serie_Chipset', 'Chipset Series'),
(134, 'EN', 'Model_Chipset', 'Chipset Model'),
(135, 'EN', 'FingerPrint', 'Finger Print'),
(136, 'EN', 'Radio', 'Radio'),
(137, 'EN', 'MultiTouch', 'Multi Touch'),
(138, 'RO', 'myaccount', 'Pagina Mea'),
(139, 'RO', 'search', 'Cautare'),
(140, 'RO', 'register', 'Inregistrare'),
(141, 'RO', 'login', 'Logare'),
(142, 'RO', 'currently_logged', 'Esti logat ca'),
(143, 'RO', 'mycart', 'Cosul Meu'),
(144, 'RO', 'logout', 'Delogare'),
(145, 'RO', 'admin_panel', 'Panoul Administratorului'),
(146, 'RO', 'rights', 'Privilegii'),
(147, 'RO', 'database_manage', 'Manipulare Baza de date'),
(148, 'RO', 'top_sell', 'Cele mai vindute'),
(149, 'RO', 'phones', 'Telefoane'),
(150, 'RO', 'phone', 'Telefon'),
(151, 'RO', 'sale', 'Reducere'),
(152, 'RO', 'categories', 'Categorii'),
(153, 'RO', 'info', 'Informatii'),
(154, 'RO', 'others', 'Altele'),
(155, 'RO', 'news_subs', 'Abonare Noutati'),
(156, 'RO', 'email_subs', 'Abonare Email'),
(157, 'RO', 'subscribe', 'Abonare'),
(158, 'RO', 'about', 'Despre Noi'),
(159, 'RO', 'team', 'Echipa'),
(160, 'RO', 'shops', 'Magazine'),
(161, 'RO', 'refunds', 'Returnari'),
(162, 'RO', 'refund', 'Returnare'),
(163, 'RO', 'delivery', 'Livrare'),
(164, 'RO', 'garanty', 'Garantii'),
(165, 'RO', 'copyright', 'Drepturi rezervate de catre Clopotel.md © Magazin Online 2016.'),
(166, 'RO', 'personal_info', 'Informatie personala'),
(167, 'RO', 'username', 'Nume utilizator'),
(168, 'RO', 'role', 'Rol'),
(169, 'RO', 'first_name', 'Nume'),
(170, 'RO', 'last_name', 'Prenume'),
(171, 'RO', 'date_entered', 'Data inregistrarii'),
(172, 'RO', 'adress', 'Adresa'),
(173, 'RO', 'adresses', 'Adrese'),
(174, 'RO', 'billing_adress', 'Adresa Facturare'),
(175, 'RO', 'billing_adresses', 'Adrese Facturare'),
(176, 'RO', 'change', 'Modifica'),
(177, 'RO', 'region', 'Raion/Judet'),
(178, 'RO', 'city', 'Oras'),
(179, 'RO', 'postal_code', 'Cod Postal'),
(180, 'RO', 'street', 'Strada'),
(181, 'RO', 'build', 'Cladire'),
(182, 'RO', 'door', 'Usa'),
(183, 'RO', 'change_adress', 'Schimba Adresa'),
(184, 'RO', 'back_to_acc', 'Inapoi la pagina mea'),
(185, 'RO', 'change_pass', 'Modifica Parola'),
(186, 'RO', 'error_login', 'Eroare Logare'),
(187, 'RO', 'pass', 'Parola'),
(188, 'RO', 'old_pass', 'Parola Veche'),
(189, 'RO', 'repeat_pass', 'Repeta Parola'),
(190, 'RO', 'not_set', 'Inca nu e setat'),
(191, 'RO', 'set', 'Seteaza'),
(192, 'RO', 'pass_must_match', 'Parolele trebuie sa coincida!'),
(193, 'RO', 'dont_have_account', 'Daca nu ai account te rog inregistreaza-te!'),
(194, 'RO', 'contact', 'Contact'),
(195, 'RO', 'error', 'Ceva nu a mers dupa planul nostru!..'),
(196, 'RO', 'complete_right', 'Trebuie sa completezi corect toate campurile!'),
(197, 'RO', 'star_obligatory', '(Cumpurile cu * sunt obligatorii)'),
(198, 'RO', 'yes', 'Da'),
(199, 'RO', 'no', 'Nu'),
(200, 'RO', '4', 'Quad'),
(201, 'RO', '2', 'Dual'),
(202, 'RO', '8', 'Octa'),
(203, 'RO', '8', 'Octa'),
(204, 'RO', 'Card_reader Cititor de Carduri', NULL),
(205, 'RO', 'Num_pad', 'Tastatura Numerica'),
(206, 'RO', 'Microfon', 'Microfon'),
(207, 'RO', 'Camera', 'Camera'),
(208, 'RO', 'Audio', 'Audio'),
(209, 'RO', 'DVD', 'DVD'),
(210, 'RO', 'RJ_45', 'RJ 47'),
(211, 'RO', 'VGA', 'VGA'),
(212, 'RO', 'HDMI', 'HDMI'),
(213, 'RO', 'USB3_0', 'USB 3.0'),
(214, 'RO', 'USB2_0', 'USB 2.0'),
(215, 'RO', 'Wifi', 'Wifi'),
(216, 'RO', 'Bluetooth', 'Bluetooth'),
(217, 'RO', 'Price', 'Pret'),
(218, 'RO', 'Cover', 'Coperta'),
(219, 'RO', 'Capacitate_Video', 'Capacitate Video'),
(220, 'RO', 'Video', 'Video'),
(221, 'RO', 'Tip_capacitate', 'Tip Capacite'),
(222, 'RO', 'Capacitate', 'Capacite'),
(223, 'RO', 'RAM', 'RAM'),
(224, 'RO', 'Greutate', 'Greutate'),
(225, 'RO', 'Dimensiune', 'Dimensiune'),
(226, 'RO', 'Sistem_Operare', 'Sistem de operare'),
(227, 'RO', 'Alimentare', 'Alimentare'),
(228, 'RO', 'Diagonala', 'Diagonala'),
(229, 'RO', 'Rezolutie', 'Rezolutie'),
(230, 'RO', 'Display', 'Ecran'),
(231, 'RO', 'Tip_Procesor', 'Tip Procesor'),
(232, 'RO', 'Frecventa', 'Frecventa'),
(233, 'RO', 'Nuclee', 'Nuclee'),
(234, 'RO', 'Model_Procesor', 'Model Procesor'),
(235, 'RO', 'Procesor', 'Procesor'),
(236, 'RO', 'Culoare', 'Culoare'),
(237, 'RO', 'Serie', 'Serie'),
(238, 'RO', 'Model', 'Model'),
(239, 'RO', 'Firma', 'Firma'),
(240, 'RO', 'Tastatura', 'Tastatura'),
(241, 'RO', '2G', '2G'),
(242, 'RO', '3G', '3G'),
(243, 'RO', '4G', '4G'),
(244, 'RO', 'SIM', 'SIM'),
(245, 'RO', 'SIM_Slots', 'Sloturi Sim'),
(246, 'RO', 'GPS', 'GPS'),
(247, 'RO', 'Rezolutie_Display', 'Rezolutie Ecran'),
(248, 'RO', 'TouchScreen', 'Ecran Tactil'),
(249, 'RO', 'Tehnologie_Display', 'Tehnologie Ecran'),
(250, 'RO', 'Culori_K', 'Colori K'),
(251, 'RO', 'SlotMemorie', 'Slot Memorie'),
(252, 'RO', 'SlotMemorie_Limit', 'Limita Slot Memorie'),
(253, 'RO', 'Memorie', 'Memorie'),
(254, 'RO', 'GPRS', 'GPRS'),
(255, 'RO', 'NFC', 'NFC'),
(256, 'RO', 'USB', 'USB'),
(257, 'RO', 'Audio_Jack', 'Audio Jack'),
(258, 'RO', 'Camera', 'Camera'),
(259, 'RO', 'Rezoltie_Camera', 'Rezolutie Camera'),
(260, 'RO', 'Rezolutie_Foto', 'Rezolutie Poze'),
(261, 'RO', 'Rezolutie_Video', 'Rezolutie Video'),
(262, 'RO', 'Blitz', 'Blitz'),
(263, 'RO', 'Camera_Frontala', 'Camera Frontala'),
(264, 'RO', 'Blitz_Frontal', 'Blitz Frontal'),
(265, 'RO', 'Sensor_Frontal', 'Sensor Frontal'),
(266, 'RO', 'Baterie', 'Baterie'),
(267, 'RO', 'Capacitate_Baterie', 'Capacitate Baterie'),
(268, 'RO', 'Producator_Chipset', 'Producator Chipset'),
(269, 'RO', 'Serie_Chipset', 'Serie Chipset'),
(270, 'RO', 'Model_Chipset', 'Model Chipset'),
(271, 'RO', 'FingerPrint', 'Amprenta Digitala'),
(272, 'RO', 'Radio', 'Radio'),
(273, 'RO', 'MultiTouch', 'Atingera multipla'),
(274, 'EN', 'popularity', 'Popularity'),
(275, 'EN', 'rating', 'Rating'),
(276, 'EN', 'lower_up', 'Lower > Upper'),
(277, 'EN', 'upper_low', 'Upper > Lower'),
(278, 'EN', 'name', 'Name'),
(279, 'RO', 'popularity', 'Popularitate'),
(280, 'RO', 'rating', 'Rating'),
(281, 'RO', 'lower_up', 'Mic > Mare'),
(282, 'RO', 'upper_low', 'Mare > Mic'),
(283, 'RO', 'name', 'Nume'),
(284, 'EN', 'az', 'A-Z'),
(285, 'EN', 'za', 'Z-A'),
(286, 'RO', 'az', 'A-Z'),
(287, 'RO', 'za', 'Z-A'),
(288, 'EN', 'sort', 'Sort'),
(289, 'RO', 'sort', 'Sortare'),
(290, 'EN', 'Chipset', 'Chipset'),
(291, 'RO', 'Chipset', 'Chipset'),
(292, 'EN', 'filter', 'Filter'),
(293, 'RO', 'filter', 'Filtrare'),
(294, 'RO', 'top_sale', 'Top Vinzari'),
(295, 'EN', 'top_sale', 'Top Sales'),
(296, 'EN', 'notebooks', 'Notebooks'),
(297, 'EN', 'phones', 'Phones'),
(298, 'RO', 'notebooks', 'Laptopuri'),
(299, 'RO', 'phones', 'Telefoane'),
(300, 'RO', 'en', 'Engleza'),
(301, 'RO', 'ro', 'Romana'),
(302, 'RO', 'ru', 'Rusa'),
(303, 'EN', 'en', 'English'),
(304, 'EN', 'ro', 'Romanian'),
(305, 'EN', 'ru', 'Russian'),
(306, 'EN', 'registration', 'Registration'),
(307, 'RO', 'registration', 'Inregistrare'),
(308, 'RO', 'repeat_email', 'Repeta Adresa Email'),
(309, 'EN', 'repeat_email', 'Repeat Email Adress'),
(310, 'EN', 'sign_up_news', 'Signg up for our newsletter'),
(311, 'RO', 'sign_up_news', 'Aboneazate la noutatile noastre'),
(312, 'RO', 'send_notif', 'Trimite notificari la acest email'),
(313, 'EN', 'send_notif', 'Send notifications to this email'),
(314, 'EN', 'rules', 'Rules'),
(315, 'RO', 'rules', 'Reguli'),
(316, 'EN', 'rule1', 'Usernames may contain only digits, upper and lowercase letters and underscores'),
(317, 'EN', 'rule2', 'Emails must have a valid email format'),
(318, 'EN', 'rule3', 'Passwords must be at least 6 characters long'),
(319, 'EN', 'rule4', 'Passwords must contain'),
(320, 'EN', 'rule5', 'At least one uppercase letter (A..Z)'),
(321, 'EN', 'rule6', 'At least one lowercase letter (a..z)'),
(322, 'EN', 'rule7', 'At least one number (0..9)'),
(323, 'EN', 'rule8', 'Your password and confirmation must match exactly'),
(324, 'EN', 'back_to_login', 'Return to login Page.'),
(325, 'RO', 'rule1', 'Numele de utilizator poate contine doar cifre, litere mici si mari si subliniere.'),
(326, 'RO', 'rule2', 'Emailul trebuie sa contina un format valid!'),
(327, 'RO', 'rule3', 'Parola trebuie sa fie de cel putin 6 caractere lungime!'),
(328, 'RO', 'rule4', 'Parola trebuie sa contina'),
(329, 'RO', 'rule5', 'Cel putin o litera mare (A..Z)'),
(330, 'RO', 'rule6', 'Cel putin o litera mica(a..z)'),
(331, 'RO', 'rule7', 'Cel putin o cifra(0..9)'),
(332, 'RO', 'rule8', 'Parolele trebuie sa coincida!'),
(333, 'RO', 'back_to_login', 'Inapoi la pagina de logare.'),
(334, 'RO', 'email', 'Adresa Email'),
(335, 'EN', 'email', 'Email Adress'),
(336, 'RO', 'search_rule', 'Continutul cautarii trebuie sa contina minim 4 caractere!'),
(337, 'EN', 'search_rule', 'Search string must have at least 4 characters!'),
(338, 'EN', 'nothing_found', 'Nothing Found!'),
(339, 'RO', 'nothing_found', 'Nu am gasit nici un element!'),
(340, 'EN', 'succes_change', 'Data been successful changed!'),
(341, 'RO', 'succes_change', 'Datele au fost modificate cu succes!'),
(342, 'EN', 'product', 'Product'),
(343, 'RO', 'product', 'Product'),
(344, 'EN', 'price', 'Price'),
(345, 'RO', 'price', 'Pret'),
(346, 'EN', 'quantity', 'Quantity'),
(347, 'RO', 'quantity', 'Cantitate'),
(348, 'EN', 'subtotal', 'Subtotal'),
(349, 'RO', 'subtotal', 'Subtotal'),
(350, 'EN', 'total', 'Total'),
(351, 'RO', 'total', 'Total'),
(352, 'EN', 'continue_shopping', 'Continue Shopping'),
(353, 'RO', 'continue_shopping', 'Continua cumparaturile'),
(354, 'EN', 'checkout', 'Checkout'),
(355, 'RO', 'checkout', 'Achita cumparaturile'),
(356, 'EN', 'addToCart', 'Add to Cart'),
(357, 'RO', 'addToCart', 'Adauga in Cos'),
(358, 'EN', 'negativeCartUpdate', 'Item Count cant be negative! Use delete function instead!'),
(359, 'RO', 'negativeCartUpdate', 'Cantitatea de iteme nu poate fi negativa, va rugam sa folositi functia delete pentru a sterge!');

-- --------------------------------------------------------

--
-- Table structure for table `View`
--

CREATE TABLE IF NOT EXISTS `View` (
  `ID` int(11) NOT NULL,
  `members` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `Date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `View`
--

INSERT INTO `View` (`ID`, `members`, `category`, `item`, `Date`) VALUES
(1, 2, 2, 2, '2017-03-27 07:35:34'),
(2, 2, 2, 2, '2017-03-27 07:35:41'),
(3, 2, 2, 2, '2017-03-27 12:54:41'),
(4, 2, 2, 2, '2017-03-27 14:06:25'),
(5, 2, 1, 3, '2017-03-27 14:06:29'),
(6, 2, 1, 1, '2017-03-27 14:11:06'),
(7, 2, 1, 1, '2017-03-27 14:12:12'),
(8, 2, 1, 1, '2017-03-27 14:12:32'),
(9, 2, 1, 1, '2017-03-27 14:16:10'),
(10, 2, 1, 1, '2017-03-27 14:18:01'),
(11, 2, 1, 1, '2017-03-27 14:19:00'),
(12, 2, 1, 1, '2017-03-27 14:20:29'),
(13, 2, 1, 1, '2017-03-27 14:21:04'),
(14, 2, 1, 1, '2017-03-27 14:21:08'),
(15, 2, 1, 1, '2017-03-27 14:21:11'),
(16, 2, 1, 1, '2017-03-27 14:21:20'),
(17, 2, 1, 1, '2017-03-27 14:21:38'),
(18, 2, 1, 1, '2017-03-27 14:21:42'),
(19, 2, 1, 1, '2017-03-27 14:21:49'),
(20, 2, 1, 1, '2017-03-27 14:21:51'),
(21, 2, 1, 1, '2017-03-27 14:21:57'),
(22, 2, 1, 1, '2017-03-27 14:22:03'),
(23, 2, 1, 1, '2017-03-27 14:22:14'),
(24, 2, 1, 1, '2017-03-27 14:22:18'),
(25, 2, 1, 1, '2017-03-27 14:22:37'),
(26, 2, 2, 2, '2017-03-27 14:22:41'),
(27, 2, 2, 2, '2017-03-27 14:23:00'),
(28, 2, 1, 1, '2017-03-27 14:23:02'),
(29, 2, 1, 1, '2017-03-27 14:23:11'),
(30, 2, 1, 1, '2017-03-27 14:23:15'),
(31, 2, 1, 1, '2017-03-28 05:06:16'),
(32, 2, 1, 2, '2017-03-28 05:09:43'),
(33, 2, 1, 2, '2017-03-28 05:11:33'),
(34, 2, 1, 2, '2017-03-28 05:11:51'),
(35, 2, 1, 2, '2017-03-28 05:12:16'),
(36, 2, 1, 2, '2017-03-28 05:12:31'),
(37, 2, 1, 1, '2017-03-28 05:41:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Cart`
--
ALTER TABLE `Cart`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Categorie`
--
ALTER TABLE `Categorie`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Subcategorie`
--
ALTER TABLE `Subcategorie`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `subcat_cat` (`ID_Categorie`);

--
-- Indexes for table `Tip`
--
ALTER TABLE `Tip`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Tip_subcategorie` (`ID_Subcategorie`);

--
-- Indexes for table `Translate`
--
ALTER TABLE `Translate`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `translate` (`KeyWord`) USING BTREE;

--
-- Indexes for table `View`
--
ALTER TABLE `View`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Cart`
--
ALTER TABLE `Cart`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `Categorie`
--
ALTER TABLE `Categorie`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `Subcategorie`
--
ALTER TABLE `Subcategorie`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `Tip`
--
ALTER TABLE `Tip`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=78;
--
-- AUTO_INCREMENT for table `Translate`
--
ALTER TABLE `Translate`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=360;
--
-- AUTO_INCREMENT for table `View`
--
ALTER TABLE `View`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=38;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Subcategorie`
--
ALTER TABLE `Subcategorie`
  ADD CONSTRAINT `subcat_cat` FOREIGN KEY (`ID_Categorie`) REFERENCES `Categorie` (`ID`) ON UPDATE CASCADE;

--
-- Constraints for table `Tip`
--
ALTER TABLE `Tip`
  ADD CONSTRAINT `Tip_subcategorie` FOREIGN KEY (`ID_Subcategorie`) REFERENCES `Subcategorie` (`ID`) ON UPDATE CASCADE;
--
-- Database: `notebook`
--

-- --------------------------------------------------------

--
-- Table structure for table `Alimentare`
--

CREATE TABLE IF NOT EXISTS `Alimentare` (
  `ID` int(11) NOT NULL,
  `Alimentare` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Alimentare`
--

INSERT INTO `Alimentare` (`ID`, `Alimentare`) VALUES
(1, 'Li-Ion'),
(2, 'Lithium'),
(3, 'Li-Pol');

-- --------------------------------------------------------

--
-- Table structure for table `Culoare`
--

CREATE TABLE IF NOT EXISTS `Culoare` (
  `ID` int(11) NOT NULL,
  `Culoare` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Culoare`
--

INSERT INTO `Culoare` (`ID`, `Culoare`) VALUES
(1, 'Black'),
(2, 'White'),
(3, 'Grey'),
(4, 'Gold'),
(5, 'Dark Blue'),
(6, 'Aluminium'),
(7, 'Pink'),
(8, 'Blue');

-- --------------------------------------------------------

--
-- Table structure for table `Display`
--

CREATE TABLE IF NOT EXISTS `Display` (
  `ID` int(11) NOT NULL,
  `Display` varchar(255) DEFAULT NULL,
  `Rezolutie` varchar(255) DEFAULT NULL,
  `Diagonala` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Display`
--

INSERT INTO `Display` (`ID`, `Display`, `Rezolutie`, `Diagonala`) VALUES
(1, 'LED', '1366x768', '15.6'),
(2, 'LED', '3840x2160', '15.6'),
(3, 'Retina LED IPS', '2560x1600', '13.3');

-- --------------------------------------------------------

--
-- Table structure for table `Firma`
--

CREATE TABLE IF NOT EXISTS `Firma` (
  `ID` int(11) NOT NULL,
  `Firma` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Firma`
--

INSERT INTO `Firma` (`ID`, `Firma`) VALUES
(1, 'Asus'),
(2, 'Acer'),
(3, 'Lenovo'),
(4, 'HP'),
(5, 'Dell'),
(6, 'Apple');

-- --------------------------------------------------------

--
-- Table structure for table `Model`
--

CREATE TABLE IF NOT EXISTS `Model` (
  `ID` int(11) NOT NULL,
  `Model` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Model`
--

INSERT INTO `Model` (`ID`, `Model`) VALUES
(1, 'Y70'),
(2, 'G50-30'),
(3, 'DM080D'),
(4, '13');

-- --------------------------------------------------------

--
-- Table structure for table `Procesor`
--

CREATE TABLE IF NOT EXISTS `Procesor` (
  `ID` int(11) NOT NULL,
  `Procesor` enum('Intel','Amd') DEFAULT NULL,
  `Model_Procesor` varchar(255) DEFAULT NULL,
  `Nuclee` int(3) DEFAULT NULL,
  `Frecventa` varchar(255) DEFAULT NULL,
  `Tip_procesor` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Procesor`
--

INSERT INTO `Procesor` (`ID`, `Procesor`, `Model_Procesor`, `Nuclee`, `Frecventa`, `Tip_procesor`) VALUES
(1, 'Intel', 'N3530', 4, '2160', 2),
(2, 'Intel', '6500U', 2, '2500', 6),
(3, 'Intel', 'MF839', 2, '2700', 5);

-- --------------------------------------------------------

--
-- Table structure for table `Serie`
--

CREATE TABLE IF NOT EXISTS `Serie` (
  `ID` int(11) NOT NULL,
  `Serie` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Serie`
--

INSERT INTO `Serie` (`ID`, `Serie`) VALUES
(1, 'ROG'),
(2, 'IdeaPad'),
(3, 'K501UX'),
(4, 'MacBook '),
(5, 'MacBook Pro');

-- --------------------------------------------------------

--
-- Table structure for table `Sistem_Operare`
--

CREATE TABLE IF NOT EXISTS `Sistem_Operare` (
  `ID` int(11) NOT NULL,
  `Sistem_Operare` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Sistem_Operare`
--

INSERT INTO `Sistem_Operare` (`ID`, `Sistem_Operare`) VALUES
(1, 'Free-DOS'),
(2, 'Windows'),
(3, 'Linux'),
(4, 'Ubuntu'),
(5, 'MacOS');

-- --------------------------------------------------------

--
-- Table structure for table `Tip_Procesor`
--

CREATE TABLE IF NOT EXISTS `Tip_Procesor` (
  `ID` int(11) NOT NULL,
  `Tip_Procesor` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Tip_Procesor`
--

INSERT INTO `Tip_Procesor` (`ID`, `Tip_Procesor`) VALUES
(1, 'Dual Core'),
(2, 'Quad Core'),
(3, 'Octa Core'),
(4, 'i3'),
(5, 'i5'),
(6, 'i7');

-- --------------------------------------------------------

--
-- Table structure for table `notebook`
--

CREATE TABLE IF NOT EXISTS `notebook` (
  `ID` int(11) NOT NULL,
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
  `Sale` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notebook`
--

INSERT INTO `notebook` (`ID`, `ID_Firma`, `ID_Serie`, `ID_Model`, `ID_Culoare`, `Dimensiune`, `Greutate`, `ID_Procesor`, `ID_Display`, `Ram`, `Capacitate`, `Tip_capacitate`, `Video`, `Capacitate_Video`, `Bluetooth`, `Wifi`, `USB2_0`, `USB3_0`, `HDMI`, `VGA`, `RJ_45`, `ID_Alimentare`, `Audio`, `DVD`, `Camera`, `Microfon`, `Card_reader`, `Num_pad`, `ID_Sistem_Operare`, `Cover`, `Price`, `Sale`) VALUES
(1, 3, 2, 2, 1, '384x265x25', 2500, 1, 1, 4, '500', 'HDD', 'Integrata', '1024', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 'HD', 1, 1, 1, 1, 'img/notebook/1.jpg', 5000.00, NULL),
(2, 1, 3, 3, 3, '382x255x21.7', 2000, 2, 2, 4, '1000', 'HDD', 'Integrata', '2048', 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 'HD', 1, 0, 1, 1, 'img/notebook/2.jpg', 20990.00, NULL),
(3, 6, 5, 4, 6, '314x219x18', 1580, 3, 3, 8, '128', 'SSD', 'Integrata', '1024', 1, 1, 0, 1, 1, 1, 0, 3, 1, 1, 'FaceTime HD 720p', 1, 1, 0, 5, 'img/notebook/3.jpg', 27490.00, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Alimentare`
--
ALTER TABLE `Alimentare`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Culoare`
--
ALTER TABLE `Culoare`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Display`
--
ALTER TABLE `Display`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Firma`
--
ALTER TABLE `Firma`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Model`
--
ALTER TABLE `Model`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Procesor`
--
ALTER TABLE `Procesor`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `tip_procesor` (`Tip_procesor`);

--
-- Indexes for table `Serie`
--
ALTER TABLE `Serie`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Sistem_Operare`
--
ALTER TABLE `Sistem_Operare`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Tip_Procesor`
--
ALTER TABLE `Tip_Procesor`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `notebook`
--
ALTER TABLE `notebook`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `firma` (`ID_Firma`),
  ADD KEY `serie` (`ID_Serie`),
  ADD KEY `model` (`ID_Model`),
  ADD KEY `culoare` (`ID_Culoare`),
  ADD KEY `procesor` (`ID_Procesor`),
  ADD KEY `display` (`ID_Display`),
  ADD KEY `alimentare` (`ID_Alimentare`),
  ADD KEY `sistem_operare` (`ID_Sistem_Operare`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Alimentare`
--
ALTER TABLE `Alimentare`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `Culoare`
--
ALTER TABLE `Culoare`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `Display`
--
ALTER TABLE `Display`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `Firma`
--
ALTER TABLE `Firma`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `Model`
--
ALTER TABLE `Model`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `Procesor`
--
ALTER TABLE `Procesor`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `Serie`
--
ALTER TABLE `Serie`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `Sistem_Operare`
--
ALTER TABLE `Sistem_Operare`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `Tip_Procesor`
--
ALTER TABLE `Tip_Procesor`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `notebook`
--
ALTER TABLE `notebook`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Procesor`
--
ALTER TABLE `Procesor`
  ADD CONSTRAINT `tip_procesor` FOREIGN KEY (`Tip_procesor`) REFERENCES `Tip_Procesor` (`ID`) ON UPDATE CASCADE;

--
-- Constraints for table `notebook`
--
ALTER TABLE `notebook`
  ADD CONSTRAINT `alimentare` FOREIGN KEY (`ID_Alimentare`) REFERENCES `Alimentare` (`ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `culoare` FOREIGN KEY (`ID_Culoare`) REFERENCES `Culoare` (`ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `display` FOREIGN KEY (`ID_Display`) REFERENCES `Display` (`ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `firma` FOREIGN KEY (`ID_Firma`) REFERENCES `Firma` (`ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `model` FOREIGN KEY (`ID_Model`) REFERENCES `Model` (`ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `procesor` FOREIGN KEY (`ID_Procesor`) REFERENCES `Procesor` (`ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `serie` FOREIGN KEY (`ID_Serie`) REFERENCES `Serie` (`ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `sistem_operare` FOREIGN KEY (`ID_Sistem_Operare`) REFERENCES `Sistem_Operare` (`ID`) ON UPDATE CASCADE;
--
-- Database: `phone`
--

-- --------------------------------------------------------

--
-- Table structure for table `Altele`
--

CREATE TABLE IF NOT EXISTS `Altele` (
  `ID` int(11) NOT NULL,
  `ID_Phone` int(11) DEFAULT NULL,
  `Element` varchar(255) DEFAULT NULL,
  `Continut` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Altele`
--

INSERT INTO `Altele` (`ID`, `ID_Phone`, `Element`, `Continut`) VALUES
(1, 1, 'Browser', 'HTML5'),
(2, 1, 'Sensori', 'Accelerometru, proximitate'),
(3, 1, 'Organizer', '	Ceas cu alarm?, calculator, planificator');

-- --------------------------------------------------------

--
-- Table structure for table `Baterie`
--

CREATE TABLE IF NOT EXISTS `Baterie` (
  `ID` int(11) NOT NULL,
  `Baterie` varchar(255) DEFAULT NULL,
  `Capacitate` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Baterie`
--

INSERT INTO `Baterie` (`ID`, `Baterie`, `Capacitate`) VALUES
(1, 'Li-Ion', 3100);

-- --------------------------------------------------------

--
-- Table structure for table `Camera`
--

CREATE TABLE IF NOT EXISTS `Camera` (
  `ID` int(11) NOT NULL,
  `Camera` tinyint(1) DEFAULT NULL,
  `Rezolutie_Sensor` int(3) DEFAULT NULL,
  `Rezolutie_Foto` varchar(11) DEFAULT NULL,
  `Rezolutie_Video` varchar(11) DEFAULT NULL,
  `Blitz` tinyint(1) DEFAULT NULL,
  `Camera_Frontala` tinyint(1) DEFAULT NULL,
  `Blitz_Frontal` tinyint(1) DEFAULT NULL,
  `Sensor_Frontal` varchar(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Camera`
--

INSERT INTO `Camera` (`ID`, `Camera`, `Rezolutie_Sensor`, `Rezolutie_Foto`, `Rezolutie_Video`, `Blitz`, `Camera_Frontala`, `Blitz_Frontal`, `Sensor_Frontal`) VALUES
(1, 1, 13, '4128x3096', '1920x1080', 1, 1, 0, '5');

-- --------------------------------------------------------

--
-- Table structure for table `Culoare`
--

CREATE TABLE IF NOT EXISTS `Culoare` (
  `ID` int(11) NOT NULL,
  `Culoare` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Culoare`
--

INSERT INTO `Culoare` (`ID`, `Culoare`) VALUES
(1, 'Black'),
(2, 'White'),
(3, 'Grey'),
(4, 'Gold'),
(5, 'Dark Blue'),
(6, 'Aluminium');

-- --------------------------------------------------------

--
-- Table structure for table `Display`
--

CREATE TABLE IF NOT EXISTS `Display` (
  `ID` int(11) NOT NULL,
  `Rezolutie` varchar(255) DEFAULT NULL,
  `Tehnologie` varchar(255) DEFAULT NULL,
  `TouchScreen` tinyint(1) DEFAULT '1',
  `Culori_K` int(11) DEFAULT NULL,
  `Diagonala` varchar(10) DEFAULT NULL,
  `Multitouch` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Display`
--

INSERT INTO `Display` (`ID`, `Rezolutie`, `Tehnologie`, `TouchScreen`, `Culori_K`, `Diagonala`, `Multitouch`) VALUES
(1, '1280x720', 'Super AMOLED', 1, 16000, '5.2', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Firma`
--

CREATE TABLE IF NOT EXISTS `Firma` (
  `ID` int(11) NOT NULL,
  `Firma` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Firma`
--

INSERT INTO `Firma` (`ID`, `Firma`) VALUES
(1, 'Samsung'),
(2, 'Xiaomi'),
(3, 'HTC'),
(4, 'Asus'),
(5, 'ZTE'),
(6, 'LeEco'),
(7, 'Huawei');

-- --------------------------------------------------------

--
-- Table structure for table `Model`
--

CREATE TABLE IF NOT EXISTS `Model` (
  `ID` int(11) NOT NULL,
  `Model` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Model`
--

INSERT INTO `Model` (`ID`, `Model`) VALUES
(1, 'J510H'),
(2, 'J510S'),
(3, 'GJ501');

-- --------------------------------------------------------

--
-- Table structure for table `Model_Chipset`
--

CREATE TABLE IF NOT EXISTS `Model_Chipset` (
  `ID` int(11) NOT NULL,
  `Model_Chipset` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Model_Chipset`
--

INSERT INTO `Model_Chipset` (`ID`, `Model_Chipset`) VALUES
(1, 'Snapdragon 410');

-- --------------------------------------------------------

--
-- Table structure for table `Producator_Chipset`
--

CREATE TABLE IF NOT EXISTS `Producator_Chipset` (
  `ID` int(11) NOT NULL,
  `Producator` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Producator_Chipset`
--

INSERT INTO `Producator_Chipset` (`ID`, `Producator`) VALUES
(1, 'Qualcomm '),
(2, 'Altu');

-- --------------------------------------------------------

--
-- Table structure for table `Serie`
--

CREATE TABLE IF NOT EXISTS `Serie` (
  `ID` int(11) NOT NULL,
  `Serie` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Serie`
--

INSERT INTO `Serie` (`ID`, `Serie`) VALUES
(1, 'J'),
(2, 'Mi'),
(3, 'Mix'),
(4, 'Honor'),
(5, 'Galaxy');

-- --------------------------------------------------------

--
-- Table structure for table `Serie_Chipset`
--

CREATE TABLE IF NOT EXISTS `Serie_Chipset` (
  `ID` int(11) NOT NULL,
  `Serie_Chipset` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Serie_Chipset`
--

INSERT INTO `Serie_Chipset` (`ID`, `Serie_Chipset`) VALUES
(1, 'MSM8916');

-- --------------------------------------------------------

--
-- Table structure for table `Sistem_Operare`
--

CREATE TABLE IF NOT EXISTS `Sistem_Operare` (
  `ID` int(11) NOT NULL,
  `Sistem_Operare` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Sistem_Operare`
--

INSERT INTO `Sistem_Operare` (`ID`, `Sistem_Operare`) VALUES
(1, 'Android'),
(2, 'Windows');

-- --------------------------------------------------------

--
-- Table structure for table `phone`
--

CREATE TABLE IF NOT EXISTS `phone` (
  `ID` int(11) NOT NULL,
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
  `Cover` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `phone`
--

INSERT INTO `phone` (`ID`, `ID_Firma`, `ID_Serie`, `ID_Model`, `ID_Culoare`, `Tastatura`, `Greutate`, `Dimensiune`, `2G`, `3G`, `4G`, `SIM`, `SIM_Slots`, `ID_Sistem_Operare`, `GPS`, `ID_Display`, `Slot_Memorie`, `Slot_Memorie_Limit`, `Memorie`, `RAM`, `GPRS`, `Bluetooth`, `WIFI`, `NFC`, `USB`, `AudioJack`, `ID_Camera`, `ID_Baterie`, `Radio`, `ID_Producator_Chipset`, `ID_Serie_Chipset`, `ID_Model_Chipset`, `FingerPrint`, `Price`, `Cover`) VALUES
(2, 1, 5, 3, 1, 'Virtuala', 159, '145.8x72.3x8.1', '850,900,1800,1900', '850,900,1900,2100', 'LTE', 'Nano-SIM', 2, 1, 1, 1, 1, 128, 16, 2, 1, 1, 1, 1, 'Micro0USB', 1, 1, 1, 1, 1, 1, 1, 0, 3200.00, 'img/phone/1.jpg'),
(3, 1, 1, 2, 1, 'Virtuala', 159, '145.8x72.3x8.1', '850,900,1800,1900', '850,900,1900,2100', 'LTE', 'Nano-SIM', 2, 1, 1, 1, 1, 128, 16, 2, 1, 1, 1, 1, 'Micro0USB', 1, 1, 1, 1, 1, 1, 1, 0, 5900.00, 'img/phone/2.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Altele`
--
ALTER TABLE `Altele`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Baterie`
--
ALTER TABLE `Baterie`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Camera`
--
ALTER TABLE `Camera`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Culoare`
--
ALTER TABLE `Culoare`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Display`
--
ALTER TABLE `Display`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Firma`
--
ALTER TABLE `Firma`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Model`
--
ALTER TABLE `Model`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Model_Chipset`
--
ALTER TABLE `Model_Chipset`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Producator_Chipset`
--
ALTER TABLE `Producator_Chipset`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Serie`
--
ALTER TABLE `Serie`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Serie_Chipset`
--
ALTER TABLE `Serie_Chipset`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Sistem_Operare`
--
ALTER TABLE `Sistem_Operare`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `phone`
--
ALTER TABLE `phone`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `firma` (`ID_Firma`),
  ADD KEY `serie` (`ID_Serie`),
  ADD KEY `model` (`ID_Model`),
  ADD KEY `culoare` (`ID_Culoare`),
  ADD KEY `sistem_operare` (`ID_Sistem_Operare`),
  ADD KEY `camera` (`ID_Camera`),
  ADD KEY `baterie` (`ID_Baterie`),
  ADD KEY `display` (`ID_Display`),
  ADD KEY `Model_chipset` (`ID_Model_Chipset`),
  ADD KEY `Producator_chipset` (`ID_Producator_Chipset`),
  ADD KEY `Serie_chipset` (`ID_Serie_Chipset`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Altele`
--
ALTER TABLE `Altele`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `Baterie`
--
ALTER TABLE `Baterie`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `Camera`
--
ALTER TABLE `Camera`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `Culoare`
--
ALTER TABLE `Culoare`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `Display`
--
ALTER TABLE `Display`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `Firma`
--
ALTER TABLE `Firma`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `Model`
--
ALTER TABLE `Model`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `Model_Chipset`
--
ALTER TABLE `Model_Chipset`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `Producator_Chipset`
--
ALTER TABLE `Producator_Chipset`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `Serie`
--
ALTER TABLE `Serie`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `Serie_Chipset`
--
ALTER TABLE `Serie_Chipset`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `Sistem_Operare`
--
ALTER TABLE `Sistem_Operare`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `phone`
--
ALTER TABLE `phone`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `phone`
--
ALTER TABLE `phone`
  ADD CONSTRAINT `Model_chipset` FOREIGN KEY (`ID_Model_Chipset`) REFERENCES `Model_Chipset` (`ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Producator_chipset` FOREIGN KEY (`ID_Producator_Chipset`) REFERENCES `Producator_Chipset` (`ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Serie_chipset` FOREIGN KEY (`ID_Serie_Chipset`) REFERENCES `Serie_Chipset` (`ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `baterie` FOREIGN KEY (`ID_Baterie`) REFERENCES `Baterie` (`ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `camera` FOREIGN KEY (`ID_Camera`) REFERENCES `Camera` (`ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `culoare` FOREIGN KEY (`ID_Culoare`) REFERENCES `Culoare` (`ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `display` FOREIGN KEY (`ID_Display`) REFERENCES `Display` (`ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `firma` FOREIGN KEY (`ID_Firma`) REFERENCES `Firma` (`ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `model` FOREIGN KEY (`ID_Model`) REFERENCES `Model` (`ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `serie` FOREIGN KEY (`ID_Serie`) REFERENCES `Serie` (`ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `sistem_operare` FOREIGN KEY (`ID_Sistem_Operare`) REFERENCES `Sistem_Operare` (`ID`) ON UPDATE CASCADE;
--
-- Database: `secure_login`
--

-- --------------------------------------------------------

--
-- Table structure for table `Adress`
--

CREATE TABLE IF NOT EXISTS `Adress` (
  `ID` int(11) NOT NULL,
  `Region` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `PostalCode` varchar(255) DEFAULT NULL,
  `Fax` varchar(255) DEFAULT NULL,
  `DoorID` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Adress`
--

INSERT INTO `Adress` (`ID`, `Region`, `City`, `PostalCode`, `Fax`, `DoorID`) VALUES
(1, 'Chisinau', 'Chisinau', '2068', '+373912313', 1),
(2, 'Chisinau', 'Chisinau', '2067', '+373912312', 28),
(13, 'Chisinau', 'Chisinau', '2061', '+373912312', 24),
(14, 'Chisinau', 'Chisinau', '2065', '', 26),
(15, 'Chisinau', 'Chisinau', '2063', '+373912312', 24),
(16, 'Chisinau', 'Chisinau', '2071', '+373912312', 24),
(17, 'Chisinau', 'Chisinau', '2087', '+31321231', 27),
(18, '', '', '', '', 30);

-- --------------------------------------------------------

--
-- Table structure for table `Door`
--

CREATE TABLE IF NOT EXISTS `Door` (
  `ID` int(11) NOT NULL,
  `Street` varchar(255) DEFAULT NULL,
  `Build` varchar(255) DEFAULT NULL,
  `Door` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Door`
--

INSERT INTO `Door` (`ID`, `Street`, `Build`, `Door`) VALUES
(1, 'Florilor', '12/3', '33'),
(2, 'Miron Costin', '15', '10'),
(21, 'Florilor', '12/3', '332'),
(22, 'Florilor', '12/3', '31'),
(23, 'Decebal', '1', '10'),
(24, 'Miron Costin', '12', '10'),
(25, 'Florilor', '13/3', '33'),
(26, 'Decebal', '5', '7'),
(27, 'Sarmisegetusa', '75', '1'),
(28, 'Florilor', '13/3', '32'),
(29, NULL, NULL, NULL),
(30, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE IF NOT EXISTS `login_attempts` (
  `user_id` int(11) NOT NULL,
  `time` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login_attempts`
--

INSERT INTO `login_attempts` (`user_id`, `time`) VALUES
(2, '1480964773'),
(2, '1480964924'),
(2, '1490273378'),
(2, '1490273384'),
(2, '1490627359'),
(2, '1490678337'),
(2, '1490678349'),
(2, '1490678353'),
(2, '1490678388'),
(3, '1490678621'),
(2, '1490695535');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE IF NOT EXISTS `members` (
  `id` int(11) NOT NULL,
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
  `DateEntered` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `username`, `email`, `password`, `salt`, `access`, `FirstName`, `LastName`, `Phone`, `Language`, `Adress1`, `Adress2`, `CreditCard`, `CreditCardTypeID`, `CreditCardMO`, `CreditCardYr`, `BillingAdress1`, `BillingAdress2`, `DateEntered`) VALUES
(2, 'zaruba', 'grigore997@gmail.com', '8b5e2c98eca35f9b522418e8e942da95dbe592e2648aa730b75417e42a4abd9ceb3a0be758dc89874e6cc4093f95476b172bd48e45f4ac628252f17856946009', 'ace6de9dfd111abdf185768bb08b900a2442b0fa8dcd7e8ba9bb590c1a824a0f979990021e98665dccf4c003fa89515da2cc72ee51878a7f3058b158b43f32db', 9, 'Grigore', 'Meleca', NULL, 'EN', 2, 14, NULL, NULL, NULL, NULL, 13, 17, '2017-03-23 17:08:56');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Adress`
--
ALTER TABLE `Adress`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Adrees_door` (`DoorID`);

--
-- Indexes for table `Door`
--
ALTER TABLE `Door`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Adress1_adress` (`Adress1`),
  ADD KEY `Adress2_adress` (`Adress2`),
  ADD KEY `Billing1_adress` (`BillingAdress1`),
  ADD KEY `Billing2_adress` (`BillingAdress2`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Adress`
--
ALTER TABLE `Adress`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `Door`
--
ALTER TABLE `Door`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Adress`
--
ALTER TABLE `Adress`
  ADD CONSTRAINT `Adrees_door` FOREIGN KEY (`DoorID`) REFERENCES `Door` (`ID`) ON UPDATE CASCADE;

--
-- Constraints for table `members`
--
ALTER TABLE `members`
  ADD CONSTRAINT `Adress1_adress` FOREIGN KEY (`Adress1`) REFERENCES `Adress` (`ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Adress2_adress` FOREIGN KEY (`Adress2`) REFERENCES `Adress` (`ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Billing1_adress` FOREIGN KEY (`BillingAdress1`) REFERENCES `Adress` (`ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Billing2_adress` FOREIGN KEY (`BillingAdress2`) REFERENCES `Adress` (`ID`) ON UPDATE CASCADE;
--
-- Database: `test`
--

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
