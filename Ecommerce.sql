-- Ecommerce management system 

-- Create a database 
CREATE DATABASE SalesDB;

-- Create a schema in SalesDB
CREATE SCHEMA sales;

CREATE TABLE sales.Customers(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    phone VARCHAR(10) UNIQUE
);

CREATE TABLE sales.Products(
    id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price NUMERIC(10,2) NOT NULL,
    stock_quantity INT NOT NULL
);

CREATE TABLE sales.Orders(
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES sales.customers(id),
    order_date DATE NOT NULL
);

CREATE TABLE sales.OrderItems(
    id SERIAL PRIMARY KEY,
    order_id INT REFERENCES sales.orders(id),
    product_id INT REFERENCES sales.products(id),
    quantity INT CHECK (quantity >= 1)
); 