-- Para volver a activar todo empecé por las claves primarias. Después activé las demás condiciones y dejé las claves foráneas para el final.
-- Son las instrucciones de la práctica que ya terminé. No ejecutar de nuevo en la base restaurada.

ALTER TABLE departments
ENABLE VALIDATE CONSTRAINT dept_id_pk;
ALTER TABLE employees
ENABLE VALIDATE CONSTRAINT emp_emp_id_pk;
ALTER TABLE departments
ENABLE VALIDATE CONSTRAINT dept_name_nn;
ALTER TABLE employees
ENABLE VALIDATE CONSTRAINT emp_email_uk;
ALTER TABLE employees
ENABLE VALIDATE CONSTRAINT emp_email_nn;
ALTER TABLE employees
ENABLE VALIDATE CONSTRAINT emp_hire_date_nn;
ALTER TABLE employees
ENABLE VALIDATE CONSTRAINT emp_job_nn;
ALTER TABLE employees
ENABLE VALIDATE CONSTRAINT emp_last_name_nn;
ALTER TABLE employees
ENABLE VALIDATE CONSTRAINT emp_salary_min;
ALTER TABLE departments
ENABLE VALIDATE CONSTRAINT dept_loc_fk;
ALTER TABLE employees
ENABLE VALIDATE CONSTRAINT emp_job_fk;
ALTER TABLE departments
ENABLE VALIDATE CONSTRAINT dept_mgr_fk;
ALTER TABLE employees
ENABLE VALIDATE CONSTRAINT emp_dept_fk;
ALTER TABLE employees
ENABLE VALIDATE CONSTRAINT emp_manager_fk;
ALTER TABLE job_history
ENABLE VALIDATE CONSTRAINT jhist_dept_fk;
ALTER TABLE job_history
ENABLE VALIDATE CONSTRAINT jhist_emp_fk;
