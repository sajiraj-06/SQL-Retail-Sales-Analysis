USE retail_sales_db;
CREATE TABLE Customer(
Customer_ID VARCHAR(20),
Customer_Name VARCHAR(100),
City VARCHAR(50));
USE retail_sales_db;
INSERT INTO Customer(Customer_ID,Customer_Name,City)
VALUE 
('Cust001','Amal','Colompo'),
('Cust002','Ravi','Negompo'),
('Cust003','Kmar','Kandy'),
('Cust004','Nimal','Galle'),
('Cust005','Saman','Jaffna'),
('Cust006','Arun','Matara'),
('Cust007','Ruwan','Kurunegala'),
('Cust008','Kamal','Anuradhapuram'),
('Cust009','Sunil','Colompo'),
('Cust0010','Ajith','Negompo'),
('Cust0027','Mohan','Kandy');
SELECT* FROM Customer;
use retail_sales_db;
select 
sales.Order_ID,
sales.Customer_ID,
Customer.Customer_Name,
Customer.City,
sales.Product,
sales.Profit_LKR,
sales.Revenue_LKR FROM SALES
INNER JOIN Customer on sales.Customer_ID =Customer.Customer_ID;
use retail_sales_db;
select 
Customer.City,
count(Distinct sales.Order_ID)AS Total_Order,
SUM(sales.Revenue_LKR)AS Total_Revenue,
SUM(sales.Profit_lkr)AS TOTAL_Profit from sales
inner join Customer on sales.Customer_ID = Customer.Customer_ID
GROUP BY Customer.City
ORDER BY Total_Revenue desc;
select 
Customer.Customer_ID,
Customer.Customer_Name,
Customer.City,
SUM(sales.Revenue_LKR)AS Total_Revenue,
SUM(sales.Profit_lkr)AS TOTAL_Profit from sales
inner join Customer on sales.Customer_ID = Customer.Customer_ID
GROUP BY Customer.City ,
Customer.Customer_ID,
Customer.Customer_Name
ORDER BY Total_Revenue desc;
select 
Customer.Customer_ID,
Customer.Customer_Name,
Customer.City,
SUM(sales.Revenue_LKR)AS Total_Revenue,
SUM(sales.Profit_lkr)AS TOTAL_Profit from sales
inner join Customer on sales.Customer_ID = Customer.Customer_ID
GROUP BY Customer.City ,
Customer.Customer_ID,
Customer.Customer_Name
ORDER BY Total_Revenue desc
limit 5;
USE retail_sales_db;
SELECT
    sales.Customer_ID,
Customer.Customer_Name,
Customer.City,
sales.Product,
sales.Profit_LKR,
sales.Revenue_LKR  from sales
left join Customer on sales.Customer_ID = Customer.Customer_Id;
SELECT
    COUNT(*) AS Total_Sales,
    COUNT(Customer.Customer_ID) AS Matched_Customers
FROM sales
LEFT JOIN Customer
ON sales.Customer_ID = Customer.Customer_ID;
SELECT DISTINCT Customer_ID
FROM sales
ORDER BY Customer_ID;
SELECT
    Customer.Customer_ID,
    Customer.Customer_Name,
    Customer.City,
    sales.Order_ID,
    sales.Product,
    sales.Revenue_LKR
FROM sales
RIGHT JOIN Customer
ON sales.Customer_ID = Customer.Customer_ID;
USE retail_sales_db;

SELECT
    Customer.Customer_ID,
    Customer.Customer_Name,
    Customer.City
FROM Customer
LEFT JOIN sales
ON Customer.Customer_ID = sales.Customer_ID
WHERE sales.Customer_ID IS NULL;