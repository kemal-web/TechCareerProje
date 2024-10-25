declare @i int=1;
declare @Ad nvarchar(50);
declare @Soyad nvarchar(50);
declare @Email nvarchar (100);
declare @Platformlar nvarchar (100);

declare @Isimler table(Ad nvarchar(50));
insert into @Isimler values
('Melis'),('Merve'),('Tan'),('Se�il'),('Kemal'),('Banu'),('Edis'),('Mehmet'),('Hakan'),('S�la'),('Levent'),('Bora'),('Cem'),
('Orhan'),('Ece'),('Birol')

declare @Soyadlar table(Soyad nvarchar(50));
insert into @Soyadlar values
('Yak�n'),('Al�c�'),('Kaya'),('Sertelli'),('G�rm��'),('�elik'),('Keskin'),('Tok'),('Durmu�'),('Tanr�verdi'),('�zbay'),('Gencer'),
('A�an'),('Erol'),('�n�var'),('Yal��nta�')

declare @Kanal table (Platformlar nvarchar(50));
insert into @Kanal values
('BiletiniAl'),('Biletix'),('Bubilet'),('BiletSe�'),('JollyJoker'),('Gi�e'),('HayalKahvesi'),('Passo'),('BiletGo'),('Muud'),
('UzucaBilet'),('Biletingo')

while @i<=100000
begin
select top 1 @Ad=Ad from @Isimler order by NEWID();
select top 1 @Soyad=Soyad from @Soyadlar order by NEWID();
set @Email=LOWER(@Ad) + '.' + LOWER(@Soyad) + cast(@i as nvarchar(10)) + 'example.com';
select top 1 @Platformlar=Platformlar from @Kanal order by NEWID();

insert into Musteriler(Ad,Soyad,Email,Platformlar)
values (@Ad,@Soyad,@Email,@Platformlar)

set @i=@i+1;
end