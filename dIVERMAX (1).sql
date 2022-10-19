use master
go


DROP DATABASE if EXISTS Divermax;
GO


CREATE DATABASE Divermax
GO

USE Divermax
GO

--CREAMOS LAS TABLAS

DROP TABLE if EXISTS CLIENTE;
create table CLIENTE
(	
	IDCLI INT IDENTITY(1,1),
	NOMCLI VARCHAR(80),
	APECLI VARCHAR(80),
	EMACLI VARCHAR(80),
	DNICLI CHAR(8),
	CELCLI CHAR(9),
	ESTCLI CHAR(1) DEFAULT 'A',
	CONSTRAINT IDCLI_PK PRIMARY KEY (IDCLI) -- Definiendo clave principal

)
GO

DROP TABLE if EXISTS EMPLEADO;
CREATE TABLE EMPLEADO
( 
	IDEMP INT IDENTITY(1,1),
	NOMEMP VARCHAR(80),
	APEEMP VARCHAR(80),
	DNIEMP CHAR(8),
	EMAEMP VARCHAR(80),
	CELEMP CHAR(9),
	ESTEMP CHAR(1) DEFAULT 'A',
	CONSTRAINT IDEMP_PK PRIMARY KEY (IDEMP) -- Definiendo clave principal
)
GO

DROP TABLE if EXISTS ACTIVIDAD;
create table ACTIVIDAD
(
	IDACT INT IDENTITY(1,1),
	NOMACT VARCHAR(80),
	PREACT DECIMAL(8,2),
	DESPAQ VARCHAR(300),
	ESTACT CHAR(1) DEFAULT 'A',
	CONSTRAINT CODACT_PK PRIMARY KEY (IDACT) -- Definiendo clave principal
)
GO

DROP TABLE if EXISTS PAQUETE;
create table PAQUETE
(
	CODPAQ INT IDENTITY(1,1),
	NOMPAQ VARCHAR(80),
	PREPAQ DECIMAL(8,2),
	DESPAQ VARCHAR(300),
	ESTPAQ CHAR(1) DEFAULT 'A',
	CONSTRAINT CODPAQ_PK PRIMARY KEY (CODPAQ) -- Definiendo clave principal
)
GO

DROP TABLE if EXISTS PAQUETE_DETALLE;
create table PAQUETE_DETALLE
(
	IDPAQDET INT  IDENTITY(1,1),
	CODPAQ INT,
	IDACT INT,
	CONSTRAINT IDPAQDET_PK PRIMARY KEY (IDPAQDET) -- Definiendo clave principal
)
GO

DROP TABLE if EXISTS RESERVA;
create table RESERVA
( 
	IDRES INT IDENTITY(1,1),
	FECRES DATETIME DEFAULT GETDATE(), 
	FECPASRES DATE,
	IDCLI INT,
	CODPAQ INT,
	IDACT INT,
	TIPPAGRES CHAR(1),
	CANPERRES INT,
	ADERES DECIMAL(8,2),
	ESTRES CHAR(1) DEFAULT 'A',
	CONSTRAINT IDRES_PK PRIMARY KEY (IDRES) -- Definiendo clave principal
)
GO

DROP TABLE if EXISTS VENTA;
create table VENTA
(
	IDVENT INT IDENTITY(1,1),
	IDEMP INT,
	IDCLI  INT,
	FECVENT DATETIME DEFAULT GETDATE(), 
	ESTVENT CHAR(1) DEFAULT 'A',
	CONSTRAINT IDVENT_PK PRIMARY KEY (IDVENT) -- Definiendo clave principal
)
GO

DROP TABLE if EXISTS VENTA_DETALLE;
create table VENTA_DETALLE
(
	IDVENTDET INT IDENTITY(1,1),
	IDVENT INT,
	IDRES INT,
	SALRES DECIMAL(8,2),
	CONSTRAINT IDVENTDET_PK PRIMARY KEY (IDVENTDET) -- Definiendo clave principal
)
GO

--ESTABLECEMOS LAS RELACIONES

ALTER TABLE VENTA 
ADD CONSTRAINT VENTA_CLIENTE_FK
FOREIGN KEY (IDCLI)
REFERENCES CLIENTE(IDCLI)
GO
	
ALTER TABLE VENTA 
ADD CONSTRAINT VENTA_EMPLEADO_FK
FOREIGN KEY (IDEMP)
REFERENCES EMPLEADO(IDEMP)
GO

ALTER TABLE VENTA_DETALLE
ADD CONSTRAINT VENTA_DETALLE_VENTA_FK
FOREIGN KEY (IDVENT)
REFERENCES VENTA(IDVENT)
GO 


ALTER TABLE VENTA_DETALLE 
ADD CONSTRAINT VENTA_DETALLE_RESERVA_FK
FOREIGN KEY (IDRES)
REFERENCES RESERVA(IDRES)
GO


ALTER TABLE RESERVA
ADD CONSTRAINT RESERVA_PAQUETE_FK
FOREIGN KEY (CODPAQ)
REFERENCES PAQUETE(CODPAQ)
GO



