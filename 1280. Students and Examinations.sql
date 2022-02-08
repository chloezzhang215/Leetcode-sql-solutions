SELECT S.student_id, S.student_name, Subjects.subject_name, COUNT(E.subject_name) AS attended_exams
FROM Students S CROSS JOIN Subjects 
    LEFT JOIN Examinations E ON E.student_id = S.student_id AND Subjects.subject_name = E.subject_name
GROUP BY student_id, subject_name
ORDER BY student_id, subject_name
