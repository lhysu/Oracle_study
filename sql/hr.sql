--hr ������ ��� ���̺��� ��� �÷����� �˻�(���)
select * from tab;

--*(��� �÷�) : �μ� ���̺��� ��� �����˻�
select * from departments;

--�μ����̺��� ��� ���� �˻� - �μ���
select department_name from departments;

--�μ����̺��� ��� ���� �˻� - �μ���ȣ, �μ���
select department_id,department_name from departments;

--���̺� ���� ���
desc employees;

--��� ���̺��� �����ڵ�����ϱ�(�ߺ� ����)
select distinct JOB_ID from employees;

--��� ���̺��� �����ڵ�� �޿��� �����ķ� ���
select job_id, salary 
from employees 
order by job_id desc, salary desc;

--��� ���̺��� ����, ���� ���(��Ī ���)
select job_id "����", salary "����" from employees;
select job_id as "����", salary as "����" from employees;

--"": ��Ī, '': ������(���ڿ�)

--��� ���̺��� �μ��ڵ尡 10�� ��� �ڵ�� �μ� �ڵ带 ���
select employee_id, department_id from employees where department_id = 10;

--������̺��� ������� 07/12/07�� ��� �ڵ�, ��, ����� ���
select employee_id, first_name, hire_date from employees where hire_date='07/12/07';

select salary, employee_id from employees where employee_id=30;

--��� ���̺��� �μ���ȣ�� 10�� ����� �̸��� �޿�*1.1 �� ���
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
--��� ���̺��� ���� �ι�° ���ڰ� i�� �͵��� ���
select first_name from employees where first_name like '_i%';
select first_name from employees where substr(first_name,2,1)='i';

--instr(����, ã����� ���ڿ�) : ù ���� ��ġ
select instr('010-2222-8888','-') from dual;
--instr(����, ã����� ���ڿ�, ���� ��ġ, ���° �ߺ�����)
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

--Q6.��� ���̺��� ������ ���ID�� ����ϵ� ������ 12000�� ����� ��� �����ڶ�� ����϶�
select salary, employee_id, decode(salary,12000,'��׿�����',' ') from employees;

--Q7.��� ���̺��� ������ ��� ID�� ����ϵ� ������ 12000 �̻��� ����� ��� ��׿����ڶ�� ����϶�.
--(��, �ְ������� 24000)
select salary, employee_id,
case when salary between 12000 and 24000 then '��׿�����' else ' 'end ���
from employees; 

--Q8.������̺��� ������ ���ID�� ����ϵ� ������ 20000 �̻��� ����� 1�޿�����,
--������ 15000���� 19000 ������ ����� 2�� ������,
--������ ��Ÿ������ ����� 3�� �����ڶ�� ����϶�.
--(��, �ְ������� 24000�̴�.)
select salary, employee_id,
case when salary between 15000 and 19000 then '2�޿�����'
     when salary >= 20000 then '1�� ������'
     else '3�޿�����'
end ���
from employees;



--join
--���� �÷��� ������� ������ ũ�ν� ����
select employees.employee_id "�����ȣ", departments.department_name "�μ���"
from employees, departments
where employees.department_id = departments.department_id;

select employees.employee_id, departments.location_id 
from employees, departments
where employees.department_id = departments.department_id and employees.employee_id = 100;

--ANSI Join(join~on)
select e.employee_id "�����ȣ", d.department_name "�μ���"    --��� ���̺��� �÷����� ��Ȯ�� ��� 
from employees e join departments d         --���̺� join(+��Ī)
on (e.department_id = d.department_id);     --�����÷�

select e.employee_id �����ȣ, d.department_name �ٹ��μ�, j.job_title ��������
from employees e, departments d, jobs j
where e.department_id = d.department_id and e.job_id = j.job_id;

select e.employee_id �����ȣ, d.location_id �ٹ���, j.job_title ��������
from employees e, departments d, jobs j
where e.department_id = d.department_id and e.job_id = j.job_id
and e.employee_id = 100;

select e.first_name �����, d.department_id �μ���, j.job_title ��������
from employees e join departments d on e.department_id = d.department_id
join jobs j on e.job_id = j.job_id;

