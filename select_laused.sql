create database selectKirill;
use selectKirill;
--mockaroo.com - admete geneerimiseks
create table auto (
	auto_id INT primary key,
	auto_number CHAR(6) not null,
	mark VARCHAR(50) not null,
	mudel VARCHAR(50),
	varv VARCHAR(50),
	v_aasta int
);
insert into auto (auto_id, auto_number, mark, mudel, varv, v_aasta) values (1, 'LH7260', 'Cadillac', 'DTS', 'Puce', 2008);
insert into auto (auto_id, auto_number, mark, mudel, varv, v_aasta) values (2, 'UA7050', 'Mitsubishi', 'Pajero', 'Khaki', 1991);
insert into auto (auto_id, auto_number, mark, mudel, varv, v_aasta) values (3, 'SA8535', 'Dodge', 'Intrepid', 'Puce', 2001);
insert into auto (auto_id, auto_number, mark, mudel, varv, v_aasta) values (4, 'SK9048', 'GMC', 'Yukon XL 2500', 'Aquamarine', 2001);
insert into auto (auto_id, auto_number, mark, mudel, varv, v_aasta) values (5, 'AV9936', 'Lincoln', 'Navigator', 'Goldenrod', 2000);
insert into auto (auto_id, auto_number, mark, mudel, varv, v_aasta) values (6, 'AC1049', 'Infiniti', 'G37', 'Khaki', 2009);
insert into auto (auto_id, auto_number, mark, mudel, varv, v_aasta) values (7, 'CX6909', 'Acura', 'NSX', 'Fuscia', 1996);
insert into auto (auto_id, auto_number, mark, mudel, varv, v_aasta) values (8, 'ET6441', 'Mazda', 'B-Series Plus', 'Puce', 2000);
insert into auto (auto_id, auto_number, mark, mudel, varv, v_aasta) values (9, 'SK9472', 'Ford', 'Mustang', 'Puce', 2010);
insert into auto (auto_id, auto_number, mark, mudel, varv, v_aasta) values (10, 'TG6220', 'Dodge', 'Caravan', 'Teal', 2001);
insert into auto (auto_id, auto_number, mark, mudel, varv, v_aasta) values (11, 'AV2122', 'Lexus', 'RX', 'Purple', 2011);
insert into auto (auto_id, auto_number, mark, mudel, varv, v_aasta) values (12, 'SA9373', 'Mercury', 'Tracer', 'Goldenrod', 1998);
insert into auto (auto_id, auto_number, mark, mudel, varv, v_aasta) values (13, 'AI1534', 'Pontiac', 'Turbo Firefly', 'Maroon', 1988);
insert into auto (auto_id, auto_number, mark, mudel, varv, v_aasta) values (14, 'ET2520', 'Pontiac', 'G6', 'Orange', 2006);
insert into auto (auto_id, auto_number, mark, mudel, varv, v_aasta) values (15, 'LA9709', 'Kia', 'Sedona', 'Fuscia', 2006);
insert into auto (auto_id, auto_number, mark, mudel, varv, v_aasta) values (16, 'WN9450', 'Nissan', 'Altima', 'Fuscia', 2013);
insert into auto (auto_id, auto_number, mark, mudel, varv, v_aasta) values (17, 'LH1345', 'Chevrolet', 'Colorado', 'Khaki', 2008);
insert into auto (auto_id, auto_number, mark, mudel, varv, v_aasta) values (18, 'TG4718', 'GMC', 'Sierra 3500', 'Goldenrod', 2002);
insert into auto (auto_id, auto_number, mark, mudel, varv, v_aasta) values (19, 'AI6706', 'Kia', 'Sephia', 'Crimson', 1997);
insert into auto (auto_id, auto_number, mark, mudel, varv, v_aasta) values (20, 'SQ3533', 'GMC', 'Yukon', 'Red', 1994);
insert into auto (auto_id, auto_number, mark, mudel, varv, v_aasta) values (21, 'KL9925', 'Hyundai', 'Sonata', 'Orange', 2003);
insert into auto (auto_id, auto_number, mark, mudel, varv, v_aasta) values (22, 'AZ3199', 'Bentley', 'Continental GT', 'Puce', 2009);
insert into auto (auto_id, auto_number, mark, mudel, varv, v_aasta) values (23, 'TG1734', 'Mitsubishi', 'Lancer Evolution', 'Indigo', 2011);
insert into auto (auto_id, auto_number, mark, mudel, varv, v_aasta) values (24, 'UA8158', 'GMC', 'Sierra 1500', 'Yellow', 2011);
insert into auto (auto_id, auto_number, mark, mudel, varv, v_aasta) values (25, 'QF1403', 'Lexus', 'LS', 'Orange', 1995);
select * from auto;

