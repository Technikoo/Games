SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `Game` (
  ID INT AUTO_INCREMENT NOT NULL,
  `Name` varchar(20) NOT NULL,
  PRIMARY KEY(ID)
) ENGINE=InnoDB ;


INSERT INTO `Game` `Name` VALUES
'Tetris',
'TicTacToe',
'VierGewinnt',
'2048';

CREATE TABLE `User` (
  ID INT AUTO_INCREMENT NOT NULL,
  `Name` varchar(20) NOT NULL,
  PRIMARY KEY(ID)
) ENGINE=InnoDB ;

CREATE TABLE `UserGame` (
  `UserID` mediumint NOT NULL,
  `GameID` mediumint NOT NULL, 
  `Dauer` int NOT NULL,
  `Highscore` int NOT NULL
) ENGINE=InnoDB ;

CREATE TABLE `Kommentare` (
  ID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  `GameID` int NOT NULL ,
  `Kommentar` MEDIUMTEXT NOT NULL
) ENGINE=InnoDB ;

ALTER TABLE `UserGame`
  ADD PRIMARY KEY (`UserID`,`GameID`);
ALTER TABLE `Kommentare`
  ADD KEY GameID (`GameID`);