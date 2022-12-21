/* Q.1 */

Create procedure order_status @month datetime, @year datetime
as
Select [orderNumber],[OrderDate],status from Orders where month([orderdate])=@month and  year([OrderDate])=@year

exec order_status @month=01,@year=2003

/*Q.2*/

Create table cancellations(
id int not null identity(1,1),
customernumber int,
ordernumber int,
primary key(id),
foreign key (customernumber) references customers (customernumber),
foreign key (ordernumber) references orders (ordernumber))

create procedure cancelled 
as 
Insert into cancellations
(ordernumber,customernumber)
select ordernumber,customernumber from orders
where status='Cancelled'

exec cancelled

/*Q.3 a */

select * ,
case 
when amount > 50000 then 'Platinum'
when amount < 50000 and amount>25000 then 'Gold'
else 'Silver'
end 
as purchase_status from payments
order by amount

/*Q.3 b*/

select c.customernumber,c.customername, 
case 
when amount > 50000 then 'Platinum'
when amount < 50000 and amount>25000 then 'Gold'
else 'Silver'
end 
as purchase_status
from payments p left join customers c
on p.customernumber=c.customernumber
order by purchase_status

/* Q.4*/

CREATE trigger rental_update ON movies
AFTER UPDATE AS
BEGIN
update rentals
SET movieid=m.id
FROM rentals AS r
INNER JOIN inserted AS m
ON r.movieid=m.id
END

CREATE trigger rental_delete ON movies
AFTER delete AS
BEGIN
delete rentals
SET movieid=m.id
FROM rentals AS r
INNER JOIN inserted AS m
ON r.movieid=m.id
END

/*Q.5*/
select max(Salary) from employee where salary<(select max(Salary) from employee 
where salary<(Select max(salary) from employee))

/*Q.6*/
select * ,RANK()over( order by salary) as rank from employee