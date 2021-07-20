-- Execute the schema.sql and data.sql
@schema.sql
@data.sql

-- 1.1 The SQL query to list the region names and the number of countries within the regions in the above database

select r.region_ID, r.region_name, count(c.country_name)
From regions r, countries c
where c.region_ID=r.region_ID
group by r.region_ID, r.region_name;

-- 1.2 The SQL query to find all customers who have made orders before 2017

Create table Ordersbf2017 (Customer_ID int,Customer_Name varchar(50) );


Insert into Ordersbf2017(Customer_ID,Customer_Name) select c.customer_ID,c.name
from customers c,orders o
where c.customer_ID = o.customer_ID and o.order_date <= '31-DEC-17';


Select Customer_ID, Customer_name from Ordersbf2017
group by Customer_ID, Customer_name
order by Customer_ID desc;

-- 1.3 The SQL query to list all customers who have the sequential letters ‘co’ in the customer name

Create table CustomernameCO (Customer_ID int,Customer_name varchar(50) );


Insert into CustomernameCO(customer_ID,customer_name) select customer_ID,name
from customers where name LIKE '%co%';


Select Customer_ID,Customer_name from CustomernameCO
order by Customer_name asc;

-- 1.4 The  SQL  query  to  list  all  products’  ID,  Name  and  price  where  the  products  haven’t  been purchased by any customer in the database

Create table NoPurchaseProducts (Product_ID int, Product_Name varchar(50),Price int);


Insert into NoPurchaseProducts(Product_ID,Product_Name,Price) 
select product_ID,product_name,list_price from products p
where not exists (select null from order_items oi where oi.product_ID = p.product_ID);


Select * from NoPurchaseProducts
order by Price;

-- 1.5 The SQL query to list all the warehouses and their total sales

Create table Sales (WarehouseID int, WarehouseName varchar(50), Sales int);


Insert into Sales(WarehouseID,WarehouseName,Sales) 
select w.warehouse_ID, w.warehouse_name, oi.quantity*oi.unit_price 
from warehouses w, order_items oi, inventories i 
where oi.product_ID=i.product_ID and i.warehouse_ID=w.warehouse_ID;


Select warehouseID, warehouseName, sum(Sales) as TotalSales
from Sales
group by warehouseID, warehouseName
order by TotalSales desc;

-- 1.6 The SQL query to list the employees and the quantity of orders that they proceeded in the database

Create table Salesman (ID int,First_name varchar(50), Last_name varchar(50), Proceeded_orders int);


Insert into Salesman (ID,First_name,Last_name,Proceeded_orders)
select e.employee_ID,e.first_name,e.last_name,count(o.status)
from employees e,orders o
where o.salesman_ID = e.employee_ID and status = 'Shipped'
group by e.employee_ID,e.first_name,e.last_name;


Select * from Salesman
order by Proceeded_orders desc;

--- Drop tables before starting question 2
DROP TABLE order_items;  
DROP TABLE orders;
DROP TABLE inventories;
DROP TABLE products;
DROP TABLE product_categories;
DROP TABLE warehouses;
DROP TABLE employees;
DROP TABLE contacts;
DROP TABLE customers;
DROP TABLE locations;
DROP TABLE countries;
DROP TABLE regions;
