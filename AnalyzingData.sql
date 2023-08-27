use `Awesome Chocolates`;

-- Tables Preset In Database
show tables;
-- geo
-- people
-- products
-- sales

-- Exploring The Data:
select * from sales;
select * from people;
select * from products;
select * from geo;

-- Analazing Sales:
select * from Sales;

-- Totals:
select sum(amount) as TotalSales from sales;
select sum(Boxes) as TotalSBoxes from sales;


-- By Date:
select Year(saleDate) as 'Year', Sum(amount)as Sales,Sum(Boxes)as Boxes,sum(customers) as 'Total Customer' From Sales group by year(saledate) order By year(saledate);
select month(saleDate) as 'Month', Sum(amount)as Sales,Sum(Boxes)as Boxes,sum(customers) as 'Total Customer' From Sales group by month(saledate) order By month(saledate);



-- Joining Sales and People:
-- Total Sales By Location and Team:
SELECT
  
    people.team,
    people.location,
	SUM(amount) AS Total_Amount
FROM
    Sales
JOIN
    people ON Sales.spid = people.spid
GROUP BY
    people.team, people.location;
    
SELECT
    people.team,
    people.location,
	avg(amount) AS Total_Avg_Sales,
	sum(boxes) AS Total_Boxes
FROM
    Sales
JOIN
    people ON Sales.spid = people.spid
GROUP BY
    people.team, people.location;
    
    
-- By Products:
select * from products;
-- Total Sales By Category and Size
SELECT
    products.category,
    products.size,
	sum(amount) AS Total_Sales,
	SUM(boxes) AS Total_Boxes
FROM
    Sales
JOIN
    Products ON Sales.pid = Products.pid
GROUP BY
    products.category, products.size;


SELECT
    products.category,
    products.size,
	AVG(amount) AS Total_Avg_Sales,
	SUM(boxes) AS Total_Boxes
FROM
    Sales
JOIN
    Products ON Sales.pid = Products.pid
GROUP BY
    products.category, products.size;
    
-- Toatl Boxes and Sales By Size
SELECT
    products.size,
	Sum(amount) AS Total_Sales,
	SUM(boxes) AS Total_Boxes
FROM
    Sales
JOIN
    Products ON Sales.pid = Products.pid
GROUP BY
products.size;


-- Toatl Boxes and Sales By Category
SELECT
    products.category,
	Sum(amount) AS Total_Sales,
	SUM(boxes) AS Total_Boxes
FROM
    Sales
JOIN
    Products ON Sales.pid = Products.pid
GROUP BY
products.category;
    
    
-- By Geo:
select * from Geo;
select * from sales;

-- Total Count Of Region,Country,Total Boxes,Total Amount
select 
Geo.Geo,
count(Geo.Region) as TotalRegion,
Sum(Boxes) as TotalBoxes,
Sum(Amount) as TotalAmount
from Geo 
join Sales on Sales.GeoId = Geo.Geoid 
group by Geo.Geo;

-- Total Boxes And Total Sales On Diffrent Region
Select 
Geo.Region,
Sum(Boxes) as TotalBoxes,
Sum(Amount) as TotalAmont 
from Geo 
join Sales on Sales.GeoId = Geo.Geoid
group by Geo.Region;




