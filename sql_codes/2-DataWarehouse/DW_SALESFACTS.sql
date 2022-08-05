use assignment2DW

DELETE FROM SalesFacts

INSERT INTO assignment2DW..SalesFacts
(
  TimeKey, CustomerKey,StaffKey,
  ProductKey, StoreKey, ListPrice, Quantity, Discount)  
SELECT
 replace(CONVERT(DATE,ord.order_date, 112),'-',''),
 c.CustomerKey,
 e.StaffKey,
 p.ProductKey, 
 s.StoreKey,
 oi.list_Price,
 oi.Quantity,
 oi.Discount
FROM 
assignment2.sales.order_items oi INNER JOIN assignment2.sales.orders ord ON oi.order_id = ord.order_id
INNER JOIN assignment2DW..[CustomerDIM] c ON ord.Customer_ID = c.customerKey
INNER JOIN assignment2DW..[StaffDIM] e ON ord.staff_ID = e.staffKey
INNER JOIN assignment2DW..[StoreDim] s ON ord.store_id= s.storeKey
INNER JOIN assignment2DW..[ProductDIM] p ON oi.Product_ID = p.ProductKey
