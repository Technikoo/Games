-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Erstellungszeit: 20. Dez 2022 um 18:10
-- Server-Version: 8.0.31-0ubuntu0.22.04.1
-- PHP-Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Datenbank: `GyleInf`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Klasse`
--

CREATE TABLE `Klasse` (
  `ID` mediumint NOT NULL,
  `Name` varchar(10) NOT NULL,
  `Raum` varchar(10) NOT NULL,
  `LehrerID` mediumint NOT NULL
) ENGINE=InnoDB ;

--
-- Daten für Tabelle `Klasse`
--

INSERT INTO `Klasse` (`ID`, `Name`, `Raum`, `LehrerID`) VALUES
(1, '6a', 'A301', 10),
(2, '6b', 'A302', 11),
(3, '9a', 'C104', 13),
(4, '9b', 'C106', 14),
(5, '9c', 'C108', 15),
(6, '7a', 'C101', 20),
(7, '7b', 'C102', 21),
(8, 'S3NAT', 'H400', 30),
(9, 'S3KUN', 'H404', 32),
(10, 'S3BIO', 'H401', 31),
(11, 'S1BIO', 'H301', 36),
(12, 'S1NAT', 'H300', 40),
(13, '8a', 'A101', 38),
(14, '8b', 'A102', 33);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Kurs`
--

CREATE TABLE `Kurs` (
  `ID` mediumint NOT NULL,
  `Name` varchar(20) NOT NULL,
  `LehrerID` smallint NOT NULL
) ENGINE=InnoDB ;

--
-- Daten für Tabelle `Kurs`
--

INSERT INTO `Kurs` (`ID`, `Name`, `LehrerID`) VALUES
(1, 'Keramik 101', 27),
(2, 'Keramik 102', 2),
(3, 'Griechisch 1', 37),
(4, 'Griechisch 2', 9),
(5, 'Mathe +', 34),
(6, 'Informatik 1', 16),
(7, 'Informatik 2', 40),
(8, 'AVM 101', 2),
(9, 'AVM 102', 7),
(10, 'Literatur', 26),
(11, 'AltGirechisch', 9),
(12, 'Theater', 31),
(13, 'Acapella', 21),
(14, 'Handwerken', 27),
(15, 'Art&Design', 33),
(16, 'JazzDance', 31),
(17, 'Yoga', 15),
(18, 'Englisch Förder', 6),
(19, 'Englisch +', 6),
(20, 'Rudern', 38),
(21, 'Volleyball', 38),
(22, 'Calligraphy', 22),
(23, 'Deutsch Gedichte', 3),
(24, 'Deutsch Lyrik', 3),
(25, 'Deutsch Poesie', 3),
(26, 'UmweltSchutz', 13),
(27, 'Öko-Bauen', 13),
(28, 'Biologische LWS', 13),
(29, 'Bio und Trade Fair', 13);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `KursSchueler`
--

CREATE TABLE `KursSchueler` (
  `KursID` mediumint NOT NULL,
  `SchuelerID` mediumint NOT NULL,
  `Note` int DEFAULT NULL
) ENGINE=InnoDB ;

--
-- Daten für Tabelle `KursSchueler`
--

