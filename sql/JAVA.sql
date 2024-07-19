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






