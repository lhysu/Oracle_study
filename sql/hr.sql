--hr 계정의 모든 테이블의 모든 컬럼정보 검색(출력)
select * from tab;

--*(모든 컬럼) : 부서 테이블의 모든 정보검색
select * from departments;

--부서테이블의 모든 정보 검색 - 부서명만
select department_name from departments;

--부서테이블의 모든 정보 검색 - 부서번호, 부서명
select department_id,department_name from departments;

--테이블 정보 얻기
desc employees;

--사원 테이블에서 업무코드출력하기(중복 배제)
select distinct JOB_ID from employees;

--사원 테이블에서 업무코드와 급여를 역정렬로 출력
select job_id, salary 
from employees 
order by job_id desc, salary desc;

--사원 테이블에서 직업, 봉급 출력(별칭 사용)
select job_id "직업", salary "봉급" from employees;
select job_id as "직업", salary as "봉급" from employees;

--"": 별칭, '': 데이터(문자열)

--사원 테이블에서 부서코드가 10인 사원 코드와 부서 코드를 출력
select employee_id, department_id from employees where department_id = 10;

--사원테이블에서 고용일이 07/12/07인 사원 코드, 성, 고용일 출력
select employee_id, first_name, hire_date from employees where hire_date='07/12/07';

select salary, employee_id from employees where employee_id=30;

--사원 테이블에서 부서번호가 10인 사원의 이름과 급여*1.1 을 출력
select first_name,salary*1.1 from employees where department_id = 10;

select first_name,salary from employees where salary = 950;
select first_name,salary from employees where salary>=3000;
select first_name,salary from employees where slary<3000;
select department_id,salary from employees where department_id=30;

--union: 두테이블을 더해서 중복을 제거해 출력
select employee_id, salary from employees where salary >= 20000 or salary <=2100
union
select employee_id, salary from employees where salary <=2200;

--union all: 두 테이블을 더해서 중복 포함 출력
select employee_id, salary from employees where salary >= 20000 or salary <=2100
union all
select employee_id, salary from employees where salary <=2200;

--intersect: 두 테이블의 교집합 출력
select employee_id, salary from employees where salary >= 20000 or salary <=2100
intersect
select employee_id, salary from employees where salary <=2200;

--minus: 앞 결과에서 뒤 결과 빼고 출력
select employee_id, salary from employees where salary >= 20000 or salary <=2100
minus
select employee_id, salary from employees where salary <=2200;

select employee_id, salary from employees where salary <=2200
intersect
select employee_id, salary from employees where salary >= 20000 or salary <=2100;

--in: or과 같다(반복 대상이 동일해야 함)
select department_id, salary from employees where department_id in(10,200,100);

--any의 좌측에는 크다,작다,이상,이하가 와야 함
select department_id, salary from employees where salary >= any(8000,12000,20000);


select  job_id, first_name,salary from employees where salary >= 1000 and salary <=12000;
select  job_id, first_name,salary from employees where salary between 10000 and 12000;
select  last_name from employees where last_name between 'Chen' and 'Dilly' order by last_name;
select  last_name from employees where not last_name = 'Dilly' order by last_name;

--like:(=java의 contains) 해당 글자가 있는지 찾아줌 (%모든 문자)
select last_name from employees where last_name like 't%';      --t로 시작하는
select last_name from employees where last_name like '%y%';     --y가 들어가는
select last_name from employees where last_name like '__e%';    --앞에 두글자+e+~(_:한글자)
select last_name from employees where last_name like '%es';     
select last_name from employees where last_name like '%Di%';        --대소문자 구분함

select last_name, commission_pct from employees where commission_pct is null;   --null인것만
select last_name, commission_pct from employees where commission_pct is not null;   --null이 아닌 것만

--||: 결합 연산자 
select first_name||''||last_name||'의 연봉['||salary||']'from employees;
select last_name ||'의 연봉은'||salary||'입니다.' from employees;
select last_name ||111111||salary||222222 from employees;

--급여가 1000보다 크고 12000보다 작은
select employee_id from employees where not (salary > 1000 and salary < 12000);
--급여가 1000보다 크지 않고 12000보다 작은 
select employee_id from employees where not salary > 1000 and salary < 12000;

select chr(65) from dual;
select chr(65) from employees;

select 25*25 from dual;

select first_name||' is a '||job_id from employees;
select concat(first_name,' is a '),job_id from employees;

