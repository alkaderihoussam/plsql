create or replace 
procedure dep_nbremp 
(dep_id in departments.department_id%type, outnbremp out NUMBER)
is
begin
select count(e.employee_id) into outnbremp
from employees e join departments on e.department_id = departments.department_id
where departments.department_id = dep_id;
end;

variable cptemp NUMBER;
execute dep_nbremp(50,:cptemp);
print cptemp;