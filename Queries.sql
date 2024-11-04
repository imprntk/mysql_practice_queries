create database dac_dbt; use dac_dbt; 
 
create table dept( deptcode varchar(15), deptname varchar(60), budget int); 
 
create table grade( gradecode varchar(15), gradelevel varchar(30), gradedescription varchar(60), 
basic int); 
 
create table desig( desigcode varchar(15), designame varchar(15)); 
 
create table emp( empcode varchar(15), empname varchar(60), deptcode varchar(15), birthdate date not null, joindate date not null, sex char(1) check(sex in ('M','F','T')), desigcode varchar(15), supcode varchar(15), gradecode varchar(15), gradelevel varchar(30), basicpay int); 
 
create table salary( 
empcode varchar(15), salmonth date not null, basic numeric, allow numeric, deduct numeric); 
 
create table history( empcode varchar(15),  changedate date not null, desigcode varchar(15),  gradecode varchar(15), gradelevel varchar(30), basicpay numeric); 
 
alter table dept add primary key(deptcode); alter table desig add primary key(desigcode); alter table emp add primary key(empcode); alter table salary add primary key(empcode,salmonth); alter table history add primary key(empcode,changedate,desigcode,gradecode,gradelevel); alter table grade add primary key(gradecode,gradelevel); 
 
alter table emp add foreign key(deptcode) references dept(deptcode); alter table emp add foreign key(desigcode) references desig(desigcode); alter table emp add foreign key(supcode) references emp(empcode); alter table emp add foreign key(gradecode,gradelevel) references grade(gradecode,gradelevel); alter table history add foreign key(empcode) references emp(empcode); alter table history add foreign key(desigcode) references desig(desigcode); alter table history add foreign key(gradecode,gradelevel) references grade(gradecode,gradelevel); alter table salary add foreign key(empcode) references emp(empcode); 
 
insert into dept values('ACCT', 'Accounts', 19), ('PRCH', 'Purchase', 25), 
('SALE', 'Sales', 39), 
('STOR', 'Stores', 33), 
('FACL', 'Facilities', 42), 
('PERS', 'Personal', 12); 
 
insert into grade  values('GC1', 'GL1', 'GC-GL-1', 25000), ('GC4', 'GL1', 'GC-4-GL-1', 21000), 
('GC4', 'GL4', 'GC-4-GL-4', 15000), 
('GC6', 'GL1', 'GC-6-GL-1', 13000), 
('GC6', 'GL2', 'GC-6-GL-2', 11000), 
('GC12', 'GL1', 'GC-12-GL-1', 9000), 
('GC12', 'GL2', 'GC-12-GL-2', 8500), 
('GC12', 'GL3', 'GC-12-GL-3', 8000), 
('GC15', 'GL1', 'GC-15-GL-1', 7000), 
('GC15', 'GL2', 'GC-15-GL-2', 6500), 
('GC15', 'GL3', 'GC-15-GL-3', 6000), 
('GC20', 'GL1', 'GC-20-GL-1', 3500), 
('GC20', 'GL2', 'GC-20-GL-2', 3000), 
('GC20', 'GL3', 'GC-20-GL-3', 2500), 
('GC20', 'GL4', 'GC-20-GL-4', 2000); 
 
insert into desig values('CLRK', 'Clerk'), ('SLMN', 'Sales Man'), 
('MNGR', 'Manager'), ('SPRV', 'Supervisor'), 
('PRES', 'Personal'); 
 
