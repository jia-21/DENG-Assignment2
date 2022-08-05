USE [Assignment2DW];

DELETE FROM SalesFacts

INSERT INTO Assignment2DW..SalesFacts
(
  TimeKey,StoreKey, CustomerKey,StaffKey,
  ProductKey,OrderKey, ListPrice, Quantity, Discount)
    
SELECT
 replace(CONVERT(DATE,o.OrderDate, 112),'-',''),
 o.OrderKey,
 c.CustomerKey,
 sta.StaffKey,
 p.ProductKey, 
 sto.StoreKey,
 od.ListPrice,
 od.Quantity,
 od.Discount

FROM 
Northwind..[Order Details] od INNER JOIN Northwind..[Orders] o ON od.OrderID = o.OrderID
INNER JOIN NorthwindDW..[ShippersDIM] s ON o.ShipVia = s.ShipperKey
INNER JOIN NorthwindDW..[CustomerDIM] c ON o.CustomerID = c.CustomerKey
INNER JOIN NorthwindDW..[EmployeeDIM] e ON o.EmployeeID = e.EmployeeKey
INNER JOIN NorthwindDW..[ProductDIM] p  ON od.ProductID = p.ProductKey
INNER JOIN
	(select [EmployeeID], [RegionID]
		from Northwind..[EmployeeTerritories] et
			 inner join Northwind..[Territories] t on et.TerritoryID=t.TerritoryID
		group by [EmployeeID],[RegionID]) r
	on o.EmployeeID=r.EmployeeID



