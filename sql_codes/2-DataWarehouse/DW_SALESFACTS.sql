USE [Assignment2DW];

DELETE FROM
	SalesFacts
INSERT INTO
	Assignment2DW..SalesFacts (
		TimeKey,
		StoreKey,
		CustomerKey,
		StaffKey,
		ProductKey,
		OrderKey,
		ListPrice,
		Quantity,
		Discount
	)
SELECT
	REPLACE(CONVERT(DATE, o.OrderDate, 112), '-', ''),
	o.OrderKey,
	c.CustomerKey,
	sta.StaffKey,
	p.ProductKey,
	sto.StoreKey,
	od.ListPrice,
	od.Quantity,
	od.Discount
FROM
	Assignment2DW..[SalesFacts] sf
	INNER JOIN Assignment2..[Orders] o ON sf.OrderKey = o.order_id
	INNER JOIN Assignment2..[CustomerDIM] c ON sf.CustomerKey = c.customer_id
	INNER JOIN Assignment2..[StaffDIM] sta ON sf.StaffKey = s.staff_id
	INNER JOIN Assignment2..[ProductDIM] p ON sf.ProductID = p.ProductKey
	INNER JOIN Assignment2..[StoreDIM] s ON sf.StoreKey = s.store_id
	INNER JOIN (
		SELECT
			[EmployeeID],
			[RegionID]
		FROM
			Assignment2..[EmployeeTerritories] et
			INNER JOIN Assignment2..[Territories] t ON et.TerritoryID = t.TerritoryID
		GROUP BY
			[EmployeeID],
			[RegionID]
	) r ON o. = r.EmployeeID