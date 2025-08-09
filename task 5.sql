
#  Task 5: Most Popular Payment Method by City 

-- Step 1: Count the frequency of each payment method per city
WITH CityPaymentCount AS (
    SELECT 
        `City`, 
        `Payment`, 
        COUNT(*) AS PaymentCount
    FROM 
        walmartsales
    GROUP BY 
        `City`, `Payment`
),

-- Step 2: Rank payments within each city based on frequency
RankedCityPayments AS (
    SELECT 
        `City`, 
        `Payment`, 
        PaymentCount,
        RANK() OVER (PARTITION BY `City` ORDER BY PaymentCount DESC) AS PaymentRank
    FROM 
        CityPaymentCount
)

-- Step 3: Select the most popular payment method in each city
SELECT 
    `City`, 
    `Payment`, 
    PaymentCount
FROM 
    RankedCityPayments
WHERE 
    PaymentRank = 1
ORDER BY 
    `City`;
