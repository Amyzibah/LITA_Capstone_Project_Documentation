------CUSTOMER DATA-----

SELECT * FROM [dbo].[LITA Capstone customer data]

----Retrival of the Total number of Customers from each Region----
SELECT Region,
      COUNT(CustomerID) AS totalcustomers
	  FROM [dbo].[LITA Capstone customer data]
GROUP BY Region;


-----The Most Popular Subscription Type by the Number of Customers-----
SELECT TOP 1 SubscriptionType,
       COUNT(CustomerID) AS customercount
	   FROM [dbo].[LITA Capstone customer data]
	   GROUP BY SubscriptionType
	   ORDER BY customercount DESC;

SELECT SubscriptionType,
       COUNT(CustomerID) AS customercount
	   FROM [dbo].[LITA Capstone customer data]
	   GROUP BY SubscriptionType
	   ORDER BY customercount DESC;


------Customers who cancelled Subscription within 6 months------
SELECT 
     CustomerName,SubscriptionStart,SubscriptionEnd
FROM
    [dbo].[LITA Capstone customer data]
WHERE Canceled = 1 AND SubscriptionEnd <= DATEADD(MONTH, -6, GETDATE());
      

 select * from [dbo].[LITA Capstone customer data]

 
 -----The Average Subscription Duration For all Customers------
 SELECT
     AVG(DATEDIFF(MONTH,SubscriptionStart,SubscriptionEnd))
 AS 
   Averagesubscriptionduration
FROM 
   [dbo].[LITA Capstone customer data]


   ------Customers with Subscriptions longer than 12 momths------
SELECT 
     CustomerName,SubscriptionStart,SubscriptionEnd
FROM
    [dbo].[LITA Capstone customer data]
WHERE DATEDIFF(MONTH,SubscriptionStart,SubscriptionEnd) >= 12;


------Total Revenue by Subscription Type------
SELECT SubscriptionType,SUM(Revenue)
      AS totalrevenue
FROM [dbo].[LITA Capstone customer data]
GROUP BY SubscriptionType;


------Top 3 Regions by Subscription Cancellations-------
SELECT TOP 3 Region, COUNT(CustomerID) AS cancellationcount
FROM [dbo].[LITA Capstone customer data]
WHERE Canceled = 1
GROUP BY Region
ORDER BY cancellationcount DESC;


------The Total Number of active and canceled Subscriptions-------
SELECT Canceled, COUNT(CustomerID)
       AS totalsubscriptions
FROM [dbo].[LITA Capstone customer data]
GROUP BY Canceled;


