USE [production];

CREATE TABLE products (
    product_id varchar(10) PRIMARY KEY,
    product_name VARCHAR (255) NOT NULL,
    brand_id varchar(5) NOT NULL,
    category_id varchar(5) NOT NULL,
    model_year int NOT NULL,
    list_price DECIMAL (10, 2) NOT NULL,
    FOREIGN KEY (category_id) REFERENCES production.categories (category_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (brand_id) REFERENCES sales.brands (brand_id) ON DELETE CASCADE ON UPDATE CASCADE
);