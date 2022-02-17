WITH recursive t(task_id, subtask_id) AS
    (
    SELECT task_id, subtasks_count FROM Tasks
    UNION ALL
    SELECT task_id, subtask_id - 1 FROM t WHERE subtask_id >= 2
    )

SELECT t.* FROM t LEFT JOIN Executed E ON t.task_id = E.task_id AND t.subtask_id = E.subtask_id
WHERE E.subtask_id IS NULL
