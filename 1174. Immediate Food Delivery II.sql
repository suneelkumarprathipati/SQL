;WITH tot AS (SELECT CAST(COUNT(DISTINCT customer_id) as decimal(18,2)) as TotalCust
FROM Delivery)

SELECT ROUND((COUNT(DISTINCT customer_id) /tot.TotalCust) * 100 ,2) AS immediate_percentage
FROM Delivery od CROSS JOIN tot
WHERE EXISTS
(
  SELECT 1 FROM Delivery id WHERE od.customer_id = id.customer_id 
            AND od.order_date = od.customer_pref_delivery_date 
    GROUP BY id.customer_id 
    HAVING od.ORDER_date = MIN(id.order_date)
)
GROUP BY tot.TotalCust;
