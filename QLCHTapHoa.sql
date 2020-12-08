CREATE DATABASE QLCHTapHoa
GO

USE QLCHTapHoa
GO

--DROP DATABASE QLCHTapHoa

--Account
--NhaCungCap
--KhachHang
--NhanVien
--HangHoa
--HoaDonBan
--CTHoaDonBan

CREATE TABLE Account
(
	USERNAME VARCHAR (100) NOT NULL PRIMARY KEY,
	PASS VARCHAR(100) NOT NULL,
	Loai VARCHAR(10) NOT NULL
)
GO

CREATE TABLE NhaCungCap
(
	MaNCC NVARCHAR(50) NOT NULL PRIMARY KEY,
	TenNCC NVARCHAR(100) NOT NULL,
	DienThoai NVARCHAR(15) NOT NULL,
	DiaChi NVARCHAR(100) NOT NULL
)
GO

CREATE TABLE NhaSanXuat
(
	MaNSX NVARCHAR(50) NOT NULL PRIMARY KEY,
	TenNSX NVARCHAR(100) NOT NULL,
	DienThoai NVARCHAR(15) NOT NULL,
	DiaChi NVARCHAR(100) NOT NULL
)
GO

CREATE TABLE KhachHang
(
	MaKH NVARCHAR(50) NOT NULL PRIMARY KEY,
	TenKH NVARCHAR(100) NOT NULL,
	DiaChi NVARCHAR(100) NOT NULL,
	DienThoai NVARCHAR(15) NOT NULL
)
GO

CREATE TABLE NhanVien
(
	MaNV NVARCHAR(50) NOT NULL PRIMARY KEY,
	TenNV NVARCHAR(100) NOT NULL,
	GioiTinh NVARCHAR(10) NOT NULL,
	DiaChi NVARCHAR(100) NOT NULL,
	DienThoai NVARCHAR(15) NOT NULL,
	NgaySinh DATE NOT NULL,
)
GO

CREATE TABLE HangHoa
(
	MaHH NVARCHAR(50) NOT NULL PRIMARY KEY,
	MaNSX NVARCHAR(50) NOT NULL,
	MaNCC NVARCHAR(50) NOT NULL,
	TenHH NVARCHAR(100) NOT NULL,
	DvTinh NVARCHAR(50) NOT NULL,
	SoLuong FLOAT NOT NULL,
	DonGiaNhap FLOAT NOT NULL,
	DonGiaBan FLOAT NOT NULL,
	HanSuDung DATE NOT NULL,
	GhiChu NVARCHAR(1000),
	Anh NVARCHAR(1000),
	FOREIGN KEY (MaNSX) REFERENCES dbo.NhaSanXuat(MaNSX),
	FOREIGN KEY (MaNCC) REFERENCES dbo.NhaCungCap(MaNCC)
)
GO

CREATE TABLE HoaDonBan
(
	MaHDB NVARCHAR(50) NOT NULL,
	MaNV NVARCHAR(50) NOT NULL,
	MaKH NVARCHAR(50) NOT NULL,
	NgayBan DATE NOT NULL,
	TongTien FLOAT NOT NULL,
	PRIMARY KEY (MaHDB),
	FOREIGN KEY (MaNV) REFERENCES dbo.NhanVien(MaNV),
	FOREIGN KEY (MaKH) REFERENCES dbo.KhachHang(MaKH)
)
GO

CREATE TABLE CTHoaDonBan
(
	MaHDB NVARCHAR(50) NOT NULL,
	MaHH NVARCHAR(50) NOT NULL,
	SoLuong FLOAT NOT NULL,
	DonGiaBan FLOAT NOT NULL,
	GiamGia FLOAT NOT NULL,
	ThanhTien FLOAT NOT NULL,
	PRIMARY KEY (MaHDB,MaHH),
	FOREIGN KEY (MaHDB) REFERENCES dbo.HoaDonBan (MaHDB),
	FOREIGN KEY (MaHH) REFERENCES dbo.HangHoa (MaHH),
)
GO


