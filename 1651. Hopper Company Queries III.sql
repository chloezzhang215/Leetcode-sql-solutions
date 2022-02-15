# Write your MySQL query statement below
WITH recursive mon_time AS(
    SELECT 1 AS month 
    UNION ALL
    SELECT month + 1 FROM mon_time WHERE month <= 11
)

SELECT month, 
ROUND(AVG(month_ride_distance)over(order by month ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING),2) AS average_ride_distance,
ROUND(AVG(month_ride_duration)over(order by month ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING),2) AS average_ride_duration
FROM
(
    SELECT m.month, IFNULL(SUM(ride_distance),0) AS month_ride_distance,
                IFNULL(SUM(ride_duration),0) AS month_ride_duration
    FROM AcceptedRides A JOIN Rides R ON A.ride_id = R.ride_id 
    AND YEAR(requested_at) = '2020'
    RIGHT JOIN mon_time m ON m.month = MONTH(requested_at)
    GROUP BY m.month
)A
ORDER BY month
LIMIT 10
