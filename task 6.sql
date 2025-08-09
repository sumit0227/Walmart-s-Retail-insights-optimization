
#  Task 6: Monthly Sales Distribution by Gender 

SELECT MONTH(Date_clean) AS Sale_Month,
    `Gender`,
    SUM(`Total`) AS Total_Sales
FROM walmartsales
GROUP BY MONTH(Date_clean), `Gender`
ORDER BY 
    Sale_Month, Gender;
