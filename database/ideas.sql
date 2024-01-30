-- If apiaries are associated with an organization, multiple
-- organizations can be held in one database. Where this goes
-- wrong is if an organization has names for their queens and
-- hives that conflict with those in another organization. So
-- we'll keep each organizaion in its own database for now!

use `hiverecords`;

CREATE TABLE `hiverecords`.`organization` (
     `id` int(11) NOT NULL AUTO_INCREMENT,
     `name` varchar(100) NOT NULL,
     `description` varchar(100) DEFAULT NULL,
     PRIMARY KEY (`id`),
     UNIQUE KEY `apiary_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Contains the list of organizations';
