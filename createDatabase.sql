
--  La sentencia "CREATE TABLE" se utiliza en SQL para crear una nueva tabla en una
--  base de datos relacional.
--  En esta sintaxis, se especifica el nombre de la nueva tabla que se va a crear y
--  se enumeran las columnas que compondrán la tabla, junto con el tipo de datos de
--  cada columna. Además, se pueden especificar restricciones en cada columna,
--  como NOT NULL, UNIQUE, PRIMARY KEY, FOREIGN KEY, entre otras.

CREATE TABLE ORDEN (
    ID_ORDEN NUMBER(8, 0) NOT NULL,
    MESERO VARCHAR2(100),
    MESA VARCHAR2(100),
    CLIENTE VARCHAR2(100),
    FECHA DATE,
    TOTAL NUMBER(10, 4),
    ACTIVA NUMBER(1, 0),
    COMENTARIO VARCHAR2(350),
    IVA NUMBER(10, 4),
    PROPINA NUMBER(10, 4),
    CONSTRAINT ORDEN_PK PRIMARY KEY (ID_ORDEN)
);

--  En Oracle, una clave compuesta, también conocida como clave primaria compuesta
--  es una clave primaria que está compuesta por dos o más columnas de una tabla.
--  Para definir una clave compuesta en Oracle, se utiliza la cláusula "PRIMARY KEY"
--  junto con los nombres de las columnas que forman la clave compuesta, separados por comas

CREATE TABLE DETALLE_ORDEN (
    ID_ORDEN NUMBER(8, 0) NOT NULL,
    ID_PRODUCTO NUMBER(8, 0) NOT NULL,
    CANTIDAD NUMBER(8, 2),
    PRECIO_UNITARIO NUMBER(8, 4),
    SUBTOTAL NUMBER(8, 4)
);

CREATE TABLE PRODUCTO (
    ID_PRODUCTO NUMBER(8, 0) NOT NULL,
    ID_CATEGORIA NUMBER(8, 0),
    NOMBRE VARCHAR2(200),
    PRECIO NUMBER(10, 4),
    AREA VARCHAR2(1),
    INVENTARIO NUMBER(8, 1),
    CONSTRAINT PRODUCTO_PK PRIMARY KEY (ID_PRODUCTO)
);

CREATE TABLE CATEGORIA (
    ID_CATEGORIA NUMBER(8, 0) NOT NULL,
    NOMBRE VARCHAR2(200),
    CONSTRAINT CATEGORIA_PK PRIMARY KEY (ID_CATEGORIA)
);

CREATE TABLE PARAMETRO (
    ID_PARAMETRO NUMBER(8, 0) NOT NULL,
    NOMBRE VARCHAR2(100),
    VALOR VARCHAR2(400),
    CONSTRAINT PARAMETRO_PK PRIMARY KEY (ID_PARAMETRO)
);

INSERT INTO PARAMETRO (ID_PARAMETRO, NOMBRE, VALOR) VALUES (1, 'IVA', 0.13);
INSERT INTO PARAMETRO (ID_PARAMETRO, NOMBRE, VALOR) VALUES (2, 'PROPINA', 0.10);

CREATE TABLE MENSUAL (
    ANHO NUMBER(4, 0) NOT NULL,
    MES NUMBER(2, 0) NOT NULL,
    TOTAL NUMBER(10, 4),
    CONSTRAINT MENSUAL_PK PRIMARY KEY (ANHO, MES)
);