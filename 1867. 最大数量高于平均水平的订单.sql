--#1867. 最大数量高于平均水平的订单
/*
You are running an e-commerce site that is looking for imbalanced orders. 
An imbalanced order is one whose maximum quantity is strictly greater than the average quantity of every order (including itself).

The average quantity of an order is calculated as (total quantity of all products in the order) / (number of different products in the order). 
The maximum quantity of an order is the highest quantity of any single product in the order.

Write an SQL query to find the order_id of all imbalanced orders.

*/
SELECT order_id FROM OrdersDetails 
GROUP BY order_id
HAVING MAX(quantity) > ALL(SELECT AVG(quantity) FROM OrdersDetails GROUP BY order_id)
