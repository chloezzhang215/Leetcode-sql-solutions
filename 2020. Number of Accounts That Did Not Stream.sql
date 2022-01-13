--#2020. Number of Accounts That Did Not Stream
/*
Write an SQL query to report the number of accounts that bought a subscription in 2021 but did not have any stream session.

*/
SELECT COUNT(SUB.account_id) AS accounts_count
FROM Subscriptions SUB JOIN Streams S ON (SUB.account_id = S.account_id)
WHERE (YEAR(start_date) = 2021 OR YEAR(end_date) = 2021)
AND YEAR(stream_date) != 2021 
