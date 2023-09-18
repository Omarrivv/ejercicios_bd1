/* Crear base de datos dbGamarraMarket */
DROP DATABASE IF EXISTS dbGamarraMarket; 
CREATE DATABASE dbGamarraMarket
DEFAULT CHARACTER SET utf8;
/* Poner en uso la base de datos dbGamarraMarket */
USE dbGamarraMarket;
/* Crear la tabla CLIENTE */
CREATE TABLE CLIENTE
(
    id int auto_increment,
    tipo_documento char(3),
    numero_documento char(9),
    nombres varchar(60),
    apellidos varchar(90),
    email varchar(80),
    celular char(9),
    fecha_nacimiento date,
    activo bool default(1),
    CONSTRAINT cliente_pk PRIMARY KEY (id)
);
/* Listar estructura de tabla CLIENTE */
SHOW COLUMNS IN CLIENTE;
/* Listar tablas existentes en la base de datos en uso */
SHOW TABLES;
/* Crear la tabla VENTA */
CREATE TABLE VENTA
(
    id int auto_increment,
    fecha_hora timestamp,
    activo bool default(1),    
    CONSTRAINT venta_pk PRIMARY KEY (id)
);
/* Crear la tabla VENTA_DETALLE */
CREATE TABLE VENTA_DETALLE
(
    id int auto_increment,
    cantidad int,
    CONSTRAINT venta_detalle_pk PRIMARY KEY (id)
);
/* Crear la tabla VENDEDOR */
CREATE TABLE VENDEDOR
(
    id int auto_increment,
    tipo_documento char(3),
    numero_documento char(15),
    nombres varchar(60),
    apellidos varchar(90),
    salario decimal(8,2),
    celular char(9),
    email varchar(80),
    activo bool default(1),
    CONSTRAINT vendedor_pk PRIMARY KEY (id)
);
/* Crear la tabla PRENDA */
CREATE TABLE PRENDA
(
    id int auto_increment,
    descripcion varchar(90),
    marca varchar(60),
    cantidad int,
    talla varchar(10),
    precio decimal(8,2),
    activo bool default(1),
    CONSTRAINT prenda_pk PRIMARY KEY (id)
);
/* Listar estructura de tabla CLIENTE */
SHOW COLUMNS IN CLIENTE;
SHOW COLUMNS IN VENTA;
SHOW COLUMNS IN VENTA_DETALLE;
SHOW COLUMNS IN VENDEDOR;
SHOW COLUMNS IN PRENDA;
/* Listar tablas existentes en la base de datos en uso */
SHOW TABLES;
ALTER TABLE VENTA
ADD COLUMN cliente_id int;
/* Crear relación VENTA_CLIENTE */
ALTER TABLE VENTA
	ADD CONSTRAINT CLIENTE_VENTA FOREIGN KEY (cliente_id)
    REFERENCES CLIENTE (id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
;
/* Listar relaciones de tablas de la base de datos activa */
SELECT 
    i.constraint_name, k.table_name, k.column_name, 
    k.referenced_table_name, k.referenced_column_name
FROM 
    information_schema.TABLE_CONSTRAINTS i 
LEFT JOIN information_schema.KEY_COLUMN_USAGE k 
ON i.CONSTRAINT_NAME = k.CONSTRAINT_NAME 
WHERE i.CONSTRAINT_TYPE = 'FOREIGN KEY' 
AND i.TABLE_SCHEMA = DATABASE();

ALTER TABLE VENTA
ADD COLUMN vendedor_id int;

/* Crear relación VENTA_CLIENTE */
ALTER TABLE VENTA
	ADD CONSTRAINT VENDEDOR_VENTA FOREIGN KEY (vendedor_id)
    REFERENCES VENDEDOR (id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
;

ALTER TABLE VENTA_DETALLE
ADD COLUMN venta_id int;

/* Crear relación VENTA_CLIENTE */
ALTER TABLE VENTA_DETALLE
	ADD CONSTRAINT VENTA_VENTA_DETALLE FOREIGN KEY (venta_id)
    REFERENCES VENTA (id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
;

/* Listar relaciones de tablas de la base de datos activa */
SELECT 
    i.constraint_name, k.table_name, k.column_name, 
    k.referenced_table_name, k.referenced_column_name
FROM 
    information_schema.TABLE_CONSTRAINTS i 
LEFT JOIN information_schema.KEY_COLUMN_USAGE k 
ON i.CONSTRAINT_NAME = k.CONSTRAINT_NAME 
WHERE i.CONSTRAINT_TYPE = 'FOREIGN KEY' 
AND i.TABLE_SCHEMA = DATABASE();

ALTER TABLE VENTA_DETALLE
ADD COLUMN prenda_id int;

/* Crear relación VENTA_CLIENTE */
ALTER TABLE VENTA_DETALLE
	ADD CONSTRAINT VENTA_DETALLE_PRENDA FOREIGN KEY (prenda_id)
    REFERENCES PRENDA (id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
;

/* Listar relaciones de tablas de la base de datos activa */
SELECT 
    i.constraint_name, k.table_name, k.column_name, 
    k.referenced_table_name, k.referenced_column_name
FROM 
    information_schema.TABLE_CONSTRAINTS i 
LEFT JOIN information_schema.KEY_COLUMN_USAGE k 
ON i.CONSTRAINT_NAME = k.CONSTRAINT_NAME 
WHERE i.CONSTRAINT_TYPE = 'FOREIGN KEY' 
AND i.TABLE_SCHEMA = DATABASE();

/* Listar estructura de la tabla */
SHOW COLUMNS IN CLIENTE;
SHOW COLUMNS IN VENTA;
SHOW COLUMNS IN VENTA_DETALLE;
SHOW COLUMNS IN VENDEDOR;
SHOW COLUMNS IN PRENDA;

/* Listar tablas existentes en la base de datos en uso */
show tables;
