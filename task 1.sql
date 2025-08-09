# Task 1: Identifying the Top Branch by Sales Growth Rate

select * from walmartsales 

# calculate total monthly sales for each Branch 

select branch , date_format(date_clean, '%Y-%m') as month ,
sum(total) as monthly_sales
from walmartsales
group by branch , month 
order by branch , month 

# calculate month - over - month growth rate for each branch 

SELECT branch, month, monthly_sales,
    ROUND(((monthly_sales - LAG(monthly_sales) OVER (PARTITION BY branch ORDER BY month)) / 
    LAG(monthly_sales) OVER (PARTITION BY branch ORDER BY month)) * 100, 2) AS growth_rate
FROM 
    ( SELECT branch,
        MONTH(date_clean) AS month,
        SUM(total) AS monthly_sales
    FROM  walmartsales
    GROUP BY branch, MONTH(date_clean))
    AS sales_per_month


select * from walmartsales 