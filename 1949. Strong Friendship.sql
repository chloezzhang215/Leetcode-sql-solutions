# Write your MySQL query statement below
WITH f AS(
    SELECT user1_id, user2_id FROM Friendship
    UNION ALL
    SELECT user2_id, user1_id FROM Friendship
),
t AS(
    SELECT f1.user1_id AS a1 ,f1.user2_id AS a2,f2.user1_id AS b1,f2.user2_id AS b2
    FROM f f1 LEFT JOIN f f2 ON f1.user2_id = f2.user1_id
),
A AS(
    SELECT a1, a2, COUNT(user2_id) AS common_friend
    FROM t LEFT JOIN f ON t.a1 = f.user1_id AND t.b2 = f.user2_id
    GROUP BY a1, a2
    HAVING COUNT(user2_id)>=3
)

SELECT a1 AS user1_id, a2 AS user2_id, common_friend
FROM A
WHERE a1 < a2

