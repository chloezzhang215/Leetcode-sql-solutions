SELECT e.business_id FROM Events e JOIN
(SELECT *, AVG(occurences) AS avg_occ FROM Events
GROUP BY event_type)A ON e.event_type = A.event_type
WHERE e.occurences > A.avg_occ
GROUP BY business_id
HAVING COUNT(*) > 1
