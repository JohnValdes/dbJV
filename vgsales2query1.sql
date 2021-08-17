use DBJV --locating the query into the correct db

create function udf_vgsalesNA( --generating the User defined function
	@NA_sales int)
returns table 
as
return
select NA_Sales 
from vgsales2
where NA_Sales=@NA_sales;

select*from vgsales2
select*from udf_vgsalesNA(41); --calling out udf_vgsalesNA

insert into vgsales2 --inserting additional rows [DML]
values (3,'Mario Kart Wii','Wii', 2008,'Racing','Nintendo',15.85,12.88,3.79,3.31,35.82);
insert into vgsales2
values (4,'Wii Spors Resort','Wii', 2009,'Sports','Nintendo',15.75,11.01,3.28,33.89);
insert into vgsales2
values (5,'Pokemon Red/Pokemon Blue','GB',1999,'Role-Playing','Nintendo',11.27,8.89,10.22,31.37);
insert into vgsales2
values (6,'Tetris','GB',1989,'Role-Playing','Nintendo',23.2,2.26,4.22,30.26);
insert into vgsales2
values (7,'Super Mario','DS',2006,'Platform','Nintendo',11.38,9.23,6.5,30.01);

update vgsales2 --modifying data on rows [DML]
set Global_Sales=30.35, NA_Sales=15.85
where ranking=3;

alter table vgsales2 --modifying the data type of the columns [DDL]
alter column NA_Sales decimal(5,2);
alter table vgsales2 
alter column EU_sales decimal(5,2);
alter table vgsales2 
alter column JP_sales decimal(5,2);
alter table vgsales2 
alter column Global_sales decimal(5,2);
alter table vgsales2
alter column Global_sales nvarchar(5);
select*from vgsales2

SELECT console,title FROM vgsales2 WHERE NA_Sales>10 --selecting data where NA_Sales are >10
SELECT DISTINCT title FROM vgsales2; --selecting the distinct value on the table
SELECT * FROM vgsales2 ORDER BY Global_Sales ASC; --organizing the global sales data from low to high
SELECT * FROM vgsales2 ORDER BY Global_Sales DESC; --organizing the glogbal sales data from high to low

SELECT * FROM vgsales2 WHERE Console='Wii' and Vintage<2010; --using the AND_OR conditions
SELECT Genre FROM vgsales2 WHERE Vintage BETWEEN 1980 AND 2010; --using the BETWEEN clause
SELECT Publisher FROM vgsales2 WHERE Publisher<>'PS'; --using the NOT clause

/* UNION Clause
SELECT Global_Sales 
FROM vgsales2
WHERE NA_sales and EU_Sales
UNION
SELECT
FROM
WHERE ____ AND ____

*/

SELECT*FROM vgsales2;

/* INTERSECT clause */
SELECT*FROM vgsales2
WHERE console BETWEEN 'Wii' and 'NES'
INTERSECT
SELECT*FROM vgsales2
WHERE Genre BETWEEN 'Sports' and 'Role-Playing';

