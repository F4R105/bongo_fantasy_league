-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 25, 2025 at 10:44 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bongo_fantasy_league`
--

-- --------------------------------------------------------

--
-- Table structure for table `fantasy_players`
--

CREATE TABLE `fantasy_players` (
  `fantasy_team` int(11) NOT NULL,
  `player` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fantasy_players`
--

INSERT INTO `fantasy_players` (`fantasy_team`, `player`) VALUES
(6, 272),
(7, 72),
(7, 275),
(7, 297);

-- --------------------------------------------------------

--
-- Table structure for table `fantasy_teams`
--

CREATE TABLE `fantasy_teams` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `user` int(11) NOT NULL,
  `bank` int(11) NOT NULL DEFAULT 100
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fantasy_teams`
--

INSERT INTO `fantasy_teams` (`id`, `name`, `user`, `bank`) VALUES
(6, 'azfar', 2, 100),
(7, 'jupiter', 5, 100);

-- --------------------------------------------------------

--
-- Table structure for table `gameweek`
--

CREATE TABLE `gameweek` (
  `id` int(11) NOT NULL,
  `name` int(11) NOT NULL,
  `start` timestamp NULL DEFAULT NULL,
  `end` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gameweek`
--

INSERT INTO `gameweek` (`id`, `name`, `start`, `end`) VALUES
(1, 1, NULL, NULL),
(2, 2, NULL, NULL),
(3, 3, NULL, NULL),
(4, 4, NULL, NULL),
(5, 5, NULL, NULL),
(6, 6, NULL, NULL),
(7, 7, NULL, NULL),
(8, 8, NULL, NULL),
(9, 9, NULL, NULL),
(10, 10, NULL, NULL),
(11, 11, NULL, NULL),
(12, 12, NULL, NULL),
(13, 13, NULL, NULL),
(14, 14, NULL, NULL),
(15, 15, NULL, NULL),
(16, 16, NULL, NULL),
(17, 17, NULL, NULL),
(18, 18, NULL, NULL),
(19, 19, NULL, NULL),
(20, 20, NULL, NULL),
(21, 21, NULL, NULL),
(22, 22, NULL, NULL),
(23, 23, NULL, NULL),
(24, 24, NULL, NULL),
(25, 25, NULL, NULL),
(26, 26, NULL, NULL),
(27, 27, NULL, NULL),
(28, 28, NULL, NULL),
(29, 29, NULL, NULL),
(30, 30, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) NOT NULL,
  `jersey` int(2) NOT NULL,
  `team` int(11) NOT NULL,
  `cost` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`id`, `first_name`, `last_name`, `jersey`, `team`, `cost`) VALUES
