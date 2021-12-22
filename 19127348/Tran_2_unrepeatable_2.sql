set transaction isolation level repeatable read
begin tran
	if not exists (select* from DONHANG where MADH = 'DH00000001')
	begin
		rollback tran
		raiserror (N'Đơn hàng k tồn tại',16 ,1)
	end
	update DONHANG set HINHTHUCTT = 'hinh thuc 2' where MADH = 'DH00000001'
	waitfor delay '00:00:10'
commit