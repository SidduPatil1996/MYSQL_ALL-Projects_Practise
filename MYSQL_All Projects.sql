create database sspatil;
use sspatil;

create table books204(
book_id int(2),
book_name varchar(20),
author varchar(20),
publication varchar(20),
date_of_publication date)

#(MYSQL_Project 01)

insert into books204 values(001, "SSP","Siddu","Impact","2022-10-11"),
(002, "SSS","Punith","Impact","2022-10-12"),
(003, "AAA","Gokul","Infotech","2022-10-13"),
(004, "BBB","Akash","Infotech","2022-10-14")

select * from books204

# All the SQL Clauses are used in this database:-

update books204 set author="praveen" where book_id=1

select * from books204

select book_id, book_name from books204 where publication="Impact"

alter table books204 add n0_of_pages int(4)

select author,book_name from books204 where publication="Impact" limit 2

select * from books204 order by book_id desc

select book_name,author from books204 where book_id=4

select distinct publication from books204 order by publication desc

select distinct book_id,author from books204 where publication="Impact"

select * from books204 where book_id>3

select * from books204 where book_id<3

select * from books204 where book_id<=3

select * from books204 where book_id<>4

select * from books204 where book_id>=1 and publication="Impact"

select * from books204 where book_id>1 and book_id<4

select * from books204 where book_id<=1 or author="Gokul"

select * from books204 where book_id>2 or book_id<4

select * from books204 where book_id between 1 and 3

select * from books204 where book_id in(1,2,3)

select * from books204 where book_name like "S%"

select book_id,book_name,author from books204 where book_name like "S%"

select book_name,author from books204 where book_name like "S%" or "A%"

select book_name, count(book_name) as book_count from books204 group by book_name


#(MYSQL-Project 2)

create table actors204(
actor_id int(2),
actor_name varchar(30),
gender varchar (10),
debut_year int(5))

insert into actors204 values(1,'Aamir Khan','male',1988);
insert into actors204 values(2,'Shahrukh Khan','male',1992);
insert into actors204 values(3,'Kareena Kapoor','female',2000);
insert into actors204 values(4,'Kajol','female',1992);
insert into actors204 values(5,'Anushka Sharma','female',2008);
insert into actors204 values(6,'Ranbir Kapoor','male',2007);
insert into actors204 values(7,'Alia Bhatt','female',2012);
insert into actors204 values(8,'Ranveer Singh','male',2010);
insert into actors204 values(9,'Deepika Padukone','female',2006);
insert into actors204 values(10,'Shahid Kapoor','male',2003);
insert into actors204 values(11,'Katrina Kaif','female',2003);
insert into actors204 values(12,'Varun Dhawan','male',2012)

select * from actors204

## SQl Queries of min,max,avg,count funtions using "group by' and 'having' clause

select actor_name, min(actor_id) as minimum_id from actors204 group by actor_name

select actor_name, max(debut_year) as maximum_debut_year from actors204 group by actor_name

select actor_id,actor_name, avg(debut_year) as Avg_Debut_Year from actors204 group by actor_name

select actor_name,Gender,avg(debut_year) as Avg_debut_year from actors204 group by actor_name

select actor_name, count(actor_id) as count_actor_id from actors204 group by debut_year

select actor_name, sum(actor_id) as Total_ID from actors204 group by actor_name 

select count(actor_id) from actors204

select actor_name, sum(actor_id) as Total_ID, count(debut_year) as Debut_Year from actors204 group by actor_name



#(MYSQL-Project 03)
#Transaction functions in MYSQL:

create table trans204(
acotr_id int(2),
actor_name varchar(30),
gender varchar(10),
debut_year int(5),
prop_id int(2),
no_of_flats int(2),
area_size float(4))

insert into trans204 values(1,'Aamir Khan','male',1988,11,8,12.3);
insert into trans204 values(2,'Shahrukh Khan','male',1992,22,13,342.1);
insert into trans204 values(3,'Kareena Kapoor','female',2000,33,9,18.6);
insert into trans204 values(4,'Kajol','female',1992,44,11,29.30);
insert into trans204 values(5,'Anushka Sharma','female',2008,55,19,29.3);
insert into trans204 values(6,'Ranbir Kapoor','male',2007,66,6,100.1);
insert into trans204 values(7,'Alia Bhatt','female',2012,77,10,78.4);

