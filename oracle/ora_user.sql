drop sequence seq_1;

create SEQUENCE seq_1
increment by 1
start with 0
minvalue 0
maxvalue 100
nocycle
nocache;

insert into major values(seq_1.currval,'');
insert into major values(seq_1.nextval,'정보보안');
insert into major values(seq_1.nextval,'컴퓨터공학');
insert into major values(seq_1.nextval,'기계공학');
insert into major values(seq_1.nextval,'전기공학');
insert into major values(seq_1.nextval,'전자정보공학');
insert into major values(seq_1.nextval,'정보공학');
insert into major values(seq_1.nextval,'중어중문학');
insert into major values(seq_1.nextval,'수학');
insert into major values(seq_1.nextval,'행정학');
insert into major values(seq_1.nextval,'기계정보학');
insert into major values(seq_1.nextval,'산업공학');
insert into major values(seq_1.nextval,'경영정보학');

delete  from major;

create table major(
  code number primary key,
  name nvarchar2(20) NOT null);  
create table city(
  code number primary key,
  name nvarchar2(20) NOT NULL);
create table student(
  no number primary key,
  name nvarchar2(20) NOT NULL,
  gender char(1) NOT NULL,
  constraints check1 check(gender in('m','f')),
  major number NOT NULL,
  constraints major1 foreign key(major)
  references major(code),
  city number NOT NULL,
  constraints city1 foreign key(city)
  references city(code),
  created_at date default sysdate);
  
  
  
  
  create sequence seq_2 start with 0
                        increment by 1
                        minvalue 0
                        maxvalue 100
                        nocycle
                        nocache;
                        
  delete from city;
                        
  select seq_2.currval from dual;
  
  drop sequence seq_2;
  insert into city values(seq_2.nextval,'서울');
  insert into city values(seq_2.nextval,'부천');
  insert into city values(seq_2.nextval,'창원');
  insert into city values(seq_2.nextval,'부산');
  insert into city values(seq_2.nextval,'인천');
  insert into city values(seq_2.nextval,'수원');
  insert into city values(seq_2.nextval,'대구');
  insert into city values(seq_2.nextval,'충주');
  insert into city values(seq_2.nextval,'구미');
  insert into city values(seq_2.nextval,'광명');
  
  select * from city;
  
create sequence seq_3
increment by 1
start with 0
minvalue 0
maxvalue 100
nocycle
nocache;

delete from student;
drop sequence seq_3;

insert into student(no,name,gender,major,city) values(seq_3.currval,'','m',0,0);
insert into student(no,name,gender,major,city) values(seq_3.nextval,'강동훈','m',9,0);
insert into student(no,name,gender,major,city) values(seq_3.nextval,'곽다인','f',1,5);
insert into student(no,name,gender,major,city) values(seq_3.nextval,'김기호','m',1,0);
insert into student(no,name,gender,major,city) values(seq_3.nextval,'김동근','m',5,0);
insert into student(no,name,gender,major,city) values(seq_3.nextval,'김서준','m',1,1);
insert into student(no,name,gender,major,city) values(seq_3.nextval,'김아연','f',5,7);
insert into student(no,name,gender,major,city) values(seq_3.nextval,'김우성','m',7,0);
insert into student(no,name,gender,major,city) values(seq_3.nextval,'김지혜','f',4,9);
insert into student(no,name,gender,major,city) values(seq_3.nextval,'라건주','f',1,0);
insert into student(no,name,gender,major,city) values(seq_3.nextval,'민동연','m',1,0);
insert into student(no,name,gender,major,city) values(seq_3.nextval,'박민호','m',3,0);
insert into student(no,name,gender,major,city) values(seq_3.nextval,'박정은','f',0,0);
insert into student(no,name,gender,major,city) values(seq_3.nextval,'박중균','m',8,8);
insert into student(no,name,gender,major,city) values(seq_3.nextval,'박지용','m',10,0);
insert into student(no,name,gender,major,city) values(seq_3.nextval,'박찬준','m',1,0);
insert into student(no,name,gender,major,city) values(seq_3.nextval,'박창환','m',1,0);
insert into student(no,name,gender,major,city) values(seq_3.nextval,'박초롱','f',1,5);
insert into student(no,name,gender,major,city) values(seq_3.nextval,'박태준','m',3,0);
insert into student(no,name,gender,major,city) values(seq_3.nextval,'방가은','f',2,0);
insert into student(no,name,gender,major,city) values(seq_3.nextval,'양성준','m',5,4);
insert into student(no,name,gender,major,city) values(seq_3.nextval,'유희상','m',4,0);
insert into student(no,name,gender,major,city) values(seq_3.nextval,'윤장원','m',1,0);
insert into student(no,name,gender,major,city) values(seq_3.nextval,'이명구','m',5,4);
insert into student(no,name,gender,major,city) values(seq_3.nextval,'이명우','m',2,9);
insert into student(no,name,gender,major,city) values(seq_3.nextval,'이수진','f',6,0);
insert into student(no,name,gender,major,city) values(seq_3.nextval,'이창주','m',4,0);
insert into student(no,name,gender,major,city) values(seq_3.nextval,'이호성','m',11,3);
insert into student(no,name,gender,major,city) values(seq_3.nextval,'임연주','f',1,0);
insert into student(no,name,gender,major,city) values(seq_3.nextval,'정종찬','m',1,0);
insert into student(no,name,gender,major,city) values(seq_3.nextval,'조인환','m',1,0);
insert into student(no,name,gender,major,city) values(seq_3.nextval,'최민진','f',4,1);

