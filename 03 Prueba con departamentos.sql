-- Probé con una ubicación que no existía. El primer INSERT dio ORA-02291 y, al quitar la restricción, Oracle sí lo aceptó.
-- Son las instrucciones de la práctica que ya terminé. No ejecutar de nuevo en la base restaurada.

SELECT (SELECT COUNT(*) FROM departments WHERE department_id = 9900) departamento_existe,
       (SELECT COUNT(*) FROM locations WHERE location_id = 9999) ubicacion_existe FROM dual;
INSERT INTO departments(department_id, department_name, location_id)
VALUES (9900, 'Departamento Prueba', 9999);
ALTER TABLE departments
DISABLE CONSTRAINT dept_loc_fk;

SELECT constraint_name, status
FROM user_constraints
WHERE constraint_name = 'DEPT_LOC_FK';
INSERT INTO departments(department_id, department_name, location_id)
VALUES (9900, 'Departamento Prueba', 9999);
SELECT department_id, department_name, location_id FROM departments WHERE department_id = 9900;
ROLLBACK;
SELECT department_id, department_name, location_id FROM departments WHERE department_id = 9900;
ALTER TABLE departments
ENABLE VALIDATE CONSTRAINT dept_loc_fk;

-- Comprobé que volvió a quedar activa.
SELECT constraint_name, status, validated
FROM user_constraints
WHERE constraint_name = 'DEPT_LOC_FK';