select * from trans204

## Using transaction funtions like:- COMMIT{to store the data permanently in the database},
## ROLLBACK{to undo the data},   SAVEPOINT(to save the data at particular point}

insert into trans204 values(8,'Ranveer singh','male',2010,88,16,312.1);
commit
select * from trans204


update trans204 set no_of_flats=56 where actor_name='Anushka Sharma'
commit
select * from trans204


insert into trans204 values(9,'Deepika Padukone','female',2006,99,32,171.5);
insert into trans204 values(10,'Shahid Kapoor','male',2003,27,18,123.4);
select * from trans204
rollback
select * from trans204    #(after rollback and check table, then recent data is deleted)


delete from trans204 where Actor_name='Kajol'
select * from trans204
rollback
select * from trans204   #(after rollback then kajol data has existed in the table again)


insert into trans204 values(12,'mia kalifa','female',2003,87,25,532.4);
insert into trans204 values(13,'Varun','male',2012,78,70,328.4);
select * from trans204
savepoint s1;   
select * from trans204
rollback s1;

## After passing savepoint command the data is saved in the table upto where you passed savepoint command.
## when you again pass rollback to s1; then the saved data in savepoint s1 will be deleted.



#(MYSQL-Project 04)
#STRING AND REGEX FUCTIONS IN SQL:-

create table str204(
id int(3), 
fname varchar(20), 
lname varchar(20), 
age int(3), 
state varchar(20), 
payment int(6), 
message varchar(30))


insert into str204 values(1,'Simran','Surve',20,'maharastra',20000,'I love my planet Earth');
insert into str204 values(2,'John','Dsouza',27,'california',25000,'Happy birthday mom');
insert into str204 values(3,'Suzane','Peter',34,'eastern cape',30000,'Save our Earth');
insert into str204 values(4,'Sherlin','Fernandes',30,'Texas',23000,'Happy birthday david');
insert into str204 values(5,'Harsh','Shah',22,'Gujarat',21000,'stop the destruction');
insert into str204 values(6,'Celine','Sebastian',45,'Alaska',35000,'How you doing!');
insert into str204 values(7,'Kieron','Pollard',35,'West Indies',32000,'Happy birthday jenna');
insert into str204 values(8,'Quinton','Decock',30,'northern cape',23000,'I love cricket');
insert into str204 values(9,'Tanuja','Patil',24,'West Bengal',21000,'Happy birthday Vedant');
insert into str204 values(10,'Justin','Bieber',33,'Texas',40000,'Music is the peace on Earth');

select * from str204

select ascii(fname) from str204

select message, char_length(message) as "length of the message" from str204

select concat(fname,' ',lname) as "full name" from str204

select elt(3,id,lname,age,payment) as 'ELT' from str204

select field(age,id,lname,age,payment) from str204

## INSERT(STRING,POSITION,LENGTH,NEWSTRING)
insert(state,4,3,fname) as 'new state' from str204

select left(message,6) as "6 left characters of message" from str204

select right(message,5) as "5 right characters of message" from str204

select lower(message) as "Lower case" from str204

select upper(message) as "Upper case" from str204

select ltrim('     CloudyML') from str204

select rtrim('CloudyML    ') from str204

select repeat(fname,4) as '4 times fname' from str204

select repeat(lname,5) as"5 times lname" from str204

select reverse(message) as "reverse message" from str204

select fname from str204 where state regexp "Texas"

select message from str204 where message regexp "^Happy"

select state from str204 where state regexp "Stra$"

select fname from str204 where fname regexp "[A-Z]"

select * from str204 where payment regexp "[0-9]"

select fname,age from str204 where age regexp "20|30"

select message from str204 where message regexp "Earth$"



#(MYSQL-Project 05)
#SQL Queries Using Windows Functions:-

