SELECT employee_id,name,salary,
       dense_rank()over(order by salary) AS team_id
FROM 
(SELECT employee_id,name,salary,
       COUNT(*) over(partition by salary) AS cnt
FROM Employees)A
WHERE cnt > 1
ORDER BY team_id,employee_id
