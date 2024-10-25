 create nonclustered index IX_Musteri
  on Musteriler(MusteriId)

  set Statistics Time on
  select * from Musteriler where MusteriId=45628

  set Statistics Time Off