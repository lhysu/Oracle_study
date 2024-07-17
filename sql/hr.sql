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





