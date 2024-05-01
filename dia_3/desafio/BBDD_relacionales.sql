CREATE DATABASE "desafio-Claudio-Mendez-123";
\connect desafio-Claudio-Mendez-123

CREATE TABLE clientes(
    email VARCHAR(50),
    nombre VARCHAR,
    telefono VARCHAR(16),
    empresa VARCHAR(50),
    prioridad SMALLINT
);

INSERT INTO clientes (email, nombre, telefono, empresa, prioridad) 
VALUES 
    ('elon.musk@yahoo.es', 'Elon Musk', '555-443202', 'Space-X', 10),
    ('tony.stark@gmail.com', 'Tony Stark', '555-184567', 'Star Industries', 10),
    ('juan.perez@hotmmail.com', 'Juan Perez', '555-345432', 'Pollos Hermanos', 3),
    ('walter.white@gmail.com', 'Walter White', '555-555666', 'Breaking Bad Ltda',8),
    ('scarlett.johansson@gmail.com', 'Scarlet Johansson', '555-446723', 'Black Widow SPA', 7);

SELECT * FROM clientes;

SELECT * FROM clientes ORDER BY prioridad DESC LIMIT 3;

SELECT * FROM clientes WHERE prioridad = 10 LIMIT 2;