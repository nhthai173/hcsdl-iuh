﻿-- Bai 1 - Tuan 4

-- Tao bang
create database QLBH
on primary (
	name = QLBH_data1,
	filename = "T:\BTTHSQL\21001211_NguyenHuyThai\21001211_NguyenHuyThai_Tuan02\QLBH_data1.mdf",
	size = 50,
	maxsize = 100,
	filegrowth = 10%
)
log on (
	name = QLBH_log,
	filename = "T:\BTTHSQL\21001211_NguyenHuyThai\21001211_NguyenHuyThai_Tuan02\QLBH_log.ldf",
	size = 5MB,
	maxsize = 10MB,
	filegrowth = 1MB
)

use QLBH


create table NhomSanPham
(
	MaNhom int not null primary key,
	TenNhom nvarchar(30)
)

create table NhaCungCap
(
	MaNCC int not null primary key,
	TenNCC nvarchar(40) not null,
	Diachi nvarchar(40),
	Phone nvarchar(24),
	SoFax nvarchar(24),
	DCMail nvarchar(50)
)



create table SanPham
(
	MaSP int not null primary key,
	TenSP nvarchar(15),
	MaNCC int references NhaCungCap(MaNCC),
	MoTa nvarchar(50),
	MaNhom int references NhomSanPham(MaNhom),
	Donvitinh nvarchar(20),
	GiaGoc money, check (GiaGoc >0),
	SLTON int, check (SLTON >= 0)
)

create table KhachHang
(
	MaKH char(5) not null primary key,
	TenKH nvarchar(40) not null,
	LoaiKH nvarchar(3), check (LoaiKH in ('VIP', 'TV', 'VL')),
	DiaChi nvarchar(60),
	Phone nvarchar(24),
	DCMail nvarchar(50),
	DiemTL int, check (DiemTL >= 0)
)

create table HoaDon
(
	MaHD int not null primary key,
	NgayLapHD datetime default getdate(), check (NgayLapHD <= getdate()),
	NgayGiao datetime,
	Noichuyen nvarchar(60) not null,
	MaKH char(5) references KhachHang(MaKH)
)

create table CT_HoaDon
(
	MaHD int not null,
	MaSP int not null,
	Soluong smallint, check (Soluong > 0),
	Dongia money,
	ChietKhau money, check (ChietKhau >= 0),
	foreign key (MaHD) references HoaDon(MaHD),
	foreign key (MaSP) references SanPham(MaSP),
	primary key(MaHD, MaSP)
)



-- 4) Them cot LoaiHD vao bang HoaDon
alter table HoaDon
add LoaiHD char(1),
check (LoaiHD in ('N', 'X', 'C', 'T')),
constraint ngaygiaoLargerThanNgayLapHD check (NgayGiao >= NgayLapHD)





-- Tuan 4

-- a) Nhap du lieu

use QLBH

alter table NhomSanPham alter column TenNhom nvarchar(30)

insert into NhomSanPham values
(1, N'Điện tử'),
(2, N'Gia Dụng'),
(3, N'Dụng Cụ Gia Đình'),
(4, N'Các Mặt Hàng Khác')

insert into NhaCungCap values
(1, N'Công ty TNHH Nam Phương', N'1 Lê Lợi, Phường 4, Quận Gò Vấp', '0838434560', '0838434560', 'NamPhuong@yahoo.com'),
(2, N'Công ty Lan Ngọc', N'12 Cao Bá Quát, Quận 1, TP. Hồ Chí Minh', '0862345678', '0862345678', 'LanNgoc@gmail.com')

insert into SanPham (MaSP, TenSP, Donvitinh, GiaGoc, SLTON, MaNhom, MaNCC, MoTa) values
(1, N'Máy Tính', N'Cái', 7000, 100, 1, 1, N'Máy Sony Ram 2GB'),
(2, N'Bàn Phím', N'Cái', 1000, 50, 1, 1, N'Bàn phím 101 phím'),
(3, N'Chuột', N'Cái', 800, 150, 1, 1, N'Chuột không dây'),
(4, N'CPU', N'Cái', 3000, 200, 1, 1, N'CPU'),
(5, N'USB', N'Cái', 500, 100, 1, 1, N'8GB'),
(6, N'Lò Vi Sóng', N'Cái', 1000000, 20, 3, 2, NULL)

alter table KhachHang add SoFax char(12)

