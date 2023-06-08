
--  La función del parámetro "CACHE" es reducir la sobrecarga de E/S al generar valores de secuencia,
--  especialmente en entornos de alto rendimiento donde hay múltiples transacciones concurrentes. Al almacenar
--  en memoria un número determinado de valores de secuencia, se evita la necesidad de acceder al disco para cada
--  valor de secuencia individual, lo que mejora el rendimiento general del sistema.

CREATE SEQUENCE ORDEN_SEQ MINVALUE 1 MAXVALUE 9223372036854775807 START WITH 1 INCREMENT BY 1 CACHE 10;
CREATE SEQUENCE PRODUCTO_SEQ MINVALUE 1 MAXVALUE 9223372036854775807 START WITH 1 INCREMENT BY 1 CACHE 10;
CREATE SEQUENCE CATEGORIA_SEQ MINVALUE 1 MAXVALUE 9223372036854775807 START WITH 1 INCREMENT BY 1 CACHE 10;
