-- Trabajando con la base de datos 'claudio'
CREATE TABLE productos(
    id INT,
    monto INT,
    cliente_id INT
);

INSERT INTO productos(id, monto, cliente_id)
VALUES 
    (10, 3000, 1),
    (20, 800, 1),
    (30, 1500, 2),
    (40, 2800, 3),
    (50, 3200, 3),
    (60, 400, 1);
-- INNER JOIN
SELECT clientes.cliente_id, clientes.nombre, productos.id, productos.monto
FROM clientes
INNER JOIN productos ON clientes.cliente_id = productos.cliente_id;

-- INNER JOIN --
-- SELECT * FROM TABLEA A INNER JOIN TABLEB B ON A.KEY = B.KEY;
-- TABLEA es la que posee la PK(Primary Key)
-- TABLEB es la que posee la FK(Foreign Key)

SELECT * FROM productos A INNER JOIN pedidos_detalle B ON A.id_producto = B.id_producto;

INSERT INTO productos (id_producto, nombre, precio)
VALUES (14, 'Producto 14', 25.74);
INSERT INTO productos (id_producto, nombre, precio)
VALUES (15, 'Producto 15', 50.74);

-- LEFT JOIN --
-- SELECT * FROM TABLEA A LEFT JOIN TABLEB B ON A.KEY = B.KEY WHERE B.KEY IS NULL;
-- TABLEA es la que posee la PK(Primary Key)
-- TABLEB es la que posee la FK(Foreign Key)
SELECT * FROM productos A LEFT JOIN pedidos_detalle B ON A.id_producto = B.id_producto WHERE B.id_producto IS NULL;

-- RIGHT JOIN --
-- SELECT * FROM TABLEA A RIGHT JOIN TABLEB B ON A.KEY = B.KEY WHERE A.KEY IS NULL;
-- TABLEA es la que posee la PK(Primary Key)
-- TABLEB es la que posee la FK(Foreign Key)
SELECT * FROM productos A RIGHT JOIN pedidos_detalle B ON A.id_producto = B.id_producto WHERE A.id_producto IS NULL;