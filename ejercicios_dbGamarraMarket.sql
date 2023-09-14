/* Crear base de datos dbGamarraMarket */
DROP DATABASE IF EXISTS dbGamarraMarket; -- esta linea verifica si ya existe una base de datos llamada dbGamarraMarket y si existe la sentencia DROP DATABASE la eliminara
CREATE DATABASE dbGamarraMarket -- esta linea crea una nueva base de datos llamada dbGamarraMarket
DEFAULT CHARACTER SET utf8; -- especificamos que la base de datos utilizara ekl juego de caracteres UTF-8 como conjunto de caracteres preterminados UTF-8 es una codificacion de caracteres de diferentes idiomas
USE dbGamarraMarket;
/*Crear la tabla cliente*/
CREATE TABLE CLIENTE
(
	id int,
    tipo_documento char(3),
    numero_documento char(9),
    nombres varchar(60),
    apellidos varchar(90),
    email varchar(80),
    celular char(9),
    fecha_nacimiento date,
    activo bool,
    CONSTRAINT cliente_pk PRIMARY KEY (id)
);
/* Listar estructura de tabla CLIENTE */
SHOW COLUMNS IN CLIENTE;
/* Listar tablas existentes en la base de datos en uso */
SHOW TABLES;
/* Agregar columna estado civil */
ALTER TABLE CLIENTE
	ADD COLUMN fecha_nacimiento date;
/* Eliminar columna fecha_nacimiento */
ALTER TABLE CLIENTE
	DROP COLUMN estado_civil;
/* Eliminar la tabla CLIENTE */
DROP TABLE CLIENTE;
SHOW COLUMNS IN CLIENTE;

CREATE TABLE VENTA
(
	id int,
    fecha_hora timestamp,
    activo bool,
    CONSTRAINT cliente_pk PRIMARY KEY (id)
);

SHOW COLUMNS IN VENTA;
SHOW TABLES;

/* Crear relación VENTA_CLIENTE */
ALTER TABLE VENTA
	ADD CONSTRAINT VENTA_CLIENTE FOREIGN KEY (cliente_id)
    REFERENCES CLIENTE (id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
;

ALTER TABLE VENTA
	ADD COLUMN cliente_id int;

ALTER TABLE VENTA
	ADD COLUMN vendedor_id int;


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

/* Eliminar la relación VENTA_CLIENTE */
ALTER TABLE VENTA
	DROP CONSTRAINT VENTA_CLIENTE;

create table VENDEDOR
(
id int,
tipo_documento char(3),
numero_documento char(15),
nombres varchar(60),
apellidos varchar(90),
salario decimal(8,2),
celular char(9),
email varchar(80),
activo bool,
constraint vendedor_pk primary key(id)
);

create table VENTA_DETALLE
(
	id int,
	cantidad int,
	constraint venta_detalle_pk primary key(id),
    venta_id int,
    prenda_id int
);
create table PRENDA 
(
	id int,
	descripcion varchar(90),
	marca varchar(60),
	cantidad int,
	talla varchar(10),
	precio decimal(8,2),
	activo bool,
	constraint prenda_pk primary key(id)
);

SHOW COLUMNS IN PRENDA;

ALTER TABLE VENTA
	ADD CONSTRAINT VENDEDOR_VENTA FOREIGN KEY (vendedor_id)
    REFERENCES VENDEDOR (id)
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
	ADD CONSTRAINT PRENDA_VENTA_DETALLE FOREIGN KEY (prenda_id)
    REFERENCES PRENDA (id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
;


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
	ADD CONSTRAINT  FOREIGN KEY (venta_id)
    REFERENCES VENTA (id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
;
-- comentario
