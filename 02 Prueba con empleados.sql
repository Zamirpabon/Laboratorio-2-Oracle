-- Quería ver qué pasaba si intentaba guardar un empleado con salario negativo. El primer INSERT dio ORA-02290. Después lo repetí con la restricción desactivada.
-- Son las instrucciones de la práctica que ya terminé. No ejecutar de nuevo en la base restaurada.

INSERT INTO employees(employee_id, first_name, last_name, email, hire_date, job_id, salary)
VALUES (999991, 'Prueba', 'Oracle', 'PRUEBA_ZAMIR', SYSDATE, 'IT_PROG', -100);
ALTER TABLE employees
DISABLE CONSTRAINT emp_salary_min;
SELECT constraint_name, status FROM user_constraints WHERE constraint_name = 'EMP_SALARY_MIN';
-- Ahora repetí la misma inserción. Esta vez sí funcionó.
INSERT INTO employees(employee_id, first_name, last_name, email, hire_date, job_id, salary)
VALUES (999991, 'Prueba', 'Oracle', 'PRUEBA_ZAMIR', SYSDATE, 'IT_PROG', -100);
SELECT employee_id, first_name, last_name, salary FROM employees WHERE employee_id = 999991;
ROLLBACK;
SELECT employee_id, first_name, last_name, salary FROM employees WHERE employee_id = 999991;
ALTER TABLE employees
ENABLE VALIDATE CONSTRAINT emp_salary_min;

-- Comprobé que volvió a quedar activa.
SELECT constraint_name, status, validated
FROM user_constraints
WHERE constraint_name = 'EMP_SALARY_MIN';
