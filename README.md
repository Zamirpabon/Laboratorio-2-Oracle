# Índices y restricciones en Oracle

Bases de Datos Avanzadas - Tema 8

Aquí dejé los SQL de la práctica, separados según lo que fui haciendo en Oracle. Primero revisé los índices y las restricciones, después probé qué pasaba al insertar datos incorrectos. También hice una copia de DEPARTMENTS para mirar qué ocurría al cerrar la sesión y al usar ROLLBACK. Al final revisé los archivos Redo.

Dejé las 16 restricciones activas y validadas. Los tres índices únicos seguían válidos y las cantidades de registros quedaron como antes: 107 empleados, 27 departamentos y 10 registros en JOB_HISTORY. DEPARTMENTS2 quedó con 27 filas.

**Nota:** estos archivos son el código de la práctica que ya realicé. No hace falta volver a ejecutar las inserciones ni los cambios de restricciones. Las pruebas se hicieron por partes, en el esquema HR, y las consultas de Redo se hicieron con SYSTEM (el primer intento con HR dio un error de permisos).
