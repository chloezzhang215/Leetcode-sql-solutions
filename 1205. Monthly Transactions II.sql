SELECT month, country,
COUNT(IF(tag=1, 1, NULL)) AS approved_count,
SUM(IF(tag=1, amount, 0)) AS approved_amount,
COUNT(IF(tag=0, 1, NULL)) AS chargeback_count,
SUM(IF(tag=0, amount, 0)) AS chargeback_amount
FROM (
    SELECT country, amount, 1 AS tag,
    date_format(trans_date, '%Y-%m') AS month
    FROM Transactions
    WHERE state='approved'
    
    UNION ALL

    SELECT country, amount, 0 AS tag,
    date_format(c.trans_date, '%Y-%m') AS month
    FROM Transactions AS t RIGHT OUTER JOIN Chargebacks AS c
    ON t.id = c.trans_id
) AS temp
GROUP BY  month, country
