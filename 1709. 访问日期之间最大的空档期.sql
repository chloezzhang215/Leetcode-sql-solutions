--#1709. 访问日期之间最大的空档期
/*
Write an SQL query that will, for each user_id, find out the largest window of days between each visit and the one right after it 
(or today if you are considering the last visit).
*/

/*
窗口函数lead() over() 注意lead/lag这两个窗口函数，里面本身有三个参数 lead/lag ( field(选择的字段),num(偏移的个数),default(默认值，即无数据时的填充值)
*/

SELECT user_id, MAX(windows) AS biggest_window
FROM(SELECT user_id, datediff(lead(visit_date, 1, "2021-01-01") over(partition by user_id order by visit_date), visit_date) AS windows FROM UserVisits) temp
/*
先用lead窗口函数计算下一个日期，然后用datediff两个日期相减
*/
GROUP BY user_id
