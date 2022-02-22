1.构建一个f表，代表朋友关系，用于筛除是朋友关系的记录

2.构建一个l表，代表没有任何重复的听歌数据

3.l表做一个自连接，连接条件不同用户，相同日期，再筛选出歌曲相同的记录

4.按日期，用户1，用户2进行分组，过滤掉相同歌曲数量低于3首的记录

5.用f表跟前面的结果做一个连接，过滤掉是朋友的记录即可

# Write your MySQL query statement below
WITH f AS(
    SELECT user1_id, user2_id FROM Friendship
    UNION ALL
    SELECT user2_id, user1_id FROM Friendship
),
l AS(
    SELECT DISTINCT * FROM Listens
),
t AS(
    SELECT l1.day, l1.user_id AS user_id, l2.user_id AS recommended_id
    FROM l l1 LEFT JOIN l l2 ON l1.day = l2.day AND l1.user_id != l2.user_id
    WHERE l1.song_id = l2.song_id 
    GROUP BY l1.day, l1.user_id, l2.user_id
    HAVING SUM(l1.song_id = l2.song_id)>=3
)

SELECT DISTINCT user_id, recommended_id
FROM t LEFT JOIN f ON t.user_id = f.user1_id AND t.recommended_id = f.user2_id
WHERE user1_id IS NULL AND user2_id IS NULL


