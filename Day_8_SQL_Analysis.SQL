USE retail_sales_db;

SELECT
    YEAR(Order_Date) AS Sales_Year,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    SUM(Revenue_LKR) AS Total_Revenue,
    SUM(Profit_LKR) AS Total_Profit
FROM sales
GROUP BY YEAR(Order_Date)
ORDER BY Sales_Year;
USE retail_sales_db;

SELECT
    YEAR(Order_Date) AS Sales_Year,
    QUARTER(Order_Date) AS Sales_Quarter,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    SUM(Revenue_LKR) AS Total_Revenue,
    SUM(Profit_LKR) AS Total_Profit
FROM sales
GROUP BY
    YEAR(Order_Date),
    QUARTER(Order_Date)
ORDER BY
    Sales_Year,
    Sales_Quarter;
    USE retail_sales_db;

SELECT
    MONTH(Order_Date) AS Month_Number,
    MONTHNAME(Order_Date) AS Month_Name,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    SUM(Revenue_LKR) AS Total_Revenue,
    SUM(Profit_LKR) AS Total_Profit
FROM sales
GROUP BY
    MONTH(Order_Date),
    MONTHNAME(Order_Date)
ORDER BY Month_Number;
USE retail_sales_db;

SELECT
    CASE
        WHEN DAYOFWEEK(Order_Date) IN (1, 7)
        THEN 'Weekend'
        ELSE 'Weekday'
    END AS Sales_Type,

    COUNT(Order_ID) AS Total_Orders,
    SUM(Revenue_LKR) AS Total_Revenue,
    SUM(Profit_LKR) AS Total_Profit

FROM sales

GROUP BY Sales_Type;
USE retail_sales_db;

SELECT
    DAYNAME(Order_Date) AS Sales_Day,
    COUNT(Order_ID) AS Total_Orders,
    SUM(Revenue_LKR) AS Total_Revenue,
    SUM(Profit_LKR) AS Total_Profit
FROM sales
GROUP BY DAYNAME(Order_Date)
ORDER BY Total_Revenue DESC
LIMIT 1;
USE retail_sales_db;

SELECT
    CASE
        WHEN DAYOFWEEK(Order_Date) IN (1, 7)
        THEN 'Weekend'
        ELSE 'Weekday'
    END AS Sales_Type,

    COUNT(Order_ID) AS Total_Orders,
    SUM(Quantity) AS Total_Quantity,
    SUM(Revenue_LKR) AS Total_Revenue,
    SUM(Cost_LKR) AS Total_Cost,
    SUM(Profit_LKR) AS Total_Profit,

    ROUND(
        SUM(Profit_LKR) /
        NULLIF(SUM(Revenue_LKR), 0) * 100,
        2
    ) AS Profit_Margin

FROM sales
GROUP BY Sales_Type;