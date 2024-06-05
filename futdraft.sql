-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 05, 2024 at 09:50 PM
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
-- Database: `futdraft`
--
CREATE DATABASE IF NOT EXISTS `futdraft` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `futdraft`;

-- --------------------------------------------------------

--
-- Table structure for table `leaderboard`
--

CREATE TABLE `leaderboard` (
  `Id` int(11) NOT NULL,
  `Name` tinytext NOT NULL,
  `Score` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `leaderboard`
--

INSERT INTO `leaderboard` (`Id`, `Name`, `Score`) VALUES
(1, 'Bálint', 10),
(2, 'Bálint', 128),
(3, 'Sajtfej', 145),
(4, 'Péter', 132),
(5, 'Koppány', 126),
(6, 'Anna', 114),
(7, 'Fülöp', 138),
(8, 'Fülöp', 146),
(9, 'Viktor', 126),
(10, 'Csaba', 126);

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `id` int(3) NOT NULL,
  `name` tinytext NOT NULL,
  `ovr` tinyint(4) NOT NULL,
  `pos` tinytext NOT NULL,
  `league` tinytext NOT NULL,
  `nation` char(3) NOT NULL,
  `team` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`id`, `name`, `ovr`, `pos`, `league`, `nation`, `team`) VALUES
(1, 'Kékesi', 94, 'GK', 'Neumann', 'HUN', 'Neumann'),
(2, 'Erling Haaland', 97, 'ST', 'Premier League', 'NOR', 'Manchester City'),
(3, 'Kylian Mbappé', 97, 'ST;LW', 'Ligue 1', 'FRA', 'Paris SG'),
(4, 'Virgil Van Dijk', 97, 'CB', 'Premier League', 'NLD', 'Liverpool'),
(5, 'Jeremie Frimpong', 97, 'RWB;RB;RM', 'Bundesliga', 'NLD', 'Leverkusen'),
(6, 'Jude Bellingham', 97, 'CM;CAM', 'Laliga', 'ENG', 'Real Madrid'),
(7, 'Kevin De Bruyne', 96, 'CM;CAM', 'Premier League', 'BEL', 'Manchester City'),
(8, 'Luka Modric', 96, 'CM;CDM', 'Laliga', 'HRV', 'Real Madrid'),
(9, 'Declan Rice', 96, 'CM;CDM', 'Premier League', 'ENG', 'Arsenal'),
(10, 'Cristiano Ronaldo', 96, 'ST', 'Saudi League', 'PRT', 'Al Nassr'),
(11, 'Ousmane Dembelé', 96, 'RW;RM;LW', 'Ligue 1', 'FRA', 'Paris SG'),
(12, 'Vitinha', 96, 'CM;CAM', 'Ligue 1', 'PRT', 'Paris SG'),
(13, 'Valverde', 96, 'CM;CAM;RW', 'Laliga', 'URY', 'Real Madrid'),
(14, 'Vinícius Jr,', 96, 'ST;LW;LM', 'Laliga', 'BRA', 'Real Madrid'),
(15, 'Neymar', 96, 'LW;LM;ST', 'Saudi League', 'BRA', 'Al Hilal'),
(16, 'Donnarumma', 95, 'GK', 'Ligue 1', 'ITA', 'Paris SG'),
(17, 'Alisson', 94, 'GK', 'Premier League', 'BRA', 'Liverpool'),
(18, 'Petr Cech', 93, 'GK', 'Icons', 'CZE', 'Icons'),
(19, 'Lev Yashin', 92, 'GK', 'Icons', 'RUS', 'Icons'),
(20, 'Iker Casillas', 92, 'GK', 'Icons', 'ESP', 'Icons'),
(21, 'Edwin Van Der Sar', 92, 'GK', 'Icons', 'NLD', 'Icons'),
(22, 'Hugo Lloris', 91, 'GK', 'Premier League', 'FRA', 'Tottenham'),
(23, 'Marc-André Ter Stegen', 90, 'GK', 'Laliga', 'GER', 'FC Barcelona'),
(24, 'Nick Pope', 86, 'GK', 'Premier League', 'ENG', 'Newcastle United'),
(25, 'Theo Hernández', 97, 'LB;LWB;LM', 'Serie A', 'FRA', 'AC Milan'),
(26, 'Alejandro Grimaldo', 95, 'LB;LWB;LM', 'Bundesliga', 'ESP', 'Leverkusen'),
(27, 'Joao Cancelo', 95, 'LB;LWB;RB', 'Laliga', 'PRT', 'FC Barcelona'),
(28, 'Rafael Leao', 93, 'LW;LM;ST', 'Serie A', 'PRT', 'AC Milan'),
(29, 'Paulo Dybala', 96, 'ST; CAM', 'Serie A', 'ARG', 'Roma'),
(30, 'Victor Oshimen', 95, 'ST', 'Serie A', 'NIG', 'Napoli'),
(31, 'Renato Sanchez', 94, 'CM;RM', 'Serie A', 'PRT', 'Roma'),
(32, 'Anthony Martial', 94, 'ST;LW;LM', 'Premier League', 'FRA', 'Manchester United'),
(33, 'Thiago Alcantara', 94, 'CM', 'Premier League', 'ESP', 'Liverpool'),
(34, 'Marco Reus', 96, 'CAM;LW;LM;ST', 'Bundesliga', 'GER', 'Dortmund'),
(35, 'Alessandro Bastoni', 96, 'CB', 'Serie A', 'ITA', 'Inter'),
(36, 'Ruben Dias', 95, 'CB', 'Premier League', 'PRT', 'Manchester City'),
(37, 'Sergio Ramos', 95, 'CB', 'Laliga', 'ESP', 'Sevilla'),
(38, 'Thiago Silva', 95, 'CB', 'Premier League', 'BRA', 'Chelsea'),
(39, 'Paolo Maldini', 94, 'CB;LB', 'Icon', 'ITA', 'Icon'),
(40, 'Nemanja Vidic', 94, 'CB', 'Icon', 'SRB', 'Icon'),
(41, 'Rio Ferdinand', 93, 'CB', 'Icon', 'ENG', 'Icon'),
(42, 'Ronald Araujo', 93, 'CB;RB', 'Laliga', 'URY', 'FC Barcelona'),
(43, 'Nacho Fernández', 93, 'CB;RB;LB', 'Laliga', 'ESP', 'Real Madrid'),
(44, 'Matthijs De LIgt', 92, 'CB', 'Bundesliga', 'NLD', 'Bayern'),
(45, 'Dayot Upamecano', 94, 'CB', 'Bundesliga', 'FRA', 'Bayern'),
(46, 'Zinadine Zidane', 96, 'CM;CAM', 'Icon', 'FRA', 'Icon'),
(47, 'Jamal Musiala', 95, 'CM;CAM;LM', 'Bundesliga', 'GER', 'Bayern'),
(48, 'Leon Goretzka', 95, 'CM;CDM', 'Bundesliga', 'GER', 'Bayern'),
(49, 'Toni Kroos', 94, 'CM;CDM', 'Laliga', 'GER', 'Real Madrid'),
(50, 'Mo Salah', 95, 'RW;RM', 'Premier League', 'EGY', 'Liverpool'),
(51, 'Hristo Stoichkov', 94, 'ST;LW;RW', 'Icon', 'BGR', 'Icon'),
(52, 'Cafu', 94, 'RB;RWB;RM', 'Icon', 'BRA', 'Icon'),
(53, 'Kai Havertz', 94, 'CM;CAM;ST;LB', 'Premier League', 'GER', 'Arsenal'),
(54, 'Alphonso Davies', 89, 'LB;LM;LWB;LW', 'Bundesliga', 'CAN', 'Bayern'),
(55, 'Rúben Neves', 87, 'CDM;CM', 'Saudi League', 'PRT', 'Al Hilal'),
(56, 'Kalidou Koulibaly', 94, 'CB', 'Saudi League', 'SEN', 'Al Hilal'),
(57, 'Andrea Pirlo', 94, 'CM;CDM', 'Icon', 'ITA', 'Icon'),
(58, 'Patrick Vieira', 93, 'CM;CDM', 'Icon', 'FRA', 'Icon'),
(59, 'Joshua KImmich', 92, 'CM;CDM;RB', 'Bundesliga', 'GER', 'Bayern'),
(60, 'Kobbie Mainoo', 92, 'CM;CDM;CAM', 'Premier League', 'ENG', 'Manchester United'),
(61, 'Steven Gerrard', 91, 'CM;CDM', 'Icon', 'ENG', 'Icon'),
(62, 'Aurélien Tchouaméni', 91, 'CM;CDM;CB', 'Laliga', 'FRA', 'Real Madrid'),
(63, 'Clarence Seedorf', 90, 'CM;CDM;RM', 'Icon', 'NLD', 'Icon'),
(64, 'Aaron Wan-Bissaka', 92, 'RB;RWB;CB', 'Premier League', 'ENG', 'Machester United'),
(65, 'Ferenc Puskás', 96, 'ST', 'Icon', 'HUN', 'Icon'),
(66, 'Gianluca Zambrotta', 91, 'LB;RB;RWB', 'Icon', 'ITA', 'Icon'),
(67, 'Philip Lahm', 89, 'LB;RB;RWB;CDM', 'Icon', 'GER', 'Icon'),
(68, 'Thiery Henry', 94, 'ST;LW', 'Icon', 'FRA', 'Icon'),
(69, 'Fülöp', 96, 'RW;RM', 'Neumann', 'HUN', 'Neumann'),
(70, 'Jairzinho', 94, 'RW;RM;ST', 'Icon', 'BRA', 'Icon'),
(71, 'Cole Palmer', 91, 'CAM;RW;CM', 'Premier League', 'ENG', 'Chelsea'),
(72, 'Phil Foden', 94, 'CAM;RW;LW;LM', 'Premier League', 'ENG', 'Manchester City'),
(73, 'Kaká', 93, 'CAM;RW;LW;ST', 'Icon', 'BRA', 'Icon'),
(74, 'Raphinha', 93, 'RW;RM', 'Laliga', 'BRA', 'FC Barcelona'),
(75, 'Leroy Sané', 93, 'RW;RM;LM', 'Bundesliga', 'GER', 'Bayern'),
(76, 'Jamie Bynoe-Gittens', 93, 'LW;LM;RW;RM', 'Bundesliga', 'ENG', 'Dortmund'),
(77, 'Andriy Shevchenko', 91, 'ST;LW', 'Icon', 'UKR', 'Icon'),
(78, 'David Beckham', 91, 'RM;RW;CM', 'Icon', 'ENG', 'Icon'),
(79, 'Frenkie De Jong', 93, 'CM', 'Laliga', 'NLD', 'FC Barcelona'),
(80, 'Pablo Gavi', 88, 'CM;CAM;LW', 'Laliga', 'ESP', 'FC Barcelona'),
(81, 'Pedri', 92, 'CM;CAM', 'Laliga', 'ESP', 'FC Barcelona'),
(82, 'Luis Suárez', 94, 'ST', 'MLS', 'URY', 'Inter Miami'),
(83, 'Lionel Messi', 94, 'ST;CAM', 'MLS', 'ARG', 'Inter Miami'),
(84, 'Sergio Busquets', 93, 'CDM;CM', 'MLS', 'ESP', 'Inter Miami'),
(85, 'Jordi Alba', 93, 'LB;LWB', 'MLS', 'ESP', 'Inter Miami'),
(86, 'Jack Grealish', 90, 'LW;LM', 'Premier League', 'ENG', 'Manchester City'),
(87, 'Darwin Nunez', 90, 'LW;ST', 'Premier League', 'URY', 'Liverpool'),
(88, 'Hakan Calhanoglu', 90, 'CM;CAM;CDM', 'Serie A', 'TUR', 'Inter'),
(89, 'Yann Aurel Bisseck', 93, 'CB', 'Serie A', 'GER', 'Inter'),
(90, 'Nicolo Barella', 90, 'CM;CDM', 'Serie A', 'ITA', 'Inter'),
(91, 'Lautaro Martínez', 97, 'ST', 'Serie A', 'ARG', 'Inter'),
(92, 'Harry Kane', 97, 'ST', 'Bundesliga', 'ENG', 'Bayern'),
(93, 'Niklas Süle', 91, 'CB;RB', 'Bundesliga', 'GER', 'Dortmund'),
(94, 'Nico Schlotterbeck', 93, 'CB', 'Bundesliga', 'GER', 'Dortmund'),
(95, 'Gabriel Martinelli', 89, 'LW;RW;RM', 'Premier League', 'BRA', 'Arsenal');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `leaderboard`
--
ALTER TABLE `leaderboard`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
