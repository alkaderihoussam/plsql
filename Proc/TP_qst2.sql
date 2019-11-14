create or replace 
procedure comm_employe
(noemploye in employees.employee_id%type , txcomm in employees.commission_pct%type) is
comm employees.commission_pct%type;
begin
    select commission_pct
    into comm
    from employees
    where employee_id = noemploye;
  if comm is null then
    dbms_output.put_line('commission est nulle');
  else 
 
    dbms_output.put_line('commission avant la mise a jour' || comm);

      update employees
         set commission_pct = txcomm*comm
       where employee_id = noemploye;

    select commission_pct
    into comm
    from employees
    where employee_id = noemploye;
   dbms_output.put_line('commission apres la mise a jour' || to_char(comm));
  
    end if;
end;