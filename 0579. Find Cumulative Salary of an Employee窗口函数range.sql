SELECT id, month, SUM(salary)over(partition by id order by month range 2 preceding) AS Salary
FROM Employee
WHERE (id, month) NOT IN (SELECT id, MAX(month) FROM Employee GROUP BY id)
ORDER BY id, month DESC
