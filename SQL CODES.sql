create database college;
create database if not exists college;
drop database college;
drop database if exists college;

use college;
create table student(name varchar(50), age int, id int);
desc student;

insert into student values("saloni", 19, 101);
insert into student values("harsh", 23, 102);
select *from student; 


create database xyz_company;
use xyz_company;
create table employee(id int, name varchar(50), salary double);
desc employee;
insert into employee value(1, "adam", 25000);
insert into employee value(2, "bob", 30000);
insert into employee value(3, "casey", 40000);
select*from employee;


create table temp1(id int unique);
insert into temp1 values(101);
insert into temp1 values(101);
select*from temp1;


create table temp2(id int primary key);
insert into temp2 values(101);
insert into temp2 values(101);
select*from temp2;


create table emp(id int, salary int default 50000);
insert into emp(id) values(101);
select*from emp;

create table student(rollno int primary key, name varchar(50), marks int not null, grade varchar(1), city varchar(50));
insert into student(rollno, name, marks, grade, city) values(101, "saloni", 99, "A", "Jaipur"), (102, "harsh", 100, "A", "Delhi"), (103, "saloni", 98, "A", "Mumbai");
desc student;
select*from student; 
select name, grade from student;
select distinct name from student;
select*from student where marks>98;
select*from student where city="delhi";
select*from student where marks>98 and city="delhi";
select*from student where marks=98+1;
select*from student where marks between 98 and 100;
select*from student where city in("jaipur", "delhi");
select*from student where city not in("jaipur","pune");
select*from student limit 1;
select*from student order by marks asc;
select*from student order by marks desc;
  
create database school;
use school;
create table class(id int, name varchar(50), marks int);
desc class;
insert into class(id, name, marks) values(101, "saloni", 97), (102, "harsh", 99), (103, "seema", 98), (104, "pavan", 99), (105, "saloni", 99);
select*from class;
select distinct name from class;
select distinct name from class limit 2;
select max(marks) from class;
select min(marks) from class;
select avg(marks) from class;
select count(marks) from class;
select count(name) from class;
select name from class group by name;
select name, marks from class group by name;
select name, avg(marks) from class group by name;
select name, avg(marks) from class group by name order by avg(marks) desc;
select*from class order by marks desc;
select*from class order by marks asc;
select*from class order by marks desc limit 2;
drop database school;

create database country;
use country;
create table city(id int, marks int, rollno int, name varchar(50), cityname varchar(50));
insert into city(id, marks, rollno, name, cityname) values(101, 98, 1, "ram", "jaipur"), (102, 99, 2, "jack", "mumbai"), (103, 97, 3, "shyam", "jodhpur"), (104, 98, 4, "jack", "pune");
desc city;
select count(name), cityname from city group by cityname having max(marks) > 90;
SET SQL_SAFE_UPDATES = 0;
update city set marks = 100 where marks = 99;
SELECT*FROM CITY;

update city set marks = marks+1;
select*from city;

delete from city where marks>100;

create database tables;
use tables;
create table dept(id int primary key, name varchar(50));
insert into dept values(101, "jack"), (102, "sam");
select*from dept;
update dept set id = 103 where id = 102;

create table teacher(id int primary key, name varchar(50), dept_id int, foreign key(dept_id) references dept(id) on update cascade);
insert into teacher values(101, "ram", 101), (102, "john", 102);
select*from teacher;
alter table teacher add column age int;
alter table teacher add column age int not null default 19;
alter table teacher modify age varchar(2);
  
alter table teacher change age tea_age int;
alter table teacher rename to tea;
truncate table teacher;


create database school;
use school;
create table student(name varchar(20), marks int, grades varchar(1));
desc student;
insert into student values("jack", 98, "A"), ("sam", 88, "B"), ("jack", 78, "c");
select*from student;
alter table student change name full_name varchar(20);
delete from student where marks<80;
alter table student drop column grades;


create database college;
use college;
create table student(id int primary key, name varchar(50));
insert into student(id, name) values(101, "adam"), (102, "bob"), (103, "casey");
select*from student;
create table course(id int primary key, course varchar(50)); 
insert into course(id, course) values(102, "english"), (105, "math"), (103, "science"), (107, "computer science");
select*from course;

select*from student inner join course on student.id = course.id;
select*from student as s inner join course as c on s.id = c.id;
select*from student as a left join course as b on a.id = b.id;
select*from student as a  right join course as b on a.id = b.id;
select*from student as a left join course as b on a.id = b.id union select*from student as a right join course as b on a.id = b.id;

select*from student as a left join course as b on a.id = b.id where b.id is null;
select*from student as a right join course as b on a.id = b.id where a.id is null;


create database company;
use company;
create table employee(id int primary key, name varchar(50), manager_id int);
insert into employee(id, name, manager_id) values(101, "adam", 103), (102, "bob", 104), (103, "casey", null), (104, "donald", 103);
select*from employee;
select*from employee as a join employee as b on a.id = b.manager_id;
select a.name as manager_name, b.name as employee_name from employee as a join employee as b on a.id = b.manager_id;

create table student(rollno int, name varchar(50), marks int, grade varchar(1), city varchar(50));
insert into student(rollno, name, marks, grade, city) values(101, "anil", 78, "c", "pune"), (102, "bhumika", 93, "a", "mumbai"), (103, "chetan", 85, "b", "mumbai");
select*from student;
select avg(marks) from student;
select name from student where marks>87.6667;

select rollno from student where rollno % 2 = 0;
select name from student where rollno in(102, 103);
select*from student where city = "mumbai";
Select max(marks) from(select*from student where city = "Mumbai") as temp;

create view view1 as select rollno, name, marks from student;
select*from view1;
select*from view1 where marks>90;
drop view view1;
