USE [Assignment2];

BULK INSERT production.stocks
FROM '' -- Replace with your own path
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
)