use pizzasale

SELECT * FROM pizzasales;

SELECT SUM(total_price) as Total_Revenue FROM pizzasales;

SELECT round(SUM(total_price) / count(distinct order_id),2) as AVG_Order_Value  FROM pizzasales;

SELECT sum(quantity) As Total_qty_Sold  FROM pizzasales;

SELECT count(distinct order_id) as Total_Orders FROM pizzasales;


SELECT cast(cast(sum(quantity) as decimal (10,2)) / cast(count(distinct order_id)as decimal (10,2)) as decimal(10,2)) as Avg_Pizza 
FROM pizzasales;

SELECT DATENAME(DW, order_date) as order_day, COUNT(DISTINCT order_id) as total_orders
FROM pizzasales
GROUP BY DATENAME(DW, order_date);

SELECT DATENAME(Month, order_date) as month_name, COUNT(DISTINCT order_id) as total_orders
FROM pizzasales
GROUP BY DATENAME(Month, order_date)
Order by total_orders DESC;

SELECT pizza_category, SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizzasales) as pct
FROM pizzasales
GROUP BY pizza_category;

SELECT pizza_size, Cast(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizzasales) as decimal (10,2)) as pct
FROM pizzasales
GROUP BY pizza_size
ORDER BY pct DESC;

-- 10.	Top 5 Best sellers by Revenue
SELECT top 5 pizza_name, CAST(sum(total_price) as decimal (10,2)) as total_rev 
FROM pizzasales
GROUP BY pizza_name
ORDER BY total_rev DESC;

-- 11.	Bottom 5 sellers by Revenue
SELECT top 5 pizza_name, CAST(sum(total_price) as decimal (10,2)) as total_rev 
FROM pizzasales
GROUP BY pizza_name
ORDER BY total_rev ;


-- 12.	Top 5 Best sellers by Quantity
SELECT top 5 pizza_name, sum(quantity) as total_qty 
FROM pizzasales
GROUP BY pizza_name
ORDER BY total_qty DESC;

-- 13.	Bottom 5 Best sellers by Quantity
SELECT top 5 pizza_name, sum(quantity) as total_qty 
FROM pizzasales
GROUP BY pizza_name
ORDER BY total_qty ;


-- 14.	Top 5 Best sellers by Order
SELECT top 5 pizza_name, COUNT(DISTINCT order_id) as total_order 
FROM pizzasales
GROUP BY pizza_name
ORDER BY total_order DESC;

-- 15.	Bottom 5 Best sellers by Order
SELECT top 5 pizza_name, COUNT(DISTINCT order_id) as total_order 
FROM pizzasales
GROUP BY pizza_name
ORDER BY total_order ;

--, sum(quantity) as total_quantity, COUNT(DISTINCT order_id) as total_orders