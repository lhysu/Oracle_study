create table test2(fname varchar2(20));     --test2 table ����

insert into test2 values('S1234');
insert into test2 values('1234S_1234');
insert into test2 values('$S_1234');
insert into test2 values('sssS_1234');
insert into test2 values('THE X\_Y');
insert into test2 values('THE1 X_Y');
insert into test2 values('THE X\&Y');       --&: ��ü���� �Է¹���
insert into test2 values('THE X&Y');
insert into test2 values('THE2 X_Y');


select fname from test2 where fname like '%S\_%' escape '\';

drop table "JAVA"."TEST2";

create table test(
    num number, 
    name varchar2(20)

);
insert into test(num,name) values(1,'kim1');
insert into test(num,name) values(2,'kim2');
insert into test(num,name) values(3,'kim3');
insert into test(num,name) values(4,'kim3');
insert into test(num,name) values(5,'kim4');

select * from test;

update test set name = 'lee' where num = 1;
update test set name = 'lee';   --������ ������ ��� ���� ������Ʈ��
update test set name = 'lee' where num >3;
update test set name = 'kim33' where name ='lee';

commit;         --Ŀ�Ը��: ����(TCL)
rollback;       --�ѹ���: ���� �ֱٿ� Ŀ���� ���·� �ǵ��ư�(TCL)

delete from test where num = 4;
delete from test;       --���� ����

--------------------------------------------------------------------------------
--DDL
--create
create table sample1(
    num number primary key,
    fname varchar2(20),
    lname varchar2(20) not null,
    tel varchar2(20) not null,
    addr varchar2(100),
    regdate date default sysdate
);
insert into sample1(num, fname, lname, tel,addr,regdate) values(1,'aaa','bbb','010','ccc','24/07/19');
    
drop table sample1;
  
CREATE TABLE SAMPLE1 
(
  NUM NUMBER NOT NULL 
, FNAME VARCHAR2(20) DEFAULT 'gil dong' 
, LNAME VARCHAR2(20) NOT NULL 
, TEL VARCHAR2(20) NOT NULL 
, ADDR VARCHAR2(100) 
, REGDATE DATE DEFAULT sysdate 
, CONSTRAINT SAMPLE1_PK PRIMARY KEY 
  (
    NUM 
  )
  ENABLE 
);

create sequence sample1_seq;
drop sequence "JAVA"."SAMPLE1_SEQ";


select * from hr.employees;     --������ ��� ���� �Ұ�

create table sample2(num number);
alter table sample2 add(fname varchar2(20));
alter table sample2 add(lname varchar2(20));
alter table sample2 add(tel varchar2(20));
alter table sample2 add(addr varchar2(100));
alter table sample2 add(memo varchar2(100));

alter table sample2 modify (memo date);
alter table sample2 modify (num number primary key);
alter table sample2 modify (memo date default sysdate);

alter table sample2 rename column memo to regdate;

alter table sample2 drop column addr;
alter table sample2 add (addr varchar2(100));

alter table sample2 add (addr2 varchar2(100));
alter table sample2 add (addr3 varchar2(100));
alter table sample2 add (addr4 varchar2(100));
alter table sample2 set unused column addr2;
alter table sample2 set unused (addr3, addr4);
alter table sample2 drop unused columns;
--------------------------------------------------------------------------------
--alter
create table sample3 (num number, join_id varchar2(20));
create table sample4 (join_id varchar2(20) primary key);

alter table sample3 add constraint sample_pk primary key(num);
alter table sample3 drop constraint sample_pk;

alter table sample3 add constraint sample_fk_join_id
foreign key(join_id) references sample4(join_id);
alter table sample3 drop constraint sample_fk_join_id;

alter table sample3 disable constraint sample_fk_join_id;
alter table sample3 enable constraint sample_fk_join_id;
alter table sample3 disable primary key cascade;
alter table sample3 enable primary key;
alter table sample3 read only;
alter table sample3 read write;

drop table sample3;
drop table sample4 cascade constraints;
drop table sample4 cascade constraints purge;

--DML�� TCL(�ѹ�)����, DDL�� TCL(�ѹ�) �Ұ�




--------------------------------------------------------------------------------
--��� ��ȣ�� pk ����
--�� ���̺� ��ȣ�� ���� ������ ���� ����
-- ��� ���̺� person
--��ȣ, �̸�, ����, ����

drop table person;
create table person(
num number primary key,
name varchar2(20),
age number,
birthday date
);
drop sequence seq_person;
create sequence seq_person;

select * from person;
select count(*) cnt from person;

insert into person(num,name,age,birthday)
values(seq_person.nextval,'kim',11,'2024-11-11');

update person set name='lee', age=22, birthday='2024-12-12'
where num=2;

delete from person where num >= 3 and num < 10;


-- ȸ�����̺�member
-- ��ȣ, ���̵�,���,�̸� ,����
drop table member;
CREATE TABLE MEMBER 
(
  NUM NUMBER NOT NULL 
, ID VARCHAR2(20) NOT NULL 
, PW VARCHAR2(20) NOT NULL 
, NAME VARCHAR2(20) NOT NULL 
, TEL VARCHAR2(20) NOT NULL 
, CONSTRAINT MEMBER_PK PRIMARY KEY 
  (
    NUM 
  )
  ENABLE 
);
drop sequence seq_member;
create sequence seq_member;

select * from member;
select count(*) cnt from member;

insert into member(num,id,pw,name,tel)
values(seq_member.nextval,'admin','hi1234','kim','010');

update member set id='guest',pw='hi2345',name='lee',tel='012'
where num=5;

delete from member where num<10 and num>5;


-- �Խñ����̺� board
-- ��ȣ, ����, ����, �ۼ���,�ۼ�����
drop table board;
CREATE TABLE board 
(
  NUM NUMBER NOT NULL 
, title VARCHAR2(50) NOT NULL 
, content VARCHAR2(2000) 
, writer VARCHAR2(20) NOT NULL 
, wdate date default sysdate
, CONSTRAINT BOARD_PK PRIMARY KEY 
  (
    NUM 
  )
  ENABLE 
);
drop sequence seq_board;
create sequence seq_board;

select * from board;
select count(*) cnt from board;

insert into board(num,title,content,writer,wdate)
values(seq_board.nextval,'aaaa','bbbb','cccc','2024-07-19');

update board set title='oracle',content='db',writer='kim',wdate=sysdate
where num = 2;
delete from board where num>5;

-- ��ǰ���̺� product
-- ��ȣ,��ǰ��,��,����,����pcount
drop table product;
CREATE TABLE product 
(
  NUM NUMBER NOT NULL 
, PNAME VARCHAR2(50) NOT NULL 
, MODEL VARCHAR2(2000) NOT NULL 
, PRICE NUMBER NOT NULL 
, COUNT NUMBER default 0
, CONSTRAINT PRODUCT_PK PRIMARY KEY 
  (
    NUM 
  )
  ENABLE 
);
drop sequence seq_product;
create sequence seq_product;

select * from product;
select count(*)cnt from product;

insert into product(num,pname,model,price,count)
values(seq_product.nextval,'aaa','bbb',1000,11);

update product set pname='phone',model='galaxy',price=100,count=count-1
where num <3;

delete from product where num>5 and num<=10;
--------------------------------------------------------------------------------

--�б� ���̺�: ������ �÷�(pk�� ��ȣ ����) 5�÷� (�����ʹ� 10���྿�߰�)
create table school(
    num number primary key,
    school_name varchar(20) not null,
    location varchar2(20) not null,
    total_student number not null,
    school_id number not null
    
);

create sequence school_seq;

drop table school;
drop sequence school_seq;

insert into school(num, school_name, location, total_student,school_id)
values(school_seq.nextval,'aaa','Seoul',1000,11111);

select * from school;
select count(*) cnt from school;

update school set school_name='bbb',location='Incheon',total_student=800,school_id=22222
where num=2;

delete from school where num=4;

--�а� ���̺�: ������ �÷�(pk�� ��ȣ ����) 5�÷� (�����ʹ� 10���྿�߰�)
create table department(
    num number primary key,
    department_name varchar2(20) not null,
    school_id number not null,
    tel varchar2(20) default '010',
    email varchar2(20) not null

);
create sequence department_seq;

drop table department;
drop sequence department_seq;

insert into department(num, department_name,school_id,tel,email)
values(department_seq.nextval,'dpt1',11111,'010','aaa@aaa.com');

select * from department;
select count(*) cnt from department;

update department 
set department_name = 'dpt2',school_id=11111, tel='010', email='bbb@bbb.com'
where num = 2;

delete from department where num>5;


--�л� ���̺�: ������ �÷�(pk�� ��ȣ ����) 5�÷� (�����ʹ� 10���྿�߰�)
CREATE TABLE STUDENT 
(
  NUM NUMBER NOT NULL 
, NAME VARCHAR2(20) NOT NULL
, MAJOR_NAME VARCHAR2(20) NOT NULL
, GRADE VARCHAR2(20) NOT NULL
, STUDENT_ID NUMBER NOT NULL
, CONSTRAINT STUDENT_PK PRIMARY KEY 
  (
    NUM 
  )
  ENABLE 
);
create sequence student_seq;

