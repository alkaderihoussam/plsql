create or replace 
function max_sal_job
(job in jobs.job_id%type)
return jobs.max_salary%type
is
max_sal jobs.max_salary%type;
begin
  select max_salary
    into max_sal
    from jobs
   where job_id = job;
   return max_sal;
end;

variable max_sal number;
execute :max_sal := max_sal_job('SA_MAN');
print max_sal;