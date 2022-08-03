USE [Assignment2];

CREATE TABLE Assignment2.sales.stores (
    store_id VARCHAR(5) PRIMARY KEY,
    store_name VARCHAR (255) NOT NULL,
    phone VARCHAR (25),
    email VARCHAR (255),
    street VARCHAR (255),
    city VARCHAR (255),
    state VARCHAR (10),
    zip_code VARCHAR (5)
);