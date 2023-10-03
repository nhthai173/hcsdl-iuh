-- Bai 1 tuan 2

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


create table NhomSanPham
(
	MaNhom int not null primary key,
	TenNhom nvarchar(15)
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
	foreign key (MaSP) references HoaDon(MaHD),
	foreign key (MaSP) references SanPham(MaSP),
	primary key(MaHD, MaSP)
)



-- 4) Them cot LoaiHD vao bang HoaDon
alter table HoaDon
add LoaiHD char(1),
check (LoaiHD in ('N', 'X', 'C', 'T')),
constraint ngaygiaoLargerThanNgayLapHD check (NgayGiao >= NgayLapHD)