select e.employee_id ���ID, d.department_id �μ���, j.job_title ��������
from employees e join departments d
on e.department_id = d.department_id
join jobs j
on e.job_id = j.job_id
where e.employee_id = 100;

--Q1.employees �� departments ���̺��� �����Ͽ� ����̸��� ��Steven����
--����� �̸��� ��, �μ����� ����ϵ� �μ����� Executive�϶��� ����
--��, Shipping�϶��� �߼ۺζ�� ����϶�.
select e.first_name �̸�, e.last_name ��, decode(d.department_name,'Executive','������','Shipping','�߼ۺ�') �μ���
from employees e join departments d on e.department_id = d.department_id
where e.first_name = 'Steven';

--Q2.employees �� departments ���̺��� �����Ͽ� �޿��� 12000�̻���
--����� �μ�ID,�μ���,�̸�,�޿��� ����϶�.(�޿��� ������������ ����)
select d.department_id �μ�ID, d.department_name �μ���, e.first_name �̸�,e.salary �޿�
from employees e, departments d 
where e.department_id = d.department_id
and e.salary >= 12000 order by salary desc;


--�� ���� �׽�Ʈ�� ���� ���̺� ����
CREATE TABLE SAL_GRADE 
(
  GRADE NUMBER NOT NULL 
, MIN_SAL NUMBER NOT NULL 
, MAX_SAL NUMBER NOT NULL 
, CONSTRAINT SAL_GRADE_PK PRIMARY KEY 
  (
    GRADE 
  )
  ENABLE 
);

-------------------------------------------
--NON-EQUI JOIN
--������̺��� 30�� �μ� ������� �޿�����
select employee_id, salary from employees where department_id = 30;

--������̺��� 30�� �μ� ������� �޿�����
--�޿���� ���̺�� �����Ͽ� ��޺� ǥ��
select e.employee_id, e.salary, s.max_sal, s.grade
from employees e join sal_grade s on e.salary
between s.min_sal and s.max_sal where e.department_id = 30;

select e.employee_id, e.salary, s.max_sal, s.grade
from employees e join sal_grade s 
on e.salary >= s.min_sal and e.salary <= s.max_sal
where e.department_id = 30;

-------------------------------------------
--self join(EQUI join)
--null���� ����
--employees ���̺��� �Ŵ��� �̸� �˻�
select e1.employee_id, e1.first_name ||'�� �Ŵ��� '|| nvl(e2.first_name,'����')
from employees e1, employees e2
where e1.manager_id = e2.employee_id order by e1.employee_id asc;
--(ANSI join)
select e1.employee_id, e1.first_name ||'�� �Ŵ��� '|| nvl(e2.first_name,'����')
from employees e1 join employees e2
on e1.manager_id = e2.employee_id order by e1.employee_id asc;

-------------------------------------------------
--outer join
--null ���� �����ص� ���(join�� null���� ������ ���X)

--�Ŵ����� null�̾ ���
select e1.employee_id, e1.first_name ||'�� �Ŵ��� '|| nvl(e2.first_name,'����')
from employees e1, employees e2
where e1.manager_id = e2.employee_id(+) order by e1.employee_id asc;

--����� null�̾ ���
select e1.employee_id, e1.first_name ||'�� �Ŵ��� '|| nvl(e2.first_name,'����')
from employees e1, employees e2
where e1.manager_id(+) = e2.employee_id order by e1.employee_id asc;

--(+)�� where�������� ��� ����
--�μ� ���̺�� ��� ���̺��� ���� �� �μ��� ���� ����� ���
select e.employee_id, e.first_name, d.department_name
from employees e, departments d
where e.department_id = d.department_id(+)
order by e.employee_id desc;
--����� ���� �μ��� ���
select e.employee_id, e.first_name, d.department_name
from employees e, departments d
where e.department_id(+) = d.department_id
order by e.employee_id desc;


--join using ����ϱ� (where ��� using ���)
select e.employee_id, e.first_name, d.department_name
from employees e join departments d
using (department_id);

