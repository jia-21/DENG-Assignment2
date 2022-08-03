USE Assignment2;

DECLARE @Products VARCHAR(MAX);

SELECT
    @Products = BulkColumn

FROM
    OPENROWSET(
        BULK 'C:\SP\Notes, Practicals etc\AY 2223\DENG\Assignment2\src\json\products.json' -- Replace this with your own path
        SINGLE_BLOB
    ) JSON

INSERT INTO
    production.products

SELECT
    *
FROM
    OpenJSON(@Products, '$') WITH (
        product_id varchar(10) '$.product_id',
        product_name VARCHAR (255) '$.product_name',
        brand_id varchar(5) '$.brand_id',
        category_id varchar(5) '$.category_id',
        model_year int '$.model_year',
        list_price DECIMAL (10, 2) '$.list_price'
    )