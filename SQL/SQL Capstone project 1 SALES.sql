CREATE TABLE [dbo].[LITA_Capstone_Sales Data] (
OrderID INT PRIMARY KEY,
CustomerID VARCHAR(250),
Product VARCHAR(250),
Region VARCHAR(250),
OrderDate DATE,
Quantity INT,
UnitPrice DECIMAL(5, 2),
TotalRevenue AS (Quantity * UnitPrice)
);


SELECT * FROM [dbo].[LITA_Capstone_Sales Data]

----Total sales for each product category------
SELECT product,
       SUM(Quantity * UnitPrice) AS totalsales
FROM [dbo].[LITA_Capstone_Sales Data]
GROUP BY Product;


-----The Number Transactions in Each Region-----
SELECT Region,
      COUNT(OrderID) AS number_of_transactions
FROM [dbo].[LITA_Capstone_Sales Data]
GROUP BY Region

----The Highest-Selling Product by Total Sales Value-----
SELECT TOP 1 Product,
      SUM(Quantity * UnitPrice) AS totalsales
FROM [dbo].[LITA_Capstone_Sales Data]
GROUP BY Product
ORDER BY TotalSales DESC; 
         
-----Total Revenue Per Product------
SELECT Product,
      SUM(Quantity * UnitPrice) AS totalrevenue
FROM [dbo].[LITA_Capstone_Sales Data]
GROUP BY Product;

-----The Monthly sales total for the current year-----
SELECT DATEPART (MONTH , OrderDate) AS OrderMonth,
SUM(Quantity * UnitPrice) as total_sales
fROM [dbo].[LITA_Capstone_Sales Data]
WHERE DATEPART (Year , OrderDate) = YEAR(GETDATE())
GROUP BY DATEPART (MONTH , OrderDate)
ORDER BY OrderMonth;

-----Top Five Customers by Total Purchase Amount------
SELECT TOP 5 Customer_Id,
      SUM(Quantity * UnitPrice) AS totalpurchaseamount
FROM [dbo].[LITA_Capstone_Sales Data]
GROUP BY Customer_Id
ORDER BY totalpurchaseamount DESC;

SELECT *FROM  [dbo].[LITA_Capstone_Sales Data]


------The percentage of total sales contributed by each region-----
SELECT Region,
       SUM(Quantity * UnitPrice) AS Regionsales,
	   CAST(SUM(Quantity * UnitPrice) *100.0 / (SELECT SUM(Quantity * UnitPrice) 
	   FROM [dbo].[LITA_Capstone_Sales Data]) AS DECIMAL(5, 2)) AS salespercentage,
	   CONCAT(CAST(SUM(Quantity * UnitPrice) *100.0 / (SELECT SUM(Quantity * UnitPrice) 
	   FROM [dbo].[LITA_Capstone_Sales Data]) AS DECIMAL(5, 2)),
	     '%') AS 
	   Salespercentagedisplay
	   FROM [dbo].[LITA_Capstone_Sales Data]
	   GROUP BY Region;


	   -----Identifying products with no sales in the last quarter-----
SELECT Product
FROM [dbo].[LITA_Capstone_Sales Data]
WHERE OrderDate < DATEADD(QUARTER, -1, GETDATE())
GROUP BY Product;

