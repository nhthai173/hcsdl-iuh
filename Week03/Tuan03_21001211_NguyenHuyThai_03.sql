-- Bai 3 - Tuan 3

create database QLDA
on primary
(
	name = QLDA_data,
	filename = "C:\BTSQL\Tuan3_Bai3\QLDA_data.mdf",
	size = 10MB,
	maxsize = 50MB,
	filegrowth = 1MB
)
log on
(
	name = QLDA_log,
	filename = "C:\BTSQL\Tuan3_Bai3\QLDA_log.ldf",
	size = 5MB,
	maxsize = 10MB,
	filegrowth = 1MB
)




-- Tao bang
use QLDA

create table DuAn
(
	MaDA int not null primary key,
	TenDA nvarchar(30)
)


create table CongViec
(
	MaCV int not null primary key,
	TenCV nvarchar(30)
)



create table Nhanvien
(
	MaNV int not null primary key,
	Hoten nvarchar(30),
	Phai nvarchar(3),
	Ngaysinh date,
	NhomTruong int references Nhanvien(MaNV)
)


create table Phongban
(
	MaPB int not null primary key,
	TenPB nvarchar(30),
	MaTruongPhong int references Nhanvien(MaNV)
)


alter table Nhanvien add MaPB int
alter table Nhanvien add foreign key (MaPB) references Phongban(MaPB)



create table Nhanvien_duan
(
	MaDA int references DuAn(MaDA) not null,
	MaNV int references Nhanvien(MaNV) not null,
	MaCV int references CongViec(MaCV) not null,
	Thoigian datetime,
	primary key (MaDA, MaNV, MaCV)
)