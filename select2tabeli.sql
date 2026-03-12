CREATE DATABASE select2tabeli;
use select2tabeli;


--laps tabel
CREATE TABLE laps(

    lapsID int not null PRIMARY KEY identity(1,1),

    nimi varchar(40) not null,

    pikkus smallint,

    synniaasta int null,

    synnilinn varchar(15)

    )

--insert
INSERT INTO laps(nimi, pikkus, synniaasta, synnilinn)
values('Kirill', 156, 2005, 'Tallinn'),
('Oleg', 166, 2005, 'Tallinn'),
('Nikita', 125, 2010, 'Tallinn'),
('Segera', 140, 2002, 'Tartu'),
('Lena', 126, 2007, 'Narva');
select * from laps;

CREATE TABLE loom(

    loomID int not null PRIMARY KEY identity(1,1),

    nimi varchar(40) not null,

    kaal smallint,

    lapsID int,

    FOREIGN KEY (lapsID) REFERENCES laps(lapsID) 

   )

Insert into loom(nimi, kaal, lapsID)
values('kass Vasili', 5, 2),
('koer Test', 15, 2),
('kass Kirja', 5, 2),
('kass Vasili', 5, 2),
('kass Käber', 5, 3);
select * from loom;


---Alias-nimede kasutamine 
select l.nimi, l.kaal from loom as l;

--sisemine ühendamine 
select * from laps, loom; --niii ei tohi kirjutada, sest esimene tabeli kirjed korrutakse teine tabeli kirjaga

--õige päring
select * from laps as lp, loom as l
where l.lapsID=lp.lapsID;

--kitsendamine päringu
select lp.nimi, l.nimi, l.kaal, lp.synnilinn
from laps as lp, loom as l
where l.lapsID=lp.lapsID;

--inner join ühendamine 
select * from laps inner join loom
on loom.lapsID=laps.lapsID;

--alias nimidega 
select lp.nimi as lapsenimi, l.nimi as loomanimi, l.kaal
from laps as lp inner join loom as l
on l.lapsID=lp.lapsID;

--left join
select lp.nimi as lapsenimi, l.nimi as loomanimi, l.kaal
from laps as lp left join loom as l
on l.lapsID=lp.lapsID;

--right join 
select lp.nimi as lapsenimi, l.nimi as loomanimi, l.kaal
from laps as lp right join loom as l
on l.lapsID=lp.lapsID;

--cross join --korrutatud tabelid
select lp.nimi as lapsenimi, l.nimi as loomanimi, l.kaal
from laps as lp cross join loom as l

create table varjupaik(
	varjupaikID int not null primary key identity(1,1),
	koht varchar(50) not null,
	firma varchar(30))

	alter table loom add varjupaikID int;
	alter table loom add constraint fk_varjupaik
	foreign key(varjupaikID) references varjupaik(varjupaikID);

	insert into varjupaik(koht, firma)
	values ('Pljassaare', 'Varjpaikade MTÜ');
	select * from varjupaik
	update loom set varjupaikID=1;
	select * from loom;

	--select 3 /mitme tabelite põhjal
select lp.nimi as lapsenimi, l.nimi as loomanimi, v.koht
from laps as lp, loom as l, varjupaik as v
where l.lapsID=lp.lapsID and l.varjupaikID=v.varjupaikID;

--sama inner joinga 
select lp.nimi as lapsenimi, l.nimi as loomanimi, v.koht
from (laps as lp loom as l
on l.lapsID=lp.lapsID) varjupaik as v
on l.varjupaikID=v.varjupaikID;
