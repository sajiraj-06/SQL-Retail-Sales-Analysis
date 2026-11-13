USE retail_sales_db;

WITH Product_Sales AS (
    SELECT
        Product,
        SUM(Revenue_LKR) AS Total_Revenue,
        SUM(Profit_LKR) AS Total_Profit
    FROM sales
    GROUP BY Product
)

SELECT
    Product,
    Total_Revenue,
    Total_Profit
FROM Product_Sales
ORDER BY Total_Revenue DESC;
USE retail_sales_db;

WITH Revenue_Summary AS (
    SELECT
        Product,
        SUM(Revenue_LKR) AS Total_Revenue
    FROM sales
    GROUP BY Product
),

Profit_Summary AS (
    SELECT
        Product,
        SUM(Profit_LKR) AS Total_Profit
    FROM sales
    GROUP BY Product
)

SELECT
    r.Product,
    r.Total_Revenue,
    p.Total_Profit
FROM Revenue_Summary r
JOIN Profit_Summary p
    ON r.Product = p.Product
ORDER BY p.Total_Profit DESC;
USE retail_sales_db;

WITH Customer_Sales AS (
    SELECT
        Customer_ID,
        SUM(Revenue_LKR) AS Total_Revenue,
        SUM(Profit_LKR) AS Total_Profit
    FROM sales
    GROUP BY Customer_ID
)

SELECT
    Customer_ID,
    Total_Revenue,
    Total_Profit,
    CASE
        WHEN Total_Revenue >= 100000
            THEN 'High Value'
        WHEN Total_Revenue >= 50000
            THEN 'Medium Value'
        ELSE 'Low Value'
    END AS Customer_Segment
FROM Customer_Sales
ORDER BY Total_Revenue DESC;
USE retail_sales_db;

WITH Product_Performance AS (
    SELECT
        Product,
        SUM(Quantity) AS Total_Quantity,
        SUM(Revenue_LKR) AS Total_Revenue,
        SUM(Cost_LKR) AS Total_Cost,
        SUM(Profit_LKR) AS Total_Profit
    FROM sales
    GROUP BY Product
)

SELECT
    Product,
    Total_Quantity,
    Total_Revenue,
    Total_Cost,
    Total_Profit,
    ROUND(
        Total_Profit / NULLIF(Total_Revenue, 0) * 100,
        2
    ) AS Profit_Margin_Percentage
FROM Product_Performance
ORDER BY Total_Profit DESC;
USE retail_sales_db;

WITH Monthly_Sales AS (
    SELECT
        YEAR(Order_Date) AS Sales_Year,
        MONTH(Order_Date) AS Sales_Month,
        SUM(Revenue_LKR) AS Total_Revenue,
        SUM(Profit_LKR) AS Total_Profit,
        COUNT(DISTINCT Order_ID) AS Total_Orders
    FROM sales
    GROUP BY
        YEAR(Order_Date),
        MONTH(Order_Date)
)

SELECT
    Sales_Year,
    Sales_Month,
    Total_Orders,
    Total_Revenue,
    Total_Profit
FROM Monthly_Sales
ORDER BY Sales_Year, Sales_Month;
USE retail_sales_db;

WITH Product_Performance AS (
    SELECT
        Product,
        SUM(Quantity) AS Total_Quantity,
        SUM(Revenue_LKR) AS Total_Revenue,
        SUM(Cost_LKR) AS Total_Cost,
        SUM(Profit_LKR) AS Total_Profit
    FROM sales
    GROUP BY Product
)

SELECT
    Product,
    Total_Quantity,
    Total_Revenue,
    Total_Cost,
    Total_Profit,
    ROUND(
        (Total_Profit / NULLIF(Total_Revenue, 0)) * 100,
        2
    ) AS Profit_Margin_Percentage
FROM Product_Performance
ORDER BY Total_Profit DESC;
USE retail_sales_db;

SELECT
    COUNT(DISTINCT Customer_ID) AS Total_Customers,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    SUM(Quantity) AS Total_Quantity_Sold,
    SUM(Revenue_LKR) AS Total_Revenue,
    SUM(Cost_LKR) AS Total_Cost,
    SUM(Profit_LKR) AS Total_Profit,
    ROUND(AVG(Revenue_LKR), 2) AS Average_Revenue,
    ROUND(AVG(Profit_LKR), 2) AS Average_Profit,
    ROUND(
        (SUM(Profit_LKR) / NULLIF(SUM(Revenue_LKR), 0)) * 100,
        2
    ) AS Overall_Profit_Margin
FROM sales;