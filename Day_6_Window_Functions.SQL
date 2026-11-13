USE retail_sales_db;

SELECT
    Order_ID,
    Customer_ID,
    Product,
    Revenue_LKR,
    ROW_NUMBER() OVER (
        ORDER BY Revenue_LKR DESC
    ) AS Sales_Rank
FROM sales;
USE retail_sales_db;

SELECT
    Order_ID,
    Customer_ID,
    Product,
    Revenue_LKR,
    RANK() OVER (
        ORDER BY Revenue_LKR DESC
    ) AS Sales_Rank
FROM sales;
USE retail_sales_db;

SELECT
    Order_ID,
    Customer_ID,
    Product,
    Revenue_LKR,
    DENSE_RANK() OVER (
        ORDER BY Revenue_LKR DESC
    ) AS Sales_Rank
FROM sales;
USE retail_sales_db;

SELECT
    Product,
    Total_Revenue,
    Total_Profit,
    DENSE_RANK() OVER (
        ORDER BY Total_Profit DESC
    ) AS Profit_Rank
FROM (
    SELECT
        Product,
        SUM(Revenue_LKR) AS Total_Revenue,
        SUM(Profit_LKR) AS Total_Profit
    FROM sales
    GROUP BY Product
) AS Product_Summary;
USE retail_sales_db;

SELECT
    Customer_ID,
    Total_Orders,
    Total_Revenue,
    Total_Profit,
    DENSE_RANK() OVER (
        ORDER BY Total_Revenue DESC
    ) AS Customer_Rank
FROM (
    SELECT
        Customer_ID,
        COUNT(DISTINCT Order_ID) AS Total_Orders,
        SUM(Revenue_LKR) AS Total_Revenue,
        SUM(Profit_LKR) AS Total_Profit
    FROM sales
    GROUP BY Customer_ID
) AS Customer_Summary
ORDER BY Customer_Rank;
USE retail_sales_db;

SELECT
    Order_ID,
    Order_Date,
    Customer_ID,
    Revenue_LKR,
    SUM(Revenue_LKR) OVER (
        ORDER BY Order_Date, Order_ID
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS Running_Total
FROM sales;
USE retail_sales_db;

SELECT
    Product,
    Total_Revenue,
    Total_Profit,

    DENSE_RANK() OVER (
        ORDER BY Total_Profit DESC
    ) AS Profit_Rank,

    SUM(Total_Profit) OVER (
        ORDER BY Total_Profit DESC
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS Running_Profit

FROM (
    SELECT
        Product,
        SUM(Revenue_LKR) AS Total_Revenue,
        SUM(Profit_LKR) AS Total_Profit
    FROM sales
    GROUP BY Product
) AS Product_Summary;