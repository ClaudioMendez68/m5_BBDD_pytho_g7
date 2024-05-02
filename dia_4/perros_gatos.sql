CREATE DATABASE perros_gatos;

CREATE TABLE perros (
    ID INT,
    nombre VARCHAR(50),
    raza VARCHAR(30),
    edad INT
);

INSERT INTO perros(ID, nombre, raza, edad)
VALUES
    (1, 'Cachupin', 'Fox Terrier', 7),
    (2, 'Thanos', 'Chihuahua', 4),
    (3, 'Iron Maiden', 'Poodle Toy', 3),
    (4, 'Piolín', 'Rottweiler', 8),
    (5, 'Rex', 'Pastor Alemán', 7);

SELECT * FROM perros;

UPDATE perros
SET nombre = 'Fifí'
WHERE id = 4;

DELETE FROM perros WHERE id = 5;

INSERT INTO perros(ID, nombre, raza, edad) VALUES (5, 'Rex', 'Pastor Alemán', 7);

UPDATE perros
SET edad = edad + 1
RETURNING *;

SELECT * FROM perros;