drop table student;
drop sequence student_seq;

insert into student(num,name,major_name,grade,student_id)
values(student_seq.nextval,'kim','major1','A',12345);

select * from student;
select count(*) cnt from student;

update student set name='lee',major_name='major2',grade='B',student_id=23456
where num=5;

delete from student where num <= 3;


--���� ���̺�: ������ �÷�(pk�� ��ȣ ����) 5�÷� (�����ʹ� 10���྿�߰�)
CREATE TABLE MAJOR 
(
  NUM NUMBER NOT NULL 
, MAJOR_NAME VARCHAR2(20) NOT NULL
, DEPARTMENT_NAME VARCHAR2(20) NOT NULL
, SUBJECT VARCHAR2(20) NOT NULL
, PROFESSOR VARCHAR2(20) NOT NULL
, CONSTRAINT MAJOR_PK PRIMARY KEY 
  (
    NUM 
  )
  ENABLE 
);
create sequence major_seq;

drop table major;
drop sequence major_seq;

insert into major(num,major_name,department_name,subject,professor)
values(major_seq.nextval,'major1','dpt1','subject1','han');

select * from major;
select count(*) cnt from major;

update major 
set major_name='major1',department_name='dpt1',subject='subject1',professor='choi'
where num<3;

delete from major where num>3 and num<6;

--------------------------------------------------------------------------------

select dbms_random.string('A',19) from dual;
select dbms_random.value() from dual;
select dbms_random.value()*10 from dual;
select floor(dbms_random.value()*10)from daul;
select floor(dbms_random.value()*45)+1 from dual;


--begin 
--    for i in 1..50 loop
--    insert into
--    sample1( num,fname,lname,tel,addr )
--    values( sample1_seq.nextval,dbms_random.string('A',19),
--    dbms_random.string('Q',19),'010-0000-0000','seoul' );
--    end loop;
--    commit;
--end;        --���� ��Ȯ�ϰ� �巡���ؼ� �����ؾ� ��

select count(*) from sample1;

insert into
sample1( num,
fname,
lname,
tel,
addr )
values( sample1_seq.nextval,
dbms_random.string('A',19),         --���� ����
dbms_random.string('Q',19),
'010-0000-0000',
'seoul' );

--�������� ������ �����ϱ� ������ ���̺��� ���������Ͱ� ������� �̾ �����ȴ�.
--���̺��� (1,2,3,4)�� �����ǰ� ���� insert�ϸ� 5���� ����
--�ٽ� 1������ �����ϰ� �ʹٸ� �������� ������ �� �����


exec PROCEDURE1;

update sample1 set fname='yangssem' where num=1;
update sample1 set fname = 'yangssem2'where fname ='yangssem';
update sample1 set fname = 'yangssem3', lname = 'oracle',
tel='010-0000-9494', addr='busan',regdate='24/12/25'
where fname = 'yangssem2';
update sample1 set num = 500001 where fname='yangssem3';

--------------------------------------------------------------------------------
--merge: ���̺� ������ ���� 
--�� ���̺��� �����Ϳ� �ߺ��� ������ update, �ߺ��� ������ insert >> num�� ��������

create table TEST1 (pnum number,p2num number,pcount number,price number);
insert into test1 values(1001,2001,100,5000);
insert into test1 values(1002,2002,100,3000);
insert into test1 values(1003,2003,100,2000);
insert into test1 values(1004,2003,100,2000);

create table TEST2 (pnum number,p2num number,pcount number,price number);
insert into test2 values(6001,7001,300,7000);
insert into test2 values(6002,7002,300,8000);
insert into test2 values(6003,7003,300,9000);
create table TEST_merge (pnum number,p2num number,pcount number,price number);

--test_merge + test1
merge into test_merge tm using test1 t1
on (tm.pnum=t1.pnum)
when matched then 
update set tm.p2num=t1.p2num
when not matched then 
insert values(t1.pnum,t1.p2num,t1.pcount,t1.price);

--test_merge+test2
MERGE INTO test_merge tm USING test2 t2
ON (tm.pnum=t2.pnum)
WHEN MATCHED THEN
UPDATE SET tm.p2num=t2.p2num
WHEN NOT MATCHED THEN
INSERT VALUES(t2.pnum, t2.p2num, t2.pcount, t2.price);

delete from test2;
drop table test1;
select * from test2;
--DML �Ŀ� Ŀ������ �ʰ� DDL�� �����ϸ� ���� DML�� �ڵ� Ŀ��

