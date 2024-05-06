-- Paso 1: Generamos la base de datos con el nombre 'registro_viajeros'
CREATE DATABASE registro_viajeros;
-- Paso 2: Nos conectamos a la base de datos.
\c registro_viajeros;
-- Paso 3: Creamos la tabla viajeros con los datos presentes en el material de apoyo
CREATE TABLE Viajeros (
    viajero_id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    genero CHAR(5) NOT NULL,
    email VARCHAR(250),
    telefono CHAR(50) NOT NULL,
    rut CHAR(10) NOT NULL UNIQUE
);
-- Paso 4: Creamos la tabla 'destinos' con los datos presentes en el material de apoyo
CREATE TABLE Destinos (
    destino_id SERIAL PRIMARY KEY,
    nombre_destino VARCHAR(100) NOT NULL,
    ciudad VARCHAR(50),
    pais VARCHAR(50)
);
-- Paso 5: Creamos la tabla 'tickets' con los datos presentes en el material de apoyo
CREATE TABLE Tickets (
    ticket_id SERIAL PRIMARY KEY,
    destino_id INT REFERENCES DESTINOS (destino_id),
    viajero_id INT REFERENCES Viajeros(viajero_id),
    numero_boleto VARCHAR(50) NOT NULL UNIQUE,
    fecha_emision DATE,
    fecha_salida DATE,
    fecha_retorno DATE
);
-- Paso 6: Insertamos los datos de las 3 tablas aplicando los inserts del material de apoyo
INSERT INTO Viajeros (nombre, genero, email, telefono, rut) VALUES
('Juan Perez', 'M', 'juan@email.com', '123456789', '1111111111'),
('Maria Rodriguez', 'F', 'maria@email.com', '987654321', '2222222222'),
('Carlos Gonzalez', 'M', 'carlos@email.com', '111222333', '3333333333'),
('Luisa Martinez', 'F', 'luisa@email.com', '444555666', '4444444444'),
('Pedro Hernandez', 'M', 'pedro@email.com', '777888999', '5555555555'),
('Ana Lopez', 'F', 'ana@email.com', '333444555', '6666666666'),
('Jorge Ramirez', 'M', 'jorge@email.com', '666777888', '7777777777'),
('Sofia Torres', 'F', 'sofia@email.com', '999000111', '8888888888'),
('Daniel Castro', 'M', 'daniel@email.com', '222333444', '9999999999'),
('Laura Garcia', 'F', 'laura@email.com', '555666777', '0000000000'),
('Manuel Silva', 'M', 'manuel@email.com', '888999000', '1231231231'),
('Elena Vargas', 'F', 'elena@email.com', '111222333', '4564564564'),
('Gabriel Morales', 'M', 'gabriel@email.com', '444555666', '7897897897'),
('Isabel Rios', 'F', 'isabel@email.com', '777888999', '0120120120'),
('Hector Mendoza', 'M', 'hector@email.com', '333444555', '9876543210');

INSERT INTO Destinos (nombre_destino, ciudad, pais) VALUES
('Playa del Carmen', 'Playa del Carmen', 'México'),
('Machu Picchu', 'Cuzco', 'Perú'),
('Torres del Paine', 'Puerto Natales', 'Chile'),
('Gran Barrera de Coral', 'Queensland', 'Australia'),
('Monte Everest', 'Khumbu', 'Nepal'),
('Santorini', 'Santorini', 'Grecia'),
('Marrakech', 'Marrakech', 'Marruecos'),
('Kioto', 'Kioto', 'Japón'),
('Marrakech', 'Marrakech', 'Marruecos'),
('Marrakech', 'Marrakech', 'Marruecos'),
('Marrakech', 'Marrakech', 'Marruecos'),
('Marrakech', 'Marrakech', 'Marruecos'),
('Marrakech', 'Marrakech', 'Marruecos'),
('Marrakech', 'Marrakech', 'Marruecos'),
('Marrakech', 'Marrakech', 'Marruecos');

