--#601. Human Traffic of Stadium
/*
Write an SQL query to display the records with three or more rows with consecutive id's, and the number of people is greater than or equal to 100 for each.

*/
SELECT id, visit_date, people FROM
(SELECT *,COUNT(*)over(partition by sequence) AS cnt FROM
(SELECT *,id-row_number()over(order by id) AS sequence FROM Stadium
WHERE people >= 100)A)B
WHERE cnt>2
