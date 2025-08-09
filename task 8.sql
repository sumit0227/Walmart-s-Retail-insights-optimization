
--  # Task 8: Identifying Repeat Customers 

SELECT 
    a.`Customer ID`, 
    STR_TO_DATE(a.date_clean , '%d/%m/%Y') AS First_Purchase, 
    STR_TO_DATE(b.date_clean , '%d/%m/%Y') AS Repeat_Purchase, 
    DATEDIFF(STR_TO_DATE(b.date_clean , '%d/%m/%Y'), STR_TO_DATE(a.date_clean, '%d/%m/%Y')) AS Days_Between
FROM 
    walmartsales a
JOIN 
    walmartsales b 
    ON a.`Customer ID` = b.`Customer ID`
    AND a.`Invoice ID` <> b.`Invoice ID`
WHERE 
    DATEDIFF(
        STR_TO_DATE(b.date_clean, '%d/%m/%Y'), 
        STR_TO_DATE(a.date_clean, '%d/%m/%Y')
    ) BETWEEN 1 AND 30
ORDER BY 
    a.`Customer ID`, Days_Between;