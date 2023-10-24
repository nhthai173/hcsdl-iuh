-- 1.Liệt kê danh sách các orders ứng với tổng tiền của từng hóa đơn. Thông tin bao gồm OrderID, OrderDate, Total. Trong đó Totallà Sum của Quantity * Unitprice, kết nhóm theo OrderID.

SELECT
    OrderID,
    OrderDate,
    SUM(Quantity * UnitPrice) AS Total
FROM
    [Order Details]
    INNER JOIN Orders ON [Order Details].OrderID = Orders.OrderID
GROUP BY
    OrderID,
    OrderDate









-- 2.Liệt kê danh  sách  các  orders mà địa chỉ nhận hàng ởthành phố ‘Madrid’(Shipcity). Thông tin bao gồm OrderID, OrderDate, Total. Trong đó Totallà tổng trị giá hóa đơn, kết nhóm theo OrderID.

SELECT
    Orders.OrderID,
    OrderDate,
    SUM(Quantity * UnitPrice) AS Total
FROM
    [Order Details]
    INNER JOIN Orders ON [Order Details].OrderID = Orders.OrderID
    INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE
    ShipCity = 'Madrid'













-- 3.1 Viết các truy vấn để thống kê số lượngcác hóa đơn: Trong mỗi năm. Thông tin hiển thị : Year , CoutOfOrders?

SELECT
    YEAR(OrderDate) AS Year,
    COUNT(OrderID) AS CountOfOrders
FROM
    Orders
GROUP BY
    YEAR(OrderDate)





-- 3.2 Trong  mỗi  tháng/năm .  Thông  tin  hiển  thị  :  Year  ,  Month,  CoutOfOrders?

SELECT
    YEAR(OrderDate) AS Year,
    MONTH(OrderDate) AS Month,
    COUNT(OrderID) AS CountOfOrders
FROM
    Orders
GROUP BY
    YEAR(OrderDate),
    MONTH(OrderDate)





-- 3.3 Trong mỗi tháng/năm và ứng với mỗi nhân viên. Thông tin hiển thị: Year,Month, EmployeeID,  CoutOfOrders?

SELECT
    YEAR(OrderDate) AS Year,
    MONTH(OrderDate) AS Month,
    EmployeeID,
    COUNT(OrderID) AS CountOfOrders
FROM
    Orders
GROUP BY
    YEAR(OrderDate),
    MONTH(OrderDate),
    EmployeeID











-- 4.Cho  biết  mỗi Employee đã  lập  bao  nhiêu  hóa  đơn.  Thông  tin  gồm EmployeeID, EmployeeName, CountOfOrder. Trong đó  CountOfOrder là tổng  số  hóa  đơncủa  từng employee. EmployeeName  được  ghép  từ LastName và FirstName.

SELECT
    EmployeeID,
    LastName + ' ' + FirstName AS EmployeeName,
    COUNT(OrderID) AS CountOfOrder
FROM
    Employees
    INNER JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
GROUP BY
    EmployeeID,
    LastName,
    FirstName









-- 5.Cho biết mỗi Employee đã lập được bao nhiêu hóa đơn, ứng với tổng tiềncác  hóa  đơn  tương  ứng.Thông  tin  gồm  EmployeeID, EmployeeName, CountOfOrder , Total.

SELECT
    EmployeeID,
    LastName + ' ' + FirstName AS EmployeeName,
    COUNT(OrderID) AS CountOfOrder,
    SUM(Quantity * UnitPrice) AS Total
FROM
    Employees
    INNER JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
    INNER JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
GROUP BY
    EmployeeID,
    LastName,
    FirstName












-- 6.Liệt kê  bảng lương của  mỗi Employee theo từng tháng trong năm 1996 gồm    EmployeeID,    EmployName,    Month_Salary, Salary = sum(quantity*unitprice)*10%.  Được  sắp  xếp  theo  Month_Salary,  cùmg Month_Salary thì sắp xếp theo Salary giảm dần.

SELECT
    EmployeeID,
    LastName + ' ' + FirstName AS EmployeeName,
    MONTH(OrderDate) AS Month,
    SUM(Quantity * UnitPrice) * 0.1 AS Salary
