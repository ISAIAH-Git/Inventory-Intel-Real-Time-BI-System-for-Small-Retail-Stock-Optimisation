-- Query to identify slow-moving products
SELECT P.ProductID, P.ProductName, SUM(S.QuantitySold) AS TotalSoldLastMonth
FROM Products P
LEFT JOIN Sales S ON P.ProductID = S.ProductID AND S.SaleDate > DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
GROUP BY P.ProductID, P.ProductName
HAVING TotalSoldLastMonth < 5 -- Threshold for slow-moving products
ORDER BY TotalSoldLastMonth ASC;
