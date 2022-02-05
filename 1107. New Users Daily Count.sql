SELECT login_date, COUNT(user_id) AS user_count
FROM
(SELECT user_id, activity, MIN(activity_date) AS login_date FROM Traffic
WHERE activity = 'login'
GROUP BY user_id)A
WHERE DATEDIFF('2019-06-30',login_date)<=90
GROUP BY login_date
