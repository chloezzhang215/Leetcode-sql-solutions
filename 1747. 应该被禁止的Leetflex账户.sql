--#1747. 应该被禁止的Leetflex账户
/*
Write an SQL query to find the account_id of the accounts that should be banned from Leetflex. 
An account should be banned if it was logged in at some moment from two different IP addresses.

*/

SELECT DISTINCT l1.account_id 
FROM LogInfo l1 LEFT JOIN LogInfo l2 ON (l1.account_id = l2.account_id
AND l1.ip_address != l2.ip_address)
WHERE l1.logout BETWEEN l2.login AND l2.logout 
