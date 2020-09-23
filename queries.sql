-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

SELECT [Product].ProductName, [Category].CategoryName from [Product]
JOIN [Category]
ON [Product].CategoryId = [Category].Id

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

SELECT o.id, s.CompanyName FROM [Order] as o
JOIN Shipper as s
ON o.ShipVia = s.Id 
WHERE o.OrderDate < "2012-08-09"

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

SELECT p.ProductName, od.quantity from Product as p
JOIN OrderDetail as od
ON od.OrderId = o.id
JOIN [Order] as o
ON od.ProductId = p.Id
WHERE o.Id = 10251
ORDER BY p.ProductName

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

SELECT o.id as [Order Id Number], s.CompanyName as [Company Name], e.LastName as [Employee last Name] FROM [Order] as o
JOIN Shipper as s
ON o.ShipVia = s.Id
JOIN Employee as e
ON o.EmployeeId = e.Id



-- Stretch Queries


-- Displays CategoryName and a new column called Count that shows how many products are in each category. Shows 8 records.

SELECT c.CategoryName, Count(p.ProductName) as [Count] from [Products] as p
JOIN Categories as c ON p.CategoryID = c.CategoryID
GROUP BY c.CategoryName

-- Display OrderID and a column called ItemCount that shows the total number of products placed on the order. Shows 196 records.

SELECT od.OrderID, COUNT(od.quantity) as ItemCount from OrderDetails as od
GROUP BY od.OrderID