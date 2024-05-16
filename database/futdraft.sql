-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Máj 16. 21:32
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
(0, 'Test McTestface', 1, 'CM;CAM;ST', 'Fifa', 'USA', 'Test Team'),
(1, 'Kékesi', 94, 'GK', 'Premier League', 'HUN', 'Newcastle United'),
(2, 'VALAKI MÁS GECI', 94, 'GK', 'Premier League', 'HUN', 'Newcastle United'),
(3, 'SAJT', 94, 'GK', 'Premier League', 'HUN', 'Newcastle United');

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
