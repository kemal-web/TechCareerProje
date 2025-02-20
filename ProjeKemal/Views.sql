
create view vw_TarihAralığındakiSatılanBiletler
as
select SatilanBiletSayisi,KonserTarihi
from BiletSatis
where KonserTarihi between '2023-06-01' and '2023-09-25'


select * from vw_TarihAralığındakiSatılanBiletler
---

create view vw_TarihAralağındaSatılanToplamBilet
as
select sum(SatilanBiletSayisi) as ToplamBiletSayisi
from BiletSatis
where KonserTarihi between '2023-06-01' and '2023-09-25'

select * from vw_TarihAralağındaSatılanToplamBilet
---
  create view vw_TümKonserler
  as
  select
  B.SatisId, M.Ad as MusteriAdi,M.Soyad as MusteriSoyadi,K.SanatciAdi as SanatciAdi,K.SanatciSoyadi as SanatciSoyadi,B.KonserTarihi
  from BiletSatis B
  join Musteriler M on B.MusteriId=M.MusteriId
  Join KonserDetaylari K on B.SanatciId=K.SanatciId
  select * from vw_TümKonserler
