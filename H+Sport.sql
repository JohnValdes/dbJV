

/*Creating Table*/
CREATE TABLE Products
(Product_ID int NOT NULL PRIMARY KEY IDENTITY (1000,1), --this generates the incremental sequence
ItemName varchar(50) NOT NULL,
Who char(1) NULL,
Price money NOT NULL);

SELECT*FROM Products;

/*inserting values into the columns of the table called Products*/
INSERT Products
VALUES ('Thermal Vest','U', 95);

DROP TABLE Products;