select lpad('yangssem',13,'*#') from dual;
select lpad('\200,000',13,' ') from dual;
select rpad('yangssem',13,'*#') from dual;

--litrim(문자열, 지우고 싶은 문자열), 왼쪽 지우기
select ltrim('aa123456aa','aa') from dual;
--ritrim(문자열, 지우고 싶은 문자열), 오른쪽 지우기
select rtrim('aa123456aa','aa') from dual;

--replace(원문, 타겟, 수정)
--yang and sam 에서 sa를 sse로 수정
select replace('yang and sam','sa','sse')from dual;
--department_name 열에서 IT를 information technology로 수정
select replace (department_name,'IT','information technology') from departments;

--substr(문자열, 자릿수, 개수): 일부분 추출
--ABCDEFG에서 2번째 문자부터 1개 추출
select substr('ABCDEFG',2,1) from dual;
--사원 테이블에서 성의 두번째 글자가 i인 것들을 출력
select first_name from employees where first_name like '_i%';
select first_name from employees where substr(first_name,2,1)='i';

--instr(원문, 찾고싶은 문자열) : 첫 출현 위치
select instr('010-2222-8888','-') from dual;
--instr(원문, 찾고싶은 문자열, 시작 위치, 몇번째 중복인지)
select instr('CORPORATE FLOOR','OR',1,2) from dual;

--길이
select length('yangssem') from dual;

--greatest: 최대값 출력
select greatest('CC','ABCDE','CA') from dual;
select greatest('12','132','34') from dual;         --문자열
select greatest(12,132,34) from dual;               --정수
--least: 최소값 출력
select least('CC','ABCDE','CA') from dual;
select least('12','132','34') from dual;
select least(12,132,34) from dual;
select least ('가나','가다','다라') from dual;

--nvl: null값을 대체
select salary + ( salary * nvl(commission_pct, 5)) from employees;
--nvl2(컬럼, null 아닐때 숫자, null일때 숫자)
select salary + ( salary * nvl2(commission_pct, 5, 10)) from employees;

--decode(A,B, 참 리턴): 3항 연산자-A와 B를 비교해 참이면 리턴값 출력
select last_name, job_id, salary, decode(job_id,'IT_PROG', salary*1.1) 
as "실수령액" from employees;

--decode(A,B, 참 리턴, 거짓 리턴): 3항 연산자-A와 B를 비교해 참이면 참리턴, 거짓이면 거짓 리턴
select last_name, job_id, salary, decode(job_id,'IT_PROG', salary*1.1, salary) 
as "실수령액" from employees;

--decode(A,B1,B1 참 리턴, B2, B2 참리턴,....,해당 사항 없을 때 리턴): 3항 연산자-A와 B를 비교해 참이면 리턴값 출력
select last_name, job_id, salary, 
decode(job_id,'IT_PROG', salary*1.1,'AD_PRES',salary*1.2,'AD_VP',salary*1.3,salary) 
as "실수령액" from employees;

--case when-then
select last_name, job_id, salary,
    case job_id when 'IT_PROG' then salary*1.1      --job_id가 'IT_FROG'이면 salary*1.1
                when 'AD_PRES' then salary*1.2
                when 'AD_VP' then salary*1.3
    else salary             --그외의 경우
    end as "실수령액"         --case문 종료 및 별칭
from employees;

--날짜 함수
select sysdate from dual;
--add_month: 개월을 더하거나 뺄 때
select hire_date, add_months(hire_date,3) from employees where employee_id = 100;
select hire_date, add_months(hire_date,-3) from employees where employee_id = 100;
select add_months('13/04/20',12) from dual;
--문자변환 함수 to_char
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
select to_char(sysdate,'YYYY-MM-DD DAY AM HH:MI:SS') as "현재시간" from dual;

--숫자 변환 함수
select to_number('100')+1 from dual;
--날짜 변환 함수
select to_date(sysdate,'yy/mm/dd') from dual;
select to_date('13-03-20','yy/mm/dd') from dual;

--시스템 함수
--user: field의 데이터 사용자를 리턴
select user from dual;

--숫자 함수
select abs(-30) from dual;      --절대값
select ceil(11.001) from dual;  --올림값
select floor(4.999) from dual;  --내림값
select round(22.5) from dual;   --소수점 첫째자리 반올림
select round(22.567,2) from dual;--자릿수에서 반올림
select mod(11,4) from dual;         --11/4의 나머지
select poser(2,7) from dual;        --2의 7제곱
select trunc(99.123456,3) from dual; --소수점 3자릿수 빼고 버림

