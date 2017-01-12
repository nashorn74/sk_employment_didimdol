create table client (
   client_no number primary key,
   client_id nvarchar2(20),
   client_pw nvarchar2(20),
   client_gender char(1) NOT NULL,
   constraints check3 check (client_gender in('m', 'f')),
   client_age number NOT NULL
   );

   
create table park (
   park_no number,
   sensor_no number,
   constraints park1 primary key(park_no, sensor_no),
   client number,
   constraints client1 FOREIGN KEY(client)
   references client(client_no)
   );
   
   
create table time_history (
   park_no number,
   sensor_no number,
   constraints park2 primary key(park_no, sensor_no),
   client number,
   constraints client2 FOREIGN KEY(client)
   references client(client_no)
   time date default sysdate
   );


   create sequence seq_5
   increment by 1
   start with 0
   minvalue 0
   maxvalue 100
   nocycle
   nocache;
   
insert into client(client_no, client_id, client_pw, client_gender, client_age) values (seq_5.nextval, 'mdy', '0501', 'm', 2);
insert into client(client_no, client_id, client_pw, client_gender, client_age) values (seq_5.nextval, 'ptj', '0525', 'm', 3);
insert into client(client_no, client_id, client_pw, client_gender, client_age) values (seq_5.nextval, 'pcr', '1234', 'f', 4);
insert into client(client_no, client_id, client_pw, client_gender, client_age) values (seq_5.nextval, 'lmw', '0814', 'm', 3);
insert into client(client_no, client_id, client_pw, client_gender, client_age) values (seq_5.nextval, 'kdi', '1121', 'f', 2);


   
insert into park(park_no, sensor_no, client) values (1, 2, 3); 
insert into park(park_no, sensor_no, client) values (2, 4, 4); 


select * from client a, park b
where a.client_no = b.client;



/* °í¹ÎÀÇ ÈçÀûµé..
insert into time_history(park_no, sensor_no, client, time)
select    from client a, park b
 where a.park_no = b.
update time_history set park_no = 
*/