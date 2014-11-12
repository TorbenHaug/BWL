-- phpMyAdmin SQL Dump
-- version 4.2.10
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Erstellungszeit: 12. Nov 2014 um 07:16
-- Server Version: 5.5.39-MariaDB-0ubuntu0.14.04.1
-- PHP-Version: 5.5.9-1ubuntu4.4

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `articles`
--

INSERT INTO `articles` (`id`, `name`, `description`, `price`, `deleted_at`, `created_at`, `updated_at`, `photo_file_name`, `photo_content_type`, `photo_file_size`, `photo_updated_at`) VALUES
(1, '[SET] DELL PowerEdge T20 Xeon E3-1225v3 Mini-Tower Server with Samsung S22D300H 54,61 cm (22 Zoll) LED-Monitor', 'Der PowerEdge T20 Server überzeugt mit umfangreicher interner Massenspeicherkapazität und starker Leistung. Sein Minitower-Gehäuse ist für einen leisen, effizienten und unterbrechungsfreien Betrieb ausgelegt. Mit dem T20 können Sie die Daten und Anwendungen mehrerer Desktop-PCs und Workstations auf einem einzigen Server konsolidieren und so nicht nur die Zusammenarbeit optimieren, sondern auch Ihre Produktivität steigern.', 379, '2014-11-08 19:00:00', '2014-11-08 19:00:13', '2014-11-08 19:00:45', 'Bild0-4990341517-024_250.JPG', 'image/jpeg', 5889, '2014-11-08 19:00:45'),
(2, 'DELL PowerEdge T20 Xeon E3-1225v3 Mini-Tower Server', 'Der PowerEdge T20 Server überzeugt mit umfangreicher interner Massenspeicherkapazität und starker Leistung. Sein Minitower-Gehäuse ist für einen leisen, effizienten und unterbrechungsfreien Betrieb ausgelegt. Mit dem T20 können Sie die Daten und Anwendungen mehrerer Desktop-PCs und Workstations auf einem einzigen Server konsolidieren und so nicht nur die Zusammenarbeit optimieren, sondern auch Ihre Produktivität steigern.', 299, '2014-11-08 19:01:00', '2014-11-08 19:00:13', '2014-11-08 19:01:05', 'Bild0-4990341517-024_250.JPG', 'image/jpeg', 5889, '2014-11-08 19:01:05'),
(3, 'Samsung S22D300H 54,61 cm (22 Zoll) LED-Monitor', 'Der neuen Samsung Monitore S22D300H überzeugen durch sein schlichtes, klassisches Design in schwarz-glänzender Klavierlack-Optik. Darüber hinaus verfügt er über einen HDMI- und VGA-Anschluss, sowie praktische Features: MagicUpscale ermöglicht durch einen intelligenten Algorithmus qualitativ hochwertiges Upscaling von Bildinhalten. Ist die Funktion aktiviert, sehen auch Bildinhalte in geringerer Auflösung nahezu so perfekt aus als würden sie in nativer Full-HD-Qualität zur Verfügung stehen. Die Eco Saving-Funktion ermöglicht Energiesparen auf Knopfdruck durch Anpassung der Bildhelligkeit. Selbstredend sind alle Modelle Windows 8 kompatibel.', 99, '2014-11-08 19:01:00', '2014-11-08 19:00:13', '2014-11-08 19:01:47', '51bN-tSYpKL.jpg', 'image/jpeg', 34770, '2014-11-08 19:01:46'),
(4, 'Acer Aspire XC-605 DT.STEEG.084 PC i7-4790 8GB 1TB SSHD', 'Aufgaben erledigen, Programme ansehen, gelegentlich ein Spiel spielen und mit Freunden in Kontakt bleiben: All dies lässt sich ganz einfach mit einem Intel® Core™-Prozessor bis zur dritten Generation oder einem neuen AMD-Prozessor und Grafikprozessoren bewerkstelligen, die von integrierten Intel® HD-Grafikkarten bis hin zu diskreten NVIDIA® GeForce®- oder AMD Radeon™-Karten reichen.', 499, '2014-11-08 19:02:00', '2014-11-08 19:00:14', '2014-11-08 19:02:48', 'Bild0-5368541137-09N_250.JPG', 'image/jpeg', 4850, '2014-11-08 19:02:48'),
(5, 'Lenovo IdeaCentre H500s 57324437 PC J1750 4GB 500GB', 'Der platzsparende und zuverlässige Lenovo H500s verbindet neueste Prozessortechnologie mit erstklassiger Multimedialeistung und großer Speicherkapazität – und ist so ideal für Heimcomputer-Anwendungen.', 159, '2014-11-08 19:03:00', '2014-11-08 19:00:14', '2014-11-08 19:03:19', 'middleH520s_right.jpg', 'image/jpeg', 6322, '2014-11-08 19:03:19'),
(6, 'Asus P9D WS Intel® C226', 'Das Asus P9D WS-Mainboard ist mit dem neuen Intel C226-Chipsatz ausgestattet und unterstützt Intel Xeon E3-1200 v3- sowie Core-Prozessoren der vierten Generation. Das Asus P9D WS ist voll ISV-zertifiziert (Independent Software Vendor) und wurde speziell für Workstations sowie High-End-Desktop-PC-Systeme entwickelt und verfügt über eine breite Speicherkompatibilität. Es ist mit dem Asus Dr. Power-Dienstprogramm ausgestattet, welches den Status von Netzteilen überwacht, um plötzlichen Systemausfällen vorzubeugen. Außerdem verfügt es über eine Vielzahl an Schnittstellen inklusive mehrerer Schnittstellen für Monitore.', 0, '2014-11-08 19:03:00', '2014-11-08 19:00:14', '2014-11-08 19:04:02', 'P_500.jpg.png', 'image/png', 177454, '2014-11-08 19:04:02'),
(7, 'Intel Xeon E3-1225 v3', 'Die Intel Xeon Prozessoren zeichnen sich durch neue, innovative Technologien wie die Hyper-Threading-Technologie und die Intel NetBurst Mikroarchitektur aus. Sie bieten hervorragende Leistungs- und Funktionseigenschaften mit genügend Spielraum für aktuelle und kommende Server- und Workstation-Plattformen. Bedeutende Weiterentwicklungen der Plattform, die besonderen Leistungseigenschaften und ein außergewöhnliches Preis-Leistungs-Verhältnis machen es gerade jetzt sinnvoll, von älteren Systemen auf die aktuelle Technologie aufzurüsten und damit Vorteile im Wettbewerb zu erzielen.', 0, '2014-11-08 19:04:00', '2014-11-08 19:00:14', '2014-11-08 19:04:47', '954066.jpg', 'image/jpeg', 30900, '2014-11-08 19:04:46'),
(8, 'Crucial CT2KIT51264BA160B 8GB 4GB 240-pin DDR3 1600mhz non-ECC', 'Crucial 8GB KIT (4GBX2) DDR3 1600 MT/S, 4GB, 240-pin DIMM, DDR3 PC3-12800, 1600MHz, Non-ECC, CL11, 1.5V ', 0, '2014-11-08 19:04:00', '2014-11-08 19:00:14', '2014-11-08 19:05:33', '692374.jpg', 'image/jpeg', 42604, '2014-11-08 19:05:33'),
(9, '[BUNDLE] Asus P9D WS Intel® C226 with Intel Xeon E3-1225 v3', 'Mainboard / CPU Bundles sind ideal als Grundgerüst für ein individuell gestaltetes PC-System geeignet. Darüber hinaus stellen Sie eine erstklassige Möglichkeit dar, um einem bestehenden PC-System ein Upgrade mit neuer, leistungsstarker Technik zu verschaffen. Unsere Mainboard / CPU Bundles werden mit den Komponenten CPU, passendem Kühler und Mainboard sowie dem notwendigen Zubehör wie Schrauben, Kabel und Bedienungsanleitung ausgeliefert!', 0, '2014-11-08 19:05:00', '2014-11-08 19:00:15', '2014-11-08 19:05:48', 'P_500.jpg.png', 'image/png', 177454, '2014-11-08 19:05:48');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `articles`
--
ALTER TABLE `articles`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `articles`
--
ALTER TABLE `articles`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
