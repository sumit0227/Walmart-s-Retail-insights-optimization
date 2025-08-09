# Task 10: Analyzing Sales Trends by Day of the Week 
SELECT 
    CASE 
        WHEN DAYOFWEEK(date_clean) = 1 THEN 'Sunday'
        WHEN DAYOFWEEK(date_clean) = 2 THEN 'Monday'
        WHEN DAYOFWEEK(date_clean) = 3 THEN 'Tuesday'
        WHEN DAYOFWEEK(date_clean) = 4 THEN 'Wednesday'
        WHEN DAYOFWEEK(date_clean) = 5 THEN 'Thursday'
        WHEN DAYOFWEEK(date_clean) = 6 THEN 'Friday'
        WHEN DAYOFWEEK(date_clean) = 7 THEN 'Saturday'
    END AS Day_of_Week_Name,
    SUM(Total) AS Total_Sales
FROM 
   walmartsales
GROUP BY 
    Day_of_Week_Name
ORDER BY 
    Total_Sales DESC;