select count(first_name) from employees;
select count(employee_id) from employees;
select count(*) from employees;
select count(commission_pct) from employees;

select sum(salary) from employees;
select sum(commision_pct) from employees;

select avg(commission_pct) from employees;          --null값은 제외하고 평균
select avg(nvl(commission_pct,0)) from employees;   --null을 0으로 대체해 포함해서 평균

select max(salary) from employees;      --최대값
select min(salary) from employees;      --최소값

--부서별 연봉의 평균
select avg(salary), department_id from employees group by department_id;
select round(avg(salary)), department_id, job_id from employees group by department_id,job_id;
--having: group by의 조건절
select round(avg(salary)), department_id from employees 
group by department_id having department_id is not null; --부서 번호가 null이 아닌




--Q1. 연봉 8000 이상인 사원들의 부서별 평균연봉의 반올림 값을 출력하라
select department_id, round(avg(salary)) from employees 
where salary >= 8000
group by department_id ;

--Q2.연봉 8000이상인 사원들의 부서별 평균연봉의 반올림값을 부서번호의 내림차순으로 정렬하라
select department_id, round(avg(salary)) from employees 
where salary>=8000 
group by department_id order by department_id desc ;

--Q3.연봉 8000인상인 사원들의 부서별 평균연봉의 반올림값을 평균연봉의 반올림값으로 오름차순 정렬하라
select department_id, round(avg(salary)) from employees 
where salary>=8000 
group by department_id order by avg(salary) asc ;

--Q4.연봉 10000이상인 사원들의 부서별 평균연봉의 반올림값을 부서번호로 오름차순 정렬하라
select department_id, round(avg(salary)) from employees 
where salary >=10000 group by department_id order by avg(salary) asc;

--Q5.각 부서별 같은 업무를 하는 사람의 인원수를 구하여 부서번호, 업무명, 인원수를 출력하라
--(단, 부서번호와 업무명으로 각각 내림차순 정렬!)
select department_id, job_id, count(*) from employees
group by department_id , job_id order by department_id desc, job_id desc; 

--Q6.사원 테이블에서 연봉과 사원ID를 출력하되 연봉이 12000인 사원은 고액 연봉자라고 출력하라
select salary, employee_id, decode(salary,12000,'고액연봉자',' ') from employees;

--Q7.사원 테이블에서 연봉과 사원 ID를 출력하되 연봉이 12000 이상인 사원은 비고에 고액연봉자라고 출력하라.
--(단, 최고연봉액은 24000)
select salary, employee_id,
case when salary between 12000 and 24000 then '고액연봉자' else ' 'end 비고
from employees; 

--Q8.사원테이블에서 연봉과 사원ID를 출력하되 연봉이 20000 이상인 사원은 1급연봉자,
--연봉이 15000에서 19000 이하인 사원은 2급 연봉자,
--연봉이 기타연봉인 사원은 3급 연봉자라고 출력하라.
--(단, 최고연봉액은 24000이다.)
select salary, employee_id,
case when salary between 15000 and 19000 then '2급연봉자'
     when salary >= 20000 then '1급 연봉자'
     else '3급연봉자'
end 비고
from employees;



--join
--공통 컬럼을 명시하지 않으면 크로스 조인
select employees.employee_id "사원번호", departments.department_name "부서명"
from employees, departments
where employees.department_id = departments.department_id;

select employees.employee_id, departments.location_id 
from employees, departments
where employees.department_id = departments.department_id and employees.employee_id = 100;

--ANSI Join(join~on)
select e.employee_id "사원번호", d.department_name "부서명"    --어느 테이블의 컬럼인지 정확히 명시 
from employees e join departments d         --테이블 join(+별칭)
on (e.department_id = d.department_id);     --공통컬럼

select e.employee_id 사원번호, d.department_name 근무부서, j.job_title 업무제목
from employees e, departments d, jobs j
where e.department_id = d.department_id and e.job_id = j.job_id;

select e.employee_id 사원번호, d.location_id 근무지, j.job_title 업무제목
from employees e, departments d, jobs j
where e.department_id = d.department_id and e.job_id = j.job_id
and e.employee_id = 100;

