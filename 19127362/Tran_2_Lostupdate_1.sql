use QLHH
go
set transaction isolation level repeatable read
begin tran
	if not exists (select SOLUONG from CT_DONHANG where MASP = 'SP00000001' and MADH = 'DH00000001')
	begin
		rollback
		raiserror('sai mã sản phẩm hoặc mã đơn hàng',16,1)
	end
	else
		waitfor delay '00:00:10'
		update CT_DONHANG set SOLUONG = SOLUONG -1 where MASP = 'SP00000001' and MADH = 'DH00000001'

commit