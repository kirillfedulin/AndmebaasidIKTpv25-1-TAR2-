--connect to DB (localdb)\MSSQLLocalDB

use kordamineIKT25;

create table opilane(
opilaneId int primary key identity(1,1),
nimi varchar(50), 
isikukood char(11) not null,
ryhmId int)

create table ryhm(
ryhmId int primary key identity(1,1),
ryhmNimi char(10) unique,
opilasteArv int);

--tabeli kustutamine 
drop table ...;

--välisvõti - FK (Foreign Key)
--tabeli muutmine
alter table opilane add foreign key (ryhmId) references ryhm(ryhmId);

--õiguste määramine varem tehtud kasutajale
grant select to Kirill; --saab vaadata kõik tabeleid 
grant insert on opilane to Kirill; --saab lisada ainult tabelisse opilane 

deny delete to Kirill;