select e.first_name 사원명, d.department_id 부서명, j.job_title 업무제목
from employees e join departments d on e.department_id = d.department_id
join jobs j on e.job_id = j.job_id;

select e.employee_id 사원ID, d.department_id 부서명, j.job_title 업무제목
from employees e join departments d
on e.department_id = d.department_id
join jobs j
on e.job_id = j.job_id
where e.employee_id = 100;

--Q1.employees 와 departments 테이블을 조인하여 사원이름이 ‘Steven’인
--사원의 이름과 성, 부서명을 출력하되 부서명이 Executive일때는 행정
--부, Shipping일때는 발송부라고 출력하라.
select e.first_name 이름, e.last_name 성, decode(d.department_name,'Executive','행정부','Shipping','발송부') 부서명
from employees e join departments d on e.department_id = d.department_id
where e.first_name = 'Steven';

--Q2.employees 와 departments 테이블을 조인하여 급여가 12000이상인
--사원의 부서ID,부서명,이름,급여를 출력하라.(급여의 내림차순으로 정렬)
select d.department_id 부서ID, d.department_name 부서명, e.first_name 이름,e.salary 급여
from employees e, departments d 
where e.department_id = d.department_id
and e.salary >= 12000 order by salary desc;


--비등가 조인 테스트를 위한 테이블 생성
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
--사원테이블에서 30번 부서 사원들의 급여정보
select employee_id, salary from employees where department_id = 30;

--사원테이블에서 30번 부서 사원들의 급여정보
--급여등급 테이블과 조인하여 등급별 표기
select e.employee_id, e.salary, s.max_sal, s.grade
from employees e join sal_grade s on e.salary
between s.min_sal and s.max_sal where e.department_id = 30;

select e.employee_id, e.salary, s.max_sal, s.grade
from employees e join sal_grade s 
on e.salary >= s.min_sal and e.salary <= s.max_sal
where e.department_id = 30;

-------------------------------------------
--self join(EQUI join)
--null값은 배제
--employees 테이블에서 매니저 이름 검색
select e1.employee_id, e1.first_name ||'의 매니저 '|| nvl(e2.first_name,'없음')
from employees e1, employees e2
where e1.manager_id = e2.employee_id order by e1.employee_id asc;
--(ANSI join)
select e1.employee_id, e1.first_name ||'의 매니저 '|| nvl(e2.first_name,'없음')
from employees e1 join employees e2
on e1.manager_id = e2.employee_id order by e1.employee_id asc;

-------------------------------------------------
--outer join
--null 값을 포함해도 출력(join은 null값이 있으면 출력X)

--매니저가 null이어도 출력
select e1.employee_id, e1.first_name ||'의 매니저 '|| nvl(e2.first_name,'없음')
from employees e1, employees e2
where e1.manager_id = e2.employee_id(+) order by e1.employee_id asc;

--사원이 null이어도 출력
select e1.employee_id, e1.first_name ||'의 매니저 '|| nvl(e2.first_name,'없음')
from employees e1, employees e2
where e1.manager_id(+) = e2.employee_id order by e1.employee_id asc;

--(+)는 where절에서만 사용 가능
--부서 테이블과 사원 테이블을 조인 시 부서가 없는 사원도 출력
select e.employee_id, e.first_name, d.department_name
from employees e, departments d
where e.department_id = d.department_id(+)
order by e.employee_id desc;
--사원이 없는 부서도 출력
select e.employee_id, e.first_name, d.department_name
from employees e, departments d
where e.department_id(+) = d.department_id
order by e.employee_id desc;


--join using 사용하기 (where 대신 using 사용)
select e.employee_id, e.first_name, d.department_name
from employees e join departments d
using (department_id);

--표준 outer join
--사원기준 null값 포함하여 출력
select e.employee_id, e.first_name, d.department_name
from employees e left outer join departments d
using (department_id);
--부서 기준 null 값 포함하여 출력
select e.employee_id, e.first_name, d.department_name
from employees e right outer join departments d
using (department_id);
--양쪽 모두 null 값 포함하여 출력
select e.employee_id, e.first_name, d.department_name
from employees e full outer join departments d
using (department_id);

-------------------------------------------------
--natural join
--자동 조인>>on 이나 using 사용 안해도 됌
select employee_id, department_name from employees
natural join departments;

