/*Assignment 2*/

/*Q.1*/
select * from employee
where deptno=10 and salary>3000
/*Q.2*/

Select id,name,marks ,
case 
   when marks>80 and marks<=100 then 'Distinction'
   when marks<=80 and marks>=60 then 'First_Class'
   when marks<60 and marks>=50 then 'First_Class'
   when marks>=40 and marks<50  then 'second_class'
   else 'fail'
end as Class
from students

/*Q.2 a)*/
select count(*) from students
where marks between 50 and 80

/*Q.2 b)*/
Select count(*) from students
where marks between 81 and 100

/*Q.3 */


select distinct city from station
where id%2=0

/*Q.4*/

select count(city) -  COUNT(distinct city) from station

/*Q.5*/

/*a)*/

select distinct city from station
where LEFT(city,1) in('a','e','i','o','u')
order by city

/*b)*/
select distinct city from station
where LEFT(city,1)  in('a','e','i','o','u')  and right(city,1) in('a','e','i','o','u')
order by city

/*c)*/
select distinct city from station
where LEFT(city,1) not in('a','e','i','o','u')
order by city

/*d)*/
select distinct city from station
where LEFT(city,1) not in('a','e','i','o','u')  and right(city,1) not in('a','e','i','o','u')
order by city

/*Q.6*/

select first_name,last_name,salary,hire_date, getdate() as toady_date,DATEDIFF(month,hire_date,GETDATE()) as difference  from emp
where salary > 2000 and DATEDIFF(month,hire_date,GETDATE())<36
order by salary desc

/*Q.7*/
select deptno,sum(salary) as total_salary from employee
group by deptno

/*Q.8*/


select count(name) as city_count from city
where population>100000
/*Q.9*/
select sum(population) as california_popultion from city
group by district
having district='California'
/*Q.10*/
select countrycode,district,AVG(population) as avg_population from city
group by countrycode , district
order by countrycode

/*Q.11*/
select o.ordernumber,o.status,c.customernumber,c.customername
from orders o inner join  customers c
on o.customerNumber=c.customerNumber
where o.status='Disputed'

