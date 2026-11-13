USE retail_sales_db;


SELECT Product,
       SUM(Quantity) AS Total_Qty,
       SUM(Revenue_LKR) AS Total_Revenue,
       SUM(Profit_LKR) AS Total_Profit
FROM sales
GROUP BY Product;


SELECT Product,
       SUM(Profit_LKR) AS Total_Profit
FROM sales
GROUP BY Product
ORDER BY Total_Profit DESC
LIMIT 1;


SELECT Product,
       SUM(Revenue_LKR) AS Total_Revenue
FROM sales
GROUP BY Product
ORDER BY Total_Revenue DESC
LIMIT 5;


SELECT Customer_ID,
       SUM(Revenue_LKR) AS Total_Revenue,
       SUM(Profit_LKR) AS Total_Profit
FROM sales
GROUP BY Customer_ID
ORDER BY Total_Revenue DESC
LIMIT 5;


SELECT Customer_ID,
       COUNT(DISTINCT Order_ID) AS Total_Orders,
       SUM(Revenue_LKR) AS Total_Revenue
FROM sales
GROUP BY Customer_ID
ORDER BY Total_Orders DESC
LIMIT 5;


SELECT Customer_ID,
       AVG(Revenue_LKR) AS Average_Revenue
FROM sales
GROUP BY Customer_ID
ORDER BY Average_Revenue DESC
LIMIT 5;