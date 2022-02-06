SELECT ROUND(AVG(daily_percent),2) AS average_daily_percent
FROM
(SELECT COUNT(DISTINCT R.post_id)/COUNT(DISTINCT A.post_id)*100 AS daily_percent
FROM Actions A LEFT JOIN Removals R ON A.post_id = R.post_id
WHERE extra = 'spam'
GROUP BY action_date)A
