select * from usersactivity;

--Initial Records to be added
insert into usersactivity values('2022-05-01T13:00:00',2);
insert into usersactivity values('2022-05-01T14:00:00',3);

insert into usersactivity values('2022-05-02T12:00:00',1);
insert into usersactivity values('2022-05-02T14:00:00',4);
insert into usersactivity values('2022-05-02T15:00:00',5);
insert into usersactivity values('2022-05-02T16:00:00',6);
insert into usersactivity values('2022-05-03T16:00:00',7);



--insert into usersactivity values('2022-05-04T17:00:00',10);
--insert into usersactivity values('2022-05-04T18:00:00',11);




  /*select
  date_trunc('day',eventTime) as eventDay ,
  count(userId) as dailyUsers ,
  current_timestamp as entryTimestamp 
  from usersactivity group by eventDay;


select * from my_third_dbt_incremental_model;

*/
  
 --Creating Source table from usersactivity  
  create table source2 as select
  date_trunc('day',eventTime) as eventDay ,
  userID 
  from usersactivity;
  
  select * from source2;

--Refreshing records/Delta batch into source table
  insert into source2 values('2022-05-04',10);
  insert into source2 values('2022-05-04',11);
 
 select current_timestamp;
   select * from my_third_dbt_incremental_model;
