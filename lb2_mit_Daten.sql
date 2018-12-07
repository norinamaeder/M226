-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 07. Dez 2018 um 17:14
-- Server-Version: 10.1.30-MariaDB
-- PHP-Version: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `lb2`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `antworten`
--

CREATE TABLE `antworten` (
  `id` int(255) NOT NULL,
  `Name Antworten` varchar(200) NOT NULL,
  `fk_id-fragen` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `antworten`
--

INSERT INTO `antworten` (`id`, `Name Antworten`, `fk_id-fragen`) VALUES
(1, 'Norina', 1),
(2, 'Informatikerin', 3),
(3, 'Ja', 2),
(4, 'Ja', 5),
(5, 'BI15c', 4),
(6, 'Wädenswil', 6);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ersteller`
--

CREATE TABLE `ersteller` (
  `id` int(255) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Vorname` varchar(45) NOT NULL,
  `E-Mail-Adresse` varchar(45) NOT NULL,
  `Passwort` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `ersteller`
--

INSERT INTO `ersteller` (`id`, `Name`, `Vorname`, `E-Mail-Adresse`, `Passwort`) VALUES
(1, 'Meier', 'Lara', 'meier.lara@gmail.com', 'Migros'),
(2, 'Schule', 'Melanie', 'schule.melanie@gmail.com', 'Migros'),
(3, 'Tbz', 'Test', 'tbz.test@gmail.com', 'Migros'),
(4, 'Schneider', 'Peter', 'schneider.peter@gmail.com', 'Migros'),
(5, 'Widmer', 'Robin', 'widmer.robin@gmail.com', 'Migros'),
(6, 'Gut', 'Elena', 'gut.elena@gmail.com', 'Migros');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `fragen`
--

CREATE TABLE `fragen` (
  `id` int(255) NOT NULL,
  `fk_id-umfragen` int(255) NOT NULL,
  `Name fragen` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `fragen`
--

INSERT INTO `fragen` (`id`, `fk_id-umfragen`, `Name fragen`) VALUES
(1, 2, 'Wie heisst du?'),
(2, 1, 'Kennst du eine Frau, die in einem technischen Beruf arbeitet?'),
(3, 3, 'Was arbeitest du?'),
(4, 6, 'Wo wohnst du?'),
(5, 4, 'In welche Klasse gehst du?'),
(6, 5, 'Hast du Geschwister?');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `umfragen`
--

CREATE TABLE `umfragen` (
  `id` int(255) NOT NULL,
  `Name Umfrage` varchar(45) NOT NULL,
  `fk_id-ersteller` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `umfragen`
--

INSERT INTO `umfragen` (`id`, `Name Umfrage`, `fk_id-ersteller`) VALUES
(1, 'Frauen in der Tech Branche', 2),
(2, 'Beispiel 2', 5),
(3, 'Beispiel Nr. 3', 1),
(4, 'TBZ', 2),
(5, 'Beispiel 5', 6),
(6, 'Beispiel 6', 4),
(7, 'Beispiel nummer 7', 3);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `antworten`
--
ALTER TABLE `antworten`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ant_fra` (`fk_id-fragen`);

--
-- Indizes für die Tabelle `ersteller`
--
ALTER TABLE `ersteller`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `fragen`
--
ALTER TABLE `fragen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `frag_umfra` (`fk_id-umfragen`);

--
-- Indizes für die Tabelle `umfragen`
--
ALTER TABLE `umfragen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `umfr_erst` (`fk_id-ersteller`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `antworten`
--
ALTER TABLE `antworten`
  ADD CONSTRAINT `ant_fra` FOREIGN KEY (`fk_id-fragen`) REFERENCES `fragen` (`ID`);

--
-- Constraints der Tabelle `fragen`
--
ALTER TABLE `fragen`
  ADD CONSTRAINT `frag_umfra` FOREIGN KEY (`fk_id-umfragen`) REFERENCES `umfragen` (`id`);

--
-- Constraints der Tabelle `umfragen`
--
ALTER TABLE `umfragen`
  ADD CONSTRAINT `umfr_erst` FOREIGN KEY (`fk_id-ersteller`) REFERENCES `ersteller` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
