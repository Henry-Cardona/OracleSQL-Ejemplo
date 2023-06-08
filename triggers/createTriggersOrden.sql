
CREATE OR REPLACE TRIGGER TRG_UPD_ORDEN BEFORE
    UPDATE ON ORDEN FOR EACH ROW
DECLARE
    TOTAL_ORDEN DETALLE_ORDEN.SUBTOTAL%TYPE;
    PORCENTAJE_IVA PARAMETRO.VALOR%TYPE;
BEGIN
    --HENRY ROLANDO CARDONA VALLE CV19014
    IF :OLD.ACTIVA <> 0 THEN
        IF :NEW.ACTIVA IS NOT NULL AND :NEW.ACTIVA <> 1 THEN
            SELECT SUM(SUBTOTAL) INTO TOTAL_ORDEN FROM DETALLE_ORDEN WHERE ID_ORDEN = :OLD.ID_ORDEN;
            :NEW.TOTAL := TOTAL_ORDEN;
            SELECT VALOR INTO PORCENTAJE_IVA FROM PARAMETRO WHERE ID_PARAMETRO = 1;
            :NEW.IVA := PORCENTAJE_IVA*:NEW.TOTAL;
            FOR PRODUCTOS_ORDEN IN (
                SELECT * FROM DETALLE_ORDEN WHERE ID_ORDEN = :OLD.ID_ORDEN;
            ) LOOP
                UPDATE PRODUCTO SET INVENTARIO = INVENTARIO - PRODUCTOS_ORDEN.CANTIDAD
                WHERE ID_PRODUCTO = PRODUCTOS_ORDEN.ID_PRODUCTO;
            END LOOP;
        END IF;
    ELSIF :NEW.PROPINA IS NOT NULL AND ( :OLD.ID_ORDEN <> :NEW.ID_ORDEN
    OR :OLD.MESERO <> :NEW.MESERO
    OR :OLD.MESA <> :NEW.MESA
    OR :OLD.CLIENTE <> :NEW.CLIENTE
    OR :OLD.FECHA <> :NEW.FECHA
    OR :OLD.TOTAL <> :NEW.TOTAL
    OR :OLD.ACTIVA <> :NEW.ACTIVA
    OR :OLD.COMENTARIO <> :NEW.COMENTARIO
    OR :OLD.IVA <> :NEW.IVA ) THEN
        RAISE_APPLICATION_ERROR(-20001, 'LA ORDEN ESTA CERRADA Y NO PERMITE MODIFICACIONES.');
    ELSE
        RAISE_APPLICATION_ERROR(-20001, 'LA ORDEN ESTA CERRADA Y NO PERMITE MODIFICACIONES.');
    END IF;
END;