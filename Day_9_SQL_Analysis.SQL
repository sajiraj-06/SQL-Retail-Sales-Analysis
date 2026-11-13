USE retail_sales_db;

SELECT
    Order_ID,
    Customer_ID,
    Product,
    Revenue_LKR,

    CASE
        WHEN Revenue_LKR >= 50000 THEN 'High Revenue'
        WHEN Revenue_LKR >= 20000 THEN 'Medium Revenue'
        ELSE 'Low Revenue'
    END AS Revenue_Category

FROM sales
ORDER BY Revenue_LKR DESC;
USE retail_sales_db;

WITH Customer_Revenue AS (
    SELECT
        Customer_ID,
        COUNT(Order_ID) AS Total_Orders,
        SUM(Revenue_LKR) AS Total_Revenue,
        SUM(Profit_LKR) AS Total_Profit
    FROM sales
    GROUP BY Customer_ID
)

SELECT
    Customer_ID,
    Total_Orders,
    Total_Revenue,
    Total_Profit,

    CASE
        WHEN Total_Revenue >= 200000 THEN 'High Value'
        WHEN Total_Revenue >= 100000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS Customer_Category

FROM Customer_Revenue
ORDER BY Total_Revenue DESC;
USE retail_sales_db;

WITH Business_Summary AS (
    SELECT
        COUNT(DISTINCT Customer_ID) AS Total_Customers,
        COUNT(DISTINCT Order_ID) AS Total_Orders,
        SUM(Revenue_LKR) AS Total_Revenue,
        SUM(Profit_LKR) AS Total_Profit,
        SUM(Quantity) AS Total_Quantity
    FROM sales
)

SELECT
    Total_Customers,
    Total_Orders,
    Total_Quantity,
    Total_Revenue,
    Total_Profit,

    ROUND(
        Total_Profit / NULLIF(Total_Revenue, 0) * 100,
        2
    ) AS Profit_Margin,

    CASE
        WHEN Total_Profit / NULLIF(Total_Revenue, 0) * 100 >= 30
            THEN 'Excellent Performance'
        WHEN Total_Profit / NULLIF(Total_Revenue, 0) * 100 >= 20
            THEN 'Good Performance'
        ELSE 'Needs Improvement'
    END AS Business_Status

FROM Business_Summary;