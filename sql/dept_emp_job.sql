--------------------------------------------------------------------------
--0.������Ʈ�� java21jdbc_hr, ��Ű���� test.com.emp, test.com.dept,test.com.job,test.com.main
--1.���̺� ����, employees-emp, departments-dept, jobs-job ���������� ����
--2.�������� ����(pk,fk)
--3.��ü ����(EmpVO,DeptVO,JobVO)
--4.�� ��ü�� ���� CRUD ó����ü(~~DAO<--~~DAOimpl)
--5.jdbc �����ؼ� �� ����Ŭ����(EmpMain,DeptMain,JobMain)���� �����ó�� �ϼ��ϱ�.
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