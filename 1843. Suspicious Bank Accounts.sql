WITH t1 AS(
    SELECT account_id, DATE_FORMAT(day,'%Y%m') AS day
    FROM Transactions JOIN Accounts USING (account_id)
    WHERE type = 'Creditor'
    GROUP BY account_id, DATE_FORMAT(day,'%Y%m')
    HAVING SUM(amount)>AVG(max_income)
)
SELECT DISTINCT account_id FROM t1
WHERE (account_id, PERIOD_ADD(day, 1)) IN (SELECT account_id,day FROM t1)
