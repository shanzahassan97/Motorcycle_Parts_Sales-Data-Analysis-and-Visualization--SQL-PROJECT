--Creating Database
--CREATE DATABASE MOTORCYLE_SALES;

--Creating table 
--CREATE TABLE SALES(
--Order_Number VARCHAR(20) PRIMARY KEY,
--    Date TIMESTAMP,
--    Warehouse VARCHAR(50),
--    Client_Type VARCHAR(50),
--    Product_Line VARCHAR(80),
--    Quantity INT,
--    Unit_Price DECIMAL(10, 2),
--    Total DECIMAL(10, 2),
--    Payment VARCHAR(50),
--    Payment_Fee DECIMAL(10, 2)
--);

--change attribute name of date
--EXEC sp_rename 'Sales.Date',  'Paid_At', 'COLUMN';


-- Total sales  by each category
--SELECT product_line, sum(total) AS total_sales
--FROM Sales
--GROUP BY product_line;

-- Total sales by each warehouse
--SELECT warehouse, sum(total) AS total_sales
--FROM Sales
--GROUP BY warehouse;

-- Total sales by each client type in warehouse
--SELECT client_type , warehouse, sum(total) AS total_sales
--FROM Sales
--GROUP BY client_type, warehouse;

--How many product sold in each warehouse by retailer
--SELECT  warehouse, sum(quantity) AS Total_product
--FROM Sales
--WHERE  client_type='Retail'
--GROUP BY warehouse;

-- which mostly payment method used to purchase products by client
--SELECT payment,client_type, sum(total) AS Total_Amount
--FROM Sales
--GROUP BY payment, client_type

--Which product give high revenue  in each month
--SELECT Month, product_line, Total
--FROM (
--    SELECT DATEPART(month, Paid_At) AS Month,product_line,SUM(total) AS Total,
--        ROW_NUMBER() OVER (PARTITION BY DATEPART(month, Paid_At) ORDER BY SUM(total) DESC) AS rn
--    FROM Sales
--    GROUP BY product_line, DATEPART(month, Paid_At)
--) AS MonthlySales
--WHERE rn = 1 
--ORDER BY Month;

--net revenue generated each month for different product lines at each warehouse. 
--SELECT Month, product_line, Total, warehouse
--FROM (
--    SELECT warehouse,DATEPART(month, Paid_At) AS Month,product_line,SUM(total) AS Total 
--    FROM Sales
--    GROUP BY warehouse,product_line, DATEPART(month, Paid_At)
--) AS MonthlySales
--ORDER BY Month,warehouse;
