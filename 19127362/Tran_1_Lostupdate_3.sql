set transaction isolation level repeatable read
begin tran
	if not exists (select SOLUONG from DS_SANPHAM where MASP = 'SP01')
	begin
		rollback
		raiserror('sai mã sản phẩm',16,1)
	end
	else
		waitfor delay '00:00:07'
		update DS_SANPHAM set SOLUONG = SOLUONG + 1 where MASP = 'SP01' and MADT = 'DT01'
commit