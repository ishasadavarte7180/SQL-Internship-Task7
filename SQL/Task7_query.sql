-- 1. Simple View
CREATE VIEW CustomerOrders AS
SELECT c.Name, c.Email, o.OrderID, o.Amount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID;




-- 2. View with Condition
CREATE VIEW Pune_Customers AS
SELECT Name, Email FROM Customers
WHERE City = 'Pune';



-- 3. Aggregated View
CREATE VIEW TotalSpent AS
SELECT c.Name, SUM(o.Amount) AS TotalAmount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.Name;



-- Query from Views
SELECT * FROM CustomerOrders;
SELECT * FROM Pune_Customers;
SELECT * FROM TotalSpent;

-- Update via view (if supported in DB)
UPDATE Pune_Customers
SET Email = 'new_email@gmail.com'
WHERE Name = 'Isha Sadavarte';

-- Drop view
DROP VIEW IF EXISTS TotalSpent;
