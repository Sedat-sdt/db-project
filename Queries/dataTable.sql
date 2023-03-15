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