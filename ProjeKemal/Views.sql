
create view vw_TarihAral���ndakiSat�lanBiletler
as
select SatilanBiletSayisi,KonserTarihi
from BiletSatis
where KonserTarihi between '2023-06-01' and '2023-09-25'


select * from vw_TarihAral���ndakiSat�lanBiletler
---

create view vw_TarihArala��ndaSat�lanToplamBilet
as
select sum(SatilanBiletSayisi) as ToplamBiletSayisi
from BiletSatis
where KonserTarihi between '2023-06-01' and '2023-09-25'

select * from vw_TarihArala��ndaSat�lanToplamBilet
---
  create view vw_T�mKonserler
  as
  select
  B.SatisId, M.Ad as MusteriAdi,M.Soyad as MusteriSoyadi,K.SanatciAdi as SanatciAdi,K.SanatciSoyadi as SanatciSoyadi,B.KonserTarihi
  from BiletSatis B
  join Musteriler M on B.MusteriId=M.MusteriId
  Join KonserDetaylari K on B.SanatciId=K.SanatciId
  select * from vw_T�mKonserler
