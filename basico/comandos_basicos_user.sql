-- criando usuarios
create user vinicius
identified by teste;
-- alterando senha de usuario
alter user usuario identified by senha

create session -- estabelece conexao com o bd
create table -- criar tabelas no esquema do usuario
create sequence -- cria uma sequencia  no esquema do usuario
create view -- criar uma view no esquema do usuario
create procedure --cria uma procedure, function ou packpage armazenado no esquema do usuario
 ;
--criando previlegios ao usuario vinicius
grant create session
      create table
      create sequence
      create view
to vinicius
;
-- criando uma atribuição
create role vinicius;
-- por exemplo
--criando uma atribuição
create role manager ;
--concedendo privilegios a essa atribuição
grant create table,create VIEW,CREATE SESSION, CREATE SEQUENCE , CREATE ROLE
to vinicius;
--concedendo atribuição a usuarios
grant manager to de haan, kochhar;

--concede provilegio de consulta na tabela employees
grant select
   on employees
   to sue,rich
;
grant update(department_name,location_id)
   on departments
   to vinicius
;
-- oferece a um usuário conceder provilegios a outros usurarios
grant select , insert ,
   on departments
   to Vinicius
 with grant option
;
--remove os ´previlegios concedidos
revoke select, insert
    on departments
  from vinicius
;








