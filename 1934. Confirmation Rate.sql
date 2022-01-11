--#1934. Confirmation Rate
/*
The confirmation rate of a user is the number of 'confirmed' messages divided by the total number of requested confirmation messages. 
The confirmation rate of a user that did not request any confirmation messages is 0. Round the confirmation rate to two decimal places.

Write an SQL query to find the confirmation rate of each user.
*/

SELECT S.user_id, IFNULL(ROUND(SUM(action = 'confirmed')/COUNT(C.action),2),0.00)
AS confirmation_rate 
FROM Signups S LEFT JOIN Confirmations C ON S.user_id = C.user_id
GROUP BY user_id