--------------------------------------------------------------------------------
--�ǽ�
CREATE TABLE TEST_BOARD 
(
  WNUM NUMBER NOT NULL 
, WRITER VARCHAR2(20) NOT NULL 
, TITLE VARCHAR2(20) NOT NULL 
, CON VARCHAR2(20) NOT NULL 
, WDATE DATE DEFAULT sysdate NOT NULL 
, VCOUNT NUMBER DEFAULT 0 
, CONSTRAINT TEST_BOARD_PK PRIMARY KEY 
  (
    WNUM 
  )
  ENABLE 
);

create sequence seq_test_board;
drop sequence seq_test_board;

--begin
--    for i in 1..10 loop
--    insert into test_board(wnum,writer,title,con,wdate,vcount)
--    values(seq_test_board.nextval,'kim','oracle','aaa',
--    '2024/07/22',1);
--    end loop;
--    commit;
--end;

delete from test_board where wnum = 4;
insert into test_board(wnum,writer,title,con,wdate,vcount)
    values(seq_test_board.nextval,'yangssem','oracle','aaa',
    '2024/07/22',1);

update test_board set con='��ſ� oracle'  where writer='yangssem';

select * from test_board where title like '%oracle%' or con like'%oracle%';

alter table test_board add (comm_ch varchar2(20));
truncate table test_board;
drop table test_board;

--------------------------------------------------------------------------------
CREATE TABLE test_dept(
deptno NUMBER PRIMARY KEY,
dname VARCHAR2(20) DEFAULT '���ߺ�',
loc CHAR(1) CHECK(loc IN('1', '2')));

CREATE TABLE test_emp(
no NUMBER(4) PRIMARY KEY,
name VARCHAR2(20) NOT NULL,
loc VARCHAR2(4) CHECK(loc IN('����', '�λ�')),
jumin CHAR(13) UNIQUE,
deptno NUMBER REFERENCES test_dept(deptno) );

--------------------------------------------------------------------------------
CREATE TABLE TEST_BOARD_COMM(
COMM_ID NUMBER,
WRITER VARCHAR2(20) CONSTRAINT test_b_com_writer_nn NOT NULL,
TITLE VARCHAR2(400) CONSTRAINT test_b_com_title_nn NOT NULL,
CON VARCHAR2(2000) CONSTRAINT test_b_com_con_nn NOT NULL,
WDATE DATE default SYSDATE CONSTRAINT test_b_com_wdate_nn NOT NULL,
wnum NUMBER,
VCOUNT NUMBER,
CONSTRAINT test_b_com_id_wnum_pk PRIMARY KEY (COMM_ID) ,
CONSTRAINT test_b_com_wnum_fk FOREIGN KEY (wnum)
REFERENCES TEST_BOARD(wnum)
);
select constraint_name from user_constraints;
--------------------------------------------------------------------------------
select rowid,rownum,num,title,content,writer, wdate from board;


drop table test_tab;
create table test_tab(
num NUMBER(4) ,
fname VARCHAR2(10),
loc VARCHAR2(10),
jumin CHAR(13),
deptno NUMBER
);
drop sequence test_tab_seq;
create sequence test_tab_seq;

insert into test_tab
values(test_tab_seq.nextval,'yangssem','����','1234561234567',100);

CREATE INDEX TEST_TAB_IDX ON TEST_TAB (FNAME);  --pk�� �����Ǿ����� �ε��� �ڵ� ����
select index_name from user_indexes;
drop index test_tab_idx;

--begin
--for i in 1..1000 loop
--insert into test_tab
--values(test_tab_seq.nextval,
--SYS.dbms_random.string('A',9),
--'����',
--'1234561234567',
--100);
--end loop;
--commit;
--End;

select num,fname from test_tab where fname>'0';


--------------------------------------------------------------------------------
drop view test_view;
create or replace view test_view(wnum,writer,title) as
select wnum,writer,title from test_board
where wnum in(20,30) with check option;

select * from test_view;

insert into test_view(wnum,writer,title) values(10,'admin','yyy'); --TEST_BOARD�� �Է¾ȵ�
insert into test_view(wnum,writer,title) values(20,'admin','yyy');
insert into test_view(wnum,writer,title) values(30,'admin','yyy');
--------------------------------------------------------------------------------
drop TABLE test4_dept CASCADE CONSTRAINTS PURGE;

CREATE TABLE test4_dept(
deptno NUMBER(2),
dname VARCHAR2(15) default '���ߺ�',
loc_id CHAR(1),
CONSTRAINT test4_dept_deptno_pk PRIMARY KEY (deptno),
CONSTRAINT test4_dept_loc_ck CHECK(loc_id IN('1', '2'))
);

