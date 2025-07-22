Select distinct(customer_id) from retail_sales
where
	transactions_id IS NULL 
	OR
	sale_date IS NULL
	OR
	sale_time IS NULL 
	OR
	customer_id IS NULL 
	OR 
	gender IS NULL 
	OR 
	age IS NULL 
	OR
	age IS NULL
	OR
	category IS NULL
	OR
	quantiy IS NULL
	OR
	price_per_unit IS NULL
	OR
	cogs IS NULL 
	OR 
	total_sale IS NULL 

	delete from retail_sales
	where
	transactions_id IS NULL 
	OR
	sale_date IS NULL
	OR
	sale_time IS NULL 
	OR
	customer_id IS NULL 
	OR 
	gender IS NULL 
	OR 
	age IS NULL 
	OR
	age IS NULL
	OR
	category IS NULL
	OR
	quantiy IS NULL
	OR
	price_per_unit IS NULL
	OR
	cogs IS NULL 
	OR 
	total_sale IS NULL

select count(*) from retail_sales
select * from retail_sales

--Data exploration 
--How many sales we have?
select count(DISTINCT(customer_id)) as total_sale from retail_sales

select DISTINCT(category) as Categories from retail_sales

--Q1) write a SQL query to retrieve all columns for sales made on '2022-11-05'

select *
from retail_sales 
where sale_date = '2022-11-05'

--Q2) '' to retreive all transactions where category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-22
SELECT 
*
from retail_sales
WHERE CATEGORY = 'Clothing'
 AND 
 to_char(sale_date, 'YYYY-MM') = '2022-11'
 AND
 quantiy >= 4

Select 
category,
sum(total_sale)
from retail_sales
group by category


select
round(avg(age), 2)
from retail_sales
where category = 'Beauty'

Q5 '' 
select
distinct(customer_id), transactions_id
from retail_sales 
where total_sale > 1000

Q6) 
select 
gender, category,count(transactions_id)
from retail_sales
group by gender, category
order by 2

Q7)
select
	year,
	month,
	avg_sale
from
(
select 
	EXTRACT(YEAR from sale_date) as year,
	EXTRACT(MONTH from sale_date) as month,
	avg(total_sale) as avg_sale,
	rank()over(partition by extract(year from sale_date) order by avg(total_sale) DESC) as rank
from retail_sales
group by 1,2
) as t1
where rank = 1
--	order by 1,3 DESC

Q8)
Select 
customer_id, sum(total_sale) as Total_Sum 
from retail_sales
group by 1
order by 2 DESC
limit 5

Q9) 
select
count(distinct(customer_id)), category
from retail_sales 
group by category 


Q10) 
Select *,
	case 
		when extract(hour from sale_time) <  12 then 'Morning'
		when extract(hour from sale_time) Between 12 and 17 then 'afternoon'
		when extract(hour from sale_time) > 17 then 'Evening'
	end as shift
from retail_sales