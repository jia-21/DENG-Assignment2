BULK INSERT production.categories
FROM 'C:\SP\Notes, Practicals etc\AY 2223\DENG\Assignment2\src\txt\category.txt' -- Replace this with your own path
WITH
    (
        FIELDTERMINATOR = ' ',
        ROWTERMINATOR = '\n'
    )