CREATE database restricciones_psql;
CREATE TABLE company (id serial PRIMARY KEY, nombre VARCHAR NOT NULL UNIQUE);
INSERT INTO company(nombre) VALUES('Amazon');
INSERT INTO company(nombre) VALUES('Apple');

SELECT * FROM company;

INSERT INTO company(nombre) VALUES('Apple');
-- ERROR:  llave duplicada viola restricción de unicidad «company_nombre_key»
-- DETALLE:  Ya existe la llave (nombre)=(Apple).
INSERT INTO company(nombre) VALUES('Microsoft');

INSERT INTO company(id, nombre) VALUES(7, 'Meta');

INSERT INTO company(nombre) VALUES('Alphabet');

SELECT nextval('company_id_seq'::regclass);
SELECT nextval('company_id_seq'); -- Avanza la secuencia
SELECT * FROM company_id_seq; -- Valor actual de la secuencia