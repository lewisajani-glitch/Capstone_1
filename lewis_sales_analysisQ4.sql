-- Question 4A: Number of in-store transactions per month

SELECT
    YEAR(s.Transaction_Date) AS SalesYear,
    MONTH(s.Transaction_Date) AS SalesMonth,
    COUNT(*) AS NumberOfTransactions
FROM store_sales s
JOIN store_locations l
    ON s.Store_ID = l.StoreId
WHERE l.State = 'Connecticut'
GROUP BY
    YEAR(s.Transaction_Date),
    MONTH(s.Transaction_Date)
ORDER BY
    SalesYear,
    SalesMonth;

-- Question 4B: Average in-store transaction amount by product category

SELECT
    c.Category,
    COUNT(*) AS NumberOfTransactions,
    AVG(s.Sale_Amount) AS AverageTransactionAmount
FROM store_sales s
JOIN store_locations l
    ON s.Store_ID = l.StoreId
JOIN products p
    ON s.Prod_Num = p.ProdNum
JOIN inventory_categories c
    ON p.Categoryid = c.Categoryid
WHERE l.State = 'Connecticut'
GROUP BY c.Category
ORDER BY AverageTransactionAmount DESC;

