SELECT O.customer_id, customer_name
FROM Orders O JOIN Customers C ON O.customer_id = C.customer_id 
GROUP BY O.customer_id
HAVING SUM(product_name = 'A')>0 AND SUM(product_name = 'B')>0  AND SUM(product_name = 'C')=0
ORDER BY O.customer_id
