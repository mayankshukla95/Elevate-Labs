-- Creating New DataBase Name EverMart.
create database EverMart;

-- Using The New DataBase.
use EverMart;

-- To See All the Data In Customer Table
Select * from Customers;

-- the column name is 'ï»¿CustomerID' we need to change to 'CustomerID'
-- to describe the table and type of column;
DESCRIBE customers;

-- Column Name is 'ï»¿CustomerID' and Data Type is 'text'
Alter Table Customers change ï»¿CustomerID CustomerID text;

-- To check Again
Describe Customers;

-- To See All the Data In Products Table
Select * from products;

-- the column name is 'ï»¿ProductID' we need to change to 'ProductID'
-- to describe the table and type of column;
DESCRIBE products;

-- Column Name is 'ï»¿ProductID' and Data Type is 'text'
Alter Table Products change ï»¿ProductID ProductID text;

-- To check Again
Describe Products;

-- To See All the Data In Transactions Table
Select * from Transactions;

-- the column name is ï»¿TransactionID we need to change to TransactionID
-- to describe the table and type of column;
DESCRIBE Transactions;

-- Column Name is 'ï»¿TransactionID' and Data Type is 'text'
Alter Table Transactions change ï»¿TransactionID TransactionID text;

-- To check Again
Describe Transactions;


-- Question 1.  Use SELECT, WHERE, ORDER BY, GROUP BY

-- Select
Select * from Customers;

-- Where
Select * from Customers
where CustomerID = 'C0011';

-- Order By
Select * from Customers
order by SignupDate Desc;

-- Group By
Select Region, count(*) As Customer_Count  from Customers
Group By Region;


-- Question 2. Use JOINS (INNER, LEFT, RIGHT)

-- Inner Join
Select * from Customers c inner join Transactions t 
on c.CustomerID=t.CustomerID inner join Products p
on t.ProductId=p.ProductID;

-- Left Join
Select * from Customers c Left join Transactions t 
on c.CustomerID=t.CustomerID Left join Products p
on t.ProductId=p.ProductID;

-- Right Join
Select * from Customers c Right join Transactions t 
on c.CustomerID=t.CustomerID Right join Products p
on t.ProductId=p.ProductID;


-- Question 3. Use aggregate functions (SUM, AVG).
-- Sum
Select Category, Sum(Price) As Sum_Price from Products
group by Category;

-- Average
Select Category, Round(Avg(Price), 2) As Avg_Price from Products
group by Category
order by Avg_Price Desc;



-- Question 4. Write subqueries.

-- Question. Find The CustomerID, CustomerName, Toatal_Spend for 2nd Highest Total_Spend ?
Select c.CustomerID, c.CustomerName, subquery.Total_Spend from Customers c
Inner Join (
Select CustomerID, Sum(TotalValue) as Total_Spend from Transactions
group by CustomerId
Order By Total_Spend Desc
Limit 1 offset 1
) as subquery 
on c.CustomerId=subquery.customerid ;



-- Question 5. Create views for analysis

-- Question Highest Spending Customer ?
Create View  HighestSpendingCustomer As
Select c.CustomerId, c.CustomerName, Subquery.Total_Spend from Customers c
Inner Join (
Select CustomerID, Sum(TotalValue) as Total_Spend
from transactions
group by CustomerId
order by Total_Spend Desc
Limit 1) As Subquery
on c.CustomerId=Subquery.CustomerID;


-- To Check Or See The View.
Select * from HighestSpendingCustomer;

-- Question 6. Optimize queries with indexes.
-- To Make The Index.
Create Index idx_customer_id on Transactions(CustomerID(255));

-- To Check The Index In Table.
Show Index From transactions;

-- To Drop The Index.
Drop Index idx_customer_id on Transactions;











