-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Máj 28. 14:39
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `futdraft`
--
CREATE DATABASE IF NOT EXISTS `futdraft` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `futdraft`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `players`
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
-- A tábla adatainak kiíratása `players`
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
(23, 'Marc-André Ter Stegen', 90, 'GK', 'Laliga', 'GER', 'FC Barcelona');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
