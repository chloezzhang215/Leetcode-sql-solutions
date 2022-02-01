--#1097. Game Play Analysis V
/*
Write an SQL query to report for each install date, the number of players that installed the game on that day, and the day one retention

*/

SELECT t1.install_dt, COUNT(t1.player_id) AS installs, ROUND(COUNT(Activity.player_id)/COUNT(t1.player_id),2) AS Day1_retention 
FROM
(SELECT player_id, MIN(event_date) AS install_dt 
FROM Activity GROUP BY player_id)t1 
LEFT JOIN Activity ON (t1.player_id = Activity.player_id AND DATEDIFF(Activity.event_date,t1.install_dt)=1)
GROUP BY t1.install_dt