SELECT * FROM dbo.Account
--DELETE FROM dbo.Account WHERE USERNAME = 'Admin' --Xoa Row
--Them tai khoan
INSERT INTO dbo.Account
        ( USERNAME, PASS, Loai )
VALUES  ( 'Admin', -- USERNAME - varchar(100)
          'admin', -- PASS - varchar(100)
          'Admin'  -- Loai - varchar(10)
          )
INSERT INTO dbo.Account
        ( USERNAME, PASS, Loai )
VALUES  ( 'A', -- USERNAME - varchar(100)
          '123', -- PASS - varchar(100)
          'Thuong'  -- Loai - varchar(10)
          )
INSERT INTO dbo.Account
        ( USERNAME, PASS, Loai )
VALUES  ( 'NV001', -- USERNAME - varchar(100)
          'NV1', -- PASS - varchar(100)
          'Thuong'  -- Loai - varchar(10)
          )

DELETE FROM dbo.HangHoa WHERE MaHH = 'HH05'
SELECT * FROM dbo.HangHoa
--Hien thi 
SELECT * FROM dbo.Account WHERE USERNAME = 'Admin' AND PASS = '123'
----------------------------
SELECT * FROM dbo.NhaSanXuat
SELECT MaNSX, TenNSX, DienThoai, DiaChi FROM dbo.NhaSanXuat
--
UPDATE dbo.NhaSanXuat SET TenNSX = 'Thang' WHERE TenNSX = 'NSX005'
--DELETE FROM dbo.Account WHERE USERNAME = 'Thang'
--DELETE  FROM dbo.NhaSanXuat
--Them nha san xuat


----------------------------
SELECT * FROM dbo.NhaCungCap
--Them nha chung cap
--DELETE FROM dbo.NhaCungCap

-------------------------
SELECT * FROM dbo.HangHoa
--DELETE FROM dbo.HangHoa WHERE MaHH = 'HH001'
--Them hang hoa
--DELETE FROM dbo.HangHoa
-------------------------
SELECT * FROM dbo.KhachHang
SELECT MaNV, TenNV, GioiTinh, DiaChi, DienThoai, NgaySinh FROM dbo.NhanVien
------------------------
SELECT * FROM dbo.KhachHang

SELECT * FROM dbo.NhaCungCap
SELECT * FROM dbo.NhaSanXuat

SELECT * FROM dbo.NhanVien

SELECT * FROM dbo.HangHoa
INSERT INTO dbo.HangHoa
        ( MaHH ,
          MaNSX ,
          MaNCC ,
          TenHH ,
          DvTinh ,
          SoLuong ,
          DonGiaNhap ,
          DonGiaBan ,
          HanSuDung ,
          GhiChu ,
          Anh
        )
VALUES  ( N'HH01' , -- MaHH - nvarchar(50)
          N'NSX001' , -- MaNSX - nvarchar(50)
          N'NCC001' , -- MaNCC - nvarchar(50)
          N'Dầu' , -- TenHH - nvarchar(100)
          N'Chai' , -- DvTinh - nvarchar(50)
          100 , -- SoLuong - float
          20000 , -- DonGiaNhap - float
          30000 , -- DonGiaBan - float
          ('03-04-2021') , -- HanSuDung - date
          N'' , -- GhiChu - nvarchar(1000)
          N'D:\ảnh\icon\TapHoa\dau.jpg'  -- Anh - nvarchar(1000)
        )

SELECT * FROM dbo.HoaDonBan
SELECT * FROM dbo.CTHoaDonBan
SELECT * FROM dbo.HangHoa
SELECT * FROM dbo.NhanVien
SELECT * FROM dbo.KhachHang
  SET DATEFORMAT DMY
SELECT * FROM dbo.Account
SELECT USERNAME FROM dbo.Account WHERE USERNAME
