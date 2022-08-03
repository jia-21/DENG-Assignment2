BULK INSERT production.stocks
FROM 'C:\SP\Notes, Practicals etc\AY 2223\DENG\Assignment2\src\csv\Stocks.csv' -- Replace with your own path
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
)