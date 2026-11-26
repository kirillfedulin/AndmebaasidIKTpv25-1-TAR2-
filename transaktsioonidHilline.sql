create database transaktsioonidHilline
use transaktsioonidHilline

Create Table tblMailingAddress
(
   AddressId int NOT NULL primary key,
   EmployeeNumber int,
   HouseNumber nvarchar(50),
   StreetAddress nvarchar(50),
   City nvarchar(10),
   PostalCode nvarchar(50)
)

select * from tblMailingAddress;

Insert into tblMailingAddress values (1, 101, '#10', 'King Street', 'Londoon', 'CR27DW')

select * from tblMailingAddress;


Create Table tblPhysicalAddress
(
 AddressId int NOT NULL primary key,
 EmployeeNumber int,
 HouseNumber nvarchar(50),
 StreetAddress nvarchar(50),
 City nvarchar(10),
 PostalCode nvarchar(50)
)

Insert into tblPhysicalAddress values (1, 101, '#10', 'King Street', 'Londoon', 'CR27DW')

select * from tblPhysicalAddress;



Create Procedure spUpdateAddress
as
Begin
 Begin Try
  Begin Transaction
   Update tblMailingAddress set City = 'LONDON' 
   where AddressId = 1 and EmployeeNumber = 101
   
   Update tblPhysicalAddress set City = 'LONDON' 
   where AddressId = 1 and EmployeeNumber = 101
  Commit Transaction
 End Try
 Begin Catch
  Rollback Transaction
 End Catch
End


select * from tblMailingAddress;
select * from tblPhysicalAddress;


Alter Procedure spUpdateAddress
as
Begin
 Begin Try
  Begin Transaction
   Update tblMailingAddress set City = 'LONDON12' 
   where AddressId = 1 and EmployeeNumber = 101
   
   Update tblPhysicalAddress set City = 'LONDON LONDON' 
   where AddressId = 1 and EmployeeNumber = 101
  Commit Transaction
 End Try
 Begin Catch
  Rollback Transaction
 End Catch
End

select * from tblMailingAddress;
select * from tblPhysicalAddress;

Update tblMailingAddress set City = 'LONDON12' 
where AddressId = 1 and EmployeeNumber = 101

Update tblPhysicalAddress set City = 'LONDON LONDON' 
where AddressId = 1 and EmployeeNumber = 101

select * from tblMailingAddress;
select * from tblPhysicalAddress;





--OSA2

Create Table tblArveldusarve
(
   KontoId int NOT NULL primary key,
   KliendiNr int,
   Omanik nvarchar(30),
   Saldo decimal(10,2) CHECK (Saldo >= 0)
)

Create Table tblHoiusarve
(
   KontoId int NOT NULL primary key,
   KliendiNr int,
   Omanik nvarchar(30),
   Saldo decimal(10,2) CHECK (Saldo >= 0)
)

Insert into tblArveldusarve values (1, 201, 'Mari Maasikas', 500.00)
Insert into tblHoiusarve values (1, 201, 'Mari Maasikas', 1000.00)

select * from tblArveldusarve;
select * from tblHoiusarve;


Create Procedure spUlekanne
as
Begin
 Begin Try
  Begin Transaction
   Update tblHoiusarve set Saldo = Saldo + 200
   where KliendiNr = 201

   Update tblArveldusarve set Saldo = Saldo - 200
   where KliendiNr = 201
  Commit Transaction
 End Try
 Begin Catch
  Rollback Transaction
 End Catch
End

select * from tblArveldusarve;   
select * from tblHoiusarve;  


Alter Procedure spUlekanne
as
Begin
 Begin Try
  Begin Transaction
   Update tblHoiusarve set Saldo = Saldo + 1000
   where KliendiNr = 201

   Update tblArveldusarve set Saldo = Saldo - 1000
   where KliendiNr = 201
  Commit Transaction
 End Try
 Begin Catch
  Rollback Transaction
 End Catch
End

select * from tblArveldusarve;   
select * from tblHoiusarve; 

Update tblHoiusarve set Saldo = Saldo + 1000
where KliendiNr = 201

Update tblArveldusarve set Saldo = Saldo - 1000
where KliendiNr = 201   

select * from tblArveldusarve;   
select * from tblHoiusarve; 



Update tblArveldusarve set Saldo = 300.00 where KontoId = 1
Update tblHoiusarve set Saldo = 1200.00 where KontoId = 1

Alter Procedure spUlekanne
 @Summa decimal(10,2)
as
Begin
 Begin Try
  Begin Transaction
   Update tblHoiusarve set Saldo = Saldo + @Summa
   where KliendiNr = 201

   Update tblArveldusarve set Saldo = Saldo - @Summa
   where KliendiNr = 201
  Commit Transaction
 End Try
 Begin Catch
  Rollback Transaction
 End Catch
End

select * from tblArveldusarve;  
select * from tblHoiusarve;







--OSA3 
Create Table tblLadu
(
   ProduktId int NOT NULL primary key,
   Nimi nvarchar(30),
   Hind decimal(10,2),
   Laoseis int CHECK (Laoseis >= 0)
)

Create Table tblTellimus
(
   TellimusId int NOT NULL primary key,
   ProduktId int,
   Klient nvarchar(30),
   Kogus int
)

Insert into tblLadu values (1, 'Hiir', 15.50, 10)
Insert into tblLadu values (2, 'Klaviatuur', 35.00, 5)
Insert into tblLadu values (3, 'Monitor', 150.00, 3)

Insert into tblTellimus values (1, 1, 'Mari Maasikas', 1)
Insert into tblTellimus values (2, 2, 'Jaan Tamm', 1)
Insert into tblTellimus values (3, 3, 'Kati Kask', 1)


select * from tblLadu;
select * from tblTellimus;


Create Procedure spLisaTellimusse
 @TellimusId int,
 @ProduktId int,
 @Kogus int
as
Begin
 Begin Try
  Begin Transaction
   Update tblTellimus set Kogus = Kogus + @Kogus
   where TellimusId = @TellimusId

   Update tblLadu set Laoseis = Laoseis - @Kogus
   where ProduktId = @ProduktId
  Commit Transaction
 End Try
 Begin Catch
  Rollback Transaction
  select ERROR_MESSAGE() as Veateade
 End Catch
End

select * from tblLadu;       
select * from tblTellimus;   


Execute spLisaTellimusse @TellimusId = 1, @ProduktId = 1, @Kogus = 2

select * from tblLadu;       
select * from tblTellimus;  



Execute spLisaTellimusse @TellimusId = 3, @ProduktId = 3, @Kogus = 10

select * from tblLadu;       
select * from tblTellimus;   
