use assignments 
select* from walmartsales 

# Task 9: Finding Top 5 Customers by Sales Volume

SELECT `Customer ID`,
    SUM(`Total`) AS Total_Revenue
FROM walmartsales
GROUP BY `Customer ID`
ORDER BY Total_Revenue DESC
LIMIT 5;
