SELECT item_category AS Category, 
        SUM(CASE day WHEN 'Monday' THEN quantity ELSE 0 END) AS Monday,
        SUM(CASE day WHEN 'Tuesday' THEN quantity ELSE 0 END) AS Tuesday,
        SUM(CASE day WHEN 'Wednesday' THEN quantity ELSE 0 END) AS Wednesday,
        SUM(CASE day WHEN 'Thursday' THEN quantity ELSE 0 END) AS Thursday,
        SUM(CASE day WHEN 'Friday' THEN quantity ELSE 0 END) AS Friday,
        SUM(CASE day WHEN 'Saturday' THEN quantity ELSE 0 END) AS Saturday,
        SUM(CASE day WHEN 'Sunday' THEN quantity ELSE 0 END) AS Sunday
FROM
(SELECT day, item_id, SUM(quantity) AS quantity, item_category FROM
(SELECT DAYNAME(O.order_date) AS day, I.item_id, O.quantity, I.item_category
FROM Orders O RIGHT JOIN Items I ON O.item_id = I.item_id)A
GROUP BY item_category,day)B
GROUP BY Category
ORDER BY Category
