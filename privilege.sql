--Them role
CREATE ROLE _admin AUTHORIZATION db_owner;  
CREATE ROLE NhanVien AUTHORIZATION db_securityadmin;  
CREATE ROLE DoiTac 
CREATE ROLE KhachHang
CREATE ROLE TaiXe
GO

--Tao login
CREATE LOGIN bcdanh WITH PASSWORD = 'bcdanh';--MUST_CHANGE, CHECK_EXPIRATION = ON
CREATE USER buicongdanh FOR LOGIN bcdanh WITH DEFAULT_SCHEMA = QLHH
ALTER ROLE db_owner ADD MEMBER buicongdanh;  
	
CREATE LOGIN lhtphuoc WITH PASSWORD = 'lhtphuoc'; --MUST_CHANGE, CHECK_EXPIRATION = ON
CREATE USER lehoangthinhphuoc FOR LOGIN lhtphuoc WITH DEFAULT_SCHEMA = QLHH
ALTER ROLE db_owner ADD MEMBER lehoangthinhphuoc;  

CREATE LOGIN nmxhuyen WITH PASSWORD = 'nmxhuyen'; --MUST_CHANGE, CHECK_EXPIRATION = ON
CREATE USER nguyenmaixuanhuyen FOR LOGIN nmxhuyen WITH DEFAULT_SCHEMA = QLHH;
ALTER ROLE db_owner ADD MEMBER nguyenmaixuanhuyen;  

CREATE LOGIN lxdinh WITH PASSWORD = 'lxdinh'; --MUST_CHANGE, CHECK_EXPIRATION = ON
CREATE USER lexuandinh FOR LOGIN lxdinh WITH DEFAULT_SCHEMA = QLHH;
ALTER ROLE db_owner ADD MEMBER lexuandinh;  

---Tao login cho nhan vien
CREATE LOGIN t_nv WITH PASSWORD = 'nhanvien'; --MUST_CHANGE, CHECK_EXPIRATION = ON
CREATE USER temp_nhanvien FOR LOGIN t_nv WITH DEFAULT_SCHEMA = QLHH;
ALTER ROLE NhanVien ADD MEMBER temp_nhanvien; 

---Tao login cho doi tac
CREATE LOGIN t_dt WITH PASSWORD = 'doitac'; --MUST_CHANGE, CHECK_EXPIRATION = ON
CREATE USER temp_doitac FOR LOGIN t_dt WITH DEFAULT_SCHEMA = QLHH;
ALTER ROLE DoiTac ADD MEMBER temp_doitac; 

---Tao login cho khach hang
CREATE LOGIN t_kh WITH PASSWORD = 'khachhang'; --MUST_CHANGE, CHECK_EXPIRATION = ON
CREATE USER temp_khachhang FOR LOGIN t_kh WITH DEFAULT_SCHEMA = QLHH;
ALTER ROLE KhachHang ADD MEMBER temp_khachhang; 

---Tao login cho tai xe
CREATE LOGIN t_tx WITH PASSWORD = 'taixe'; --MUST_CHANGE, CHECK_EXPIRATION = ON
CREATE USER temp_taixe FOR LOGIN t_tx WITH DEFAULT_SCHEMA = QLHH
ALTER ROLE TaiXe ADD MEMBER temp_taixe;

-- TẠO  DỮ LIỆU CHO KHÁCH HÀNG
INSERT KHACHHANG
VALUES(1,'NGUYEN VAN A','0102030405','NVA@GMAIL.COM'),
(2,'NGUYEN VAN B','0102030406','NVB@GMAIL.COM'),
(3,'NGUYEN VAN C','0102030407','NVC@GMAIL.COM'),
(4,'NGUYEN VAN D','0102030408','NVD@GMAIL.COM')
--TẠO DỮ LIỆU ĐƠN HÀNG
INSERT DONHANG
VALUES(1,'hinh thuc 1', 'dia chi giao hang 1',10000,1000,'dang giao','01','1'),
(2,'hinh thuc 2', 'dia chi giao hang 2',20000,1000,'dang giao','01','1'),
(3,'hinh thuc 3', 'dia chi giao hang 3',30000,1000,'dang giao','01','1')

--TAO DỮ LIỆU TÀI XẾ
INSERT TAIXE
VALUES('01','TAI XE 1','1234560','010203040','DIA CHI TAI XE 1','BIEN SO 1','A','TAIXE1@GMAIL.COM',100,'010203040506'),
('02','TAI XE 2','1234561','010203041','DIA CHI TAI XE 2','BIEN SO 2','B','TAIXE2@GMAIL.COM',100,'010203040507')

-- TẠO DỮ LIỆU ĐỐI TÁC
INSERT DOITAC
VALUES
('002','KHACH HANG SO HAI','NGUOIDAIDIEN B', 'VUNGTAU','2',1,1,'LOAIHANG B','DIACHI2','SODTH2','KHACHHANG2@GMAIL.COM'),
('003','KHACH HANG SO BA','NGUOIDAIDIEN C', 'DANANG','2',1,1,'LOAIHANG C','DIACHI3','SODTH3','KHACHHANG3@GMAIL.COM'),
('004','KHACH HANG SO BON','NGUOIDAIDIEN D', 'VINHLONG','3',1,1,'LOAIHANG D','DIACHI4','SODTH4','KHACHHANG4@GMAIL.COM')

--TẠO DỮ LIỆU SẢN PHẨM
INSERT SANPHAM
VALUES(1,'CUON SACH A',5000,'001'),
(2,'CUON SACH B',6000,'002'),
(3,'CUON SACH C',7000,'003'),
(4,'CUON SACH D',8000,'004')

go

--Cap Quyen du lieu quyen
---admin---
GRANT ALL ON TAIKHOAN TO _admin

---DOITAC---
--DT. Doi tac co the them - xoa - sua thong tin san pham va chi nhanh co cung cap san pham nay
Grant SELECT, UPDATE
ON SANPHAM
to Doitac 
Grant SELECT, UPDATE
ON CHINHANH
to Doitac
--DT. Doi tac co the xem thong tin don hang va cap nhat thong tin don hang
Grant SELECT, UPDATE
ON DONHANG
to Doitac 

---KHACHHANG---
--KH. Khach hang co the xem thong tin doi tac
Grant SELECT
ON DONHANG
to KhachHang 
--KH. Khach hang co the theo doi don hang
Grant SELECT
ON DONHANG
to KhachHang
--KH. Khach hang co the truy cap den thong tin ca nhan
CREATE
VIEW UV_TKH
AS
SELECT HOTEN
FROM KHACHHANG KH JOIN TAIKHOAN TK ON KH.MAKH = TK.MANGUODUNG
WHERE TK.TENDANGNHAP = CURRENT_USER --CURRETUSER LÀ TÀI KHOẢN ĐANG ĐĂNG NHẬP 

GRANT SELECT,UPDATE ON UV_TKH TO khachhang


---TAIXE---
--TX. Tai xe co the cap nhat don hang, xem don hang hien thi tren khu vuc
Grant SELECT, UPDATE
ON DONHANG
to TaiXe


---NHANVIEN---
--NV. nhanvien co the xem danh sach hop dong doi tac
GRANT SELECT,INSERT,UPDATE ON HOPDONG TO nhanvien
--NV. nhanvien co the xem sua xoa danh sach san pham
GRANT SELECT, INSERT, DELETE, UPDATE ON SANPHAM TO nhanvien
