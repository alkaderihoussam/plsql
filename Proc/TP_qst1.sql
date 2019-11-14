create or replace 
procedure supprimer_employe
(num in employees.employee_id%type) is
begin
  delete from employees
   where employee_id = num;
end;


show errors supprimer_employe;

execute supprimer_employe(101);

Erreur commençant à la ligne 3 de la commande :
execute supprimer_employe(101)
Rapport d''erreur :
ORA-02292: integrity constraint (HR.JHIST_EMP_FK) violated - child record found
ORA-06512: at "HR.SUPPRIMER_EMPLOYE", line 4
ORA-06512: at line 1
02292. 00000 - "integrity constraint (%s.%s) violated - child record found"
*Cause:    attempted to delete a parent key value that had a foreign
           dependency.
*Action:   delete dependencies first then parent or disable constraint.



insert into employees (employee_id, last_name, email, hire_date, job_id)
values (207, 'test', 'test@test.com', '15/10/2019', 'AC_MGR');