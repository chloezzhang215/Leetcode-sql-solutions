--#572. Winning Candidate
/*
Write an SQL query to report the name of the winning candidate (i.e., the candidate who got the largest number of votes).


*/
SELECT name
FROM Candidate
WHERE Candidate.id = 
(SELECT candidateId FROM Vote
GROUP BY candidateId
ORDER BY COUNT(candidateId) DESC 
LIMIT 1)


--#577. Employee Bonus
/*
Write an SQL query to report the name and bonus amount of each employee with a bonus less than 1000.

*/
SELECT name,bonus
FROM Employee LEFT JOIN Bonus ON Employee.empId = Bonus.empId
WHERE bonus < 1000 OR bonus IS NULL