--ǥ�� outer join
--������� null�� �����Ͽ� ���
select e.employee_id, e.first_name, d.department_name
from employees e left outer join departments d
using (department_id);
--�μ� ���� null �� �����Ͽ� ���
select e.employee_id, e.first_name, d.department_name
from employees e right outer join departments d
using (department_id);
--���� ��� null �� �����Ͽ� ���
select e.employee_id, e.first_name, d.department_name
from employees e full outer join departments d
using (department_id);

-------------------------------------------------
--natural join
--�ڵ� ����>>on �̳� using ��� ���ص� ��
select employee_id, department_name from employees
natural join departments;

select department_id, department_name, location_id, city
from departments natural join locations;

--Q1.��� ���̺�� �μ� ���̺��� �����Ͽ� ��� ���ID,����̸�,�޿�,�μ�����
--����϶�. (�μ��� �������� ����)
select e.employee_id ���ID, e.first_name ����̸�, e.salary �޿�, d.department_name �μ���
from employees e left outer join departments d using(department_id)
order by d.department_name desc;

--Q2.��� ���̺�� �μ� ���̺��� �����Ͽ� ����ID�� ��IT_PROG�� �� �������
--����̸�, ����ID,�μ���, ��ġID�� ����ϼ���.
select e.first_name ����̸�, job_id ����ID, department_name, location_id
from employees e inner join departments d
on e.department_id = d.department_id
and e.job_id = 'IT_PROG';

--Q3.�μ� ���̺�� ��� ���̺��� ���, �����, ����, �޿� , �μ�����
--�˻��Ͻÿ�. ��, �������� '%Manager' �̸� �޿��� 8000 �̻���
--����� ���Ͽ� ����� �������� �������� ������ ��.
select e.employee_id ���, e.first_name �����, j.job_title ����, e.salary �޿�, d.department_name �μ���
from employees e join departments d
on e.department_id = d.department_id
join job j on j.job_id = e.job_id
and j.job_title like '%Manager' and salary >=8000
order by e.employee_id asc;

-------------------------------------------------------------
--sub query
select * from employees 
where salary < (select round(avg(salary)) from employees);

--David Austin���� ������ ���� ����鸸 ���
select employee_id, first_name, salary from employees
where salary < (select salary from employees where first_name = 'David' and last_name = 'Austin');
select salary from employees where first_name = 'David' and last_name = 'Austin';

--David Austin���� �Ի簡 ���� ����鸸 ���
select employee_id, first_name, hire_date from employees
where hire_date > (select hire_date from employees where first_name = 'David' and last_name = 'Austin'); 
select hire_date from employees where first_name = 'David' and last_name = 'Austin';

--David Austin�� ���� �μ��� ����鸸 ���
select e.employee_id, e.first_name,e.department_id, d.department_name from employees e , departments d
where e.department_id = d.department_id 
and e.department_id = (select department_id from employees where first_name='David' and last_name = 'Austin');

select department_id from employees where first_name = 'David' and last_name = 'Austin';

--������, �����÷� ���� ����
--��� ���̺��� �޿��� ���� ���� ����� ����
select * from employees where salary = (select max(salary) from employees);
--��� ���̺��� ��� �޿����� �޿��� ���� ������� ���
select * from employees where salary > (select round(avg(salary)) from employees);
select round(avg(salary)) from employees;

--������, �����÷�
--60�� �μ� ������ ���� �޿��� �޴� ����� ���
select * from employees
where salary in(select salary from employees where department_id = 60);

--60�� �μ� ������� �޿� �� ���� ���� �޿����� ū(�̻�) �޿��� �޴� ����� ���(any)
select * from employees
where salary > any(select salary from employees where department_id = 60);

--60�� �μ� ������� �޿� �� ���� ���� �޿����� ����(����) �޿��� �޴� ����� ���
select * from employees
where salary < all(select salary from employees where department_id = 60);

--��� ���̺��� �������� �ּ� �޿��� �޴� ����� ������ �����ȣ, �̸�, ����, �Ի�����, �޿�, �μ���ȣ�� ���
select first_name||' '||last_name,job_id,hire_date,salary,department_id
from employees
where salary in (select min(salary) from employees group by job_id);

