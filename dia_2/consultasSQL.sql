CREATE DATABASE claudio
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LOCALE_PROVIDER = 'libc'
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

-- Primero hay que conectarse a una base de datos desde la terminal
-- Paso 1: Accedemos al cliente de postgresql via el terminal.
-- Paso 2: Crea una base de datos llamada prueba1.
CREATE DATABASE prueba1;
--  Paso 3: Lista las bases de datos creadas.
\l;
-- Paso 4: Conéctate a la base de datos.
\c prueba1;

-- Creación de una tabla
create table clientes(
    nombre varchar(30),
    apellido varchar(30)
);

-- Listar las tablas de una base de datos

-- Detallar información de la tabla (relación) clientes
\d clientes

-- Paso 6: Insertar valores a los campos nombre y apellido.
-- Paso 7: Consultamos los datos ingresados con:
-- Conectando a una base de datos con PostgreSQL
insert into clientes (nombre, apellido) values ('Claudio','Méndez');
insert into clientes (nombre, apellido) values ('Elon','Musk');
select * from clientes;
insert into clientes values ('Tony', 'Stark');
insert into clientes (apellido, nombre) values ('Johansson', 'Scarlett');

-- Consultar registros en una tabla
select * from clientes order by nombre DESC;

-- Borrar algunos registros de la tabla
DELETE FROM clientes WHERE nombre = 'Claudio' AND apellido = 'Méndez';

-- DIA 2 --
SELECT * FROM productos LIMIT 10;
-- Extrae un subconjunto de 5 caracteres desde el inicio del string 'nombre_producto'.
SELECT LEFT(nombre_producto, 5) AS primeros_5_caracteres FROM productos LIMIT 10;
-- Convierte todos los caracteres de una cadena a minúsculas.
SELECT LOWER(nombre_producto) AS nombre_en_minusculas FROM productos;
-- Convierte todos los caracteres de una cadena a mayúsculas.
SELECT UPPER(nombre_producto) AS nombre_en_mayusculas FROM productos LIMIT 10;

SELECT *, LENGTH(nombre_producto) AS largo_nombre FROM productos LIMIT 10;
-- Retorna la longitud de una cadena de texto.
SELECT * FROM productos ORDER BY LENGTH(nombre_producto);
SELECT *, LENGTH(nombre_producto) AS largo_nombre FROM productos ORDER BY largo_nombre LIMIT 10;
SELECT *, LENGTH(nombre_producto) FROM productos ORDER BY LENGTH(nombre_producto);
-- Selecciona todos los datos de los productos junto a un código, este código está compuesto por las primeras 3 letras de la categoría
SELECT *, LEFT(categoria, 3) AS codigo_producto FROM productos;
SELECT *, LOWER(LEFT(categoria, 3)) AS codigo_producto FROM productos;
SELECT LOWER(LEFT(categoria, 3)) AS codigo_producto, * FROM productos;

-- FUNCIONES DE AGREGADO --
SELECT SUM(precio) FROM productos;
SELECT AVG(precio) FROM productos;
SELECT MIN(precio) FROM productos;
SELECT MAX(precio) FROM productos;
SELECT COUNT(en_stock) FROM productos WHERE en_stock = 't';

SELECT COUNT(precio) FROM productos WHERE precio > 7000;
SELECT AVG(precio) FROM productos WHERE en_stock = 't'; -- 2101.3333333333333333
SELECT SUM(precio) / COUNT(en_stock) FROM productos WHERE en_stock = 't'; -- 2101
-- Precio más alto de cada producto por categoría
SELECT MAX(precio) FROM productos GROUP BY categoria;
SELECT categoria, MAX(precio) FROM productos GROUP BY categoria;

SELECT * FROM ventas;

SELECT AVG(precio_unitario * cantidad) FROM ventas;

SELECT *, (cantidad * precio_unitario) as venta FROM ventas;

SELECT producto, AVG(precio_unitario * cantidad) FROM ventas GROUP BY producto;
SELECT producto, AVG(precio_unitario * cantidad) FROM ventas WHERE fecha > '2024-01-05' GROUP BY producto ;

-- ¿Qué tipo de producto generó la venta más alta?
SELECT producto, MAX(precio_unitario * cantidad) AS maximo FROM ventas GROUP BY producto ORDER BY maximo DESC LIMIT 1;
-- ¿Cuántos productos de vendieron en cada fecha?
SELECT fecha, COUNT(producto) AS productos FROM ventas GROUP BY fecha;

-- Obtener todos los productos que el precio este sobre el precio promedio
SELECT AVG(precio) FROM productos;-- 20.1515384615384615

SELECT * FROM productos WHERE precio > 20.1515384615384615;

SELECT * FROM productos WHERE precio > (SELECT AVG(precio) FROM productos);

-- Trabajando en la base de datos 'claudio'
CREATE TABLE clientes(
    cliente_id INTEGER,
    nombre VARCHAR(30)
);

INSERT INTO clientes(cliente_id, nombre) 
VALUES 
    (1, 'Juan'),
    (2, 'María'),
    (3, 'Carlos'),
    (4, 'Ana'),
    (5, 'Luis');

CREATE TABLE pedidos(
    id INTEGER,
    monto INTEGER,
    cliente_id INTEGER
);

INSERT INTO pedidos(id, monto, cliente_id)
VALUES
    (10, 3000, 1),
    (20, 800, 1),
    (30, 1500, 2),
    (40, 2800, 3),
    (50, 3200, 5);

-- Obtener una lista de clientes que hayan realizado al menos un pedido con un monto total superior a 1000
SELECT cliente_id FROM pedidos WHERE monto > 1000;
SELECT * FROM clientes WHERE cliente_id IN (SELECT cliente_id FROM pedidos WHERE monto > 1000);

CREATE TABLE ventas(
    empleado_id INT,
    monto INT
);

INSERT INTO ventas(empleado_id, monto)
VALUES
    (1, 100),
    (1, 150),
    (2, 200),
    (2, 250),
    (3, 300),
    (3, 350),
    (4, 400);

-- Calcular el monto promedio vendido por vendedor
SELECT empleado_id, SUM(monto) AS total_venta FROM ventas GROUP BY empleado_id;
SELECT AVG(total_venta) as promedio_ventas FROM (SELECT empleado_id, SUM(monto) AS total_venta FROM ventas GROUP BY empleado_id);

-- Encontrar los productos que se han pedido más de una vez --
SELECT id_producto, COUNT(id_producto) FROM pedidos_detalle GROUP BY id_producto;

SELECT id_producto, COUNT(id_producto) as cantidad 
FROM pedidos_detalle 
WHERE cantidad > 1 
GROUP BY id_producto;

select *
from (
    select id_producto, count(id_producto) as cant
    from pedidos_detalle 
    group by id_producto
) as temporal
where cant > 1
;

select * 
from productos
where id_producto IN (20,1,55,3 );

select * 
from productos
where id_producto IN (
    select id_producto
    from (
        select id_producto, count(id_producto) as cant
        from pedidos_detalle 
        group by id_producto
    ) as temporal
    where cant > 1
)
;