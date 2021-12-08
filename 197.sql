

SELECT a.id 
FROM Weather a CROSS JOIN Weather b ON datediff(a.recordDate,b.recordDate)=1
WHERE a.Temperature>b.Temperature
