-- AQUÍ TRABAJO CON EL SERVIDOR PostgreSQL16 --

-- ● Paso 1: Creamos las tablas libros y autores con el siguiente código.
CREATE TABLE autores (
    id INT NOT NULL,
    nombre VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE libros (
    id INT NOT NULL,
    titulo VARCHAR(255) NOT NULL,
    autor_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (autor_id) REFERENCES autores (id) ON DELETE CASCADE
);

-- ● Paso 2: Insertamos algunos datos en ambas tablas
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

-- ● Paso 3: Consultamos los datos de ambas tablas.
SELECT libros.titulo, autores.nombre
FROM libros
INNER JOIN autores
ON libros.autor_id = autores.id;

-- ● Paso 4: Comprobación de la restricción de clave foránea.
DELETE from autores;
-- ERROR:  update o delete en «autores» viola la llave foránea «libros_autor_id_fkey» en la tabla «libros»
-- DETALLE:  La llave (id)=(1) todavía es referida desde la tabla «libros».

-- Borrado en CASCADA
DROP TABLE autores;
-- ERROR:  no se puede eliminar tabla autores porque otros objetos dependen de él
-- DETALLE:  restricción «libros_autor_id_fkey» en tabla libros depende de tabla autores
-- SUGERENCIA:  Use DROP ... CASCADE para eliminar además los objetos dependientes
DELETE FROM autores CASCADE;
-- ERROR:  update o delete en «autores» viola la llave foránea «libros_autor_id_fkey» en la tabla «libros»
-- DETALLE:  La llave (id)=(1) todavía es referida desde la tabla «libros».
DROP TABLE autores CASCADE;
DROP TABLE libros;