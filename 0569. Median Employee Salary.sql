SELECT id, company, salary FROM
(SELECT *, row_number()over(partition by company order by salary) as ranking,
 COUNT(id)over(partition by company) as cnt
FROM Employee)a
WHERE ranking>=cnt/2 AND ranking<=cnt/2+1
