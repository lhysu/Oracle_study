--hr ������ ��� ���̺��� ��� �÷����� �˻�(���)
select * from tab;

--*(��� �÷�) : �μ� ���̺��� ��� �����˻�
select * from departments;

--�μ����̺��� ��� ���� �˻� - �μ�����
select department_name from departments;

--�μ����̺��� ��� ���� �˻� - �μ���ȣ, �μ���
select department_id,department_name from departments;

--���̺� ���� ���
desc employees;

--��� ���̺����� �����ڵ�����ϱ�(�ߺ� ����)
select distinct JOB_ID from employees;

--��� ���̺����� �����ڵ�� �޿��� �����ķ� ���
select job_id, salary 
from employees 
order by job_id desc, salary desc;

--��� ���̺����� ����, ���� ���(��Ī ���)
select job_id "����", salary "����" from employees;
select job_id as "����", salary as "����" from employees;

--"": ��Ī, '': ������(���ڿ�)

--��� ���̺����� �μ��ڵ尡 10�� ��� �ڵ�� �μ� �ڵ带 ���
select employee_id, department_id from employees where department_id = 10;

--������̺����� �������� 07/12/07�� ��� �ڵ�, ��, ������ ���
select employee_id, first_name, hire_date from employees where hire_date='07/12/07';

select salary, employee_id from employees where employee_id=30;

--��� ���̺����� �μ���ȣ�� 10�� ����� �̸��� �޿�*1.1 �� ���
select first_name,salary*1.1 from employees where department_id = 10;

select first_name,salary from employees where salary = 950;
select first_name,salary from employees where salary>=3000;
select first_name,salary from employees where slary<3000;
select department_id,salary from employees where department_id=30;

--union: �����̺��� ���ؼ� �ߺ��� ������ ���
select employee_id, salary from employees where salary >= 20000 or salary <=2100
union
select employee_id, salary from employees where salary <=2200;

--union all: �� ���̺��� ���ؼ� �ߺ� ���� ���
select employee_id, salary from employees where salary >= 20000 or salary <=2100
union all
select employee_id, salary from employees where salary <=2200;

--intersect: �� ���̺��� ������ ���
select employee_id, salary from employees where salary >= 20000 or salary <=2100
intersect
select employee_id, salary from employees where salary <=2200;

--minus: �� ������� �� ��� ���� ���
select employee_id, salary from employees where salary >= 20000 or salary <=2100
minus
select employee_id, salary from employees where salary <=2200;

select employee_id, salary from employees where salary <=2200
intersect
select employee_id, salary from employees where salary >= 20000 or salary <=2100;

--in: or�� ����(�ݺ� ����� �����ؾ� ��)
select department_id, salary from employees where department_id in(10,200,100);

--any�� �������� ũ��,�۴�,�̻�,���ϰ� �;� ��
select department_id, salary from employees where salary >= any(8000,12000,20000);


select  job_id, first_name,salary from employees where salary >= 1000 and salary <=12000;
select  job_id, first_name,salary from employees where salary between 10000 and 12000;
select  last_name from employees where last_name between 'Chen' and 'Dilly' order by last_name;
select  last_name from employees where not last_name = 'Dilly' order by last_name;

--like:(=java�� contains) �ش� ���ڰ� �ִ��� ã���� (%��� ����)
select last_name from employees where last_name like 't%';      --t�� �����ϴ�
select last_name from employees where last_name like '%y%';     --y�� ����
select last_name from employees where last_name like '__e%';    --�տ� �α���+e+~(_:�ѱ���)
select last_name from employees where last_name like '%es';     
select last_name from employees where last_name like '%Di%';        --��ҹ��� ������

select last_name, commission_pct from employees where commission_pct is null;   --null�ΰ͸�
select last_name, commission_pct from employees where commission_pct is not null;   --null�� �ƴ� �͸�

--||: ���� ������ 
select first_name||''||last_name||'�� ����['||salary||']'from employees;
select last_name ||'�� ������'||salary||'�Դϴ�.' from employees;
select last_name ||111111||salary||222222 from employees;

--�޿��� 1000���� ũ�� 12000���� ����
select employee_id from employees where not (salary > 1000 and salary < 12000);
--�޿��� 1000���� ũ�� �ʰ� 12000���� ���� 
select employee_id from employees where not salary > 1000 and salary < 12000;

select chr(65) from dual;
select chr(65) from employees;

select 25*25 from dual;

select first_name||' is a '||job_id from employees;
select concat(first_name,' is a '),job_id from employees;

