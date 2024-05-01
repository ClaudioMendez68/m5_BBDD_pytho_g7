-- Este es un comentario

SELECT * from demo;

select name from demo;

select id from demo;

SELECT hint , name from demo;
SELECT name, hint from demo;

SELECT * from demo where id = 5;
SELECT * from demo WHERE HINT ='300';

SELECT * FROM demo where id < 5 and id >= 2;

select * from demo order by id desc;
select * from demo order by NAME desc;
select * FROM demo order by hint DESC;

select name, hint from demo order by 1