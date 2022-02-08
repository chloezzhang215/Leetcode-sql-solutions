SELECT activity FROM Friends
GROUP BY activity
HAVING COUNT(name) != (SELECT COUNT(name) FROM Friends GROUP BY activity ORDER BY COUNT(name) DESC LIMIT 1)
AND COUNT(name) != (SELECT COUNT(name) FROM Friends GROUP BY activity ORDER BY COUNT(name) LIMIT 1)
