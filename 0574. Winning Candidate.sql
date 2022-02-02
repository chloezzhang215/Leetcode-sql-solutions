SELECT DISTINCT name FROM
(SELECT candidateId, name, COUNT(name) AS cnt
FROM Vote LEFT JOIN Candidate ON Vote.candidateId  = Candidate.id
GROUP BY name) t1
ORDER BY cnt DESC LIMIT 1
