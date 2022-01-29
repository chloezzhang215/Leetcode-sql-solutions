--#180. Consecutive Numbers

/*
Write an SQL query to find all numbers that appear at least three times consecutively.
*/
SELECT DISTINCT Num AS ConsecutiveNums FROM(
    SELECT Num,COUNT(*) FROM 
    (SELECT Id, Num, 
    ROW_NUMBER()over(order by Id) -
    ROW_NUMBER() over(partition by Num order by Id) as subsequence
    FROM Logs) AS sub
    GROUP BY Num,subsequence HAVING COUNT(*) >= 3) a
