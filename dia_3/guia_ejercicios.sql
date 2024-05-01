-- Paso 1: Creamos la base de datos con el nombre bbdd_gimnasios
CREATE DATABASE bbdd_gimnasios;
-- Paso 2: Nos conectamos a la base de datos una vez que haya sido creada
\connect bbdd_gimnasios;
-- Paso 3: Creamos la tabla clientes
CREATE TABLE clientes(
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    rut INT,
    email VARCHAR(50));
\d clientes
-- Paso 4: Modificamos la tabla clientes y definimos que el rut será la clave primaria (Primary Key)
ALTER TABLE clientes ADD PRIMARY KEY(rut);
-- Paso 5: Creamos la tabla matrículas
CREATE TABLE matriculas(
    monto VARCHAR(50),
    estado BOOLEAN,
    cliente_rut INT REFERENCES clientes(rut)
);
-- Paso 6: Insertamos 5 registros en la tabla clientes.
insert into clientes values ('Cliente 1', 'Apellido cliente 1',
'999999999', 'cliente1@email.com');
insert into clientes values ('Cliente 2', 'Apellido cliente 2',
'888888888', 'cliente2@email.com');
insert into clientes values ('Cliente 3', 'Apellido cliente 3',
'777777777', 'cliente3@email.com');
insert into clientes values ('Cliente 4', 'Apellido cliente 4',
'666666666', 'cliente4@email.com');
insert into clientes values ('Cliente 5', 'Apellido cliente 5',
'555555555', 'cliente5@email.com');
-- Paso 7: Insertamos 5 registros en la tabla matriculas y los asociamos mediante su rut a cada cliente
insert into matriculas values ('40000', True, '999999999');
insert into matriculas values ('40000', False, '888888888');
insert into matriculas values ('55000', True, '555555555');
insert into matriculas values ('35000', True, '777777777');
insert into matriculas values ('60000', False, '666666666');
-- Paso 8: Utilizar el inner join para que se muestren todos los registros que estén relacionados.
-- Recordemos que esto se ejecuta siempre que exista una columna que relacione nuestras dos tablas.
SELECT clientes.email, clientes.rut, matriculas.monto, matriculas.estado 
FROM clientes 
INNER JOIN matriculas ON clientes.rut = matriculas.cliente_rut;
-- Paso 9: Podemos incluso agregar funciones anidadas a la consulta,
-- en este caso supongamos que queremos ordenar según el monto de cada cliente.
-- El orden será de manera ascendente, es decir del monto menor al mayor, para ello utilizaremos 'order by'
SELECT clientes.email, clientes.rut, matriculas.monto, matriculas.estado 
FROM clientes 
INNER JOIN matriculas ON clientes.rut = matriculas.cliente_rut
ORDER BY matriculas.monto;
-- Paso 10: Agrupar consultas, para ello añadiremos una matrícula nueva a un RUT ya existente.
-- Esta agrupación consistirá en obtener aquellos clientes que tienen más de una matrícula generada.
SELECT monto, COUNT(monto) FROM matriculas GROUP BY monto HAVING COUNT(monto) >= 2;
-- Paso 11: Hasta el paso 10 recibimos los datos del registro que tiene dos matrículas asignadas, 
--pero estos datos están incompletos, no sabemos el nombre de la persona, su rut ni el email. 
-- Para solucionarlo debemos primero agrupar a partir de aquellos campos que tienen una función de agregado implementada
SELECT clientes.email, clientes.rut, matriculas.monto, matriculas.estado, COUNT(matriculas.*) FROM clientes 
INNER JOIN matriculas ON clientes.rut = matriculas.cliente_rut
GROUP BY clientes.email, matriculas.monto, clientes.rut, matriculas.estado;
-- Paso 12: Ya que tenemos la agrupación de los datos ahora podemos usar nuevamente having
-- para obtener únicamente aquellos registros con los datos completos que tengan dos o más matrículas, 
-- recuerda la cláusula del having
SELECT clientes.email, clientes.rut, matriculas.monto, matriculas.estado, COUNT(matriculas.*) FROM clientes 
INNER JOIN matriculas ON clientes.rut = matriculas.cliente_rut
GROUP BY clientes.email, matriculas.monto, clientes.rut, matriculas.estado
HAVING COUNT(matriculas.*) > 1;
