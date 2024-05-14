-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Máj 14. 14:14
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
  `team` tinytext NOT NULL,
  `picture` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- TÁBLA KAPCSOLATAI `players`:
--

--
-- A tábla adatainak kiíratása `players`
--

INSERT INTO `players` (`id`, `name`, `ovr`, `pos`, `league`, `nation`, `team`, `picture`) VALUES
(0, 'Test McTestface', 1, 'CM;CAM;ST', 'Fifa', 'USA', 'Test Team', 'test.jpg');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`);


--
-- Metaadat
--
USE `phpmyadmin`;

--
-- A(z) players tábla metaadatai
--

--
-- A(z) futdraft adatbázis metaadatai
--

--
-- A tábla adatainak kiíratása `pma__central_columns`
--

INSERT INTO `pma__central_columns` (`db_name`, `col_name`, `col_type`, `col_length`, `col_collation`, `col_isNull`, `col_extra`, `col_default`) VALUES
('futdraft', 'name', 'tinytext', '', 'utf8_general_ci', 0, ',', '');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
