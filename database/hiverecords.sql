

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

----------------------------------------------------------
--
-- Database: `hiverecords`
--
CREATE DATABASE IF NOT EXISTS `hiverecords` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `hiverecords`;

----------------------------------------------------------
--
-- Table structure for table `apiary`
--
DROP TABLE IF EXISTS `apiary`;
CREATE TABLE IF NOT EXISTS `apiary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `location` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `apiary_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Contains the list of apiaries';

--
-- Dumping data for table `apiary`
--
INSERT INTO `apiary` (`id`, `name`, `location`, `description`) VALUES
(1, 'home', 'Coolfore', 'Home apiary'),
(2, 'southgate', 'Hilliards Farm', 'In Hilliards, near the farm shop');

----------------------------------------------------------
--
-- Table structure for table `beekeepers`
--
DROP TABLE IF EXISTS `beekeepers`;
CREATE TABLE IF NOT EXISTS `beekeepers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(65) NOT NULL,
  `activated` tinyint(1) NOT NULL DEFAULT 0,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `beekeepers`
--
INSERT INTO `beekeepers` (`id`, `name`, `email`, `password`, `activated`, `admin`) VALUES
(5, 'brendan', 'brendanpmurray@gmail.com', '$2y$10$t4iWp5iZzLkxhBlIn.hocumAgS73vjsqyuL/1DsQ5S5Wy8AwydisC', 0, 0);

----------------------------------------------------------
--
-- Table structure for table `hive`
--
DROP TABLE IF EXISTS `hive`;
CREATE TABLE IF NOT EXISTS `hive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `apiaryid` int(11) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hive_unique` (`name`),
  KEY `hive_apiary_FK` (`apiaryid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Describes the physical hive';

--
-- Dumping data for table `hive`
--
INSERT INTO `hive` (`id`, `name`, `apiaryid`, `description`) VALUES
(1, 'H35', 1, 'Maisemore'),
(2, 'H37', 1, 'Blue Paynes Poly'),
(3, 'H41', 1, 'Yellow Paynes Poly'),
(4, 'H46', 1, 'Wood'),
(5, 'H50', 2, 'Terracotta Paynes Poly'),
(6, 'H52', 1, 'Wood');

----------------------------------------------------------
--
-- Table structure for table `hiveinspection`
--
DROP TABLE IF EXISTS `hiveinspection`;
CREATE TABLE IF NOT EXISTS `hiveinspection` (
  `time` datetime NOT NULL,
  `room` varchar(100) DEFAULT NULL,
  `eggs` varchar(100) DEFAULT NULL,
  `development` varchar(100) DEFAULT NULL,
  `disease` varchar(100) DEFAULT NULL,
  `stores` varchar(100) DEFAULT NULL,
  `comments` varchar(100) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hiveid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hiveinspection_hive_FK` (`hiveid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

----------------------------------------------------------
--
-- Table structure for table `queen`
--
DROP TABLE IF EXISTS `queen`;
CREATE TABLE IF NOT EXISTS `queen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hiveid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `mother` int(11) DEFAULT NULL,
  `colour` enum('white','yellow','red','green','blue') DEFAULT NULL,
  `marked` date DEFAULT NULL,
  `clipped` date DEFAULT NULL,
  `origin` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `queen_hive_FK` (`hiveid`),
  KEY `queen_queen_FK` (`mother`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Describes the queen';

--
-- Dumping data for table `queen`
--
INSERT INTO `queen` (`id`, `hiveid`, `name`, `description`, `mother`, `colour`, `marked`, `clipped`, `origin`) VALUES
(1, 1, 'SCIA20-1', '96.4%', NULL, 'white', '2021-08-04', '2021-04-08', 'From swarm in Ciaran\'s in 2020'),
(2, 2, '', '92.7%', NULL, NULL, NULL, NULL, NULL),
(3, 3, 'H41', '93.8%', 1, NULL, NULL, NULL, NULL),
(4, 4, 'L2201', '96.4%', NULL, 'yellow', NULL, NULL, 'LBKA mating apiary'),
(5, 5, 'S2301', '', NULL, NULL, NULL, NULL, 'Swarm arrived 06/05/2023'),
(6, 6, 'S2302', '', NULL, NULL, NULL, NULL, 'Swarm');

----------------------------------------------------------
--
-- Table structure for table `queeninspection`
--
DROP TABLE IF EXISTS `queeninspection`;
CREATE TABLE IF NOT EXISTS `queeninspection` (
  `instpectionid` int(11) NOT NULL,
  `docility` int(11) DEFAULT NULL,
  `steadiness` int(11) DEFAULT NULL,
  `comb_build` int(11) DEFAULT NULL,
  `pollen` int(11) DEFAULT NULL,
  `propolis` int(11) DEFAULT NULL,
  `queenid` int(11) NOT NULL,
  KEY `queeninspection_hiveinspection_FK` (`instpectionid`),
  KEY `queeninspection_queen_FK` (`queenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


--
-- Constraints for table `hive`
--
ALTER TABLE `hive`
  ADD CONSTRAINT `hive_apiary_FK` FOREIGN KEY (`apiaryid`) REFERENCES `apiary` (`id`);

--
-- Constraints for table `hiveinspection`
--
ALTER TABLE `hiveinspection`
  ADD CONSTRAINT `hiveinspection_hive_FK` FOREIGN KEY (`hiveid`) REFERENCES `hive` (`id`);

--
-- Constraints for table `queen`
--
ALTER TABLE `queen`
  ADD CONSTRAINT `queen_hive_FK` FOREIGN KEY (`hiveid`) REFERENCES `hive` (`id`),
  ADD CONSTRAINT `queen_queen_FK` FOREIGN KEY (`mother`) REFERENCES `queen` (`id`);

--
-- Constraints for table `queeninspection`
--
ALTER TABLE `queeninspection`
  ADD CONSTRAINT `queeninspection_hiveinspection_FK` FOREIGN KEY (`instpectionid`) REFERENCES `hiveinspection` (`id`),
  ADD CONSTRAINT `queeninspection_queen_FK` FOREIGN KEY (`queenid`) REFERENCES `queen` (`id`);


COMMIT;

