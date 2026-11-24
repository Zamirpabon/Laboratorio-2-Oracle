-- Al terminar revisé las restricciones, los índices y las cantidades de registros para comprobar cómo había quedado todo.

SELECT table_name, constraint_name, status, validated FROM user_constraints
WHERE (table_name IN ('EMPLOYEES', 'DEPARTMENTS')
OR (table_name = 'JOB_HISTORY' AND constraint_name IN ('JHIST_DEPT_FK', 'JHIST_EMP_FK')))
AND (status <> 'ENABLED' OR validated <> 'VALIDATED')
ORDER BY table_name, constraint_name;
SELECT table_name, index_name, uniqueness, status FROM user_indexes
WHERE index_name IN ('DEPT_ID_PK', 'EMP_EMP_ID_PK', 'EMP_EMAIL_UK')
ORDER BY table_name, index_name;
SELECT 'EMPLOYEES' AS tabla, COUNT(*) AS registros FROM employees UNION ALL
SELECT 'DEPARTMENTS', COUNT(*) FROM departments UNION ALL
SELECT 'JOB_HISTORY', COUNT(*) FROM job_history UNION ALL
SELECT 'DEPARTMENTS2', COUNT(*) FROM departments2;