drop TABLE test4_emp CASCADE CONSTRAINTS PURGE;
CREATE TABLE test4_emp(
empno NUMBER(4),
ename VARCHAR2(10) CONSTRAINT test4_emp_ename_nn NOT NULL,
loc_name VARCHAR2(6),
jumin CHAR(13),
deptno NUMBER(2),
sal NUMBER,
CONSTRAINT test4_emp_no_pk PRIMARY KEY (empno),
CONSTRAINT test4_emp_jumin_uq UNIQUE ( jumin),
CONSTRAINT test4_emp_deptno_fk FOREIGN KEY (deptno) REFERENCES test4_dept(deptno)
);

INSERT INTO test4_dept VALUES(10, '������', '1');
INSERT INTO test4_dept VALUES(20, '��ȹ��', '1');
INSERT INTO test4_dept VALUES(30, 'ȫ����', '2');
INSERT INTO test4_dept VALUES(40, '������', '2');
INSERT INTO test4_emp VALUES(1001, 'ȫ�浿', '����', '1234561234567', 10,3000);
INSERT INTO test4_emp VALUES(1002, '�ֱ浿', '����', '1234561234568', 10,4000);
INSERT INTO test4_emp VALUES(1003, '�ڱ浿', '���', '1234561234569', 20,5000);
INSERT INTO test4_emp VALUES(1004, '��浿', '���', '1234561234571', 30,6000);
INSERT INTO test4_emp VALUES(1005, '�ѱ浿', '����', '1234561234572', 40,7000);
INSERT INTO test4_emp VALUES(1006, '���浿', '����', '1234561234573', 40,8000);
Commit;

--1-1.�μ� ID�� 10���� ��������͸� ���� �̸��� test4_emp_view�� �並 ������
--empno,ename �ΰ� �÷������� ���� ��, �� �˻�, �䱸�� Ȯ���϶�.
select empno, ename from test4_emp where deptno = 10;

CREATE VIEW TEST4_EMP_VIEW
AS SELECT 
    empno, ename
FROM 
    test4_emp
    where deptno=10;

select * from test4_emp_view;

drop view test4_emp_view;

--1-2.�μ�ID�� 20���� �μ������͸� ���� �̸��� test4_dept_view �� �並 ������
--deptno, dname �ΰ� �÷������� ���� ��, ��˻�, �䱸�� Ȯ���϶�.
select deptno, dname from test4_dept where deptno = 20;

CREATE VIEW TEST4_DEPT_VIEW
AS SELECT 
    deptno, dname
FROM 
    test4_dept where deptno = 20;

select * from test4_dept_view;
drop view test4_dept_view;
--2-1.�μ�ID�� 10���� ��������͸� ���� �̸��� test4_emp_view ��
--�並 ������, �÷� �̸��� empno�� employee_id,
--ename�� employee_name���� ��Ī �����϶�.

CREATE OR REPLACE VIEW TEST4_EMP_VIEW
AS SELECT 
    empno employee_id, ename employee_name
FROM 
    test4_emp
    where deptno=10;

--2-2.�μ�ID�� 20���� �μ������͸� ���� �̸��� test4_dept_view ��
--�並 ������, �÷� �̸��� deptno �� department_id,
--dname �� department_name ���� ��Ī�����϶�.

CREATE OR REPLACE VIEW TEST4_DEPT_VIEW
AS SELECT 
    deptno department_id, dname department_name
FROM 
    test4_dept where deptno = 20;

--3.test4_emp ���̺�� test4_dept ���̺��� �����Ͽ�
--empno�� �����ȣ��,
--ename�� ���������,
--dname�� �μ�������,
--loc_name �� ����������
--�ٲٴ� test4_emp_join_dept_view �� �����Ͻÿ�.

create or replace view test4_emp_join_dept_view
as select e.empno �����ȣ, e.ename �����, d.dname �μ���,e.loc_name ������
from test4_emp e join test4_dept d
on d.deptno=e.deptno;

select * from test4_emp_join_dept_view;


--4.test4_emp ���̺�� test4_dept ���̺��� �����Ͽ�
--dname�� �μ��� ����,
--min(e.sal)�� �����޿� ����,
--max(e.sal)�� �ְ�޿� ����,
--avg(e.sal) �� ��ձ޿� ����
--�ٲٰ� �μ��̸����� test4_emp_join_dept_view�� �����Ͻÿ�.

create or replace view test4_emp_join_dept_view
as select d.dname �μ���, min(e.sal) �����޿�,max(e.sal) �ְ�޿�, avg(e.sal) ��ձ޿�
from test4_emp e join test4_dept d
on e.deptno = d.deptno
group by dname;

select * from test4_emp_join_dept_view;



