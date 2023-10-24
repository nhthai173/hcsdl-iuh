-- 1.Hiển  thị  thông  tinvề  hóa  đơn  có  mã  ‘10248’,  bao  gồm:  OrderID, OrderDate,  CustomerID,  EmployeeID,  ProductID,  Quantity,  Unitprice, Discount.

use Northwind

SELECT
    Orders.OrderID,
    OrderDate,
    CustomerID,
    EmployeeID,
    ProductID,
    Quantity,
    Unitprice,
    Discount 
FROM
    Orders
LEFT JOIN 
	[Order Details] 
ON
	Orders.OrderID = [Order Details].OrderID
WHERE
	Orders.OrderID = '10248'






-- 2.Liệt kê các khách  hàngcó lập hóa đơn trong tháng 7/1997và  9/1997. Thông  tin  gồm  CustomerID,  CompanyName,  Address,  OrderID, Orderdate. Được sắp xếp theo CustomerID, cùng CustomerID thì sắp xếp theo OrderDate giảm dần.

SELECT
    Customers.CustomerID,
    CompanyName,
    Address,
    Orders.OrderID,
    OrderDate
FROM
    Customers
LEFT JOIN
    Orders
ON
    Customers.CustomerID = Orders.CustomerID
WHERE
    OrderDate IN ('1997-07-01', '1997-09-30')









-- 3.Liệt kê danh sách các mặt hàngxuất bán vào ngày 19/7/1996. Thông tin gồm : ProductID, ProductName, OrderID, OrderDate, Quantity.

SELECT
    Products.ProductID,
    ProductName,
    Orders.OrderID,
    OrderDate,
    Quantity
FROM
    Products
LEFT JOIN
    [Order Details]
ON
    Products.ProductID = [Order Details].ProductID
LEFT JOIN
    Orders
ON
    [Order Details].OrderID = Orders.OrderID
WHERE
    OrderDate = '1996-07-19'










-- 4.Liệt kê danh sách các mặt hàngtừnhà cung cấp (supplier) có mã 1,3,6vàđã  xuất bán  trong quý  2năm  1997.  Thông  tin  gồm  :  ProductID, ProductName, SupplierID, OrderID,  Quantity.  Được  sắp  xếp  theo  mã nhà  cung  cấp  (SupplierID),  cùng  mã  nhà  cung  cấp  thì  sắp  xếp  theo ProductID.

SELECT
    Products.ProductID,
    ProductName,
    Suppliers.SupplierID,
    Orders.OrderID,
    Quantity
FROM
    Products
LEFT JOIN
    [Order Details]
ON
    Products.ProductID = [Order Details].ProductID
LEFT JOIN
    Orders
ON
    [Order Details].OrderID = Orders.OrderID
LEFT JOIN
    Suppliers
ON
    Products.SupplierID = Suppliers.SupplierID
WHERE
    Suppliers.SupplierID IN (1, 3, 6)
	AND YEAR(OrderDate) = 1997
    AND DATEPART(QUARTER, OrderDate) = 2
ORDER BY
    Suppliers.SupplierID,
    Products.ProductID













-- 5.Liệt kê danh sách các mặt hàngcó đơn giá bán bằng đơn giá mua.

SELECT DISTINCT
    Products.ProductID,
    ProductName,
    Products.UnitPrice
FROM
    Products
LEFT JOIN
    [Order Details]
ON
    Products.ProductID = [Order Details].ProductID
WHERE
    Products.UnitPrice = [Order Details].UnitPrice












-- 6.Danh sách các mặt hàngbán trong ngày thứ 7 và chủ nhật của tháng 12 năm 1996, thông tin gồm ProductID, ProductName, OrderID, OrderDate, CustomerID, Unitprice, Quantity,  ToTal= Quantity*UnitPrice. Được sắp xếp theo ProductID, cùng ProductID thì sắp xếp theo Quantitygiảm dần.

SELECT
    Products.ProductID,
    ProductName,
    Orders.OrderID,
    OrderDate,
    Customers.CustomerID,
    [Order Details].Unitprice,
    Quantity,
    Quantity * [Order Details].Unitprice AS ToTal
FROM
    Products
LEFT JOIN
    [Order Details]
ON
    Products.ProductID = [Order Details].ProductID
LEFT JOIN
    Orders
ON
    [Order Details].OrderID = Orders.OrderID
LEFT JOIN
    Customers
ON
    Orders.CustomerID = Customers.CustomerID
