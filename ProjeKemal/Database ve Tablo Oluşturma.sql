create database JollyJokerVeriler
use JollyJokerVeriler

create table Musteriler(
MusteriId int identity(1,1) primary key,
Ad nvarchar(50),
Soyad nvarchar(50),
Email nvarchar(100),
Platformlar nvarchar(50)
)

create table KonserDetaylari(
SanatciId int identity(1,1) primary key,
SanatciAdi nvarchar(50),
SanatciSoyadi nvarchar(50),
KonserSehri nvarchar(50),
BiletKategori nvarchar(50),
BiletFiyat decimal(10,2)
)
create table BiletSatis(
SatisId int identity(1,1) primary key,
KonserTarihi date,
SatilanBiletSayisi int,
MusteriId int foreign key(MusteriId) references Musteriler(MusteriId),
SanatciId int foreign key(SanatciId) references KonserDetaylari(SanatciId)
)