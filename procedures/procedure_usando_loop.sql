declare
-- declaração de cursores
  cursor c1 is
         select d.department_id,
                d.department_name,
                d.manager_id,
                d.location_id
           from departments d;

-- definição de tipos

  type tdpto is varray(100) of c1%rowtype;

-- declaração de variáveis

      dpto tdpto;
      indice integer := 0;


begin
-- inicializar coleção

   dpto := tdpto();

-- abrir cursor
 open c1;

-- para cada dpto, atribuir código, nome, gerente e localização
  loop

-- incrementar indice e estender coleção

        indice := indice + 1;
        dpto.extend;
-- recuperar dados do cursor e atribuir para coleção

    fetch c1 into dpto(indice);
-- se não encontrar mais nada no cursor, elimina a última entrada
-- gerada na coleção, decrementa o índice da colção e abandona o loop

    if c1%notfound then
       dpto.trim(1);
       indice := indice - 1;
       exit;
    end if;

  end loop;

-- fechar cursor

 close c1;

-- imprimir cada entrada da coleção na tela

 for i in 1..indice loop
       dbms_output.put_line('Cód.Dpto.... : '       ||dpto(i).department_id  ||'  '||
                            'Nome.Dpto........ : '  ||dpto(i).department_name||'  '||
                            'Gerente.Dpto....... : '||dpto(i).manager_id     ||'  '||
                            'Id.localização do Dpto : '||dpto(i).location_id ||'  '
                            );
 end loop;



end;