USE [Assignment2];

BULK INSERT production.categories
FROM '' -- Replace this with your own path
WITH
    (
        FIELDTERMINATOR = ' ',
        ROWTERMINATOR = '\n'
    )