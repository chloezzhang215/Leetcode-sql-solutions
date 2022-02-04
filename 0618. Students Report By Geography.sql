SELECT MAX(CASE continent WHEN 'America' THEN name ELSE NULL END)AS America,
        MAX(CASE continent WHEN 'Asia' THEN name ELSE NULL END)AS Asia,
        MAX(CASE continent WHEN 'Europe' THEN name ELSE NULL END)AS Europe
FROM(
SELECT *, row_number()over(partition by continent order by name)AS ranking FROM Student
)t1
GROUP BY ranking
