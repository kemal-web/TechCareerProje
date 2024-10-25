declare @i int=1;
declare @SanatciAdi nvarchar(50);
declare @SanatciSoyadi nvarchar(50);
declare @KonserSehri nvarchar(50);
declare @BiletKategori nvarchar(100);
declare @BiletFiyat decimal (10,2);

declare @SanatciAdlar� table(SanatciAdi nvarchar(50));
insert into @SanatciAdlar� values
('Hande'),('Hayko'),('B�lent'),('Seda'),('Murat'),('Cem'),('A�k�n Nur'),('�ebnem'),('Ajda'),('Sezen'),('Tarkan'),('Zeki'),('Mabel'),
('Harun'),('Haluk'),('Kenan')

declare @SanatciSoyadlari table(SanatciSoyadi nvarchar(50));
insert into @SanatciSoyadlari values
('Yener'),('Cepkin'),('Ersoy'),('Sayan'),('Boz'),('Adrian'),('Yengi'),('Ferah'),('Pekkan'),('Aksu'),('Teveto�lu'),('M�ren'),('Matiz'),
('Kol�ak'),('Levent'),('Do�ulu')

declare @KonserSehirleri table(KonserSehri nvarchar(50));
insert into @KonserSehirleri values
('Adana'),('Denizli'),('Mersin'),('Van'),('�stanbul'),('Mu�la'),('Trabzon'),('Antalya'),('Yalova'),('�zmir'),('Bursa'),('Diyarbak�r'),
('Gaziantep'),('Sivas')

declare @Kategoriler table(BiletKategori nvarchar(100));
insert into @Kategoriler values
('Sahne �n�'),('Loca 1'),('Loca 2'),('Sahne �n� Vip'),('Bistro A'),('Bistro B'),('Trib�n Koltuk'),('Ayakta')

while @i<=100000
begin
select top 1 @SanatciAdi=SanatciAdi from @SanatciAdlar� order by NEWID()
select top 1 @SanatciSoyadi=SanatciSoyadi from @SanatciSoyadlari order by NEWID()
select top 1 @KonserSehri=KonserSehri from @KonserSehirleri order by NEWID()
select top 1 @BiletKategori=BiletKategori from @Kategoriler order by NEWID()
set @BiletFiyat= ROUND(Rand()*(5000-150)+10,2);

insert into KonserDetaylari(SanatciAdi,SanatciSoyadi,KonserSehri,BiletKategori,BiletFiyat)
values(@SanatciAdi,@SanatciSoyadi,@KonserSehri,@BiletKategori,@BiletFiyat)

set @i=@i+1;
end

