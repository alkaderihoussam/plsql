create or replace 
function dep_nbremp2 
(dep_id in departments.department_id%type)
return NUMBER
is
nbr_emp NUMBER;
begin
select count(e.employee_id) into nbr_emp
from employees e join departments on e.department_id = departments.department_id
where departments.department_id = dep_id;

return nbr_emp;
end;

variable cptemp NUMBER;
execute :cptemp := dep_nbremp2(90);
print cptemp;