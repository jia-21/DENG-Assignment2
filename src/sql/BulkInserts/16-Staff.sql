BULK INSERT sales.staffs
FROM 'C:\SP\Notes, Practicals etc\AY 2223\DENG\Assignment2\src\txt\staff.txt' -- Replace this with your own path
WITH
    (
        FIELDTERMINATOR = ';',
        ROWTERMINATOR = '\n',
        FIRSTROW = 2
    )