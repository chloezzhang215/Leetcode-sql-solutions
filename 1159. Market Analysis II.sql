SELECT A.seller_id,
      IF(item_brand IS null,'no',
      CASE WHEN item_brand = favorite_brand THEN 'yes' ELSE 'no' END) AS 2nd_item_fav_brand
FROM
(SELECT user_id AS seller_id
FROM Users)A
LEFT JOIN 
(SELECT * FROM
(SELECT O.seller_id, I.item_brand, U.favorite_brand,rank()over(partition by seller_id order by order_date) AS ranking
FROM Orders O LEFT JOIN Users U ON O.seller_id = U.user_id
LEFT JOIN Items I ON O.item_id = I.item_id)t1
WHERE ranking = 2)B
ON A.seller_id = B.seller_id
