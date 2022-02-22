# Write your MySQL query statement below
SELECT C1.user_id 
FROM Confirmations C1 LEFT JOIN Confirmations C2
ON C1.user_id = C2.user_id AND C1.time_stamp != C2.time_stamp
AND TIMESTAMPDIFF(second, C1.time_stamp, C2.time_stamp) BETWEEN 0 AND 86400
GROUP BY C1.user_id
HAVING COUNT(C2.user_id) > 0


