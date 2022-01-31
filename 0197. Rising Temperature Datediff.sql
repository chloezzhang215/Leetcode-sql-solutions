--#197. The Rising Temperature
/*
Write an SQL query to 来查找与之前（昨天的）日期相比温度更高的所有日期的id

*/
SELECT a.id 
FROM Weather a JOIN Weather b 
ON datediff(a.recordDate, b.recordDate) = 1
WHERE a.temperature > b.temperature
