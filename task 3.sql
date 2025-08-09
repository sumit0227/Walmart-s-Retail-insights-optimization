
# Task 3: Analyzing Customer Segmentation Based on Spending 

# Step 1: Aggregate total spending per customer
WITH CustomerSpending AS (
    SELECT 
        `Customer ID`,
        SUM(`Total`) AS TotalSpent
    FROM 
        walmartsales
    GROUP BY 
        `Customer ID`
),

#  Step 2: Rank customers using NTILE to divide them into 3 groups
RankedCustomers AS (
    SELECT 
        `Customer ID`,
        TotalSpent,
        NTILE(3) OVER (ORDER BY TotalSpent DESC) AS Tier
    FROM 
        CustomerSpending
)

# Step 3: Assign readable tier labels
SELECT 
    `Customer ID`,
    TotalSpent,
    CASE 
        WHEN Tier = 1 THEN 'High Spender'
        WHEN Tier = 2 THEN 'Medium Spender'
        WHEN Tier = 3 THEN 'Low Spender'
    END AS Spending_Tier
FROM 
    RankedCustomers
ORDER BY 
    TotalSpent DESC;
