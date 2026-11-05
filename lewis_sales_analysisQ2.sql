
USE sample_sales;

-- Question 2: Revenue breakdown by year and month

-- Connecticut online sales: monthly revenue
SELECT
    YEAR(Date) AS SalesYear,
    MONTH(Date) AS SalesMonth,
    SUM(SalesTotal) AS MonthlyRevenue
FROM online_sales
WHERE ShiptoState = 'Connecticut'
GROUP BY YEAR(Date), MONTH(Date)
ORDER BY SalesYear, SalesMonth;


-- Connecticut in-store sales: monthly revenue
SELECT
    YEAR(Transaction_Date) AS SalesYear,
    MONTH(Transaction_Date) AS SalesMonth,
    SUM(Sale_Amount) AS MonthlyRevenue
FROM store_sales
WHERE Store_ID IN (
    SELECT StoreId
    FROM store_locations
    WHERE State = 'Connecticut'
)
GROUP BY YEAR(Transaction_Date), MONTH(Transaction_Date)
ORDER BY SalesYear, SalesMonth;
