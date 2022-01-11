Write an SQL query that will, for each user_id, find out the largest window of days between each visit and the one right after it (or today if you are considering the last visit).


SELECT user_id, MAX(windows) AS biggest_window
FROM(SELECT user_id, datediff(lead(visit_date, 1, "2021-01-01") over(partition by user_id order by visit_date), visit_date) AS windows FROM UserVisits) temp
GROUP BY user_id
