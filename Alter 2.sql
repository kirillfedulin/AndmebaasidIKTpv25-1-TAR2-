--pirangud 
DROP TABLE city;

CREATE TABLE city(
ID int not NULL,
cityName varchar(50));

SELECT * from city;

--PK lisamine
ALTER TABLE city
ADD CONSTRAINT pk_ID PRIMARY KEY(ID);

--UNIQUE lisamine
ALTER TABLE City
ADD CONSTRAINT cityName_unique UNIQUE(cityName);

--FK lisamine
ALTER TABLE kasutaja ALTER COLUMN elukoht int;
select * from kasutaja
ALTER TABLE kasutaja
ADD CONSTRAINT fk_city FOREIGN KEY(elukoht)
REFERENCES City(ID);
