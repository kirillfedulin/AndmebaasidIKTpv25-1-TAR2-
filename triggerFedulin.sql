CREATE DATABASE trigerFedulin
USE trigerFedulin

--tabel linnad
CREATE TABLE linnad(
linnID int primary key identity(1,1),
linnanimi varchar(50) unique,
rahvaarv int not null);

--tabel logi
CREATE TABLE logi(
ID int primary key identity(1,1),
kuupaev datetime,
andmed TEXT);

--Insert Triger
CREATE TRIGGER linnaLisamine
ON linnad
FOR INSERT 
AS 
INSERT INTO logi(kuupaev, andmed)
SELECT 
getdate(), inserted.linnanimi
FROM inserted;

--kontrollimiseks tuleb lisada uus linn tabelisse linnad
INSERT INTO linnad(linnanimi, rahvaarv)
VALUES ('Test', 1111);
SELECT * FROM linnad;
SELECT * FROM logi;

--kustutamine triger
drop trigger linnaLisamine

--teine triger
CREATE TRIGGER linnaLisamine
ON linnad
FOR INSERT 
AS 
INSERT INTO logi(kuupaev, andmed)
SELECT 
getdate(), 
CONCAT('lisatud linn: ', inserted.linnanimi, ' ! rahvaarv: ', inserted.rahvaarv, ' ! id: ', inserted.linnID)
FROM inserted;

--DELETE TRIGGER
CREATE TRIGGER linnaKustutamine
ON linnad
FOR DELETE
AS 
INSERT INTO logi(kuupaev, andmed)
SELECT 
getdate(), 
CONCAT('kustutatud linn: ', deleted.linnanimi, ' ! rahvaarv: ', deleted.rahvaarv, ' ! id: ', deleted.linnID)
FROM deleted;

delete from linnad where linnID=1;
select * from linnad;
select * from logi;

--UPDATE TRIGGER
CREATE TRIGGER linnaParandamine
ON linnad
FOR UPDATE
AS 
INSERT INTO logi(kuupaev, andmed)
SELECT 
getdate(), 
CONCAT('kustutatud linn: ', d.linnanimi, ' ! rahvaarv: ', d.rahvaarv, ' ! id: ', d.linnID, 'i linn: ', i.linnanimi, ' ! rahvaarv: ', i.rahvaarv, ' ! id: ', i.linnID)
FROM deleted d inner join inserted i
on d.linnID=i.linnID;

--kontrollimiseks uuendame linna andmed 
SELECT * FROM linnad;
UPDATE linnad set linnanimi='Tap uus', rahvaarv=26
where linnID=2;
select * from linnad;
select * from logi;

--lisame kasutajanimi logi tabelisse
ALTER TABLE logi ADD kasutaja varchar(40);