ALTER TABLE RESERVA
ADD CONSTRAINT RESERVA_ACTIVIDAD_FK
FOREIGN KEY (IDACT)
REFERENCES ACTIVIDAD(IDACT)
GO

ALTER TABLE RESERVA
ADD CONSTRAINT RESERVA_CLIENTE_FK
FOREIGN KEY (IDCLI)
REFERENCES CLIENTE(IDCLI)
GO

ALTER TABLE PAQUETE_DETALLE
ADD CONSTRAINT DETALLE_PAQUETE_FK
FOREIGN KEY (CODPAQ)
REFERENCES PAQUETE(CODPAQ)
GO

ALTER TABLE PAQUETE_DETALLE
ADD CONSTRAINT DETALLE_ACTIVIDAD_FK
FOREIGN KEY (IDACT)
REFERENCES ACTIVIDAD(IDACT)
GO

--INSERTAMOS REGISTRO

INSERT INTO CLIENTE
( NOMCLI, APECLI, EMACLI, DNICLI, CELCLI)
VALUES
('Juana','Zavala Olaya','juana@gmail.com','72530589','98542631'),
('Marcos','Arredondo Palomino','marcos@gmail.com ','45123697','945123697'),
('Alexis','Rodriguez Huaman','alexis@hotmail.com','12345678','900654789'),
('Pedro','Mantilla Porras ','Pedro@hotmail.com','78451263','936521478'),
('Rodrigo','Sanchez Padilla','Rodri@gmail.com','45277863','972165487'),
('Jeferson','Torres Padilla','Jeff@gmail.com','05317863','992165487'),
('Ana','Huaman remuzgo','Ana@hotmail.com','45117863','982165487'),
('Lisa','Granada borjas','Lisa@gmail.com','55217863','942165487'),
('Marcos','Sanchez lopez','Marcos@hotmail.com','45217863','962165487'),
('Manuel','Torres Porras','Manuel@gmail.com','65217863','922165487'),
('Lucifer','Estrella de la mañana','Lucif@hotmail.com','45217863','912165487'),
('Miguel','Ramos Centeno','Miguel@gmail.com','95217863','942165487'),
('Imanol','Lévano Simón','Imanol@hotmail.com','85217863','992165487'),
('Gerack','Naivares Torres','gerack@gmail.com','55217863','962165487'),
('Dario','Cañita Huaman','Dario@hotmail.com','35217863','922165487'),
('Eythan','Portuguez cordero','eythan@gmail.com','05217863','992164487'),
('Maria',' Padilla Torres','Mirtha@gmail.com','45478638','932165487'),
('Alexia','De los angeles Remuzgo','Mirtha@gmail.com','45117863','932165487'),
('Roxana',' Padilla Rodriguez','Mirtha@gmail.com','45288863','932165487'),
('Rosaa','Huaman Padilla','Rosa@gmail.com','45292863','912165487')

GO


INSERT INTO EMPLEADO
(NOMEMP,APEEMP,DNIEMP,EMAEMP,CELEMP)
VALUES
('juan','Porras Ortega','99564865','juan@gmail.com','928794535'),
('Pedro','Porras Luyo', '12345678','pedro@gmail.com','978506127'),
('Julian','Talla Sandoval', '12445678','julian@gmail.com','990456124'),
('Maximo','Ramirez Damian', '19346678','max@gmail.com','978456150'),
('Luis','Juscamayta Torres', '12245678','Luis@gmail.com','978470120'),
('Raquel','Huaman Arias', '12345778','raquel@gmail.com','922456122'),
('Estefany','Sanchez Portuguez ', '18345678','Teffa@gmail.com','978306128'),
('Jesus','Canales Quiroz', '12341678','Jesus@gmail.com','910056163'),
('Judas','De la cruz sandoval', '52345678','judas@gmail.com','900000026'),
('Liam','Carrazco Caceres', '92345078','liam@gmail.com','970456107'),
('Erick','Portuguez Zavala', '72345678','erick@gmail.com','908450124'),
('Johan','Portuguez Zavala', '62345678','johan@gmail.com','974456109'),
('Gemma','Talla Zavala', '52305678','gemma@gmail.com','978456125'),
('Aldo','Portuguez Zavala', '42390678','Aldo@gmail.com','978456124'),
('Maria','Cordero Montes', '42405678','Maria@gmail.com','918459003'),
('Alexandra','Lozano Sandoval', '62345678','Ale@gmail.com','973006123'),
('Alina','Lozano Sandoval', '72345678','Alina@gmail.com','978357412'),
('Dayana','Cordero Montes', '02345678','Dayana@gmail.com','950046123'),
('Ruben','Apari Carrazco', '12445678','Ruben@gmail.com','940055123'),
('Joaquin','Portuguez cordero', '10345678','joaquin@gmail.com','923456123')
go