(1, 'Mohammed', 'Mustafa', 16, 3, 14),
(2, 'Lusajo', 'Mwaikenda', 5, 3, 8),
(3, 'James', 'Akaminko', 2, 3, 8),
(4, 'Pascal', 'Msindo', 12, 3, 14),
(5, 'Feisal', 'Salum', 6, 3, 15),
(6, 'Ever', 'Meza', 22, 3, 9),
(7, 'Gibril', 'Sillah', 19, 3, 6),
(8, 'Iddy', 'Seleman', 23, 3, 12),
(9, 'Adolf', 'Bitegeko', 26, 3, 4),
(10, 'Yeison', 'Fuentes', 24, 3, 14),
(11, 'Nassor', 'Saadun', 29, 3, 6),
(12, 'Mamadou', 'Samake', 8, 3, 8),
(13, 'Alasane', 'Diao', 11, 3, 6),
(14, 'Sospeter', 'Bajana', 17, 3, 4),
(15, 'Cheikh', 'Sidibe', 22, 3, 10),
(16, 'Zuberi', 'Masud', 28, 3, 11),
(17, 'Ally', 'Ally', 40, 3, 9),
(18, 'Jhonier', 'Blanco', 15, 3, 10),
(19, 'Cheickna', 'Diakite', 18, 3, 6),
(20, 'Yahya', 'Zaid', 21, 3, 10),
(21, 'Ashraf', 'Kibeku', 52, 3, 15),
(22, 'Yakoub', 'Suleiman', 18, 6, 6),
(42, 'Salum', 'Salum', 29, 6, 4),
(43, 'Abdulrahim', 'Seif', 43, 6, 13),
(44, 'Said', 'Hamis', 8, 6, 10),
(45, 'Brayson', 'David', 12, 6, 11),
(46, 'Hassan', 'Kapalata', 4, 6, 7),
(47, 'Najim', 'Maguru', 13, 6, 13),
(48, 'Edson', 'Kataga', 20, 6, 4),
(49, 'Edward', 'Songo', 10, 6, 14),
(50, 'Shiza', 'Ramadhani', 25, 6, 4),
(51, 'Hassan', 'Nassor', 31, 6, 10),
(52, 'Issa', 'Dau', 11, 6, 14),
(53, 'Karimu', 'Mfaume', 2, 6, 10),
(54, 'John', 'Bocco', 9, 6, 6),
(55, 'Richard', 'Maranya', 16, 6, 7),
(56, 'Liu', 'Mdachi', 22, 6, 12),
(57, 'Gamba', 'Matiko', 7, 6, 14),
(58, 'Hassan', 'Dilunga', 24, 6, 7),
(59, 'George', 'Wawa', 26, 6, 11),
(60, 'Omary', 'Gonzo', 30, 6, 9),
(61, 'Chuma', 'Ramadhani', 18, 14, 6),
(62, 'Locas', 'Kikoti', 8, 14, 12),
(63, 'Haroub', 'Abdallah', 21, 14, 15),
(64, 'Mirajy', 'Abdallah', 33, 14, 13),
(65, 'Abdallah', 'Denis', 12, 14, 5),
(66, 'Lameck', 'Lawi', 22, 14, 4),
(67, 'Aidan', 'Alexander', 26, 14, 13),
(68, 'Jeremie', 'Ntambwe', 16, 14, 13),
(69, 'John', 'Makwata', 20, 14, 13),
(70, 'Amara', 'Bakayoko', 30, 14, 11),
(71, 'Semfuko', 'Daudi', 37, 14, 10),
(72, 'Ally', 'Msangi', 5, 14, 15),
(73, 'Kalumba', 'Banza', 34, 14, 5),
(74, 'Bakari', 'Selemani', 19, 14, 11),
(75, 'Maulid', 'Shaban', 7, 14, 12),
(76, 'Salimu', 'Aiyee', 3, 14, 13),
(77, 'Athuman', 'Hassan', 35, 14, 12),
(78, 'Abdallah', 'Hassan', 10, 14, 6),
(79, 'Issa', 'Shaban', 2, 14, 5),
(80, 'Ramadhani', 'Mwenda', 6, 14, 12),
(81, 'Mohamed', 'Hussein', 60, 14, 7),
(82, 'Ismail', 'Mpaki', 18, 13, 6),
(83, 'Rahim', 'Shomary', 48, 13, 8),
(84, 'Salum', 'Salum', 5, 13, 6),
(85, 'Deogratias', 'Kulwa', 24, 13, 14),
(86, 'Redemtus', 'Mussa', 30, 13, 11),
(87, 'Ismail', 'Gambo', 6, 13, 10),
(88, 'Pascal', 'Mussa', 21, 13, 12),
(89, 'Oscar', 'Paulo', 23, 13, 6),
(90, 'Darueshi', 'Saliboko', 7, 13, 12),
(91, 'Ken', 'Ally', 8, 13, 5),
(92, 'Nickson', 'Mosha', 38, 13, 9),
(93, 'Ali', 'Shabani', 14, 13, 13),
(94, 'Junior', 'Naseeb', 26, 13, 9),
(95, 'Juma', 'Shemvuni', 5, 13, 4),
(96, 'Ajoh', 'Noel', 9, 13, 15),
(97, 'Hance', 'Masoud', 3, 13, 11),
(98, 'Fredy', 'Tangalo', 28, 13, 6),
(99, 'Rashid', 'Chambo', 11, 13, 4),
(100, 'Shabani', 'Kimwaga', 45, 13, 13),
(101, 'Akram', 'Mhina', 29, 13, 12),
(102, 'Ahmed', 'Pipino', 46, 13, 4),
(103, 'Augustino', 'Nsata', 26, 12, 7),
(104, 'Ngeleka', 'Katembua', 15, 12, 9),
(105, 'Mwana', 'Kibuta', 14, 12, 6),
(106, 'Salmin ', 'Hoza', 6, 12, 10),
(112, 'Dissan', 'Galiwango', 12, 12, 8),
(113, 'Zidane', 'Sereri', 7, 12, 15),
(114, 'Lulihoshi', 'Heritier', 2, 12, 14),
(115, 'Dickson', 'Mhilu', 20, 12, 9),
(116, 'Ibrahim', 'Migomba', 5, 12, 11),
(117, 'Daudi', 'Milandu', 23, 12, 14),
(118, 'Paul', 'Obata', 30, 12, 11),
(119, 'Yasin', 'Mgaza', 9, 12, 6),
(120, 'Mohamed', 'Hussein', 38, 12, 6),
(121, 'Paul', 'Peter', 51, 12, 10),
(122, 'Fadhii', 'Masoud', 50, 12, 14),
(123, 'Andasony', 'Solomon', 13, 12, 14),
(124, 'Erick', 'Johola', 18, 11, 13),
(125, 'Abdulmalik', 'Zakaria', 29, 11, 8),
(126, 'Ibrahim', 'Ame', 4, 11, 7),
(127, 'Abdulnasir', 'Assa', 7, 11, 9),
(128, 'Ismail', 'Mgunda', 10, 11, 10),
(129, 'Omary', 'Kindamba', 16, 11, 5),
(130, 'Hassan', 'Haji', 14, 11, 4),
(131, 'Mundhir', 'vuai', 17, 11, 14),
(132, 'Ally', 'Iddi', 27, 11, 5),
(133, 'Zuberi', 'Dabi', 24, 11, 4),
(134, 'Emmanuely', 'Mtumbuka', 28, 11, 14),
(135, 'Mohamed', 'Mussa', 19, 11, 5),
(136, 'Yusuf', 'Dunia', 23, 11, 6),
(137, 'Jafari', 'Kibaya', 39, 11, 9),
(138, 'Baraka', 'Mtuwi', 6, 11, 14),
(139, 'Lameck', 'Kanyonga', 35, 11, 14),
(140, 'Peter', 'Moses', 42, 11, 15),
(141, 'Mapinduzi', 'Balama', 17, 11, 14),
(142, 'Crispin', 'Ngushi', 22, 11, 11),
(143, 'Kalos', 'Protus', 25, 11, 11),
(144, 'Ibrahim', 'Abbas', 47, 11, 4),
(147, 'Jonathan', 'Nahimana', 13, 5, 8),
(148, 'Hamis', 'Halifa', 12, 5, 12),
(149, 'Pius', 'Buswita', 3, 5, 11),
(150, 'Najim', 'Mussa', 8, 5, 13),
(151, 'Hassan', 'Kabunda', 17, 5, 7),
(152, 'Hassan', 'Kibailo', 36, 5, 4),
(153, 'Anthony', 'Mlingo', 15, 5, 9),
(154, 'Derick', 'Mukombozi', 2, 5, 4),
(155, 'Geofrey', 'Julius', 26, 5, 14),
(156, 'Erasto', 'Nyoni', 18, 5, 8),
(157, 'Fabrice', 'Ngoy', 29, 5, 5),
(158, 'Miza', 'Krisstom', 2, 5, 8),
(159, 'Amande', 'Momande', 4, 5, 9),
(160, 'Erick', 'Kapaito', 8, 5, 7),
(161, 'Hamis', 'Mgunya', 20, 5, 6),
(162, 'Emmanuel', 'Charles', 36, 5, 15),
(163, 'Kagere', 'Medie', 5, 5, 7),
(164, 'Beno', 'Kakolanya', 48, 5, 9),
(165, 'Hussein', 'Bakari', 62, 5, 8),
(166, 'Ramadhani', 'Chalamanda', 28, 7, 11),
(167, 'Abdallah', 'Mfuko', 5, 7, 13),
(168, 'Datius', 'Peter', 33, 7, 8),
(169, 'David', 'Luhende', 3, 7, 8),
(170, 'Erick', 'Mwijage', 29, 7, 13),
(171, 'Salehe', 'Seif', 12, 7, 13),
(172, 'Mohamed', 'Mussa', 25, 7, 12),
(173, 'Kasimu', 'Feka', 49, 7, 6),
(174, 'Jofrey', 'Manyac', 15, 7, 15),
(175, 'Hija', 'Shamte', 54, 7, 6),
(176, 'Peter', 'Lwasa', 20, 7, 15),
(177, 'Said', 'Kipao', 1, 7, 6),
(178, 'Tariq', 'Seif', 45, 7, 6),
(179, 'Samwel', 'Onditi', 4, 7, 9),
(180, 'Richardson', 'Ng\'ondya', 21, 7, 12),
(181, 'Deogratius', 'Mafie', 14, 7, 6),
(182, 'Cleophace', 'Mkandala', 17, 7, 15),
(183, 'Omary', 'Chibada', 35, 7, 5),
(184, 'Joseph', 'Mahundi', 46, 7, 13),
(185, 'Erick', 'Mambo', 26, 7, 9),
(186, 'Said', 'Noushad', 51, 7, 5),
(187, 'Sebusebu', 'Samson', 31, 16, 5),
(188, 'Doto', 'Shabani', 19, 16, 9),
(189, 'Ezekia', 'Mwashilindi', 2, 16, 12),
(190, 'Samson', 'Mwaituka', 12, 16, 5),
(191, 'Tariq', 'Simba', 23, 16, 9),
(192, 'Wema', 'Sadoki', 46, 16, 5),
(193, 'Michael', 'Ismai', 21, 16, 4),
(194, 'Vedastus', 'Mwihambi', 29, 16, 14),
(195, 'Abdulkarim', 'Segeja', 35, 16, 7),
(196, 'Berno', 'Ngasa', 16, 16, 12),
(197, 'Oscar', 'Mwajanga', 49, 16, 12),
(198, 'Meshack', 'Abrahamu', 47, 16, 9),
(199, 'Selemani', 'Ibrahim', 6, 16, 7),
(200, 'Kelvin', 'Sangati', 60, 16, 13),
(201, 'Ismail', 'Ally', 44, 16, 8),
(202, 'Lambert', 'Sabyanka', 46, 16, 8),
(203, 'Marco', 'Mhilu', 47, 16, 11),
(204, 'Edward', 'Mwakyusa', 50, 16, 6),
(205, 'Jeremiah', 'Juma', 10, 16, 5),
(206, 'Hamis', 'Selemani', 20, 16, 15),
(207, 'Erick', 'Mwambenja', 37, 16, 9),
(208, 'Yona', 'Amosi', 33, 15, 9),
(209, 'Christopher', 'Okoje', 5, 15, 13),
(210, 'Ibrahim', 'Abrahan', 3, 15, 10),
(211, 'Keneth', 'Kunambi', 15, 15, 9),
(212, 'Deus', 'Kaseke', 7, 15, 10),
(213, 'Justine', 'Bilary', 4, 15, 8),
(214, 'Zabona', 'Mayombya', 31, 15, 6),
(215, 'Samuel', 'Antwi', 12, 15, 5),
(216, 'Habibu', 'Kyombo', 11, 15, 13),
(217, 'George', 'Mpole', 10, 15, 12),
(218, 'Hamad', 'Majimengi', 19, 15, 4),
(219, 'Paulin', 'Kasindi', 8, 15, 15),
(220, 'Eric', 'Okutu', 9, 15, 15),
(221, 'Samson', 'Madeleke', 27, 15, 13),
(222, 'Robert', 'Kouyara', 14, 15, 6),
(223, 'Ally', 'Ramadhani', 25, 15, 12),
(224, 'Ibrahim', 'Isihaka', 18, 15, 14),
(225, 'Kassim', 'Hamis', 20, 15, 6),
(226, 'Alain', 'Mukeya', 30, 15, 10),
(227, 'Paul', 'Kamtewe', 38, 15, 15),
(228, 'Mwaita', 'Gereza', 41, 15, 5),
(229, 'Castor', 'Mhagama', 32, 8, 11),
(230, 'Amukena', 'Lubinda', 5, 8, 4),
(231, 'Herbet', 'Lukindo', 11, 8, 6),
(232, 'Hamad', 'Nassoro', 19, 8, 15),
(233, 'George', 'Sangija', 8, 8, 6),
(234, 'Abdallah', 'Masoud', 16, 8, 4),
(235, 'Martin', 'Kazila', 46, 8, 10),
(236, 'Joshua', 'Ibrahim', 67, 8, 12),
(237, 'Bilal', 'Abdi', 33, 8, 15),
(238, 'Mishamo', 'Daudi', 39, 8, 9),
(239, 'Ambokise', 'Mwaipopo', 41, 8, 9),
(240, 'Mussa', 'Mussa', 1, 8, 15),
(241, 'Kevin', 'Simon', 29, 8, 8),
(242, 'Haji', 'Ugando', 10, 8, 4),
(243, 'Faraji', 'Mohamed', 53, 8, 15),
(244, 'Abdallah', 'Juma', 62, 8, 11),
(245, 'Emmanuelly', 'Mpuka', 25, 8, 7),
(246, 'Metacha', 'Mnata', 23, 4, 12),
(247, 'Kennedy', 'Juma', 26, 4, 10),
(248, 'Marouf', 'Tchakei', 10, 4, 10),
(249, 'Emmanuel', 'Kayekeh', 6, 4, 4),
(250, 'Mohamed', 'Camara', 32, 4, 11),
(251, 'Ibrahim', 'Imoro', 19, 4, 5),
(252, 'Iddi', 'Habibu', 4, 4, 10),
(253, 'Ande', 'Koffi', 21, 4, 8),
(254, 'Anthony', 'Tra', 13, 4, 8),
(255, 'Elvis', 'Rupia', 39, 4, 11),
(256, 'Josephat', 'Bada', 60, 4, 14),
(257, 'Adebayor', 'Victorien', 17, 4, 11),
(258, 'Kelvin', 'Nashon', 24, 4, 10),
(259, 'Edward', 'Manyama', 18, 4, 13),
(260, 'Benedict', 'Haule', 1, 4, 8),
(261, 'Ayoub', 'Lyanga', 7, 4, 11),
(262, 'Abdoulaye', 'Camara', 61, 4, 15),
(263, 'Yahaya', 'Mbegu', 5, 4, 12),
(264, 'Edmund', 'John', 11, 4, 13),
(265, 'Joe', 'Makoye', 53, 4, 12),
(266, 'Frank', 'Kwabena', 36, 4, 8),
(267, 'Moussa', 'Camara', 26, 1, 13),
(268, 'Shomary', 'Kapombe', 12, 1, 12),
(269, 'Mohamed', 'Hussein', 15, 1, 8),
(270, 'Che', 'Malone', 20, 1, 10),
(271, 'Abdulrazack', 'Hamza', 14, 1, 12),
(272, 'Fabrice', 'Ngoma', 6, 1, 15),
(273, 'Elie', 'Mpanzu', 34, 1, 10),
(274, 'Yusuph', 'Kagoma', 21, 1, 13),
(275, 'Jean', 'Ahoua', 10, 1, 8),
(276, 'Kibu', 'Denis', 38, 1, 9),
(277, 'Steven', 'Mukwala', 11, 1, 6),
(278, 'Ally', 'Salim', 1, 1, 11),
(279, 'Mzamiru', 'Yassin', 19, 1, 9),
(280, 'Leonel', 'Ateba', 13, 1, 7),
(281, 'Karabou', 'Chamou', 2, 1, 8),
(282, 'Kelvin', 'Kijili', 33, 1, 13),
(283, 'Debora', 'Mavambo', 17, 1, 13),
(284, 'Ladaki', 'Chasambi', 36, 1, 11),
(285, 'Awesu', 'Awesu', 23, 1, 12),
(286, 'Valentino', 'Mashaka', 27, 1, 11),
(287, 'Alexander', 'Erasto', 42, 1, 4),
(288, 'Abuutwalib', 'Mshery', 16, 2, 6),
(289, 'Ibrahim', 'Abdulla', 4, 2, 15),
(290, 'Dickson', 'Job', 5, 2, 6),
(291, 'Chadrack', 'Boka', 23, 2, 5),
(292, 'Khalid', 'Aucho', 8, 2, 5),
(293, 'Kibwana', 'Shomary', 15, 2, 6),
(294, 'Mudathir', 'Yahya', 27, 2, 11),
(295, 'Clement', 'Mzize', 24, 2, 10),
(296, 'Prince', 'Dube', 29, 2, 13),
(297, 'Ki', 'Aziz', 10, 2, 7),
(298, 'Pacome', 'Zouzoua', 26, 2, 6),
(299, 'Bakari', 'Nondo', 3, 2, 5),
(300, 'Khomeiny', 'Abubakary', 1, 2, 14),
(301, 'Aweso', 'Aweso', 45, 2, 15),
(302, 'Salum', 'Abubakar', 18, 2, 8),
(303, 'Jonas', 'Mkude', 20, 2, 14),
(304, 'Sheikhan', 'Ibrahim', 22, 2, 8),
(305, 'Farid', 'Mussa', 12, 2, 4),
(306, 'Duke', 'Abuya', 38, 2, 5),
(307, 'Denis', 'Nkane', 40, 2, 10),
(308, 'Kennedy', 'Musonda', 25, 2, 9),
(309, 'John', 'Noble', 1, 10, 12),
(310, 'Laurian', 'Makame', 4, 10, 5),
(311, 'Salum', 'Kihimbwa', 10, 10, 10),
(312, 'Edger', 'William', 11, 10, 7),
(313, 'Mtenje', 'Albano', 8, 10, 14),
(314, 'Amosi', 'Kadikilo', 3, 10, 8),
(315, 'Dickson', 'Ambundo', 7, 10, 8),
(316, 'Joram', 'Mgeveke', 27, 10, 10),
(317, 'Elie', 'Mokono', 16, 10, 12),
(318, 'Nickolas', 'Gyan', 29, 10, 14),
(319, 'Zam', 'Elias', 31, 10, 8),
(320, 'Anack', 'Mtambi', 19, 10, 7),
(321, 'Said', 'Mbatty', 15, 10, 7),
(322, 'Fadhil', 'Kisunga', 18, 10, 11),
(323, 'Yesaya', 'Mwamwenda', 25, 10, 7),
(324, 'Kassim', 'Haruna', 24, 10, 8),
(325, 'Sadick', 'Ramadhani', 22, 10, 5),
(326, 'Daniel', 'Jolam', 26, 10, 8),
(327, 'Mudrick', 'Abdi', 39, 10, 12),
(328, 'Jackson', 'Shiga', 28, 10, 9),
(329, 'Enrick', 'Nkosi', 53, 10, 15);

