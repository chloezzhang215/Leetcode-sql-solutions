SELECT dept_name, COUNT(student_id ) AS student_number
FROM Student a RIGHT JOIN Department b ON b.dept_id = a.dept_id 
GROUP BY dept_name
ORDER BY student_number DESC, dept_name
