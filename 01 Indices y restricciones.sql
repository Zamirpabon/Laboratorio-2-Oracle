-- Primero miré los índices y las restricciones que tenían las dos tablas. También revisé las cantidades antes de cambiar algo.

SELECT USER AS usuario FROM dual;
SELECT i.table_name, i.index_name, i.uniqueness, c.column_name, c.column_position
FROM user_indexes i JOIN user_ind_columns c ON i.index_name=c.index_name AND i.table_name=c.table_name
WHERE i.table_name IN ('EMPLOYEES', 'DEPARTMENTS')
ORDER BY i.table_name, i.index_name, c.column_position;
SELECT table_name, constraint_name, constraint_type, status, validated
FROM user_constraints WHERE table_name IN ('EMPLOYEES', 'DEPARTMENTS')
ORDER BY table_name, constraint_name;
SELECT table_name, constraint_name, search_condition_vc AS condicion
FROM user_constraints WHERE table_name IN ('EMPLOYEES', 'DEPARTMENTS') AND constraint_type = 'C'
ORDER BY table_name, constraint_name;
SELECT 'EMPLOYEES' tabla, COUNT(*) registros FROM employees UNION ALL
SELECT 'DEPARTMENTS', COUNT(*) FROM departments UNION ALL
SELECT 'JOB_HISTORY', COUNT(*) FROM job_history;

-- Miré qué columnas controlaba cada restricción.
SELECT c.table_name, c.constraint_name, c.constraint_type,
       cc.column_name, c.status
FROM user_constraints c
JOIN user_cons_columns cc
    ON c.constraint_name = cc.constraint_name
   AND c.table_name = cc.table_name
WHERE c.table_name IN ('EMPLOYEES', 'DEPARTMENTS')
ORDER BY c.table_name, c.constraint_name, cc.position;

-- También revisé las relaciones con otras tablas.
SELECT fk.table_name AS tabla_hija,
       fk.constraint_name AS clave_foranea,
       pk.table_name AS tabla_referenciada,
       pk.constraint_name AS restriccion_referenciada,
       fk.status AS estado
FROM user_constraints fk
JOIN user_constraints pk
    ON fk.r_constraint_name = pk.constraint_name
WHERE fk.constraint_type = 'R'
  AND pk.table_name IN ('EMPLOYEES', 'DEPARTMENTS')
ORDER BY pk.table_name, fk.table_name, fk.constraint_name;
