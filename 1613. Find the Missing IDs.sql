# Write your MySQL query statement below
WITH t1 as (
    SELECT 1 as a
    UNION ALL SELECT 2
    UNION ALL SELECT 3
    UNION ALL SELECT 4
    UNION ALL SELECT 5
    UNION ALL SELECT 6
    UNION ALL SELECT 7
    UNION ALL SELECT 8
    UNION ALL SELECT 9
),
t2 as (
    SELECT 0 as b
    UNION ALL SELECT 1
    UNION ALL SELECT 2
    UNION ALL SELECT 3
    UNION ALL SELECT 4
    UNION ALL SELECT 5
    UNION ALL SELECT 6
    UNION ALL SELECT 7
    UNION ALL SELECT 8
    UNION ALL SELECT 9
),
t3 as (
    SELECT 10*a + 1*b as NUMBERS FROM t1, t2
    UNION ALL SELECT 100
    UNION ALL SELECT a FROM t1
)

SELECT NUMBERS AS 'ids' FROM t3
WHERE NUMBERS < (SELECT MAX(customer_id) FROM Customers)
AND NUMBERS NOT IN (SELECT customer_id FROM Customers)
ORDER BY NUMBERS

