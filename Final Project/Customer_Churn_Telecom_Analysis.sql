-- Creating New DataBase Name EverMart.
create database telecom;

-- Using Telecom DataBase
Use telecom;

-- To See Whole Table
select * from customer_churn;

-- Adding New Columns
alter table customer_churn
add column estimated_revenue decimal(10, 2),
add column likely_complaint tinyint(1),
add column tenure_segment varchar(20);


-- Update Estimated Revenue
update customer_churn 
set estimated_revenue = MonthlyCharges * tenure;

-- Update Likely Complaint
update customer_churn
set likely_complaint = 
case 
when onlineSecurity = 'No' and techSupport = 'No' Then 1
else 0
end;

-- Update Tennure Segment
Update customer_churn
Set tenure_segment = 
Case 
When tenure <= 6 then 'New'
When tenure Between 7 and 24 then 'Mid-Term'
Else 'Long-Term'
END;

-- To See Whole Table
select * from customer_churn;

