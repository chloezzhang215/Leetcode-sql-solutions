--#180. Consecutive Numbers

/*
Write an SQL query to find all numbers that appear at least three times consecutively.
*/

SELECT DISTINCT a.num AS ConsecutiveNums
FROM Logs a,Logs b,Logs c
WHERE a.id = b.id-1 AND b.id = c.id-1 AND a.num = b.num AND b.num = c.num


SELECT DISTINCT num AS ConsecutiveNums FROM
(SELECT *, COUNT(*) FROM
(SELECT *, row_number()over(order by id)-row_number()over(partition by num order by id) AS ranking FROM Logs)a
GROUP BY num,ranking
HAVING COUNT(*)>=3)b
