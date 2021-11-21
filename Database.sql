CREATE DATABASE QLHH  --quản lí hàng hóa
USE QLHH
--drop database QLHH


CREATE TABLE TAIKHOAN
(
	TENNGUOIDUNG	CHAR(13),
	MATKHAU			CHAR(13),
	LOAITAIKHOAN	NVARCHAR(10),
	KICHHOAT		BIT,

	CONSTRAINT PK_TAIKHOAN
	PRIMARY KEY (TENNGUOIDUNG)
)


CREATE TABLE DOITAC
(
	MADT			Char(10),
	NGUOIDAIDIEN	NText,
	THANHPHO		NVarchar(30),
	QUAN			NVarchar(20),
	LOAIHANG		NVarchar(50),
	DIACHI			NVarchar(50),
	HOTEN			NTEXT,
	SODTH			CHAR(10),
	EMAIL			Varchar(50),
	TENNGUOIDUNG	CHAR(13),
	CONSTRAINT PK_DOITAC
	PRIMARY KEY (MADT)
)

/*drop table DOITAC
--drop table HOPDONG
--drop table KHACHHANG
--Drop table DONHANG
--drop table CT_DONHANG
--drop table SANPHAM
--drop table TAIXE
--drop table CHINHANH*/

CREATE TABLE HOPDONG
(
	MAHD			Char(10),
	MASOTHUE		Char(10),
	NGUOIDAIDIEN	SmallInt,
	PTHOAHONG		Money,
	THOIGIANHIEULUC	Date,
	MADT			CHAR(10),

	CONSTRAINT PK_HOPDONG
	PRIMARY KEY (MAHD)
)

CREATE TABLE KHACHHANG
(
	MAKH			Char(10),
	HOTEN			Ntext,
	DIACHI			NVARCHAR(50),
	SODTH			Char(10),
	EMAIL			Varchar(50),
	TENNGUOIDUNG	CHAR(13),

	CONSTRAINT PK_KHACHHANG
	PRIMARY KEY (MAKH)
)

CREATE TABLE SANPHAM
(
	MASP			Char(10),
	TENSANPHAM		Ntext,	
	GIA				Money,
	TINHTRANG		BIT,
	LOAIHANG		NVARCHAR,

	CONSTRAINT PK_SANPHAM
	PRIMARY KEY (MASP)	
)

CREATE TABLE DONHANG
( 
	MADH			Char(10),
	HINHTHUCTT		NVarchar(30),
	DIACHIGIAOHANG	NText,
	PHISANPHAM		Money,
	PHIVANCHUYEN	Money,
	TINHTRANG		NVarchar(20),
	MATX			Char(10),
	MAKH			CHAR(10),

	CONSTRAINT PK_DONHANG
	PRIMARY KEY (MADH)
)

CREATE TABLE CHINHANH
(
	MADT			CHAR(10),
	STT				INT,
	DIACHI			NTEXT,

	CONSTRAINT PK_CHINHANH
	PRIMARY KEY (MADT,STT)
)

CREATE TABLE TAIXE
(
	MATX			Char(10),
	HOTEN			NText,
	CMND			Char(12),
	SODTH			Char(10),
	DIACHI			NText,
	BIENSO			Varchar(12),
	KHUVUC			NText,
	EMAIL			Varchar(50),
	TKNGANHANG		Varchar(20),
	TENNGUOIDUNG	CHAR(13),

	CONSTRAINT PK_TAIXE
	PRIMARY KEY (MATX)
)

CREATE TABLE CT_DONHANG
(
	MADH			CHAR(10), 
	MASP			CHAR(10), 
	SOLUONG			INT,

	CONSTRAINT PK_CT_DONHANG
	PRIMARY KEY (MADH,MASP)
)

CREATE TABLE DS_SANPHAM
(
	MASP			CHAR(10),
	MADT			CHAR(10),
	STT				INT,
	SOLUONG			INT,

	CONSTRAINT PK_DS_SANPHAM
	PRIMARY KEY (MADT,STT,MASP)
)

CREATE TABLE NHANVIEN
(
	MANV			CHAR(10),
	HOTEN			Ntext,
	DIACHI			NVARCHAR(50),
	SODTH			Char(10),
	EMAIL			Varchar(50),
	TENNGUOIDUNG	CHAR(13),

	CONSTRAINT PK_NHANVIEN
	PRIMARY KEY (MANV)
)
-- Tạo khóa ngoại

--1) Doi tac - Hop dong
alter table HOPDONG add
	constraint FK_HOPDONG_DOITAC foreign key (MADT) references DOITAC (MADT)

--2) Don hang - khach hang
alter table DONHANG add
	constraint FK_DONHANG_KHACHHANG foreign key (MAKH) references KHACHHANG (MAKH)

--3) Don hang - Tai xe
alter table DONHANG add
	constraint FK_DONHANG_TAIXE foreign key (MATX) references TAIXE (MATX)

--4) CT_Don hang - Don hang
alter table CT_DONHANG add
	constraint FK_CT_DONHANG_DONHANG foreign key (MADH) references DONHANG (MADH)

--5) CT_Don hang - San pham
alter table CT_DONHANG add
	constraint FK_CT_DONHANG_SANPHAM foreign key (MASP) references SANPHAM (MASP)

--6) Chi nhanh - Doi tac
alter table CHINHANH add
	constraint FK_CHINHANH_DOITAC foreign key (MADT) references DOITAC (MADT)

--7) Chi nhanh - DS_San pham
alter table DS_SANPHAM add
	constraint FK_DS_SANPHAMCHINHANH foreign key (MADT, STT) references CHINHANH (MADT, STT)

--8) San pham - DS_San pham
alter table DS_SANPHAM add
	constraint FK_SANPHAM_DS_SANPHAM foreign key (MASP) references SANPHAM (MASP)


--9) Tai khoan - Doi tac
alter table DOITAC add
	constraint FK_DOITAC_TAIKHOAN foreign key (TENNGUOIDUNG) references TAIKHOAN (TENNGUOIDUNG)

--10) Tai khoan - Khach hang
alter table KHACHHANG add
	constraint FK_KHACHHANG_TAIKHOAN foreign key (TENNGUOIDUNG) references TAIKHOAN (TENNGUOIDUNG)

--11) Tai khoan - Tai xe
alter table TAIXE add
	constraint FK_TAIXE_TAIKHOAN foreign key (TENNGUOIDUNG) references TAIKHOAN (TENNGUOIDUNG)

--12) Tai khoan - Nhan vien
alter table NHANVIEN add
	constraint FK_NHANVIEN_TAIKHOAN foreign key (TENNGUOIDUNG) references TAIKHOAN (TENNGUOIDUNG)