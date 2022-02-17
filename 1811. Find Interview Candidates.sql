WITH t1 AS
(
    SELECT contest_id, gold_medal AS medal FROM Contests
    UNION ALL
    SELECT contest_id, silver_medal AS medal FROM Contests
    UNION ALL
    SELECT contest_id, bronze_medal AS medal FROM Contests
)

SELECT name, mail
FROM Users WHERE user_id IN
(
    SELECT gold_medal AS medal FROM Contests
    GROUP BY gold_medal
    HAVING COUNT(*) >= 3 
    UNION 
    SELECT medal 
    FROM(
        SELECT *, LEAD(contest_id,2)over(partition by medal order by contest_id) AS lead2             FROM t1
    )A
    WHERE contest_id + 2 = lead2
)
