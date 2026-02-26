CREATE DATABASE itkpv25_1
use itkpv25_1
create table kasutaja(
kasutaja_id int primary key identity(1,1),
kasutajanimi varchar(25) not null,
parool char(10) not null);
select * from kasutaja;
insert into kasutaja(kasutajanimi, parool)
values('oleg', 'testik');
--uue veeru lisamine
ALTER TABLE kasutaja ADD epost varchar(20);

UPDATE kasutaja SET epost='test@est.ee' WHERE kasutaja_id=1;

--veeru kustutamine
ALTER TABLE kasutaja DROP COLUMN epost;
--veru andmetüübi muutmine
ALTER TABLE kasutaja ALTER COLUMN parool varchar(25);

--protseduri tabeli muutmieks loomine
CREATE PROCEDURE alterTable 
@valik varchar(20),
@tabelinimi varchar(25),
@veerunimi varchar(25),
@tyyp varchar(20)=null
as 
begin
	DECLARE @sql as varchar(max)
	SET @sql=case 
	when @valik='add' then 
	concat('ALTER TABLE ', @tabelinimi, ' ADD ', @veerunimi, ' ',@tyyp)
	when @valik='drop' then 
	concat('ALTER TABLE ', @tabelinimi, ' DROP COLUMN ', @veerunimi)
	when @valik='alter' then 
	concat('ALTER TABLE ', @tabelinimi, ' ALTER COLUMN ', @veerunimi, ' ', @tyyp)
	end;
	print @sql;
	begin
	exec (@sql);
	end;
end;

--kutse
exec alterTable @valik='add', @tabelinimi='kasutaja', @veerunimi='mobiil', @tyyp='int'; 
select * from kasutaja

--kustutamine
exec alterTable @valik='drop', @tabelinimi='kasutaja', @veerunimi='mobiil';

--veru mutmine
exec alterTable @valik='alter', @tabelinimi='kasutaja', @veerunimi='elukoht', @tyyp='varchar(30)'; 

--proc kustutamine
drop procedure alterTable 
