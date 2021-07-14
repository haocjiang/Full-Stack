/*1*/
select p.ProductID, p.Name, p.Color, p.ListPrice
from Production.Product p;

/*2*/
select p.ProductID, p.Name, p.Color, p.ListPrice
from Production.Product p
where p.ListPrice = 0;

/*3*/
select p.ProductID, p.Name, p.Color, p.ListPrice
from Production.Product p
where p.Color is null;

/*4*/
select p.ProductID, p.Name, p.Color, p.ListPrice
from Production.Product p
where p.Color is not null;

/*5*/
select p.ProductID, p.Name, p.Color, p.ListPrice
from Production.Product p
where p.Color is not null and p.ListPrice > 0;

/*6*/
select p.Name + ' ' + p.Color as 'Name and Color'
from Production.Product p
where p.Color is not null;

/*7*/
select 'NAME: ' + p.Name + ' -- COLOR: ' + p.Color as 'Name And Color'
from Production.Product p
where p.Color is not null;

/*8*/
select p.ProductID, p.Name
from Production.Product p
where p.ProductID between 400 and 500;

/*9*/
select p.ProductID, p.Name, p.Color
from Production.Product p
where p.Color = 'Black' or p.Color = 'Blue';

/*10*/
select*
from Production.Product p
where p.Name like 'S%';

/*11*/
select p.Name, p.ListPrice
from Production.Product p
where p.Name like 'S%'
order by p.Name;

/*12*/
select p.Name, p.ListPrice
from Production.Product p
where p.Name like 'A%' or p.Name like 'S%'
order by p.Name;

/*13*/
select p.Name
from Production.Product p
where p.Name like 'SPO%' and p.Name not like 'SPOK%';

/*14*/
select distinct p.Color
from Production.Product p
where p.Color is not null
order by p.Color desc;

/*15*/
select distinct p.ProductSubcategoryID, p.Color
from Production.Product p
where p.ProductSubcategoryID is not null and p.Color is not null;

/*16*/
select p.ProductSubcategoryID, left([Name],35) as [Name], p.Color, p.ListPrice
from Production.Product p
where p.Color not in ('Red', 'Black')
	and p.ProductSubcategoryID = 1
	or p.ListPrice between 1000 and 2000;

/*17*/
select p.ProductSubcategoryID, p.Name, p.Color, p.ListPrice
from Production.Product p
where p.Color in ('Red', 'Black')
	and p.ProductSubcategoryID = 1
	or p.ListPrice between 1000 and 2000;