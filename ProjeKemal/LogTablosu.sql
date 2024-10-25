create table Log_Tablosu(
LogId int identity(1,1) primary key,
SanatciId int,
IslemTipi nvarchar(50),
IslemTarihi datetime,
IslemYapanKullanici nvarchar(50)
)

create trigger trg_LogSanatciEkleme
on KonserDetaylari
for insert
as
begin
declare @SanatciId int,@IslemTarihi DateTime,@IslemYapanKullanici nvarchar(50)
select @SanatciId=SanatciId from inserted
set @IslemTarihi=GetDate()
set @IslemYapanKullanici=SYSTEM_USER

insert into Log_Tablosu(SanatciId,IslemTipi,IslemTarihi,IslemYapanKullanici)
values(@SanatciId,'INSERT',@IslemTarihi,@IslemYapanKullanici)
end
insert into KonserDetaylari(SanatciAdi,SanatciSoyadi,KonserSehri,BiletKategori,BiletFiyat)
values('Koray','Avcý','Konya','Sahne Önü',448)