insert into 
emp(empcode,empname,deptcode,birthdate,joindate,sex,desigcode,supcode,gradecode,gradelevel, basicpay)  values ('7839', 'Reddy', 'ACCT', '1959-12-12', '1981-07-17', 'M','PRES', null, 'GC1', 'GL1', 32000), ('7566', 'Jain', 'PRCH', '1955-01-24', '1981-04-02', 'F', 'MNGR', '7839', 'GC6', 'GL2',12400), 
('7698', 'Murthy', 'SALE', '1960-09-16', '1981-05-01', 'F', 'MNGR', '7839', 'GC6', 'GL1',14700), 
('7782', 'Menon', 'ACCT', '1967-08-30', '1981-06-09','M', 'MNGR', '7839', 'GC6', 'GL2',12400), 
('7902', 'Naik', 'PRCH', '1958-02-20', '1981-12-03', 'M', 'MNGR', '7839', 'GC6', 'GL2',11800), 
('7654', 'Gupta', 'SALE', '1957-01-22', '1981-09-28', 'M', 'SLMN', '7698', 'GC6', 'GL2',12600), 
('7521', 'Wilson', 'STOR', '1956-03-18', '1981-02-22', 'M', 'MNGR', '7698', 'GC6', 'GL2',12200), 
('7844', 'Singh', 'SALE', '1956-09-09', '1981-09-08', 'F', 'SLMN', '7698', 'GC6', 'GL1', 14300), 
('7900', 'Shroff', 'SALE', '1956-06-28', '1981-12-03', 'M', 'CLRK', '7698', 'GC6', 'GL2',12000), 
('7788', 'Khan', 'PRCH', '1957-02-03', '1982-12-09', 'M', 'SPRV', '7566', 'GC6', 'GL2', 11900), 
('7499', 'Roy', 'SALE', '1957-09-27', '1981-02-20', 'M', 'SLMN', '7698', 'GC6', 'GL1', 14200), 
('7934', 'Kaul', 'ACCT', '1957-05-02', '1982-01-23', 'M', 'CLRK', '7782', 'GC6', 'GL2', 11950), 
('7369', 'Shah', 'PRCH', '1960-05-25','1983-12-17', 'M', 'CLRK', '7902', 'GC6', 'GL2',12200), 
('7876', 'Patil', 'PRCH', '1965-09-02', '1990-12-17', 'M', 'CLRK', '7788', 'GC6', 'GL2', 12300), 
('7999', 'Sinha', 'SALE', '1970-04-11', '1992-02-20', 'M', 'SLMN', '7782', 'GC6', 'GL1',14600), 
('7939', 'Rai', 'PRCH', '1988-08-10', '2012-12-06', 'M', 'CLRK', '7782', 'GC6', 'GL2', 11800), 
('7192', 'John', 'ACCT', '1968-11-05', '1994-12-03', 'M', 'CLRK', '7902', 'GC6', 'GL2',12300), 
('9902', 'Ahmad', 'SALE', '1970-02-16', '1992-04-17', 'M', 'SLMN', '7698', 'GC6', 'GL1',14200), 
('7802', 'Sanghvi','STOR', '1980-05-06', '1993-01-01', 'M', 'MNGR', '7566', 'GC6', 'GL2',12400), 
('6569', 'Tiwari', 'STOR', '1989-08-19', '2010-08-21', 'M', 'MNGR', '7782', 'GC6', 'GL2',12400); 
 
