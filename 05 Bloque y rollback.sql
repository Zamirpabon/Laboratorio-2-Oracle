-- Hice una inserción dentro del bloque y luego la deshice. Al buscar el departamento después del ROLLBACK no apareció ninguna fila.
-- Son las instrucciones de la práctica que ya terminé. No ejecutar de nuevo en la base restaurada.

SET SERVEROUTPUT ON;
BEGIN
 DBMS_OUTPUT.PUT_LINE('Inicio de la prueba de transaccion');
 INSERT INTO departments2(department_id, department_name)
 VALUES (9901, 'Prueba de transaccion');
 DBMS_OUTPUT.PUT_LINE('Se inserto un departamento de prueba');
 ROLLBACK;
 DBMS_OUTPUT.PUT_LINE('Transaccion finalizada con ROLLBACK');
END;
/
SELECT department_id, department_name FROM departments2 WHERE department_id = 9901;
