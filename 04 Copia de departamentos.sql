-- Hice una copia de DEPARTMENTS. Tenía 27 filas y después agregué tres más. La creación está anotada abajo porque la tabla ya existe.
-- Son las instrucciones de la práctica que ya terminé. No ejecutar de nuevo en la base restaurada.

-- Así creé la tabla al principio (ya existe):
-- CREATE TABLE departments2 AS SELECT * FROM departments;
SELECT COUNT(*) total_registros FROM departments2;
INSERT ALL
 INTO departments2(department_id, department_name) VALUES (9901, 'Departamento Prueba 1')
 INTO departments2(department_id, department_name) VALUES (9902, 'Departamento Prueba 2')
 INTO departments2(department_id, department_name) VALUES (9903, 'Departamento Prueba 3')
SELECT 1 FROM dual;
SELECT department_id, department_name FROM departments2
WHERE department_id IN (9901, 9902, 9903) ORDER BY department_id;
SELECT COUNT(*) total_registros FROM departments2;
-- Aquí cerré la conexión HR eligiendo deshacer los cambios.
-- Las siguientes consultas las hice después de volver a entrar.
SELECT COUNT(*) total_registros FROM departments2;
SELECT department_id, department_name FROM departments2
WHERE department_id IN (9901, 9902, 9903) ORDER BY department_id;
