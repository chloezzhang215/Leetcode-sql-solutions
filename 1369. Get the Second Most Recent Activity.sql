SELECT username, activity, startDate, endDate FROM
(SELECT *, COUNT(*)over(partition by username) AS cnt, 
        rank()over(partition by username order by startDate DESC) AS rnk
FROM UserActivity)A
WHERE rnk = 2 OR cnt = 1
