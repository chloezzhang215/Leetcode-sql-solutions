# Write your MySQL query statement below
WITH t AS(
    SELECT caller_id AS id1, recipient_id AS id2, call_time, DATE_FORMAT(call_time,'%Y-%m-%d') AS day FROM Calls
    UNION ALL
    SELECT recipient_id AS id1, caller_id AS id2, call_time, DATE_FORMAT(call_time,'%Y-%m-%d') AS day FROM Calls
),
t1 AS(
    SELECT id1, id2, day, rank()over(partition by id1, day order by call_time) AS rnk1,
           rank()over(partition by id1, day order by call_time desc) AS rnk2
    FROM t
)

SELECT DISTINCT id1 AS user_id FROM t1
WHERE rnk1 = 1 OR rnk2 = 1
GROUP BY id1, day
HAVING COUNT(DISTINCT id2) = 1