insert into salary(empcode,salmonth,basic,allow,deduct)  values('7839','2011-12-01', 30000, 3000, 1200), 
('7839', '2012-01-01', 32000, 3200, 1250), 
('7839', '2012-02-01', 32000, 3200, 1250), 
('7566', '2011-12-01', 12000, 600, 400), 
('7566', '2012-01-01', 12400, 1240, 550), 
('7566', '2012-02-01', 12400, 1240, 550), 
('7698', '2011-12-01', 13900, 800, 500), 
('7698', '2012-01-01', 14700, 1470, 650), 
('7698', '2012-02-01', 14700, 1470, 650), 
('7782', '2011-12-01', 11800, 600, 500), 
('7782', '2012-01-01', 12400, 1240, 550), 
('7782', '2012-02-01', 12400, 1240, 550), 
('7902', '2011-12-01', 11200, 600, 450), 
('7902', '2012-01-01', 11800, 1180, 550), 
('7902', '2012-02-01', 11800, 1180, 550), 
('7654', '2011-12-01', 11900, 700, 500), 
('7654', '2012-01-01', 12600, 1260, 550), 
('7654', '2012-02-01', 12600, 1260, 550), 
('7521', '2011-12-01', 11400, 800, 500), 
('7521', '2012-01-01', 12200, 1220, 550), 
('7521', '2012-02-01', 12200, 1220, 550), 
('7844', '2011-12-01', 13400, 900, 600), 
('7844', '2012-01-01', 14300, 1430, 650), 
('7844', '2012-02-01', 14300, 1430, 650), 
('7900', '2011-12-01', 11500, 500, 300), 
('7900', '2012-01-01', 12000, 1200, 550), 
('7900', '2012-02-01', 12000, 1200, 550), 
('7788', '2011-12-01', 11300, 600, 450), 
('7788', '2012-01-01', 11900, 1190, 550), 
('7788', '2012-02-01', 11900, 1190, 550), 
('7499', '2011-12-01', 13400, 800, 550), 
('7499', '2012-01-01', 14200, 1420, 650), 
('7499', '2012-02-01', 14200, 1420, 650), 
('7934', '2011-12-01', 11450, 500, 250), 
('7934', '2012-01-01', 11950, 1195, 550), 
('7934', '2012-02-01', 11950, 1195, 550), ('7369', '2011-12-01', 11600, 600, 450), 
('7369', '2012-01-01', 12200, 1220, 550), 
('7369', '2012-02-01', 12200, 1220, 550), 
('7876', '2011-12-01', 11700, 600, 500), 
('7876', '2012-01-01', 12300, 1230, 550), 
('7876', '2012-02-01', 12300, 1230, 550), 
('7999', '2011-12-01', 13950, 650, 600), 
('7999', '2012-01-01', 14600, 1460, 650), 
('7999', '2012-02-01', 14600, 1460, 650), 
('7939', '2011-12-01', 11100, 700, 400), 
('7939', '2012-01-01', 11800, 1180, 550), 
('7939', '2012-02-01', 11800, 1180, 550), 
('7192', '2011-12-01', 11700, 600, 500), 
('7192', '2012-01-01', 12300, 1230, 550), 
('7192', '2012-02-01', 12300, 1230, 550), 
('9902', '2011-12-01', 13400, 800, 500), 
('9902', '2012-01-01', 14200, 1420, 650), 
('9902', '2012-02-01', 14200, 1420, 650), 
('7802', '2011-12-01', 11900, 500, 300), 
('7802', '2012-01-01', 12400, 1240, 550), 
('7802', '2012-02-01', 12400, 1240, 550), ('6569', '2011-12-01', 11800, 600, 400), 
('6569', '2012-01-01', 12400, 1240, 550); 
 
