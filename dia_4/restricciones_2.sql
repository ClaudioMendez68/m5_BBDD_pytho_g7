-- AQUÍ UTILIZARÉ EL SERVIDOR 'PostgreSQL13' --
CREATE DATABASE restricciones_test;
-- Ahora insertemos una fila de la siguiente manera:
INSERT INTO Empleados(Apellido) VALUES ('Gomez');
-- ERROR:  el valor nulo en la columna «empleadoid» de la relación «empleados» viola la restricción de no nulo
-- DETALLE:  La fila que falla contiene (null, null, Gomez, null).
INSERT INTO Empleados(EmpleadoID, Nombre, Apellido, Rut)
VALUES
    (11, 'Juan', 'Gonzalez', 'RUT1'),
    (12, 'Maria', 'Perez', 'RUT2'),
    (13, 'Pedro', 'Fuentes', 'RUT2');
-- ERROR:  llave duplicada viola restricción de unicidad «empleados_rut_key»
-- DETALLE:  Ya existe la llave (rut)=(RUT2).

-- Insertemos un autor con un autor_id 2 el cual ya existe en la tabla Autores
INSERT INTO Autores(AutorID, NombreAutor)
VALUES (2, 'Nuevo Autor');
-- ERROR:  llave duplicada viola restricción de unicidad «autores_pkey»
-- DETALLE:  Ya existe la llave (autorid)=(2).

-- Insertemos un libro con un autor_id 1 que no existe en la tabla Autores.
INSERT INTO Libros(LibroID, Titulo, AutorID)
VALUES (101, 'Libro Ejemplo', 1);
-- ERROR:  inserción o actualización en la tabla «libros» viola la llave foránea «libros_autorid_fkey»
-- DETALLE:  La llave (autorid)=(1) no está presente en la tabla «autores».

-- Ahora, intentemos eliminar al autor con el autor_id 2, que tiene un libro asociado.
DELETE FROM Autores WHERE AutorID = 2;
-- ERROR:  update o delete en «autores» viola la llave foránea «libros_autorid_fkey» en la tabla «libros»
-- DETALLE:  La llave (autorid)=(2) todavía es referida desde la tabla «libros».