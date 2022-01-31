--#262. Trips and Users
/*
Write a SQL query to find the cancellation rate of requests with unbanned users (both client and driver must not be banned) each day between "2013-10-01" and "2013-10-03". Round Cancellation Rate to two decimal points.

*/
SELECT request_at AS Day, ROUND(avg(Status!='completed'), 2) AS 'Cancellation Rate'
FROM Trips t JOIN Users u1 ON (t.client_id = u1.users_id AND u1.banned = 'No')
    JOIN Users u2 ON (t.driver_id = u2.users_id AND u2.banned = 'No')
WHERE	
    request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY 
    request_at
