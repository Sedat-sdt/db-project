SELECT  * FROM  EMPLOYEES;
--reads all column from employees table

select * from DEPARTMENTS;

select FIRST_NAME from EMPLOYEES;
-- reads only first_name row from employees table

select CITY from LOCATIONS;
--reads the city names

select FIRST_NAME, LAST_NAME,SALARY from EMPLOYEES;
--get first name, last name, salary from employees

select STREET_ADDRESS,POSTAL_CODE
from LOCATIONS;--it can be like this in two lines

select distinct FIRST_NAME from EMPLOYEES;
--removes duplicates

--I want to see firstname, lastname and phone number of David(s)

select FIRST_NAME,LAST_NAME,PHONE_NUMBER
from EMPLOYEES
where FIRST_NAME='David'
and LAST_NAME='Lee';

--get me all information who is making more than 7000 salary

select * from EMPLOYEES where SALARY>7000;

--get me email of who is making less than 4000

select EMAIL from EMPLOYEES   -- select
where SALARY<4000;            -- filter( they are independent from each other)

--get me all info who is working as IT_PROG or SA_REP

select * from EMPLOYEES where JOB_ID='IT_PROG' or JOB_ID= 'SA_REP';-- where JOB_TITLE from Jobs 'IT_PROG'and 'SA_REP';

--get me first name, lastname,salary who is making more than 5000 and less than 10000

select FIRST_NAME,LAST_NAME,SALARY from EMPLOYEES where SALARY>=5000 and SALARY<=10000;

select FIRST_NAME,LAST_NAME,SALARY from EMPLOYEES where SALARY between 5000 and 10000;  --like Gherkin

select * from EMPLOYEES where EMPLOYEE_ID between 130 and 170;

--get me all info where employee-id 135 176 154 129

select * from EMPLOYEES where EMPLOYEE_ID=135 or EMPLOYEE_ID=176 or EMPLOYEE_ID=154 or EMPLOYEE_ID=129;

select * from EMPLOYEES where EMPLOYEE_ID in(135,176,154,129);

--get me city of where country-id IT,US,UK
select CITY from LOCATIONS where  COUNTRY_ID in('IT','US','UK');

--get me all info who is working as IT_PROG or SA_REP

select * from EMPLOYEES where JOB_ID='IT_PROG' or JOB_ID= 'SA_REP';

--how many employee working as IT_PROG or SA_REP
select count(*) from EMPLOYEES where JOB_ID in('IT_PROG','SA_REP');

--how many employees making more than 8000

select count(*) from EMPLOYEES where SALARY>8000;

--how many unique first names we have?
select count(distinct FIRST_NAME) from EMPLOYEES;

--get me all employees info based on who is making more salary to low salary

select * from  EMPLOYEES order by SALARY desc;
select * from  EMPLOYEES order by SALARY asc;

--desc 9-0  Z-A
--asc  0-9  A-Z

--get me all employees info order by alphabetical based on firstname

select * from EMPLOYEES order by FIRST_NAME;    -- asc;  default---> asc order we can ignore to write asc here
                                                -- it will return asc order by default
--get me all employees whose first name starts with C

select * from EMPLOYEES where FIRST_NAME like 'C%'; --Curtis,  Charles, Christopher, Clara
select * from EMPLOYEES where FIRST_NAME like 'C____'; -- Clara(5 letter totally)

--get me 5 letter first names where the middle char is z;
select * from EMPLOYEES where FIRST_NAME like '__z__';

--get me first name where second char is u;
select FIRST_NAME from EMPLOYEES where FIRST_NAME like '_u%';

--find min salary
select MIN(SALARY) from EMPLOYEES;

select max(SALARY) from EMPLOYEES;

select avg(SALARY) from EMPLOYEES;  --6461.831775700934579439252336448598130841

select round(avg(SALARY)) from EMPLOYEES;  --6462

select round(avg(SALARY),2) from EMPLOYEES;  --6462.83

select  sum(salary) from EMPLOYEES;

--get me average salary for IT_PROG
select avg(SALARY)from EMPLOYEES where JOB_ID='IT_PROG';--5760

select JOB_ID, avg(SALARY),count(*),sum(SALARY) from EMPLOYEES group by JOB_ID;

--get me job_ids where their avg salary is more than 5k

