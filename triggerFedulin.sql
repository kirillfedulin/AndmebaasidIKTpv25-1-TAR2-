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
andmed TEXT,
kasutaja varchar(25));

--tabel maakonnad
CREATE TABLE maakonnad(
maakondID int primary key identity(1,1),
maakondNimi varchar(25) UNIQUE);

--foreign key tabelis linnad
ALTER TABLE linnad ADD maakondID int;
SELECT * FROM linnad;
ALTER TABLE linnad ADD CONSTRAINT fk_maakond
FOREIGN KEY (maakondID) REFERENCES maakonnad(maakondID)
--täidame tabelid
--maakonnad
INSERT INTO maakonnad
VALUES('Harjumaa'), ('Pärnumaa'), ('Virumaa');

SELECT * FROM maakonnad;
INSERT INTO linnad (linnanimi, rahvaarv, maakondID)
VALUES ('Tallinn', 600000, 1), ('Rakvere', 150000, 3);

Select * from linnad, maakonnad 
WHERE linnad.maakondID=maakonnad.maakondID;
-- sama päring inner join'iga
Select * from linnad inner join maakonnad 
ON linnad.maakondID=maakonnad.maakondID;

--Insert Triger, mis jälgib kaks seostatud tabelit
CREATE TRIGGER linnaLisamine
ON linnad
FOR INSERT 
AS 
INSERT INTO logi(kuupaev, andmed, kasutaja)
SELECT 
getdate(),
CONCAT('lisatatud linn: ',inserted.linnanimi, ', ', inserted.rahvaarv, ', ', m.maakondNimi),
SYSTEM_USER
FROM inserted INNER JOIN maakonnad m
ON inserted.maakondID=m.maakondID;

--kontrollimiseks tuleb lisada uus linn tabelisse linnad
INSERT INTO linnad(linnanimi, rahvaarv, maakondID)
VALUES ('Paide', 100000, 2);
SELECT * FROM linnad;
SELECT * FROM logi;


--triger mis jälgib andmete kustutamine seotud tabelite põhjal
CREATE TRIGGER linnaKustutamine
ON linnad
FOR DELETE
AS 
INSERT INTO logi(kuupaev, andmed, kasutaja)
SELECT 
getdate(),
CONCAT('kustutatud linn ',deleted.linnanimi, ', ', deleted.rahvaarv, ', ', m.maakondNimi),
SYSTEM_USER
FROM deleted INNER JOIN maakonnad m
ON deleted.maakondID=m.maakondID;

--kontroll
DELETE FROM linnad where linnID=1;
select * from logi;
Drop trigger linnaKustutamine;
drop trigger linnaLisamine

--kontroll
delete from linnad where linnID=1;
select * from linnad;
select * from logi;

--UPDATE TRIGGER
CREATE TRIGGER linnaUuendamine
ON linnad
FOR UPDATE
AS 
INSERT INTO logi(kuupaev, andmed, kasutaja)
SELECT 
getdate(),
CONCAT(
'kustutatud linn ',deleted.linnanimi, ', ', deleted.rahvaarv, ', ', m1.maakondNimi,
'|| uue linn ',inserted.linnanimi, ', ', inserted.rahvaarv, ', ', m2.maakondNimi),
SYSTEM_USER
FROM deleted 
INNER JOIN inserted on deleted.linnID=inserted.linnID
INNER JOIN maakonnad m1 on deleted.maakondID=m1.maakondID
INNER JOIN maakonnad m2 on deleted.maakondID=m2.maakondID;

--kontrollimiseks uuendame linna andmed 
SELECT * FROM linnad;
SELECT * FROM maakonnad
UPDATE linnad set maakondId=1 where linnID=5;
