-- 1.Liệt kê danh sách các orders ứng với tổng tiền của từng hóa đơn. Thông tin bao gồm OrderID, OrderDate, Total. Trong đó Totallà Sum của Quantity * Unitprice, kết nhóm theo OrderID.






-- 2.Liệt kê danh  sách  các  orders mà địa chỉ nhận hàng ởthành phố ‘Madrid’(Shipcity). Thông tin bao gồm OrderID, OrderDate, Total. Trong đó Totallà tổng trị giá hóa đơn, kết nhóm theo OrderID.


-- 3.Viết cáctruy vấn để thống kê số lượngcác hóa đơn  : -Trong mỗi năm. Thông tin hiển thị : Year , CoutOfOrders?-Trong  mỗi  tháng/năm .  Thông  tin  hiển  thị  :  Year  ,  Month,  CoutOfOrders?-Trong mỗi tháng/năm và ứng với mỗi nhân viên. Thông tin hiển thị: Year,Month, EmployeeID,  CoutOfOrders?



-- 4.Cho  biết  mỗi Employee đã  lập  bao  nhiêu  hóa  đơn.  Thông  tin  gồm EmployeeID, EmployeeName, CountOfOrder. Trong đó  CountOfOrder là tổng  số  hóa  đơncủa  từng employee. EmployeeName  được  ghép  từ LastName và FirstName.



-- 5.Cho biết mỗi Employee đã lập được bao nhiêu hóa đơn, ứng với tổng tiềncác  hóa  đơn  tương  ứng.Thông  tin  gồm  EmployeeID, EmployeeName, CountOfOrder , Total.




-- 6.Liệt kê  bảng lương của  mỗi Employee theo từng tháng trong năm 1996 gồm    EmployeeID,    EmployName,    Month_Salary, Salary = sum(quantity*unitprice)*10%.  Được  sắp  xếp  theo  Month_Salary,  cùmg Month_Salary thì sắp xếp theo Salary giảm dần.




-- 7.Tính tổng số hóa đơn và tổng tiền  các hóa đơncủa mỗi nhân viên đã bán trong  tháng  3/1997,  có tổng  tiền  >4000.  Thông  tin  gồmEmployeeID, LastName, FirstName, CountofOrder, Total.






-- 8.Liệt kê danh sách các customer ứng với tổng số hoá đơn, tổng tiền các hoá đơn, mà các hóa đơn được lập từ 31/12/1996 đến 1/1/1998 và tổng tiền các hóa đơn >20000. Thông tin được sắp xếp theo CustomerID,  cùng  mã  thì sắp xếp theo tổng tiền giảm dần.







-- 9.Liệt kê danh  sách  các  customer ứng với tổng tiền của các hóa đơn ở từng tháng.  Thông  tin  bao  gồm  CustomerID,  CompanyName,  Month_Year, Total. Trong đó Month_year là tháng và năm lập hóa đơn, Total là tổng của Unitprice* Quantity.






-- 10.Liệt  kê danh  sách  cácnhóm  hàng  (category) có  tổng  số  lượng  tồn (UnitsInStock) lớn hơn 300, đơn giá trung bình nhỏ hơn 25. Thông tin bao gồm CategoryID, CategoryName, Total_UnitsInStock, Average_Unitprice.





-- 11.Liệt kê danh sách các nhóm hàng (category)có tổng số mặt hàng(product)nhỏhớn10.  Thông  tin  kết  quả  bao  gồmCategoryID,  CategoryName, CountOfProducts.Được sắp xếp theo CategoryName, cùng CategoryNamethì sắptheo CountOfProductsgiảm dần.





-- 12.Liệt kê danh sách các Productbán trongquý1 năm 1998 có tổng số lượng bán ra>200, thông tin gồm [ProductID], [ProductName], SumofQuatity 








-- 13.Cho biết Employeenào bán được nhiều tiền nhất trongtháng7 năm 1997






-- 14.Liệt kê danh sách 3 Customercó nhiều đơn hàng nhất của năm 1996.





-- 15.Liệt  kê  danh  sách  các Products  có  tổng số  lượng  lập  hóa  đơn  lớn  nhất.Thông tin gồm ProductID, ProductName, CountOfOrders.