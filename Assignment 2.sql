-- Answer following questions

--1. A result set is a set of rows from a data database

--2. Union is used to extracting rows by specified conditions in the query while Union all extracts all the rows from both tables.

--3. Intersect, Except

--4. Join is used to combine columns from both tables while union is used to combine rows from both tables

--5. Inner join will only fetch records that have matching values in both tables, while full join returns all records from both tables, including non matching ones.

--6. Left join will return all records from the left table and the matching records from the right table, while full join returns all records from both tables, including non matching ones.

--7. Cross join is used to return all the combinations of rows from the first table and rows from the second table.

--8. Having is used with the Group By function in a query and can be used with aggregate functions, whereas Where cannot be used with aggregate functions and it's a kind of first filter.

--9. Yes, group by can contain two or more columns.


-- Write queries for following scenarios

--1.
select count(productID)
from production.Product
-- Answer: There are 504 products

--2.
select count(p.ProductID)
from Production.Product p
where p.ProductSubcategoryID is not null;

--3.
select p.ProductSubcategoryID, count(p.ProductID) CountedProducts
from Production.Product p
group by p.ProductSubcategoryID

--4.
select count(p.ProductID)
from Production.Product p
where p.ProductSubcategoryID is null;

--5.
select count(p.Quantity) totalQuantity, max(p.Quantity) maxQuantity, min(p.Quantity) minQuantity, avg(p.Quantity) avgQuantity
from Production.ProductInventory p

--6.
select p.ProductID, count(p.Quantity) TheSum
from Production.ProductInventory p
where p.LocationID = 40
group by p.ProductID
having count(p.Quantity) < 100

--7.
select shelf, p.ProductID, count(p.Quantity) TheSum
from Production.ProductInventory p
where p.LocationID = 40
group by p.Shelf, p.ProductID
having count(p.Quantity) < 100

--8.
select p.ProductID, avg(p.quantity) TheAvg
from Production.ProductInventory p
where p.LocationID = 10
group by p.ProductID

--9.
select p.ProductID, p.Shelf, avg(p.Quantity) TheAvg
from Production.ProductInventory p
group by p.Shelf, p.ProductID

--10.
select p.ProductID, p.Shelf, avg(p.Quantity) TheAvg
from Production.ProductInventory p
where p.Shelf != 'N/A'
group by p.Shelf, p.ProductID

--11.
select p.Color, p.Class, count(p.ListPrice) TheCount, avg(p.ListPrice) AvgPrice
from Production.Product p
where p.Color is not null and p.Class is not null
group by p.Color, p.Class

--12.
select cr.[Name] Country, sp.[Name] Province
from Person.CountryRegion cr join Person.StateProvince sp
on cr.CountryRegionCode = sp.CountryRegionCode
order by cr.[Name]

--13.
select cr.[Name] Country, sp.[Name] Province
from Person.CountryRegion cr join Person.StateProvince sp
on cr.CountryRegionCode = sp.CountryRegionCode
where cr.[Name] in ('Germany', 'Canada')
order by cr.[Name]

--14.
select distinct p.ProductName
from dbo.Products p 
join dbo.[Order Details] od
on p.ProductID = od.ProductID 
join dbo.Orders o 
on od.OrderID = o.OrderID 
where o.OrderDate between '1996' and '2021';

--15.
select top 5 o.ShipPostalCode, count(o.ShipPostalCode)
from dbo.Orders o
group by o.ShipPostalCode
order by count(o.ShipPostalCode) desc

--16.
select top 5 o.ShipPostalCode
from dbo.Orders o
where o.OrderDate between '01/01/2001' and '01/01/2021'
group by o.ShipPostalCode
order by count(o.ShipPostalCode) desc

--17.
select c.City, count(c.customerID) NumOfCustomers
from dbo.Customers c
group by c.City

--18.
select c.City, count(c.customerID) NumOfCustomers
from dbo.Customers c
group by c.City
having count(c.customerID) > 10

--19.
select c.ContactName
from dbo.Orders o join dbo.Customers c
on o.CustomerID = c.CustomerID
where o.OrderDate > '01/01/1998'

--20.
select c.ContactName, max(o.OrderDate)
from dbo.Orders o join dbo.Customers c
on o.CustomerID = c.CustomerID
group by c.ContactName

--21.
select c.ContactName, sum(od.Quantity)
from dbo.Customers c join dbo.Orders o
on c.CustomerID = o.CustomerID
join dbo.[Order Details] od
on o.OrderID = od.OrderID
group by c.ContactName

--22.
select c.CustomerID, sum(od.Quantity)
from dbo.Customers c join dbo.Orders o
on c.CustomerID = o.CustomerID
join dbo.[Order Details] od
on o.OrderID = od.OrderID
group by c.CustomerID
having sum(od.Quantity) > 100

--23.
select su.CompanyName, sh.CompanyName
from dbo.Shippers sh cross join dbo.Suppliers su

--24.
select o.OrderDate, p.ProductName
from dbo.orders o join dbo.[Order Details] od
on o.OrderID = od.OrderID
join dbo.Products p
on od.ProductID = p.ProductID

--25.
select e.LastName, e.FirstName, m.LastName, m.FirstName
from dbo.Employees e join dbo.Employees m
on e.Title = m.Title

--26.
select m.FirstName, m.LastName
from dbo.Employees e join dbo.Employees m
on e.ReportsTo = m.EmployeeID
group by m.FirstName, m.LastName
Having count(m.ReportsTo) > 2

--27.
select c.City, c.ContactName, 'Customer' as Type
from dbo.Customers c
union
select s.City, s.ContactName, 'Supplier' as Type
from dbo.Suppliers s

--28.
--select*
--from F1 join F2
--on F1.T1 = F2.T2

--F1.T1	F2.T2
--2		2
--3		3

--29
--select*
--from F1 left join F2
--on F1.T1 = F2.T2

--F1.T1	F2.T2
--1		null
--2		2
--3		3