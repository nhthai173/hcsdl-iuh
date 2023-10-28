use Northwind

--1. Liệt kê các product có đơn giá mua lớn hơn đơn giá mua trung bình của
--tất cả các product.

SELECT *
FROM
	Products
WHERE
	UnitPrice > (SELECT AVG(UnitPrice) FROM Products)




--2. Liệt kê các product có đơn giá mua lớn hơn đơn giá mua nhỏ nhất của tất
--cả các product

SELECT *
FROM
	Products
WHERE
	UnitPrice > (SELECT MIN(UnitPrice) FROM Products)




--3. Liệt kê các product có đơn giá bán lớn hơn đơn giá bán trung bình của
--các product. Thông tin gồm ProductID, ProductName, OrderID,
--Orderdate, Unitprice .

SELECT
	ProductID,
	ProductName,
	OrderID,
	Orderdate,
	Unitprice
FROM
	Products, Orders
WHERE
	UnitPrice > (SELECT AVG(UnitPrice) FROM Products)







--4. Liệt kê các product có đơn giá bán lớn hơn đơn giá bán trung bình của
--các product có ProductName bắt đầu là ‘N’.

SELECT *
FROM
	Products
WHERE
	UnitPrice > (SELECT AVG(UnitPrice) FROM Products)
	AND ProductName LIKE 'N%'






--5. Cho biết những sản phẩm có tên bắt đầu bằng ‘T’ và có đơn giá bán lớn
--hơn đơn giá bán của (tất cả) những sản phẩm có tên bắt đầu bằng chữ
--‘V’.

SELECT *
FROM
	Products
WHERE
	ProductName LIKE 'T%'
	AND UnitPrice > (SELECT MAX(UnitPrice) FROM Products WHERE ProductName LIKE 'V%')





--6. Cho biết sản phẩm nào có đơn giá bán cao nhất trong số những sản phẩm
--có đơn vị tính có chứa chữ ‘box’ .

SELECT *
FROM
	Products
WHERE
	UnitPrice = (SELECT MAX(UnitPrice) FROM Products WHERE QuantityPerUnit LIKE '%box%')









--7. Liệt kê các product có tổng số lượng bán (Quantity) trong năm 1998 lớn
--hơn tổng số lượng bán trong năm 1998 của mặt hàng có mã 71

SELECT
	p.ProductID,
	ProductName,
	SUM(Quantity) as SumOfQuantity
FROM
	Products p
	INNER JOIN [Order Details] od ON od.ProductID = p.ProductID
	INNER JOIN Orders o ON o.OrderID = od.OrderID
WHERE
	YEAR(OrderDate) = 1998
GROUP BY
	p.ProductID,
	ProductName,
	YEAR(OrderDate)
HAVING
	SUM(Quantity) > (SELECT
						SUM(Quantity)
					FROM
						Products p
						INNER JOIN [Order Details] od ON od.ProductID = p.ProductID
						INNER JOIN Orders o ON o.OrderID = od.OrderID
					WHERE
						YEAR(OrderDate) = 1998
						AND p.ProductID = 71
					GROUP BY
						p.ProductID,
						YEAR(OrderDate))







--8. Thực hiện :
--- Thống kê tổng số lượng bán ứng với mỗi mặt hàng thuộc nhóm
--hàng có CategoryID là 4. Thông tin : ProductID, QuantityTotal
--(tập A)
--- Thống kê tổng số lượng bán ứng với mỗi mặt hàng thuộc nhóm
--hàng có CategoryID khác 4 . Thông tin : ProductID,
--QuantityTotal (tập B)
--- Dựa vào 2 truy vấn trên : Liệt kê danh sách các mặt hàng trong
--tập A có QuantityTotal lớn hơn tất cả QuantityTotal của tập B











--9. Danh sách các Product có tổng số lượng bán được lớn nhất trong năm
--1998
--Lưu ý : Có nhiều phương án thực hiện các truy vấn sau (dùng JOIN hoặc
--subquery ). Hãy đưa ra phương án sử dụng subquery.
--10. Danh sách các products đã có khách hàng mua hàng (tức là ProductID có
--trong [Order Details]). Thông tin bao gồm ProductID, ProductName,
--Unitprice
--11. Danh sách các hóa đơn của những khách hàng ở thành phố LonDon và
--Madrid.
--12.Liệt kê các sản phẩm có trên 10 đơn hàng trong quí 3 và 4 năm 1997,
--thông tin gồm ProductID, ProductName.
--13.Liệt kê danh sách các sản phẩm chưa bán được trong tháng 7 năm 1996
--14.Liệt kê danh sách các Employes không lập hóa đơn vào ngày hôm nay
--15.Liệt kê danh sách các Customers chưa mua hàng trong năm 1997
--16.Tìm tất cả các Customers mua các sản phẩm có tên bắt đầu bằng chữ T
--trong tháng 7 năm 1997
--17.Liệt kê danh sách các khách hàng mua các hóa đơn mà các hóa đơn này
--chỉ mua những sản phẩm có mã >=3