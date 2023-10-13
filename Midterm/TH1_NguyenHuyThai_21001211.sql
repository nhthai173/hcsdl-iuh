-- Nguyễn Huy Thái
-- 21001211


-- Câu 1: Tạo database <QLKHAMBENH_hotenSV> với thông số tùy ý, các file đặt trong thư mục T:\<hotenSV>
create database QLKHAMBENH_NguyenHuyThai
on primary (
	name = QLKHAMBENH_NguyenHuyThai,
	filename = 'T:\NguyenHuyThai\QLKHAMBENH_NguyenHuyThai_data.mdf'
)
log on (
	name = QLKHAMBENH_NguyenHuyThai_log,
	filename = 'T:\NguyenHuyThai\QLKHAMBENH_NguyenHuyThai_log.ldf'
)


-- Câu 2: Tạo các table và mối quan hệ giữa các table trong database trên theo mô tả sau

use QLKHAMBENH_NguyenHuyThai

create table BENHNHAN (
	MaBN char(5) not null primary key,
	Hoten nvarchar(50), 
	Namsinh smallint, check (Namsinh > 0), 
	Phai bit 
)

create table BACSI (
	MaBS char(5) not null primary key,
	Hoten nvarchar(50), 
	Chuyenmon nvarchar(50)
)

create table DIEUTRI (
	MaBN char(5) not null, 
	MaBS char(5) not null,
	NgayKham datetime,
	NgayTaiKham datetime, check (NgayKham < NgayTaiKham),
	ChuanDoan nvarchar(255),
	primary key (MaBN, MaBS),
	foreign key (MaBN) references BENHNHAN(MaBN),
	foreign key (MaBS) references BACSI(MaBS),
)






--Câu 3: Viết và thực thi các lệnh Nhập dữ liệu vào 3 bảng trên dựa trên mô tả sau 
--(dữ liệu khác tùy ý)
--Hai bác sĩ Tuấn và Vân điều trị cho bệnh nhân Minh và An, cụ thể: 
--Bác sĩ ‘Tuấn’ khám bệnh cho bệnh nhân ‘Minh’ vào ngày 20/8/2023 
--Bác sĩ ‘Tuấn’ khám bệnh cho bệnh nhân ‘An’ vào ngày 20/8/2023 
--Bác sĩ ‘Vân’ khám bệnh cho bệnh nhân ‘Minh’ vào ngày 20/9/2023

use QLKHAMBENH_NguyenHuyThai

insert into BENHNHAN values
('BN001', N'Trần Văn Minh', 1996, 0),
('BN002', N'Nguyễn Long An', 2000, 0)

insert into BACSI values
('BS001', N'Trần Văn Tuấn', N'Đa Khoa'),
('BS002', N'Nguyễn Thị Vân', N'Đa Khoa')

insert into DIEUTRI values
('BN001', 'BS001', '2023-08-20', '2023-09-20', ''),
('BN002', 'BS001', '2023-08-20', NULL, ''),
('BN001', 'BS002', '2023-09-20', NULL, '')









--Câu 4: Viết và thực thi lệnh cập nhật Hoten của bác sĩ ‘Vân’ thành <HotenSV>
use QLKHAMBENH_NguyenHuyThai
update BACSI set Hoten = N'Nguyễn Huy Thái' where MaBS = 'BS002'





--Câu 5: Viết và thực thi lệnh xóa dòng lưu trữ: Bác sĩ ‘Tuấn’ khám bệnh cho 
--bệnh nhân ‘An’ vào ngày 20/8/2022 (trong bảng DIEUTRI) 
use QLKHAMBENH_NguyenHuyThai
delete from DIEUTRI where MaBS = 'BS001' and MaBN = 'BN002' and NgayKham = '2023-08-20'





--Câu 6: Viết lệnh chỉnh sửa ràng buộc khóa ngoại để cho phép: xóa dòng trên 
--bảng  BENHNHAN  thì  tự động  xóa  kéo  theo  các  dòng  có  liên  quan  trong 
--DIEUTRI?

alter table DIEUTRI drop constraint FK__DIEUTRI__MaBN__164452B1

alter table DIEUTRI add constraint FK_DIEUTRI_MaBN foreign key (MaBN) references BENHNHAN(MaBN)
	on update cascade
	on delete cascade