INSERT INTO `KursSchueler` (`KursID`, `SchuelerID`, `Note`) VALUES
(1, 8, 11),
(1, 14, 8),
(1, 20, 7),
(1, 24, 4),
(1, 38, 4),
(1, 41, 6),
(1, 44, 7),
(1, 60, 15),
(1, 76, 12),
(1, 83, 3),
(1, 94, 3),
(1, 116, 4),
(1, 132, 15),
(1, 175, 8),
(1, 179, 7),
(1, 186, 9),
(2, 8, 7),
(2, 14, 9),
(2, 21, 12),
(2, 25, 1),
(2, 39, 8),
(2, 44, 7),
(2, 47, 4),
(2, 57, 10),
(2, 132, 12),
(2, 135, 3),
(2, 139, 12),
(2, 142, 7),
(2, 146, 13),
(2, 153, 14),
(2, 164, 9),
(2, 173, 5),
(2, 179, 5),
(2, 181, 8),
(2, 186, 6),
(2, 192, 7),
(3, 49, 10),
(3, 50, 8),
(3, 62, 5),
(3, 66, 3),
(3, 69, 6),
(3, 72, 11),
(3, 74, 5),
(3, 96, 13),
(3, 100, 5),
(3, 104, 7),
(3, 108, 6),
(3, 112, 10),
(3, 114, 7),
(3, 120, 15),
(3, 121, 8),
(3, 125, 7),
(3, 178, 3),
(4, 1, 3),
(4, 6, 6),
(4, 17, 6),
(4, 30, 8),
(4, 53, 5),
(4, 58, 15),
(4, 68, 2),
(4, 79, 8),
(4, 85, 10),
(4, 93, 15),
(4, 102, 4),
(4, 130, 8),
(4, 144, 4),
(4, 149, 5),
(4, 160, 12),
(4, 167, 8),
(4, 171, 11),
(4, 183, 5),
(4, 196, 4),
(5, 2, 2),
(5, 26, 6),
(5, 32, 4),
(5, 35, 9),
(5, 59, 5),
(5, 81, 13),
(5, 99, 3),
(5, 138, 11),
(5, 145, 15),
(5, 158, 15),
(5, 177, 8),
(5, 184, 15),
(5, 200, 9),
(6, 4, 9),
(6, 13, 10),
(6, 28, 3),
(6, 36, 7),
(6, 46, 8),
(6, 49, 10),
(6, 50, 7),
(6, 62, 6),
(6, 66, 6),
(6, 69, 7),
(6, 72, 14),
(6, 74, 7),
(6, 96, 11),
(6, 100, 5),
(6, 104, 6),
(6, 108, 4),
(6, 112, 9),
(6, 114, 8),
(7, 43, 10),
(7, 61, 13),
(7, 68, 9),
(7, 78, 9),
(7, 79, 7),
(7, 80, 8),
(7, 86, 12),
(7, 93, 11),
(7, 101, 12),
(7, 129, 5),
(7, 130, 9),
(7, 131, 15),
(7, 134, 13),
(7, 149, 10),
(7, 171, 12),
(8, 7, 3),
(8, 9, 6),
(8, 51, 7),
(8, 52, 3),
(8, 103, 9),
(8, 107, 1),
(8, 113, 3),
(8, 116, 7),
(8, 154, 5),
(8, 166, 8),
(8, 173, 10),
(8, 175, 9),
(9, 18, 7),
(9, 30, 7),
(9, 55, 3),
(9, 58, 11),
(9, 75, 7),
(9, 85, 15),
(9, 97, 9),
(9, 105, 12),
(9, 147, 6),
(9, 150, 7),
(9, 160, 5),
(9, 165, 15),
(9, 169, 13),
(9, 170, 4),
(10, 8, 6),
(10, 14, 8),
(10, 21, 15),
(10, 25, 1),
(10, 39, 4),
(10, 44, 4),
(10, 52, 4),
(10, 116, 0),
(10, 119, 1),
(10, 124, 10),
(10, 135, 4),
(10, 139, 8),
(10, 142, 11),
(10, 146, 14),
(10, 153, 15),
(10, 164, 10),
(10, 173, 11),
(10, 175, 7),
(10, 179, 8),
(10, 181, 9),
(10, 186, 7),
(11, 12, 15),
(11, 20, 9),
(11, 24, 4),
(11, 38, 3),
(11, 41, 6),
(11, 52, 0),
(11, 136, 8),
(11, 141, 9),
(11, 143, 1),
(11, 151, 10),
(11, 154, 5),
(11, 166, 6),
(11, 175, 12),
(11, 180, 2),
(11, 185, 14),
(11, 190, 10),
(11, 195, 7),
(12, 11, 15),
(12, 18, 7),
(12, 37, 12),
(12, 55, 7),
(12, 61, 7),
(12, 75, 12),
(12, 80, 6),
(12, 86, 11),
(12, 97, 13),
(12, 105, 12),
(12, 131, 10),
(12, 147, 5),
(12, 150, 7),
(12, 163, 4),
(12, 169, 15),
(12, 172, 10),
(12, 193, 4),
(12, 197, 2),
(13, 15, 8),
(13, 22, 11),
(13, 43, 13),
(13, 56, 11),
(13, 63, 2),
(13, 78, 8),
(13, 82, 13),
(13, 90, 14),
(13, 101, 7),
(13, 129, 7),
(13, 134, 10),
(13, 148, 11),
(13, 156, 4),
(13, 165, 13),
(13, 170, 11),
(13, 174, 15),
(13, 194, 15),
(13, 199, 8),
(14, 3, 14),
(14, 27, 12),
(14, 33, 6),
(14, 48, 7),
(14, 71, 4),
(14, 91, 10),
(14, 133, 12),
(14, 140, 11),
(14, 155, 9),
(14, 162, 9),
(15, 12, 13),
(15, 20, 9),
(15, 24, 4),
(15, 38, 6),
(15, 41, 9),
(15, 47, 2),
(15, 113, 0),
(15, 118, 13),
(15, 122, 0),
(15, 132, 15),
(15, 136, 2),
(15, 141, 3),
(15, 143, 8),
(15, 151, 7),
(15, 154, 3),
(15, 166, 2),
(15, 180, 6),
(15, 185, 15),
(16, 22, 13),
(16, 53, 2),
(16, 56, 10),
(16, 63, 0),
(16, 82, 15),
(16, 90, 13),
(16, 102, 5),
(16, 144, 4),
(16, 148, 9),
(16, 156, 10),
(16, 163, 7),
(16, 167, 11),
(17, 2, 5),
(17, 3, 9),
(17, 23, 12),
(17, 27, 5),
(17, 32, 2),
(17, 33, 4),
(17, 45, 5),
(17, 48, 3),
(17, 71, 2),
(17, 88, 15),
(17, 91, 11),
(17, 110, 14),
(17, 133, 11),
(17, 145, 12),
(17, 158, 14),
(17, 162, 11),
(17, 200, 13),
(18, 19, 14),
(18, 26, 4),
(18, 29, 14),
(18, 31, 7),
(18, 35, 14),
(18, 40, 11),
(18, 59, 8),
(18, 70, 2),
(18, 81, 9),
(18, 98, 8),
(18, 99, 6),
(18, 138, 14),
(18, 140, 8),
(18, 155, 5),
(18, 177, 8),
(18, 184, 11),
(19, 7, 8),
(19, 10, 11),
(19, 34, 11),
(19, 42, 5),
(19, 64, 15),
(19, 67, 6),
(19, 87, 7),
(19, 107, 2),
(19, 109, 5),
(19, 117, 3),
(19, 126, 5),
(19, 137, 11),
(19, 152, 9),
(19, 161, 12),
(19, 168, 4),
(19, 187, 3),
(20, 9, 6),
(20, 16, 13),
(20, 51, 10),
(20, 54, 7),
(20, 65, 6),
(20, 73, 12),
(20, 103, 8),
(20, 115, 9),
(20, 123, 12),
(20, 127, 7),
(20, 128, 13),
(20, 157, 2),
(20, 159, 6),
(20, 176, 15),
(20, 189, 7),
(20, 198, 8),
(21, 13, 4),
(21, 36, 2),
(21, 49, 10),
(21, 62, 5),
(21, 69, 5),
(21, 72, 15),
(21, 96, 12),
(21, 104, 10),
(21, 114, 8),
(21, 120, 9),
(21, 178, 8),
(21, 188, 7),
(21, 191, 13),
(22, 4, 5),
(22, 28, 5),
(22, 46, 14),
(22, 50, 4),
(22, 66, 7),
(22, 74, 0),
(22, 100, 9),
(22, 108, 0),
(22, 112, 14),
(22, 121, 8),
(22, 125, 2),
(22, 182, 7),
(23, 12, 14),
(23, 20, 5),
(23, 25, 3),
(23, 52, 0),
(23, 76, 11),
(23, 77, 15),
(23, 83, 2),
(23, 95, 4),
(23, 116, 1),
(23, 124, 15),
(23, 132, 11),
(23, 135, 4),
(23, 143, 7),
(23, 154, 4),
(23, 164, 14),
(23, 179, 10),
(23, 180, 5),
(23, 195, 7),
(24, 14, 9),
(24, 21, 15),
(24, 38, 10),
(24, 41, 7),
(24, 57, 9),
(24, 84, 5),
(24, 92, 10),
(24, 106, 2),
(24, 111, 12),
(24, 119, 1),
(24, 136, 8),
(24, 141, 9),
(24, 146, 10),
(24, 153, 13),
(24, 166, 9),
(24, 181, 10),
(24, 185, 10),
(24, 190, 15),
(25, 8, 6),
(25, 24, 5),
(25, 39, 4),
(25, 44, 4),
(25, 47, 5),
(25, 60, 14),
(25, 89, 14),
(25, 94, 7),
(25, 113, 0),
(25, 118, 14),
(25, 122, 4),
(25, 139, 9),
(25, 142, 9),
(25, 151, 5),
(25, 173, 8),
(25, 175, 10),
(25, 186, 8),
(25, 192, 2),
(26, 1, 6),
(26, 6, 5),
(26, 37, 14),
(26, 53, 6),
(26, 75, 10),
(26, 79, 3),
(26, 90, 14),
(26, 130, 5),
(26, 131, 11),
(26, 148, 13),
(26, 183, 3),
(26, 193, 2),
(27, 18, 9),
(27, 43, 15),
(27, 56, 12),
(27, 61, 7),
(27, 93, 15),
(27, 97, 6),
(27, 102, 5),
(27, 134, 15),
(27, 149, 6),
(27, 156, 7),
(27, 196, 7),
(27, 197, 4),
(28, 11, 12),
(28, 22, 14),
(28, 58, 11),
(28, 68, 3),
(28, 80, 12),
(28, 101, 10),
(28, 105, 14),
(28, 163, 4),
(28, 167, 6),
(28, 171, 8),
(28, 172, 9),
(28, 199, 8),
(29, 5, 15),
(29, 15, 4),
(29, 17, 5),
(29, 63, 2),
(29, 78, 6),
(29, 82, 15),
(29, 86, 11),
(29, 129, 6),
(29, 144, 2),
(29, 165, 14),
(29, 174, 14);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Lehrer`
--

CREATE TABLE `Lehrer` (
  `ID` mediumint NOT NULL,
  `Vorname` varchar(255) DEFAULT NULL,
  `Nachname` varchar(255) DEFAULT NULL,
  `GebDatum` varchar(255) DEFAULT NULL,
  `Geschlecht` text,
  `Adresse` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Rolle` varchar(50) DEFAULT NULL
) ENGINE=InnoDB ;

--
-- Daten für Tabelle `Lehrer`
--

