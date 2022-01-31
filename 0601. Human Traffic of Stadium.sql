--#601. Human Traffic of Stadium
/*
Write an SQL query to display the records with three or more rows with consecutive id's, and the number of people is greater than or equal to 100 for each.

*/
SELECT id, visit_date, people FROM
(SELECT *, COUNT(*)over(partition by ranking) AS cnt FROM
(SELECT *, id - row_number()over(order by id) AS ranking FROM Stadium WHERE people>=100)a)b
WHERE cnt>=3
ORDER BY visit_date
