---4장 기타함수 예제
 
create table distance(
  부천 number,
  창원 number,
  부산 number,
  인천 number,
  수원 number,
  대구 number,
  충주 number,
  구미 number,
  광명 number
);
 
insert into distance values(35,364,392,43,44,285,126,243,26);
 
select * from distance;
 
select GREATEST(부천,광명,구미,충주,대구,수원,창원,인천,부산) as 롱디,
decode(GREATEST(부천,광명,구미,충주,대구,수원,창원,인천,부산),392,'부산',
                                                        364,'창원',
                                                        35,'부천',
                                                        43,'인천',
                                                        44,'수원',
                                                        285,'대구',
                                                        126,'충주',
                                                        243,'구미',
                                                        26,'광명',
                                                        '서울') 도시 from distance;
select Least(부천,광명,구미,충주,대구,수원,창원,인천,부산)as 숏디,
decode(least(부천,광명,구미,충주,대구,수원,창원,인천,부산),392,'부산',
                                                        364,'창원',
                                                        35,'부천',
                                                        43,'인천',
                                                        44,'수원',
                                                        285,'대구',
                                                        126,'충주',
                                                        243,'구미',
                                                        26,'광명',
                                                        '서울') 도시 from distance;
                                                        
                                                        

 create table couple(name nvarchar2(60), status nvarchar2(60));

insert into couple(name) select name from STUTENTS;

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
from couple
where status is null;

-- null함수 lnnvl 3번예제
select count(*) as 솔로인원
from couple
where lnnvl(status = '커플');