insert into history 
(empcode,changedate,desigcode,gradecode,gradelevel,basicpay)  
values ( '7839','1981-09-17', 'CLRK', 'GC15','GL1', 7000), ( '7839', '1985-12-31', 'SLMN', 'GC12','GL3', 8000), 
( '7839', '1988-12-31', 'SPRV', 'GC12','GL2', 8500), 
( '7839', '1990-12-31', 'MNGR', 'GC12','GL1', 9000), 
( '7839', '1994-12-31', 'CLRK', 'GC6', 'GL2', 11000), 
( '7839', '1998-12-31', 'SLMN', 'GC6', 'GL1', 13000), 
( '7839', '2001-12-31', 'SPRV', 'GC4', 'GL4', 15000), 
( '7839', '2006-12-31', 'MNGR', 'GC4', 'GL1', 21000), 
( '7839', '2011-12-31', 'PRES', 'GC1', 'GL1', 25000), 
( '7566', '1981-04-02', 'CLRK', 'GC12','GL3', 8000), 
( '7566', '1991-12-31', 'SLMN', 'GC12','GL2', 8500), 
( '7566', '2001-12-31', 'SPRV', 'GC12','GL1', 9000), 
( '7566', '2011-12-31', 'MNGR', 'GC6', 'GL2', 11000), 
( '7698', '1981-05-01', 'CLRK', 'GC12','GL3', 8000), 
( '7698', '1991-05-01', 'SLMN', 'GC12','GL2', 8500), 
( '7698', '2001-05-01', 'MNGR', 'GC12','GL1', 9000), 
( '7698', '2006-05-01', 'SPRV', 'GC6', 'GL2', 11000), 
( '7698', '2011-05-01', 'MNGR', 'GC6', 'GL1', 13000), 
( '7782', '1981-06-09', 'CLRK', 'GC12','GL3', 8000), 
( '7782', '1991-06-09', 'SLMN', 'GC12','GL2', 8500), 
( '7782', '2001-06-09', 'SPRV', 'GC12','GL1', 9000), 
( '7782', '2011-06-09', 'MNGR', 'GC6', 'GL2', 11000), 
( '7902', '1981-12-03', 'CLRK', 'GC12','GL3', 8000), 
( '7902', '1991-12-03', 'SLMN', 'GC12','GL2', 8500), 
( '7902', '2001-12-03', 'SPRV', 'GC12','GL1', 9000), 
( '7902', '2011-12-03', 'MNGR', 'GC6', 'GL2', 11000), 
( '7654', '1981-09-28', 'SLMN', 'GC12','GL3', 8000), 
( '7654', '1991-09-28', 'SLMN', 'GC12','GL2', 8500), 
( '7654', '2001-09-28', 'SLMN', 'GC12','GL1', 9000), 
( '7654', '2011-09-28', 'SLMN', 'GC6', 'GL2', 11000), 
( '7521', '1981-02-22', 'CLRK', 'GC12','GL3', 8000), 
( '7521', '1991-02-22', 'SLMN', 'GC12','GL2', 8500), 
( '7521', '2001-02-22', 'SPRV', 'GC12','GL1', 9000), 
( '7521', '2011-02-22', 'MNGR', 'GC6', 'GL2', 11000), 
( '7844', '1981-09-08', 'SLMN', 'GC12','GL3', 8000), 
( '7844', '1991-09-08', 'SLMN', 'GC12','GL2', 8500), 
( '7844', '2001-09-08', 'SLMN', 'GC12','GL1', 9000), 
( '7844', '2006-09-08', 'SLMN', 'GC6', 'GL2', 11000), 
( '7844', '2011-09-08', 'SLMN', 'GC6', 'GL1', 13000), 
( '7900', '1981-12-03', 'SLMN', 'GC12','GL3', 8000), 
( '7900', '1991-12-03', 'SLMN', 'GC12','GL2', 8500), 
( '7900', '2001-12-03', 'CLRK', 'GC12','GL1', 9000), 
( '7900', '2011-12-03', 'CLRK', 'GC6', 'GL2', 11000), 
( '7788', '1982-12-09', 'SLMN', 'GC12','GL3', 8000), 
( '7788', '1992-12-09', 'CLRK', 'GC12','GL2', 8500), 
( '7788', '2002-12-09', 'MNGR', 'GC12','GL1', 9000), 
( '7788', '2012-12-09', 'SPRV', 'GC6', 'GL2', 11000), 
( '7499', '1981-02-20', 'SLMN', 'GC12','GL3', 8000), 
( '7499', '1991-02-20', 'SLMN', 'GC12','GL2', 8500), 
( '7499', '2001-02-20', 'SLMN', 'GC12','GL1', 9000), 
( '7499', '2006-02-20', 'SLMN', 'GC6', 'GL2', 11000), 
( '7499', '2011-02-20', 'SLMN', 'GC6', 'GL1', 13000), 
( '7934', '1982-01-23', 'SLMN', 'GC12','GL3', 8000), 
( '7934', '1992-01-23', 'SLMN', 'GC12','GL2', 8500), 
( '7934', '2002-01-23', 'CLRK', 'GC12','GL1', 9000), 
( '7934', '2012-01-23', 'CLRK', 'GC6', 'GL2', 11000), 
( '7369', '1983-12-17', 'SLMN', 'GC12','GL3', 8000), 
( '7369', '1993-12-17', 'SLMN', 'GC12','GL2', 8500), 
( '7369', '2003-12-17', 'CLRK', 'GC12','GL1', 9000), 
( '7369', '2006-12-17', 'CLRK', 'GC6', 'GL2', 11000); 
 
 #SECTION 2

