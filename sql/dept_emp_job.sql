--------------------------------------------------------------------------
--0.프로젝트명 java21jdbc_hr, 패키지명 test.com.emp, test.com.dept,test.com.job,test.com.main
--1.테이블 복제, employees-emp, departments-dept, jobs-job 원본데이터 유지
--2.제약조건 설정(pk,fk)
--3.객체 생성(EmpVO,DeptVO,JobVO)
--4.각 객체에 따른 CRUD 처리객체(~~DAO<--~~DAOimpl)
--5.jdbc 연동해서 각 메인클래스(EmpMain,DeptMain,JobMain)에서 입출력처리 완성하기.
drop table dept cascade constraints;
drop table emp cascade constraints;
drop table job cascade constraints;

create table dept as select * from departments;
create table emp as select * from employees;
create table job as select * from jobs;

ALTER TABLE DEPT ADD CONSTRAINT DEPT_UK1 UNIQUE (DEPARTMENT_ID)ENABLE;
ALTER TABLE JOB MODIFY (JOB_ID NOT NULL);
ALTER TABLE JOB ADD CONSTRAINT JOB_PK PRIMARY KEY (JOB_ID)ENABLE;
ALTER TABLE EMP ADD CONSTRAINT EMP_FK1 
FOREIGN KEY(DEPARTMENT_ID )REFERENCES DEPT(DEPARTMENT_ID )ON DELETE SET NULL ENABLE;

ALTER TABLE EMP ADD CONSTRAINT EMP_FK2 
FOREIGN KEY(JOB_ID )REFERENCES JOB(JOB_ID )ON DELETE SET NULL ENABLE;

select * from dept;
select * from job;

commit;