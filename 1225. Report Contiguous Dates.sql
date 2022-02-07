SELECT type AS period_state, MIN(date) AS start_date, MAX(date) AS end_date
FROM
    (SELECT type, date, SUBDATE(date,row_number()over(partition by type order by date)) AS diff
    FROM
        (SELECT 'failed' AS type, fail_date AS date FROM Failed
        UNION ALL 
        SELECT 'succeeded' AS type, success_date AS date FROM Succeeded)A)B
WHERE date BETWEEN '2019-01-01' AND '2019-12-31'
GROUP BY type, diff
ORDER BY start_date
