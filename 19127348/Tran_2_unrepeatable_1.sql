set transaction isolation level repeatable read
begin tran
	if not exists (select* from DONHANG where MADH = 'DH00000001')
	begin
		rollback tran
		raiserror (N'Đơn hàng k tồn tại',16 ,1)
	end
	else
	waitfor delay '00:00:10'
	update DONHANG set TINHTRANG = 'da lay hang' where MADH = 'DH00000001'
commit