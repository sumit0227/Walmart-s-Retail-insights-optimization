#  Task 2: Finding the Most Profitable Product Line for Each Branch

WITH ProfitPerLine AS (
    SELECT 
        Branch,
        `Product line`,
        SUM(`gross income`) AS Total_Profit
    FROM 
        walmartsales
    GROUP BY 
        Branch, `Product line`
),
MaxProfitPerBranch AS (
    SELECT 
        Branch,
        MAX(Total_Profit) AS Max_Profit
    FROM 
        ProfitPerLine
    GROUP BY 
        Branch
)
SELECT 
    p.Branch,
    p.`Product line`,
    p.Total_Profit
FROM 
    ProfitPerLine p
JOIN 
    MaxProfitPerBranch m
ON 
    p.Branch = m.Branch AND p.Total_Profit = m.Max_Profit
ORDER BY 
    p.Branch;
