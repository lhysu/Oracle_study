--학교, 학과, 전공, 학생 한번에 데이터 생성

drop table school cascade constraints;
create table school(
    num number primary key,
    school_name varchar(20) not null,
    location varchar2(20) not null,
    total_student number not null,
    school_id number not null
    
);
drop sequence school_seq;
create sequence school_seq;
exec pc_school_insert;
---------------------------end school-------------------------------
drop table department cascade constraints;
create table department(
    num number primary key,
    department_name varchar2(20) not null,
    school_id number not null,
    tel varchar2(20) default '010',
    email varchar2(20) not null

);
drop sequence department_seq;
create sequence department_seq;
exec pc_department_insert;
------------------------end department--------------------------------
drop table student;
CREATE TABLE STUDENT 
(
  NUM NUMBER NOT NULL 
, NAME VARCHAR2(20) NOT NULL
, MAJOR_NAME VARCHAR2(20) NOT NULL
, GRADE VARCHAR2(20) NOT NULL
, DEPARTMENT_NAME VARCHAR2(20) NOT NULL
, STUDENT_ID NUMBER NOT NULL
, CONSTRAINT STUDENT_PK PRIMARY KEY 
  (
    NUM 
  )
  ENABLE 
);
drop sequence student_seq;
create sequence student_seq;
exec pc_student_insert;

------------------------end student------------------------------------
drop table major;
CREATE TABLE MAJOR 
(
  NUM NUMBER NOT NULL 
, MAJOR_NAME VARCHAR2(20) NOT NULL
, SUBJECT VARCHAR2(20) NOT NULL
, PROFESSOR VARCHAR2(20) NOT NULL
, CONSTRAINT MAJOR_PK PRIMARY KEY 
  (
    NUM 
  )
  ENABLE 
);
drop sequence major_seq;
create sequence major_seq;
exec pc_major_insert;
---------------------------end major---------------------------------
--제약조건
ALTER TABLE SCHOOL ADD CONSTRAINT SCHOOL_UK1 UNIQUE (SCHOOL_ID )ENABLE;

ALTER TABLE DEPARTMENT ADD CONSTRAINT DEPARTMENT_UK1 UNIQUE (DEPARTMENT_NAME)ENABLE;

ALTER TABLE DEPARTMENT ADD CONSTRAINT DEPARTMENT_FK1 
FOREIGN KEY(SCHOOL_ID )REFERENCES SCHOOL(SCHOOL_ID )ON DELETE CASCADE ENABLE;

ALTER TABLE MAJOR ADD CONSTRAINT MAJOR_UK1 UNIQUE (MAJOR_NAME )ENABLE;

ALTER TABLE STUDENT ADD CONSTRAINT STUDENT_FK1 
FOREIGN KEY(DEPARTMENT_NAME )REFERENCES DEPARTMENT(DEPARTMENT_NAME )ON DELETE SET NULL ENABLE;

ALTER TABLE STUDENT ADD CONSTRAINT STUDENT_FK2
FOREIGN KEY(MAJOR_NAME )REFERENCES MAJOR(MAJOR_NAME )ON DELETE SET NULL ENABLE;


select * from school;
select * from department;
select * from student;
select * from major;

