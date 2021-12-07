--#569. Median Employee Salary
/*
Write an SQL query to find the median salary of each company.

*/

SELECT Id,Company,Salary
FROM
(SELECT Id,Company,Salary, 
row_number()over(partition by Company ORDER BY Salary)as ranking,
COUNT(Id) over(partition by Company)as cnt
FROM Employee
)a
WHERE ranking>=cnt/2 AND ranking<=cnt/2+1




--#570. Managers with at Least 5 Direct Reports
/*
Write an SQL query to report the managers with at least five direct reports.

*/

SELECT a.name 
FROM Employee a JOIN Employee b ON (b.ManagerId=a.Id)
GROUP BY b.ManagerId
HAVING COUNT(b.ManagerId)>=5
