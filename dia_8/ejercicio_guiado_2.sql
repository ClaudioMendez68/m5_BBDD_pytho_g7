-- AQUÍ TRABAJO EN EL SERVIDOR PostgreSQL13 --

-- Ejercicio guiado: “Borrar tablas relacionadas”
-- Paso 1: Creamos las tablas libros y autores con el siguiente código.

-- Tabla Padre
CREATE TABLE autores(
    id INT NOT NULL,  -- No es necesario este NOT NULL, puesto que PRIMARY KEY ya lo define como NOT NULL.
    nombre VARCHAR(255) NOT NULL,
    PRIMARY KEY(id)
);

-- Tabla Hija
CREATE TABLE libros(
    id INT NOT NULL,
    titulo VARCHAR(255) NOT NULL,
    autor_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (autor_id) REFERENCES autores(id)
);

-- Paso 2: Insertamos algunos datos en ambas tablas.
INSERT INTO autores (id, nombre)
VALUES
(1, 'Juan Pérez'),
(2, 'María García'),
(3, 'Pedro Rodríguez');
INSERT INTO libros (id, titulo, autor_id)
VALUES
(1, 'El Quijote', 1),
(2, 'La Divina Comedia', 2),
(3, 'Hamlet', 3);

-- Paso 3: Consultamos los datos de ambas tablas.
SELECT libros.titulo, autores.nombre 
FROM libros
INNER JOIN autores
ON libros.autor_id = autores.id;

-- Paso 4: Comprobación de la restricción de clave foránea.
DELETE FROM autores;
-- ERROR:  update o delete en «autores» viola la llave foránea «libros_autor_id_fkey» en la tabla «libros»
-- DETALLE:  La llave (id)=(1) todavía es referida desde la tabla «libros».

-- ¿Qué pasaría si eliminamos la tabla hija?
DELETE FROM libros;
-- DELETE 3
SELECT libros.titulo, autores.nombre 
FROM libros
FULL JOIN autores
ON libros.autor_id = autores.id;