--#614. Second Degree Follower
/*
Write an SQL query to report the second-degree users and the number of their followers.

*/
SELECT followee AS follower, COUNT(DISTINCT follower) AS num
FROM Follow
WHERE followee IN (SELECT follower FROM Follow)
GROUP BY followee
ORDER BY follower
