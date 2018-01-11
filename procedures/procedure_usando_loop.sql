declare
-- declara��o de cursores
  cursor c1 is
         select d.department_id,
                d.department_name,
                d.manager_id,
                d.location_id
           from departments d;

-- defini��o de tipos

  type tdpto is varray(100) of c1%rowtype;

-- declara��o de vari�veis

      dpto tdpto;
      indice integer := 0;


begin
-- inicializar cole��o

   dpto := tdpto();

-- abrir cursor
 open c1;

-- para cada dpto, atribuir c�digo, nome, gerente e localiza��o
  loop

-- incrementar indice e estender cole��o

        indice := indice + 1;
        dpto.extend;
-- recuperar dados do cursor e atribuir para cole��o

    fetch c1 into dpto(indice);
-- se n�o encontrar mais nada no cursor, elimina a �ltima entrada
-- gerada na cole��o, decrementa o �ndice da col��o e abandona o loop

    if c1%notfound then
       dpto.trim(1);
       indice := indice - 1;
       exit;
    end if;

  end loop;

-- fechar cursor

 close c1;

-- imprimir cada entrada da cole��o na tela

 for i in 1..indice loop
       dbms_output.put_line('C�d.Dpto.... : '       ||dpto(i).department_id  ||'  '||
                            'Nome.Dpto........ : '  ||dpto(i).department_name||'  '||
                            'Gerente.Dpto....... : '||dpto(i).manager_id     ||'  '||
                            'Id.localiza��o do Dpto : '||dpto(i).location_id ||'  '
                            );
 end loop;



end;