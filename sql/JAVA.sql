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