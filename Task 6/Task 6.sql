-- Creating New DataBase Name OnlineSales.
create database OnlineSales;

-- Using The New DataBase.
use OnlineSales;

-- To See The Whole Table.
Select * from Sales;

-- To Drop The Table.
# Drop table Sales;


# Question 1. Use EXTRACT(MONTH FROM order_date) for month.
select month(date) as Month_Number from Sales;

# Question 2. GROUP BY year/month.

-- Month
Select Month(Date) as Month, count(*) as Month_Count from Sales
Group By month(Date);

-- Year
Select Year(Date) as Year, count(*) as Year_Count from Sales
Group By Year(Date);

# Question 3. Use SUM() for revenue.
Select Sum(Sales) as Revenue from Sales;

# Question 4. COUNT(DISTINCT Product) for volume.
Select count(Distinct Product) as count from Sales;

# Question 5. Use ORDER BY for sorting.
Select * from Sales
Order By Sales Desc;

# Question 6. Limit results for specific time periods.
Select * from Sales
Where Date  Between '2014-01-01' And '2014-06-01'
Limit 10;


-- Extra
Select max(Date) from Sales;
-- '2014-12-01'
Select min(Date) from Sales;
-- '2013-09-01'







