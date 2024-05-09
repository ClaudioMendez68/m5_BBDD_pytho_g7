-- AQUÍ TRABAJARÉ CON EL SERVIDOR PostgreSQL13 --
CREATE DATABASE restricciones;
-- Restricción CHECK
CREATE TABLE productos(
    producto_no INT,
    name TEXT,
    price numeric CHECK(price > 0)
);
-- Restricción NOT NULL
CREATE TABLE products(
    product_no INTEGER NOT NULL,
    name TEXT NOT NULL,
    price NUMERIC
);

-- Restricción UNIQUE
CREATE TABLE products(
    product_no INTEGER UNIQUE,
    name TEXT,
    price NUMERIC
);

-- Restricción PRIMARY KEY 
CREATE TABLE products(
    product_no INTEGER PRIMARY KEY,
    name TEXT,
    price NUMERIC
);

-- Restricción FOREIGN KEY
CREATE TABLE products(
    product_no INTEGER PRIMARY KEY,
    name TEXT,
    price NUMERIC
);

CREATE TABLE orders(
    order_id INTEGER PRIMARY KEY,
    product_no INTEGER REFERENCES products(product_no),
    quantity INTEGER
);