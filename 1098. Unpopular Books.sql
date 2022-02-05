SELECT b.book_id, name
FROM Books b LEFT JOIN Orders o ON o.book_id = b.book_id AND dispatch_date >='2018-06-23'
WHERE available_from < '2019-05-23'
GROUP BY b.book_id
HAVING SUM(quantity) < 10 OR SUM(quantity) IS NULL