WHERE
    DATEPART(WEEKDAY, OrderDate) IN (7, 1)
    AND MONTH(OrderDate) = 12
    AND YEAR(OrderDate) = 1996
ORDER BY
    Products.ProductID,
    Quantity DESC








-- 7.Liệt kê danh sách  các  nhân  viênđã lập hóa đơn trong tháng 7 của năm 1996.Thông  tin  gồm  :  EmployeeID, EmployeeName,   OrderID, Orderdate.

SELECT
    Employees.EmployeeID,
    FirstName + ' ' + LastName AS EmployeeName,
    Orders.OrderID,
    OrderDate
FROM
    Employees
LEFT JOIN
    Orders
ON
    Employees.EmployeeID = Orders.EmployeeID
WHERE
    MONTH(OrderDate) = 7
    AND YEAR(OrderDate) = 1996









-- 8.Liệt kê danh sách các hóa đơn do nhân viên có Lastname là ‘Fuller’lập.Thông tin gồm : OrderID, Orderdate, ProductID, Quantity, Unitprice.

SELECT
    Orders.OrderID,
    OrderDate,
    Products.ProductID,
    Quantity,
    [Order Details].Unitprice
FROM
    Orders
LEFT JOIN
    [Order Details]
ON
    Orders.OrderID = [Order Details].OrderID
LEFT JOIN
    Products
ON
    [Order Details].ProductID = Products.ProductID
LEFT JOIN
    Employees
ON
    Orders.EmployeeID = Employees.EmployeeID
WHERE
    LastName = 'Fuller'










-- 9.Liệt kê chi tiết bán hàng của mỗi nhân viên theo từng hóa đơn trong năm 1996.  Thông  tingồm:EmployeeID,  EmployName,  OrderID,  Orderdate, ProductID, quantity, unitprice, ToTalLine=quantity*unitprice.

SELECT
    Employees.EmployeeID,
    FirstName + ' ' + LastName AS EmployeeName,
    Orders.OrderID,
    OrderDate,
    Products.ProductID,
    Quantity,
    [Order Details].Unitprice,
    Quantity * [Order Details].Unitprice AS ToTalLine
FROM
    Employees
LEFT JOIN
    Orders
ON
    Employees.EmployeeID = Orders.EmployeeID
LEFT JOIN
    [Order Details]
ON
    Orders.OrderID = [Order Details].OrderID
LEFT JOIN
    Products
ON
    [Order Details].ProductID = Products.ProductID
WHERE
    YEAR(OrderDate) = 1996
GROUP BY 
    Employees.EmployeeID,
    FirstName + ' ' + LastName,
    Orders.OrderID,
    OrderDate,
    Products.ProductID,
    Quantity,
    [Order Details].Unitprice












-- 10.Danh sách các đơn hàng sẽ được giao trong các thứ 7 của tháng 12 năm 1996.

SELECT
    Orders.OrderID,
    OrderDate,
    Customers.CustomerID,
    CompanyName,
    Address,
    City,
    Country
FROM
    Orders
LEFT JOIN
    Customers
ON
    Orders.CustomerID = Customers.CustomerID
WHERE
    DATEPART(WEEKDAY, OrderDate) = 7
    AND MONTH(OrderDate) = 12
    AND YEAR(OrderDate) = 1996







-- 11.Liệt kê danh  sách  các  nhân  viên chưa  lập  hóa  đơn(dùng  LEFT JOIN/RIGHT JOIN).

SELECT
    Employees.EmployeeID,
    FirstName + ' ' + LastName AS EmployeeName,
	Orders.EmployeeID
FROM
    Employees
LEFT JOIN
    Orders
ON
    Employees.EmployeeID = Orders.EmployeeID
WHERE
    Orders.EmployeeID IS NULL










-- 12.Liệt  kê  danh  sách  các  sản  phẩm  chưa  bán  được  (dùng  LEFT JOIN/RIGHT JOIN).

SELECT
    Products.ProductID,
    ProductName,
    [Order Details].ProductID
FROM
    Products
LEFT JOIN
    [Order Details]
ON
    Products.ProductID = [Order Details].ProductID
WHERE
    [Order Details].ProductID IS NULL














-- 13.Liệt kê danh sách các khách hàng chưa mua hàng lần nào (dùng LEFT JOIN/RIGHT JOIN).

SELECT
    Customers.CustomerID,
    CompanyName,
    Orders.CustomerID
FROM
    Customers
LEFT JOIN
    Orders
ON
    Customers.CustomerID = Orders.CustomerID
WHERE
    Orders.CustomerID IS NULL