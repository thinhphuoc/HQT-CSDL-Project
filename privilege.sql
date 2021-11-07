use QLHH
go

--Them role
CREATE ROLE _admin AUTHORIZATION db_owner;  
CREATE ROLE NhanVien AUTHORIZATION db_securityadmin;  
CREATE ROLE DoiTac 
CREATE ROLE KhachHang
CREATE ROLE TaiXe
GO

---Tao login
--Tao login cho cac admin
CREATE LOGIN bcdanh WITH PASSWORD = 'bcdanh';--MUST_CHANGE, CHECK_EXPIRATION = ON
CREATE USER buicongdanh FOR LOGIN bcdanh WITH DEFAULT_SCHEMA = QLHH
ALTER ROLE _admin ADD MEMBER buicongdanh;  
	
CREATE LOGIN lhtphuoc WITH PASSWORD = 'lhtphuoc'; --MUST_CHANGE, CHECK_EXPIRATION = ON
CREATE USER lehoangthinhphuoc FOR LOGIN lhtphuoc WITH DEFAULT_SCHEMA = QLHH
ALTER ROLE _admin ADD MEMBER lehoangthinhphuoc;  

CREATE LOGIN nmxhuyen WITH PASSWORD = 'nmxhuyen'; --MUST_CHANGE, CHECK_EXPIRATION = ON
CREATE USER nguyenmaixuanhuyen FOR LOGIN nmxhuyen WITH DEFAULT_SCHEMA = QLHH;
ALTER ROLE _admin ADD MEMBER nguyenmaixuanhuyen;  

CREATE LOGIN lxdinh WITH PASSWORD = 'lxdinh'; --MUST_CHANGE, CHECK_EXPIRATION = ON
CREATE USER lexuandinh FOR LOGIN lxdinh WITH DEFAULT_SCHEMA = QLHH;
ALTER ROLE _admin ADD MEMBER lexuandinh;  

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
VALUES('KH00000001','NGUYEN VAN A','0102030405','NVA@GMAIL.COM'),
('KH00000002','NGUYEN VAN B','0102030406','NVB@GMAIL.COM'),
('KH00000003','NGUYEN VAN C','0102030407','NVC@GMAIL.COM'),
('KH00000004','NGUYEN VAN D','0102030408','NVD@GMAIL.COM')
-- TẠO DỮ LIỆU ĐỐI TÁC
INSERT DOITAC
VALUES('DT00000001','Công ty SpaceX','Elon Musk', 'VUNG TAU','5',20,1000,'LOAIHANG A','24/10/6 VUNG TAU','1800625479','SpaceX@gmail.com'),
('DT00000002','Công ty Microsoft', 'Bill Gates','HA Noi','10',10,5000,'LOAIHANG B','24/7/69 HA NOI','1800625479','Micrsoft@gmail.com'),
('DT00000003','KHACH HANG SO BA','Elon Musk', 'DA NANG','1',30,1500,'LOAIHANG C','20/5/30 DA NANG','1802593712','Tesla@gmail.com'),
('DT00000004','KHACH HANG SO BON','Tim Cook', 'VINH LONG','3',50,2000,'LOAIHANG D','5/8/1 VINH LONG','1400369752','Apple@gmail.com')

--TẠO DỮ LIỆU SẢN PHẨM
INSERT SANPHAM
VALUES('SP00000001','DIEN THOAI',6000,'Điện tử','DT00000001'),
('SP00000002','CUON SACH B',6000,'Sách','DT00000004'),
('SP00000003','CUON SACH C',7000,'Sách','DT00000002'),
('SP00000004','CUON SACH D',8000,'Sách','DT00000003')

--TAO DỮ LIỆU TÀI XẾ
INSERT TAIXE
VALUES('TX00000001','TAI XE 1','1234560','010203040','DIA CHI TAI XE 1','BIEN SO 1','A','TAIXE1@GMAIL.COM',100,'0102030506'),
('TX00000002','TAI XE 2','1234561','010203041','DIA CHI TAI XE 2','BIEN SO 2','B','TAIXE2@GMAIL.COM',100,'0102030405')

--TẠO DỮ LIỆU ĐƠN HÀNG
INSERT DONHANG
VALUES('DH00000001','hinh thuc 1', 'dia chi giao hang 1',10000,1000,'dang giao','TX00000001','KH00000001'),
('DH00000002','hinh thuc 2', 'dia chi giao hang 2',20000,1000,'dang giao','TX00000002','KH00000002'),
('DH00000003','hinh thuc 3', 'dia chi giao hang 3',30000,1000,'dang giao','TX00000001','KH00000004')

-- TẠO DỮ LIỆU HỢP ĐỒNG
INSERT HOPDONG
VALUES('HD00000001','001','Nguyen Van Teo', 5,1000000,0.1,'2022-11-11','DT00000001'),
('HD00000002','002', 'Nguyen Van Ti',5,1000000,0.1,'2023-11-11','DT00000002'),
('HD00000003','003','Nguyen Thi A', 6,1000000,0.1,'2001-12-11','DT00000003')
go

delete from DONHANG
delete from TAIXE
delete from KHACHHANG
delete from SANPHAM
delete from DOITAC

---DOITAC---
--DT. Doi tac co the them - xoa - sua thong tin san pham va chi nhanh co cung cap san pham nay
Grant SELECT, UPDATE
ON SANPHAM
to DoiTac 
Grant SELECT, UPDATE
ON CHINHANH
to DoiTac
--DT. Doi tac co the xem thong tin don hang va cap nhat thong tin don hang
Grant SELECT, UPDATE
ON DONHANG
to DoiTac 

---KHACHHANG---
--KH. Khach hang co the xem thong tin doi tac
Grant SELECT
ON DONHANG
to KhachHang 
--KH. Khach hang co the theo doi don hang
Grant SELECT
ON DONHANG
to KhachHang

---TAIXE---
--TX. Tai xe co the cap nhat don hang, xem don hang hien thi tren khu vuc
Grant SELECT, UPDATE
ON DONHANG
to TaiXe


---NHANVIEN---
--NV. nhanvien co the xem danh sach hop dong doi tac
GRANT SELECT,INSERT,UPDATE ON HOPDONG TO NhanVien
--NV. nhanvien co the xem sua xoa danh sach san pham
GRANT SELECT, INSERT, DELETE, UPDATE ON SANPHAM TO NhanVien