select * from student;
select a.no, a.name, a.gender, b.name as major, c.name as city
from student a, major b, city c 
where a.major = b.code and a.city = c.code
order by a.no asc;

create or replace view student_view as
select a.no, a.name, a.gender, b.name as major, c.name as city
from student a, major b, city c 
where a.major = b.code and a.city = c.code
order by a.no asc;

select * from student_view;

select * from user_constraints;
select * from user_indexes;

-- 현재 서울에 살고 있는 수강생의 이름만 출력
select name from student where city = 0;
select count(name) from student where city = 0;

select a.name from student a, city b 
where a.city = b.code and b.name = '서울'
order by a.name desc;

select count(a.name) from student a, major b
where a.major = b.code and b.name = '전자정보공학';

create table team (
  code number primary key,
  name nvarchar2(20) not null,
  leader number,
  constraints leader1 foreign key (leader)
  references student(no));
insert into team values(0,'자바타조',17);
insert into team values(1,'보여드리조',25);
insert into team values(2,'동반자',12);
insert into team values(3,'준비됐조',20);
insert into team values(4,'마일리지',29);
insert into team values(5,'어벤져스',6);
-- 어벤져스의 팀장 이름은?
select a.name from student a, team b 
where a.no = b.leader and b.name='어벤져스';

-- student 테이블에 team 컬럼 추가 (외래키)
alter table student add team number;
alter table student add constraints team1 foreign key (team)
references team(code);
update student set team=5 where no=0;
update student set team=0 where no=1;
update student set team=1 where no=2;
update student set team=2 where no=3;
update student set team=4 where no=4;
update student set team=5 where no=5;
update student set team=5 where no=6;
update student set team=2 where no=7;
update student set team=4 where no=8;
update student set team=0 where no=9;
update student set team=1 where no=10;
update student set team=5 where no=11;
update student set team=2 where no=12;
update student set team=3 where no=13;
update student set team=4 where no=14;
update student set team=5 where no=15;
update student set team=0 where no=16;
update student set team=0 where no=17;
update student set team=1 where no=18;
update student set team=2 where no=19;
update student set team=3 where no=20;
update student set team=4 where no=21;
update student set team=5 where no=22;
update student set team=0 where no=23;
update student set team=2 where no=24;
update student set team=1 where no=25;
update student set team=1 where no=26;
update student set team=3 where no=27;
update student set team=3 where no=28;
update student set team=4 where no=29;
update student set team=4 where no=30;
-- 마일리지팀의 팀원 숫자
select count(a.name) from student a, team b
where a.team = b.code and b.name='마일리지';
-- 자바타조팀의 여성팀원 숫자
select count(a.name) from student a, team b
where a.team = b.code and b.name='자바타조' and a.gender = 'f';

