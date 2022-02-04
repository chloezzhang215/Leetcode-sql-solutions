SELECT dept_salary.pay_month, department_id,
    (CASE WHEN avg_dep>avg_month THEN 'higher'
        WHEN avg_dep<avg_month THEN 'lower' ELSE 'same' END) AS comparison
FROM
(SELECT department_id,AVG(amount) AS avg_dep, DATE_FORMAT(pay_date,'%Y-%m') AS pay_month
FROM Salary s JOIN Employee e ON s.employee_id = e.employee_id
GROUP BY department_id, pay_month) AS dept_salary
JOIN
(SELECT AVG(amount) AS avg_month, DATE_FORMAT(pay_date,'%Y-%m') AS pay_month
FROM Salary GROUP BY pay_month) AS month_salary
ON dept_salary.pay_month = month_salary.pay_month
