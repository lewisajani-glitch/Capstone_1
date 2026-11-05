-- Question 5: Rank Connecticut stores by total sales revenue

SELECT
    l.StoreId,
    l.StoreLocation,
    SUM(s.Sale_Amount) AS TotalRevenue
FROM store_sales s
JOIN store_locations l
    ON s.Store_ID = l.StoreId
WHERE l.State = 'Connecticut'
GROUP BY
    l.StoreId,
    l.StoreLocation
ORDER BY TotalRevenue DESC;