--andmete soorterimine 
--kasvavas järjekorras ASC
SELECT * from auto
ORDER BY v_aasta;
--kahanevas järjekorras
select * from auto
order by v_aasta desc;
--kuav ainult kaks veergu
select mark, mudel FROM auto;
--kordavate väärtuste välistamine DISTINCT
select distinct mark from auto;
--võrdlemine 
--1. suurem kui > väiksem < kui võrdub =
--leila kõik autod, kus on v_aasta 2000 peale 
select mark, mudel, v_aasta
FROM auto
where v_aasta >=2000;
--leia kõik autod mis on v_aasta vahemikus 2000-2005
select mark, mudel, v_aasta
FROM auto
where v_aasta between 2000 and 2005; --where v_aasta >=2000 and v_aasta <=2005;

--2. võrdlamine teksti või sümbooliga 
--kuvab kõik Cadillac autod
select mark, mudel, v_aasta
FROM auto
where mark LIKE 'Cadillac';
--in lause kuvab vastavus loetelus -соответствие перечислению  
select mark, mudel, v_aasta
FROM auto
where mark IN ('Cadillac', 'Ford', 'Lexus');
--ilma IN
select mark, mudel, v_aasta
FROM auto
where mark LIKE 'Cadillac' or mark like 'Lexus';

--vastavus mustrile -шаблон 
--algab F tähega - начинается
select mark, mudel, v_aasta
FROM auto
where mark LIKE 'F%';
--lõpeb p -tähega - заканчивается
select mark, mudel, v_aasta
FROM auto
where mark LIKE '%p';
--siseldab a täht - содержит
select mark, mudel, v_aasta
FROM auto
where mark LIKE '%a%';
--kuvada esimest 5 mudeli
select * from auto;
select TOP 5 mudel, varv 
from auto
where varv like 'Orange'
Order by varv ;

--agreegaat funktsioonid: SUM, MIN, MAX, AVG, COUNT
select count(*) as autodeArv from auto;
select max(v_aasta) as suurem_aasta from auto;
--keerulisem variant 
SELECT mark, AVG(v_aasta) as keskmine_aasta 
from auto
GRoup by mark;



CREATE TABLE Products
(
    Id INT IDENTITY PRIMARY KEY,
    ProductName NVARCHAR(30) NOT NULL,
    Manufacturer NVARCHAR(20) NOT NULL,
    ProductCount INT DEFAULT 0,
    Price MONEY NOT NULL
);

insert into Products(ProductName, Manufacturer, ProductCount, Price)
values('Koomid', 'KoomiPrint', 1300, 1.30),
('Arvutid', 'TereMaailma', 2000, 1199.99),
('Pallid', 'Paalnee', 956, 39.59),
('Telefonid', 'Apple', 4000, 2000),
('Rided', 'Nike', 21000, 2000);

select * from Products;

CREATE PROCEDURE ProductSummary
AS
BEGIN 
SELECT ProductName AS Product, Manufacturer, Price
FROM Products
end;
drop procedure productSummary
--kutse 
EXEC ProductSummary;


--proceduur mis lisab uus produkt  
CREATE PROCEDURE AddProduct
    @name NVARCHAR(20),
    @manufacturer NVARCHAR(20),
    @count INT,
    @price MONEY
AS
INSERT INTO Products(ProductName, Manufacturer, ProductCount, Price) 
VALUES(@name, @manufacturer, @count, @price)


--kutse 2
DECLARE @prodName NVARCHAR(20), @company NVARCHAR(20);
DECLARE @prodCount INT, @price MONEY
SET @prodName = 'Galaxy C7'
SET @company = 'Samsung'
SET @price = 220
SET @prodCount = 5
 
EXEC AddProduct @prodName, @company, @prodCount, @price
 
SELECT * FROM Products

--kutse 3
 
DECLARE @prodName NVARCHAR(20), @company NVARCHAR(20);
SET @prodName = 'Honor 9'
SET @company = 'Huawei'
 
EXEC AddProduct @name = @prodName, 
                @manufacturer=@company,
                @count = 3, 
                @price = 18000


--protsedur ilma kasutaja parametrida 
CREATE PROCEDURE AddProductWithOptionalCount
    @name NVARCHAR(20),
    @manufacturer NVARCHAR(20),
    @price MONEY,
    @count INT = 1
AS
INSERT INTO Products(ProductName, Manufacturer, ProductCount, Price) 
VALUES(@name, @manufacturer, @count, @price)


--kutse
DECLARE @prodName NVARCHAR(20), @company NVARCHAR(20), @price MONEY
SET @prodName = 'Redmi Note 5A'
SET @company = 'Xiaomi'
SET @price = 22000
 
EXEC AddProductWithOptionalCount @prodName, @company, @price
 
SELECT * FROM Products