create table employee204(
name varchar(20), 
age int, 
department varchar(20), 
salary int);

insert into employee204 values('Simran',20,'Technical',50000);
insert into employee204 values('Harsh',22,'Marketing',40000);
insert into employee204 values('Abhishek',21,'Marketing',30000);
insert into employee204 values('Tanuja',20,'Technical',45000);
insert into employee204 values('Vedant',21,'Marketing',30000);

select * from employee204

select name,age,department,salary, avg(salary) over(partition by department order by age) as 'Avg_salary' from employee204

select name,age,department,salary, count(name) over (partition by department order by salary desc) as "no_of_employees" from employee204


## Ranking the data using Rank() and Dense rank() functions:-

select row_number() over (partition by department order by salary) as row_num,name,age,department,salary,
rank() over (partition by department order by salary desc) as emp_rank,
dense_rank() over (partition by department order by salary desc) as emp_dense_rank from employee204


## NTILE():- IT DISTRiBUTES THE DATA INTO EQUAL GROUPS...
## FOR EX:- If you want to distribute data into two groups then use NTILE(2)...

select *, ntile(2) over () as emp_group from employee204

select name,age,department,salary, cume_dist() over (partition by department order by salary) as cumulative_distance from employee204

## VALUE WINDOWS FUNCTIONS:- LEAD(), LAG(), FIRST_VALUE(), NTH_VALUE()
# LEAD():- USED TO GET PRECEEDING VALUES OR NEXT VALUES IN THE ROW.
# LAG():-  USED TO GET SUCCEEDING VALUES OR PREVIOUS VALUES IN THE ROW.

select name,age,department,salary, lead(salary,1) over (order by salary) as 'next_salary' from employee204

select name,age,department,salary, lag(salary,2) over (order by salary) as 'prev_salary' from employee204

select name,age,department,salary, first_value(salary) over (partition by department order by salary) as 'lowest_salary' from employee204

select name,age,department,salary, nth_value(salary,3) over (partition by department order by salary) as 2nd_salary from employee204

## COMMON TABLE EXPRESSION (CTE):-
## SYNTAX:- with cte_name(coloumn_name1,coloumn_name2) as (select coloumn_name1,coloumn_name2 from Table Name) 
## select coloumn_name1,coloumn_name2 from cte_name;

with name_age(name,age) as (select name,age from employee204) select name,age from name_age;

with salary_limit(name,salary) as (select name, if(salary>=30000,'greater than equal to','less than equal to')
as 'salary_limit' from employee204 where department='Marketing') select name,salary from salary_limit;


#(MYSQL-Project 05)
#MYSQL-DateTime

create table orders204(
order_id int,
cust_name varchar(20),
product varchar(20),
order_date date,
delivery_date date)


insert into orders204 values(1,'Simran','Mobile phone','2022-01-01','2022-01-07');
insert into orders204 values(2,'Harsh','Laptop','2022-01-03','2022-01-08');
insert into orders204 values(3,'Tanuja','Dress','2022-02-03','2022-02-09');
insert into orders204 values(4,'Vedant','Earphones','2022-02-04','2022-02-09');
insert into orders204 values(5,'Abhishek','Microwave oven','2022-03-09','2022-03-15');
insert into orders204 values(6,'Sanika','Makeup','2022-03-14','2022-03-20');
insert into orders204 values(7,'Sami','Tablet','2022-04-05','2022-04-07')

select * from orders204

select now() as 'Current Timestamp' from orders204

select curdate() as 'Current Date', curtime() as 'Current Time' from orders204

select order_id,order_date, date_add(order_date, interval 30 day) as 'order pay date' from orders204

select order_id,order_date, date_add(order_date, interval 1 year) as 'order pay year' from orders204

select order_id,order_date, date_sub(order_date, interval 7 day) as 'order substracted pay date' from orders204

select delivery_date, extract(year from delivery_date) as 'Extracted year',
extract(month from delivery_date) as 'Extracted month',
extract(day from delivery_date) as 'Extracted day' from orders204

select datediff(delivery_date,order_date) as 'Date Difference' from orders204