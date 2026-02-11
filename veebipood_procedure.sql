CREATE DATABASE veebipoodFedulin;
USE veebipoodFedulin;

CREATE TABLE brands(
brand_id int PRIMARY KEY identity(1,1),
brand_name varchar(30) unique);

INSERT INTO brands(brand_name)
VALUES ('Gucci'), ('YSL');

select * from brands

CREATE TABLE products(
product_id int PRIMARY KEY identity(1,1),
product_name varchar(50) NOT NULL,
brand_id int,
category_id int,
FOREIGN KEY (category_id) references categories(category_id),
model_year int, 
list_price decimal(3,2));

INSERT INTO products(product_name, brand_id, category_id, model_year, list_price)
VALUES ('Gucci T-Särk', 1, 1, '2024', '400'),
('YSL Pusa', 3, 3, '2020', '799.99');

select * from products

DELETE FROM products Where product_id=2;




CREATE TABLE categories(
category_id int PRIMARY KEY identity(1,1),
category_name varchar(30) UNIQUE);

INSERT INTO categories(category_name)
VALUES ('T-särk'),('mantel'),('pusa'),('pintsak');

SELECT * FROM categories;
SELECT * FROM products;
SELECT * FROM brands;
Update categories SET category_name = 'kingad'
WHERE category_id=2;

--procedure mis lisab INSERT andmeid tabelisse brands
CREATE PROCEDURE lisaBrand 
@brand_nimi varchar(30)
as 
BEGIN
	INSERT INTO brands(brand_name) VALUES (@brand_nimi);
	SELECT * FROM brands;
END;

--procedure kutse
EXEC lisaBrand 'Kirill';

--procedure mis kutsutab DELETE tabelist id järgi 
CREATE PROCEDURE kustutaBrand
@id int 
as
BEGIN
SELECT * FROM brands;
Delete from brands where brand_id=@id;
SELECT * FROM brands;
END;


--kutse 
EXEC kustutaBrand 2;
EXEC kustutaBrand @id=2;


--procedure mis otsib 1 tähte järgi brandinimed
CREATE PROCEDURE otsing1tahte
@taht char(1)
as
begin
select * from brands where brand_name LIKE @taht + '%';
end;

--kutse 
EXEC otsing1tahte 'A';


--procedure mis uuendab UPDATE brandinimi id järgi
create procedure uuendaBrand
@id int,
@uus_brandNimi varchar(30)
as
begin
select * from brands;
update brands set brand_name=@uus_brandNimi
where brand_id=@id;
select * from brands;
end;

--kutse 
EXEC uuendaBrand 1, 'Bape';