#Que 1: List the name, employee code and designation of each employee of the office? 

select emp.empname,emp.empcode, desig.designame
from emp join desig
on emp.desigcode = desig.desigcode;

#Que 2: List all the departments and the budgets? 

select deptname, budget from dept;

#Que 3 List the employee and their respective departname names ? 

select emp.empname, dept.deptname
from emp join dept
on emp.deptcode = dept.deptcode;

#Que 4 List the employees who are not having any superior to work under ?

select empname from emp where supcode is null;

#Que 5 List the employees who are working directly under superior most employee of the office.(Assume the superior most employee who does not have a superior)

SELECT empname,empcode,desigcode FROM emp
WHERE desigcode != 'PRES' ;

#Que 6 List the employee(s) who is senior most in the office.  

select empcode, empname, joindate from emp
where joindate = (select min(joindate) from emp);

#Que 7 List the employees who will retire from the office next? 

select empcode,empname,birthdate, date_add(birthdate, interval 60 year) as Retirement_date 
from emp
where date_add(birthdate, interval 60 year) > curdate()
order by Retirement_date asc;

#Que 8 List the departments with the respective department managers ?

SELECT empname,deptcode,desigcode from emp
where desigcode in('MNGR');

#Que 9 List the employees who work as 'manager' to at least one department?

SELECT emp.empname,dept.deptname,emp.desigcode
FROM emp 
JOIN dept  ON emp.deptcode = dept.deptcode
where emp.desigcode = "mngr";





#Que 10 List the number of employees working for either 'accounts' or 'personal' or 'purchase' departments?

SELECT COUNT(emp.empcode) AS no_of_employees
FROM emp
JOIN dept ON emp.deptcode = dept.deptcode
WHERE dept.deptname IN ('accounts','personal','purchase');	

#Que 11 List the employees working for 'accounts' or 'personal' department?
 
SELECT emp.empname,emp.deptcode
FROM emp
JOIN dept ON emp.deptcode = dept.deptcode
WHERE dept.deptname IN ('accounts','personal');	

#Que 12 List the employees working for 'accounts' and 'personal' department?

SELECT emp.empname,emp.deptcode
FROM emp
JOIN dept ON emp.deptcode = dept.deptcode
WHERE dept.deptname='accounts' and dept.deptname='personal';	

#Que 13 List the employee working for 'accounts' but not for 'personal' department?

SELECT emp.empname,emp.deptcode
FROM emp
JOIN dept ON emp.deptcode = dept.deptcode
WHERE dept.deptname='accounts' and dept.deptname not in('personal');	

#Que 14 List the youngest employee of the office?

SELECT empname,birthdate
FROM emp
ORDER BY birthdate DESC
LIMIT 1;

#Que 15 List the employees who are drawing basic pay not equal to 12400?

select empname,desigcode,basicpay
from emp
where basicpay != 12400;

#Que 16 List emplouees who are drawing basic pay salary between 11000 and 12000?

select empname,desigcode,basicpay
from emp
where basicpay BETWEEN 11000 AND 12000;

#Que 17 List the employees who are drawing basic pay salary not between 11000 and 12000?

select empname,desigcode,basicpay
from emp
where basicpay NOT BETWEEN 11000 AND 12000;



#Que 18 List the employees who got salary allowance between Rs.1000 to Rs.1500 in the month of January 2012?

SELECT emp.empcode,emp.empname,salary.allow
FROM emp
JOIN salary ON emp.empcode = salary.empcode
WHERE salary.allow BETWEEN 1000 AND 1500
AND salary.salmonth BETWEEN '2012-01-01' AND '2012-01-31';

