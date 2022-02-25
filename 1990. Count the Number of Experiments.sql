# Write your MySQL query statement below
WITH t1 AS(
    SELECT 'Android' AS platform
    UNION
    SELECT 'IOS' AS platform 
    UNION
    SELECT 'Web' AS platform 
),
t2 AS(
    SELECT 'Reading' AS experiment_name
    UNION
    SELECT 'Sports' AS experiment_name
    UNION
    SELECT 'Programming' AS experiment_name
)

SELECT t1.platform, t2.experiment_name, COUNT(experiment_id) AS num_experiments
FROM t1 JOIN t2 LEFT JOIN Experiments e 
ON t1.platform = e.platform AND t2.experiment_name = e.experiment_name
GROUP BY t1.platform, t2.experiment_name



