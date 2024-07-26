drop view view_dept_emp;
drop view view_job_emp;

--부서+사원 조인 뷰

CREATE VIEW VIEW_DEPT_EMP
AS SELECT 
    e.employee_id,e.first_name,e.last_name,e.email,e.phone_number,
    e.hire_date,e.job_id,e.commission_pct,e.manager_id,e.salary,
    e.department_id,d.department_name
FROM 
    emp e left join dept d 
    on e.department_id = d.department_id;

--업무+사원조인
CREATE VIEW VIEW_JOB_EMP
AS SELECT 
   e.employee_id,e.first_name,e.last_name,e.email,e.phone_number,
    e.hire_date,e.job_id,j.job_title,e.commission_pct,e.manager_id,e.salary,
    e.department_id 
FROM 
    emp e join job j on e.job_id=j.job_id;

select * from view_job_emp;
select * from view_dept_emp;