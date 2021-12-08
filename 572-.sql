--#569. Median Employee Salary
/*
Write an SQL query to find the median salary of each company.
*/
SELECT name
FROM Candidate RIGHT JOIN Vote ON (Candidate.id = Vote.candidateId)
GROUP BY name
HAVING COUNT(name) >=
ALL(SELECT COUNT(name)
FROM Candidate RIGHT JOIN Vote ON (Candidate.id = Vote.candidateId))
