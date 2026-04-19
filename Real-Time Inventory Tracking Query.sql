-- Query to track inventory levels in real-time
SELECT P.ProductID, P.ProductName, IL.Quantity, P.ReorderLevel
FROM Products P
JOIN InventoryLevels IL ON P.ProductID = IL.ProductID
WHERE IL.Quantity <= P.ReorderLevel;