--Câu 1 : Hiển thị danh sách các mặt hàng được cung cấp từ nhà cung cấp đến từ ‘USA’ (country) . Thông tin bao gồm : ProductID, ProductName, QuantityPerUnit, Unitprice, UnitsInStock ?

use Northwind

SELECT
	ProductID,
	ProductName,
	QuantityPerUnit,
	Unitprice,
	UnitsInStock
FROM
	Products
LEFT JOIN
	Suppliers
ON
	Products.SupplierID = Suppliers.SupplierID
WHERE
	Country = 'USA'

--Câu 2 : Hiển thị danh sách các mặt hàng thuộc nhóm hàng có tên ‘Seafood’. Thông tin bao gồm : ProductID, ProductName, SupplierID, CompanyName, Country ?

SELECT
	ProductID,
	ProductName,
	Products.SupplierID,
	CompanyName,
	Country
FROM
	Products
LEFT JOIN
	Suppliers
ON
	Products.SupplierID = Suppliers.SupplierID
LEFT JOIN
	Categories
ON
	Products.CategoryID = Categories.CategoryID
WHERE
	CategoryName = 'Seafood'




--Câu 3 - Chan : Thống kê tổng số lượng xuất bán ứng với mỗi mặt hàng trong mỗi tháng của năm 1998 (chỉ thống kê với các mặt hàng thuộc nhóm hàng categoryID = 8 và đến từ nhà cung cấp có country là ‘USA’ ). Thông tin gồm : ProductID, ProductName, Month, SumOfQuantity ?

SELECT
	Products.ProductID,
	ProductName,
	MONTH(OrderDate) as Month,
	SUM(Quantity) as SumOfQuantity
FROM
	Products
LEFT JOIN
	[Order Details]
ON
	[Order Details].ProductID = Products.ProductID
LEFT JOIN
	Orders
ON
	Orders.OrderID = [Order Details].OrderID
WHERE
	YEAR(OrderDate) = 1998
	AND CategoryID = 8
	AND (SELECT Country FROM Suppliers WHERE Products.SupplierID = Suppliers.SupplierID) = 'USA'
GROUP BY
	MONTH(OrderDate),
	Products.ProductID,
	ProductName









--Câu 4 : Dựa trên câu 3, cho biết tổng số lượng xuất bán lớn nhất là mặt hàng nào và vào tháng nào. Thông tin gồm : ProductID, ProductName, Month, SumOfQuantity ?


SELECT
	Products.ProductID,
	ProductName,
	MONTH(OrderDate) as Month,
	SUM(Quantity) as SumOfQuantity
INTO
	Cau3DeChan
FROM
	Products
LEFT JOIN
	[Order Details]
ON
	[Order Details].ProductID = Products.ProductID
LEFT JOIN
	Orders
ON
	Orders.OrderID = [Order Details].OrderID
WHERE
	YEAR(OrderDate) = 1998
	AND CategoryID = 8
	AND (SELECT Country FROM Suppliers WHERE Products.SupplierID = Suppliers.SupplierID) = 'USA'
GROUP BY
	MONTH(OrderDate),
	Products.ProductID,
	ProductName





SELECT TOP 1
	ProductID,
	ProductName,
	Month,
	SumOfQuantity
FROM
	Cau3DeChan
GROUP BY
	Month,
	ProductID,
	ProductName,
	SumOfQuantity
ORDER BY
	SumOfQuantity DESC










--Câu 5 :Thực hiện câu 4 bằng cách khác (Query lồng nhau)

SELECT
	ProductID,
	ProductName,
	Month,
	SumOfQuantity
FROM
	Cau3DeChan
WHERE
	SumOfQuantity = (SELECT MAX(SumOfQuantity) FROM Cau3DeChan)
GROUP BY
	Month,
	ProductID,
	ProductName,
	SumOfQuantity