select department_id, department_name, location_id, city
from departments natural join locations;

--Q1.사원 테이블과 부서 테이블을 조인하여 모든 사원ID,사원이름,급여,부서명을
--출력하라. (부서명 내림차순 정렬)
select e.employee_id 사원ID, e.first_name 사원이름, e.salary 급여, d.department_name 부서명
from employees e left outer join departments d using(department_id)
order by d.department_name desc;

--Q2.사원 테이블과 부서 테이블을 조인하여 직업ID가 ‘IT_PROG‘ 인 사원들의
--사원이름, 직업ID,부서명, 위치ID를 출력하세요.
select e.first_name 사원이름, job_id 직업ID, department_name, location_id
from employees e inner join departments d
on e.department_id = d.department_id
and e.job_id = 'IT_PROG';

--Q3.부서 테이블과 사원 테이블에서 사번, 사원명, 업무, 급여 , 부서명을
--검색하시오. 단, 업무명이 '%Manager' 이며 급여가 8000 이상인
--사원에 대하여 사번을 기준으로 오름차순 정렬할 것.
select e.employee_id 사번, e.first_name 사원명, j.job_title 업무, e.salary 급여, d.department_name 부서명
from employees e join departments d
on e.department_id = d.department_id
join job j on j.job_id = e.job_id
and j.job_title like '%Manager' and salary >=8000
order by e.employee_id asc;

-------------------------------------------------------------
--sub query
select * from employees 
where salary < (select round(avg(salary)) from employees);

--David Austin보다 월급이 작은 사람들만 출력
select employee_id, first_name, salary from employees
where salary < (select salary from employees where first_name = 'David' and last_name = 'Austin');
select salary from employees where first_name = 'David' and last_name = 'Austin';

--David Austin보다 입사가 늦은 사람들만 출력
select employee_id, first_name, hire_date from employees
where hire_date > (select hire_date from employees where first_name = 'David' and last_name = 'Austin'); 
select hire_date from employees where first_name = 'David' and last_name = 'Austin';

--David Austin과 같은 부서인 사람들만 출력
select e.employee_id, e.first_name,e.department_id, d.department_name from employees e , departments d
where e.department_id = d.department_id 
and e.department_id = (select department_id from employees where first_name='David' and last_name = 'Austin');

select department_id from employees where first_name = 'David' and last_name = 'Austin';

--단일행, 단일컬럼 서브 쿼리
--사원 테이블에서 급여가 제일 많은 사원의 정보
select * from employees where salary = (select max(salary) from employees);
--사원 테이블에서 평균 급여보다 급여가 많은 사원들을 출력
select * from employees where salary > (select round(avg(salary)) from employees);
select round(avg(salary)) from employees;

--복수행, 단일컬럼
--60번 부서 사원들과 같은 급여를 받는 사원들 출력
select * from employees
where salary in(select salary from employees where department_id = 60);

--60번 부서 사원들의 급여 중 가장 작은 급여보다 큰(이상) 급여를 받는 사원들 출력(any)
select * from employees
where salary > any(select salary from employees where department_id = 60);

--60번 부서 사원들의 급여 중 가장 작은 급여보다 작은(이하) 급여를 받는 사원들 출력
select * from employees
where salary < all(select salary from employees where department_id = 60);

--사원 테이블에서 업무별로 최소 급여를 받는 사원의 정보를 사원번호, 이름, 업무, 입사일자, 급여, 부서번호를 출력
select first_name||' '||last_name,job_id,hire_date,salary,department_id
from employees
where salary in (select min(salary) from employees group by job_id);

--사원 테이블에서 업무별로 평균 급여가 14000이상인 사원의 최소급여보다 많은 급여를 받는 사원의 정보를
--사원번호, 이름, 업무, 입사일자, 급여, 부서번호를 출력하라
select employee_id, first_name||' '||last_name, job_id, salary, department_id
from employees where salary > any(select avg(salary) from employees where salary>=14000 group by job_id);

--사원테이블에서 업무별로 평균 급여가 14000이상인 사원 최대 급여보다 적은 급여를 받는 사원의 정보를
--사원번호, 이름,업무,입사일자,급여,부서번호를 출력하라
select employee_id, first_name||' '||last_name, job_id, salary, department_id
from employees where salary < any(select avg(salary) from employees where salary>=14000 group by job_id);