#Que 19 List the employees whose name ends with 'i' or 'y'?

SELECT empcode,empname
FROM emp
WHERE empname LIKE '%i'
OR empname LIKE '%y';

#Que 20 List the employees who have atleast 25 years of experience?

select empcode,empname,joindate
from emp 
where timestampdiff(year, joindate,curdate()) >= 25;

#Que 21: list the 'salesman' who have minimum 30 to 20 years of experience.

select emp.empcode,emp.empname,emp.joindate,timestampdiff(year, joindate,curdate()) as exper_Years
from emp 
join desig on emp.desigcode = desig.desigcode
where desig.designame = 'Salesman'
AND timestampdiff(year, joindate,curdate()) between 20 and 30;

#Que 22 list the basic salary and half of the basic salary for each experience.

select empname, basicpay, basicpay/2 as Half_Basicpay 
from emp;

#Que 23 list the employees and latest take home pay of each employee.(Hint: take home pay = basic + allowance - deductions).

select empcode, basic,(basic + allow )-deduct as Home_pay
from salary;

#Que 24 list the employees and the latest take home pay of each employee of 'accounts department'.

select emp.empcode,emp.empname,emp.basicpay,(basic + allow ) -deduct as Home_pay,emp.deptcode
from emp join salary
on emp.empcode = salary.empcode
where emp.deptcode = 'ACCT' and salary.salmonth=(select max(salary.salmonth) from salary);

#Que 25 list employees and their respective ages.

select empcode, empname, timestampdiff(year, birthdate, curdate()) as age
from emp;

#Que 26 list all the 'accounts'department employees,first ordered by their age and then by their names.

select empcode, empname, timestampdiff(year, birthdate, curdate()) as age,deptcode
from emp
where deptcode = 'ACCT'
order by age asc,empname asc;

#Que 27 list the numbers of employees directly reporting to 'reddy'.

SELECT empname,empcode,desigcode FROM emp
WHERE supcode=(select empcode from emp where empname ='Reddy');


#Que 28 list the employees who have atleast one person working under him/her and the number of their subordinates.list the employee with highest number of subordinates first,next the person with nexthighest number of subordinates and so on.

select e1.empname as Superior ,count(e2.empcode) as No_of_Subordinates 
from emp e1 join emp e2
on e1.empcode = e2.supcode
group by e2.supcode
order by No_of_Subordinates desc;

select supcode as emp_id ,count(supcode) as No_of_Sub
from emp
group by supcode
having count(supcode) > 0
order by No_of_Sub desc;

#Que 29 list the employees who have minimum 3 employees working under him/her.

select e1.empname as Superior ,count(e2.empcode) as No_of_Subordinates 
from emp e1 join emp e2
on e1.empcode = e2.supcode
group by e2.supcode
having count(e2.supcode) >= 3;

#Que 30 list the minimum and maximum salaries dreawn in each grade code.

select gradecode, min(basic) as Minimum, max(Basic) as maximum
from grade
group by gradecode;

use dac_dbt; 

#Que 31 list the employees with names of their supervisors (Hint:use join).

select e.empname AS emp_name ,s.empname AS supvisor 
from 
emp as e join emp AS s
on e.supcode = s.empcode
order by s.empname;



#Que 32 list the numbers of officer reporting to each supervisor having more than 3 people working under them.

select s.empname AS supervisor, count(e.empcode) AS officer_count
from emp as e
join emp AS s 
on e.supcode = s.empcode
group by s.empcode,s.empname
having count(e.empcode) > 3;

#Que 33 list the employees who have not got any promotion till now. 

select emp.empname, emp.empcode 
from emp left join history 
on emp.empcode = history.empcode
where history.empcode is null;

#Que 34 list the employee with maximum number of promotions.also list number of promotions than he/she got. 

