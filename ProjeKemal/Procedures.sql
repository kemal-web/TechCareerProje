create procedure dbo.sp_KonserSehriEkle
@SanatciAdi nvarchar(50),
@SanatciSoyadi nvarchar(50),
@KonserSehri nvarchar(50),
@BiletKategori nvarchar(50),
@BiletFiyat decimal(10,2)
as
begin
insert into
KonserDetaylari(SanatciAdi,SanatciSoyadi,KonserSehri,BiletKategori,BiletFiyat)
values
(@SanatciAdi,@SanatciSoyadi,@KonserSehri,@BiletKategori,@BiletFiyat)
end

exec dbo.sp_KonserSehriEkle 'Tan','Taþçý','Iðdýr','Halk Konseri','981.15'
---

create procedure dbo.sp_BiletSatis
as
begin
declare @TarihBaslangic date='2022-08-01'
declare @TarihBitis date= '2023-07-31'

select sum(SatilanBiletSayisi) as ToplamBiletSayisi from BiletSatis where KonserTarihi between @TarihBaslangic and @TarihBitis

end

exec dbo.sp_BiletSatis
---

  create procedure Konserler1
  @SatisId int
  as
  begin
  select B.SatisId, M.Ad as MusteriAdi,M.Soyad as MusteriSoyadi,K.SanatciAdi as SanatciAdi,K.SanatciSoyadi as SanatciSoyadi,B.KonserTarihi
  from BiletSatis B
  join Musteriler M on B.MusteriId=M.MusteriId
  Join KonserDetaylari K on B.SanatciId=K.SanatciId
  where B.SatisId=@SatisId
  order by B.KonserTarihi Desc
  end

  exec Konserler1 860