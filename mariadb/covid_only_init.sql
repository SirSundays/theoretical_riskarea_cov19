-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: mariadb
-- Erstellungszeit: 25. Okt 2020 um 13:08
-- Server-Version: 10.4.14-MariaDB-1:10.4.14+maria~focal
-- PHP-Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `covid`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `country_codes`
--

CREATE TABLE `country_codes` (
  `id` int(11) NOT NULL,
  `country` text COLLATE utf8_german2_ci NOT NULL,
  `code` text COLLATE utf8_german2_ci NOT NULL DEFAULT 'ZZ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_german2_ci;

--
-- Daten für Tabelle `country_codes`
--

INSERT INTO `country_codes` (`id`, `country`, `code`) VALUES
(1, 'Afghanistan', 'AF'),
(2, 'Albania', 'AL'),
(3, 'Algeria', 'DZ'),
(4, 'Andorra', 'AD'),
(5, 'Angola', 'AO'),
(6, 'Antigua and Barbuda', 'AG'),
(7, 'Argentina', 'AR'),
(8, 'Armenia', 'AM'),
(9, 'Australia', 'AU'),
(10, 'Austria', 'AT'),
(11, 'Azerbaijan', 'AZ'),
(12, 'Bahamas', 'BS'),
(13, 'Bahrain', 'BH'),
(14, 'Bangladesh', 'BD'),
(15, 'Barbados', 'BB'),
(16, 'Belarus', 'BY'),
(17, 'Belgium', 'BE'),
(18, 'Belize', 'BZ'),
(19, 'Benin', 'BJ'),
(20, 'Bhutan', 'BT'),
(21, 'Bolivia', 'BO'),
(22, 'Bosnia and Herzegovina', 'BQ'),
(23, 'Botswana', 'BW'),
(24, 'Brazil', 'BR'),
(25, 'Brunei', 'BN'),
(26, 'Bulgaria', 'BG'),
(27, 'Burkina Faso', 'BF'),
(28, 'Burma', 'MM'),
(29, 'Burundi', 'BI'),
(30, 'Cabo Verde', 'CV'),
(31, 'Cambodia', 'KH'),
(32, 'Cameroon', 'CM'),
(33, 'Canada', 'CA'),
(34, 'Central African Republic', 'CF'),
(35, 'Chad', 'TD'),
(36, 'Chile', 'CL'),
(37, 'China', 'CN'),
(38, 'Colombia', 'CO'),
(39, 'Comoros', 'KM'),
(40, 'Congo (Brazzaville)', 'CG'),
(41, 'Congo (Kinshasa)', 'CD'),
(42, 'Costa Rica', 'CR'),
(43, 'Cote d\'Ivoire', 'CI'),
(44, 'Croatia', 'HR'),
(45, 'Cuba', 'CU'),
(46, 'Cyprus', 'CY'),
(47, 'Czechia', 'CZ'),
(48, 'Denmark', 'DK'),
(49, 'Djibouti', 'DJ'),
(50, 'Dominica', 'DM'),
(51, 'Dominican Republic', 'DO'),
(52, 'Ecuador', 'EC'),
(53, 'Egypt', 'EG'),
(54, 'El Salvador', 'SV'),
(55, 'Equatorial Guinea', 'GQ'),
(56, 'Eritrea', 'ER'),
(57, 'Estonia', 'EE'),
(58, 'Eswatini', 'SZ'),
(59, 'Ethiopia', 'ET'),
(60, 'Fiji', 'FJ'),
(61, 'Finland', 'FI'),
(62, 'France', 'FR'),
(63, 'Gabon', 'GA'),
(64, 'Gambia', 'GM'),
(65, 'Georgia', 'GE'),
(66, 'Germany', 'DE'),
(67, 'Ghana', 'GH'),
(68, 'Greece', 'GR'),
(69, 'Grenada', 'GD'),
(70, 'Guatemala', 'GT'),
(71, 'Guinea', 'GN'),
(72, 'Guinea-Bissau', 'GW'),
(73, 'Guyana', 'GY'),
(74, 'Haiti', 'HT'),
(75, 'Holy See', 'VA'),
(76, 'Honduras', 'HN'),
(77, 'Hungary', 'HU'),
(78, 'Iceland', 'IS'),
(79, 'India', 'IN'),
(80, 'Indonesia', 'ID'),
(81, 'Iran', 'IR'),
(82, 'Iraq', 'IQ'),
(83, 'Ireland', 'IE'),
(84, 'Israel', 'IL'),
(85, 'Italy', 'IT'),
(86, 'Jamaica', 'JM'),
(87, 'Japan', 'JP'),
(88, 'Jordan', 'JO'),
(89, 'Kazakhstan', 'KZ'),
(90, 'Kenya', 'KE'),
(91, 'Korea, South', 'KR'),
(92, 'Kosovo', 'ZZ'),
(93, 'Kuwait', 'KW'),
(94, 'Kyrgyzstan', 'KG'),
(95, 'Laos', 'LA'),
(96, 'Latvia', 'LV'),
(97, 'Lebanon', 'LB'),
(98, 'Lesotho', 'LS'),
(99, 'Liberia', 'LR'),
(100, 'Libya', 'LY'),
(101, 'Liechtenstein', 'LI'),
(102, 'Lithuania', 'LT'),
(103, 'Luxembourg', 'LU'),
(104, 'Madagascar', 'MG'),
(105, 'Malawi', 'MW'),
(106, 'Malaysia', 'MY'),
(107, 'Maldives', 'MV'),
(108, 'Mali', 'ML'),
(109, 'Malta', 'MT'),
(110, 'Mauritania', 'MR'),
(111, 'Mauritius', 'MU'),
(112, 'Mexico', 'MX'),
(113, 'Moldova', 'MD'),
(114, 'Monaco', 'MC'),
(115, 'Mongolia', 'MN'),
(116, 'Montenegro', 'ME'),
(117, 'Morocco', 'MA'),
(118, 'Mozambique', 'MZ'),
(119, 'Namibia', 'NA'),
(120, 'Nepal', 'NP'),
(121, 'Netherlands', 'NL'),
(122, 'New Zealand', 'NZ'),
(123, 'Nicaragua', 'NI'),
(124, 'Niger', 'NE'),
(125, 'Nigeria', 'NG'),
(126, 'North Macedonia', 'MK'),
(127, 'Norway', 'NO'),
(128, 'Oman', 'OM'),
(129, 'Pakistan', 'PK'),
(130, 'Panama', 'PA'),
(131, 'Papua New Guinea', 'PG'),
(132, 'Paraguay', 'PY'),
(133, 'Peru', 'PE'),
(134, 'Philippines', 'PH'),
(135, 'Poland', 'PL'),
(136, 'Portugal', 'PT'),
(137, 'Qatar', 'QA'),
(138, 'Romania', 'RO'),
(139, 'Russia', 'RU'),
(140, 'Rwanda', 'RW'),
(141, 'Saint Kitts and Nevis', 'KN'),
(142, 'Saint Lucia', 'LC'),
(143, 'Saint Vincent and the Grenadines', 'VC'),
(144, 'San Marino', 'SM'),
(145, 'Sao Tome and Principe', 'ST'),
(146, 'Saudi Arabia', 'SA'),
(147, 'Senegal', 'SN'),
(148, 'Serbia', 'RS'),
(149, 'Seychelles', 'SC'),
(150, 'Sierra Leone', 'SL'),
(151, 'Singapore', 'SG'),
(152, 'Slovakia', 'SK'),
(153, 'Slovenia', 'SI'),
(154, 'Somalia', 'SO'),
(155, 'South Africa', 'ZA'),
(156, 'South Sudan', 'SS'),
(157, 'Spain', 'ES'),
(158, 'Sri Lanka', 'LK'),
(159, 'Sudan', 'SD'),
(160, 'Suriname', 'SR'),
(161, 'Sweden', 'SE'),
(162, 'Switzerland', 'CH'),
(163, 'Syria', 'SY'),
(164, 'Taiwan*', 'TW'),
(165, 'Tajikistan', 'TJ'),
(166, 'Tanzania', 'TZ'),
(167, 'Thailand', 'TH'),
(168, 'Timor-Leste', 'TL'),
(169, 'Togo', 'TG'),
(170, 'Trinidad and Tobago', 'TT'),
(171, 'Tunisia', 'TN'),
(172, 'Turkey', 'TR'),
(173, 'US', 'US'),
(174, 'Uganda', 'UG'),
(175, 'Ukraine', 'UA'),
(176, 'United Arab Emirates', 'AE'),
(177, 'United Kingdom', 'GB'),
(178, 'Uruguay', 'UY'),
(179, 'Uzbekistan', 'UZ'),
(180, 'Venezuela', 'VE'),
(181, 'Vietnam', 'VN'),
(182, 'West Bank and Gaza', 'PS'),
(183, 'Western Sahara', 'EH'),
(184, 'Yemen', 'YE'),
(185, 'Zambia', 'ZM'),
(186, 'Zimbabwe', 'ZW');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `daily_reports`
--

CREATE TABLE `daily_reports` (
  `id` int(11) NOT NULL,
  `province` text COLLATE utf8_german2_ci NOT NULL,
  `country` text COLLATE utf8_german2_ci NOT NULL,
  `last_update` text COLLATE utf8_german2_ci NOT NULL,
  `confirmed` int(11) NOT NULL,
  `deaths` int(11) NOT NULL,
  `recovered` int(11) NOT NULL,
  `active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `next_dates`
--

CREATE TABLE `next_dates` (
  `id` int(11) NOT NULL,
  `date` text COLLATE utf8_german2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_german2_ci;

--
-- Daten für Tabelle `next_dates`
--

INSERT INTO `next_dates` (`id`, `date`) VALUES
(1, '2020-04-23');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `population`
--

CREATE TABLE `population` (
  `id` int(11) NOT NULL,
  `country` text COLLATE utf8_german2_ci NOT NULL,
  `province` text COLLATE utf8_german2_ci NOT NULL,
  `population` bigint(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_german2_ci;

--
-- Daten für Tabelle `population`
--

INSERT INTO `population` (`id`, `country`, `province`, `population`) VALUES
(1, 'Afghanistan', '', 37170000),
(2, 'Albania', '', 2846000),
(3, 'Algeria', '', 42230000),
(4, 'Andorra', '', 77006),
(5, 'Angola', '', 30810000),
(6, 'Antigua and Barbuda', '', 96286),
(7, 'Argentina', '', 44490000),
(8, 'Armenia', '', 2965000),
(9, 'Australia', 'Australian Capital Territory', 429834),
(10, 'Australia', 'New South Wales', 8157999),
(11, 'Australia', 'Northern Territory', 245353),
(12, 'Australia', 'Queensland', 5160000),
(13, 'Australia', 'South Australia', 1767000),
(14, 'Australia', 'Tasmania', 539590),
(15, 'Australia', 'Victoria', 6689000),
(16, 'Australia', 'Western Australia', 2656000),
(17, 'Austria', '', 8859000),
(18, 'Azerbaijan', '', 9981000),
(19, 'Bahamas', '', 385640),
(20, 'Bahrain', '', 1569000),
(21, 'Bangladesh', '', 161400000),
(22, 'Barbados', '', 286641),
(23, 'Belarus', '', 9485000),
(24, 'Belgium', '', 11460000),
(25, 'Belize', '', 383071),
(26, 'Benin', '', 11490000),
(27, 'Bhutan', '', 754394),
(28, 'Bolivia', '', 11350000),
(29, 'Bosnia and Herzegovina', '', 3324000),
(30, 'Botswana', '', 2254000),
(31, 'Brazil', 'Acre', 790101),
(32, 'Brazil', 'Alagoas', 3322000),
(33, 'Brazil', 'Amapa', 751000),
(34, 'Brazil', 'Amazonas', 3874000),
(35, 'Brazil', 'Bahia', 15130000),
(36, 'Brazil', 'Ceara', 8843000),
(37, 'Brazil', 'Distrito Federal', 2570000),
(38, 'Brazil', 'Espirito Santo', 3885000),
(39, 'Brazil', 'Goias', 6523000),
(40, 'Brazil', 'Maranhao', 6851000),
(41, 'Brazil', 'Mato Grosso', 3224000),
(42, 'Brazil', 'Mato Grosso do Sul', 2778986),
(43, 'Brazil', 'Minas Gerais', 20870000),
(44, 'Brazil', 'Para', 8074000),
(45, 'Brazil', 'Paraiba', 3944000),
(46, 'Brazil', 'Parana', 11080000),
(47, 'Brazil', 'Pernambuco', 9278000),
(48, 'Brazil', 'Piaui', 3195000),
(49, 'Brazil', 'Rio Grande do Norte', 3409000),
(50, 'Brazil', 'Rio Grande do Sul', 11377239),
(51, 'Brazil', 'Rio de Janeiro', 6320000),
(52, 'Brazil', 'Rondonia', 1749000),
(53, 'Brazil', 'Roraima', 496936),
(54, 'Brazil', 'Santa Catarina', 6727000),
(55, 'Brazil', 'Sao Paulo', 12180000),
(56, 'Brazil', 'Sergipe', 2220000),
(57, 'Brazil', 'Tocantins', 1497000),
(58, 'Brunei', '', 428962),
(59, 'Bulgaria', '', 7000000),
(60, 'Burkina Faso', '', 19750000),
(61, 'Burma', '', 53710000),
(62, 'Burundi', '', 11180000),
(63, 'Cabo Verde', '', 543767),
(64, 'Cambodia', '', 16250000),
(65, 'Cameroon', '', 25220000),
(66, 'Canada', 'Alberta', 4371000),
(67, 'Canada', 'British Columbia', 5071000),
(68, 'Canada', 'Diamond Princess', -2),
(69, 'Canada', 'Grand Princess', -2),
(70, 'Canada', 'Manitoba', 1369000),
(71, 'Canada', 'New Brunswick', 776827),
(72, 'Canada', 'Newfoundland and Labrador', 521542),
(73, 'Canada', 'Northwest Territories', 44826),
(74, 'Canada', 'Nova Scotia', 971395),
(75, 'Canada', 'Ontario', 14570000),
(76, 'Canada', 'Prince Edward Island', 156947),
(77, 'Canada', 'Quebec', 542298),
(78, 'Canada', 'Saskatchewan', 1174000),
(79, 'Canada', 'Yukon', 37000),
(80, 'Central African Republic', '', 4666000),
(81, 'Chad', '', 15480000),
(82, 'Chile', 'Antofagasta', 388545),
(83, 'Chile', 'Araucania', 957224),
(84, 'Chile', 'Arica y Parinacota', 226068),
(85, 'Chile', 'Atacama', 286168),
(86, 'Chile', 'Aysen', 103158),
(87, 'Chile', 'Biobio', 1556805),
(88, 'Chile', 'Coquimbo', 757586),
(89, 'Chile', 'Los Lagos', 828708),
(90, 'Chile', 'Los Rios', 384837),
(91, 'Chile', 'Magallanes', 166533),
(92, 'Chile', 'Maule', 1044950),
(93, 'Chile', 'Metropolitana', 7112808),
(94, 'Chile', 'Nuble', 480609),
(95, 'Chile', 'OHiggins', 908545),
(96, 'Chile', 'Tarapaca', 330558),
(97, 'Chile', 'Unknown', -3),
(98, 'Chile', 'Valparaiso', 295113),
(99, 'China', 'Anhui', 62000000),
(100, 'China', 'Beijing', 21540000),
(101, 'China', 'Chongqing', 30480000),
(102, 'China', 'Fujian', 38560000),
(103, 'China', 'Gansu', 25580000),
(104, 'China', 'Guangdong', 11346),
(105, 'China', 'Guangxi', 48380000),
(106, 'China', 'Guizhou', 34750000),
(107, 'China', 'Hainan', 9258000),
(108, 'China', 'Hebei', 74700000),
(109, 'China', 'Heilongjiang', 38310000),
(110, 'China', 'Henan', 94000000),
(111, 'China', 'Hong Kong', 7451000),
(112, 'China', 'Hubei', 58500000),
(113, 'China', 'Hunan', 67370000),
(114, 'China', 'Inner Mongolia', 24706321),
(115, 'China', 'Jiangsu', 80400000),
(116, 'China', 'Jiangxi', 45200000),
(117, 'China', 'Jilin', 273),
(118, 'China', 'Liaoning', 43900000),
(119, 'China', 'Macau', 631636),
(120, 'China', 'Ningxia', 6301000),
(121, 'China', 'Qinghai', 5626722),
(122, 'China', 'Shaanxi', 37330000),
(123, 'China', 'Shandong', 100472400),
(124, 'China', 'Shanghai', 24280000),
(125, 'China', 'Shanxi', 36500000),
(126, 'China', 'Sichuan', 81100000),
(127, 'China', 'Tianjin', 11558),
(128, 'China', 'Tibet', 3180000),
(129, 'China', 'Xinjiang', 21815815),
(130, 'China', 'Yunnan', 45970000),
(131, 'China', 'Zhejiang', 57370000),
(132, 'Colombia', 'Amazonas', 76589),
(133, 'Colombia', 'Antioquia', 6407000),
(134, 'Colombia', 'Arauca', 262174),
(135, 'Colombia', 'Atlantico', 2536000),
(136, 'Colombia', 'Bolivar', 2069999),
(137, 'Colombia', 'Boyaca', 1242731),
(138, 'Colombia', 'Caldas', 998255),
(139, 'Colombia', 'Capital District', 7413000),
(140, 'Colombia', 'Caqueta', 410521),
(141, 'Colombia', 'Casanare', 435195),
(142, 'Colombia', 'Cauca', 1464000),
(143, 'Colombia', 'Cesar', 1201000),
(144, 'Colombia', 'Choco', 534826),
(145, 'Colombia', 'Cordoba', 1785000),
(146, 'Colombia', 'Cundinamarca', 3242999),
(147, 'Colombia', 'Guainia', 50636),
(148, 'Colombia', 'Guaviare', 86657),
(149, 'Colombia', 'Huila', 1122622),
(150, 'Colombia', 'La Guajira', 965718),
(151, 'Colombia', 'Magdalena', 1342000),
(152, 'Colombia', 'Meta', 1040000),
(153, 'Colombia', 'Narino', 1627589),
(154, 'Colombia', 'Norte de Santander', 1620318),
(155, 'Colombia', 'Putumayo', 359127),
(156, 'Colombia', 'Quindio', 555401),
(157, 'Colombia', 'Risaralda', 961055),
(158, 'Colombia', 'San Andres y Providencia', 61280),
(159, 'Colombia', 'Santander', 2185000),
(160, 'Colombia', 'Sucre', 904863),
(161, 'Colombia', 'Tolima', 1339998),
(162, 'Colombia', 'Unknown', -3),
(163, 'Colombia', 'Valle del Cauca', 4532152),
(164, 'Colombia', 'Vaupes', 40797),
(165, 'Colombia', 'Vichada', 112958),
(166, 'Comoros', '', 832322),
(167, 'Congo (Brazzaville)', '', 5244000),
(168, 'Congo (Kinshasa)', '', 84070000),
(169, 'Costa Rica', '', 4999000),
(170, 'Cote d\'Ivoire', '', 25070000),
(171, 'Croatia', '', 4058000),
(172, 'Cuba', '', 11340000),
(173, 'Cyprus', '', 1189000),
(174, 'Czechia', '', 10690000),
(175, 'Denmark', 'Faroe Islands', 48497),
(176, 'Denmark', 'Greenland', 56025),
(177, 'Denmark', '', 5806000),
(178, 'Diamond Princess', '', -2),
(179, 'Djibouti', '', 958920),
(180, 'Dominica', '', 71625),
(181, 'Dominican Republic', '', 10630000),
(182, 'Ecuador', '', 17080000),
(183, 'Egypt', '', 98420000),
(184, 'El Salvador', '', 6421000),
(185, 'Equatorial Guinea', '', 1309000),
(186, 'Eritrea', '', 3214000),
(187, 'Estonia', '', 1329000),
(188, 'Eswatini', '', 1093238),
(189, 'Ethiopia', '', 109200000),
(190, 'Fiji', '', 883483),
(191, 'Finland', '', 5518000),
(192, 'France', 'French Guiana', 290691),
(193, 'France', 'French Polynesia', 277679),
(194, 'France', 'Guadeloupe', 395700),
(195, 'France', 'Martinique', 376480),
(196, 'France', 'Mayotte', 270372),
(197, 'France', 'New Caledonia', 284060),
(198, 'France', 'Reunion', 859959),
(199, 'France', 'Saint Barthelemy', 9131),
(200, 'France', 'Saint Pierre and Miquelon', 5888),
(201, 'France', 'St Martin', 37264),
(202, 'France', '', 66989999),
(203, 'Gabon', '', 2119000),
(204, 'Gambia', '', 2280000),
(205, 'Georgia', '', 3731000),
(206, 'Germany', 'Baden-Wurttemberg', 11070000),
(207, 'Germany', 'Bayern', 13080000),
(208, 'Germany', 'Berlin', 3769000),
(209, 'Germany', 'Brandenburg', 2521893),
(210, 'Germany', 'Bremen', 547976),
(211, 'Germany', 'Hamburg', 1899000),
(212, 'Germany', 'Hessen', 6266000),
(213, 'Germany', 'Mecklenburg-Vorpommern', 1610000),
(214, 'Germany', 'Niedersachsen', 7982000),
(215, 'Germany', 'Nordrhein-Westfalen', 17930000),
(216, 'Germany', 'Rheinland-Pfalz', 4085000),
(217, 'Germany', 'Saarland', 990509),
(218, 'Germany', 'Sachsen', 4078000),
(219, 'Germany', 'Sachsen-Anhalt', 2208000),
(220, 'Germany', 'Schleswig-Holstein', 2890000),
(221, 'Germany', 'Thuringen', 2137000),
(222, 'Germany', 'Unknown', -3),
(223, 'Ghana', '', 29770000),
(224, 'Greece', '', 10720000),
(225, 'Grenada', '', 111454),
(226, 'Guatemala', '', 17250000),
(227, 'Guinea', '', 12410000),
(228, 'Guinea-Bissau', '', 1874000),
(229, 'Guyana', '', 779004),
(230, 'Haiti', '', 11120000),
(231, 'Holy See', '', 825),
(232, 'Honduras', '', 9588000),
(233, 'Hungary', '', 9773000),
(234, 'Iceland', '', 364134),
(235, 'India', 'Andaman and Nicobar Islands', 434192),
(236, 'India', 'Andhra Pradesh', 49670000),
(237, 'India', 'Arunachal Pradesh', 1255000),
(238, 'India', 'Assam', 30940000),
(239, 'India', 'Bihar', 99020000),
(240, 'India', 'Chandigarh', 1055000),
(241, 'India', 'Chhattisgarh', 32189999),
(242, 'India', 'Dadra and Nagar Haveli and Daman and Diu', 585764),
(243, 'India', 'Delhi', 18980000),
(244, 'India', 'Goa', 1817000),
(245, 'India', 'Gujarat', 62700000),
(246, 'India', 'Haryana', 25350000),
(247, 'India', 'Himachal Pradesh', 6856000),
(248, 'India', 'Jammu and Kashmir', 12550000),
(249, 'India', 'Jharkhand', 31900000),
(250, 'India', 'Karnataka', 64060000),
(251, 'India', 'Kerala', 34800000),
(252, 'India', 'Ladakh', 274289),
(253, 'India', 'Lakshadweep', 64429),
(254, 'India', 'Madhya Pradesh', 73340000),
(255, 'India', 'Maharashtra', 114200000),
(256, 'India', 'Manipur', 2722000),
(257, 'India', 'Meghalaya', 2651000),
(258, 'India', 'Mizoram', 1116000),
(259, 'India', 'Nagaland', 2275000),
(260, 'India', 'Odisha', 43730000),
(261, 'India', 'Puducherry', 241773),
(262, 'India', 'Punjab', 27980000),
(263, 'India', 'Rajasthan', 68890000),
(264, 'India', 'Sikkim', 619000),
(265, 'India', 'Tamil Nadu', 67860000),
(266, 'India', 'Telangana', 35190000),
(267, 'India', 'Tripura', 3658000),
(268, 'India', 'Unknown', -3),
(269, 'India', 'Uttar Pradesh', 204200000),
(270, 'India', 'Uttarakhand', 10080000),
(271, 'India', 'West Bengal', 90320000),
(272, 'Indonesia', '', 267700000),
(273, 'Iran', '', 81800000),
(274, 'Iraq', '', 38430000),
(275, 'Ireland', '', 4904000),
(276, 'Israel', '', 8884000),
(277, 'Italy', 'Abruzzo', 1312000),
(278, 'Italy', 'Basilicata', 562869),
(279, 'Italy', 'Calabria', 1947000),
(280, 'Italy', 'Campania', 5802000),
(281, 'Italy', 'Emilia-Romagna', 4459000),
(282, 'Italy', 'Friuli Venezia Giulia', 1215000),
(283, 'Italy', 'Lazio', 5879000),
(284, 'Italy', 'Liguria', 1551000),
(285, 'Italy', 'Lombardia', 10060000),
(286, 'Italy', 'Marche', 1525000),
(287, 'Italy', 'Molise', 305617),
(288, 'Italy', 'P.A. Bolzano', 520891),
(289, 'Italy', 'P.A. Trento', 538223),
(290, 'Italy', 'Piemonte', 4356000),
(291, 'Italy', 'Puglia', 4029000),
(292, 'Italy', 'Sardegna', 1640000),
(293, 'Italy', 'Sicilia', 5000000),
(294, 'Italy', 'Toscana', 3730000),
(295, 'Italy', 'Umbria', 882015),
(296, 'Italy', 'Valle d\'Aosta', 125666),
(297, 'Italy', 'Veneto', 4906000),
(298, 'Jamaica', '', 2935000),
(299, 'Japan', 'Aichi', 7553000),
(300, 'Japan', 'Akita', 315814),
(301, 'Japan', 'Aomori', 287648),
(302, 'Japan', 'Chiba', 971882),
(303, 'Japan', 'Ehime', 1342000),
(304, 'Japan', 'Fukui', 265904),
(305, 'Japan', 'Fukuoka', 1539000),
(306, 'Japan', 'Fukushima', 294247),
(307, 'Japan', 'Gifu', 406735),
(308, 'Japan', 'Gunma', 1938000),
(309, 'Japan', 'Hiroshima', 1194000),
(310, 'Japan', 'Hokkaido', 5281000),
(311, 'Japan', 'Hyogo', 5470000),
(312, 'Japan', 'Ibaraki', 32924),
(313, 'Japan', 'Ishikawa', 1141000),
(314, 'Japan', 'Iwate', 13111),
(315, 'Japan', 'Kagawa', 957430),
(316, 'Japan', 'Kagoshima', 599814),
(317, 'Japan', 'Kanagawa', 9058000),
(318, 'Japan', 'Kochi', 337190),
(319, 'Japan', 'Kumamoto', 740822),
(320, 'Japan', 'Kyoto', 1475000),
(321, 'Japan', 'Mie', 1782000),
(322, 'Japan', 'Miyagi', 2306000),
(323, 'Japan', 'Miyazaki', 401138),
(324, 'Japan', 'Nagano', 377598),
(325, 'Japan', 'Nagasaki', 429508),
(326, 'Japan', 'Nara', 360310),
(327, 'Japan', 'Niigata', 810157),
(328, 'Japan', 'Oita', 478146),
(329, 'Japan', 'Okayama', 719474),
(330, 'Japan', 'Okinawa', 1384000000),
(331, 'Japan', 'Osaka', 2691000),
(332, 'Japan', 'Port Quarantine', -3),
(333, 'Japan', 'Saga', 236372),
(334, 'Japan', 'Saitama', 1264000),
(335, 'Japan', 'Shiga', 1410000),
(336, 'Japan', 'Shimane', 689963),
(337, 'Japan', 'Shizuoka', 704989),
(338, 'Japan', 'Tochigi', 1944000),
(339, 'Japan', 'Tokushima', 258554),
(340, 'Japan', 'Tokyo', 9273000),
(341, 'Japan', 'Tottori', 193717),
(342, 'Japan', 'Toyama', 418686),
(343, 'Japan', 'Unknown', -3),
(344, 'Japan', 'Wakayama', 364154),
(345, 'Japan', 'Yamagata', 253832),
(346, 'Japan', 'Yamaguchi', 197422),
(347, 'Japan', 'Yamanashi', 34738),
(348, 'Jordan', '', 9956000),
(349, 'Kazakhstan', '', 18280000),
(350, 'Kenya', '', 51390000),
(351, 'Korea, South', '', 51640000),
(352, 'Kosovo', '', 1845000),
(353, 'Kuwait', '', 4136999),
(354, 'Kyrgyzstan', '', 6316000),
(355, 'Laos', '', 7062000),
(356, 'Latvia', '', 1920000),
(357, 'Lebanon', '', 6849000),
(358, 'Lesotho', '', 2108000),
(359, 'Liberia', '', 4819000),
(360, 'Libya', '', 6679000),
(361, 'Liechtenstein', '', 38749),
(362, 'Lithuania', '', 2794000),
(363, 'Luxembourg', '', 613894),
(364, 'MS Zaandam', '', -2),
(365, 'Madagascar', '', 26260000),
(366, 'Malawi', '', 18140000),
(367, 'Malaysia', '', 31530000),
(368, 'Maldives', '', 515696),
(369, 'Mali', '', 19080000),
(370, 'Malta', '', 514564),
(371, 'Mauritania', '', 4403000),
(372, 'Mauritius', '', 1265000),
(373, 'Mexico', 'Aguascalientes', 722250),
(374, 'Mexico', 'Baja California', 3316000),
(375, 'Mexico', 'Baja California Sur', 763929),
(376, 'Mexico', 'Campeche', 220389),
(377, 'Mexico', 'Chiapas', 5218000),
(378, 'Mexico', 'Chihuahua', 809232),
(379, 'Mexico', 'Ciudad de Mexico', 8855000),
(380, 'Mexico', 'Coahuila', 2955000),
(381, 'Mexico', 'Colima', 711235),
(382, 'Mexico', 'Durango', 654876),
(383, 'Mexico', 'Guanajuato', 184239),
(384, 'Mexico', 'Guerrero', 3533000),
(385, 'Mexico', 'Hidalgo', 2858000),
(386, 'Mexico', 'Jalisco', 8256000),
(387, 'Mexico', 'Mexico', 126200000),
(388, 'Mexico', 'Michoacan', 4584000),
(389, 'Mexico', 'Morelos', 1904000),
(390, 'Mexico', 'Nayarit', 1181000),
(391, 'Mexico', 'Nuevo Leon', 5120000),
(392, 'Mexico', 'Oaxaca', 255029),
(393, 'Mexico', 'Puebla', 1576000),
(394, 'Mexico', 'Queretaro', 626495),
(395, 'Mexico', 'Quintana Roo', 1502000),
(396, 'Mexico', 'San Luis Potosi', 824229),
(397, 'Mexico', 'Sinaloa', 5240),
(398, 'Mexico', 'Sonora', 2850000),
(399, 'Mexico', 'Tabasco', 2395000),
(400, 'Mexico', 'Tamaulipas', 3442000),
(401, 'Mexico', 'Tlaxcala', 1273000),
(402, 'Mexico', 'Veracruz', 428323),
(403, 'Mexico', 'Yucatan', 2097000),
(404, 'Mexico', 'Zacatecas', 1579000),
(405, 'Moldova', '', 3546000),
(406, 'Monaco', '', 38682),
(407, 'Mongolia', '', 3170000),
(408, 'Montenegro', '', 622359),
(409, 'Morocco', '', 36030000),
(410, 'Mozambique', '', 29500000),
(411, 'Namibia', '', 2448000),
(412, 'Nepal', '', 28090000),
(413, 'Netherlands', 'Aruba', 105845),
(414, 'Netherlands', 'Bonaire, Sint Eustatius and Saba', 24548),
(415, 'Netherlands', 'Curacao', 159849),
(416, 'Netherlands', 'Drenthe', 492167),
(417, 'Netherlands', 'Flevoland', 423021),
(418, 'Netherlands', 'Friesland', 647672),
(419, 'Netherlands', 'Gelderland', 2072000),
(420, 'Netherlands', 'Groningen', 200336),
(421, 'Netherlands', 'Limburg', 1118000),
(422, 'Netherlands', 'Noord-Brabant', 2545000),
(423, 'Netherlands', 'Noord-Holland', 2853000),
(424, 'Netherlands', 'Overijssel', 1156000),
(425, 'Netherlands', 'Sint Maarten', 40654),
(426, 'Netherlands', 'Unknown', -3),
(427, 'Netherlands', 'Utrecht', 1307000),
(428, 'Netherlands', 'Zeeland', 383032),
(429, 'Netherlands', 'Zuid-Holland', 3709000),
(430, 'New Zealand', '', 4886000),
(431, 'Nicaragua', '', 6466000),
(432, 'Niger', '', 22440000),
(433, 'Nigeria', '', 195900000),
(434, 'North Macedonia', '', 2077000),
(435, 'Norway', '', 5433000),
(436, 'Oman', '', 4829000),
(437, 'Pakistan', 'Azad Jammu and Kashmir', 4045000),
(438, 'Pakistan', 'Balochistan', 12340000),
(439, 'Pakistan', 'Gilgit-Baltistan', 1249000),
(440, 'Pakistan', 'Islamabad', 1014999),
(441, 'Pakistan', 'Khyber Pakhtunkhwa', 35530000),
(442, 'Pakistan', 'Punjab', 27980000),
(443, 'Pakistan', 'Sindh', 47890000),
(444, 'Panama', '', 4176999),
(445, 'Papua New Guinea', '', 8606000),
(446, 'Paraguay', '', 6956000),
(447, 'Peru', 'Amazonas', 379384),
(448, 'Peru', 'Ancash', 1148600),
(449, 'Peru', 'Apurimac', 458800),
(450, 'Peru', 'Arequipa', 1008000),
(451, 'Peru', 'Ayacucho', 180766),
(452, 'Peru', 'Cajamarca', 201329),
(453, 'Peru', 'Callao', 994494),
(454, 'Peru', 'Cusco', 428450),
(455, 'Peru', 'Huancavelica', 495000),
(456, 'Peru', 'Huanuco', 860500),
(457, 'Peru', 'Ica', 282407),
(458, 'Peru', 'Junin', 1350800),
(459, 'Peru', 'La Libertad', 1859600),
(460, 'Peru', 'Lambayeque', 58276),
(461, 'Peru', 'Lima', 8574974),
(462, 'Peru', 'Loreto', 883510),
(463, 'Peru', 'Madre de Dios', 137300),
(464, 'Peru', 'Moquegua', 180500),
(465, 'Peru', 'Pasco', 254065),
(466, 'Peru', 'Piura', 484475),
(467, 'Peru', 'Puno', 128637),
(468, 'Peru', 'San Martin', 813381),
(469, 'Peru', 'Tacna', 286240),
(470, 'Peru', 'Tumbes', 237700),
(471, 'Peru', 'Ucayali', 495500),
(472, 'Peru', 'Unknown', -3),
(473, 'Philippines', '', 106700000),
(474, 'Poland', '', 37970000),
(475, 'Portugal', '', 10280000),
(476, 'Qatar', '', 2782000),
(477, 'Romania', '', 19410000),
(478, 'Russia', 'Adygea Republic', 463453),
(479, 'Russia', 'Altai Krai', 2317052),
(480, 'Russia', 'Altai Republic', 206168),
(481, 'Russia', 'Amur Oblast', 790676),
(482, 'Russia', 'Arkhangelsk Oblast', 1136387),
(483, 'Russia', 'Astrakhan Oblast', 1005967),
(484, 'Russia', 'Bashkortostan Republic', 4037811),
(485, 'Russia', 'Belgorod Oblast', 1547532),
(486, 'Russia', 'Bryansk Oblast', 1192570),
(487, 'Russia', 'Buryatia Republic', 986109),
(488, 'Russia', 'Chechen Republic', 1268000000),
(489, 'Russia', 'Chelyabinsk Oblast', 3466960),
(490, 'Russia', 'Chukotka Autonomous Okrug', 50726),
(491, 'Russia', 'Chuvashia Republic', 1251000000),
(492, 'Russia', 'Dagestan Republic', 3111353),
(493, 'Russia', 'Ingushetia Republic', 506688),
(494, 'Russia', 'Irkutsk Oblast', 2390827),
(495, 'Russia', 'Ivanovo Oblast', 1061000000),
(496, 'Russia', 'Jewish Autonomous Okrug', 158381),
(497, 'Russia', 'Kabardino-Balkarian Republic', 868174),
(498, 'Russia', 'Kaliningrad Oblast', 1012253),
(499, 'Russia', 'Kalmykia Republic', 271035),
(500, 'Russia', 'Kaluga Oblast', 1000070),
(501, 'Russia', 'Kamchatka Krai', 312438),
(502, 'Russia', 'Karachay-Cherkess Republic', 465669),
(503, 'Russia', 'Karelia Republic', 614628),
(504, 'Russia', 'Kemerovo Oblast', 2657758),
(505, 'Russia', 'Khabarovsk Krai', 1343000000),
(506, 'Russia', 'Khakassia Republic', 534186),
(507, 'Russia', 'Khanty-Mansi Autonomous Okrug', 1532243),
(508, 'Russia', 'Kirov Oblast', 1262549),
(509, 'Russia', 'Komi Republic', 901189),
(510, 'Russia', 'Kostroma Oblast', 633392),
(511, 'Russia', 'Krasnodar Krai', 5227000),
(512, 'Russia', 'Krasnoyarsk Krai', 2867875),
(513, 'Russia', 'Kurgan Oblast', 826941),
(514, 'Russia', 'Kursk Oblast', 1127000000),
(515, 'Russia', 'Leningrad Oblast', 1876392),
(516, 'Russia', 'Lipetsk Oblast', 1139492),
(517, 'Russia', 'Magadan Oblast', 140199),
(518, 'Russia', 'Mari El Republic', 679094),
(519, 'Russia', 'Mordovia Republic', 790829),
(520, 'Russia', 'Moscow', 11920000),
(521, 'Russia', 'Moscow Oblast', 7095000),
(522, 'Russia', 'Murmansk Oblast', 741511),
(523, 'Russia', 'Nenets Autonomous Okrug', 44110),
(524, 'Russia', 'Nizhny Novgorod Oblast', 3203818),
(525, 'Russia', 'North Ossetia - Alania Republic', 697064),
(526, 'Russia', 'Novgorod Oblast', 596173),
(527, 'Russia', 'Novosibirsk Oblast', 2798251),
(528, 'Russia', 'Omsk Oblast', 1926562),
(529, 'Russia', 'Orel Oblast', 733682),
(530, 'Russia', 'Orenburg Oblast', 1956256),
(531, 'Russia', 'Penza Oblast', 1386000000),
(532, 'Russia', 'Perm Krai', 2599301),
(533, 'Russia', 'Primorsky Krai', 1895305),
(534, 'Russia', 'Pskov Oblast', 626046),
(535, 'Russia', 'Rostov Oblast', 4195327),
(536, 'Russia', 'Ryazan Oblast', 1108924),
(537, 'Russia', 'Saint Petersburg', 4991000),
(538, 'Russia', 'Sakha (Yakutiya) Republic', 970105),
(539, 'Russia', 'Sakhalin Oblast', 488453),
(540, 'Russia', 'Samara Oblast', 1172000000),
(541, 'Russia', 'Saratov Oblast', 2421785),
(542, 'Russia', 'Smolensk Oblast', 934747),
(543, 'Russia', 'Stavropol Krai', 2786000),
(544, 'Russia', 'Sverdlovsk Oblast', 4310861),
(545, 'Russia', 'Tambov Oblast', 1006962),
(546, 'Russia', 'Tatarstan Republic', 3885000),
(547, 'Russia', 'Tomsk Oblast', 1079051),
(548, 'Russia', 'Tula Oblast', 1466025),
(549, 'Russia', 'Tver Oblast', 1260345),
(550, 'Russia', 'Tyumen Oblast', 3755778),
(551, 'Russia', 'Tyva Republic', 1260345),
(552, 'Russia', 'Udmurt Republic', 1501005),
(553, 'Russia', 'Ulyanovsk Oblast', 1229687),
(554, 'Russia', 'Vladimir Oblast', 1358538),
(555, 'Russia', 'Volgograd Oblast', 2491751),
(556, 'Russia', 'Vologda Oblast', 1202000000),
(557, 'Russia', 'Voronezh Oblast', 2491751),
(558, 'Russia', 'Yamalo-Nenets Autonomous Okrug', 544008),
(559, 'Russia', 'Yaroslavl Oblast', 1272000000),
(560, 'Russia', 'Zabaykalsky Krai', 1059657),
(561, 'Rwanda', '', 12300000),
(562, 'Saint Kitts and Nevis', '', 52441),
(563, 'Saint Lucia', '', 181889),
(564, 'Saint Vincent and the Grenadines', '', 110210),
(565, 'San Marino', '', 33785),
(566, 'Sao Tome and Principe', '', 211028),
(567, 'Saudi Arabia', '', 33700000),
(568, 'Senegal', '', 15850000),
(569, 'Serbia', '', 6982000),
(570, 'Seychelles', '', 96762),
(571, 'Sierra Leone', '', 7650000),
(572, 'Singapore', '', 5639000),
(573, 'Slovakia', '', 5458000),
(574, 'Slovenia', '', 2081000),
(575, 'Somalia', '', 15010000),
(576, 'South Africa', '', 57780000),
(577, 'South Sudan', '', 10980000),
(578, 'Spain', 'Andalusia', 8427000),
(579, 'Spain', 'Aragon', 1321000),
(580, 'Spain', 'Asturias', 1022000),
(581, 'Spain', 'Baleares', 1188000),
(582, 'Spain', 'C. Valenciana', 4975000),
(583, 'Spain', 'Canarias', 2153000),
(584, 'Spain', 'Cantabria', 581641),
(585, 'Spain', 'Castilla - La Mancha', 2035000),
(586, 'Spain', 'Castilla y Leon', 2408000),
(587, 'Spain', 'Catalonia', 7566000),
(588, 'Spain', 'Ceuta', 84829),
(589, 'Spain', 'Extremadura', 1065000),
(590, 'Spain', 'Galicia', 2700000),
(591, 'Spain', 'La Rioja', 315675),
(592, 'Spain', 'Madrid', 6642000),
(593, 'Spain', 'Melilla', 84689),
(594, 'Spain', 'Murcia', 1488000),
(595, 'Spain', 'Navarra', 649946),
(596, 'Spain', 'Pais Vasco', 2178000),
(597, 'Spain', 'Unknown', -3),
(598, 'Sri Lanka', '', 21670000),
(599, 'Sudan', '', 41800000),
(600, 'Suriname', '', 575991),
(601, 'Sweden', 'Blekinge', 159606),
(602, 'Sweden', 'Dalarna', 287191),
(603, 'Sweden', 'Gavleborg', 287382),
(604, 'Sweden', 'Gotland', 59686),
(605, 'Sweden', 'Halland', 333848),
(606, 'Sweden', 'Jamtland Harjedalen', 9697),
(607, 'Sweden', 'Jonkoping', 93797),
(608, 'Sweden', 'Kalmar', 36392),
(609, 'Sweden', 'Kronoberg', 201496),
(610, 'Sweden', 'Norrbotten', 250093),
(611, 'Sweden', 'Orebro', 155989),
(612, 'Sweden', 'Ostergotland', 461583),
(613, 'Sweden', 'Skane', 1362000),
(614, 'Sweden', 'Sormland', 294695),
(615, 'Sweden', 'Stockholm', 975904),
(616, 'Sweden', 'Uppsala', 172402),
(617, 'Sweden', 'Varmland', 281482),
(618, 'Sweden', 'Vasterbotten', 271736),
(619, 'Sweden', 'Vasternorrland', 245453),
(620, 'Sweden', 'Vastmanland', 275845),
(621, 'Sweden', 'Vastra Gotaland', 1725881),
(622, 'Switzerland', '', 8570000),
(623, 'Syria', '', 16910000),
(624, 'Taiwan*', '', 23780000),
(625, 'Tajikistan', '', 9101000),
(626, 'Tanzania', '', 56320000),
(627, 'Thailand', '', 69430000),
(628, 'Timor-Leste', '', 1268000),
(629, 'Togo', '', 7889000),
(630, 'Trinidad and Tobago', '', 1390000),
(631, 'Tunisia', '', 11570000),
(632, 'Turkey', '', 82000000),
(633, 'US', 'Alabama', 4903000),
(634, 'US', 'Alaska', 731545),
(635, 'US', 'Arizona', 7279000),
(636, 'US', 'Arkansas', 3018000),
(637, 'US', 'California', 39510000),
(638, 'US', 'Colorado', 5759000),
(639, 'US', 'Connecticut', 3565000),
(640, 'US', 'Delaware', 973764),
(641, 'US', 'Diamond Princess', -2),
(642, 'US', 'District of Columbia', 705749),
(643, 'US', 'Florida', 21480000),
(644, 'US', 'Georgia', 10620000),
(645, 'US', 'Grand Princess', -2),
(646, 'US', 'Guam', 165768),
(647, 'US', 'Hawaii', 1416000),
(648, 'US', 'Idaho', 1787000),
(649, 'US', 'Illinois', 12670000),
(650, 'US', 'Indiana', 6732000),
(651, 'US', 'Iowa', 3155000),
(652, 'US', 'Kansas', 2913000),
(653, 'US', 'Kentucky', 4468000),
(654, 'US', 'Louisiana', 4649000),
(655, 'US', 'Maine', 1344000),
(656, 'US', 'Maryland', 6046000),
(657, 'US', 'Massachusetts', 6893000),
(658, 'US', 'Michigan', 9987000),
(659, 'US', 'Minnesota', 5640000),
(660, 'US', 'Mississippi', 2976000),
(661, 'US', 'Missouri', 6137000),
(662, 'US', 'Montana', 1069000),
(663, 'US', 'Nebraska', 1934000),
(664, 'US', 'Nevada', 3080000),
(665, 'US', 'New Hampshire', 1360000),
(666, 'US', 'New Jersey', 8882000),
(667, 'US', 'New Mexico', 2097000),
(668, 'US', 'New York', 8399000),
(669, 'US', 'North Carolina', 10490000),
(670, 'US', 'North Dakota', 762062),
(671, 'US', 'Northern Mariana Islands', 56882),
(672, 'US', 'Ohio', 11690000),
(673, 'US', 'Oklahoma', 3957000),
(674, 'US', 'Oregon', 4218000),
(675, 'US', 'Pennsylvania', 12800000),
(676, 'US', 'Puerto Rico', 3194000),
(677, 'US', 'Recovered', -4),
(678, 'US', 'Rhode Island', 1059000),
(679, 'US', 'South Carolina', 5149000),
(680, 'US', 'South Dakota', 884659),
(681, 'US', 'Tennessee', 6829000),
(682, 'US', 'Texas', 29000000),
(683, 'US', 'Utah', 3206000),
(684, 'US', 'Vermont', 623989),
(685, 'US', 'Virgin Islands', 106977),
(686, 'US', 'Virginia', 8536000),
(687, 'US', 'Washington', 7615000),
(688, 'US', 'West Virginia', 1792000),
(689, 'US', 'Wisconsin', 5822000),
(690, 'US', 'Wyoming', 578759),
(691, 'Uganda', '', 42720000),
(692, 'Ukraine', 'Cherkasy Oblast', 1192000000),
(693, 'Ukraine', 'Chernihiv Oblast', 1006000),
(694, 'Ukraine', 'Chernivtsi Oblast', 901632),
(695, 'Ukraine', 'Crimea Republic*', 1967000),
(696, 'Ukraine', 'Dnipropetrovsk Oblast', 3206000),
(697, 'Ukraine', 'Donetsk Oblast', 4356000),
(698, 'Ukraine', 'Ivano-Frankivsk Oblast', 1382100),
(699, 'Ukraine', 'Kharkiv Oblast', 2701000),
(700, 'Ukraine', 'Kherson Oblast', 1062000),
(701, 'Ukraine', 'Khmelnytskyi Oblast', 1307000),
(702, 'Ukraine', 'Kiev', 2884000),
(703, 'Ukraine', 'Kiev Oblast', 1725000),
(704, 'Ukraine', 'Kirovohrad Oblast', 965756),
(705, 'Ukraine', 'Luhansk Oblast', 2240000),
(706, 'Ukraine', 'Lviv Oblast', 2534000),
(707, 'Ukraine', 'Mykolaiv Oblast', 1164000),
(708, 'Ukraine', 'Odessa Oblast', 2396000),
(709, 'Ukraine', 'Poltava Oblast', 1439000),
(710, 'Ukraine', 'Rivne Oblast', 1163000),
(711, 'Ukraine', 'Sevastopol*', 340735),
(712, 'Ukraine', 'Sumy Oblast', 1113000000),
(713, 'Ukraine', 'Ternopil Oblast', 1072000),
(714, 'Ukraine', 'Vinnytsia Oblast', 1611000),
(715, 'Ukraine', 'Volyn Oblast', 1036000000),
(716, 'Ukraine', 'Zakarpattia Oblast', 1259000),
(717, 'Ukraine', 'Zaporizhia Oblast', 1785000),
(718, 'Ukraine', 'Zhytomyr Oblast', 1240000),
(719, 'United Arab Emirates', '', 9631000),
(720, 'United Kingdom', 'Anguilla', 15094),
(721, 'United Kingdom', 'Bermuda', 63968),
(722, 'United Kingdom', 'British Virgin Islands', 28054),
(723, 'United Kingdom', 'Cayman Islands', 64174),
(724, 'United Kingdom', 'Channel Islands', 166000),
(725, 'United Kingdom', 'England', 55980000),
(726, 'United Kingdom', 'Falkland Islands (Malvinas)', 2840),
(727, 'United Kingdom', 'Gibraltar', 33718),
(728, 'United Kingdom', 'Isle of Man', 84077),
(729, 'United Kingdom', 'Montserrat', 5900),
(730, 'United Kingdom', 'Northern Ireland', 1882000),
(731, 'United Kingdom', 'Scotland', 5454000),
(732, 'United Kingdom', 'Turks and Caicos Islands', 37665),
(733, 'United Kingdom', 'Unknown', -3),
(734, 'United Kingdom', 'Wales', 3136000),
(735, 'Uruguay', '', 3449000),
(736, 'Uzbekistan', '', 32960000),
(737, 'Venezuela', '', 28870000),
(738, 'Vietnam', '', 95540000),
(739, 'West Bank and Gaza', '', 4685306),
(740, 'Western Sahara', '', 567402),
(741, 'Yemen', '', 28500000),
(742, 'Zambia', '', 17350000),
(743, 'Zimbabwe', '', 14440000);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `country_codes`
--
ALTER TABLE `country_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `daily_reports`
--
ALTER TABLE `daily_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `next_dates`
--
ALTER TABLE `next_dates`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `population`
--
ALTER TABLE `population`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `country_codes`
--
ALTER TABLE `country_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=187;

--
-- AUTO_INCREMENT für Tabelle `daily_reports`
--
ALTER TABLE `daily_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `next_dates`
--
ALTER TABLE `next_dates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `population`
--
ALTER TABLE `population`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=744;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