--��� ���̺��� �������� ��� �޿��� 14000�̻��� ����� �ּұ޿����� ���� �޿��� �޴� ����� ������
--�����ȣ, �̸�, ����, �Ի�����, �޿�, �μ���ȣ�� ����϶�
select employee_id, first_name||' '||last_name, job_id, salary, department_id
from employees where salary > any(select avg(salary) from employees where salary>=14000 group by job_id);

--������̺��� �������� ��� �޿��� 14000�̻��� ��� �ִ� �޿����� ���� �޿��� �޴� ����� ������
--�����ȣ, �̸�,����,�Ի�����,�޿�,�μ���ȣ�� ����϶�
select employee_id, first_name||' '||last_name, job_id, salary, department_id
from employees where salary < any(select avg(salary) from employees where salary>=14000 group by job_id);

--exist: ��� ����� ������� ��� �ִ��� �����ĸ�
--������̺� �����ϴ� �μ��ڵ�� �μ� �̸��� ���
select department_id, department_name from departments
where exists (select distinct(department_id) from employees
where departments.department_id = employees.department_id);

--��� ���̺��� ���������� ���� ����� ��� ������ exists�� �̿��Ͽ� �ۼ��϶�.
select employee_id, first_name
from employees e1
where not exists(select employee_id from employees e2 where e1.employee_id = e2.manager_id);

----------------------------------------------------------------------------------
--������, �����÷�
--�������� �ּ� �޿��� �޴� ����� ������ �����ȣ, �̸�, ����, �޿�, �μ���ȣ�� ���
select employee_id, first_name||' '||last_name "Name", job_id,salary,department_id
from employees 
where ( job_id,salary) in(select job_id, min(salary) from employees group by job_id);

--------------------------------------------------------------------------------
--��ȣ���� sub-query
--���������� ����� ���̺��� ���������� ����>> .�� ����
--���̺��� ��� �Ѹ��� ������κ��ͺ��� ���� �� �ִ� ����� ������ �����ȣ, �̸�, ����, �Ի�����, �޿��� ���
select employee_id, first_name||' '||last_name "Name", job_id,salary,department_id
from employees e
where exists(select * from employees where manager_id = e.employee_id);
--�ҼӺμ��� ��ձ޿����� ���� �޿��� �޴� ����� ���
select * from employees e
where salary > (select avg(salary)from employees where department_id = e.department_id);

--------------------------------------------------------------------------------
--update
--1.'David Austin'�� ������ 'John Chen'�� ����� ������ ���� �������� ����
select job_id from employees where first_name = 'John' and last_name='Chen';

update employees set job_id =(select job_id from employees where first_name = 'John' and last_name='Chen')
where first_name='David' and last_name='Austin';

select job_id from employees where first_name='David' and last_name='Austin';
--------------------------------------------------------------------------------
--delete
--�ּ� �޿��� �޴� �������� �����϶�
select min(salary)  from employees;
select employee_id, first_name||' '||last_name, salary from employees
where salary = (select min(salary)  from employees);

delete from employees where salary=(select min(salary)  from employees);

--------------------------------------------------------------------------------
--Q1. �Ի��ȣ(���ID)�� 103�� ����� ���� ����(job_id)�� ���� ������� ������ ����Ͻÿ�.
select job_id from employees where employee_id = 103;

select employee_id �����ȣ, first_name||' '||last_name �̸�,job_id ���� from employees 
where job_id=(select job_id from employees where employee_id = 103);

--Q2.Diana Lorentz�� ���� �μ��� ������� ������ ����Ͻÿ�.
select department_id from employees where first_name='Diana' and last_name = 'Lorentz';

select employee_id �����ȣ, first_name||' '||last_name �̸�,department_id �μ���ȣ  from employees
where department_id = (select department_id from employees where first_name='Diana' and last_name = 'Lorentz');

--Q3.��� ���̺��� 110�� �μ��� �ְ� �޿��� �޴� ������� ���� �޿��� �޴� ����� ������ 
--�����ȣ, �̸�, ����, �Ի�����, �޿�, �μ���ȣ�� ����Ͽ���.
select max(salary) from employees where department_id = 110;

