create or replace 
procedure show_firstN
(dep_id in departments.department_id%type, n in number) 
is

cursor empls is 
            select first_name, last_name 
            from employees e,departments d
            where e.department_id = d.department_id and e.department_id = dep_id;
nbr_sup EXCEPTION;
total number;
first_name employees.first_name%type;
last_name employees.last_name%type;

begin

select count(employee_id) into total from employees 
where department_id = dep_id;
if n > total then
RAISE  nbr_sup;
end if;

for req in empls loop
      if empls%rowcount > n then
      exit;
      end if;
     dbms_output.put_line(empls%rowcount || ' ' || req.first_name || ' ' || req.last_name);
end loop;

exception
  when nbr_sup then
    dbms_output.put_line('il y a que ' || total || ' employe');
end;



select e.department_id, count(e.employee_id)
from employees e join departments on e.department_id = departments.department_id
group by e.department_id;

execute show_firstN(50,40);