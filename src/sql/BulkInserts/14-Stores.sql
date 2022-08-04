USE [Assignment2];

BULK INSERT sales.stores
FROM 'C:\SP\Notes, Practicals etc\AY 2223\DENG\Assignment2\src\txt\store.txt' -- Replace this with your own path
WITH
    (
        FIRSTROW = 2,
        FIELDTERMINATOR = ';',
        ROWTERMINATOR = '\n'
    )

-- If that does not return "3 rows affected", use this
/*
    INSERT INTO sales.stores
    ('ST1', 'Santa Cruz Bikes', '(831) 476-4321', 'santacruz@bikes.shop', '3700 Portola Drive', 'Santa Cruz', 'CA', 95060),
    ('ST2','Baldwin Bikes', '(516) 379-8888', 'baldwin@bikes.shop', '4200 Chestnut Lane', 'Baldwin', 'NY', 11432),
    ('ST3','Rowlett Bikes', '(972) 530-5555', 'rowlett@bikes.shop', '8000 Fairway Avenue', 'Rowlett', 'TX', 75088)
*/