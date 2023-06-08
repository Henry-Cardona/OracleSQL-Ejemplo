CREATE OR REPLACE PROCEDURE calcularmensual(MES_CALCULADO IN NUMBER) AS
    VALOR_ANIO NUMBER;
    VALOR_TOTAL_VENDIDO NUMBER;
    VALOR_TOTAL_CONTADO NUMBER;
BEGIN
    --Henry Rolando Cardona Valle CV19014
    SELECT EXTRACT(YEAR FROM SYSDATE) INTO VALOR_ANIO FROM DUAL;
    
    SELECT SUM(ORDEN.TOTAL) INTO VALOR_TOTAL_VENDIDO FROM ORDEN 
    WHERE EXTRACT(MONTH FROM ORDEN.FECHA) = MES_CALCULADO
    AND EXTRACT(YEAR FROM ORDEN.FECHA) = VALOR_ANIO
    AND ORDEN.ACTIVA = 0;
    
    SELECT COUNT(*) INTO VALOR_TOTAL_CONTADO FROM MENSUAL WHERE MES = MES_CALCULADO AND ANHO = VALOR_ANIO;
    
    IF VALOR_TOTAL_CONTADO > 0 THEN
        UPDATE MENSUAL SET TOTAL = VALOR_TOTAL_VENDIDO
        WHERE MES = MES_CALCULADO AND ANHO = VALOR_ANIO;
    ELSE
        INSERT INTO MENSUAL (MES, ANHO, TOTAL)
        VALUES (MES_CALCULADO, VALOR_ANIO, VALOR_TOTAL_VENDIDO);
    END IF;
    
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN ROLLBACK; 
    RAISE;
END;
