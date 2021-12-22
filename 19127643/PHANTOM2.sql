use QLHH
go 

create 
proc ThemDSSP
@masp char(10),
@madt char(10),
@stt int,
@soluong int
as 
begin tran 
	begin try 
	IF not EXISTS (SELECT * 
				FROM SANPHAM 
				WHERE MASP = @masp)
	BEGIN
		PRINT @masp + N'Sản phẩm không tồn tại'
		ROLLBACK TRAN
		RETURN 1
	END
	IF not EXISTS (SELECT * 
				FROM DOITAC 
				WHERE MADT = @madt)
	BEGIN
		PRINT @madt + N'Đối tác không tồn tại'
		ROLLBACK TRAN
		RETURN 1
	END
	insert into DS_SANPHAM
	values (@masp,@madt,@stt,@soluong)
	end try 
	BEGIN CATCH
		PRINT N'LỖI HỆ THỐNG'
		ROLLBACK TRAN
		RETURN 1	
	END CATCH
commit tran
return 0 
go 


create proc KhuyenMai 
as 
begin tran 
	begin try 
	declare @dt char(10)
	if exists (select MADT
				from DS_SANPHAM 
				group by MADT 
				having count(MASP) <=3)
	waitfor delay '00:00:05'
	set @dt = (select MADT
				from DS_SANPHAM 
				group by MADT 
				having count(MASP) <=3)
	select TENSP,GIA
	from SANPHAM sp join DS_SANPHAM ds on (sp.MASP = ds.MASP and ds.MADT = @dt)
	end try 
	BEGIN CATCH
		PRINT N'LỖI HỆ THỐNG'
		ROLLBACK TRAN
		RETURN 1	
	END CATCH
commit tran
return 0 
go 
	 
	

