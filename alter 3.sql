--tegeme tabelit

CREATE TABLE Category(
idCategory int primary key identity(1,1),
Category_Name varchar(30) not null unique);

select * from Category

insert into Category(Category_Name)
values('ooo')

drop table Product
CREATE TABLE Product(
idProduct int primary key identity(1,1),
Name VARCHAR(30),
idCategory INT NOT NULL,
Price DECIMAL(10,2) CHECK (Price >= 0),
FOREIGN KEY (idCategory) REFERENCES Category(idCategory)); 
select * from Product

insert into Product(Price)
values('222')

drop table sale
CREATE TABLE Sale(
idSale int primary key identity(1,1),
idProduct int,
FOREIGN KEY (idProduct) REFERENCES Product(idProduct),
idCustomer INT,
Count_pr INT CHECK (Count_pr > 0),
Date_of_sale varchar(30),
FOREIGN KEY (idProduct) REFERENCES Product(idProduct));
select * from Sale 

insert into Sale(idCustomer, Count_pr, Date_of_sale)
values('1', '1', 'bbb')

--muuta mingi välja tüüpi

ALTER TABLE Sale ADD Units varchar(20);

UPDATE Sale SET Units='gramm' WHERE kasutaja_id=1;
