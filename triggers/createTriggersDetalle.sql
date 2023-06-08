
----------------------------------------------------------------------------------------------------
-- Los siguientes TRIGGERS tienen la misma estructura debido a que validan el estado de la orden, --
-- si es igual a cero, nos indica que la orden esta cerrada o cobrada y ya no se deberían poder   --
-- agregar más productos a la orden, esto para los "INSERTS", para los "UPDATE" no debería dejar  --
-- cambiar el valor de la cantidad y en el caso del "DELETE" no debería dejar eliminar ningún     --
-- producto de la orden.                                                                          --
-- El valor del subtotal por producto se calcula en otro bloque de código.                        --
----------------------------------------------------------------------------------------------------

-- INSERT --

CREATE OR REPLACE TRIGGER TGR_INS_DETALLE_BEROFE BEFORE
    INSERT ON DETALLE_ORDEN FOR EACH ROW
DECLARE
    TOTAL_ORDEN ORDEN.TOTAL%TYPE;
    ORDEN_ACTIVA ORDEN.ACTIVA%TYPE;
BEGIN
    --HENRY ROLANDO CARDONA VALLE CV19014
    SELECT ACTIVA INTO ORDEN_ACTIVA FROM ORDEN WHERE ID_ORDEN = :NEW.ID_ORDEN;
    IF ORDEN_ACTIVA <> 0 THEN
        :NEW.SUBTOTAL := :NEW.CANTIDAD * :NEW.PRECIO_UNITARIO;
        SELECT SUM(SUBTOTAL) INTO TOTAL_ORDEN FROM DETALLE_ORDEN WHERE ID_ORDEN = :NEW.ID_ORDEN;
        UPDATE ORDEN SET TOTAL = (TOTAL_ORDEN + :NEW.PRECIO_UNITARIO) WHERE ID_ORDEN = :NEW.ID_ORDEN;
    ELSE
        RAISE_APPLICATION_ERROR(-20001, 'LA ORDEN ESTA CERRADA Y NO SE PERMITEN AGREGAR MÁS PRODUCTOS.');
    END IF;
END;

-- UPDATE --

CREATE OR REPLACE TRIGGER TGR_UPD_DETALLE_BEFORE BEFORE
    UPDATE ON DETALLE_ORDEN FOR EACH ROW 
DECLARE 
    ORDEN_ACTIVA ORDEN.ACTIVA%TYPE;
BEGIN
    SELECT ACTIVA INTO ORDEN_ACTIVA FROM ORDEN WHERE ID_ORDEN = :NEW.ID_ORDEN;
    IF ORDEN_ACTIVA <> 0 THEN
        :NEW.SUBTOTAL := :NEW.CANTIDAD * :NEW.PRECIO_UNITARIO;
    ELSE
        RAISE_APPLICATION_ERROR(-20001, 'LA ORDEN ESTA CERRADA Y NO SE PERMITEN MODIFICAR PRODUCTOS.');
    END IF;
END;

-- DELETE --

CREATE OR REPLACE TRIGGER TGR_DEL_DETALLE BEFORE
    DELETE ON DETALLE_ORDEN FOR EACH ROW 
DECLARE 
    ORDEN_ACTIVA ORDEN.ACTIVA%TYPE;
BEGIN
    SELECT ACTIVA INTO ORDEN_ACTIVA FROM ORDEN WHERE ID_ORDEN = :OLD.ID_ORDEN;
    IF ORDEN_ACTIVA <> 1 THEN
        RAISE_APPLICATION_ERROR(-20001, 'LA ORDEN ESTA CERRADA Y NO SE PERMITEN ELIMINAR PRODUCTOS.');
    END IF;
END;