INSERT INTO ACTIVIDAD
(NOMACT,PREACT,DESPAQ)
VALUES
('CANOTAJE',' 15.00','Aventuras en votes a tu gusto '),
('CUATRIMOTO',' 20.00','Vive la adrenalina extrema con nosotros'),
('PASEO A CABALLO',' 20.00','Vive la adrenalina extrema con nosotros '),
('CUATRIMOTO DOBLE',' 30.00','Vive la adrenalina extrema con nosotros'),
('CANOPY',' 40.00','Vive la adrenalina extrema con nosotros '),
('RAPPEL',' 50.00','Vive la adrenalina extrema con nosotros '),
('PASEO TURISTICO',' 30.00','Vive la adrenalina extrema con nosotros'),
('ESCALERA AL CIELO',' 60.00','EXCLUCIVO PARA LOS PAQUETES '),
('VICICLETA EXTREMA',' 65.00','EXCLUCIVO PARA LOS PAQUETES '),
('PUENTE TIBETANO',' 40.00','EXCLUCIVO PARA LOS PAQUETES ')

GO

INSERT INTO PAQUETE
(NOMPAQ,PREPAQ,DESPAQ)
VALUES
('FAMILIAR VERANO','45.00','DISFRUTA AL MAXIMO EN FAMILIA'),
('SOLO PARA VALIENTES','60.00','ESCALA,MOTO, CANOTAJE'),
('PAQUETE 1','50.00','CANOTAJE Y MOTO'),
('PAQUETE 2','30.00','CANOTAJE, MOTO Y PASEO TURÍSCTICO'),
('PAQUETE 3','70.00','PASEO POR CASAS ABANDONADAS'),
('LIBERTAD AL MAXIMO','80.00','CANOTAJE,CUATRIMOTO,PASEO TUÍSTICO,CANOPY Y RAPPEL'),
('PAQUETE DE AMIGOS','70.00','PUENTE TIBERIANO,CANOPY+PAQUETE 2')
GO


INSERT INTO PAQUETE_DETALLE
(CODPAQ,IDACT)
VALUES
('1','1'),
('1','2'),
('2','1'),
('2','2'),
('2','7'),
('3','1'),
('3','2'),
('3','7'),
('3','5'),
('4','1'),
('4','2'),
('4','7'),
('4','5'),
('4','6'),
('5','10'),
('5','5'),
('6','8'),
('6','6'),
('6','5'),
('7','8'),
('7','5'),
('7','9')
GO

SET DATEFORMAT dmy 
GO

INSERT INTO RESERVA
(FECPASRES,IDCLI,CODPAQ,IDACT,TIPPAGRES,CANPERRES,ADERES)
VALUES
('11/09/2095','1','1',NULL,'E','1','35.00'),
('01/08/2095','5','4',NULL,'E','3','60.00'),
('21/07/2095','6','3',NULL,'E','2','105.00'),
('07/06/2095','7','4',NULL,'E','4','155.00'),
('06/05/2095','8','5','5','E','1','120.00'),
('05/04/2095','9','6','1','E','2','115.00'),
('04/03/2015','10',NULL,'7','E','3','90.00'),
('03/02/2015','11','2',NULL,'E','1','65.00'),
('02/01/2015','12','3','7','E','2','135.00'),
('04/12/2015','13',NULL,'2','E','3','60.00'),
('05/11/2015','14',NULL,'3','E','1','20.00'),
('06/10/2015','15','4',NULL,'E','2','155.00'),
('09/09/2015','16','3','6','E','2','155.00'),
('08/07/2015','17',NULL,'4','E','2','60.00'),
('07/06/2015','18','7','6','E','3','215.00'),
('06/05/2015','19','1',NULL,'E','1','40.00'),
('04/04/2015','20',NULL,'3','E','2','40.00'),
('03/03/2015','16','3','4','E','2','135.00'),
('04/02/2015','18','2',NULL,'E','2','80.00'),
('17/01/2015','20','1',NULL,'E','3','60.00')
GO


INSERT INTO VENTA 
(IDEMP,IDCLI)
VALUES
('1','1'),
('1','2'),
('1','3'),
('4','4'),
('5','5'),
('6','6'),
('7','7'),
('7','8'),
('7','9'),
('10','10'),
('11','11'),
('12','12'),
('12','13'),
('12','14'),
('12','15'),
('17','16'),
('17','17'),
('18','18'),
('19','19'),
('20','20')
GO



INSERT INTO VENTA_DETALLE
(IDVENT,IDRES,SALRES)
VALUES
('1','1','25.00'),
('2','2','30.00'),
('3','3','45.00'),
('4','4','55.00'),
('5','5','15.00'),
('6','6','5.00'),
('7','7','25.00'),
('8','8','25.00'),
('9','9','25.00'),
('10','10','25.00'),
('11','11','25.00'),
('12','14','25.00'),
('13','13','25.00'),
('14','16','25.00'),
('15','15','25.00'),
('16','16','25.00'),
('17','17','25.00'),
('18','18','25.00'),
('19','19','25.00'),
('20','20','35.00')
GO



select * from CLIENTE
go

select * from EMPLEADO
go

select * from RESERVA
go

select * from ACTIVIDAD
go

select * from PAQUETE
go

select * from PAQUETE_DETALLE
go

select * from VENTA
go

select * from VENTA_DETALLE
go




