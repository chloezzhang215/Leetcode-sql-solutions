WITH tmp AS
    (SELECT SUM(amount > 0) AS cnt FROM
        (SELECT user_id, visit_date AS date, 0 AS amount FROM Visits
        UNION ALL
        SELECT user_id, transaction_date AS date, amount FROM Transactions)A
    GROUP BY user_id,date)

SELECT FLOOR(n) AS transactions_count,COUNT(cnt) AS visits_count
FROM
    (SELECT 0 AS n
    UNION ALL
    SELECT (@x := @x+1) AS n FROM Transactions, (SELECT @x := 0) AS num)B
LEFT JOIN tmp ON B.n = tmp.cnt
WHERE n <= (SELECT MAX(cnt) FROM tmp)
GROUP BY n
