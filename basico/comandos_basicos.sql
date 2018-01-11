insert into departments (department_id,
            department_name, manager_id,
            location_id)
 values      (22, 'Relações publicas', 100, 1700);

SELECT * FROM departments
;

update departments
   set department_name = 'Relaçôes Públicas'
 where department_id = 22
;
update employees
   set job_id = ( select job_id
                    from employees
                   where employee_id = 205),
        salary = (select salary
                    from employees
                   where employee_id= 205)
 where  employee_id = 144
;
select salary
  from employees
 where employee_id = 144
;

select salary
  from employees
 where employee_id = 205
;
delete from departments
 where department_name = 'Finance'
;
truncate table table_name; -- exclui todas as linhas da tabela de forma mais rapida e eficas que o comando delete

Insert into ( select employee_id,  last_name,
                     email, hire_date, job_id, salary,
                     department_id
                from employees
               where department_id = 50)
 values ( 9999, 'Taylor', 'DTAYLOR',
          to_date('07-JUN-99', 'DD-MON-RR'  ),
          'ST_CLERK', 5000, 50        )
;
select employee_id,  last_name,
                     email, hire_date, job_id, salary,
                     department_id
                from employees
               where department_id = 50
;
delete from employees
 where employee_id = 9999
;

insert into departments
values (290, 'Corporação Tax', null ,1700);
commit;
-- Exercicio 8.1
--Criar tabela, inserir dados de acordo com exercicio
create table minha_tabela (
                           id_emp     number(4)    not null,
                           sobrenome  varchar(25)  null,
                           nome       varchar(25)  null,
                           userid     varchar(8)   null,
                           salario    number(9,2)  null
                           )
;
comment on table minha_tabela is 'Exercicio fundamentos sql apostila I';

comment on column minha_tabela.id_emp  is 'código do empregado.';
comment on column minha_tabela.sobrenome is 'sobrenome do empregado';
comment on column minha_tabela.nome       is 'nome do empregado';
comment on column minha_tabela.userid is 'id do usuário';
comment on column minha_tabela.salario is 'salario do empregado';

insert into minha_tabela (id_emp, sobrenome,
                          nome, userid, salario)
 values      (1, 'patel','ralph ','rpatel', 895);


insert into minha_tabela (id_emp, sobrenome,
                          nome, userid, salario)
 values      (2, 'dancs','betty ','bdancs', 860);


insert into minha_tabela (id_emp, sobrenome,
                          nome, userid, salario)
 values      (3, 'biri','ben ','bbiri', 1100);


insert into minha_tabela (id_emp, sobrenome,
                          nome, userid, salario)
 values      (4, 'newman','chad ','cnewman', 750);


insert into minha_tabela (id_emp, sobrenome,
                          nome, userid, salario)
 values      (5, 'rodrigues','vinicius ','vrodri', 2000);

commit;
select * from minha_tabela;


update minha_tabela
   set sobrenome = 'Draxler mudado'
 where id_emp = 3
;
update minha_tabela
   set salario = 1100
 where salario <= 900
;
delete from minha_tabela
 where nome = 'Betty'
;
savepoint a;





