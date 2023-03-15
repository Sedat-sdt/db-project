/*
 create table syntax:
    create table TableName(
 colName1 DataType Constraints,
 colname2 DataType Constraints(optional)
 );
 */
 create table ScrumTeam(
   Emp_ID Integer PRIMARY KEY,
   FirstName varchar(30) not null,
   LastName varchar(30),
   JobTitle varchar(20)
 );

select * from ScrumTeam order by Emp_ID;

/*
 insert into tableName 8column1,column2,...)
 values (value1, value2,...);
 */

insert into ScrumTeam(emp_id, firstname, lastname, jobtitle)
values (1,'Sedat','Maden','Tester');

insert into ScrumTeam values (2,'Erkan','Ozulu','Tester');
insert into ScrumTeam values (3,'Osman','Oguz','Tester');
insert into ScrumTeam values (4,'Alp','Cevik','Tester');
insert into ScrumTeam values (5,'Saban','Usta','Developer');


/*
 update table_Name
 set column1=value1,
 column2 = value2,
 where condition;
 */

 update ScrumTeam
set JOBTITLE='SDET'
where JOBTITLE='Tester';

/*
 delete from tableName
 where codition
 */


 delete from ScrumTeam where Emp_ID=5;


/*
 adding new column
 */


 ALTER  table ScrumTeam add salary integer;

--update existing employees salary

update ScrumTeam set salary=100000 where Emp_ID=1;
update ScrumTeam set salary=120000 where Emp_ID=2;
update ScrumTeam set salary=90000 where Emp_ID=3;
update ScrumTeam set salary=110000 where Emp_ID=4;

--rename the column

alter table ScrumTeam rename column  salary to annual_salary;

--delete or drop the column

alter table ScrumTeam drop  column ANNUAL_SALARY;

--how to change table name
alter table ScrumTeam rename to agileteam;

select * from agileteam;


