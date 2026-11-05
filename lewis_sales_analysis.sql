-- Capstone 1: Connecticut Sales Analysis
-- Question 1: Total revenue and transaction date range  
USE sample_sales;

-- Online sales for Connecticut
SELECT
    COUNT(*) AS TransactionCount,
    MIN(Date) AS FirstTransaction,
    MAX(Date) AS LastTransaction,
    SUM(SalesTotal) AS TotalRevenue
FROM online_sales
WHERE ShiptoState = 'Connecticut';

-- In-store sales for Connecticut
SELECT
    COUNT(*) AS TransactionCount,
    MIN(Transaction_Date) AS FirstTransaction,
    MAX(Transaction_Date) AS LastTransaction,
    SUM(Sale_Amount) AS TotalRevenue
FROM store_sales
WHERE Store_ID IN (
    SELECT StoreId
    FROM store_locations
    WHERE State = 'Connecticut'
);