select JOB_ID,avg(SALARY),count(*),sum(SALARY) from EMPLOYEES group by JOB_ID having avg(SALARY) > 5000;

--how to find employees info who is making highest salary in the company

select * from EMPLOYEES order by SALARY desc ;

--get me highest salalry
select max(SALARY)from EMPLOYEES;  --24000

--highest salary employee info
select * from EMPLOYEES where  SALARY= 24000;

--subquery solution in one shot
select * from EMPLOYEES where  SALARY = (select max(SALARY)from EMPLOYEES);
                                        -- inner query is executed first = 24000

--get me second highest salary

--firstly get the highest salary
select max(SALARY) from EMPLOYEES;

--highest after 24k
select max(SALARY)from EMPLOYEES where SALARY<24000;

--one shot combining two queries

select max(SALARY)from EMPLOYEES where SALARY<(select max(SALARY) from EMPLOYEES);

--employee information of who is making second highest salary?

select * from  EMPLOYEES where SALARY=17000;
select * from  EMPLOYEES where SALARY=(select max(SALARY)from EMPLOYEES where SALARY<(select max(SALARY) from EMPLOYEES));


--list the employees who is making top 10 salary

--get the first 10 people then order them high to low based on salary

select * from EMPLOYEES where ROWNUM<11 order by SALARY desc ;


--order all employees based on salary high to low then display only first 10 person

select  * from EMPLOYEES order by SALARY desc ;  --inner query

select  * from EMPLOYEES where ROWNUM<11;--outer query

select * from (select  * from EMPLOYEES order by SALARY desc) where ROWNUM<11; --combine two queries in one shot

--get me 9. person who make highest salary

select * from EMPLOYEES order by SALARY desc;

select * from (select * from EMPLOYEES order by SALARY desc) where ROWNUM<10;


--select * from(select * from (select * from EMPLOYEES order by SALARY desc) where ROWNUM<10) where max(ROWNUM);

--how can we rename the column that we displayed
select  FIRST_NAME as "Given_Name",LAST_NAME as surname from EMPLOYEES; --surname is displayed all uppercase

--text functions, string manipulations
--java first_name+" "+Last_name
--in sql concat is ||

select  FIRST_NAME||' '||LAST_NAME as "full_name" from EMPLOYEES;  -- (  || = +  ) in SQL

--Task
--Add @gmail.com and name the new column to full_email

select EMAIL||'@gmail.com'as "full_email" from EMPLOYEES;

--making all lower case
select lower(EMAIL||'@gmail.com')as "full_email" from EMPLOYEES;

--making all upper case
select upper(EMAIL||'@gmail.com')as "full_email" from EMPLOYEES;

--length of value

select FIRST_NAME,length(FIRST_NAME) as "length_name"  from EMPLOYEES order by "length_name"desc;


--substr(colName,begIndex,NumberOfChar)

select substr(FIRST_NAME,0,1)||'.'||substr(LAST_NAME,0,1) as "initials" from EMPLOYEES;

select substr(FIRST_NAME,0,1)||'.'||substr(LAST_NAME,0,1) as "initials",
       FIRST_NAME||' '||LAST_NAME as "full_name",
       lower(EMAIL||'@gmail.com')as "full_email"
from EMPLOYEES;

--view
CREATE view Emaillist as select substr(FIRST_NAME,0,1)||'.'||substr(LAST_NAME,0,1) as "initials",
       FIRST_NAME||' '||LAST_NAME as "full_name",
       lower(EMAIL||'@gmail.com')as "full_email"
from EMPLOYEES;

select  "full_name" from Emaillist;

--to remove the view

drop view Emaillist;

--find the highest 14TH salary

select * from (select  * from EMPLOYEES order by SALARY desc) where ROWNUM<15;
--select min(SALARY) from (select * from (select  * from EMPLOYEES order by SALARY desc) where ROWNUM<15);
select min(SALARY) from (select  * from EMPLOYEES order by SALARY desc) where ROWNUM<15;  --with duplicates  --10500
select min(SALARY) from (select  distinct SALARY from EMPLOYEES order by SALARY desc) where ROWNUM<15;  --without duplicates  --9000

--find employee info who is making 14th highest salary

select * from EMPLOYEES where SALARY=10500;
select * from EMPLOYEES where SALARY=(select min(SALARY) from (select  distinct  SALARY from EMPLOYEES order by SALARY desc) where ROWNUM<15);






























