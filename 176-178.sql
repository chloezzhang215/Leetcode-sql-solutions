--#176. Second Highest Salary
/*
Write an SQL query to report the second highest salary from the Employee table. If there is no second highest salary, the query should report null.

*/

SELECT ifNull(
(SELECT DISTINCT salary  
FROM Employee
ORDER BY salary DESC 
LIMIT 1 OFFSET 1),null)
AS SecondHighestSalary


--#177. Nth Highest Salary
/*
Write an SQL query to report the nth highest salary from the Employee table. If there is no nth highest salary, the query should report null.

*/

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  declare m INT;
  SET m = N-1;
  RETURN (
      SELECT ifNull(
        (SELECT DISTINCT salary  
        FROM Employee
        ORDER BY salary DESC 
        LIMIT 1 OFFSET m),null)
        AS SecondHighestSalary
      
  );
END


--#178. Rank Scores
/*
Write an SQL query to rank the scores. 

*/
SELECT score, dense_rank()over(order by score desc) AS 'rank' 
FROM Scores