FROM
    Employees
    INNER JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
    INNER JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
WHERE
    YEAR(OrderDate) = 1996
GROUP BY
    EmployeeID,
    LastName,
    FirstName,
    MONTH(OrderDate)
ORDER BY
    MONTH(OrderDate),
    Salary DESC











-- 7.Tính tổng số hóa đơn và tổng tiền  các hóa đơncủa mỗi nhân viên đã bán trong  tháng  3/1997,  có tổng  tiền  >4000.  Thông  tin  gồmEmployeeID, LastName, FirstName, CountofOrder, Total.

SELECT
    EmployeeID,
    LastName,
    FirstName,
    COUNT(OrderID) AS CountofOrder,
    SUM(Quantity * UnitPrice) AS Total
FROM
    Employees
    INNER JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
    INNER JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
WHERE
    YEAR(OrderDate) = 1997
    AND MONTH(OrderDate) = 3
GROUP BY
    EmployeeID,
    LastName,
    FirstName
HAVING
    SUM(Quantity * UnitPrice) > 4000


















-- 8.Liệt kê danh sách các customer ứng với tổng số hoá đơn, tổng tiền các hoá đơn, mà các hóa đơn được lập từ 31/12/1996 đến 1/1/1998 và tổng tiền các hóa đơn >20000. Thông tin được sắp xếp theo CustomerID,  cùng  mã  thì sắp xếp theo tổng tiền giảm dần.

SELECT
    Customers.CustomerID,
    CompanyName,
    COUNT(Orders.OrderID) AS CountOfOrder,
    SUM(Quantity * UnitPrice) AS Total
FROM
    Customers
    INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
    INNER JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
WHERE
    OrderDate BETWEEN '1996-12-31' AND '1998-01-01'
GROUP BY
    Customers.CustomerID,
    CompanyName
HAVING
    SUM(Quantity * UnitPrice) > 20000
ORDER BY
    Customers.CustomerID,
    Total DESC















-- 9.Liệt kê danh  sách  các  customer ứng với tổng tiền của các hóa đơn ở từng tháng.  Thông  tin  bao  gồm  CustomerID,  CompanyName,  Month_Year, Total. Trong đó Month_year là tháng và năm lập hóa đơn, Total là tổng của Unitprice* Quantity.

SELECT
    Customers.CustomerID,
    CompanyName,
    STR(MONTH(OrderDate)) + '/' + STR(YEAR(OrderDate)) AS Month_Year,
    SUM(Quantity * UnitPrice) AS Total
FROM
    Customers
    INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
    INNER JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
GROUP BY
    Customers.CustomerID,
    CompanyName,
    STR(MONTH(OrderDate)) + '/' + STR(YEAR(OrderDate))
ORDER BY
    Customers.CustomerID,
    Year,
    Month














-- 10.Liệt  kê danh  sách  cácnhóm  hàng  (category) có  tổng  số  lượng  tồn (UnitsInStock) lớn hơn 300, đơn giá trung bình nhỏ hơn 25. Thông tin bao gồm CategoryID, CategoryName, Total_UnitsInStock, Average_Unitprice.





-- 11.Liệt kê danh sách các nhóm hàng (category)có tổng số mặt hàng(product)nhỏhớn10.  Thông  tin  kết  quả  bao  gồmCategoryID,  CategoryName, CountOfProducts.Được sắp xếp theo CategoryName, cùng CategoryNamethì sắptheo CountOfProductsgiảm dần.





-- 12.Liệt kê danh sách các Productbán trongquý1 năm 1998 có tổng số lượng bán ra>200, thông tin gồm [ProductID], [ProductName], SumofQuatity 








-- 13.Cho biết Employeenào bán được nhiều tiền nhất trongtháng7 năm 1997






-- 14.Liệt kê danh sách 3 Customercó nhiều đơn hàng nhất của năm 1996.





-- 15.Liệt  kê  danh  sách  các Products  có  tổng số  lượng  lập  hóa  đơn  lớn  nhất.Thông tin gồm ProductID, ProductName, CountOfOrders.