select employee_id �����ȣ, first_name||' '||last_name �̸�, job_id ����, hire_date �Ի�����,
salary �޿�, department_id �μ���ȣ from employees
where salary > (select max(salary) from employees where department_id = 110);

--------------------------------------------------------------------------------
--Q1.����� �μ� table�� join�Ͽ� �μ�ID, �μ���, �̸�, �޿��� ����϶�.(ANSI JOIN���)
select d.department_id, d.department_name, e.first_name||' '||e.last_name, e.salary
from employees e join departments d
on e.department_id = d.department_id;

--Q2.�̸��� 'Steven'�� ����� �μ����� ����϶�
select department_name 
from departments 
where department_id in(select department_id from employees where first_name = 'Steven');


--Q3.�μ� ���̺� �ִ� ��� �μ��� ����ϰ�, ��� ���̺� �ִ� data�� join�Ͽ� 
--��� ����� �̸�, �μ�ID,�μ���, �޿��� ����϶�
select department_name from departments;

select first_name||' '||last_name,d.department_id,d.department_name, e.salary
from employees e left outer join departments d
on e.department_id = d.department_id;

--Q4.��� ���̺� �ִ� ��� employee_id�� manager_id�� �̿��Ͽ� ������ ���踦 ������ ���� ����϶�.
--��)Neena�� �Ŵ����� Steven�̴�. �� �Ŵ����� ������ �������� ǥ���� ��

select e1.first_name ||'�� �Ŵ����� '||nvl(e2.first_name,'����')||'�̴�.'
from employees e1 left outer join employees e2
on e1.manager_id = e2.employee_id;

--Q5-1.'Neena'�� ������ ���� ����̸�, �μ� ID, �޿�, ������ ����϶�.
select first_name||' '||last_name, department_id, salary, job_id
from employees 
where job_id = (select job_id from employees where first_name='Neena');

--Q5-2.'Neena'�� ������ ���� ����̸�, �μ���, �޿�, ������ ����϶�.

select e.first_name||' '||e.last_name, d.department_name, e.salary, e.job_id
from employees e join departments d
on e.department_id = d.department_id
where job_id = (select job_id from employees where first_name='Neena');

--Q6.'John'�� �����ִ� �μ��� ��� ����� �μ���ȣ, ���ID, �̸�, �Ի���, �޿��� ����϶�.
select department_id, employee_id, first_name||' '||last_name, hire_date, salary
from employees
where department_id in(select department_id from employees where first_name = 'John');

--Q7-1.��ü ����� ����ӱݺ��� ���� ����� �����ȣ, �̸�, �μ���, �Ի���, �޿��� ����϶�
select e.employee_id, e.first_name||' '||e.last_name, d.department_name, e.hire_date, e.salary
from employees e join departments d
on e.department_id= d.department_id
and (salary>(select avg(salary)from employees));

--Q7-2.��ü ����� ��� �ӱݺ��� ���� ����� �����ȣ,�̸�,�μ���,�Ի���,������,�޿��� ����϶�.
select e.employee_id, e.first_name||' '||e.last_name, d.department_name,l.city, e.hire_date, e.salary
from employees e join departments d
on e.department_id= d.department_id
join locations l on d.location_id = l.location_id 
and (salary>(select avg(salary)from employees));

--Q8.10�� �μ� ����� �߿� 20�� �ּ��� ����� ���� ������ �ϴ� ����� 
--�����ȣ, ����, �̸�, �μ���,�Ի���, �������� ���
select e.employee_id, e.job_id, e.first_name||' '||e.last_name, d.department_name, e.hire_date, l.city
from employees e join departments d on e.department_id = d.department_id
join locations l on d.location_id = l.location_id
and e.department_id = 10
and job_id in (select job_id from employees where department_id = 20);

