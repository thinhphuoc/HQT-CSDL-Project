set transaction isolation level repeatable read
begin tran
	if not exists (select TinhTrang from DONHANG where MaDH = 'DH00000001')
	begin
		
		rollback tran
		raiserror (N'không đọc đc đơn hàng',16 ,1)
	end
	else
	waitfor delay '00:00:10'
commit