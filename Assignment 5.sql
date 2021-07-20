--1.
--SQL objects are schemas, journals, catalogs, tables, aliases, views, indexes, etc. An object is any SQL Server resource.
--Each object contains one or more counters that determine various aspects of the objects to monitor.

--2.
--An index is an on-disk structure associated with a table or view that speeds retrieval of rows from
--the table or view.
--Advantages: 
---Speed up the select query
---Help to make a row unique or without duplicate
---Help to sort, aggregate and group data
--Disadvantages
---Take additional disk space
---Slow down insert, update, and delete

--3.
--There are two types of indexes: clustered and non clustered

--4.
--Yes, under the unique constraints

--5.
--No, a clustered index can only be created on one table, because the data rows themselves
--can be stored in only one order.

--6.
--Yes, indexes can be created on multiple columns and the order of columns do matter.

--7.
--Yes, indexes can be created on view

--8.
--Normalization is a database design technique that help to minimize data duplication and
--to reduce data redundancy.
--There are three steps to achieve normalization:
--First normal form makes sure there's no multiple values in a single cell
--Second normal form makes sure there's no partial dependency
--Third normal form makes sure there's no transitive dependency

--9.
--Denormalization is about deliberately adding redundancy to improve performance.
--Denormalization is used when there is a lot of tables involved in retreiving data.

--10.
--There are four types of data integrity: 
---1.Row integrity, 2.Column integrity, 3.Referential integrity, 4.User-defined integrity

--11.
--Data integrity is enforced by 7 database constraints:
---Data type constraint, Default constraint, nullability constraint, primary key constraint,
---unique constraint, foreign key constraint, check constraint

--12.
-- Primary key vs Unique cosntraint 
-- 1. Unique can accept one null value but primary key does not accept any
-- 2. One table can have multiple unique constraints but only one primary key
-- 3. Primary key will sort the data by default but unique key will not
-- 4. Primary key will by default create clustered index and unique key will create non clustered index

--13.
--A foreign key (FK) is a column or combination of columns that is used to establish and enforce a link between the data in two tables. 
--You can create a foreign key by defining a FOREIGN KEY constraint when you create or modify a table. 

--14.
--Yes, a table can have multiple foreign keys

--15.
--Foreign keys can be null or duplicate

--16.
--Indexes cannot be created on table variables, but can be created on temporary tables.

--17.
--By definition transactions are a logical unit of work. Usually include at least one statement
--It changes the databse from one consistent state to another

--Write queries for following scenarios

--1.
select c.iname, sum(o.order_id) TotalOrder
from customer c join order o
on c.cust_id = o.cust_id
where year(o.order_date) = 2002
group by c.iname

--2.
select *
from person
where lastname like 'A%'

--3.
select m.name, count(*)
from person p left join
(select *
from person p where manager_id is null) m
on p.person_id = m.manager_id
group by m.name

--4.
--Triggers are caused to be executed by insert, delete and update

--5.
create table Company(company_id int primary key, company_name varchar(20) not null) 
create table Division(division_id int primary key, division_name varchar(20) not null, 
						company_id int foreign key references company(company_id))
create table Loc(location_id int primary key, address varchar(20) not null, 
						division_id int foreign key references division(division_id))
create table Contacts(mail varchar(50) primary key, 
						division_id int foreign key references division(division_id),
						location_id int foreign key references loc(location_id))
						