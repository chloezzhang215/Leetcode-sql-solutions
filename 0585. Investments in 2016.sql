SELECT ROUND(SUM(tiv_2016),2) AS tiv_2016 
FROM 
(
    SELECT *,
    COUNT(*)over(partition by tiv_2015) AS cnt_1,
    COUNT(*)over(partition by lat,lon) AS cnt_2 FROM Insurance
)A
WHERE cnt_1 > 1 AND cnt_2 < 2
