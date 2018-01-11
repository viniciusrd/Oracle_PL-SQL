declare

  -- declaração de cursores
  -- cursor que seleciona todos departamentos e o país em que eles estão
  cursor cs_dpto is
         select d.department_id, d.department_name, c.country_name
           from departments d , locations l , countries c
          where d.location_id   = l.location_id
            and l.country_id    = c.country_id;
  -- cursor que recebe por paramento o num do dpto e seleciona o id e sobrenome do empregado
  cursor cs_empregados( id_dpto number ) is
         select employee_id, last_name, department_id
           from employees
          where department_id = id_dpto;

  encontrei_funcionario boolean;

  -- procedure para exibir mensagem
  procedure exibir(mensagem varchar2) is
  begin
    dbms_output.put_line(mensagem);
  end exibir;


begin
-- loop for em que retorna o dpto com seu nome e id e logo abaixo ooutro loop for que retorna,
-- os funcionários relativos a o departamento impresso anterior.

  for r1 in cs_dpto loop

      encontrei_funcionario := FALSE;

      exibir('-------------------------------------------------------------------------------');
      exibir('ID: '||r1.department_id||' - '||'Dpto: '||r1.department_name||' - Localizado: '||r1.country_name);
      exibir('--------------------------------------------------------------------------------');

      for r2 in cs_empregados(r1.department_id) loop
          exibir('Resultado == ID: '||r2.employee_id||' - Nome: '||r2.last_name|| ' - Dpto: '|| r2.department_id);
          encontrei_funcionario:=TRUE;
      end loop;

      if not encontrei_funcionario then
        exibir('Não possui empregados cadastrados no depto '||r1.department_name);
      end if;


  end loop;

exception
  when others then
       raise_application_error(-20100,'Erro ao tentar recuperar os dados !');
end ;
/



  /*




select e.employee_id,  e.last_name, e.department_id,
       d.department_name, c.country_name
  from employees e ,
       departments d ,
       locations l,
       countries c
 where e.department_id = d.department_id
   and d.location_id   = l.location_id
   and l.country_id    = c.country_id
;
SELECT * FROM countries;
SELECT * FROM locations;
SELECT * FROM departments;

select d.department_name
  from departments d
 where not exists (select 1 from employees e where  e.department_id = d.department_id);

                                                                                      */