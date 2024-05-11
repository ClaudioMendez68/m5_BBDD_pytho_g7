-- AQUÍ TRABAJO EN EL SERVIDOR PostgreSQL16 --

-- ● Paso 1: Creamos la base de datos con el nombre Mawashi Phones.
CREATE DATABASE mawashi_phones;

-- ● Paso 2: Nos conectamos a la base de datos.
\c mawashi_phones;

-- ● Paso 3: Creamos la tabla con los campos que nos solicita inicialmente el cliente.
CREATE TABLE phones (
    id INT PRIMARY KEY, 
    modelo VARCHAR(50), 
    mac_address INT UNIQUE,
    fecha_fabricacion VARCHAR(50));

-- ● Paso 4: Insertamos un registro para probar la tabla.
INSERT INTO phones (id, modelo, mac_address, fecha_fabricacion) 
VALUES (1, 'Iphone 14', '1B:2A:3C:4D:5F:6G', '2022-09-09');
-- ERROR:  la sintaxis de entrada no es válida para tipo integer: «1B:2A:3C:4D:5F:6G»
-- LÍNEA 2: VALUES (1, 'Iphone 14', '1B:2A:3C:4D:5F:6G', '2022-09-09');

-- ● Paso 5: Modificamos el tipo de dato definido en el campo mac_address.
ALTER TABLE phones ALTER COLUMN mac_address TYPE VARCHAR(50);

-- ● Paso 6: Comprobamos que se hayan aplicado los cambios.
\d phones

-- ● Paso 7: Insertamos nuevamente el registro.
INSERT INTO phones (id, modelo, mac_address, fecha_fabricacion) 
VALUES (1, 'Iphone 14', '1B:2A:3C:4D:5F:6G', '2022-09-09');

-- ● Paso 8: Con el alter table también podemos agregar nuevas restricciones sin reescribir las ya existentes.
ALTER TABLE phones ALTER COLUMN mac_address SET NOT NULL;
-- TESTING
INSERT INTO phones (id, modelo, fecha_fabricacion) VALUES (2, 'Iphone 15',  '2022-09-09');
-- ERROR:  el valor nulo en la columna «mac_address» de la relación «phones» viola la restricción de no nulo
-- DETALLE:  La fila que falla contiene (2, Iphone 15, null, 2022-09-09).
INSERT INTO phones (id, modelo, mac_address, fecha_fabricacion) VALUES (2, 'Iphone 15', null, '2022-09-09');
-- ERROR:  el valor nulo en la columna «mac_address» de la relación «phones» viola la restricción de no nulo
-- DETALLE:  La fila que falla contiene (2, Iphone 15, null, 2022-09-09).

DROP TABLE phones;

-- CREACIÓN DE UN USUARIO --
CREATE USER claudius WITH PASSWORD 'Admin1234';

-- Crear Base de Datos para el usuario
CREATE DATABASE claudius WITH OWNER claudius;

-- Asignar permisos
ALTER USER claudius WITH SUPERUSER CREATEDB CREATEROLE;

CREATE TABLE autores (
    id SERIAL,
    nombre VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE libros (
    id SERIAL,
    titulo VARCHAR(255) NOT NULL,
    autor_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (autor_id) REFERENCES autores (id) ON DELETE CASCADE
);

INSERT INTO autores (nombre)
VALUES
    ('Juan Pérez'),
    ('María García'),
    ('Pedro Rodríguez');

INSERT INTO libros (titulo, autor_id)
VALUES
    ('El Quijote', 1),
    ('La Divina Comedia', 2),
    ('Hamlet', 3);

TRUNCATE libros;
TRUNCATE libros RESTART IDENTITY;
TRUNCATE autores RESTART IDENTITY CASCADE;

-- REINICIANDO UNA SECUENCIA --
ALTER SEQUENCE libros_id_seq RESTART;