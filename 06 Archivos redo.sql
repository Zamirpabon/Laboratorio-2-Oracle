-- Primero probé la consulta con HR y salió ORA-00942. Después entré con SYSTEM y pude ver que XE estaba en NOARCHIVELOG.

-- Esta fue la consulta que probé con HR:
-- SELECT LOG_MODE FROM V$DATABASE;
-- Estas dos consultas las hice desde SYSTEM.
SELECT NAME, LOG_MODE FROM V$DATABASE;
SELECT GROUP#, SEQUENCE#, STATUS, ARCHIVED, ROUND(BYTES/1024/1024, 2) TAMANO_MB
FROM V$LOG ORDER BY GROUP#;