select lpad('yangssem',13,'*#') from dual;
select lpad('\200,000',13,' ') from dual;
select rpad('yangssem',13,'*#') from dual;

--litrim(���ڿ�, ����� ���� ���ڿ�), ���� �����
select ltrim('aa123456aa','aa') from dual;
--ritrim(���ڿ�, ����� ���� ���ڿ�), ������ �����
select rtrim('aa123456aa','aa') from dual;

--replace(����, Ÿ��, ����)
--yang and sam ���� sa�� sse�� ����
select replace('yang and sam','sa','sse')from dual;
--department_name ������ IT�� information technology�� ����
select replace (department_name,'IT','information technology') from departments;

--substr(���ڿ�, �ڸ���, ����): �Ϻκ� ����
--ABCDEFG���� 2��° ���ں��� 1�� ����
select substr('ABCDEFG',2,1) from dual;
--��� ���̺����� ���� �ι�° ���ڰ� i�� �͵��� ���
select first_name from employees where first_name like '_i%';
select first_name from employees where substr(first_name,2,1)='i';

--instr(����, ã������ ���ڿ�) : ù ���� ��ġ
select instr('010-2222-8888','-') from dual;
--instr(����, ã������ ���ڿ�, ���� ��ġ, ���° �ߺ�����)
select instr('CORPORATE FLOOR','OR',1,2) from dual;

--����
select length('yangssem') from dual;

--greatest: �ִ밪 ���
select greatest('CC','ABCDE','CA') from dual;
select greatest('12','132','34') from dual;         --���ڿ�
select greatest(12,132,34) from dual;               --����
--least: �ּҰ� ���
select least('CC','ABCDE','CA') from dual;
select least('12','132','34') from dual;
select least(12,132,34) from dual;
select least ('����','����','�ٶ�') from dual;

--nvl: null���� ��ü
select salary + ( salary * nvl(commission_pct, 5)) from employees;
--nvl2(�÷�, null �ƴҶ� ����, null�϶� ����)
select salary + ( salary * nvl2(commission_pct, 5, 10)) from employees;

--decode(A,B, �� ����): 3�� ������-A�� B�� ���� ���̸� ���ϰ� ���
select last_name, job_id, salary, decode(job_id,'IT_PROG', salary*1.1) 
as "�Ǽ��ɾ�" from employees;

--decode(A,B, �� ����, ���� ����): 3�� ������-A�� B�� ���� ���̸� ������, �����̸� ���� ����
select last_name, job_id, salary, decode(job_id,'IT_PROG', salary*1.1, salary) 
as "�Ǽ��ɾ�" from employees;

--decode(A,B1,B1 �� ����, B2, B2 ������,....,�ش� ���� ���� �� ����): 3�� ������-A�� B�� ���� ���̸� ���ϰ� ���
select last_name, job_id, salary, 
decode(job_id,'IT_PROG', salary*1.1,'AD_PRES',salary*1.2,'AD_VP',salary*1.3,salary) 
as "�Ǽ��ɾ�" from employees;

--case when-then
select last_name, job_id, salary,
    case job_id when 'IT_PROG' then salary*1.1      --job_id�� 'IT_FROG'�̸� salary*1.1
                when 'AD_PRES' then salary*1.2
                when 'AD_VP' then salary*1.3
    else salary             --�׿��� ���
    end as "�Ǽ��ɾ�"         --case�� ���� �� ��Ī
from employees;

--��¥ �Լ�
select sysdate from dual;
--add_month: ������ ���ϰų� �� ��
select hire_date, add_months(hire_date,3) from employees where employee_id = 100;
select hire_date, add_months(hire_date,-3) from employees where employee_id = 100;
select add_months('13/04/20',12) from dual;
--���ں�ȯ �Լ� to_char
select sysdate, to_char(sysdate,'D') from dual;
select sysdate, to_char(sysdate,'DAY') from dual;
select sysdate, to_char(sysdate,'DY') from dual;
select sysdate, to_char(sysdate,'DD') from dual;
select sysdate, to_char(sysdate,'MM') from dual;
select sysdate, to_char(sysdate,'MONTH') from dual;
select sysdate, to_char(sysdate,'YY') from dual;
select sysdate, to_char(sysdate,'YYYY') from dual;
select sysdate, to_char(sysdate,'DD-MM-YY') from dual;
select sysdate, to_char(sysdate,'fmDD-MM-YY') from dual;
select hire_date, to_char(hire_date,'YYYY-MM-DD') from employees;
select hire_date, to_char(hire_date,'fmYYYY-MM-DD') from employees;
select sysdate, to_char(sysdate,'HH') from dual;
select sysdate, to_char(sysdate,'HH24') from dual;
select sysdate, to_char(sysdate,'MI') from dual;
select sysdate, to_char(sysdate,'SS') from dual;
select sysdate, to_char(sysdate,'PM HH') from dual;
select sysdate, to_char(sysdate,'AM HH:MI:SS') from dual;
select to_char(sysdate,'YYYY-MM-DD DAY AM HH:MI:SS') as "����ð�" from dual;

