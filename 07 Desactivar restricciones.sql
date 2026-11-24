-- Antes de desactivar las claves primarias tuve que quitar las relaciones que dependían de ellas. Usé KEEP INDEX para no perder los índices únicos.
-- Son las instrucciones de la práctica que ya terminé. No ejecutar de nuevo en la base restaurada.

ALTER TABLE job_history
DISABLE CONSTRAINT jhist_dept_fk;
ALTER TABLE job_history
DISABLE CONSTRAINT jhist_emp_fk;
ALTER TABLE employees
DISABLE CONSTRAINT emp_dept_fk;
ALTER TABLE departments
DISABLE CONSTRAINT dept_mgr_fk;
ALTER TABLE employees
DISABLE CONSTRAINT emp_manager_fk;
-- Aquí conservé los índices de las claves.
ALTER TABLE departments
DISABLE PRIMARY KEY KEEP INDEX;
ALTER TABLE employees
DISABLE PRIMARY KEY KEEP INDEX;
ALTER TABLE employees
DISABLE UNIQUE (email) KEEP INDEX;
-- Me faltaban estas relaciones y condiciones.
ALTER TABLE departments
DISABLE CONSTRAINT dept_loc_fk;
ALTER TABLE employees
DISABLE CONSTRAINT emp_job_fk;
ALTER TABLE departments
DISABLE CONSTRAINT dept_name_nn;
ALTER TABLE employees
DISABLE CONSTRAINT emp_email_nn;
ALTER TABLE employees
DISABLE CONSTRAINT emp_hire_date_nn;
ALTER TABLE employees
DISABLE CONSTRAINT emp_job_nn;
ALTER TABLE employees
DISABLE CONSTRAINT emp_last_name_nn;
ALTER TABLE employees
DISABLE CONSTRAINT emp_salary_min;

-- Al terminar de desactivarlas me aparecieron las 16 filas.
SELECT table_name, constraint_name, constraint_type, status, validated
FROM user_constraints
WHERE (table_name IN ('EMPLOYEES', 'DEPARTMENTS')
   OR (table_name = 'JOB_HISTORY'
       AND constraint_name IN ('JHIST_DEPT_FK', 'JHIST_EMP_FK')))
  AND (status <> 'ENABLED' OR validated <> 'VALIDATED')
ORDER BY table_name, constraint_name;