select e.empname,count(h.empcode) as No_of_Promotions 
from emp as e join history as h
on e.empcode = h.empcode
group by e.empname
order by No_of_Promotions desc;

#Que 35 list the employees who got promoted in the year 1991. 

select empname, e.desigcode from emp as e join history as h
on e.empcode = h.empcode
where year(h.changedate)='1991';

#Que 36 list the departments budget and total salary drawn (by the employees of this department). 

select d.deptname, d.budget, sum(e.basicpay) as total_salary
from dept as d left join emp as e
on d.deptcode = e.deptcode
group by d.deptname, d.budget;

#Que 37 display the employees names in full uppercase. 

select upper(empname) as Employee_Name from emp ;

#Que 38 list all the employees drawing salary higher than the salary drawn bt 'jain'. 

select empname,basicpay from emp 
where basicpay > (select basicpay from emp where empname='JAIN');

#Que 39 list all the employees who have higher salary than all the employees who draw salary in the range of 11000 to 12000. 

select empname, basicpay from emp 
where basicpay not between 11000 and 12000;



#Que 40 list all the employees who have greater than average pay.display the result in the incresing order of the salary. 

select empname, basicpay from emp
where basicpay > (select avg(basicpay) from emp)
order by basicpay asc;

#Que 41 list the employees who draws highest salary. 

select empname, basicpay from emp 
where basicpay = (select max(basicpay) from emp);

#Que 42 list all the employees other than the employees who draw highest salary. 

select empname, basicpay from emp
where basicpay != (select max(basicpay) from emp);

#Que 43 list the employees who draw highest salary in each department. 

select emp.empname,emp.basicpay,emp.deptcode 
from emp join
(SELECT deptcode,max(basicpay) AS MAX_SALARY
FROM emp
GROUP BY deptcode) 
max_salary
ON emp.deptcode = max_salary.deptcode AND emp.basicpay = max_salary.MAX_SALARY;

#Que 44 list the employees getting second highest salary. 

SELECT empname,basicpay from emp
where basicpay = (select max(basicpay) from emp 
where basicpay < (select max(basicpay) from emp));

#Que 45 list the employees who are getting the fifth highest salary. 

select empname, basicpay from emp
where basicpay = (select DISTINCT basicpay
from emp 
ORDER BY basicpay DESC
LIMIT 1 OFFSET 4 );

#OR

WITH ranked_salaries as 
(select empname,basicpay,dense_rank() over (order by basicpay desc ) as salary_rank from emp)
select empname,basicpay from ranked_salaries where salary_rank=5;

#Que 46 list the female employee who draws the higest salary higher than any other female employee. 

select empname, basicpay from emp
where sex='F' and basicpay=(select max(basicpay) from emp where sex='F');
 



#Que 47 list the department name of female employee who draws the highest salary higher than any other female employee. 

select e.empname, e.basicpay, d.deptname 
from emp as e join dept as d
where sex='F' and basicpay=(select max(basicpay) from emp where sex='F');

#Que 48 list the department manager of the department,in which the female employee who draws the highest salary than any other female employee works in. 

select e.empname, e.desigcode, d.deptname
from emp as e join dept as d 
on e.deptcode=d.deptcode
where e.sex='F' and e.desigcode='MNGR'
order by e.basicpay desc
limit 1; 

#Que 49 list all male employees who draw salary greater than at least on female employee. 

select empname,basicpay from emp
where sex='M' and basicpay=(select min(basicpay) from emp where sex='F');

#Que 50 list the departments in which average salary of employee is more than average salary of the company. 

with company_Avg_Salary as
(select avg(basicpay) as avg_Salary_Of_Company from emp),
dept_avg_salary as
(select deptcode,avg(basicpay) as avg_Salary_Of_dept from emp group by deptcode)
select dept.deptname, dept_avg_sal.avg_Salary_Of_dept from deptavgsal join dep
on dept.deptcode=dept_avg_sal.deptcode
where dept_avg_sal.avg_Salary_Of_dept > (select avg_Salary_Of_Company from company_Avg_Salary);