create table team_1(
  name nvarchar2(20),major nvarchar2(20), city nvarchar2(20));
create table team_2(
  name nvarchar2(20),major nvarchar2(20), city nvarchar2(20));
create table team_3(
  name nvarchar2(20),major nvarchar2(20), city nvarchar2(20));
create table team_4(
  name nvarchar2(20),major nvarchar2(20), city nvarchar2(20));
create table team_5(
  name nvarchar2(20),major nvarchar2(20), city nvarchar2(20));
create table team_6(
  name nvarchar2(20),major nvarchar2(20), city nvarchar2(20));
insert into team_1(name,major,city)
select a.name, b.name, c.name from student a, major b, city c
where a.major = b.code and a.city = c.code and a.team = 0;
insert into team_2(name,major,city)
select a.name, b.name, c.name from student a, major b, city c
where a.major = b.code and a.city = c.code and a.team = 1;
insert into team_3(name,major,city)
select a.name, b.name, c.name from student a, major b, city c
where a.major = b.code and a.city = c.code and a.team = 2;

create table merge_1 (
  name nvarchar2(20), major nvarchar2(20), city nvarchar2(20));
insert into merge_1(name,major,city)
select a.name, b.name, c.name from student a, major b, city c
where a.major = b.code and a.city = c.code and a.team = 2;

merge into merge_1 m
  using (select a.name, b.name as major, c.name as city 
    from student a, major b, city c
    where a.major = b.code and a.city = c.code and a.gender='f') s
  on (m.name = s.name)
when not matched then
  insert (m.name, m.major, m.city) 
    values (s.name, s.major, s.city);
    
select student.name, major.name, city.name 
from student, major, city
where student.major = major.code and student.city = city.code;

select * from merge_1;
commit;
    
    
select rownum, name||'바보', rowid from merge_1;

select a.name, b.name as city, 
  case when b.code = 0 then '도시'
      else '시골'
  end as city_grade
from student a, city b
where a.city = b.code
order by a.name;

select name from student where name like '김%';
select name from student where name like '%%호';
select name from student where name like '%명%';

select count(*) from student;
select count(distinct no) from student;
select count(distinct city) from student;
select count(distinct major) from student;

select distinct major from student;
select distinct b.name from student a, major b where a.major=b.code;

select sum(no) from student;
select sum(major), sum(distinct major) from student;
select avg(city), avg(distinct city) from student;
select min(no), max(no) from student;
select variance(no), stddev(no) from student;

select major, sum(no) from student
group by major
order by major;
select b.name, sum(a.no) from student a, major b 
where a.major = b.code
group by b.name
order by b.name;
select b.name as major, c.name as city, sum(a.no) 
from student a, major b, city c
where a.major=b.code and a.city=c.code
group by b.name, c.name
having sum(a.no) > 10
order by b.name, c.name;

select b.name as major, c.name as city, sum(a.no)
from student a, major b, city c
where a.major=b.code and a.city=c.code
group by rollup(b.name,c.name);

--- 합집합
select name from student where team=0
union
select name from student where team=2;

select name from student where team=1
union all
select name from student where gender='f';

select name from student where team=4
intersect
select name from student where gender='f';

select name from student where gender='f'
minus
select name from student where team=5;

--안티조인
select name 
from student
where no not in (select no from student where team=0);

select name
from student a
where not exists (select 1 from student b where a.no=b.no and b.team=0);

select name
from student
where no not in (select no from student where city=0);

select name
from student a
where not exists (select 1 from student b where a.no=b.no and b.city=0);

select 1 from student;

select b.code,b.name, count(a.no) from student a, city b
where a.city=b.code
group by b.code,b.name

select b.no,a.name from student a, student b
where a.city=b.city and a.no < b.no and a.city = 0;

---외부조인
select a.name, c.name as city 
from student a, city c
where c.code=a.city(+);

select a.name, c.name as city 
from student a, city c
where c.code=a.city;


insert into city values(10,'제주');
commit;

--카타시안 조인
select a.name, b.name from student a, major b;