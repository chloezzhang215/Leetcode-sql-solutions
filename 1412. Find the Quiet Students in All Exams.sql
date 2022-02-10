SELECT DISTINCT E.student_id, S.student_name
FROM Exam E LEFT JOIN Student S ON E.student_id = S.student_id
WHERE E.student_id NOT IN
(SELECT student_id FROM Exam WHERE(exam_id,score) IN
(SELECT exam_id,MAX(score) FROM Exam GROUP BY exam_id
UNION ALL
SELECT exam_id,MIN(score) FROM Exam GROUP BY exam_id))
ORDER BY E.student_id
