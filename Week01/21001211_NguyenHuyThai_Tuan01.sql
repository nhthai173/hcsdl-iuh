-- Bài 2

-- a) Dùng lệnh CREATE DATABASE, tạo CSDL QLBH với các tham số được liệt kê trong bảng dưới.
CREATE DATABASE QLBH ON PRIMARY
(
	NAME=QLBH_data1,
	FILENAME='C:\IUH\BTTHSQL\Tuan1\QLBH_data1.mdf',
	SIZE=10MB,
	MAXSIZE=100MB,
	FILEGROWTH=1MB
) 
LOG ON
(
	NAME=QLBH_Log,
	FILENAME='C:\IUH\BTTHSQL\Tuan1\QLBH.ldf',
	SIZE=6MB,
	MAXSIZE=12MB,
	FILEGROWTH=1MB
)

--b) xem file
sp_helpdb

--c) Thêm một filegroup có tên là DuLieuQLBH
ALTER DATABASE QLBH ADD FILEGROUP DuLieuQLBH


--d) Thêm một secondary data file có tên logic là QLBH_data2 trong filegroup vừa tạo
ALTER DATABASE QLBH ADD File 
(
	Name=QLBH,
	Filename='C:\IUH\BTTHSQL\Tuan1\QLBH_data2.ndf',
	SIZE=10MB,
	Maxsize=40MB
)
TO FILEGROUP DuLieuQLBH


--e) Xem lại file group đã có
sp_helpfilegroup

--f) Cấu hình CSDL QLBH thành Read_Only sau đó hủy bỏ Read_Only
ALTER DATABASE QLBH SET READ_ONLY
sp_helpdb
ALTER DATABASE QLBH SET READ_WRITE

-- g) Tăng size của QLBH_data1 lên 50MB, tăng file QLBH_Log lên 10MB
ALTER DATABASE QLBH MODIFY FILE
(
	NAME='QLBH_data1',
	size =50MB
)

ALTER DATABASE QLBH MODIFY FILE
(
	NAME='QLBH_Log',
	size=10MB
)