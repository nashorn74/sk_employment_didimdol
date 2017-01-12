 create table project_3(
    name nvarchar2(38),
    id number(38),
    birth nvarchar2(38),
    address nvarchar2(38),
    age nvarchar2(38)
    );
    
    DROP TABLE PROJECT_3;
   
    insert into project_3 values ('김기호', 1120, '19901120', '서울', 28);
    insert into project_3 values ('이호성', 1116, '19921116', '부산', 26);
    insert into project_3 values ('방가은', 0601, '19930601', '대구', 25);
    insert into project_3 values ('박민호', 1213, '19901213', '서울', 28);
    insert into project_3 values ('이창주', 0730, '19880730', '서울', '이립');

    select * from project_3;
    select to_char(a.id, 'RN') as 로마자생일, age as 나이, to_date(a.birth, 'yyyy-mm-dd') as 문자_날짜형, to_number(a.birth) as 문자_숫자
    from PROJECT_3 a;
    
    select ROUND(EXP(4.709530201)), ROUND(LN(8.689987011*10e+92)), LOG(10, 10e+34), MOD(1081, 46), REMAINDER(1081, 46), ABS(-3), CEIL(0.898), FLOOR(16.125), ROUND(1.304,0), TRUNC(33,-1), POWER(1,0), SQRT(961)
from dual;--ddddddddddddddddddddddddd

-- 현재일자와 시간
select sysdate, systimestamp
  from dual;

-- 두 날짜 사이의 개월 수
select months_between(sysdate, '20121225') mon1
  from dual;

-- interger 만큼의 월을 더한 날짜
select add_months(sysdate, 1)
  from dual;

-- 해당 월 마지막 일자
select last_day('20170201')
  from dual;

-- ROUND: 주 단위 반올림
select sysdate, ROUND(TO_DATE('20170228'), 'month')
  from dual;

-- 두 날짜 사이의 개월 수
select months_between('20170301', SYSDATE) mon1
  from dual;

-- 오늘 이후의 해당 요일 날짜
select next_day(sysdate, '금요일')
  from dual;

create table client_info (
grade nvarchar2(20),
k_last nvarchar2(20),
k_first nvarchar2(20),
e_last nvarchar2(20),
e_first nvarchar2(20),
bday nvarchar2(20),
tel1 nvarchar2(20),
tel2 nvarchar2(20),
tel3 nvarchar2(20),
phone1 nvarchar2(20),
phone2 nvarchar2(20),
phone3 nvarchar2(20),
gender char(1),
addr1 nvarchar2(40),
addr2 nvarchar2(40),
moto nvarchar2(100));




insert into client_info values
('A','홍','길동','hong ','gildong', '851209', 
'02', '234', '1234', '010', '9137', '1871', 'M',
'혜화동 상록원 2층', '서울역 7번출구 앞', '지각을 하지 말자');

insert into client_info values
('B','마','동탁','ma ','dongtak', '781021', 
'031', '875', '1135', '010', '9377', '9071', 'F',
'혜화관 3층 운영실', '부산광역시 해운대구 모래사장', '청소를 잘하자');

insert into client_info values
('A','인','사짱','ihn ','sazzang', '880429', 
'031', '724', '9080', '010', '9315', '9041', 'F',
'동국대학교 동백관', '동대입구역 5번출구 신호등', '편하게 일하자');

insert into client_info values
('A','박','구매','park ','gu meh ', '900326', 
'063', '724', '9903', '010', '1583', '4151', 'M',
'한국대학교 체육관', '경영관 로비', ' 돈많은 백수가 되자');

insert into client_info values
('A','전','우치','jeon ','wo ochi ', '701126', 
'033', '798', '9903', '010', '5903', '4618', 'M',
'메디슨 스퀘어 가든', '뉴욕 타임스퀘어', ' Just do it');
select * from client_info;

select grade as 변경전, replace(grade,'A','VIP') as 변경후 from client_info;
select concat(k_last,k_first) as 이름 from client_info;
select gender as 변경전, lower(gender) as 변경후 from client_info;
SELECT * FROM client_info WHERE LENGTH(TEL1)=2;
select moto as 변경전, substr(moto,1,5) as 변경후 from client_info;


