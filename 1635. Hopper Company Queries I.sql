WITH recursive mon_time AS(
    SELECT 1 AS month
    UNION ALL
    SELECT month + 1 FROM mon_time WHERE month <= 11
)

SELECT m.month, SUM(IFNULL(num_driver,0))over(order by m.month) AS active_drivers,
IFNULL(num_rides,0) AS accepted_rides
FROM mon_time m LEFT JOIN 
(SELECT IF(YEAR(join_date) < '2020',1, MONTH(join_date)) AS month_driver,
        COUNT(driver_id) AS num_driver
 FROM Drivers
 WHERE YEAR(join_date) <= '2020'
 GROUP BY IF(YEAR(join_date) < '2020',1, MONTH(join_date))
)A
ON A.month_driver = m.month
LEFT JOIN
(SELECT MONTH(requested_at) AS month_rides, COUNT(ride_id) AS num_rides
 FROM Rides
 WHERE ride_id IN (SELECT ride_id FROM AcceptedRides) AND YEAR(requested_at) = '2020'
 GROUP BY MONTH(requested_at)
)B
ON B.month_rides = m.month
GROUP BY m.month
ORDER BY m.month