INSERT INTO `Lehrer` (`ID`, `Vorname`, `Nachname`, `GebDatum`, `Geschlecht`, `Adresse`, `Email`, `Rolle`) VALUES
(1, 'Zephr', 'Dillon', '1979-08-27', 'f', 'P.O. Box 935, 8067 Posuere St.', 'tortor.dictum.eu@outlook.edu', NULL),
(2, 'Jacqueline', 'Rowland', '1996-11-11', 'f', 'Ap #154-7823 Malesuada St.', 'pede.nec@yahoo.org', 'Ltg. Kunst'),
(3, 'Miranda', 'Compton', '1998-12-20', 'f', '859-2101 Sed Road', 'ut.molestie.in@protonmail.edu', NULL),
(4, 'Genevieve', 'Benson', '1995-12-15', 'f', 'Ap #308-1976 Nulla Rd.', 'phasellus@outlook.couk', NULL),
(5, 'Hermione', 'Knight', '1970-04-12', 'f', '3920 Donec Road', 'odio.aliquam.vulputate@icloud.com', NULL),
(6, 'Teegan', 'Berg', '1978-08-07', 'f', 'P.O. Box 799, 7391 Vel St.', 'bibendum.sed@outlook.com', NULL),
(7, 'Rae', 'Jackson', '1980-04-23', 'f', '132-2026 Cursus. St.', 'sed.libero@aol.ca', NULL),
(8, 'Zena', 'Haley', '1980-08-25', 'f', 'Ap #948-9755 Nibh. Rd.', 'penatibus.et@protonmail.ca', 'Stv. Schulleitung'),
(9, 'Shellie', 'Calhoun', '1957-05-10', 'f', '252-5541 Nibh. Rd.', 'orci@yahoo.com', NULL),
(10, 'Isabella', 'Hampton', '1992-05-16', 'f', '465-915 Cras St.', 'urna.nec.luctus@icloud.edu', NULL),
(11, 'Kirby', 'Ware', '1958-08-01', 'f', 'Ap #998-3466 Ornare, Street', 'mi@protonmail.org', NULL),
(12, 'Robin', 'Peterson', '1977-02-20', 'f', 'Ap #414-4674 Eget Rd.', 'dignissim.magna@aol.org', NULL),
(13, 'Ignacia', 'Davenport', '1996-06-24', 'f', 'P.O. Box 286, 3718 Sed Av.', 'scelerisque.mollis.phasellus@google.ca', NULL),
(14, 'Indira', 'Mckee', '1997-11-25', 'f', '6898 Lobortis Rd.', 'orci@protonmail.couk', 'Ltg. NAT'),
(15, 'Ocean', 'Harrell', '1995-05-28', 'f', 'Ap #699-1553 Est Rd.', 'curabitur.dictum.phasellus@outlook.edu', NULL),
(16, 'Elizabeth', 'Burnett', '1967-11-20', 'f', 'Ap #662-8663 Neque St.', 'sit.amet@outlook.org', NULL),
(17, 'Ben', 'Ayala', '1987-02-25', 'm', '436-9754 Velit. Street', 'volutpat.nulla.facilisis@aol.edu', NULL),
(18, 'Karina', 'Contreras', '1958-05-15', 'f', 'Ap #548-1838 Non, Street', 'venenatis.vel@hotmail.org', NULL),
(19, 'Beverly', 'Gregory', '1989-01-22', 'f', 'Ap #126-1405 Augue Ave', 'nibh@protonmail.ca', NULL),
(20, 'Kylan', 'Castillo', '1982-07-06', 'm', '123-234 Dui St.', 'etiam.imperdiet@google.edu', NULL),
(21, 'Colt', 'Turner', '1987-03-29', 'm', '2074 Nunc. Street', 'porttitor.interdum.sed@hotmail.edu', NULL),
(22, 'Burke', 'Ramsey', '1979-06-26', 'm', 'Ap #550-2017 Nulla. Avenue', 'sed@hotmail.couk', NULL),
(23, 'Justin', 'Mack', '1978-08-30', 'm', '447-3432 Malesuada Av.', 'integer.aliquam@icloud.net', NULL),
(24, 'Rooney', 'Waters', '1977-06-14', 'm', '160-4238 Eu Rd.', 'sed.id@google.edu', 'Koordinator'),
(25, 'Edward', 'Hoover', '1984-02-27', 'm', '6849 Penatibus Street', 'sed@outlook.net', NULL),
(26, 'Fitzgerald', 'Holder', '1990-05-22', 'm', 'Ap #458-3319 Nisi Street', 'mauris.erat@google.ca', 'Vertrauenslehrer'),
(27, 'Solomon', 'Patel', '1963-12-11', 'm', '681-9966 Aliquet Street', 'ut.quam@hotmail.com', NULL),
(28, 'Sean', 'Mooney', '1957-03-16', 'm', '518-6533 Iaculis Street', 'mi@outlook.net', NULL),
(29, 'Kasper', 'Porter', '1995-10-18', 'm', 'Ap #155-2461 Integer St.', 'luctus.felis.purus@outlook.net', NULL),
(30, 'Griffin', 'Orr', '1964-01-19', 'm', 'P.O. Box 379, 2856 Nisl. Street', 'suscipit.nonummy@yahoo.ca', NULL),
(31, 'Ferdinand', 'Eaton', '1967-11-22', 'm', '979-7916 Dolor, Ave', 'sociis.natoque@outlook.com', NULL),
(32, 'Zeph', 'Patrick', '1987-02-26', 'm', 'Ap #921-3839 Orci, St.', 'imperdiet.ullamcorper@google.com', NULL),
(33, 'Keegan', 'Simmons', '1980-12-21', 'm', '1337 Ipsum. St.', 'senectus.et@yahoo.net', NULL),
(34, 'Jerry', 'Cole', '1959-01-22', 'm', 'P.O. Box 154, 3258 Viverra. Road', 'eget.magna@aol.couk', 'Schulleiter'),
(35, 'Harlan', 'Stanley', '1997-12-02', 'm', '613 Turpis Rd.', 'purus.mauris.a@outlook.ca', NULL),
(36, 'Hunter', 'Ford', '1991-04-14', 'm', '187 Iaculis, Rd.', 'eu.accumsan@aol.com', NULL),
(37, 'Harrison', 'Carey', '1986-07-03', 'm', 'Ap #837-3706 Curabitur Avenue', 'neque.tellus.imperdiet@hotmail.ca', 'Ltg. Sprachen'),
(38, 'Hedley', 'Porter', '1997-04-12', 'm', '713 Nulla St.', 'dignissim.lacus@google.com', NULL),
(39, 'Blake', 'Holder', '1978-08-02', 'm', '5223 Libero St.', 'diam.proin.dolor@hotmail.net', NULL),
(40, 'Bruno', 'Swanson', '1970-08-22', 'm', '819-2623 Mus. Rd.', 'lorem.ipsum.dolor@outlook.com', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Schueler`
--

CREATE TABLE `Schueler` (
  `ID` mediumint NOT NULL,
  `Vorname` varchar(255) DEFAULT NULL,
  `Nachname` varchar(255) DEFAULT NULL,
  `GebDatum` varchar(255) DEFAULT NULL,
  `Geschlecht` text ,
  `Adresse` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `KlassenID` mediumint DEFAULT NULL,
  `Lieblingsfach` varchar(255) DEFAULT NULL
) ENGINE=InnoDB ;

--
-- Daten für Tabelle `Schueler`
--

INSERT INTO `Schueler` (`ID`, `Vorname`, `Nachname`, `GebDatum`, `Geschlecht`, `Adresse`, `Email`, `KlassenID`, `Lieblingsfach`) VALUES
(1, 'Dean', 'Knight', '2004-02-02', 'm', '669-4211 Justo Ave', 'odio.etiam@yahoo.net', 8, 'Kunst'),
(2, 'Ulysses', 'Love', '2010-01-30', 'm', 'P.O. Box 411, 1293 Et, St.', 'congue.elit@yahoo.org', 1, 'Sport'),
(3, 'Jarrod', 'Mckay', '2010-09-15', 'm', '2777 Sollicitudin St.', 'sit@outlook.com', 2, 'Sport'),
(4, 'Philip', 'Cantu', '2008-05-06', 'm', '441-150 In, Rd.', 'molestie.sodales@yahoo.couk', 14, 'Bio'),
(5, 'Neil', 'Roberts', '2005-12-02', 'm', '9147 Non Rd.', 'magna.praesent@outlook.net', 12, 'Spanisch'),
(6, 'Sean', 'Stevenson', '2005-04-21', 'm', 'Ap #746-4935 Arcu. Ave', 'morbi@google.ca', 12, 'Chemie'),
(7, 'Gage', 'Riley', '2009-02-26', 'm', '631-694 Natoque St.', 'eleifend.non.dapibus@aol.couk', 6, 'Chemie'),
(8, 'Travis', 'Mcintosh', '2006-06-02', 'm', '753-1850 Aenean Road', 'curae.donec@google.org', 5, 'Bio'),
(9, 'Luke', 'Anderson', '2009-02-17', 'm', 'P.O. Box 289, 3286 A, Rd.', 'laoreet.ipsum@outlook.com', 6, 'Englisch'),
(10, 'Bert', 'Roy', '2009-10-18', 'm', 'Ap #438-2247 Montes, St.', 'sed.auctor@google.ca', 7, 'Sport'),
(11, 'Zeus', 'Christensen', '2004-12-12', 'm', '899-5019 Felis. Ave', 'habitant.morbi@yahoo.couk', 10, 'Bio'),
(12, 'Jerry', 'Benjamin', '2007-10-31', 'm', 'Ap #195-3987 Adipiscing Avenue', 'hendrerit.a.arcu@aol.ca', 3, 'Deutsch'),
(13, 'Caldwell', 'Stuart', '2008-04-13', 'm', 'Ap #952-452 Pretium Av.', 'nisi.a.odio@icloud.org', 13, 'Deutsch'),
(14, 'Kennan', 'Gomez', '2006-07-09', 'm', 'Ap #958-9168 Eu Street', 'mus.donec@aol.ca', 3, 'Kunst'),
(15, 'Callum', 'Burns', '2008-03-15', 'm', 'P.O. Box 150, 7858 Nunc Street', 'arcu.curabitur@protonmail.net', 10, 'Deutsch'),
(16, 'Caleb', 'Holloway', '2009-08-29', 'm', '9899 Mauris. St.', 'egestas.aliquam@google.org', 7, 'Spanisch'),
(17, 'Kate', 'Carr', '2005-02-23', 'f', '271-2249 Feugiat Avenue', 'purus.sapien@protonmail.edu', 11, 'Mathe'),
(18, 'Colby', 'Burton', '2004-06-04', 'm', '621-3985 In St.', 'nibh.sit@outlook.ca', 8, 'Englisch'),
(19, 'Dalton', 'Vargas', '2010-08-09', 'm', 'Ap #405-9051 Dictum. Rd.', 'nunc.mauris@outlook.ca', 1, 'Geo'),
(20, 'Iris', 'Barrera', '2006-06-23', 'f', '5164 Risus. Road', 'ultricies.ornare.elit@protonmail.ca', 5, 'Physik'),
(21, 'Lucas', 'Wiggins', '2006-12-14', 'm', '654-5964 Risus Rd.', 'curabitur.sed@icloud.net', 5, 'Chemie'),
(22, 'Dean', 'Trujillo', '2004-10-23', 'm', 'Ap #474-1633 At Ave', 'mauris.magna@icloud.couk', 8, 'Sport'),
(23, 'Lee', 'Acevedo', '2010-10-30', 'm', 'Ap #657-1132 Aliquam Road', 'ac.mattis.velit@hotmail.org', 1, 'Geo'),
(24, 'Beth', 'Church', '2007-01-16', 'f', '977-1623 Magna Ave', 'pellentesque.tincidunt@outlook.net', 3, 'Kunst'),
(25, 'Ulysses', 'Mendoza', '2006-02-06', 'm', '2223 Amet Rd.', 'aliquet.sem@google.org', 3, 'Physik'),
(26, 'Raja', 'Powers', '2010-01-17', 'f', 'Ap #535-6335 Mauris St.', 'consectetuer@icloud.org', 2, 'Geo'),
(27, 'Hyatt', 'Curtis', '2010-06-14', 'm', 'Ap #228-272 Mollis Avenue', 'duis.volutpat@google.couk', 2, 'Englisch'),
(28, 'Phillip', 'Figueroa', '2008-04-22', 'm', 'Ap #608-9788 Tristique Avenue', 'nunc@protonmail.net', 13, 'Deutsch'),
(29, 'Dennis', 'Mills', '2010-09-07', 'm', 'Ap #445-3555 Nascetur Street', 'aenean.massa.integer@yahoo.com', 1, 'Kunst'),
(30, 'Dolan', 'Young', '2004-03-30', 'm', 'P.O. Box 857, 5578 Pellentesque Av.', 'torquent.per.conubia@google.couk', 9, 'Deutsch'),
(31, 'Reuben', 'Simmons', '2010-06-12', 'm', 'Ap #762-8944 Enim. St.', 'dictum@outlook.com', 2, 'Bio'),
(32, 'Baker', 'Sanford', '2010-03-05', 'm', '411-6967 Egestas. Road', 'dictum.sapien.aenean@yahoo.ca', 2, 'Sport'),
(33, 'Ross', 'Garcia', '2010-02-09', 'm', 'P.O. Box 204, 4972 Blandit. Avenue', 'lorem.ut@yahoo.org', 1, 'Physik'),
(34, 'Rigel', 'Cantu', '2009-06-05', 'm', 'Ap #671-2706 Suspendisse St.', 'urna.nunc.quis@protonmail.couk', 7, 'Bio'),
(35, 'Armand', 'Lott', '2010-10-06', 'm', 'Ap #870-1821 Molestie St.', 'habitant@yahoo.com', 1, 'Sport'),
(36, 'Brendan', 'Alvarado', '2008-01-19', 'm', '470-1337 Fringilla St.', 'tellus.aenean.egestas@protonmail.edu', 14, 'Physik'),
(37, 'Burton', 'Fuller', '2005-08-28', 'm', 'P.O. Box 577, 6161 Maecenas Street', 'orci.in@google.edu', 11, 'Geo'),
(38, 'Cooper', 'Boone', '2007-04-23', 'm', '180 Duis Street', 'neque.sed@google.net', 3, 'Sport'),
(39, 'Amir', 'Faulkner', '2006-05-09', 'm', 'Ap #650-8134 A Rd.', 'malesuada.augue@outlook.org', 3, 'Sport'),
(40, 'Clark', 'York', '2010-05-09', 'm', 'Ap #471-9272 Iaculis Rd.', 'magna@protonmail.edu', 2, 'Kunst'),
(41, 'Hannah', 'Bond', '2006-04-04', 'f', 'Ap #738-2922 A St.', 'vel.vulputate@icloud.couk', 4, 'Sport'),
(42, 'Samuel', 'Bartlett', '2009-03-27', 'm', 'Ap #299-6426 A Rd.', 'ac.metus@hotmail.org', 6, 'Bio'),
(43, 'Clarke', 'Whitehead', '2005-11-18', 'm', '628-6254 Eleifend. Rd.', 'arcu@aol.com', 11, 'Kunst'),
(44, 'Darius', 'Gordon', '2006-04-29', 'm', '6115 Eu Rd.', 'dapibus.gravida@outlook.net', 4, 'Bio'),
(45, 'Chandler', 'Anthony', '2010-01-12', 'm', 'Ap #476-3313 Aliquam Avenue', 'massa.quisque@outlook.ca', 1, 'Kunst'),
(46, 'Clark', 'Conway', '2008-08-08', 'm', 'Ap #441-5839 Sed St.', 'cursus.luctus@outlook.ca', 14, 'Englisch'),
(47, 'Brian', 'Albert', '2006-03-25', 'm', 'P.O. Box 605, 6255 Suspendisse Avenue', 'neque@aol.couk', 5, 'Spanisch'),
(48, 'Randall', 'Preston', '2010-04-29', 'm', 'Ap #153-1920 Ipsum Av.', 'mauris.sagittis@outlook.couk', 2, 'Geo'),
(49, 'Stewart', 'Suarez', '2008-05-28', 'm', '684-3558 Quisque Av.', 'lorem@google.com', 14, 'Geo'),
(50, 'Quentin', 'Rollins', '2008-04-23', 'm', '965-4062 Suspendisse Av.', 'donec@google.ca', 14, 'Kunst'),
(51, 'Barrett', 'Larson', '2009-07-14', 'm', '5151 Quisque Rd.', 'dolor.egestas.rhoncus@aol.ca', 6, 'Geo'),
(52, 'Bevis', 'Santiago', '2007-01-13', 'm', '400-8950 Dis Ave', 'adipiscing.elit@icloud.com', 4, 'Chemie'),
(53, 'Clinton', 'Joyce', '2004-02-27', 'm', 'Ap #911-2867 Interdum. Road', 'sed@yahoo.edu', 10, 'Sport'),
(54, 'Cedric', 'Simmons', '2009-04-07', 'm', 'Ap #850-6188 Sem Av.', 'egestas.duis@protonmail.couk', 7, 'Chemie'),
(55, 'Oscar', 'Estrada', '2004-02-25', 'm', '200-1497 Dictum Av.', 'mauris.eu.elit@protonmail.ca', 9, 'Chemie'),
(56, 'Channing', 'Pratt', '2008-11-07', 'm', 'P.O. Box 609, 6893 Vivamus Rd.', 'aenean.egestas@google.ca', 10, 'Deutsch'),
(57, 'Blake', 'Cameron', '2007-08-14', 'm', 'P.O. Box 615, 5091 Cursus Av.', 'orci@icloud.net', 4, 'Spanisch'),
(58, 'Russell', 'Mcdonald', '2004-11-28', 'm', '839-9299 Sit Rd.', 'vestibulum.ante@protonmail.com', 10, 'Sport'),
(59, 'Theodore', 'Aguilar', '2010-06-05', 'm', 'Ap #480-5522 Felis Road', 'ante.vivamus.non@icloud.com', 1, 'Deutsch'),
(60, 'Isaiah', 'Cooper', '2007-12-08', 'm', 'P.O. Box 549, 3194 Lectus, Street', 'pharetra@google.edu', 4, 'Englisch'),
(61, 'Perry', 'Rush', '2005-08-04', 'm', 'Ap #586-1199 Mauris Street', 'tincidunt@outlook.couk', 12, 'Englisch'),
(62, 'Lucius', 'Robertson', '2008-05-05', 'm', 'P.O. Box 865, 4141 Aliquet St.', 'aliquet@hotmail.net', 13, 'Mathe'),
(63, 'Rajah', 'Hensley', '2008-01-18', 'm', 'P.O. Box 674, 7892 Eget Road', 'sed.congue.elit@outlook.net', 10, 'Mathe'),
(64, 'Linus', 'Rice', '2009-12-28', 'm', 'Ap #850-8099 Laoreet Av.', 'lacus.cras@aol.org', 7, 'Kunst'),
(65, 'Ciaran', 'Munoz', '2009-05-02', 'm', '2304 Faucibus Av.', 'arcu.vestibulum@google.ca', 7, 'Bio'),
(66, 'Rajah', 'Hardy', '2008-03-03', 'm', 'Ap #289-7103 Duis Rd.', 'consequat.enim.diam@hotmail.ca', 13, 'Sport'),
(67, 'Byron', 'Leach', '2009-06-15', 'm', '100-1285 Curabitur Street', 'euismod.mauris@aol.couk', 6, 'Kunst'),
(68, 'Brent', 'Anthony', '2005-03-21', 'm', '316-4433 Tempor Street', 'vestibulum.massa@hotmail.net', 12, 'Sport'),
(69, 'Mark', 'Vaughn', '2008-03-17', 'm', 'P.O. Box 386, 6955 Quam. St.', 'mi.lorem@google.couk', 13, 'Sport'),
(70, 'Carter', 'Ball', '2010-03-07', 'm', '646-9920 Integer Street', 'in.faucibus.morbi@icloud.edu', 2, 'Physik'),
(71, 'William', 'Haynes', '2010-02-12', 'm', '606-3644 Eget Street', 'egestas.sed@aol.org', 2, 'Mathe'),
(72, 'Brian', 'Harmon', '2008-12-01', 'm', '760-4263 Proin Rd.', 'quisque.purus.sapien@protonmail.couk', 14, 'Spanisch'),
(73, 'Aquila', 'Lucas', '2009-08-08', 'm', '401-2191 Sem Av.', 'at@icloud.edu', 6, 'Geo'),
(74, 'Alvin', 'Decker', '2008-01-10', 'm', 'Ap #252-4409 Eu, Rd.', 'non@icloud.com', 13, 'Physik'),
(75, 'Cooper', 'Pollard', '2004-07-02', 'm', '1887 Tellus. Rd.', 'enim@hotmail.edu', 10, 'Spanisch'),
(76, 'Allistair', 'Lyons', '2007-07-09', 'm', 'Ap #645-8755 Lacinia. Street', 'elit.elit.fermentum@icloud.edu', 5, 'Geo'),
(77, 'Jelani', 'Murphy', '2006-12-07', 'm', 'Ap #434-6819 Non, Rd.', 'vestibulum.massa.rutrum@protonmail.net', 3, 'Kunst'),
(78, 'Orlando', 'Gamble', '2005-07-03', 'm', '3527 Ac St.', 'risus.morbi@outlook.org', 12, 'Geo'),
(79, 'Uriah', 'Cotton', '2005-03-13', 'm', '552-2941 Lorem St.', 'cras@protonmail.com', 12, 'Englisch'),
(80, 'Cooper', 'Wilcox', '2005-06-24', 'm', 'P.O. Box 495, 6234 Vestibulum Street', 'consectetuer.adipiscing@yahoo.com', 11, 'Deutsch'),
(81, 'Malachi', 'Schmidt', '2010-09-18', 'm', 'Ap #883-5072 Proin St.', 'nec.metus@google.com', 2, 'Geo'),
(82, 'Bevis', 'Gilbert', '2004-12-07', 'm', 'P.O. Box 698, 1235 Turpis Ave', 'adipiscing@hotmail.org', 8, 'Bio'),
(83, 'Wallace', 'Ellison', '2007-02-02', 'm', 'Ap #547-2826 Euismod Av.', 'phasellus.vitae@outlook.couk', 4, 'Mathe'),
(84, 'Chadwick', 'Henry', '2007-06-25', 'm', 'Ap #146-6005 Eleifend, Road', 'eget.lacus@hotmail.edu', 4, 'Chemie'),
(85, 'Chandler', 'Gomez', '2004-11-20', 'm', '2844 Odio Road', 'auctor@yahoo.net', 9, 'Sport'),
(86, 'Barry', 'Tyler', '2005-07-12', 'm', '4672 Aliquam Avenue', 'tincidunt@google.org', 11, 'Geo'),
(87, 'Gary', 'Collins', '2009-04-11', 'm', 'Ap #699-3763 Scelerisque Street', 'orci.adipiscing.non@yahoo.couk', 6, 'Kunst'),
(88, 'Ulric', 'Hampton', '2010-12-27', 'm', 'P.O. Box 665, 1696 Porttitor Street', 'tristique@outlook.ca', 2, 'Mathe'),
(89, 'Paul', 'Snow', '2006-12-06', 'm', 'Ap #916-9783 Dictum Ave', 'a.enim.suspendisse@hotmail.net', 4, 'Mathe'),
(90, 'Oren', 'Tucker', '2004-09-13', 'm', '202-2723 Orci Street', 'in@icloud.com', 8, 'Mathe'),
(91, 'Keaton', 'Walton', '2010-08-22', 'm', 'Ap #630-9237 Quis Av.', 'tempor.bibendum@icloud.org', 1, 'Bio'),
(92, 'Sebastian', 'Mclean', '2007-05-04', 'm', '5161 Velit St.', 'tempor.lorem.eget@icloud.com', 3, 'Mathe'),
(93, 'Demetrius', 'Page', '2005-12-10', 'm', 'P.O. Box 502, 1645 Donec Street', 'natoque.penatibus@icloud.org', 12, 'Bio'),
(94, 'Calvin', 'Merritt', '2006-03-05', 'm', '502-8322 Tempus Ave', 'integer@aol.org', 3, 'Mathe'),
(95, 'Wade', 'Weber', '2006-03-02', 'm', 'Ap #630-4463 Nascetur St.', 'nisi.nibh@protonmail.ca', 3, 'Mathe'),
(96, 'George', 'Mitchell', '2008-12-05', 'm', '930-2840 Cras St.', 'ut@hotmail.com', 13, 'Englisch'),
(97, 'Gray', 'Hamilton', '2004-07-24', 'm', '380-3169 Gravida St.', 'nibh.enim@google.com', 8, 'Bio'),
(98, 'Bruno', 'Mccoy', '2010-03-20', 'm', 'P.O. Box 155, 6959 Phasellus St.', 'erat.nonummy@protonmail.com', 2, 'Mathe'),
(99, 'Kenneth', 'Velez', '2010-04-02', 'm', 'Ap #953-3184 Id, Avenue', 'nulla.at@hotmail.edu', 1, 'Physik'),
(100, 'Wande', 'Snider', '2008-05-15', 'f', 'P.O. Box 309, 6926 A Street', 'malesuada.id@aol.ca', 13, 'Geo'),
(101, 'Gisela', 'Solis', '2005-08-28', 'f', '8010 Non, Ave', 'fermentum.arcu@hotmail.couk', 12, 'Geo'),
(102, 'Lillian', 'Goodwin', '2005-01-16', 'f', '5628 Vehicula Road', 'etiam@aol.com', 10, 'Sport'),
(103, 'Charity', 'Leon', '2009-08-20', 'f', '181-9721 Vestibulum Av.', 'lorem.ac@outlook.ca', 6, 'Deutsch'),
(104, 'Melinda', 'Levy', '2008-07-28', 'f', '9195 In Road', 'gravida.mauris@protonmail.com', 13, 'Englisch'),
(105, 'Farrah', 'Gamble', '2004-09-29', 'f', 'Ap #426-6527 Suspendisse Avenue', 'maecenas.malesuada@google.couk', 10, 'Sport'),
(106, 'Gail', 'Ortiz', '2007-02-13', 'f', 'Ap #956-2252 Odio. Street', 'tincidunt.pede@yahoo.couk', 5, 'Physik'),
(107, 'Jillian', 'Warner', '2009-01-02', 'f', '689-2551 Donec St.', 'ante.dictum.cursus@icloud.couk', 6, 'Chemie'),
(108, 'May', 'Everett', '2008-01-28', 'f', '4521 Volutpat Street', 'dui@hotmail.com', 13, 'Chemie'),
(109, 'Sara', 'Colon', '2009-06-28', 'f', 'Ap #831-4439 Neque Road', 'ut@aol.ca', 7, 'Sport'),
(110, 'Shannon', 'Fisher', '2010-11-18', 'f', '747-7651 Mauris St.', 'natoque.penatibus@icloud.edu', 1, 'Englisch'),
(111, 'Olga', 'Chase', '2007-11-06', 'f', 'P.O. Box 851, 3744 Dui Rd.', 'quis.pede@google.edu', 3, 'Englisch'),
(112, 'Haviva', 'Fuentes', '2008-09-29', 'f', '524-7858 Placerat, Rd.', 'lacus.cras.interdum@aol.com', 14, 'Kunst'),
(113, 'Pascale', 'Small', '2007-01-18', 'f', '2669 Donec Rd.', 'odio.sagittis@icloud.couk', 5, 'Englisch'),
(114, 'Julie', 'Duncan', '2008-07-23', 'f', '730-6634 Lectus Av.', 'id.magna.et@google.org', 14, 'Spanisch'),
(115, 'Lana', 'Nelson', '2009-03-22', 'f', 'Ap #260-8182 In Avenue', 'massa.quisque@google.edu', 7, 'Chemie'),
(116, 'Imelda', 'Castillo', '2006-01-24', 'f', '2633 Elit, Ave', 'et@protonmail.org', 5, 'Physik'),
(117, 'Quin', 'Wilcox', '2009-04-20', 'f', 'P.O. Box 858, 206 Neque. Street', 'rutrum.non.hendrerit@hotmail.com', 7, 'Englisch'),
(118, 'Lacy', 'Levy', '2006-08-22', 'f', '647-3369 Volutpat Rd.', 'metus@yahoo.ca', 3, 'Chemie'),
(119, 'Sigourney', 'Mccray', '2007-01-30', 'f', '4349 Consectetuer Street', 'massa.vestibulum@icloud.net', 5, 'Chemie'),
(120, 'Gwendolyn', 'Mcintyre', '2008-10-20', 'f', 'P.O. Box 110, 1432 Tempor Rd.', 'cursus.nunc@hotmail.net', 13, 'Chemie'),
(121, 'Anika', 'Hart', '2008-06-27', 'f', 'P.O. Box 691, 5965 In Avenue', 'dignissim.lacus.aliquam@yahoo.ca', 13, 'Physik'),
(122, 'Avye', 'Howell', '2006-01-02', 'f', '806-6636 Blandit. Rd.', 'orci.quis.lectus@icloud.couk', 5, 'Sport'),
(123, 'Fleur', 'Stewart', '2009-07-25', 'f', '9466 Lorem Rd.', 'ipsum.suspendisse@outlook.com', 6, 'Geo'),
(124, 'Uma', 'Murphy', '2006-10-05', 'f', 'P.O. Box 497, 5403 Pharetra Rd.', 'dapibus.ligula@hotmail.edu', 4, 'Deutsch'),
(125, 'Shelly', 'Garrett', '2008-03-08', 'f', 'Ap #863-4600 Praesent St.', 'rhoncus@protonmail.net', 14, 'Deutsch'),
(126, 'Alyssa', 'Wallace', '2009-05-12', 'f', '884-3062 Augue Avenue', 'nulla.dignissim@yahoo.net', 6, 'Deutsch'),
(127, 'Zenia', 'Schneider', '2009-03-18', 'f', 'Ap #679-126 Interdum. Rd.', 'dolor@protonmail.ca', 6, 'Physik'),
(128, 'Jaden', 'Levine', '2009-12-14', 'f', 'P.O. Box 423, 6897 Ornare, Road', 'elit@hotmail.org', 7, 'Geo'),
(129, 'Yolanda', 'Burns', '2005-06-12', 'f', '587-508 Porta Rd.', 'aliquam.eros@aol.edu', 12, 'Englisch'),
(130, 'Indigo', 'Barnett', '2005-03-31', 'f', '194-9909 Ante. Rd.', 'turpis.non@outlook.net', 12, 'Sport'),
(131, 'Beatrice', 'Vazquez', '2005-10-19', 'f', '1986 Nec, Ave', 'fringilla.purus@protonmail.ca', 11, 'Spanisch'),
(132, 'Aline', 'Jacobson', '2007-12-05', 'f', 'Ap #881-1599 Ultricies Street', 'cubilia.curae@icloud.couk', 3, 'Mathe'),
(133, 'Renee', 'Mclean', '2010-09-30', 'f', 'P.O. Box 321, 3036 Mus. Street', 'scelerisque.sed@google.edu', 2, 'Chemie'),
(134, 'Katelyn', 'Jensen', '2005-10-06', 'f', '8021 Ut, Road', 'facilisi@protonmail.edu', 12, 'Geo'),
(135, 'Charity', 'Dickson', '2007-04-05', 'f', 'Ap #235-9503 Nam Road', 'ipsum.suspendisse.non@aol.edu', 5, 'Sport'),
(136, 'Violet', 'Mccormick', '2006-02-01', 'f', '9836 Turpis Av.', 'luctus.aliquet@hotmail.com', 4, 'Mathe'),
(137, 'Olga', 'Keller', '2009-08-12', 'f', '931 A Ave', 'eleifend.nec@yahoo.couk', 7, 'Spanisch'),
(138, 'Yoko', 'Walsh', '2010-08-10', 'f', '102-5879 Cras Rd.', 'ornare@aol.net', 2, 'Bio'),
(139, 'Zephr', 'Workman', '2007-08-26', 'f', '394-6203 Ligula St.', 'at@google.org', 4, 'Englisch'),
(140, 'Quynn', 'Puckett', '2010-08-22', 'f', '737-9773 Justo Ave', 'urna.vivamus@yahoo.ca', 1, 'Kunst'),
(141, 'Germane', 'Welch', '2007-03-07', 'f', '775-3450 Tincidunt Rd.', 'tortor.at@aol.couk', 5, 'Spanisch'),
(142, 'Farrah', 'Drake', '2006-05-15', 'f', 'Ap #327-9312 Praesent Road', 'sed@aol.couk', 5, 'Bio'),
(143, 'Victoria', 'Marsh', '2007-02-16', 'f', '3119 Euismod Ave', 'enim.nec.tempus@aol.org', 5, 'Mathe'),
(144, 'Maile', 'Delacruz', '2005-01-27', 'f', 'Ap #519-9464 Quisque Avenue', 'dictum@hotmail.net', 10, 'Bio'),
(145, 'Kelly', 'Richardson', '2010-09-20', 'f', 'P.O. Box 878, 4882 Lorem, Av.', 'mauris.vel@aol.ca', 2, 'Englisch'),
(146, 'Kirsten', 'Sanford', '2006-08-28', 'f', 'P.O. Box 614, 6898 Tellus Avenue', 'primis.in@icloud.com', 3, 'Deutsch'),
(147, 'Isadora', 'Lynch', '2005-01-11', 'f', 'P.O. Box 976, 2448 Lorem Road', 'molestie.sodales@google.edu', 9, 'Chemie'),
(148, 'Adele', 'Rowe', '2004-08-15', 'f', '672-4106 Malesuada Rd.', 'volutpat.ornare.facilisis@yahoo.couk', 10, 'Sport'),
(149, 'Alice', 'Short', '2005-04-16', 'f', '613 Ultrices Ave', 'duis.volutpat@yahoo.com', 11, 'Physik'),
(150, 'Eve', 'Quinn', '2004-08-01', 'f', 'Ap #412-4433 Dictum Road', 'nulla@hotmail.com', 9, 'Physik'),
(151, 'Kevyn', 'Stevens', '2007-06-17', 'f', '791-1652 Eu Avenue', 'sem.ut@outlook.org', 3, 'Englisch'),
(152, 'Penelope', 'Ward', '2009-04-22', 'f', 'P.O. Box 559, 843 Sem Street', 'magnis@yahoo.edu', 6, 'Bio'),
(153, 'Dahlia', 'Rodriguez', '2007-10-28', 'f', 'P.O. Box 546, 8840 Luctus Street', 'aliquet.libero@protonmail.org', 5, 'Englisch'),
(154, 'Jessica', 'Barton', '2006-03-30', 'f', 'Ap #848-9897 Gravida. Rd.', 'sed.pede@yahoo.net', 4, 'Mathe'),
(155, 'Noelani', 'Boyle', '2010-05-12', 'f', '976-5677 Sed Ave', 'augue.ac@aol.org', 2, 'Deutsch'),
(156, 'Madeson', 'Herman', '2004-04-11', 'f', '832-9557 Mauris Rd.', 'nisl.elementum@hotmail.org', 10, 'Kunst'),
(157, 'Melyssa', 'Prince', '2009-01-05', 'f', '1651 Et Av.', 'sed@hotmail.edu', 7, 'Englisch'),
(158, 'Melodie', 'Mendez', '2010-09-30', 'f', 'P.O. Box 603, 8421 Proin Street', 'integer.in.magna@aol.net', 1, 'Physik'),
(159, 'Nadine', 'Lester', '2009-05-04', 'f', '850-3599 Erat St.', 'justo.nec@protonmail.org', 6, 'Mathe'),
(160, 'Macey', 'Rodriquez', '2004-06-19', 'f', '444-7246 Lorem St.', 'pede@google.edu', 9, 'Mathe'),
(161, 'Kiara', 'Evans', '2009-08-31', 'f', '531-6280 Donec Rd.', 'lacus.mauris.non@google.org', 6, 'Sport'),
(162, 'Giselle', 'Delaney', '2010-08-23', 'f', 'P.O. Box 851, 6422 Elit. Ave', 'ultricies.sem@protonmail.net', 2, 'Geo'),
(163, 'Nerea', 'Jones', '2005-02-15', 'f', '667-603 Et Road', 'lorem.auctor@hotmail.edu', 8, 'Spanisch'),
(164, 'Fiona', 'Munoz', '2006-09-14', 'f', 'P.O. Box 635, 4631 Erat Avenue', 'sed@outlook.ca', 3, 'Chemie'),
(165, 'Denise', 'Coffey', '2004-12-24', 'f', '492-2733 Proin St.', 'vivamus.euismod@yahoo.com', 8, 'Bio'),
(166, 'Gloria', 'Mcgowan', '2006-03-07', 'f', 'Ap #670-1596 Aliquam Rd.', 'eros.turpis.non@google.org', 4, 'Chemie'),
(167, 'Larissa', 'Silva', '2004-05-26', 'f', 'Ap #525-3625 Sit Ave', 'iaculis@icloud.com', 10, 'Bio'),
(168, 'Lynn', 'Fernandez', '2009-03-30', 'f', 'P.O. Box 624, 4264 Augue Rd.', 'ante.blandit@aol.org', 7, 'Deutsch'),
(169, 'Clementine', 'Ray', '2004-12-08', 'f', '544-5842 Quis Av.', 'quis@icloud.org', 9, 'Kunst'),
(170, 'Flavia', 'Berg', '2004-05-25', 'f', '428-3948 Sagittis St.', 'nulla.integer@protonmail.net', 9, 'Mathe'),
(171, 'Tashya', 'Waters', '2005-08-31', 'f', '276-7106 Massa. Road', 'in@hotmail.couk', 11, 'Englisch'),
(172, 'Kaitlin', 'Mcdowell', '2005-10-23', 'f', 'Ap #976-8844 Donec Ave', 'massa.mauris@icloud.org', 12, 'Spanisch'),
(173, 'Calista', 'Gallagher', '2006-05-03', 'f', '626-9002 Vulputate, Rd.', 'porttitor.vulputate@outlook.com', 4, 'Physik'),
(174, 'Sage', 'Norton', '2005-12-04', 'f', 'Ap #977-5080 Aliquet Avenue', 'magna.sed@outlook.ca', 11, 'Kunst'),
(175, 'Cheryl', 'Boyd', '2007-08-10', 'f', 'Ap #989-7309 Dapibus Avenue', 'nunc.ut.erat@icloud.couk', 5, 'Deutsch'),
(176, 'Regina', 'Nolan', '2009-11-16', 'f', 'P.O. Box 955, 4814 Sed, Road', 'ac.sem@outlook.com', 6, 'Englisch'),
(177, 'Suki', 'Ayala', '2010-07-03', 'f', '769-9472 Integer Av.', 'parturient@hotmail.couk', 1, 'Spanisch'),
(178, 'Courtney', 'Leon', '2008-04-20', 'f', '658-3367 Fermentum St.', 'posuere@protonmail.net', 14, 'Physik'),
(179, 'Giselle', 'Fowler', '2006-06-20', 'f', '7215 Congue Av.', 'et.nunc@outlook.edu', 4, 'Geo'),
(180, 'Bianca', 'Mccarthy', '2006-02-24', 'f', '532-2575 Nunc Avenue', 'etiam.gravida.molestie@aol.net', 5, 'Geo'),
(181, 'Gisela', 'Case', '2006-07-31', 'f', 'P.O. Box 895, 9969 Cras St.', 'faucibus.ut.nulla@google.ca', 5, 'Bio'),
(182, 'Yoshi', 'Douglas', '2008-01-29', 'f', '373-575 Gravida St.', 'sit.amet@hotmail.net', 14, 'Spanisch'),
(183, 'Deirdre', 'Benjamin', '2004-03-25', 'f', 'P.O. Box 297, 2976 Gravida Ave', 'augue.malesuada@google.net', 8, 'Englisch'),
(184, 'Lillith', 'Hahn', '2010-12-04', 'f', 'P.O. Box 645, 8565 Elit. Av.', 'tristique.ac.eleifend@yahoo.ca', 2, 'Physik'),
(185, 'Celeste', 'Coleman', '2006-10-05', 'f', 'Ap #102-1478 Scelerisque Road', 'vitae@yahoo.edu', 3, 'Englisch'),
(186, 'Carolyn', 'Farley', '2006-06-14', 'f', '697-2799 Rutrum St.', 'scelerisque.mollis@yahoo.edu', 3, 'Englisch'),
(187, 'Megan', 'Coleman', '2009-01-02', 'f', '8872 Enim Road', 'pharetra.felis.eget@hotmail.couk', 6, 'Chemie'),
(188, 'Destiny', 'Schultz', '2008-04-05', 'f', 'Ap #501-5582 Nunc Ave', 'aliquam@aol.couk', 14, 'Geo'),
(189, 'Angela', 'Raymond', '2009-01-05', 'f', '241-9780 Nascetur Road', 'ut.lacus@icloud.couk', 7, 'Mathe'),
(190, 'Angelica', 'Aguirre', '2006-09-25', 'f', '814-9667 Vulputate, Rd.', 'dictum.placerat.augue@protonmail.net', 4, 'Kunst'),
(191, 'Tatum', 'Kramer', '2008-08-15', 'f', 'Ap #745-841 Dapibus St.', 'consequat@icloud.net', 13, 'Chemie'),
(192, 'Germane', 'Austin', '2006-01-21', 'f', '193-2094 Luctus Ave', 'urna.convallis@outlook.net', 5, 'Deutsch'),
(193, 'Eugenia', 'Wynn', '2005-03-16', 'f', 'P.O. Box 721, 5407 Ornare, Road', 'sed.auctor@icloud.net', 11, 'Deutsch'),
(194, 'Julie', 'Burris', '2004-09-23', 'f', '669 Eget, Street', 'elit.fermentum.risus@yahoo.net', 9, 'Mathe'),
(195, 'Madonna', 'Whitehead', '2007-07-17', 'f', 'Ap #629-3866 Vel Rd.', 'nunc.interdum@google.net', 3, 'Geo'),
(196, 'Lacota', 'Buckley', '2004-04-16', 'f', '931 Donec Ave', 'et.rutrum@google.com', 8, 'Bio'),
(197, 'Adria', 'Simmons', '2005-03-24', 'f', '867-7083 Molestie Rd.', 'aenean@yahoo.com', 11, 'Sport'),
(198, 'Victoria', 'Mercer', '2009-05-03', 'f', 'Ap #698-8086 Ullamcorper. Av.', 'suspendisse.tristique@icloud.ca', 6, 'Bio'),
(199, 'Ariel', 'Dorsey', '2005-06-11', 'f', 'Ap #382-7156 Risus. St.', 'semper.dui@google.org', 11, 'Physik'),
(200, 'Piper', 'Watkins', '2010-09-08', 'f', 'Ap #129-5294 Donec Avenue', 'ipsum.phasellus.vitae@outlook.edu', 2, 'Sport');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Test`
--

CREATE TABLE `Test` (
  `ID` int NOT NULL,
  `Name` varchar(20) NOT NULL
) ENGINE=InnoDB ;

--
-- Daten für Tabelle `Test`
--

INSERT INTO `Test` (`ID`, `Name`) VALUES
(1, 'Daten 1'),
(2, 'Daten 2'),
(3, 'Daten 3');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `Klasse`
--
ALTER TABLE `Klasse`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_Lehrer` (`LehrerID`);

--
-- Indizes für die Tabelle `Kurs`
--
ALTER TABLE `Kurs`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `KursSchueler`
--
ALTER TABLE `KursSchueler`
  ADD PRIMARY KEY (`KursID`,`SchuelerID`),
  ADD KEY `FK_Schueler` (`SchuelerID`);

--
-- Indizes für die Tabelle `Lehrer`
--
ALTER TABLE `Lehrer`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `Schueler`
--
ALTER TABLE `Schueler`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_Klasse` (`KlassenID`);

--
-- Indizes für die Tabelle `Test`
--
ALTER TABLE `Test`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `Klasse`
--
ALTER TABLE `Klasse`
  MODIFY `ID` mediumint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT für Tabelle `Kurs`
--
ALTER TABLE `Kurs`
  MODIFY `ID` mediumint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT für Tabelle `Lehrer`
--
ALTER TABLE `Lehrer`
  MODIFY `ID` mediumint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT für Tabelle `Schueler`
--
ALTER TABLE `Schueler`
  MODIFY `ID` mediumint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- AUTO_INCREMENT für Tabelle `Test`
--
ALTER TABLE `Test`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `Klasse`
--
ALTER TABLE `Klasse`
  ADD CONSTRAINT `FK_Lehrer` FOREIGN KEY (`LehrerID`) REFERENCES `Lehrer` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints der Tabelle `KursSchueler`
--
ALTER TABLE `KursSchueler`
  ADD CONSTRAINT `FK_Kurs` FOREIGN KEY (`KursID`) REFERENCES `Kurs` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_Schueler` FOREIGN KEY (`SchuelerID`) REFERENCES `Schueler` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints der Tabelle `Schueler`
--
ALTER TABLE `Schueler`
  ADD CONSTRAINT `FK_Klasse` FOREIGN KEY (`KlassenID`) REFERENCES `Klasse` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

