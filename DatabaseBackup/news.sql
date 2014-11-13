-- phpMyAdmin SQL Dump
-- version 4.2.10
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Erstellungszeit: 13. Nov 2014 um 23:55
-- Server Version: 5.5.39-MariaDB-0ubuntu0.14.04.1
-- PHP-Version: 5.5.9-1ubuntu4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Datenbank: `WebShop_development`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `news`
--

CREATE TABLE IF NOT EXISTS `news` (
`id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `news`
--

INSERT INTO `news` (`id`, `title`, `content`, `created_at`, `updated_at`) VALUES
(2, 'NVIDIA Game 24', 'Am 19.09. startet NVIDIA ein Event der Extraklasse: Game 24 - Die erste globale PC-Gaming Party\r\n\r\nEvents und Aktionen rund um die Welt, DOTA 2 Turniere mit professionellen Teams, Developer Interviews und Chats (z.B. mit Epic Ubisoft, Blizzard, Warner etc.), Riesen-Gewinnspiele und vieles mehr - 24 Stunden lang, nonstop!\r\n\r\nSeid im interaktiven Live-Stream dabei: <a href="http://game24.nvidia.com/">http://game24.nvidia.com/</a>', '2014-09-12 03:32:18', '2014-09-12 03:40:46'),
(3, 'Game 24 - Die erste globale PC-Gaming Party', 'Kommende Nacht geht es los - der interaktive 24-Stunden-Live-Stream startet um 3 Uhr nachts (MEZ) mit einem Live-Event in Los Angeles. In Europa feiern die Spieler vor Ort in Stockholm (21 Uhr MEZ) und London (20:30 Uhr MEZ) am Abend des 19ten.\r\n\r\nHier seid Ihr dabei: <a href="http://game24.nvidia.com/">http://game24.nvidia.com/</a>', '2014-09-18 03:32:46', '2014-09-18 03:41:24'),
(4, 'Windows 10', 'Die Gerüchteküche brodelt ja schon eine Weile, jetzt hat Microsoft die Katze aus dem Sack gelassen und präsentierte gestern die Zukunft von Windows.\r\n\r\nWindows 10 wird die nächste Version heißen und das erste universale Windows für alle Arten von Geräten sein.\r\n\r\nDie wichtigsten Highlights der neuen Version: Massiv erweiterte Sicherheitsfeatures, ein App-Store für alle Geräte, das Startmenü kehrt mit erweitertem Funktionsumfang zurück, Windows-Apps laufen in Fenstern und es wird multiple virtuelle Desktops geben.\r\n\r\nWindows 10 erscheint voraussichtlich Mitte 2015. Zuerst einmal zeigen wir anhand der Technical Preview, auf welche Neuerungen Ihr euch bei Windows 10 freuen könnt: <a href="https://www.youtube.com/watch?v=psyTHNiv8zE">https://www.youtube.com/watch?v=psyTHNiv8zE</a>', '2014-11-03 03:33:18', '2014-11-03 03:39:43'),
(5, 'AMD Radeon™ Rewards', 'Bei Kauf eines PCs mit AMD Radeon R9 290, R9 290X oder R9 295X2 könnt Ihr jetzt richtig abräumen!\r\n\r\nWeiterhin bekommt Ihr einen AMD Radeon Ruby Reward, mit dem Ihr euch 4 Spiele aus der Never Settle Space Aktion kostenlos aussuchen dürft und zusätzlich bekommt Ihr ab sofort Sid Meier''s Civilization: Beyond Earth kostenlos dazu.\r\n\r\nMehr Infos findet Ihr hier: <a href="https://www.amd4u.com/civilizationpromo/">https://www.amd4u.com/civilizationpromo/</a>', '2014-11-06 03:36:58', '2014-11-06 03:42:08');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `news`
--
ALTER TABLE `news`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `news`
--
ALTER TABLE `news`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
