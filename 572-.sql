--#569. Winning Candidate
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