insert into KhachHang (MaKH, TenKH, DiaChi, Phone, SoFax, LoaiKH, DCMail, DiemTL) values
('KH1', N'Nguyễn Thu Hằng', N'12 Nguyễn Du', '', NULL, 'VL', NULL, NULL),
('KH2', N'Lê Minh', N'34 Điện Biên Phủ', '0123943455', NULL, 'TV', 'LeMinh@yahoo.com', 100),
('KH3', N'Nguyễn Thu Hằng', N'3 Lê Lợi Quận Gò Vấp', '098343434', NULL, 'VIP', 'Trung@gmail.com', 800)

insert into HoaDon (MaHD, NgayLapHD, MaKH, NgayGiao, Noichuyen) values
(1, convert(datetime, '2015-09-30 00:00:00.000'), 'KH1', convert(datetime, '2015-10-05 00:00:00.000'), N'Cửa Hàng ABC 3 Lý Chính Thắng Quận 3'),
(2, convert(datetime, '2015-07-29 00:00:00.000'), 'KH2', convert(datetime, '2015-08-10 00:00:00.000'), N'23 Lê Lợi Quận Gò Vấp'),
(3, convert(datetime, '2015-10-01 00:00:00.000'), 'KH3', convert(datetime, '2015-10-01 00:00:00.000'), N'2 Nguyễn Du Quận Gò Vấp')


insert into CT_HoaDon (MaHD, MaSP, Dongia, Soluong) values
(1, 1, 8000, 5),
(1, 2, 1200, 4),
(1, 3, 1000, 15),
(2, 2, 1200, 9),
(2, 4, 800, 5),
(3, 2, 3500, 20),
(3, 3, 1000, 15)


-- 2-a) Tang don gia ban len 5% cho cac san pham co ma la 2
update SanPham set GiaGoc = GiaGoc * 1.05 where MaSP = 2

-- 2-b) Tang so luong ton len 100 cho ca san pham co nhom mat hang la 3 cua ncc co ma la 2
update SanPham set SLTON = 100 where MaNhom = 3 and MaNCC = 2

-- 2-c) Cap nhat mo to cho lo vi song
update SanPham set MoTa = 'Panasonic' where TenSP = N'Lò Vi Sóng'

-- 2-d) Cập nhật mã khách hàng 'KH3' thành 'VI003'
update HoaDon set MaKH = null where MaKH = 'KH3'
update KhachHang set MaKH='VI003' where MaKH = 'KH3'

-- cap nhat lai ma kh cho VI003 trong HD
update HoaDon set MaKH = 'VI003' where MaHD = 3

-- 2-e) Tương tự, sửa mã khách hàng ‘KH1’ thành ‘VL001’ , ‘KH2’  thành ‘T0002’
sp_helpconstraint HoaDon

alter table HoaDon drop constraint FK__HoaDon__MaKH__45F365D3

alter table HoaDon add constraint FK_HoaDon_KhachHang foreign key (MaKH) references KhachHang(MaKH)
	on update cascade
	on delete cascade

-- cap nhat cho KH1, KH2
update KhachHang set MaKH = 'VL001' where MaKH = 'KH1'
update KhachHang set MaKH = 'T0002' where MaKH = 'KH2'


-- 3-a) Xoa dong trong nhom hang co ma 4
delete from NhomSanPham where MaNhom = 4

-- 3-b) Xóa dòng trong CT_Hoadon  có MaHD là 1 và MaSP là 3
delete from CT_HoaDon where MaHD = 1 and MaSP = 3

-- 3-c) Xóa dòng trong bảng HoaDon có mã là 1
delete from CT_HoaDon where MaHD = 1
delete from HoaDon where MaHD = 1

-- Thiết lập lại ràng buộc khóa ngoại trên bảng CT_HoaDon để cho phép khixóa dòng trên bảng HoaDon thì tự động xóa các dòng trong  CT_HoaDon  mà  có  tham  chiếu  đến  dòng  đang  xóa  trong HoaDon.
sp_helpconstraint CT_HoaDon

alter table CT_HoaDon drop constraint FK__CT_HoaDon__MaHD__5AEE82B9

alter table CT_HoaDon add constraint FK_CT_HoaDon_MaHD foreign key (MaHD) references HoaDon(MaHD)
	on update cascade
	on delete cascade

-- 3-d) Tương tự , xóa dòng trong bảng HoaDon có mã là 2
delete from CT_HoaDon where MaHD = 2