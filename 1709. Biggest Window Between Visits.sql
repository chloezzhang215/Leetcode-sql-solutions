# Write your MySQL query statement below
SELECT user_id, MAX(windows) AS biggest_window
FROM
(SELECT user_id, DATEDIFF(lead(visit_date, 1, '2021-1-1')over(partition by user_id order by visit_date), visit_date) AS windows
FROM UserVisits)A
GROUP BY user_id