#Que 51 list the employees drawing salary lesser than the average salary of employees work for 'accounts' department. 

select empname from emp
where basicpay < (select avg(basicpay) from emp where deptcode='ACCT');


#Views :

#Que 1 Write a view to compute the employee age of the organization?

create view emp_age
as select empcode, empname, timestampdiff(year, birthdate, curdate()) as emp_age from emp;

select * from emp_age;

#Que 2 Write a view to compute the employee experience with the organization ?

create view emp_experience
as select empcode, empname, timestampdiff(year, joindate, curdate()) from emp;

select * from emp_experience;

#Que 3 Write a view that computes the employee pay for the current month for all the employees. Hint: Compute the employee pay as the Basic + Allowance - Deduction ?

create view last_sal as 
select emp.empcode, emp.empname, salary.
salmonth, (basic+allow-deduct) as sal 
from emp join salary 
on emp.empcode = salary.empcode
where salmonth= (select max(salary.salmonth) from salary);
select * from last_sal;

#or

create view  lastest_month_salary 
as select e.empname, e.empcode, s.basic, s.allow, s.deduct ,
(s.basic+s.allow-s.deduct) as latest_salary
from  emp as e join salary as s 
on e.empcode = s.empcode
where month(s.salmonth)=month() and year(s.salmonth)=year(curdate());
select * from lastest_month_salary;

#or 

create view  lastest_month_salary1 
as select e.empname, e.empcode, s.basic, s.allow, s.deduct ,
(s.basic+s.allow-s.deduct) as latest_salary
from  emp as e join salary as s 
on e.empcode = s.empcode
where month(s.salmonth)=2 and year(s.salmonth)=2012;
select * from lastest_month_salary1;

#Que 4 List the employees who are older than their supervisors.Hint Use views to implement employee age?

create view employee_age as 
select empcode, empname, timestampdiff(year,birthdate,curdate()) as age 
from emp;
select * from employee_age;

#or

select e.empcode as employee_id, e.empname as employee_name, e.age as employee_age,
s.empcode as supervisor_id, s.empname as supervisor_name, s.age as supervisor_age
from employee_age as e join employee_age as s
on e.empcode=s.empcode
where e.age > s.age;

#Que 5 Write a view to display the total number of employees in each department ?

create view employee_in_dept as 
select dept.deptname,count(empcode) as no_of_employees
from emp join dept
on emp.deptcode = dept.deptcode
group by dept.deptcode;

select * from employee_in_dept;

#Que 6 Write a view to display the total number of employees in the organization?

create view total_employees as
select count(empcode) as total_employee_in_org from emp;

select * from total_employees;

#Que 7 Use the views in Qn No 5 and Qn No 6 to display the percentage of employees in each department?

select d.deptname, d.no_of_employees,
(d.no_of_employees * 100/t.total_employee_in_org)
from employee_in_dept d, total_employees t;

#Index

#Que 1 create emp_index on table emp on the field birthdate?

create index emp_index on emp(birthdate);

#Que 2 Create unique index dept_index on table dept on the field deptname?
 
create unique index dept_index on dept(deptname);

#Que 3 Create students table with field id,name,age,gender,index on id?
 
create table student( 
id int,
name varchar(20),
age int,
gender char(1),
check(gender in ('M','F','T')) );

create index index_id on student(id);

#Que 4 Drop index of table emp?

drop index emp_index on emp;

#Que 5 Find all the index of table dept?

show index from dept;

#Que 6 Create a temporary table student with filed id ,name,age,gender?

create temporary table student(
id int,
name varchar(20),
age int,
gender char(1) check(gender in ('M','F','T')) );

#Que 7 Logout from session and login again to check if temporary table exists?

#no ans 7

 

#Que 8 Create a temporary table test?
 
create temporary table test(
id int primary key,
name varchar(20));
 
 #Que Drop temporary table test?
 
 drop temporary table if exists test;
 