--Q9.10�� �μ� �߿��� 30�� �μ����� ���� ������ �ϴ� ����� 
--�����ȣ, ����, �̸�, �μ���, �Ի���, ������ ���
select e.employee_id, e.job_id, e.first_name||' '||e.last_name, d.department_name, e.hire_date, l.city
from employees e join departments d on e.department_id = d.department_id
join locations l on d.location_id = l.location_id
and e.department_id = 10
and job_id not in (select job_id from employees where department_id = 30);

--Q10.10�� �μ��� ���� ���� �ϴ� ����� ����� 
--�����ȣ, ����, �̸�, �μ���ȣ, �μ���, ����, �޿��� ���
select e.employee_id , e.job_id, e.first_name||' '||e.last_name, e.department_id,
d.department_name, l.city,e.salary 
from employees e join departments d on e.department_id = d.department_id
join locations l on d. location_id = l.location_id
and job_id in (select job_id from employees where department_id = 10);

--Q11.'Neena' Ȥ�� 'David'�� �޿��� ���� ����� �����ȣ, �̸�, �޿��� ����϶�
select employee_id , first_name||' '||last_name, salary
from employees
where salary in (select salary from employees 
where first_name = 'Neena' or first_name = 'David');

--Q12. �޿��� 30�� �μ��� �ְ� �޿����� ���� ����� �����ȣ, �̸�, �޿��� ����϶�.
select employee_id, first_name||' '||last_name, salary
from employees
where salary > (select max(salary) from employees where department_id = 30);


select employee_id, first_name||' '||last_name, salary
from employees
where salary > all(select salary from employees where department_id = 30);

--Q13.�޿��� 30�� �μ��� ���� �޿����� ���� ����� �����ȣ, �̸�, �޿��� ����϶�.
select employee_id, first_name||' '||last_name, salary
from employees
where salary < (select min(salary) from employees where department_id = 30);

select employee_id, first_name||' '||last_name, salary
from employees
where salary < all(select salary from employees where department_id = 30);

--Q14.�޿��� 90�� �μ��� ���� �޿����� ���� ����� �����ȣ, �̸�, �޿� ���
select employee_id,first_name||' '||last_name, salary
from employees
where salary > (select min(salary) from employees where department_id =90);

select employee_id,first_name||' '||last_name, salary
from employees
where salary > any(select salary from employees where department_id =90);

--Q15.�޿��� 90�� �μ��� �ְ� �޿����� ���� ����� �����ȣ, �̸�, �޿��� ����϶�.
select employee_id,first_name||' '||last_name, salary
from employees
where salary < (select max(salary) from employees where department_id =90);

select employee_id,first_name||' '||last_name, salary
from employees
where salary < any(select salary from employees where department_id =90);

--Q16.��� �̸��� �μ����� ����϶�.(��, �䳪 ������ ������� ���� ���������� �� ��)
select e.first_name||' '||e.last_name ����̸�,
(select d.department_name from departments d where e.department_id = d.department_id) �μ���
from employees e;

--------------------------------------------------------------------------------
select * from employees;
create table emp as select * from employees;        --���̺� ���� (������ ����)

select * from departments;
create table dpt as select * from departments where 1=2;        --������ ���� ������ ������

select * from jobs;
create table js as select * from jobs;

select * from locations;
create table loc as select * from locations;

--------------------------------------------------------------------------------
CREATE TABLE TEST_TCL AS SELECT * FROM DEPARTMENTS;
SELECT * FROM TEST_TCL;
COMMIT; --Ʈ����ǽ���        --(DDL�� �߻��ϸ� �ڵ� Ŀ��)
UPDATE TEST_TCL SET DEPARTMENT_ID=50;
savepoint aaa;

UPDATE TEST_TCL SET LOCATION_ID=1004 WHERE DEPARTMENT_NAME='IT';
savepoint bbb;

DELETE FROM TEST_TCL WHERE DEPARTMENT_NAME='Marketing';
rollback to bbb;

