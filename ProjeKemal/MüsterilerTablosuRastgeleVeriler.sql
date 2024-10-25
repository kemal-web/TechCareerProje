declare @i int=1;
declare @Ad nvarchar(50);
declare @Soyad nvarchar(50);
declare @Email nvarchar (100);
declare @Platformlar nvarchar (100);

declare @Isimler table(Ad nvarchar(50));
insert into @Isimler values
('Melis'),('Merve'),('Tan'),('Seçil'),('Kemal'),('Banu'),('Edis'),('Mehmet'),('Hakan'),('Sýla'),('Levent'),('Bora'),('Cem'),
('Orhan'),('Ece'),('Birol')

declare @Soyadlar table(Soyad nvarchar(50));
insert into @Soyadlar values
('Yakýn'),('Alýcý'),('Kaya'),('Sertelli'),('Görmüþ'),('Çelik'),('Keskin'),('Tok'),('Durmuþ'),('Tanrýverdi'),('Özbay'),('Gencer'),
('Aþan'),('Erol'),('Ünüvar'),('Yalçýntaþ')

declare @Kanal table (Platformlar nvarchar(50));
insert into @Kanal values
('BiletiniAl'),('Biletix'),('Bubilet'),('BiletSeç'),('JollyJoker'),('Giþe'),('HayalKahvesi'),('Passo'),('BiletGo'),('Muud'),
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