-- --------------------------------------------------------

--
-- Table structure for table `positions`
--

CREATE TABLE `positions` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `positions`
--

INSERT INTO `positions` (`id`, `name`) VALUES
(1, 'ATTACKER'),
(2, 'MIDFIELDER'),
(3, 'DEFENDER'),
(4, 'GOALKEEPER');

-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

CREATE TABLE `regions` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `regions`
--

INSERT INTO `regions` (`id`, `name`) VALUES
(1, 'Arusha'),
(2, 'Dar es salaam'),
(3, 'Dodoma'),
(4, 'Geita'),
(5, 'Iringa'),
(6, 'Kagera'),
(7, 'Katavi'),
(8, 'Kigoma'),
(9, 'Kilimanjaro'),
(10, 'Lindi'),
(11, 'Manyara'),
(12, 'Mara'),
(13, 'Mbeya'),
(14, 'Morogoro'),
(15, 'Mtwara'),
(16, 'Mwanza'),
(17, 'Njombe'),
(18, 'Pwani'),
(19, 'Rukwa'),
(20, 'Ruvuma'),
(21, 'Shinyanga'),
(22, 'Simiyu'),
(23, 'Singida'),
(24, 'Songwe'),
(25, 'Tabora'),
(26, 'Tanga'),
(27, 'Tanga');

