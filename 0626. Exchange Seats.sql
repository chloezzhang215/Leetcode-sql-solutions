# Write your MySQL query statement below
SELECT (CASE WHEN mod(id,2) != 0 AND id != cnt THEN id+1
            WHEN mod(id,2) != 0 AND id = cnt THEN id ELSE
            id-1 END) AS id, student
FROM Seat, (SELECT COUNT(*) AS cnt FROM Seat)A
ORDER BY id