SELECT * FROM TEST_TCL;
ROLLBACK;
SELECT * FROM TEST_TCL;
--------------------------------------------------------------------------------
create table dept as select * from departments where 1=2;
CREATE TABLE EMP_TAB(
EMPNO NUMBER(4),
ENAME VARCHAR2(10),
JOB_ID VARCHAR2(9),
MGR NUMBER(4) CONSTRAINT EMP_SELF_KEY
REFERENCES EMP_TAB(EMPNO),
HIRE_DATE DATE,
SAL NUMBER(7),
COMM NUMBER(1),
DEPTNO NUMBER(2) NOT NULL,
CONSTRAINT EMP_DEPTNO_FK FOREIGN KEY(DEPTNO)
REFERENCES DEPT(DEPTNO),
CONSTRAINT EMP_EMPNO_PK PRIMARY KEY(EMPNO)
);

select constraint_name from user_constraints;

alter table test_TAB add constraint test_tab_pk primary key(emno);
alter table test_tab drop constraint test_tab_pk;


--------------------------------------------------------------------------------
--view
select * from emp_details_view;

--or replace: view�� ��� �����Ǹ� �ϱ� ������ ���̴� ���� ����
create or replace noforce view test_view_emp 
as select employee_id, first_name,salary 
from employees with read only;

select * from test_view_emp;
select * from tab;

drop view test_view_emp;

--join���� view ����
CREATE OR REPLACE VIEW TEST_JOIN_VIEW
AS SELECT 
    e.first_name, d.department_name 

FROM 
   employees e join departments d
    on d.department_id=e.department_id;

select * from test_join_view;

--------------------------------------------------------------------------------
--rownum, rowid
--10���྿ �߶� �˻��ǵ��� dql�� �ۼ�
select * from 
(select rownum rnum, employee_id, first_name,salary from employees order by employee_id asc)
where rnum >= 1 and rnum <=10;

select * from 
(select rownum rnum, employee_id, first_name,salary from employees order by employee_id asc)
where rnum >= 11 and rnum <=20;
--�������: from > where > select

select * from 
(select rownum rnum, employee_id, first_name,salary from employees order by employee_id asc)
where rnum between 21 and 30 ;

--------------------------------------------------------------------------------
--�Ұ�: rollup(�ٷιٷ� ������), cube(�������� ��Ƽ� �ѹ� �� ������)
select department_id, job_id, sum(salary) from employees
where department_id <=40 
group by rollup(department_id , job_id)
order by department_id;

select department_id, job_id, sum(salary) from employees
where department_id <=40 
group by cube(department_id , job_id)
order by department_id;

--------------------------------------------------------------------------------
--�������� ����: with
with e as
(select employee_id, manager_id,salary,last_name from employees where department_id = 50),
d as
(select avg(salary) avg_salary from employees where department_id = 50)
select e.employee_id, e.last_name,e.salary
from e,d
where e.salary < d.avg_salary;

--�μ��� ��� �޿��׺��� �μ��� �޿� �հ���� ū �μ��� ����� ����
--1.�μ��� �޿� �հ�
select department_name, sum(salary) sum_sal
from employees e, departments d
where e.department_id = d.department_id 
group by department_name;

--2.�μ��� ��ü ��� = ����� �޿� �Ѱ� ������ �μ� ��
select dt.sum_amt/dc.cnt �μ����
from (select sum(e.salary) sum_amt from employees e, departments d
where e.department_id = d.department_id) dt,
(select count(*) cnt from departments d
where d.department_id in(select department_id from employees)) dc;

--3-1.���� �Ϲ� ���� ����
select a.department_name, a.sum_sal
from (select department_name, sum(salary) sum_sal
from employees e, departments d
where e.department_id = d.department_id 
group by department_name) a,
(select dt.sum_amt/dc.cnt avg_amt
from (select sum(e.salary) sum_amt from employees e, departments d
where e.department_id = d.department_id) dt,
(select count(*) cnt from departments d
where d.department_id in(select department_id from employees)) dc) b
where a.sum_sal >b.avg_amt;

--3-2. ���� with ��������
with dept_costs as(select department_name, sum(salary) sum_sal
from employees e, departments d
where e.department_id = d.department_id 
group by department_name),
avg_cost as(select sum(sum_sal)/count(*) avg from dept_costs)
select dept_costs.*
from dept_costs, avg_cost
where dept_costs.sum_sal > avg_cost.avg;
