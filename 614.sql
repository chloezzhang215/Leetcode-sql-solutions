--#614. Second Degree Follower
/*
Write an SQL query to report the second-degree users and the number of their followers.

*/
SELECT followee AS follower,COUNT(DISTINCT follower) AS num
FROM follow
WHERE followee IN (SELECT follower FROM follow)
GROUP BY followee
