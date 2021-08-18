USE DBJV;
SELECT*FROM PS4_GamesSales;
SELECT*FROM XboxOne_GameSales;

SELECT*FROM XboxOne_GameSales WHERE=2018;

ALTER TABLE PS4_GamesSales
ADD Pos int not null default (0);

ALTER TABLE XboxOne_GameSales
DROP COLUMN Pos;

ALTER TABLE XboxOne_GameSales
ADD Pos int not null default (0);

ALTER TABLE PS4_GamesSales
ADD Console varchar(50) not null default ('PS4');

ALTER TABLE XboxOne_GameSales
ADD Console varchar(50) not null default ('XBox');

sp_rename 'PS4_GamesSales.Year','Vintage', 'COLUMN'; --changing the name of the column.
sp_rename 'XboxOne_GameSales.Global','Integrally','COLUMN';

SELECT Game, Vintage, Genre, Publisher, North_America, Europe, Japan, Rest_of_World, Integrally, Pos, Console
INTO XboxOne_GameSales_Duplicate
FROM XboxOne_GameSales;

/* 1NF resource 1 */
SELECT Publisher, console
FROM PS4_GamesSales
WHERE Game='Grand Theft Auto V'
UNION -- Here is where both Datasets combine for searching duplicates
SELECT Publisher, console
FROM XboxOne_GameSales
WHERE Game='Grand Theft Auto V';

DROP TABLE XboxOne_GameSales_Duplicate;

SELECT DISTINCT*
INTO XboxOne_GameSales_Duplicate
FROM XboxOne_GameSales
GROUP BY Game, Vintage, Genre, Publisher, North_America, Europe, Japan, Rest_of_World, Integrally, Pos, Console
HAVING COUNT ('Grand Theft Auto V')>1  

DELETE XboxOne_GameSales
WHERE Game
IN (SELECT Game
FROM XboxOne_GameSales_Duplicate)

INSERT XboxOne_GameSales
SELECT*
FROM XboxOne_GameSales_Duplicate

DROP TABLE XboxOne_GameSales_Duplicate;


SELECT * FROM XboxOne_GameSales;


/* 1NF resource 1 */
SELECT DISTINCT*
INTO XboxOne_GameSales_Duplicate
FROM XboxOne_GameSales
GROUP BY Game, Vintage, Genre, Publisher, North_America, Europe, Japan, Rest_of_World, Integrally, Pos, Console
HAVING COUNT ('0')>1  

DELETE XboxOne_GameSales
WHERE Integrally
IN (SELECT Integrally
FROM XboxOne_GameSales_Duplicate)

INSERT XboxOne_GameSales
SELECT*
FROM XboxOne_GameSales_Duplicate

DROP TABLE XboxOne_GameSales_Duplicate;

SELECT*FROM XboxOne_GameSales;


INSERT INTO XboxOne_GameSales
(Game, Vintage, Genre, Publisher, North_America, Europe, Japan, Rest_of_World, Integrally, Pos, Console)
VALUES 
('Kingdom Hearts III',2019,'Role-Playing', 'Square Enix',0,0,0,0,0,0,'XBox');

INSERT INTO XboxOne_GameSales
(Game, Vintage, Genre, Publisher, North_America, Europe, Japan, Rest_of_World, Integrally, Pos, Console)
VALUES
('Moons Of Madness',2018,'Role-Playing','Unknown',0,0,0,0,0,0,	'XBox');

SELECT DISTINCT*
INTO XboxOne_GameSales_Duplicate
FROM XboxOne_GameSales
GROUP BY Game, Vintage, Genre, Publisher, North_America, Europe, Japan, Rest_of_World, Integrally, Pos, Console
HAVING COUNT ('Kingdom Hearts III')>1  

DELETE XboxOne_GameSales
WHERE Game
IN (SELECT Game
FROM XboxOne_GameSales_Duplicate)

INSERT XboxOne_GameSales
SELECT*
FROM XboxOne_GameSales_Duplicate

DROP TABLE XboxOne_GameSales_Duplicate;

SELECT COUNT(*)
FROM XboxOne_GameSales;
--619

SELECT Game
FROM XboxOne_GameSales
GROUP BY Game
HAVING COUNT (Game)>1;

SELECT* FROM XboxOne_GameSales
WHERE game='Biomutant';

SELECT *
FROM XboxOne_GameSales_Duplicate;

SELECT DISTINCT *--It returns all unique values from all columns from XboxOne_GameSales table
INTO XboxOne_GameSales_Duplicate--"Moves one instance of any duplicate row in the original table to a duplicate table."
FROM XboxOne_GameSales
GROUP BY Game, Vintage, Genre, Publisher, North_America, Europe, Japan, Rest_of_World, Integrally, Pos, Console
HAVING COUNT (Game)>1  

DELETE XboxOne_GameSales --"Deletes all rows from the original table that are also located in the duplicate table."
WHERE Game --this is the name of the column that is going to compare
IN (SELECT Game, Vintage, Genre, Publisher, North_America, Europe, Japan, Rest_of_World, Integrally, Pos, Console
FROM XboxOne_GameSales_Duplicate)

INSERT XboxOne_GameSales
SELECT*
FROM XboxOne_GameSales_Duplicate

DROP TABLE XboxOne_GameSales_Duplicate;

SELECT*
FROM XboxOne_GameSales
WHERE Game = 'Kingdom Hearts III' OR game='Moons Of Madness';

SELECT*
FROM XboxOne_GameSales
ORDER BY Integrally DESC; 


CREATE ROLE Auditor2 AUTHORIZATION db_datareader;