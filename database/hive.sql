-- Create the database
CREATE DATABASE IF NOT EXISTS hiverecords
       CHARACTER SET utf8mb4
       COLLATE  utf8mb4_general_ci;

USE hiverecords;

-- hiverecords.apiary definition

CREATE TABLE `hiverecords`.`apiary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `location` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `apiary_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Contains the list of apiaries';

-- hiverecords.hive definition

CREATE TABLE `hiverecords`.`hive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `apiaryid` int(11) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hive_unique` (`name`),
  KEY `hive_apiary_FK` (`apiaryid`),
  CONSTRAINT `hive_apiary_FK` FOREIGN KEY (`apiaryid`) REFERENCES `apiary` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Describes the physical hive';


-- hiverecords.queen definition

CREATE TABLE `hiverecords`.`queen` (
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
  KEY `queen_queen_FK` (`mother`),
  CONSTRAINT `queen_hive_FK` FOREIGN KEY (`hiveid`) REFERENCES `hive` (`id`),
  CONSTRAINT `queen_queen_FK` FOREIGN KEY (`mother`) REFERENCES `queen` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Describes the queen';

-- hiverecords.hiveinspection definition

CREATE TABLE `hiverecords`.`hiveinspection` (
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
  KEY `hiveinspection_hive_FK` (`hiveid`),
  CONSTRAINT `hiveinspection_hive_FK` FOREIGN KEY (`hiveid`) REFERENCES `hive` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- hiverecords.queeninspection definition

CREATE TABLE `hiverecords`.`queeninspection` (
  `instpectionid` int(11) NOT NULL,
  `docility` int(11) DEFAULT NULL,
  `steadiness` int(11) DEFAULT NULL,
  `comb_build` int(11) DEFAULT NULL,
  `pollen` int(11) DEFAULT NULL,
  `propolis` int(11) DEFAULT NULL,
  `queenid` int(11) NOT NULL,
  KEY `queeninspection_hiveinspection_FK` (`instpectionid`),
  KEY `queeninspection_queen_FK` (`queenid`),
  CONSTRAINT `queeninspection_hiveinspection_FK` FOREIGN KEY (`instpectionid`) REFERENCES `hiveinspection` (`id`),
  CONSTRAINT `queeninspection_queen_FK` FOREIGN KEY (`queenid`) REFERENCES `queen` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `beekeepers` (
     `id` int(11) NOT NULL AUTO_INCREMENT,
     `name` varchar(50) NOT NULL,
     `email` varchar(50) NOT NULL,
     `password` varchar(65) NOT NULL,
     PRIMARY KEY (`id`),
     UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