INSERT INTO Tickets (viajero_id, destino_id, numero_boleto, fecha_emision, fecha_salida, fecha_retorno) VALUES
(1, 1, 'T111111', '2024-01-04', '2024-01-10', '2024-01-20'),
(2, 2, 'T222222', '2024-01-05', '2024-02-01', '2024-02-15'),
(2, 3, 'T333333', '2024-01-06', '2024-03-05', '2024-03-20'),
(4, 4, 'T444444', '2024-01-07', '2024-04-12', '2024-05-01'),
(5, 5, 'T555555', '2024-01-08', '2024-06-02', '2024-06-20'),
(6, 1, 'T666666', '2024-01-09', '2024-07-15', '2024-08-01'),
(4, 2, 'T777777', '2024-01-10', '2024-09-03', '2024-09-20'),
(8, 3, 'T888888', '2024-01-11', '2024-10-18', '2024-11-01'),
(9, 4, 'T999999', '2024-01-12', '2024-12-05', '2024-12-20'),
(10, 5, 'T101010', '2024-01-13', '2025-01-02', '2025-01-20'),
(15, 1, 'T1111111', '2024-01-14', '2025-02-10', '2025-02-25'),
(12, 2, 'T121212', '2024-01-15', '2025-03-15', '2025-04-01'),
(13, 3, 'T131313', '2024-01-16', '2025-05-02', '2025-05-20'),
(14, 4, 'T141414', '2024-01-17', '2025-06-12', '2025-06-30'),
(15, 5, 'T151515', '2024-01-18', '2025-07-20', '2025-08-05');

SELECT * FROM Viajeros;
-- Paso 7: El cliente nos solicita un pequeño reporte de pruebas donde se registren el nombre de todos los viajeros con y sin boletos,
-- el número de boleto (para los casos que correspondan) y el nombre del destino.
SELECT Viajeros.nombre, Tickets.numero_boleto, Destinos.nombre_destino FROM Viajeros
LEFT JOIN Tickets ON Viajeros.viajero_id = Tickets.viajero_id
LEFT JOIN Destinos ON Tickets.destino_id = Destinos.destino_id;
-- 1. Obtener una lista de todos los viajeros y la información de sus boletos,
-- incluyendo aquellos viajeros que no tengan boletos emitidos. En el caso de los viajeros con boleto, mostrar su destino.
SELECT Viajeros.nombre, Tickets.numero_boleto, Tickets.fecha_emision, Tickets.fecha_salida, Tickets.fecha_retorno, Destinos.nombre_destino 
FROM Viajeros
LEFT JOIN Tickets ON Viajeros.viajero_id = Tickets.viajero_id
LEFT JOIN Destinos ON Tickets.destino_id = Destinos.destino_id;
-- 2. Mostrar la información del boleto T123456 junto con los detalles del viajero y destino correspondiente a ese boleto.
SELECT Tickets.numero_boleto, Tickets.fecha_emision, Tickets.fecha_salida, Tickets.fecha_retorno, 
    Viajeros.nombre, Viajeros.email, Viajeros.telefono, Viajeros.rut,
    Destinos.nombre_destino, Destinos.ciudad, Destinos.pais
FROM Viajeros
LEFT JOIN Tickets ON Viajeros.viajero_id = Tickets.viajero_id
LEFT JOIN Destinos ON Tickets.destino_id = Destinos.destino_id
WHERE Tickets.numero_boleto = 'T123456';
-- 3. Listar todos los viajeros que tienen fecha de salida o de retorno el '2024-01-10'
SELECT Viajeros.nombre FROM Viajeros
INNER JOIN Tickets ON Viajeros.viajero_id = Tickets.viajero_id
WHERE Tickets.fecha_salida = '2024-01-10'
OR Tickets.fecha_retorno = '2024-01-10';
-- 4. Obtener el número total de boletos por cada género
SELECT COUNT(Tickets.numero_boleto) AS total_boletos, Viajeros.genero 
FROM Viajeros
INNER JOIN Tickets ON Viajeros.viajero_id = Tickets.viajero_id
GROUP BY Viajeros.genero;
-- 5. Obtener un listado de todos los viajeros que han viajado a Playa del Carmen
SELECT Viajeros.nombre, Destinos.nombre_destino 
FROM Viajeros
INNER JOIN Tickets ON Viajeros.viajero_id = Tickets.viajero_id
INNER JOIN Destinos ON Tickets.destino_id = Destinos.destino_id
WHERE Destinos.nombre_destino = 'Playa del Carmen';
-- Ingresa tres nuevos tickets con la siguiente información:
-- 1. Ticket 1