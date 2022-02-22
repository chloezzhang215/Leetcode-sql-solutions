# Write your MySQL query statement below
WITH t1 AS(
    SELECT user1_id, user2_id FROM Friendship
    UNION ALL
    SELECT user2_id, user1_id FROM Friendship
)  

SELECT user1_id AS user_id, l.page_id, COUNT(DISTINCT user2_id) AS friends_likes
FROM t1 LEFT JOIN Likes l ON t1.user2_id = l.user_id
LEFT JOIN Likes l1 ON t1.user1_id = l1.user_id
GROUP BY user1_id,l.page_id
HAVING SUM(l.page_id=l1.page_id)=0

