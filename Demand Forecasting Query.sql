-- Query to forecast demand based on historical sales data
SELECT P.ProductID, P.ProductName, SUM(S.QuantitySold) AS TotalSold, AVG(S.QuantitySold) AS AverageMonthlySales,
(P.ReorderLevel - SUM(S.QuantitySold)) AS ProjectedShortage
FROM Sales S
JOIN Products P ON S.ProductID = P.ProductID
GROUP BY P.ProductID, P.ProductName
ORDER BY ProjectedShortage DESC;
