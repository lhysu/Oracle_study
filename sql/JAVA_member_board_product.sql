-----------------java20jdbc 프로젝트용 sql 설정---------------------
-- 회원테이블member
-- 번호, 아이디,비번,이름 ,폰번
drop table member cascade constraints;
CREATE TABLE MEMBER 
(
  NUM NUMBER NOT NULL 
, ID VARCHAR2(20) NOT NULL 
, PW VARCHAR2(20) NOT NULL 
, NAME VARCHAR2(20) NOT NULL 
, TEL VARCHAR2(20) NOT NULL 
, CONSTRAINT MEMBER_PK PRIMARY KEY (NUM)ENABLE 

);
drop sequence seq_member;
create sequence seq_member;
exec pc_member_insert;
-------------------------end memeber-----------------------------------
-- 게시글테이블 board
-- 번호, 제목, 내용, 작성자,작성일자
drop table board cascade constraints;
CREATE TABLE board 
(
  NUM NUMBER NOT NULL 
, title VARCHAR2(50) NOT NULL 
, content VARCHAR2(2000) 
, writer VARCHAR2(20) NOT NULL 
, wdate date default sysdate
, CONSTRAINT BOARD_PK PRIMARY KEY (NUM)ENABLE 

);
drop sequence seq_board;
create sequence seq_board;
exec pc_board_insert;
--------------------------end board----------------------------------
-- 상품테이블 product
-- 번호,제품명,모델,가격,갯수pcount
drop table product;
CREATE TABLE product 
(
  NUM NUMBER NOT NULL 
, PNAME VARCHAR2(50) NOT NULL 
, MODEL VARCHAR2(2000) NOT NULL 
, PRICE NUMBER NOT NULL 
, COUNT NUMBER default 0
, USER_ID VARCHAR2(20)
, CONSTRAINT PRODUCT_PK PRIMARY KEY (NUM)ENABLE 

);
drop sequence seq_product;
create sequence seq_product;
exec pc_product_insert;
----------------------------end product--------------------------------
--댓글테이블 comments
drop table comments;
CREATE TABLE COMMENTS 
(
  NUM NUMBER NOT NULL 
, CONTENT VARCHAR2(200) 
, WRITER VARCHAR2(20) NOT NULL 
, WDATE DATE DEFAULT sysdate NOT NULL 
, BNUM NUMBER NOT NULL 
, CONSTRAINT COMMENTS_PK PRIMARY KEY 
  (
    NUM 
  )
  ENABLE 
);

drop sequence seq_comments;
create sequence seq_comments;
exec pc_comments_insert;
---------------------------end comments------------------------------
--참조 제약조건 추가
ALTER TABLE MEMBER ADD CONSTRAINT MEMBER_UK1 UNIQUE (ID)ENABLE;
ALTER TABLE BOARD ADD CONSTRAINT BOARD_FK1 
    FOREIGN KEY(WRITER )REFERENCES MEMBER(ID)ON DELETE CASCADE ENABLE;
ALTER TABLE PRODUCT ADD CONSTRAINT PRODUCT_FK1 
    FOREIGN KEY(USER_ID)REFERENCES MEMBER(ID)ON DELETE SET NULL ENABLE;
ALTER TABLE COMMENTS ADD CONSTRAINT COMMENTS_FK1 
FOREIGN KEY(BNUM )REFERENCES BOARD(NUM )ON DELETE CASCADE ENABLE;



select * from member order by num desc;
select * from product;
select * from board;
select * from comments;

