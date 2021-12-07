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


--#571. Find Median Given Frequency of Numbers
/*

The median is the value separating the higher half from the lower half of a data sample.

Write an SQL query to report the median of all the numbers in the database after decompressing the Numbers table. Round the median to one decimal point.
*/

SELECT AVG(num) median 
FROM
(SELECT n1.num FROM Numbers n1 JOIN Numbers n2 ON (n1.num>=n2.num )
 GROUP BY n1.num 
 HAVING SUM(n2.frequency)>=(SELECT SUM(frequency) FROM Numbers)/2 
 AND SUM(n2.frequency)-AVG(n1.frequency)<=(SELECT SUM(frequency) FROM Numbers)/2
)s

