--1.
--A view is a virtual table whose contents are defined by a query. Like a real table, a view consists of a set of columns and rows of data
--View can perform security, query simplicity, structural simplicity, consistency, data integrity and logical data independence

--2.
--Yes, data can be modified through views, it will affect on the base database.

--3.
--A stored procedure groups one or more T-SQL statements into a logical unit, stored as an object in an SQL Server database
--Benefits of using stored procedures includes inscreasing database security, enabling faster execution, helping centralize T-SQL code in the data tier, 
--helping reduce network traffic for larger ad hoc queries, and encouraging code reusability

--4.
--View is simple showcasing data stored in the database tables whereas a stored procedure is a group of statements that can be executed.

--5.
--The function must return a value but in stored procedure it is optional.
--Functions can have only input parameters for it whereas stored procedures can have both input and output parameters
--Functions can be called from procedure whereas procedures cannot be called from a function

--6.
--Stored procedure can always return multiple result sets

--7.
--Yes, stored procedure can be executed as part of SELECT statement

--8.
--Trigger is a special type of stored procedure that is automatically executed when a DDL or DML command statement related to the trigger is executed.
--There are four types of triggers: DDL triggers, DML triggers, CLR triggers, and Logon triggers

--9.
--Trigger can be invoked when a row is inserted into a specified table or when certain table columns are being updated

--10.
--stored procedure can be invoked explicitly by the user whereas triggers can execute automatically based on the events
--sp can take input as a parameter whereas triggers cannot
--sp can use transaction statements like begin, commit, and rollback whereas triggers cannot
--sp can return values whereas triggers cannot


--Write queries for following scenarios
--1.
--a.
insert into Region values(5, 'Middle Earth')
--b.
insert into Territories values(10000, 'Gondor', 5)
--c.
insert into Employees(EmployeeID, LastName, FirstName, Territory) values (10, 'King', 'Aragorn', 'Gondor')

--2.
update Territories set TerritoryDescription = 'Arnor'
where TerritoryID = 10000

--3.
delete from Territories
where TerritoryID = 10000 and TerritoryDescription = 'Arnor' and RegionID = 5

--4.
create view view_product_Order_Jiang
as
select p.ProductName, sum(od.Quantity) totalQuantity
from Products p inner join [Order Details] od
on p.ProductID = od.ProductID
group by p.ProductName

--5.
create proc sp_product_order_quantity_Jiang
@id int,
@totalQuantity int out
as
begin
	select @totalQuantity = view_product_Order_Jiang.totalQuantity from Products where @id = ProductID
end

declare @id int, @total int
exec sp_product_order_quantity_Jiang 2, @total out
print @total

--6.
create proc spProductOrderCityJiang
@name varchar(20),
@city varchar(20) out
as
begin
	select @name = view_product_Order_Jiang.ProductName from 		
end

--7.
create proc spMoveEmployeesJiang
@name varchar(50) = 'Tory'
as
if exists(select e.EmployeeID, count(t.TerritoryDescription) c from Territories t
join EmployeeTerritories et on t.TerritoryID = et.TerritoryID
join Employees e on et.EmployeeID = e.EmployeeID
where t.TerritoryDescription = @name and count(t.TerritoryDescription) > 0)
begin
	insert into Territories values (98432, 'Stevens Point', 11)
	insert into Region values(11, 'North')
end
go

--8.
create trigger trgJiang
on territories
for update as
if exists(select e.employeeid, count(t.TerritoryDescription) from Territories t
join EmployeeTerritories et on t.TerritoryID = et.TerritoryID
join Employees e on et.EmployeeID = e.EmployeeID
where t.TerritoryDescription = 'Stevens Point'
group by e.EmployeeID
having count(t.TerritoryDescription) > 100)
begin
	update Territories
	set TerritoryDescription = 'Troy'
	where TerritoryDescription = 'Stevens Point'
end
drop trigger trgJiang

--9.
create table peopleJiang(id int, name varchar(20), cityid int)
create table cityJiang(cityid int, city varchar(20))
insert into peopleJiang values(1, 'Aaron Rodgers', 2)
insert into peopleJiang values(2, 'Russell Wilson', 1)
insert into peopleJiang values(3, 'Jody Nelson', 2)
insert into cityJiang values(1, 'Seattle')
insert into cityJiang values(2, 'Green Bay')

update cityJiang set city = 'Madison'
where cityid = 1

create view PackersJiang
as
	select * from peopleJiang p join cityJiang c on p.cityid = c.cityid
	where c.city = 'Green Bay'
begin tran
rollback
drop table peopleJiang
drop table cityJiang
drop view PackersJiang

--10.
create proc spBirthdayemployees
as
begin
	select e.EmployeeID, e.LastName, e.FirstName, e.Title, e.TitleOfCourtesy, e.BirthDate, e.HireDate, e.Photo
	into birthdayEmployeesJiang
	from Employees e
	where MONTH(BirthDate) = 2
end
drop table birthdayEmployeesJiang

--11.
create proc spJiang
as
begin
select c.city, count(c.customerID)
from Customers c inner join
	(select x.CustomerID, count(x.CustomerID) xx
	from (select distinct c.customerID, p.ProductID
			from Products p
			join [Order Details] od on p.ProductID = od.ProductID
			join Orders o on od.OrderID = o.OrderID
			join Customers c on o.CustomerID = c.CustomerID) x
			group by x.CustomerID
			having count(x.CustomerID) < 2) s
on c.CustomerID = s.CustomerID
group by city
having count(c.CustomerID) > 1
end

--12.
--select * from table1
--union
--select * from table2
--If you get records greater than any of two tables, they don't have same data

--14.
declare @fullname varchar(20)
select @fullname - firstname + lastname + middlename + '.' from people
print @fullname

--15.
declare @student varchar(20)
declare @marks int
set @student
set @marks = (select max(marks) from student where sex = 'F')
print @student

--16.
