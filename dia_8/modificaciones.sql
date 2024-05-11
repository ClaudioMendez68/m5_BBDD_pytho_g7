-- AQUí TRABAJO EN EL SERVIDOR PostgreSQL13 --

-- Aplicando modificaciones en una tabla
-- ● Paso 1: Creamos la base de datos con el nombre Mawashi Phones.
CREATE DATABASE mawashi_phones;

-- ● Paso 2: Nos conectamos a la base de datos.
\c mawashi_phones

-- ● Paso 3: Creamos la tabla con los campos que nos solicita inicialmente el cliente.
CREATE TABLE phones(
    id INT PRIMARY KEY,
    modelo VARCHAR(50),
    mac_address INT UNIQUE,
    fecha_fabricacion VARCHAR(50)
);

-- ● Paso 4: Insertamos un registro para probar la tabla.
INSERT INTO phones(id, modelo, mac_address, fecha_fabricacion)
VALUES (1, 'Iphone 14', '1B:2A:3C:4D:5F:6G', '2022-09-09');
-- ERROR:  la sintaxis de entrada no es válida para tipo integer: «1B:2A:3C:4D:5F:6G»
-- LÍNEA 2: VALUES (1, 'Iphone 14', '1B:2A:3C:4D:5F:6G', '2022-09-09');
-- Debemos modificar el campo mac_address.

-- ● Paso 5: Modificamos el tipo de dato definido en el campo mac_address.
ALTER TABLE phones
ALTER COLUMN mac_address TYPE VARCHAR(50);

-- ● Paso 6: Comprobamos que se hayan aplicado los cambios.
\d phones

-- ● Paso 7: Insertamos nuevamente el registro.
INSERT INTO phones(id, modelo, mac_address, fecha_fabricacion)
VALUES (1, 'Iphone 14', '1B:2A:3C:4D:5F:6G', '2022-09-09');

SELECT * FROM phones;

-- Paso 8: Con el alter table también podemos agregar nuevas restricciones sin reescribir las ya existentes.
ALTER TABLE phones
ALTER COLUMN mac_address SET NOT NULL;

\d phones

-- TRUNCATE --
-- ● Paso 9: Insertamos un nuevo registro a la tabla phones.
INSERT INTO phones(id, modelo, mac_address, fecha_fabricacion)
VALUES (2, 'Iphone 13', '5B:1A:2C:7D:8F:7h', '2021-09-24');
-- Aplicamos truncate a la tabla y vemos su resultado.
TRUNCATE phones;
SELECT * FROM phones;

-- Incorporar los siguientes campos a la tabla phones:
-- ● Memoria interna.
ALTER TABLE phones
ADD COLUMN memoria_interna VARCHAR(30) NOT NULL;
-- ● Memoria ram.
ALTER TABLE phones
ADD COLUMN ram VARCHAR(30) NOT NULL;
-- ● Peso.
ALTER TABLE phones
ADD COLUMN peso NUMERIC NOT NULL;
-- ● Dimensiones.
ALTER TABLE phones
ADD COLUMN dimensiones NUMERIC NOT NULL;

-- Además, agrega al campo ID la instrucción SERIAL.
