ALTER TABLE DETALLE_ORDEN ADD CONSTRAINT FK_DETALLE_ORDEN_ORDEN FOREIGN KEY (ID_ORDEN) REFERENCES ORDEN (ID_ORDEN);

ALTER TABLE DETALLE_ORDEN ADD CONSTRAINT FK_DETALLE_ORDEN_PRODUCTO FOREIGN KEY (ID_PRODUCTO) REFERENCES PRODUCTO (ID_PRODUCTO);