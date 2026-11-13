USE retail_sales_db;


SELECT COUNT(*) AS Total_Records
FROM sales;


SELECT *
FROM sales
LIMIT 5;


DESCRIBE sales;


SELECT SUM(Revenue_LKR) AS Total_Revenue
FROM sales;


SELECT SUM(Profit_LKR) AS Total_Profit
FROM sales;


SELECT
    SUM(Revenue_LKR) AS Total_Revenue,
    SUM(Profit_LKR) AS Total_Profit
FROM sales;