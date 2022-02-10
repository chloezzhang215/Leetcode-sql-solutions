SELECT DISTINCT A.*
FROM Accounts A
JOIN logins L1 USING(id)
JOIN Logins L2 ON L1.id=L2.id AND DATEDIFF(L2.login_date,L1.login_date) BETWEEN 0 AND 4  
GROUP BY A.id,A.name,L1.login_date
HAVING COUNT(DISTINCT L2.login_date)=5
