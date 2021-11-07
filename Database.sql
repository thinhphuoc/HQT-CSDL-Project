CREATE DATABASE QLHH  --quản lí hàng hóa

--drop database QLHH

CREATE TABLE DOITAC
(
	MADT Char(10),
	HOTEN Ntext,
	NGUOIDAIDIEN NText,
	THANHPHO NVarchar(30),
	QUAN NVarchar(20),
	SOCHINHANH Int,
	SLDHMOINGAY Int,
	LOAIHANG NVarchar(50),
	DIACHI NText,
	SODTH Char(10),
	EMAIL Varchar(50),

	CONSTRAINT PK_DOITAC
	PRIMARY KEY (MADT)
)
/*
drop table DOITAC
drop table HOPDONG
drop table KHACHHANG
drop table DONHANG
drop table CT_DONHANG
drop table SANPHAM
drop table TAIXE
drop table CHINHANH*/

CREATE TABLE HOPDONG
(
	MAHD	Char(10),
	MASOTHUEDOITAC	Char(10),
	NGUOIDAIDIEN Nvarchar(50),
	SOCHINHANHDANGKY SmallInt,
	PHIKICHHOAT	Money,
	PHIHOAHONG	Money,
	THOIGIANHIEULUC	Date,
	MADT CHAR(10),
	CONSTRAINT PK_HOPDONG
	PRIMARY KEY (MAHD)
)

CREATE TABLE KHACHHANG
(
	MAKH Char(10),
	HOTEN Ntext,
	SODTH	Char(10),
	EMAIL	Varchar(50),

	CONSTRAINT PK_KHACHHANG
	PRIMARY KEY (MAKH)
)

CREATE TABLE SANPHAM
(
	MASP Char(10),
	TENSANPHAM Ntext,	
	GIA Money,
	LOAISP Ntext,
	MADT CHAR(10),

	CONSTRAINT PK_SANPHAM
	PRIMARY KEY (MASP)	
)

CREATE TABLE DONHANG
( 
	MADH	Char(10),
	HINHTHUCTHANHTOAN	NVarchar(30),
	DIACHIGIAOHANG	NText,
	PHISANPHAM	Money,
	PHIVANCHUYEN	Money,
	TINHTRANG	NVarchar(20),
	MATX Char(10),
	MAKH CHAR(10),

	CONSTRAINT PK_DONHANG
	PRIMARY KEY (MADH)
)

CREATE TABLE CHINHANH
(
	MADT CHAR(10),
	DIACHI NTEXT,
	STT INT

	CONSTRAINT PK_CHINHANH
	PRIMARY KEY (MADT,STT)
)

CREATE TABLE TAIXE
(
	MATX	Char(10),
	HOTEN	NText,
	CMND	Char(12),
	SODTH	Char(10),
	DIACHI	NText,
	BIENSO	Varchar(12),
	KHUVUC	NText,
	EMAIL	Varchar(50),
	PhiTheChan Money,
	TKNGANHANG	Varchar(20),

	CONSTRAINT PK_TAIXE
	PRIMARY KEY (MATX)
)

CREATE TABLE CT_DONHANG
(
	MADH CHAR(10), 
	MASP CHAR(10), 
	SOLUONG INT,

	CONSTRAINT PK_CT_DONHANG
	PRIMARY KEY (MADH,MASP)
)

-- Tạo khóa ngoại
alter table SANPHAM add
	constraint FK_SANPHAM_DOITAC foreign key (MADT) references DOITAC (MADT)

alter table HOPDONG add
	constraint FK_HOPDONG_DOITAC foreign key (MADT) references DOITAC (MADT)

alter table DONHANG add
	constraint FK_DONHANG_KHACHHANG foreign key (MAKH) references KHACHHANG (MAKH)

alter table  DONHANG add
	constraint FK_DONHANG_TAIXE foreign key (MATX) references TAIXE (MATX)

alter table CT_DONHANG add
	constraint FK_CT_DONHANG_DONHANG foreign key (MADH) references DONHANG (MADH)

alter table CT_DONHANG add
	constraint FK_CT_DONHANG_SANPHAM foreign key (MASP) references SANPHAM (MASP)

alter table CHINHANH add
	constraint FK_CHINHANH_DOITAC foreign key (MADT) references DOITAC (MADT)
