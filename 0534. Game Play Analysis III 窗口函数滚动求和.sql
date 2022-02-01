SELECT player_id, event_date, 
SUM(games_played)over(partition by player_id order by event_date) AS games_played_so_far
FROM Activity

