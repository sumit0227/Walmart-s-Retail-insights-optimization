
#  Task 7: Best Product Line by Customer Type  

SELECT `Customer type`,`Product line`,
    SUM(`Total`) AS Total_Sales
FROM walmartsales
GROUP BY `Customer type`, `Product line`
ORDER BY `Customer type`, Total_Sales DESC;


