USE retail_sales_db;
select
Order_ID,
Customer_ID,
Product,
Revenue_LKR from sales
where Revenue_LKR > (
select AVG (Revenue_LKR) FROM sales)
Order by Revenue_LKR desc;
USE retail_sales_db;

SELECT
    Customer_ID,
    SUM(Revenue_LKR) AS Total_Revenue
FROM sales
GROUP BY Customer_ID
HAVING SUM(Revenue_LKR) > (
    SELECT AVG(Customer_Revenue)
    FROM (
        SELECT SUM(Revenue_LKR) AS Customer_Revenue
        FROM sales
        GROUP BY Customer_ID
    ) AS Customer_Summary
)
ORDER BY Total_Revenue DESC;
USE retail_sales_db;

SELECT
    Customer_ID,
    SUM(Revenue_LKR) AS Total_Revenue,
    SUM(Profit_LKR) AS Total_Profit,
    COUNT(DISTINCT Order_ID) AS Total_Orders
FROM sales
GROUP BY Customer_ID
ORDER BY Total_Revenue DESC
LIMIT 1;
USE retail_sales_db;

SELECT
    Product,
    SUM(Revenue_LKR) AS Total_Revenue,
    SUM(Profit_LKR) AS Total_Profit
FROM sales
GROUP BY Product
ORDER BY Total_Profit DESC
LIMIT 1;
USE retail_sales_db;

SELECT
    Customer_ID,
    SUM(Revenue_LKR) AS Total_Revenue,
    CASE
        WHEN SUM(Revenue_LKR) > (
            SELECT AVG(Customer_Revenue)
            FROM (
                SELECT SUM(Revenue_LKR) AS Customer_Revenue
                FROM sales
                GROUP BY Customer_ID
            ) AS Customer_Summary
        )
        THEN 'Above Average'
        ELSE 'Below Average'
    END AS Revenue_Category
FROM sales
GROUP BY Customer_ID
ORDER BY Total_Revenue DESC;
USE retail_sales_db;

SELECT
    Product,
    SUM(Quantity) AS Total_Quantity,
    SUM(Revenue_LKR) AS Total_Revenue,
    SUM(Profit_LKR) AS Total_Profit,
    ROUND(
        SUM(Profit_LKR) / SUM(Revenue_LKR) * 100,
        2
    ) AS Profit_Margin_Percentage
FROM sales
GROUP BY Product
ORDER BY Total_Profit DESC;
USE retail_sales_db;

SELECT
    COUNT(DISTINCT Customer_ID) AS Total_Customers,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    SUM(Revenue_LKR) AS Total_Revenue,
    SUM(Profit_LKR) AS Total_Profit,
    ROUND(AVG(Revenue_LKR), 2) AS Average_Revenue,
    ROUND(AVG(Profit_LKR), 2) AS Average_Profit
FROM sales;