--exist: 결과 내용과 상관업이 결과 있느냐 없느냐만
--사원테이블에 존재하는 부서코드와 부서 이름을 출력
select department_id, department_name from departments
where exists (select distinct(department_id) from employees
where departments.department_id = employees.department_id);

--사원 테이블에서 부하직원이 없는 사원의 모든 정보를 exists를 이용하여 작성하라.
select employee_id, first_name
from employees e1
where not exists(select employee_id from employees e2 where e1.employee_id = e2.manager_id);

----------------------------------------------------------------------------------
--복수행, 복수컬럼
--업무별로 최소 급여를 받는 사원의 정보를 사원번호, 이름, 업무, 급여, 부서번호를 출력
select employee_id, first_name||' '||last_name "Name", job_id,salary,department_id
from employees 
where ( job_id,salary) in(select job_id, min(salary) from employees group by job_id);

--------------------------------------------------------------------------------
--상호관련 sub-query
--메인절에서 사용한 테이블을 서브절에서 재사용>> .로 연결
--테이블에서 적어도 한명의 사원으로부터보고를 받을 수 있는 사원의 정보를 사원번호, 이름, 업무, 입사일자, 급여를 출력
select employee_id, first_name||' '||last_name "Name", job_id,salary,department_id
from employees e
where exists(select * from employees where manager_id = e.employee_id);
--소속부서의 평균급여보다 많은 급여를 받는 사원을 출력
select * from employees e
where salary > (select avg(salary)from employees where department_id = e.department_id);

--------------------------------------------------------------------------------
--update
--1.'David Austin'의 직업을 'John Chen'인 사람의 직업과 같은 직업으로 변경
select job_id from employees where first_name = 'John' and last_name='Chen';

update employees set job_id =(select job_id from employees where first_name = 'John' and last_name='Chen')
where first_name='David' and last_name='Austin';

select job_id from employees where first_name='David' and last_name='Austin';
--------------------------------------------------------------------------------
--delete
--최소 급여를 받는 삭제들을 삭제하라
select min(salary)  from employees;
select employee_id, first_name||' '||last_name, salary from employees
where salary = (select min(salary)  from employees);

delete from employees where salary=(select min(salary)  from employees);

--------------------------------------------------------------------------------
--Q1. 입사번호(사원ID)가 103인 사원과 같은 직업(job_id)을 가진 사원들의 정보를 출력하시오.
select job_id from employees where employee_id = 103;

select employee_id 사원번호, first_name||' '||last_name 이름,job_id 직업 from employees 
where job_id=(select job_id from employees where employee_id = 103);

--Q2.Diana Lorentz와 같은 부서의 사원들의 정보를 출력하시오.
select department_id from employees where first_name='Diana' and last_name = 'Lorentz';

select employee_id 사원번호, first_name||' '||last_name 이름,department_id 부서번호  from employees
where department_id = (select department_id from employees where first_name='Diana' and last_name = 'Lorentz');

--Q3.사원 테이블에서 110번 부서의 최고 급여를 받는 사원보다 많은 급여를 받는 사원의 정보를 
--사원번호, 이름, 업무, 입사일자, 급여, 부서번호를 출력하여라.
select max(salary) from employees where department_id = 110;

select employee_id 사원번호, first_name||' '||last_name 이름, job_id 업무, hire_date 입사일자,
salary 급여, department_id 부서번호 from employees
where salary > (select max(salary) from employees where department_id = 110);

--------------------------------------------------------------------------------
--Q1.사원과 부서 table을 join하여 부서ID, 부서명, 이름, 급여를 출력하라.(ANSI JOIN사용)
select d.department_id, d.department_name, e.first_name||' '||e.last_name, e.salary
from employees e join departments d
on e.department_id = d.department_id;

--Q2.이름이 'Steven'인 사원의 부서명을 출력하라
select department_name 
from departments 
where department_id in(select department_id from employees where first_name = 'Steven');


--Q3.부서 테이블에 있는 모든 부서를 출력하고, 사원 테이블에 있는 data와 join하여 
--모든 사원의 이름, 부서ID,부서명, 급여를 출력하라
select department_name from departments;

select first_name||' '||last_name,d.department_id,d.department_name, e.salary
from employees e left outer join departments d
on e.department_id = d.department_id;

--Q4.사원 테이블에 있는 모든 employee_id와 manager_id를 이용하여 서로의 관계를 다음과 같이 출력하라.
--예)Neena의 매니저는 Steven이다. 단 매니저가 없으면 없음으로 표시할 것

