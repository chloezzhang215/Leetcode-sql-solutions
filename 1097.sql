--#1097. Game Play Analysis V
/*
Write an SQL query to report for each install date, the number of players that installed the game on that day, and the day one retention

*/

SELECT A.install_date,COUNT(A.player_id) AS `installs`,COUNT(AA.player_id) AS `return_cnt`
FROM 
(
	SELECT player_id,MIN(event_date) AS `install_date`
	FROM Activity
	GROUP BY player_id
) AS A
left JOIN Activity AS AA 
	ON (AA.event_date = DATE_ADD(A.install_date,INTERVAL 1 DAY) AND AA.player_id = A.player_id)
GROUP BY A.install_date
