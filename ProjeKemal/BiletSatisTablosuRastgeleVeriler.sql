declare @i int=1;
declare @MusteriId int;
declare @SanatciId int;
declare @KonserTarihi date;
declare @SatilanBiletSayisi int;

declare @StartDate Date='2022-06-01';
declare @EndDate Date='2024-01-01';

declare @TotalDays int= DATEDIFF(Day,@StartDate,@EndDate);

while @i<=100000
begin
set @MusteriId=Floor(Rand()*100000)+1;
set @SanatciId=Floor(Rand()*100000)+1;
set @KonserTarihi=Dateadd(Day,Floor(Rand()*@TotalDays),@StartDate);
set @SatilanBiletSayisi=Floor(Rand()*12)+1;

insert into BiletSatis(MusteriId,SanatciId,KonserTarihi,SatilanBiletSayisi)
values (@MusteriId,@SanatciId,@KonserTarihi,@SatilanBiletSayisi)

set @i=@i+1;
end