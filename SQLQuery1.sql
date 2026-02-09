CREATE DATABASE veebipoodFedulin;
USE veebipoodFedulin;
--tabel Categories 
CREATE TABLE categories(
category_id int PRIMARY KEY identity(1,1),
category_name varchar(30) unique);

INSERT INTO categories(category_name)
VALUES ('T-särk'),('mantel'),('pusa'),('pintsak'),('püksid')
SELECT * FROM categories;

--tabel products
CREATE TABLE products (
product_id int PRIMARY KEY identity(1,1),
product_name varchar(50) NOT NULL,
brand_id int,
category_id int,
FOREIGN KEY (category_id) references categories(category_id),
model_year int,
list_price decimal(7,2));

--table brands 
CREATE TABLE brands (
brand_id int PRIMARY KEY identity(1,1),
brand_name varchar(30) unique);

ALTER TABLE products ADD CONSTRAINT brands
FOREIGN KEY (brand_id) references brands(brand_id);


INSERT INTO products (
product_name, brand_id, category_id, model_year, list_price)
VALUES
('logoga T-särk',1, 2, 2020, 25.50),
('gucci püksid', 2, 3, 2019, 200.56),
('bape pusa', 3, 4, 2015, 400.50),
('Balenciaga mantel ', 4, 5, 2009, 1000.25);

--INSERT INTO brands


SELECT * FROM products
SELECT * FROM brands;
SELECT * FROM categories;

DROP TABLE staffs

--table stocks --two primary key
CREATE TABLE stocks(
store_id int,
product_id int,
quantity int,
PRIMARY KEY (store_id, product_id),
foreign key (product_id) references products(product_id)
);


--table customers 
CREATE TABLE customers (
customer_id int PRIMARY KEY identity(1,1),
first_name varchar(50) NOT NULL,
last_name varchar(50) NOT NULL unique,
phone varchar(15) unique, 
email varchar(50) unique,
street varchar(25),
city varchar(50),
user_state varchar(50),
zip_code char(5));

--table staffs
CREATE TABLE staffs (
staff_id int PRIMARY KEY identity(1,1),
first_name varchar(50),
last_name varchar(50) NOT NULL unique,
email varchar(50) unique,
phone varchar(15) unique, 
active varchar(50),
store_id int unique,
manager_id int unique,
);

--table orders
CREATE TABLE orders (
orders_id int PRIMARY KEY identity(1,1),
customer_id int unique,
order_status varchar(30) check(order_status='valmis' or order_status = 'töötlemisel' or order_status = 'makstud'),
orded_date date,
requried_date date,
shipped_date date,
store_id int unique,
staff_id int unique,
);

--table stores
CREATE TABLE stores (
store_id int PRIMARY KEY identity(1,1),
store_name varchar(50),
phone int,
email varchar(50) unique,
street varchar(25),
city varchar(50),
user_state varchar(50),
zip_code int unique
);

--table order_items
CREATE TABLE order_items (
order_id int,
item_id int,
product_id int unique,
quantity int,
list_price decimal (7,2),
FOREIGN KEY (order_id) REFERENCES orders(order_id),
discount int
PRIMARY KEY (order_id, item_id),
);

ALTER TABLE stocks ADD CONSTRAINT fk_store
FOREIGN KEY (store_id) references stores(store_id)

INSERT INTO customers (
first_name, last_name, phone, email, street, city, user_state, zip_code)
VALUES
('oleg', 'bagalev', 5569870, 'oleg.baglaev@gmail.com', 'mustamäe', 'Tallinn', 'Harjuma', 444414),
('nikita', 'stanogin', 55904561, 'niktia.stanogin@gmail.com', 'mustamäe', 'Tallinn', 'Harjuma', 948124);
