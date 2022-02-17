--#1795. 每个产品在不同商店的价格
/*
Write an SQL query to rearrange the Products table so that each row has (product_id, store, price). 
If a product is not available in a store, do not include a row with that product_id and store combination in the result table.
*/

SELECT product_id,'store1' AS store, store1 AS price
FROM Products WHERE store1 IS NOT NULL
GROUP BY product_id
UNION ALL
SELECT product_id,'store2' AS store, store2 AS price
FROM Products WHERE store2 IS NOT NULL
GROUP BY product_id
UNION ALL
SELECT product_id,'store3' AS store, store3 AS price
FROM Products WHERE store3 IS NOT NULL
GROUP BY product_id
