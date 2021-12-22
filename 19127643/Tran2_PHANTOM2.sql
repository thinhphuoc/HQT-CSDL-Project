use QLHH
go 

declare @RT int
exec @RT = ThemDSSP @masp = 'SP00000001', @madt = 'DT00000002', @stt = 1, @soluong = 2
if @RT = 1 print 'That bai' 
else print 'Thanh cong'

