use QLHH
go 

create 
proc ThemChiNhanhDoiTac
@madt char(10),
@stt int,
@diachi ntext
as
begin tran 
	begin try 
	if not exists (select * from DOITAC where MADT = @madt)
	BEGIN
		PRINT N'Không tồn tại đối tác'
		ROLLBACK TRAN
		RETURN 1
	END
	if @stt < 0
	BEGIN
		PRINT N'Số thứ tự phải lớn hơn 0'
		ROLLBACK TRAN
		RETURN 1
	END
	insert into CHINHANH values(@madt,@stt,@diachi)
	end try
	BEGIN CATCH		PRINT N'LỖI HỆ THỐNG'		ROLLBACK TRAN		RETURN 1	END CATCH
COMMIT TRAN
RETURN 0
GO

--create 
alter
proc XoaDoiTac
@madt char(10)
as
set tran isolation level serializable
begin tran 
	begin try
	if not exists (select * from DOITAC where MADT = @madt)
	BEGIN
		PRINT N'Không tồn tại đối tác'
		ROLLBACK TRAN
		RETURN 1
	END
	if exists(select * 
				from CHINHANH
				where MADT = @madt)
	BEGIN
		PRINT N'Đối tác hiện vẫn còn chi nhánh không xóa được'
		ROLLBACK TRAN
		RETURN 1
	END
	waitfor delay '00:00:05'
	delete DOITAC 
	where MADT = @madt
	end try
	BEGIN CATCH		PRINT N'LỖI HỆ THỐNG'		ROLLBACK TRAN		RETURN 1	END CATCH
COMMIT TRAN
RETURN 0
GO

insert into TAIKHOAN values ('dtthu','234234','manager',1)
insert into DOITAC values('DT00000003','Dang Thi Thu','TPHCM','Quan 1','Gia dung','423/5 Tran Hieu Quan 6 TPHCM','Gia dung Tran Hieu','0932411231','dtthu@email.com','dtthu')