--���� ��ȯ �Լ�
select to_number('100')+1 from dual;
--��¥ ��ȯ �Լ�
select to_date(sysdate,'yy/mm/dd') from dual;
select to_date('13-03-20','yy/mm/dd') from dual;

--�ý��� �Լ�
--user: field�� ������ ����ڸ� ����
select user from dual;

--���� �Լ�
select abs(-30) from dual;      --���밪
select ceil(11.001) from dual;  --�ø���
select floor(4.999) from dual;  --������
select round(22.5) from dual;   --�Ҽ��� ù°�ڸ� �ݿø�
select round(22.567,2) from dual;--�ڸ������� �ݿø�
select mod(11,4) from dual;         --11/4�� ������
select poser(2,7) from dual;        --2�� 7����
select trunc(99.123456,3) from dual; --�Ҽ��� 3�ڸ��� ���� ����

select count(first_name) from employees;
select count(employee_id) from employees;
select count(*) from employees;
select count(commission_pct) from employees;

select sum(salary) from employees;
select sum(commision_pct) from employees;

select avg(commission_pct) from employees;          --null���� �����ϰ� ���
select avg(nvl(commission_pct,0)) from employees;   --null�� 0���� ��ü�� �����ؼ� ���

select max(salary) from employees;      --�ִ밪
select min(salary) from employees;      --�ּҰ�

--�μ��� ������ ���
select avg(salary), department_id from employees group by department_id;
select round(avg(salary)), department_id, job_id from employees group by department_id,job_id;
--having: group by�� ������
select round(avg(salary)), department_id from employees 
group by department_id having department_id is not null; --�μ� ��ȣ�� null�� �ƴ�




--Q1. ���� 8000 �̻��� ������� �μ��� ��տ����� �ݿø� ���� ����϶�
select department_id, round(avg(salary)) from employees 
where salary >= 8000
group by department_id ;

--Q2.���� 8000�̻��� ������� �μ��� ��տ����� �ݿø����� �μ���ȣ�� ������������ �����϶�
select department_id, round(avg(salary)) from employees 
where salary>=8000 
group by department_id order by department_id desc ;

--Q3.���� 8000�λ��� ������� �μ��� ��տ����� �ݿø����� ��տ����� �ݿø������� �������� �����϶�
select department_id, round(avg(salary)) from employees 
where salary>=8000 
group by department_id order by avg(salary) asc ;

--Q4.���� 10000�̻��� ������� �μ��� ��տ����� �ݿø����� �μ���ȣ�� �������� �����϶�
select department_id, round(avg(salary)) from employees 
where salary >=10000 group by department_id order by avg(salary) asc;

--Q5.�� �μ��� ���� ������ �ϴ� ����� �ο����� ���Ͽ� �μ���ȣ, ������, �ο����� ����϶�
--(��, �μ���ȣ�� ���������� ���� �������� ����!)
select department_id, job_id, count(*) from employees
group by department_id , job_id order by department_id desc, job_id desc; 

--Q6.��� ���̺����� ������ ���ID�� ����ϵ� ������ 12000�� ����� ���� �����ڶ�� ����϶�
select salary, employee_id, decode(salary,12000,'���׿�����',' ') from employees;

--Q7.��� ���̺����� ������ ��� ID�� ����ϵ� ������ 12000 �̻��� ����� ����� ���׿����ڶ�� ����϶�.
--(��, �ְ��������� 24000)
select salary, employee_id,
case when salary between 12000 and 24000 then '���׿�����' else ' 'end ���
from employees; 

--Q8.������̺����� ������ ���ID�� ����ϵ� ������ 20000 �̻��� ����� 1�޿�����,
--������ 15000���� 19000 ������ ����� 2�� ������,
--������ ��Ÿ������ ����� 3�� �����ڶ�� ����϶�.
--(��, �ְ��������� 24000�̴�.)
select salary, employee_id,
case when salary between 15000 and 19000 then '2�޿�����'
     when salary >= 20000 then '1�� ������'
     else '3�޿�����'
end ���
from employees;




