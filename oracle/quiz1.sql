create table couple(name nvarchar2(60), status nvarchar2(60));

insert into couple(name) select name from student;

delete from couple;

select *
from couple
where status is not null;

update couple set status='커플' where name='강동훈';
update couple set status='커플' where name='김기호';
update couple set status='커플' where name='김서준';
update couple set status='커플' where name='김우성';
update couple set status='커플' where name='박지용';
update couple set status='커플' where name='방가은';
update couple set status='커플' where name='양성준';
update couple set status='커플' where name='임연주';
update couple set status='커플' where name='조인환';
update couple set status='커플' where name='최민진';

-- null함수 nvl 1번예제
select nvl(name, status) as 솔로인사람
from couple;

-- null함수 lnnvl 3번예제
select count(*) as 솔로인원
from couple
where lnnvl(status = '커플');