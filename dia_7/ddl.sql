-- ● Paso 1: Crear una base de datos
CREATE DATABASE nombre_base_de_datos;
-- ● Paso 2: Mostrar todas las tablas de una base de datos.
\dt;
-- ● Paso 3: Mostrar una tabla en específica.
\dt nombre_tabla;
-- ● Paso 4: Modificar un campo de una tabla.
ALTER TABLE cuentas ADD fecha DATE;
-- ● Paso 5: Eliminar una tabla de la base de datos.
DELETE FROM cuentas;
DROP TABLE cuentas;

CREATE TABLE clientes (
    id int unique not null primary key, 
    nombre varchar not null, 
    rut varchar
unique not null);

CREATE TABLE products (
 product_no INTEGER NOT NULL,
 name TEXT NOT NULL,
 price NUMERIC
);
INSERT INTO products VALUES (012, 'producto 1', 0100);
INSERT INTO products VALUES (013, 'producto 2');
INSERT INTO products VALUES (014, 'producto 3', NULL);

DROP TABLE products;

CREATE TABLE products (
 product_no INTEGER NOT NULL,
 name TEXT NOT NULL,
 price NUMERIC DEFAULT 0
);

ALTER TABLE products
ADD PRIMARY KEY(product_no);

CREATE TABLE orders (
 order_id INTEGER PRIMARY KEY,
 product_no INTEGER REFERENCES products(product_no),
 quantity INTEGER
);
ALTER TABLE IF EXISTS public.orders
ADD CONSTRAINT check_quantity CHECK (quantity >= 0) NOT VALID;
