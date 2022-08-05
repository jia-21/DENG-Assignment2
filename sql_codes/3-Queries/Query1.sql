-- Query 1 - Sales/profits/discounts/revenue
USE [Assignment2DW];

SELECT
SF.CustomerKey AS 'Customer Key',
C.FirstName + ' ' + C.LastName AS 'Name',
SF.StoreKey AS 'Store ID',
ROUND(SUM(SF.ListPrice * SF.Quantity * SF.Discount), 2) AS 'Total Sales - With Discount ($)',
ROUND(SUM(SF.ListPrice * SF.Quantity), 2) AS 'Total Sales - Without Discount ($)'
FROM
SalesFacts SF
JOIN
CustomerDIM C
ON
SF.CustomerKey = C.CustomerKey
GROUP BY
SF.CustomerKey, C.FirstName, C.LastName, SF.StoreKey
ORDER BY
ROUND(SUM(SF.ListPrice * SF.Quantity * SF.Discount), 2)
DESC,
SF.StoreKey
ASC;