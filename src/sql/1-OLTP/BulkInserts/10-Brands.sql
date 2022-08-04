USE [Assignment2];

BULK INSERT production.brands
FROM '' -- Replace this with your own path
WITH
    (
        FIELDTERMINATOR = ' ',
        ROWTERMINATOR = '\n'
    )