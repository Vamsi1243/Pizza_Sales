USE Pizza_DB;

SELECT * FROM pizza_sales;

--1.Total Revenu
SELECT SUM(total_price) AS Revenu FROM pizza_sales;

--2.Average Order Value
SELECT SUM(total_price)/COUNT(DISTINCT order_id) AS  Avg_Order FROM pizza_sales;

--3.Total Pizzas Sold
SELECT SUM(quantity) AS Pizzas_Sold FROM pizza_sales;

--4.Total Orders Placed
SELECT COUNT(DISTINCT order_id) AS Total_orders FROM pizza_sales;

--5.Avg Pizza per order
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2))/CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS AVG_Order FROM pizza_sales;

--6.Daily Trend for Total Orders
SELECT DATENAME(DW, order_date) AS Order_Day, COUNT(DISTINCT order_id) As Total_Orders 
FROM pizza_sales
GROUP BY DATENAME(DW, order_date);

--7.Monthly trend for Orders
SELECT DATENAME(MONTH, order_date) As Months, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY DATENAME(MONTH, order_date)
ORDER BY Total_Orders DESC;

--8.Percentage of Sales by Pizzaz Category
SELECT pizza_category, CAST(SUM(total_price)*100/(SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL(10,2)) AS Percentage_per_pizza
FROM pizza_sales
GROUP BY pizza_category;

--9.Percentage of sales per size
SELECT pizza_size, CAST(SUM(total_price)*100/(SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL(10,2)) AS Percentage_per_size
FROM pizza_sales
GROUP BY pizza_size
ORDER BY Percentage_per_size DESC;

--10.Total pizzas sold by pizza category
SELECT pizza_category, SUM(total_price) AS Total_Sales
FROM pizza_sales
--WHERE MONTH(order_date) = 5
--WHERE DATEPART(QUARTER, order_date) = 1
GROUP BY pizza_category;

--11.Top 5 best sellers by Revenue, Total quantity and Total orders
SELECT TOP 5 pizza_name, SUM(total_price) AS Total_Revenue FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC;

SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Quantity FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity DESC;

SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC;


--12.Bottom 5 sellers by Revenue, Total quantity and Total orders
SELECT TOP 5 pizza_name, SUM(total_price) AS Total_Revenue FROM pizza_sales
GROUP BY pizza_name
ORDER BY TOtal_Revenue;


SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Quantity FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity;

SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders;