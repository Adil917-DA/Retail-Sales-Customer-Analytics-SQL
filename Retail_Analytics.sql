-- Set B: Retail Sales & Customer Analytics
-- MySQL-compatible schema and sample data.
CREATE DATABASE IF NOT EXISTS retail_analytics;
USE retail_analytics;

CREATE TABLE Customers (
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(100) NOT NULL,
  email VARCHAR(150) NOT NULL,
  city VARCHAR(60),
  state VARCHAR(60),
  signup_date DATE
);
CREATE TABLE Products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(120) NOT NULL,
  category VARCHAR(60),
  unit_price DECIMAL(10,2),
  stock_quantity INT
);
CREATE TABLE Employees (
  employee_id INT PRIMARY KEY,
  employee_name VARCHAR(100) NOT NULL,
  department VARCHAR(60),
  branch_city VARCHAR(60),
  monthly_salary DECIMAL(10,2)
);
CREATE TABLE Orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  employee_id INT,
  order_status VARCHAR(30),
  payment_method VARCHAR(30),
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
  FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);
CREATE TABLE Order_Items (
  order_item_id INT PRIMARY KEY,
  order_id INT,
  product_id INT,
  quantity INT,
  unit_price_at_sale DECIMAL(10,2),
  discount_rate DECIMAL(4,2),
  FOREIGN KEY (order_id) REFERENCES Orders(order_id),
  FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
CREATE TABLE Returns (
  return_id INT PRIMARY KEY,
  order_id INT,
  return_date DATE,
  return_reason VARCHAR(120),
  FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

INSERT INTO Customers (customer_id, customer_name, email, city, state, signup_date) VALUES
(1001, 'Aarav Sharma', 'aarav.sharma@example.com', 'Lucknow', 'Uttar Pradesh', '2024-01-15'),
(1002, 'Diya Verma', 'diya.verma@example.com', 'Kanpur', 'Uttar Pradesh', '2024-02-10'),
(1003, 'Kabir Singh', 'kabir.singh@example.com', 'Delhi', 'Delhi', '2023-11-22'),
(1004, 'Meera Patel', 'meera.patel@example.com', 'Jaipur', 'Rajasthan', '2024-03-05'),
(1005, 'Ishaan Gupta', 'ishaan.gupta@example.com', 'Lucknow', 'Uttar Pradesh', '2023-08-19'),
(1006, 'Ananya Rao', 'ananya.rao@example.com', 'Bhopal', 'Madhya Pradesh', '2024-04-12'),
(1007, 'Reyansh Khan', 'reyansh.khan@example.com', 'Delhi', 'Delhi', '2024-05-01'),
(1008, 'Saanvi Joshi', 'saanvi.joshi@example.com', 'Pune', 'Maharashtra', '2023-12-09'),
(1009, 'Vivaan Mishra', 'vivaan.mishra@example.com', 'Lucknow', 'Uttar Pradesh', '2024-06-17'),
(1010, 'Aditi Das', 'aditi.das@example.com', 'Kolkata', 'West Bengal', '2024-07-02'),
(1011, 'Arjun Mehta', 'arjun.mehta@example.com', 'Jaipur', 'Rajasthan', '2023-09-14'),
(1012, 'Myra Nair', 'myra.nair@example.com', 'Mumbai', 'Maharashtra', '2024-08-21');


INSERT INTO Products (product_id, product_name, category, unit_price, stock_quantity) VALUES
(201, 'Wireless Mouse', 'Accessories', 799.0, 80),
(202, 'Mechanical Keyboard', 'Accessories', 2499.0, 35),
(203, 'USB-C Hub', 'Accessories', 1899.0, 42),
(204, '27-inch Monitor', 'Displays', 14999.0, 18),
(205, 'Laptop Stand', 'Accessories', 1299.0, 55),
(206, 'Webcam HD', 'Peripherals', 3299.0, 24),
(207, 'Noise-Cancelling Headphones', 'Audio', 5999.0, 20),
(208, 'Bluetooth Speaker', 'Audio', 2199.0, 30),
(209, 'External SSD 1TB', 'Storage', 7499.0, 16),
(210, 'Ergonomic Chair', 'Furniture', 11999.0, 12);

INSERT INTO Employees (employee_id, employee_name, department, branch_city, monthly_salary) VALUES
(301, 'Nisha Kapoor', 'Sales', 'Lucknow', 52000),
(302, 'Rahul Bansal', 'Sales', 'Delhi', 58000),
(303, 'Pooja Iyer', 'Support', 'Lucknow', 44000),
(304, 'Karan Malhotra', 'Operations', 'Jaipur', 49000),
(305, 'Sneha Kulkarni', 'Sales', 'Pune', 61000);

INSERT INTO Orders (order_id, customer_id, order_date, employee_id, order_status, payment_method) VALUES
(5001, 1001, '2024-09-02', 301, 'Delivered', 'UPI'),
(5002, 1002, '2024-09-05', 302, 'Delivered', 'Card'),
(5003, 1003, '2024-09-07', 302, 'Returned', 'Card'),
(5004, 1001, '2024-09-15', 301, 'Delivered', 'UPI'),
(5005, 1004, '2024-10-01', 304, 'Delivered', 'Cash'),
(5006, 1005, '2024-10-04', 301, 'Delivered', 'Card'),
(5007, 1006, '2024-10-11', 303, 'Cancelled', 'UPI'),
(5008, 1007, '2024-10-18', 302, 'Delivered', 'Card'),
(5009, 1008, '2024-11-02', 305, 'Delivered', 'Wallet'),
(5010, 1009, '2024-11-10', 301, 'Returned', 'UPI'),
(5011, 1010, '2024-11-15', 304, 'Delivered', 'Card'),
(5012, 1011, '2024-12-01', 304, 'Delivered', 'Cash'),
(5013, 1012, '2024-12-09', 305, 'Delivered', 'Wallet'),
(5014, 1003, '2025-01-05', 302, 'Delivered', 'Card'),
(5015, 1002, '2025-01-12', 302, 'Delivered', 'UPI'),
(5016, 1005, '2025-01-20', 301, 'Delivered', 'Card'),
(5017, 1006, '2025-02-02', 303, 'Delivered', 'UPI'),
(5018, 1007, '2025-02-14', 302, 'Returned', 'Card'),
(5019, 1008, '2025-03-01', 305, 'Delivered', 'Wallet'),
(5020, 1009, '2025-03-15', 301, 'Delivered', 'UPI'),
(5021, 1010, '2025-04-03', 304, 'Cancelled', 'Cash'),
(5022, 1011, '2025-04-22', 304, 'Delivered', 'Card'),
(5023, 1012, '2025-05-07', 305, 'Delivered', 'Wallet'),
(5024, 1004, '2025-05-19', 304, 'Delivered', 'UPI');

INSERT INTO Order_Items (order_item_id, order_id, product_id, quantity, unit_price_at_sale, discount_rate) VALUES
(1.0, 5001.0, 201.0, 2.0, 799.0, 0.05),
(2.0, 5001.0, 203.0, 1.0, 1899.0, 0.0),
(3.0, 5002.0, 202.0, 1.0, 2499.0, 0.1),
(4.0, 5002.0, 205.0, 2.0, 1299.0, 0.0),
(5.0, 5003.0, 207.0, 1.0, 5999.0, 0.0),
(6.0, 5004.0, 204.0, 1.0, 14999.0, 0.08),
(7.0, 5004.0, 201.0, 1.0, 799.0, 0.0),
(8.0, 5005.0, 210.0, 1.0, 11999.0, 0.05),
(9.0, 5006.0, 209.0, 1.0, 7499.0, 0.1),
(10.0, 5006.0, 203.0, 2.0, 1899.0, 0.0),
(11.0, 5007.0, 206.0, 1.0, 3299.0, 0.0),
(12.0, 5008.0, 207.0, 1.0, 5999.0, 0.15),
(13.0, 5008.0, 208.0, 2.0, 2199.0, 0.0),
(14.0, 5009.0, 202.0, 1.0, 2499.0, 0.05),
(15.0, 5009.0, 206.0, 1.0, 3299.0, 0.0),
(16.0, 5010.0, 204.0, 1.0, 14999.0, 0.0),
(17.0, 5011.0, 208.0, 3.0, 2199.0, 0.1),
(18.0, 5012.0, 210.0, 1.0, 11999.0, 0.0),
(19.0, 5013.0, 209.0, 2.0, 7499.0, 0.05),
(20.0, 5014.0, 202.0, 2.0, 2499.0, 0.0),
(21.0, 5014.0, 203.0, 1.0, 1899.0, 0.05),
(22.0, 5015.0, 205.0, 1.0, 1299.0, 0.0),
(23.0, 5015.0, 201.0, 3.0, 799.0, 0.1),
(24.0, 5016.0, 204.0, 1.0, 14999.0, 0.05),
(25.0, 5017.0, 206.0, 2.0, 3299.0, 0.0),
(26.0, 5017.0, 208.0, 1.0, 2199.0, 0.0),
(27.0, 5018.0, 207.0, 1.0, 5999.0, 0.0),
(28.0, 5019.0, 209.0, 1.0, 7499.0, 0.1),
(29.0, 5020.0, 203.0, 2.0, 1899.0, 0.0),
(30.0, 5020.0, 201.0, 1.0, 799.0, 0.0),
(31.0, 5021.0, 210.0, 1.0, 11999.0, 0.0),
(32.0, 5022.0, 202.0, 1.0, 2499.0, 0.0),
(33.0, 5022.0, 205.0, 1.0, 1299.0, 0.0),
(34.0, 5023.0, 209.0, 1.0, 7499.0, 0.0),
(35.0, 5024.0, 204.0, 1.0, 14999.0, 0.1),
(36.0, 5024.0, 205.0, 2.0, 1299.0, 0.0);

INSERT INTO Returns (return_id, order_id, return_date, return_reason) VALUES
(9001, 5003, '2024-09-20', 'Damaged item'),
(9002, 5010, '2024-11-17', 'Changed mind'),
(9003, 5018, '2025-02-20', 'Product not as expected');

-- Queries to Perform

-- Q1. Basic filtering and sorting (3 marks) 
-- List delivered orders placed between 1 October 2024 and 31 March 2025, showing order_id, 
-- order_date, customer_id, and payment_method. Sort by order_date descending.
--Solution:

SELECT
order_id,
customer_id,
order_date,
payment_method
FROM Orders
WHERE order_status = 'Delivered'
AND order_date BETWEEN '2024-10-01' AND '2025-03-31'
ORDER BY order_date DESC;

-- Q2. Multi-table JOIN (4 marks) 
-- Display each delivered order with customer_name, order_id, order_date, employee_name, and 
-- order_status. Include only orders with matching customer and employee records. 
--SOLUTION:

SELECT
c.customer_name,
o.order_id,
o.order_date,
e.employee_name,
o.order_status
FROM Orders AS o
INNER JOIN Customers AS c
ON o.customer_id = c.customer_id
INNER JOIN Employees AS e
ON o.employee_id = e.employee_id
WHERE o.order_status = 'Delivered'
ORDER BY o.order_date DESC;

-- Q3. Aggregation and HAVING (4 marks) 
-- For each product category, calculate total units sold and net revenue from delivered orders. Show 
-- only categories with net revenue greater than ₹10,000; sort by net revenue descending. 
--SOLUTION:

SELECT
p.category,
SUM(oi.quantity) AS total_units_sold,
ROUND
(SUM(oi.quantity*oi.unit_price_at_sale*(1 - oi.discount_rate)),2) AS net_revenue
FROM Products AS p
INNER JOIN Order_Items AS oi
ON p.product_id = oi.product_id
INNER JOIN Orders AS o
ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered'
GROUP BY p.category
HAVING SUM(oi.quantity*oi.unit_price_at_sale*(1 - oi.discount_rate)) > 10000
ORDER BY net_revenue DESC;

-- Q4. Customers with repeat purchases (3 marks) Find customers who have placed at least two delivered orders. Show customer_id, customer_name, 
-- number of delivered orders, and total net spend. 
--SOLUTION:

SELECT
c.customer_id,
c.customer_name,
COUNT(DISTINCT o.order_id) AS delivered_orders,
ROUND(SUM(oi.quantity*oi.unit_price_at_sale*(1 - oi.discount_rate)),2) AS total_net_spend
FROM Customers AS c
INNER JOIN Orders AS o
ON c.customer_id = o.customer_id
INNER JOIN Order_Items AS oi
ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered'
GROUP BY
c.customer_id,
c.customer_name
HAVING COUNT(DISTINCT o.order_id) >= 2
ORDER BY total_net_spend DESC;

-- Q5. LEFT JOIN and zero activity (3 marks) 
-- List all customers and the number of delivered orders each has placed, including customers with zero delivered orders. 

--SOLUTION:
---Method 1--
SELECT
c.customer_id,
c.customer_name,
COUNT(o.order_id) AS delivered_order_count
FROM Customers AS c
LEFT JOIN Orders AS o
ON c.customer_id = o.customer_id
AND o.order_status = 'Delivered'
GROUP BY
c.customer_id,
c.customer_name
ORDER BY c.customer_id;
-- Q6. Subquery (4 marks) 
-- Find products whose unit_price is greater than the average unit_price of all products. Display 
-- product name, category, unit price, and the overall average price. 
--SOLUTION:

SELECT
product_name,
category,
unit_price,
(SELECT AVG(unit_price)
FROM Products) AS overall_average_price
FROM Products
WHERE unit_price > (SELECT AVG(unit_price)
FROM Products)
ORDER BY unit_price DESC;

-- Q7. NOT EXISTS (4 marks) 
-- Find customers who have never placed a delivered order. Return their customer_id, customer_name, 
-- and city. 
SELECT Customer_ID, Customer_Name, City
FROM Customers
WHERE NOT EXISTS
(SELECT*FROM Orders
Where Order_Status = 'Delivered');
-- Q8. Date functions (3 marks) 
-- Group delivered orders by year and month, showing the number of orders and net revenue for each 
-- month. Sort chronologically. 
--SOLUTION:
SELECT EXTRACT (Month From o.Order_Date) As Months,
EXTRACT (Year From o.Order_Date) As Years,
COUNT(DISTINCT o.Order_ID) As Total_Orders,
Round (SUM (oi.Quantity * oi.Unit_Price_at_Sale *(1 - oi.Discount_Rate)),2) As Net_Revenue
FROM Orders o
JOIN Order_Items oi
ON o.Order_ID = oi.Order_ID
WHERE o.Order_Status = 'Delivered'
GROUP BY EXTRACT (Month From o.Order_Date),
	     EXTRACT (Year From o.Order_Date)
ORDER BY Years Asc, Months ASC;
-- Q9. CASE expression (3 marks) 
-- Classify each product as 'Low Stock' when stock_quantity < 20, 'Moderate Stock' when 
-- stock_quantity is between 20 and 40 inclusive, and 'High Stock' when stock_quantity > 40. Display 
-- product_name, stock_quantity, and stock label. 
--SOLUTION:
SELECT
PRODUCT_NAME,
STOCK_QUANTITY,
CASE 
WHEN Stock_Quantity < 20 THEN 'Low Stock'
WHEN Stock_Quantity BETWEEN 20 AND 40 THEN 'Moderate Stock'
ELSE 'High Stock' END AS Stock_Label
FROM Products
ORDER BY Stock_Quantity DESC;
-- Q10. Conditional aggregation (4 marks) 
-- For each employee, calculate delivered, returned, and cancelled order counts using conditional 
-- aggregation. Include employees with no orders. 
--SOLUTION:

SELECT e.Employee_ID, e.Employee_Name,
COUNT (CASE WHEN o.Order_Status = 'Delivered' Then 1 End) As Orders_Delivered,
COUNT (CASE WHEN o.Order_Status = 'Cancelled' Then 1 End) As Order_Cancelled,
COUNT (CASE WHEN o.Order_Status = 'Returned' Then 1 End) As Order_Returned
FROM Employees e
LEFT JOIN Orders o
ON e.Employee_ID = o.Employee_ID
GROUP BY e.Employee_ID, e.Employee_Name
ORDER BY Employee_ID;

-- Q11. Window function – ranking (4 marks) 
-- Rank products within each category by net revenue from delivered orders, highest first. Show 
-- category, product_name, net revenue, and rank. Products with no delivered sales should still be 
-- eligible to appear with zero revenue. 
--SOLUTION:
SELECT p.Category, p.Product_Name,
COALESCE (Round(SUM (oi.Quantity * oi.Unit_Price_at_Sale *(1 - oi.Discount_Rate)),2),0) AS Net_Revenue,
RANK() OVER(PARTITION BY p.Category
ORDER BY COALESCE (Round(Sum (oi.Quantity * oi.Unit_Price_at_Sale *(1 - oi.Discount_Rate)),2),0) DESC) AS Product_Rank
FROM Products p
LEFT JOIN Order_Items oi
ON p.Product_ID = oi.Product_ID
LEFT JOIN Orders o
ON oi.Order_ID = o.Order_ID
AND o.Order_Status = 'Delivered'
WHERE oi.Order_ID IS NULL OR o.Order_ID IS NOT NULL
GROUP BY p.Category, p.Product_Name
ORDER BY Net_Revenue DESC;
-- Q12. Running total (4 marks) 
-- For each month, calculate delivered-order net revenue and a cumulative running total of revenue 
-- across months in chronological order. 
--SOLUTION:
SELECT To_Char (o.Order_Date, 'YYYY-MM') AS Years_Months,
ROUND(SUM (oi.Quantity * oi.Unit_Price_at_Sale *(1 - oi.Discount_Rate)),2) As Monthly_Net_Revenue,
ROUND(SUM(SUM(oi.Quantity * oi.Unit_Price_at_Sale *(1 - oi.Discount_Rate)))
OVER(ORDER BY To_Char (o.Order_Date, 'YYYY-MM')
ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW),2) AS Running_Total
FROM Orders o
JOIN Order_Items oi
ON o.Order_ID = oi.Order_ID
WHERE o.Order_Status = 'Delivered'
GROUP BY To_Char (o.Order_Date, 'YYYY-MM')
ORDER BY Years_Months ASC;
-- Q13. Return analysis (3 marks) 
-- List each returned order with customer name, return date, return reason, and the total pre-discount 
-- value of its order items. 
--SOLUTION:
SELECT o.Order_ID, c.Customer_Name, r.Return_Date, r.Return_Reason,
SUM (oi.Quantity * oi.Unit_Price_at_Sale) As Pre_Discont_Order_Value
From Returns r
Join Orders o
On r.Order_ID = o.Order_ID
Join Customers c
On o.Customer_ID = c.Customer_ID
Join Order_Items oi
On o.Order_ID = oi.Order_Id
Group By c.Customer_Name, r.Return_Date, r.Return_Reason, o.Order_ID
Order By r.Return_Date Desc;
-- Q14. CTE (4 marks) 
-- Using a CTE, calculate net revenue per customer from delivered orders, then return customers 
-- whose net revenue is above the average customer net revenue. State whether the average is 
-- calculated across all customers or only customers with delivered purchases. 
--SOLUTION:

WITH Customer_Revenue AS (
SELECT c.Customer_ID, c.Customer_Name,
SUM(oi.Quantity * oi.Unit_Price_at_Sale *(1 - oi.Discount_Rate)) As Net_Revenue
FROM Customers c
JOIN Orders o
ON c.Customer_ID = o.Customer_ID
JOIN Order_Items oi
ON o.Order_ID = oi.Order_ID 
Where o.Order_Status = 'Delivered'
Group By c.Customer_ID, c.Customer_Name)
SELECT
Customer_ID,
Customer_Name,
ROUND(Net_Revenue, 2) AS Net_Revenue_Above_avg_revenue
FROM Customer_Revenue
WHERE Net_Revenue > (
SELECT AVG(Net_Revenue)
FROM Customer_Revenue)
ORDER BY Net_Revenue DESC;

-- Q15. Business insight query (4 marks) 
-- Identify the top three customers by delivered net spend. Show customer name, number of delivered 
-- orders, net spend, and each customer's percentage contribution to total delivered net revenue. 
SOLUTION:

SELECT
customer_name,
delivered_orders,
net_spend,
ROUND(100.0 * net_spend / SUM(net_spend) OVER (),2) AS revenue_contribution_percent
FROM (SELECT C.customer_id,C.customer_name,
COUNT(DISTINCT O.order_id) AS delivered_orders,
SUM(Oi.quantity*Oi.unit_price_at_sale*(1 - Oi.discount_rate)) AS net_spending
FROM Customers C
JOIN Orders O
ON C.customer_id = O.customer_id
JOIN Order_Items OI
ON O.order_id = OI.order_id
WHERE O.order_status = 'Delivered'
GROUP BY C.customer_id, C.customer_name) AS CustomerSpend
ORDER BY net_spend DESC
LIMIT 3;

SELECT
customer_name,
delivered_orders,
net_spend,
ROUND(100.0 * net_spend / SUM(net_spend) OVER (),2) AS revenue_contribution_percent
FROM(SELECT
C.customer_id,
C.customer_name,
COUNT(DISTINCT O.order_id) AS delivered_orders,
SUM(
Oi.quantity*Oi.unit_price_at_sale*(1 - OI.discount_rate)) AS net_spend
FROM Customers C
JOIN Orders O
ON C.customer_id = O.customer_id
JOIN Order_Items OI
ON O.order_id = OI.order_id
WHERE O.order_status = 'Delivered'
GROUP BY C.customer_id, C.customer_name) AS CustomerSpend
ORDER BY net_spend DESC
LIMIT 3;
