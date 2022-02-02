SELECT DISTINCT question_id AS survey_log FROM
(SELECT question_id, COUNT(question_id) AS show_time, COUNT(answer_id) AS ans_time
FROM SurveyLog
GROUP BY question_id) t1
ORDER BY ans_time/show_time DESC LIMIT 1
