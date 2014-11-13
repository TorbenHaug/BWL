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
-- Tabellenstruktur für Tabelle `articles`
--

CREATE TABLE IF NOT EXISTS `articles` (
`id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `price` float DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `photo_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo_file_size` int(11) DEFAULT NULL,
  `photo_updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `articles`
--

INSERT INTO `articles` (`id`, `name`, `description`, `price`, `deleted_at`, `created_at`, `updated_at`, `photo_file_name`, `photo_content_type`, `photo_file_size`, `photo_updated_at`) VALUES
(1, '[SET] DELL PowerEdge T20 Xeon E3-1225v3 Mini-Tower Server with Samsung S22D300H 54,61 cm (22 Zoll) LED-Monitor', 'Der PowerEdge T20 Server überzeugt mit umfangreicher interner Massenspeicherkapazität und starker Leistung. Sein Minitower-Gehäuse ist für einen leisen, effizienten und unterbrechungsfreien Betrieb ausgelegt. Mit dem T20 können Sie die Daten und Anwendungen mehrerer Desktop-PCs und Workstations auf einem einzigen Server konsolidieren und so nicht nur die Zusammenarbeit optimieren, sondern auch Ihre Produktivität steigern.', 379, NULL, '2014-11-08 19:00:13', '2014-11-08 19:00:13', 'Bild0-4990341517-024_250.JPG', 'image/jpeg', 5889, '2014-11-08 19:00:45'),
(2, 'DELL PowerEdge T20 Xeon E3-1225v3 Mini-Tower Server', 'Der PowerEdge T20 Server überzeugt mit umfangreicher interner Massenspeicherkapazität und starker Leistung. Sein Minitower-Gehäuse ist für einen leisen, effizienten und unterbrechungsfreien Betrieb ausgelegt. Mit dem T20 können Sie die Daten und Anwendungen mehrerer Desktop-PCs und Workstations auf einem einzigen Server konsolidieren und so nicht nur die Zusammenarbeit optimieren, sondern auch Ihre Produktivität steigern.', 299, NULL, '2014-11-08 19:00:13', '2014-11-08 19:00:13', 'Bild0-4990341517-024_250.JPG', 'image/jpeg', 5889, '2014-11-08 19:01:05'),
(3, 'Samsung S22D300H 54,61 cm (22 Zoll) LED-Monitor', 'Der neuen Samsung Monitore S22D300H überzeugen durch sein schlichtes, klassisches Design in schwarz-glänzender Klavierlack-Optik. Darüber hinaus verfügt er über einen HDMI- und VGA-Anschluss, sowie praktische Features: MagicUpscale ermöglicht durch einen intelligenten Algorithmus qualitativ hochwertiges Upscaling von Bildinhalten. Ist die Funktion aktiviert, sehen auch Bildinhalte in geringerer Auflösung nahezu so perfekt aus als würden sie in nativer Full-HD-Qualität zur Verfügung stehen. Die Eco Saving-Funktion ermöglicht Energiesparen auf Knopfdruck durch Anpassung der Bildhelligkeit. Selbstredend sind alle Modelle Windows 8 kompatibel.', 99, NULL, '2014-11-08 19:00:13', '2014-11-08 19:00:13', '51bN-tSYpKL.jpg', 'image/jpeg', 34770, '2014-11-08 19:01:46'),
(4, 'Acer Aspire XC-605 DT.STEEG.084 PC i7-4790 8GB 1TB SSHD', 'Aufgaben erledigen, Programme ansehen, gelegentlich ein Spiel spielen und mit Freunden in Kontakt bleiben: All dies lässt sich ganz einfach mit einem Intel® Core™-Prozessor bis zur dritten Generation oder einem neuen AMD-Prozessor und Grafikprozessoren bewerkstelligen, die von integrierten Intel® HD-Grafikkarten bis hin zu diskreten NVIDIA® GeForce®- oder AMD Radeon™-Karten reichen.', 499, NULL, '2014-11-08 19:00:14', '2014-11-08 19:00:14', 'Bild0-5368541137-09N_250.JPG', 'image/jpeg', 4850, '2014-11-08 19:02:48'),
(5, 'Lenovo IdeaCentre H500s 57324437 PC J1750 4GB 500GB', 'Der platzsparende und zuverlässige Lenovo H500s verbindet neueste Prozessortechnologie mit erstklassiger Multimedialeistung und großer Speicherkapazität – und ist so ideal für Heimcomputer-Anwendungen.', 159, NULL, '2014-11-08 19:00:14', '2014-11-08 19:00:14', 'middleH520s_right.jpg', 'image/jpeg', 6322, '2014-11-08 19:03:19'),
(6, 'Asus P9D WS Intel® C226', 'Das Asus P9D WS-Mainboard ist mit dem neuen Intel C226-Chipsatz ausgestattet und unterstützt Intel Xeon E3-1200 v3- sowie Core-Prozessoren der vierten Generation. Das Asus P9D WS ist voll ISV-zertifiziert (Independent Software Vendor) und wurde speziell für Workstations sowie High-End-Desktop-PC-Systeme entwickelt und verfügt über eine breite Speicherkompatibilität. Es ist mit dem Asus Dr. Power-Dienstprogramm ausgestattet, welches den Status von Netzteilen überwacht, um plötzlichen Systemausfällen vorzubeugen. Außerdem verfügt es über eine Vielzahl an Schnittstellen inklusive mehrerer Schnittstellen für Monitore.', 0, NULL, '2014-11-08 19:00:14', '2014-11-08 19:00:14', 'P_500.jpg.png', 'image/png', 177454, '2014-11-08 19:04:02'),
(7, 'Intel Xeon E3-1225 v3', 'Die Intel Xeon Prozessoren zeichnen sich durch neue, innovative Technologien wie die Hyper-Threading-Technologie und die Intel NetBurst Mikroarchitektur aus. Sie bieten hervorragende Leistungs- und Funktionseigenschaften mit genügend Spielraum für aktuelle und kommende Server- und Workstation-Plattformen. Bedeutende Weiterentwicklungen der Plattform, die besonderen Leistungseigenschaften und ein außergewöhnliches Preis-Leistungs-Verhältnis machen es gerade jetzt sinnvoll, von älteren Systemen auf die aktuelle Technologie aufzurüsten und damit Vorteile im Wettbewerb zu erzielen.', 0, NULL, '2014-11-08 19:00:14', '2014-11-08 19:00:14', '954066.jpg', 'image/jpeg', 30900, '2014-11-08 19:04:46'),
(8, 'Crucial CT2KIT51264BA160B 8GB 4GB 240-pin DDR3 1600mhz non-ECC', 'Crucial 8GB KIT (4GBX2) DDR3 1600 MT/S, 4GB, 240-pin DIMM, DDR3 PC3-12800, 1600MHz, Non-ECC, CL11, 1.5V ', 0, NULL, '2014-11-08 19:00:14', '2014-11-08 19:00:14', '692374.jpg', 'image/jpeg', 42604, '2014-11-08 19:05:33'),
(9, '[BUNDLE] Asus P9D WS Intel® C226 with Intel Xeon E3-1225 v3', 'Mainboard / CPU Bundles sind ideal als Grundgerüst für ein individuell gestaltetes PC-System geeignet. Darüber hinaus stellen Sie eine erstklassige Möglichkeit dar, um einem bestehenden PC-System ein Upgrade mit neuer, leistungsstarker Technik zu verschaffen. Unsere Mainboard / CPU Bundles werden mit den Komponenten CPU, passendem Kühler und Mainboard sowie dem notwendigen Zubehör wie Schrauben, Kabel und Bedienungsanleitung ausgeliefert!', 0, NULL, '2014-11-08 19:00:14', '2014-11-08 19:00:14', 'P_500.jpg.png', 'image/png', 177454, '2014-11-08 19:05:48');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `article_structures`
--

CREATE TABLE IF NOT EXISTS `article_structures` (
  `amount` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `upper_part_id` int(11) NOT NULL DEFAULT '0',
  `lower_part_id` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `article_structures`
--

INSERT INTO `article_structures` (`amount`, `deleted_at`, `upper_part_id`, `lower_part_id`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 2, '2014-11-08 19:00:15', '2014-11-08 19:00:15'),
(1, NULL, 1, 3, '2014-11-08 19:00:15', '2014-11-08 19:00:15'),
(1, NULL, 2, 9, '2014-11-08 19:00:15', '2014-11-08 19:00:15'),
(1, NULL, 9, 6, '2014-11-08 19:00:16', '2014-11-08 19:00:16'),
(1, NULL, 9, 7, '2014-11-08 19:00:15', '2014-11-08 19:00:15'),
(2, NULL, 9, 8, '2014-11-08 19:00:16', '2014-11-08 19:00:16');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `article_to_tags`
--

CREATE TABLE IF NOT EXISTS `article_to_tags` (
`id` int(11) NOT NULL,
  `article_id` int(11) DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `article_to_tags`
--

INSERT INTO `article_to_tags` (`id`, `article_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2014-11-08 19:00:13', '2014-11-08 19:00:13'),
(3, 3, 3, '2014-11-08 19:00:13', '2014-11-08 19:00:13'),
(4, 4, 2, '2014-11-08 19:00:14', '2014-11-08 19:00:14'),
(5, 5, 2, '2014-11-08 19:00:14', '2014-11-08 19:00:14'),
(6, 6, 5, '2014-11-08 19:00:14', '2014-11-08 19:00:14'),
(7, 7, 6, '2014-11-08 19:00:14', '2014-11-08 19:00:14'),
(8, 8, 7, '2014-11-08 19:00:15', '2014-11-08 19:00:15'),
(9, 9, 4, '2014-11-08 19:00:15', '2014-11-08 19:00:15'),
(15, 9, 9, '2014-11-13 08:59:23', '2014-11-13 08:59:23'),
(16, 6, 9, '2014-11-13 08:59:53', '2014-11-13 08:59:53'),
(17, 7, 9, '2014-11-13 09:00:12', '2014-11-13 09:00:12'),
(18, 8, 9, '2014-11-13 09:00:19', '2014-11-13 09:00:19'),
(19, 2, 10, '2014-11-13 09:01:05', '2014-11-13 09:01:05'),
(20, 4, 10, '2014-11-13 09:01:44', '2014-11-13 09:01:44'),
(21, 2, 8, '2014-11-13 09:01:58', '2014-11-13 09:01:58'),
(22, 5, 10, '2014-11-13 09:02:10', '2014-11-13 09:02:10');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bills`
--

CREATE TABLE IF NOT EXISTS `bills` (
`id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bill_entries`
--

CREATE TABLE IF NOT EXISTS `bill_entries` (
  `amount` int(11) DEFAULT NULL,
  `bill_id` int(11) NOT NULL DEFAULT '0',
  `article_id` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `menus`
--

CREATE TABLE IF NOT EXISTS `menus` (
`id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `super_menu_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `menus`
--

INSERT INTO `menus` (`id`, `name`, `super_menu_id`, `created_at`, `updated_at`) VALUES
(1, ' Komplettpakete', NULL, '2014-11-08 19:00:10', '2014-11-12 18:40:54'),
(2, 'Desktop-PCs', 10, '2014-11-08 19:00:11', '2014-11-13 08:44:16'),
(3, 'Monitore', NULL, '2014-11-08 19:00:11', '2014-11-08 19:00:11'),
(4, 'Mainboard-Bundles', 12, '2014-11-08 19:00:11', '2014-11-13 08:47:13'),
(5, 'Mainboards', 12, '2014-11-08 19:00:12', '2014-11-13 08:46:56'),
(6, 'CPUs', 12, '2014-11-08 19:00:12', '2014-11-13 08:45:56'),
(7, 'Arbeitsspeicher', 12, '2014-11-08 19:00:12', '2014-11-13 08:46:20'),
(10, 'PC-Systeme', NULL, '2014-11-13 08:41:51', '2014-11-13 08:58:10'),
(11, 'Server', 10, '2014-11-13 08:42:40', '2014-11-13 08:44:56'),
(12, 'PC-Zubehör', NULL, '2014-11-13 08:45:34', '2014-11-13 08:57:51');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `menu_to_tags`
--

CREATE TABLE IF NOT EXISTS `menu_to_tags` (
`id` int(11) NOT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `menu_to_tags`
--

INSERT INTO `menu_to_tags` (`id`, `menu_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(2, 2, 2, '2014-11-08 19:00:11', '2014-11-08 19:00:11'),
(3, 3, 3, '2014-11-08 19:00:11', '2014-11-08 19:00:11'),
(4, 4, 4, '2014-11-08 19:00:12', '2014-11-08 19:00:12'),
(5, 5, 5, '2014-11-08 19:00:12', '2014-11-08 19:00:12'),
(6, 6, 6, '2014-11-08 19:00:12', '2014-11-08 19:00:12'),
(7, 7, 7, '2014-11-08 19:00:13', '2014-11-08 19:00:13'),
(8, 1, 1, '2014-11-12 17:46:59', '2014-11-12 17:46:59'),
(15, 9, 4, '2014-11-13 07:26:40', '2014-11-13 07:26:40'),
(16, 11, 8, '2014-11-13 08:44:55', '2014-11-13 08:44:55'),
(17, 12, 9, '2014-11-13 08:57:51', '2014-11-13 08:57:51'),
(18, 10, 10, '2014-11-13 08:58:10', '2014-11-13 08:58:10'),
(19, 13, 1, '2014-11-13 18:13:49', '2014-11-13 18:13:49'),
(20, 13, 2, '2014-11-13 18:13:49', '2014-11-13 18:13:49'),
(21, 13, 4, '2014-11-13 18:13:49', '2014-11-13 18:13:49'),
(22, 17, 1, '2014-11-13 18:45:23', '2014-11-13 18:45:23');

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

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `schema_migrations`
--

CREATE TABLE IF NOT EXISTS `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `schema_migrations`
--

INSERT INTO `schema_migrations` (`version`) VALUES
('20141107163839'),
('20141107163900'),
('20141107163911'),
('20141107163922'),
('20141107163932'),
('20141107170135'),
('20141107193902'),
('20141107195915'),
('20141107235123'),
('20141108130337'),
('20141108160358'),
('20141108173858'),
('20141108202351');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `shopping_cart_entries`
--

CREATE TABLE IF NOT EXISTS `shopping_cart_entries` (
  `amount` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `article_id` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tags`
--

CREATE TABLE IF NOT EXISTS `tags` (
`id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `tags`
--

INSERT INTO `tags` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Komplettpakete', '2014-11-08 19:00:10', '2014-11-08 19:00:10'),
(2, 'Desktop-PCs', '2014-11-08 19:00:11', '2014-11-08 19:00:11'),
(3, 'Monitore', '2014-11-08 19:00:11', '2014-11-08 19:00:11'),
(4, 'Mainboard-Bundles', '2014-11-08 19:00:11', '2014-11-08 19:00:11'),
(5, 'Mainboards', '2014-11-08 19:00:12', '2014-11-08 19:00:12'),
(6, 'CPUs', '2014-11-08 19:00:12', '2014-11-08 19:00:12'),
(7, 'Arbeitsspeicher', '2014-11-08 19:00:12', '2014-11-08 19:00:12'),
(8, 'Server', '2014-11-13 08:39:59', '2014-11-13 08:39:59'),
(9, 'PC-Zubehör', '2014-11-13 08:57:03', '2014-11-13 08:57:03'),
(10, 'PC-Systeme', '2014-11-13 08:57:22', '2014-11-13 08:57:22');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id` int(11) NOT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_digest` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_digest` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_digest`, `remember_digest`, `role`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Ad', 'min', 'ad@min.de', '$2a$10$fi89k1seSk6RZnkXva.FcOGTIXpQ8ggkKCdgEHjw/u8cizp2BjBfW', NULL, 0, NULL, '2014-11-08 19:00:16', '2014-11-12 02:04:05'),
(4, 'Torben', 'Haug', 'torbenhaug@freenet.de', '$2a$10$ffcHO.Xxv8MPIt2MOYzM7OR4NZDlZuusZVZHTkziWCbYB6LPEPDyy', NULL, 100, NULL, '2014-11-12 11:53:47', '2014-11-12 11:55:07'),
(5, 'Torben', 'Haug', 'claustorben.haug@haw-hamburg.de', '$2a$10$WG9MFpEj8hZIt1eiIg1MT.QQlUUP6XHyGr0/Nxn3FIaOSTbGDiim.', NULL, 100, NULL, '2014-11-12 11:56:20', '2014-11-12 11:56:20'),
(6, 'Andreas', 'Berks', 'andreas.berks@haw-hamburg.de', '$2a$10$IgCZPanvP6fSpp.75YcWZ.ouOReox/y47BEmpHQuEBUnFRx94.ZF.', NULL, 100, NULL, '2014-11-13 22:54:03', '2014-11-13 22:54:03');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `articles`
--
ALTER TABLE `articles`
 ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `article_structures`
--
ALTER TABLE `article_structures`
 ADD PRIMARY KEY (`upper_part_id`,`lower_part_id`);

--
-- Indizes für die Tabelle `article_to_tags`
--
ALTER TABLE `article_to_tags`
 ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `bills`
--
ALTER TABLE `bills`
 ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `bill_entries`
--
ALTER TABLE `bill_entries`
 ADD PRIMARY KEY (`bill_id`,`article_id`);

--
-- Indizes für die Tabelle `menus`
--
ALTER TABLE `menus`
 ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `menu_to_tags`
--
ALTER TABLE `menu_to_tags`
 ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `news`
--
ALTER TABLE `news`
 ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `schema_migrations`
--
ALTER TABLE `schema_migrations`
 ADD UNIQUE KEY `unique_schema_migrations` (`version`);

--
-- Indizes für die Tabelle `shopping_cart_entries`
--
ALTER TABLE `shopping_cart_entries`
 ADD PRIMARY KEY (`user_id`,`article_id`);

--
-- Indizes für die Tabelle `tags`
--
ALTER TABLE `tags`
 ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `articles`
--
ALTER TABLE `articles`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT für Tabelle `article_to_tags`
--
ALTER TABLE `article_to_tags`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT für Tabelle `bills`
--
ALTER TABLE `bills`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `menus`
--
ALTER TABLE `menus`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT für Tabelle `menu_to_tags`
--
ALTER TABLE `menu_to_tags`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT für Tabelle `news`
--
ALTER TABLE `news`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT für Tabelle `tags`
--
ALTER TABLE `tags`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT für Tabelle `users`
--
ALTER TABLE `users`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
