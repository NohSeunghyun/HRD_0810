drop table user_tbl_08; -- 존재할 시 에러나므로 미리 삭제

create table user_tbl_08 (
user_no char(5) not null primary key,
user_name varchar2(50) not null,
user_pw varchar2(50),
dept_no char(3),
user_gbn char(2),
reg_date date
);

desc user_tbl_08 -- Run Sql ~ 생성확인

--sequence 제거--
drop sequence user_tbl_08_seq;

--sequence 생성 후 사용--
create sequence user_tbl_08_seq
start with 10001
increment by 1
minvalue 10001;

insert into user_tbl_08 values (user_tbl_08_seq.nextval, '홍길동', '1111', 'A01', 'U1', '18/01/10');
insert into user_tbl_08 values (user_tbl_08_seq.nextval, '김유신', '1111', 'A02', 'U1', '18/02/10');
insert into user_tbl_08 values (user_tbl_08_seq.nextval, '이순신', '1111', null, 'U2', '18/03/10');

select * from user_tbl_08; -- insert확인

drop table dept_auth_tbl_08; -- 존재시 에러, 삭제

create table dept_auth_tbl_08 (
dept_no char(3) not null,
menu_no number not null,
primary key (dept_no, menu_no)
);

desc dept_auth_tbl_08; -- Run Sql ~ 생성확인

insert into dept_auth_tbl_08 values ('A01', 10);
insert into dept_auth_tbl_08 values ('A01', 11);
insert into dept_auth_tbl_08 values ('A02', 12);
insert into dept_auth_tbl_08 values ('A02', 13);

select * from  dept_auth_tbl_08; -- insert 확인

drop table user_auth_tbl_08 -- 존재시 에러, 삭제

create table user_auth_tbl_08 (
user_no char(5) not null,
menu_no number not null,
primary key (user_no, menu_no)
);

insert into user_auth_tbl_08 values ('10001', 12);
insert into user_auth_tbl_08 values ('10003', 13);

select * from user_auth_tbl_08; -- insert 확인

--select.jsp--
select user_no, user_name,
nvl(decode(dept_no, 'A01', '인사', 'A02', '개발', 'B01', '총무', 'B02', '회계'), ' ') as dept_no,
user_gbn, 
to_char(reg_date, 'yyyy/mm/dd')
from user_tbl_08;

--select2.jsp--
select user_no, user_name, menu_no,
decode(menu_no, '10', '부서관리', '11', '사원관리', '12', '기초정보관리', '13', '급여계산')
from user_tbl_08 natural join dept_auth_tbl_08
union
select user_no, user_name, menu_no,
decode(menu_no, '10', '부서관리', '11', '사원관리', '12', '기초정보관리', '13', '급여계산')
from user_tbl_08 natural join user_auth_tbl_08;
order by 1 , 4 desc;