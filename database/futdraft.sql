-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 03, 2024 at 08:50 PM
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
(1, 'Kékesi', 94, 'GK', 'Premier League', 'HUN', 'Newcastle United'),
(2, 'Erling Haaland', 97, 'ST', 'Premier League', 'NOR', 'Manchester City'),
(3, 'Kylian Mbappé', 97, 'ST;LW', 'Ligue 1', 'FRA', 'Paris SG'),
(4, 'Virgil Van Dijk', 97, 'CB', 'Premier League', 'NLD', 'Liverpool'),
(5, 'Jeremie Frimpong', 97, 'RWB;RB;RM', 'Bundesliga', 'NLD', 'Leverkusen'),
(6, 'Jude Bellingham', 97, 'CM;CAM', 'Laliga', 'ENG', 'Real Madrid'),
(7, 'Kevin De Bruyne', 96, 'CM;CAM', 'Premier League', 'BEL', 'Manchester City'),
(8, 'Luka Modric', 96, 'CM;CDM', 'Laliga', 'HRV', 'Real Madrid'),
(9, 'Declan Rice', 96, 'CM;CDM', 'Premier League', 'HRV', 'Real Madrid'),
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
(42, 'Ronald Araujo', 93, 'CB;RB', 'Laliga', 'URY', 'Barcelona'),
(43, 'Nacho Fernández', 93, 'CB;RB;LB', 'Laliga', 'ESP', 'Real Madrid'),
(44, 'Matthijs De LIgt', 92, 'CB', 'Bundesliga', 'NLD', 'Bayern'),
(45, 'Dayot Upamecano', 94, 'CB', 'Bundesliga', 'FRA', 'Bayern'),
(46, 'Zinadine Zidane', 96, 'CM;CAM', 'Icon', 'FRA', 'Icon'),
(47, 'Jamal Musiala', 95, 'CM;CAM;LM', 'Bundesliga', 'GER', 'Bayern'),
(48, 'Leon Goretzka', 95, 'CM;CDM', 'Bundesliga', 'GER', 'Bayern'),
(49, 'Toni Kroos', 94, 'CM;CDM', 'Laliga', 'GER', 'Real Madrid'),
(50, 'Mo Salah', 95, 'RW;RM', 'Premier League', 'EGY', 'Liverpool'),
(51, 'Hristo Stoichkov', 94, 'ST;LW;RW', 'Icon', 'BGR', 'Icon');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
