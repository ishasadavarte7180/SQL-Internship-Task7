# SQL Internship - Task 7: Creating Views  

## 📌 Objective  
Learn how to create and use **SQL Views** for data abstraction, security, and reusable SQL logic.  

---

## 🛠 Tools Used  
- MySQL Workbench / DB Browser for SQLite  

---

## 📂 Files in Repo  
- `schema.sql` → Table creation scripts  
- `insert.sql` → Sample data insertion  
- `query.sql` → View creation & usage examples  
- `screenshots/` → Folder with execution screenshots  

---

## 🗄 Step 1: Schema Creation  

```sql
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    City VARCHAR(50)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    Amount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
```

---

## 🗄 Step 2: Insert Data  

```sql
INSERT INTO Customers VALUES
(1, 'Isha Sadavarte', 'isha@gmail.com', 'Pune'),
(2, 'Rahul Sharma', 'rahul@gmail.com', 'Mumbai'),
(3, 'Sneha Patil', 'sneha@gmail.com', 'Delhi');

INSERT INTO Orders VALUES
(101, 1, '2025-10-01', 5000),
(102, 2, '2025-10-02', 2000),
(103, 1, '2025-10-03', 1500);
```


---

## 👀 Step 3: Creating and Using Views  

### 1️⃣ Simple View: `CustomerOrders`

```sql
CREATE VIEW CustomerOrders AS
SELECT c.Name, c.Email, o.OrderID, o.Amount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID;
```

```sql
SELECT * FROM CustomerOrders;
```
CustomerOrders Output: [CustomerOrders Output](./Screenshots/Query_1.PNG)

---

### 2️⃣ Conditional View: `Pune_Customers`

```sql
CREATE VIEW Pune_Customers AS
SELECT Name, Email FROM Customers
WHERE City = 'Pune';
```

```sql
SELECT * FROM Pune_Customers;
```
📸 Screenshot: [Pune_Customers Output](./Screenshots/Query_2.PNG)

---

### 3️⃣ Aggregated View: `TotalSpent`

```sql
CREATE VIEW TotalSpent AS
SELECT c.Name, SUM(o.Amount) AS TotalAmount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.Name;
```

```sql
SELECT * FROM TotalSpent;
```
📸 Screenshot: [TotalSpent Output](./Screenshots/Query_3.PNG)

---

## ✏ Step 4: Update via View  

```sql
UPDATE Pune_Customers
SET Email = 'new_email@gmail.com'
WHERE Name = 'Isha Sadavarte';
```
📸 Screenshot: [Update View](./Screenshots/Query_4.PNG)

---

## 🗑 Step 5: Drop a View  

```sql
DROP VIEW IF EXISTS TotalSpent;
```




---

## ✅ Outcome  
✔ Learned how to create, use, update, and drop SQL Views.  
✔ Demonstrated abstraction, aggregation, and conditional queries.  
✔ Ready for interview questions about SQL Views.  
