use company;
-- 1) Shows the customer locations

CREATE VIEW view_customer_locations AS
SELECT CustomerName,  Country  FROM Customers;
SELECT*FROM view_customer_locations;


-- 2) Total quantity ordered for each product
SELECT p.ProductName, SUM(od.Quantity) AS TotalQuantity
FROM OrderDetails OD
JOIN OrderDetails p ON OD.ProductID = P.ProductID
GROUP BY p.ProductName

SELECT * FROM view_product_sales;
WHERE TotalQuantity < 159;

-- 3) Countries With the Most Customers
CREATE VIEW view_customer_country_count AS
SELECT 
     Country,
     COUNT(*) AS TotalCustomers;
FROM Customers
GROUP BY Country
ORDER BY TotalCustomers DESC;
 
 SELECT *FROM view_customer_country_count;

-- 4) Orders with Shipper Information
CREATE  VIEW view_orders_shipper AS
SELECT
    o.OrderID,
    o.OrderDate,
    C.CustomerName,
    s.ShipperName
FROM Orders o
JOIN Customers c ON O.CustomerID = C.CustomerID;
JOIN Shippers S ON O.ShipperID = S.ShipperID;

SELECT ShipperName,COUNT(*) AS OrderCount
FROM view_order_shipper
GROUP BY ShipperName
ORDER BY OrderCount DESC;

SELECT*FROM view_order_shipper;
