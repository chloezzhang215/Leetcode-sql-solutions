--#1783. 大满贯数量
/*
Write an SQL query to report the number of grand slam tournaments won by each player. Do not include the players who did not win any tournament.

*/
SELECT P.player_id, P.player_name, COUNT(*) AS grand_slams_count
FROM Players P RIGHT JOIN
(SELECT Wimbledon AS player_id FROM Championships
UNION ALL
SELECT Fr_open FROM Championships
UNION ALL
SELECT US_open FROM Championships
UNION ALL
SELECT Au_open FROM Championships) tmp
ON (tmp.player_id = P.player_id)
GROUP BY P.player_id
