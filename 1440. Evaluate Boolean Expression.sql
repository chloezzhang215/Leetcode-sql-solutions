SELECT E.*, (CASE WHEN operator = '>' AND V1.value > V2.value THEN 'true'
                 WHEN operator = '=' AND V1.value = V2.value THEN 'true'
                 WHEN operator = '<' AND V1.value < V2.value THEN 'true' ELSE 'false' END) AS value
FROM Expressions E LEFT JOIN Variables V1 ON E.left_operand = V1.name
                   LEFT JOIN Variables V2 ON E.right_operand = V2.name
