--#1783. 大满贯数量
/*
Write an SQL query to report the number of grand slam tournaments won by each player. Do not include the players who did not win any tournament.

*/

/*
窗口函数lead() over() 注意lead/lag这两个窗口函数，里面本身有三个参数 lead/lag ( field(选择的字段),num(偏移的个数),default(默认值，即无数据时的填充值)
*/
