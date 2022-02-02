--#1179. Reformat Department Table
/*
Write an SQL query to reformat the table such that there is a department id column and a revenue column for each month.

*/
SELECT id, sum(CASE month WHEN 'Jan' THEN revenue ELSE NULL END) as Jan_Revenue,
            sum(CASE month WHEN 'Feb' THEN revenue ELSE NULL END) as Feb_Revenue,
            sum(CASE month WHEN 'Mar' THEN revenue ELSE NULL END) as Mar_Revenue,
            sum(CASE month WHEN 'Apr' THEN revenue ELSE NULL END) as Apr_Revenue,
            sum(CASE month WHEN 'May' THEN revenue ELSE NULL END) as May_Revenue,
            sum(CASE month WHEN 'Jun' THEN revenue ELSE NULL END) as Jun_Revenue,
            sum(CASE month WHEN 'Jul' THEN revenue ELSE NULL END) as Jul_Revenue,
            sum(CASE month WHEN 'Aug' THEN revenue ELSE NULL END) as Aug_Revenue,
            sum(CASE month WHEN 'Sep' THEN revenue ELSE NULL END) as Sep_Revenue,
            sum(CASE month WHEN 'Oct' THEN revenue ELSE NULL END) as Oct_Revenue,
            sum(CASE month WHEN 'Nov' THEN revenue ELSE NULL END) as Nov_Revenue,
            sum(CASE month WHEN 'Dec' THEN revenue ELSE NULL END) as Dec_Revenue
FROM Department
GROUP BY id
