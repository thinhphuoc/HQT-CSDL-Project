use QLHH
go 
declare @RT int
exec @RT = ThemChiNhanhDoiTac @madt = 'DT00000003',@stt = 1, @diachi = '23 Su Van Hanh Quan 11 TPHCM'
if @RT = 1 Print N'Them that bai' else print N'Them thanh cong'

