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


--#181.  Employees Earning More Than Their Managers
/*
Write an SQL query to find the employees who earn more than their managers.

*/
SELECT a.name AS Employee
FROM Employee a LEFT JOIN Employee b ON(a.managerId = b.id)
WHERE a.salary > b.salary


--#182.  Duplicate Emails
/*
Write an SQL query to find the employees who earn more than their managers.

*/
SELECT DISTINCT email AS Email
FROM
(SELECT email,COUNT(*)
FROM Person
GROUP BY email
HAVING COUNT(*) > 1)a


--#185.  Department Top Three Salaries
/*
A company's executives are interested in seeing who earns the most money in each of the company's departments. 
A high earner in a department is an employee who has a salary in the top three unique salaries for that department.

Write an SQL query to find the employees who are high earners in each of the departments.

*/
SELECT Department,Employee,Salary
FROM
(SELECT *,
dense_rank()over(partition by Department order by Salary desc) AS ranking
FROM
(SELECT a.name AS Employee,salary AS Salary,b.name AS Department
FROM Employee a LEFT JOIN Department b ON (a.departmentId=b.id))a
)b
WHERE ranking<=3
