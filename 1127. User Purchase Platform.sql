SELECT spend_date, B.platform,
    SUM(IF(A.platform = B.platform,amount,0)) AS total_amount,
    COUNT(IF(A.platform = B.platform,1,NULL)) AS total_users
FROM
(SELECT spend_date, user_id, 
    IF(COUNT(DISTINCT platform) = 2, 'both', platform) AS platform,
    SUM(amount) AS amount
FROM Spending
GROUP BY user_id,spend_date)A,
(SELECT 'desktop' AS platform UNION
 SELECT 'mobile' AS platform UNION
 SELECT 'both' AS platform)B
GROUP BY spend_date, platform