-- --------------------------------------------------------

--
-- Table structure for table `seasons`
--

CREATE TABLE `seasons` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `seasons`
--

INSERT INTO `seasons` (`id`, `name`) VALUES
(1, '2024-2025');

-- --------------------------------------------------------

--
-- Table structure for table `stadiums`
--

CREATE TABLE `stadiums` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stadiums`
--

INSERT INTO `stadiums` (`id`, `name`) VALUES
(1, 'KMC Complex'),
(2, 'Azam Complex'),
(3, 'Meja jenerali Isamuhyo'),
(4, 'Jamhuri'),
(5, 'CCM Liti'),
(6, 'Lake Tanganyika'),
(7, 'Mkwakwani'),
(8, 'Kaitaba'),
(9, 'Ali Hassan Mwinyi'),
(10, 'Sokoine'),
(11, 'Majaliwa'),
(12, 'Tanzanite kwaraa'),
(13, 'Nyamagana/CCM Kirumba'),
(14, 'Sheikh Amri Abeid');

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `short_name` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `name`, `short_name`) VALUES
(1, 'Simba sports club', 'SIM'),
(2, 'Young Africans', 'YAN'),
(3, 'Azam', 'AZA'),
(4, 'Singida black starts', 'SBS'),
(5, 'Namungo', 'NAM'),
(6, 'JKT Tanzania', 'JKT'),
(7, 'Kagera sugar', 'KAG'),
(8, 'Kengold', 'KEN'),
(9, 'Tabora united', 'TAB'),
(10, 'Fountain gate', 'FOU'),
(11, 'Mashujaa', 'MAS'),
(12, 'Dodoma jiji', 'DOD'),
(13, 'KMC', 'KMC'),
(14, 'Coastal union', 'COA'),
(15, 'Pamba jiji', 'PAM'),
(16, 'Tanzania prisons', 'PRS');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`) VALUES
(1, 'Faraji', 'fari', '$2y$10$yy.WDAw3Km/DXDguMmuNiu0T9R8Y4XTzRHt6lQNUinKHX7F1BkM.m'),
(2, 'Azim', 'azi', '$2y$10$C1OaRGlbUtlMLi3I3Kfuwe5gc51VPePoFH3Bsj3wPGPofPLS.8agm'),
(3, 'Witumbilo', 'witu', '$2y$10$uG83TasOcdgutb20JQ8yGOwxEWQ1L2UFyLyifux/Hiy72dQoXyYle'),
(4, 'Naziru', 'naziru', '$2y$10$kQYomwejZzEYlirKOq27PuWp/c1/Q0xwWq9xngKPF19C1RyWMSjlC'),
(5, 'azimm', 'azzy', '$2y$10$LFcRaTVUuroeWBt2uRd0teDQV49R.bxx4zcAI7pxE2/CMPeTYftqC');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fantasy_players`
--
ALTER TABLE `fantasy_players`
  ADD PRIMARY KEY (`fantasy_team`,`player`),
  ADD KEY `player` (`player`);

--
-- Indexes for table `fantasy_teams`
--
ALTER TABLE `fantasy_teams`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `user` (`user`);

--
-- Indexes for table `gameweek`
--
ALTER TABLE `gameweek`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`),
  ADD KEY `team` (`team`);

--
-- Indexes for table `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seasons`
--
ALTER TABLE `seasons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stadiums`
--
ALTER TABLE `stadiums`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `short_name` (`short_name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `fantasy_teams`
--
ALTER TABLE `fantasy_teams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `gameweek`
--
ALTER TABLE `gameweek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=330;

--
-- AUTO_INCREMENT for table `positions`
--
ALTER TABLE `positions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `regions`
--
ALTER TABLE `regions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `seasons`
--
ALTER TABLE `seasons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `stadiums`
--
ALTER TABLE `stadiums`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `fantasy_players`
--
ALTER TABLE `fantasy_players`
  ADD CONSTRAINT `fantasy_players_ibfk_1` FOREIGN KEY (`fantasy_team`) REFERENCES `fantasy_teams` (`id`),
  ADD CONSTRAINT `fantasy_players_ibfk_2` FOREIGN KEY (`player`) REFERENCES `players` (`id`);

--
-- Constraints for table `fantasy_teams`
--
ALTER TABLE `fantasy_teams`
  ADD CONSTRAINT `fantasy_teams_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users` (`id`);

--
-- Constraints for table `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `players_ibfk_1` FOREIGN KEY (`team`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