select e1.first_name ||'의 매니저는 '||nvl(e2.first_name,'없음')||'이다.'
from employees e1 left outer join employees e2
on e1.manager_id = e2.employee_id;

--Q5-1.'Neena'의 직무와 같은 사원이름, 부서 ID, 급여, 직무를 출력하라.
select first_name||' '||last_name, department_id, salary, job_id
from employees 
where job_id = (select job_id from employees where first_name='Neena');

--Q5-2.'Neena'의 직무와 같은 사원이름, 부서명, 급여, 직무를 출력하라.

select e.first_name||' '||e.last_name, d.department_name, e.salary, e.job_id
from employees e join departments d
on e.department_id = d.department_id
where job_id = (select job_id from employees where first_name='Neena');

--Q6.'John'가 속해있는 부서의 모든 사람의 부서번호, 사원ID, 이름, 입사일, 급여를 출력하라.
select department_id, employee_id, first_name||' '||last_name, hire_date, salary
from employees
where department_id in(select department_id from employees where first_name = 'John');

--Q7-1.전체 사원의 평균임금보다 많은 사원의 사원번호, 이름, 부서명, 입사일, 급여를 출력하라
select e.employee_id, e.first_name||' '||e.last_name, d.department_name, e.hire_date, e.salary
from employees e join departments d
on e.department_id= d.department_id
and (salary>(select avg(salary)from employees));

--Q7-2.전체 사원의 평균 임금보다 많은 사원의 사원번호,이름,부서명,입사일,지역명,급여를 출력하라.
select e.employee_id, e.first_name||' '||e.last_name, d.department_name,l.city, e.hire_date, e.salary
from employees e join departments d
on e.department_id= d.department_id
join locations l on d.location_id = l.location_id 
and (salary>(select avg(salary)from employees));

--Q8.10번 부서 사람들 중에 20번 주서의 사원과 같은 업무를 하는 사원의 
--사원번호, 업무, 이름, 부서명,입사일, 지역명을 출력
select e.employee_id, e.job_id, e.first_name||' '||e.last_name, d.department_name, e.hire_date, l.city
from employees e join departments d on e.department_id = d.department_id
join locations l on d.location_id = l.location_id
and e.department_id = 10
and job_id in (select job_id from employees where department_id = 20);

--Q9.10번 부서 중에서 30번 부서에는 없는 업무를 하는 사원의 
--사원번호, 업무, 이름, 부서명, 입사일, 지역을 출력
select e.employee_id, e.job_id, e.first_name||' '||e.last_name, d.department_name, e.hire_date, l.city
from employees e join departments d on e.department_id = d.department_id
join locations l on d.location_id = l.location_id
and e.department_id = 10
and job_id not in (select job_id from employees where department_id = 30);

--Q10.10번 부서와 같은 일을 하는 사원의 사원의 
--사원번호, 업무, 이름, 부서번호, 부서명, 지역, 급여를 출력
select e.employee_id , e.job_id, e.first_name||' '||e.last_name, e.department_id,
d.department_name, l.city,e.salary 
from employees e join departments d on e.department_id = d.department_id
join locations l on d. location_id = l.location_id
and job_id in (select job_id from employees where department_id = 10);

--Q11.'Neena' 혹은 'David'의 급여와 같은 사원의 사원번호, 이름, 급여를 출력하라
select employee_id , first_name||' '||last_name, salary
from employees
where salary in (select salary from employees 
where first_name = 'Neena' or first_name = 'David');

--Q12. 급여가 30번 부서의 최고 급여보다 높은 사원의 사원번호, 이름, 급여를 출력하라.
select employee_id, first_name||' '||last_name, salary
from employees
where salary > (select max(salary) from employees where department_id = 30);


select employee_id, first_name||' '||last_name, salary
from employees
where salary > all(select salary from employees where department_id = 30);

--Q13.급여가 30번 부서의 최저 급여보다 낮은 사원의 사원번호, 이름, 급여를 출력하라.
select employee_id, first_name||' '||last_name, salary
from employees
where salary < (select min(salary) from employees where department_id = 30);

select employee_id, first_name||' '||last_name, salary
from employees
where salary < all(select salary from employees where department_id = 30);

