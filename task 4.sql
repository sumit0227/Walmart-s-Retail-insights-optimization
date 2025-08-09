
#  Task 4: Detecting Anomalies in Sales Transactions 

-- Step 1: Calculate mean and std deviation for each product line
WITH ProductStats AS (
    SELECT 
        `Product line`,
        AVG(`Total`) AS avg_total,
        STDDEV(`Total`) AS std_total
    FROM 
        walmartsales
    GROUP BY 
        `Product line`
),

-- Step 2: Join with the original table and calculate how far each Total is from the mean
AnomalyCheck AS (
    SELECT 
        w.`Invoice ID`,
        w.`Product line`,
        w.`Total`,
        ps.avg_total,
        ps.std_total,
        CASE 
            WHEN w.`Total` > ps.avg_total + 2 * ps.std_total THEN 'High Anomaly'
            WHEN w.`Total` < ps.avg_total - 2 * ps.std_total THEN 'Low Anomaly'
            ELSE NULL
        END AS Anomaly_Type
    FROM 
        walmartsales w
    JOIN 
        ProductStats ps ON w.`Product line` = ps.`Product line`
)

-- Step 3: Select only the anomalous transactions
SELECT 
    `Invoice ID`,
    `Product line`,
    `Total`,
    avg_total,
    std_total,
    Anomaly_Type
FROM 
    AnomalyCheck
WHERE 
    Anomaly_Type IS NOT NULL
ORDER BY 
    `Product line`, `Total` DESC;
