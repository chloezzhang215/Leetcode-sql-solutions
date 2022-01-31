SELECT Department,Employee,Salary FROM
(SELECT *, dense_rank()over(partition by Department order by Salary desc) AS ranking FROM
(SELECT b.name AS Department, a.name AS Employee, a.salary AS Salary
FROM Employee a LEFT JOIN Department b ON a.departmentId = b.id)t1)t2
WHERE ranking = 1
