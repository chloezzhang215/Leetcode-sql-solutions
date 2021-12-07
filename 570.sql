--#570. Managers with at Least 5 Direct Reports
/*
Write an SQL query to report the managers with at least five direct reports.

Return the result table in any order.

The query result format is in the following example.
*/
SELECT a.name 
FROM Employee a JOIN Employee b ON (b.ManagerId=a.Id)
GROUP BY b.ManagerId
HAVING COUNT(b.ManagerId)>=5