--Q14.급여가 90번 부서의 최저 급여보다 높은 사원의 사원번호, 이름, 급여 출력
select employee_id,first_name||' '||last_name, salary
from employees
where salary > (select min(salary) from employees where department_id =90);

select employee_id,first_name||' '||last_name, salary
from employees
where salary > any(select salary from employees where department_id =90);

--Q15.급여가 90번 부서의 최고 급여보다 낮은 사원의 사원번호, 이름, 급여를 출력하라.
select employee_id,first_name||' '||last_name, salary
from employees
where salary < (select max(salary) from employees where department_id =90);

select employee_id,first_name||' '||last_name, salary
from employees
where salary < any(select salary from employees where department_id =90);

--Q16.사원 이름과 부서명을 출력하라.(단, 뷰나 조인을 사용하지 말고 서브쿼리를 쓸 것)
select e.first_name||' '||e.last_name 사원이름,
(select d.department_name from departments d where e.department_id = d.department_id) 부서명
from employees e;

--------------------------------------------------------------------------------
select * from employees;
create table emp as select * from employees;        --테이블 복사 (데이터 포함)

select * from departments;
create table dpt as select * from departments where 1=2;        --데이터 없이 구조만 가져옴

select * from jobs;
create table js as select * from jobs;

select * from locations;
create table loc as select * from locations;

--------------------------------------------------------------------------------
CREATE TABLE TEST_TCL AS SELECT * FROM DEPARTMENTS;
SELECT * FROM TEST_TCL;
COMMIT; --트랜잭션시작        --(DDL은 발생하면 자동 커밋)
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

--or replace: view는 계속 재정의를 하기 때문에 붙이는 것이 좋음
create or replace noforce view test_view_emp 
as select employee_id, first_name,salary 
from employees with read only;

select * from test_view_emp;
select * from tab;

drop view test_view_emp;

--join으로 view 생성
CREATE OR REPLACE VIEW TEST_JOIN_VIEW
AS SELECT 
    e.first_name, d.department_name 

FROM 
   employees e join departments d
    on d.department_id=e.department_id;

select * from test_join_view;

--------------------------------------------------------------------------------
--rownum, rowid
--10개행씩 잘라서 검색되도록 dql을 작성
select * from 
(select rownum rnum, employee_id, first_name,salary from employees order by employee_id asc)
where rnum >= 1 and rnum <=10;

select * from 
(select rownum rnum, employee_id, first_name,salary from employees order by employee_id asc)
where rnum >= 11 and rnum <=20;
--실행순서: from > where > select

select * from 
(select rownum rnum, employee_id, first_name,salary from employees order by employee_id asc)
where rnum between 21 and 30 ;

--------------------------------------------------------------------------------
--소계: rollup(바로바로 보여줌), cube(마지막에 모아서 한번 더 보여줌)
select department_id, job_id, sum(salary) from employees
where department_id <=40 
group by rollup(department_id , job_id)
order by department_id;

select department_id, job_id, sum(salary) from employees
where department_id <=40 
group by cube(department_id , job_id)
order by department_id;

--------------------------------------------------------------------------------
--서브쿼리 응용: with
with e as
(select employee_id, manager_id,salary,last_name from employees where department_id = 50),
d as
(select avg(salary) avg_salary from employees where department_id = 50)
select e.employee_id, e.last_name,e.salary
from e,d
where e.salary < d.avg_salary;

--부서별 평균 급여액보다 부서별 급여 합계액이 큰 부서의 명단을 추출
--1.부서별 급여 합계
select department_name, sum(salary) sum_sal
from employees e, departments d
where e.department_id = d.department_id 
group by department_name;

--2.부서별 전체 평균 = 전사원 급여 총계 나누기 부서 수
select dt.sum_amt/dc.cnt 부서평균
from (select sum(e.salary) sum_amt from employees e, departments d
where e.department_id = d.department_id) dt,
(select count(*) cnt from departments d
where d.department_id in(select department_id from employees)) dc;

--3-1.최종 일반 서브 쿼리
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

--3-2. 최종 with 서브쿼리
with dept_costs as(select department_name, sum(salary) sum_sal
from employees e, departments d
where e.department_id = d.department_id 
group by department_name),
avg_cost as(select sum(sum_sal)/count(*) avg from dept_costs)
select dept_costs.*
from dept_costs, avg_cost
where dept_costs.sum_sal > avg_cost.avg;
