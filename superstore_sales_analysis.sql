create database superstore_project ;
use superstore_project;
select* from superstore limit 10;

 -- Query 1 : Total sales by category 
SELECT Category, 
       ROUND(SUM(Sales), 2) AS Total_Sales
FROM superstore
GROUP BY Category
ORDER BY Total_Sales DESC;

-- Query 2 : Total profit by category 
SELECT Category,
       ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore
GROUP BY Category
ORDER BY Total_Profit DESC;

-- Query 3 : Top 10 most profitable products 
SELECT 'Product Name',
       ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore
GROUP BY 'Product Name' 
ORDER BY Total_Profit DESC
LIMIT 10;
SELECT `Product Name` FROM superstore LIMIT 5;
SET SQL_SAFE_UPDATES = 0;

DELETE FROM superstore 
WHERE `Product Name` = 'Product Name';

SET SQL_SAFE_UPDATES = 1;
SELECT `Product Name`,
       ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore
GROUP BY `Product Name`
ORDER BY Total_Profit DESC
LIMIT 10;

-- Query 4 : Sales by Region 
SELECT Region,
       ROUND(SUM(Sales), 2) AS Total_Sales,
       ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore
GROUP BY Region
ORDER BY Total_Sales DESC; 

-- Query 5 : Monthly sales trend 
SELECT DATE_FORMAT(STR_TO_DATE(`Order Date`, '%m/%d/%Y'), '%Y-%m') AS Month,
       ROUND(SUM(Sales), 2) AS Monthly_Sales
FROM superstore
GROUP BY Month
ORDER BY Month;

-- Query 6 : Bottom 10 Loss Making Products
SELECT `Product Name`,
       ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore
GROUP BY `Product Name`
ORDER BY Total_Profit ASC
LIMIT 10;

-- Query 7: Impact of Discount on Profit
SELECT 
    CASE 
        WHEN Discount = 0 THEN 'No Discount'
        WHEN Discount <= 0.2 THEN 'Low Discount (0-20%)'
        WHEN Discount <= 0.4 THEN 'Medium Discount (21-40%)'
        ELSE 'High Discount (40%+)'
    END AS Discount_Level,
    ROUND(AVG(Profit), 2) AS Avg_Profit,
    COUNT(*) AS Number_of_Orders
FROM superstore
GROUP BY Discount_Level
ORDER BY Avg_Profit DESC;

-- Query 8: Sales by Customer Segment
SELECT Segment,
       ROUND(SUM(Sales), 2) AS Total_Sales,
       ROUND(SUM(Profit), 2) AS Total_Profit,
       COUNT(DISTINCT `Customer ID`) AS Total_Customers
FROM superstore
GROUP BY Segment
ORDER BY Total_Sales DESC;

-- Query 9: Shipping Mode Preference
SELECT `Ship Mode`,
       COUNT(*) AS Total_Orders,
       ROUND(SUM(Sales), 2) AS Total_Sales
FROM superstore
GROUP BY `Ship Mode`
ORDER BY Total_Orders DESC;

-- Query 10: Top 5 States by Sales
SELECT State,
       ROUND(SUM(Sales), 2) AS Total_Sales,
       ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore
GROUP BY State
ORDER BY Total_Sales DESC
LIMIT 5;



	   



