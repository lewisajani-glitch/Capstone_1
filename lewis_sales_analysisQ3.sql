-- Question 3: Compare Connecticut in-store revenue
-- with total East region in-store revenue

SELECT
    m.Region,
    SUM(s.Sale_Amount) AS RegionalRevenue,
    SUM(
        CASE
            WHEN l.State = 'Connecticut'
            THEN s.Sale_Amount
            ELSE 0
        END
    ) AS ConnecticutRevenue,
    ROUND(
        SUM(
            CASE
                WHEN l.State = 'Connecticut'
                THEN s.Sale_Amount
                ELSE 0
            END
        ) / SUM(s.Sale_Amount) * 100,
        2
    ) AS ConnecticutPercent
FROM store_sales s
JOIN store_locations l
    ON s.Store_ID = l.StoreId
JOIN management m
    ON l.State = m.State
WHERE m.Region = 'East'
GROUP BY m.Region;