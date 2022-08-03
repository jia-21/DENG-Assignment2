BULK INSERT sales.orders
FROM 'C:\SP\Notes, Practicals etc\AY 2223\DENG\Assignment2\src\csv\Orders.csv' -- Replace with your own path
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
)