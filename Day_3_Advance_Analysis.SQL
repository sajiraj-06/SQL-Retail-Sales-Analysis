USE retail_sales_db;


SELECT Order_ID, Product, Revenue_LKR, Profit_LKR
FROM sales
WHERE Profit_LKR > 1000
ORDER BY Profit_LKR DESC;

SELECT Customer_ID,
       SUM(Revenue_LKR) AS Total_Revenue
FROM sales
GROUP BY Customer_ID
HAVING SUM(Revenue_LKR) > 100000;


SELECT Order_ID, Product, Profit_LKR,
CASE
 WHEN Profit_LKR > 5000 THEN 'High Profit'
 WHEN Profit_LKR >= 2000 THEN 'Medium Profit'
 ELSE 'Low Profit'
END AS Profit_Category
FROM sales
LIMIT 20;


SELECT
 CASE
  WHEN Profit_LKR > 5000 THEN 'High Profit'
  WHEN Profit_LKR >= 2000 THEN 'Medium Profit'
  ELSE 'Low Profit'
 END AS Profit_Category,
 COUNT(*) AS Total_Records
FROM sales
GROUP BY Profit_Category
ORDER BY Total_Records DESC;

SELECT Customer_ID,
       SUM(Revenue_LKR) AS Total_Revenue,
       CASE
        WHEN SUM(Revenue_LKR) > 100000 THEN 'High Value Customer'
        WHEN SUM(Revenue_LKR) >= 50000 THEN 'Medium Value Customer'
        ELSE 'Low Value Customer'
       END AS Customer_Category
FROM sales
GROUP BY Customer_ID
ORDER BY Total_Revenue DESC;


SELECT Customer_ID,
       COUNT(DISTINCT Order_ID) AS Total_Orders,
       SUM(Revenue_LKR) AS Total_Revenue,
       SUM(Profit_LKR) AS Total_Profit
FROM sales
GROUP BY Customer_ID
ORDER BY Total_Revenue DESC
LIMIT 10;


SELECT
 COUNT(DISTINCT Customer_ID) AS Total_Customers,
 COUNT(DISTINCT Order_ID) AS Total_Orders,
 SUM(Revenue_LKR) AS Total_Revenue,
 SUM(Profit_LKR) AS Total_Profit,
 AVG(Profit_LKR) AS Average_Profit
FROM sales;