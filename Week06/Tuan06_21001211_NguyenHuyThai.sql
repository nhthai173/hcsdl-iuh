-- 1.Hiển  thị  thông  tinvề  hóa  đơn  có  mã  ‘10248’,  bao  gồm:  OrderID, OrderDate,  CustomerID,  EmployeeID,  ProductID,  Quantity,  Unitprice, Discount.


-- 2.Liệt kê các khách  hàngcó lập hóa đơn trong tháng 7/1997và  9/1997. Thông  tin  gồm  CustomerID,  CompanyName,  Address,  OrderID, Orderdate. Được sắp xếp theo CustomerID, cùng CustomerID thì sắp xếp theo OrderDate giảm dần.

-- 3.Liệt kê danh sách các mặt hàngxuất bán vào ngày 19/7/1996. Thông tin gồm : ProductID, ProductName, OrderID, OrderDate, Quantity.


-- 4.Liệt kê danh sách các mặt hàngtừnhà cung cấp (supplier) có mã 1,3,6vàđã  xuất bán  trong quý  2năm  1997.  Thông  tin  gồm  :  ProductID, ProductName, SupplierID, OrderID,  Quantity.  Được  sắp  xếp  theo  mã nhà  cung  cấp  (SupplierID),  cùng  mã  nhà  cung  cấp  thì  sắp  xếp  theo ProductID.

-- 5.Liệt kê danh sách các mặt hàngcó đơn giá bán bằng đơn giá mua.

-- 6.Danh sách các mặt hàngbán trong ngày thứ 7 và chủ nhật của tháng 12 năm 1996, thông tin gồm ProductID, ProductName, OrderID, OrderDate, CustomerID, Unitprice, Quantity,  ToTal= Quantity*UnitPrice. Được sắp xếp theo ProductID, cùng ProductID thì sắp xếp theo Quantitygiảm dần.

-- 7.Liệt kê danh sách  các  nhân  viênđã lập hóa đơn trong tháng 7 của năm 1996.Thông  tin  gồm  :  EmployeeID, EmployeeName,   OrderID, Orderdate.

-- 8.Liệt kê danh sách các hóa đơn do nhân viên có Lastname là ‘Fuller’lập.Thông tin gồm : OrderID, Orderdate, ProductID, Quantity, Unitprice.

-- 9.Liệt kê chi tiết bán hàng của mỗi nhân viên theo từng hóa đơn trong năm 1996.  Thông  tingồm:EmployeeID,  EmployName,  OrderID,  Orderdate, ProductID, quantity, unitprice, ToTalLine=quantity*unitprice.

-- 10.Danh sách các đơn hàng sẽ được giao trong các thứ 7 của tháng 12 năm 1996. 

-- 11.Liệt kê danh  sách  các  nhân  viên chưa  lập  hóa  đơn(dùng  LEFT JOIN/RIGHT JOIN).

-- 12.Liệt  kê  danh  sách  các  sản  phẩm  chưa  bán  được  (dùng  LEFT JOIN/RIGHT JOIN).

-- 13.Liệt kê danh sách các khách hàng chưa mua hàng lần nào (dùng LEFT JOIN/RIGHT JOIN).