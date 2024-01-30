
USE hiverecords;

INSERT INTO apiary (name, location, description)
            VALUES ('home', 'Coolfore', 'Home apiary'),
                   ('southgate', 'Hilliards Farm', 'In Hilliards, near the farm shop');

INSERT INTO hive   (name, apiaryid, description)
            VALUES ('H35', '1', 'Maisemore'),
                   ('H37', '1', 'Blue Paynes Poly'),
                   ('H41', '1', 'Yellow Paynes Poly'),
                   ('H46', '1', 'Wood'),
                   ('H50', '2', 'Terracotta Paynes Poly'),
                   ('H52', '1', 'Wood');

INSERT INTO queen ( `hiveid`, `name`, `description`, `mother`, `colour`, `marked`, `clipped`, `origin`) 
           VALUES ( '1', 'SCIA20-1', '96.4%', NULL, 'white', '2021-08-04', '2021-04-08', 'From swarm in Ciaran''s in 2020'),
                  ( '2', '', '92.7%', NULL, NULL, NULL, NULL, NULL),
                  ( '3', 'H41', '93.8%', 1, NULL, NULL, NULL, NULL),
                  ( '4', 'L2201', '96.4%', NULL, 'yellow', NULL, NULL, 'LBKA mating apiary'),
                  ( '5', 'S2301', '', NULL, NULL, NULL, NULL, 'Swarm arrived 06/05/2023'),
                  ( '6', 'S2302', '', NULL, NULL, NULL, NULL, 'Swarm');


