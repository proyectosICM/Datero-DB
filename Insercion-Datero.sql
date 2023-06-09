USE DATERODB;

--------------------------------------------------------
-- Procedimientos alamcenados --
--------------------------------------------------------

-- EMPRESAS --
DELIMITER //
CREATE PROCEDURE AGREGAR_EMPRESAS
(IN NOM VARCHAR(30), IN EST BOOLEAN)
BEGIN
	INSERT INTO EMPRESAS(NOM_EMP, EST_EMP)
    VALUES(NOM, EST);
END //


-- RUTAS --
DELIMITER //
CREATE PROCEDURE AGREGAR_RUTAS
(IN NOM VARCHAR(30), IN EST BOOLEAN, IN EMPRESA INT)
BEGIN
	INSERT INTO RUTAS (NOM_RUTA,EST_RUTA,EMP_ID) 
    VALUES(NOM, EST, EMPRESA);
END //

-- DISTRITOS --
DELIMITER //
CREATE PROCEDURE AGREGAR_DISTRITOS
(IN NOM VARCHAR(30), IN EST BOOLEAN)
BEGIN
 INSERT INTO DISTRITOS(NOM_DIS, EST_DIS)
 VALUES(NOM, EST);
END //

-- PARADEROS --
DELIMITER //
CREATE PROCEDURE AGREGAR_PARADEROS
(IN EST BOOLEAN, IN NOM VARCHAR(30), IN DIS INT)
BEGIN
	INSERT INTO PARADEROS(EST_PAR, NOM_PAR, DIS_ID) 
    VALUES (EST, NOM, DIS);
END //

-- RP --
DELIMITER //
CREATE PROCEDURE AGREGAR_RP
(IN EST BOOLEAN, IN ORDEN INT, IN PARADERO INT , IN RUTA INT)
BEGIN 
	INSERT INTO RP(EST_RP, ORDEN_RP, PAR_ID, RUTA_ID)
    VALUES(EST, ORDEN, PARADERO, RUTA);
END //

-- ROLES --
DELIMITER //
CREATE PROCEDURE AGREGAR_ROLES
(IN EST BOOLEAN, IN NOM VARCHAR(30))
BEGIN
	INSERT  INTO ROLES(EST_ROL, NOM_ROL)
    VALUES(EST, NOM);
END //


-- TRABAJADORES --
DELIMITER //
CREATE PROCEDURE AGREGAR_TRABAJADORES
(IN NOM VARCHAR(30), IN APE VARCHAR(30), IN DNI VARCHAR(30), IN EST BOOLEAN ,IN USUARIO VARCHAR(30), 
IN PASSW VARCHAR(30), IN ROL INT, IN EMPRESA INT)
BEGIN
	INSERT INTO TRABAJADORES(NOM_TRA, APE_TRA, DNI_TRA, EST_TRA, USER_TRA, PASS_TRA, ROL_ID, EMPRESA_ID)
    VALUES(NOM, APE, DNI,EST, USUARIO, PASSW,ROL, EMPRESA);
END //

-- BUSES --
DELIMITER //
CREATE PROCEDURE AGREGAR_BUSES
(IN EST BOOLEAN, IN MODELO VARCHAR(30), IN PLACA VARCHAR(30), IN EMPRESA INT, IN RUTA INT, IN TRABAJADOR INT)
BEGIN
	INSERT INTO BUSES(EST_BUS, MOD_BUS, PLACA_BUS, EMP_ID, RUTA_ID, TRABAJADOR_ID)
    VALUES(EST, MODELO, PLACA, EMPRESA, RUTA, TRABAJADOR);
END //


DELIMITER //
CREATE PROCEDURE LISTAR_PARADEROS_DE_RUTA_IDA(IN RUTA INT)
BEGIN
	SELECT RP.ORDEN_RP, R.NOM_RUTA, P.NOM_PAR, D.NOM_DIS
	FROM RP 
	INNER JOIN RUTAS R ON RP.RUTA_ID = R.ID_RUTA
	INNER JOIN PARADEROS P ON RP.PAR_ID = P.ID_PAR
	INNER JOIN DISTRITOS D ON P.DIS_ID = D.ID_DIS
	WHERE R.ID_RUTA = RUTA
	ORDER BY RP.ORDEN_RP ASC;
END //


DELIMITER //
CREATE PROCEDURE LISTAR_PARADEROS_DE_RUTA_VUELTA(IN RUTA INT)
BEGIN
	SELECT RP.ORDEN_RP, R.NOM_RUTA, P.NOM_PAR, D.NOM_DIS
	FROM RP 
	INNER JOIN RUTAS R ON RP.RUTA_ID = R.ID_RUTA
	INNER JOIN PARADEROS P ON RP.PAR_ID = P.ID_PAR
	INNER JOIN DISTRITOS D ON P.DIS_ID = D.ID_DIS
	WHERE R.ID_RUTA = RUTA
	ORDER BY RP.ORDEN_RP DESC;
END //

DELIMITER //
CREATE PROCEDURE EMPEST
(IN ESTADO BOOLEAN)
BEGIN
	SELECT * FROM EMPRESAS 
	WHERE EST_EMP = ESTADO;
END //

----- Buses -------
DELIMITER //
CREATE PROCEDURE BUSESXEMPT
(IN EMPRESA BIGINT)
BEGIN
	SELECT B.ID_BUS, R.ID_RUTA, R.NOM_RUTA, B.PLACA_BUS, B.MOD_BUS, T.ID_TRA, T.NOM_TRA, T.APE_TRA, B.EST_BUS , E.ID_EMP, E.NOM_EMP 
	FROM BUSES B 
	INNER JOIN RUTAS R ON B.RUTA_ID = R.ID_RUTA
	INNER JOIN TRABAJADORES T ON B.TRABAJADOR_ID = T.ID_TRA
    INNER JOIN EMPRESAS E ON E.ID_EMP = B.EMP_ID
	WHERE B.EMP_ID = EMPRESA;
END //

DELIMITER //
CREATE PROCEDURE BUSESXEMPH
(IN EMPRESA BIGINT)
BEGIN
	SELECT B.ID_BUS, R.ID_RUTA, R.NOM_RUTA, B.PLACA_BUS, B.MOD_BUS, T.ID_TRA, T.NOM_TRA, T.APE_TRA, B.EST_BUS , E.ID_EMP, E.NOM_EMP 
	FROM BUSES B 
	INNER JOIN RUTAS R ON B.RUTA_ID = R.ID_RUTA
	INNER JOIN TRABAJADORES T ON B.TRABAJADOR_ID = T.ID_TRA
    INNER JOIN EMPRESAS E ON E.ID_EMP = B.EMP_ID
	WHERE B.EMP_ID = EMPRESA AND B.EST_BUS = 1;
END //


DELIMITER //
CREATE PROCEDURE BUSESXEMPD
(IN EMPRESA BIGINT)
BEGIN
	SELECT B.ID_BUS, R.ID_RUTA, R.NOM_RUTA, B.PLACA_BUS, B.MOD_BUS, T.ID_TRA, T.NOM_TRA, T.APE_TRA, B.EST_BUS , E.ID_EMP, E.NOM_EMP 
	FROM BUSES B 
	INNER JOIN RUTAS R ON B.RUTA_ID = R.ID_RUTA
	INNER JOIN TRABAJADORES T ON B.TRABAJADOR_ID = T.ID_TRA
    INNER JOIN EMPRESAS E ON E.ID_EMP = B.EMP_ID
	WHERE B.EMP_ID = EMPRESA AND B.EST_BUS = 0;
END //

----- Trabajadores -------
DELIMITER //
CREATE PROCEDURE TRABAJADORXEMPT
(IN EMPRESA INT)
BEGIN
	SELECT T.ID_TRA, T.NOM_TRA, T.APE_TRA,T.DNI_TRA , E.ID_EMP, E.NOM_EMP, T.USER_TRA, T.PASS_TRA, R.ID_ROL, R.NOM_ROL, T.EST_TRA
	FROM TRABAJADORES T
	INNER JOIN ROLES R ON R.ID_ROL = T.ROL_ID 
	INNER JOIN EMPRESAS E ON T.EMPRESA_ID = E.ID_EMP
	WHERE E.ID_EMP = EMPRESA;
END //

DELIMITER //
CREATE PROCEDURE TRABAJADORXEMPH
(IN EMPRESA INT, IN ESTADO BOOLEAN)
BEGIN
	SELECT T.ID_TRA, T.NOM_TRA, T.APE_TRA,T.DNI_TRA , E.ID_EMP, E.NOM_EMP, T.USER_TRA, T.PASS_TRA, R.ID_ROL, R.NOM_ROL, T.EST_TRA
	FROM TRABAJADORES T
	INNER JOIN ROLES R ON R.ID_ROL = T.ROL_ID 
	INNER JOIN EMPRESAS E ON T.EMPRESA_ID = E.ID_EMP
	WHERE E.ID_EMP = EMPRESA AND T.EST_TRA = ESTADO;
END //

DELIMITER //
CREATE PROCEDURE TRABAJADORXEMPR
(IN EMPRESA INT, IN ESTADO BOOLEAN, IN ROL INT)
BEGIN
	SELECT T.ID_TRA, T.NOM_TRA, T.APE_TRA,T.DNI_TRA , E.ID_EMP, E.NOM_EMP, T.USER_TRA, T.PASS_TRA, R.ID_ROL, R.NOM_ROL, T.EST_TRA
	FROM TRABAJADORES T
	INNER JOIN ROLES R ON R.ID_ROL = T.ROL_ID 
	INNER JOIN EMPRESAS E ON T.EMPRESA_ID = E.ID_EMP
	WHERE E.ID_EMP = EMPRESA AND T.EST_TRA = ESTADO AND R.ID_ROL = ROL;
END //


----- RUTAS -----
DELIMITER //
CREATE PROCEDURE RUTASXEMPT
(IN EMPRESA INT)
BEGIN
	SELECT R.ID_RUTA, R.NOM_RUTA, E.NOM_EMP, R.EST_RUTA
    FROM RUTAS R
	INNER JOIN EMPRESAS E ON R.EMP_ID = E.ID_EMP
	WHERE R.EMP_ID = 1;
END //

DELIMITER //
CREATE PROCEDURE RUTASXEMPH
(IN EMPRESA INT)
BEGIN
	SELECT R.ID_RUTA, R.NOM_RUTA, E.NOM_EMP, R.EST_RUTA
    FROM RUTAS R
	INNER JOIN EMPRESAS E ON R.EMP_ID = E.ID_EMP
	WHERE R.EMP_ID = 1 AND EST_RUTA = TRUE;
END //

DELIMITER //
CREATE PROCEDURE RUTASXEMPD
(IN EMPRESA INT)
BEGIN
	SELECT R.ID_RUTA, R.NOM_RUTA, E.NOM_EMP, R.EST_RUTA
    FROM RUTAS R
	INNER JOIN EMPRESAS E ON R.EMP_ID = E.ID_EMP
	WHERE R.EMP_ID = EMPRESA AND EST_RUTA = FALSE;
END //

----- DISTRITOS -----
DELIMITER //
CREATE PROCEDURE DISH
(IN EST BOOLEAN)
BEGIN
	SELECT * FROM DISTRITOS
	WHERE EST_DIS = EST;
END //


--------------------------------------------------------
-- Creacion de vistas --
--------------------------------------------------------
CREATE VIEW LISTBUSESD
AS
SELECT B.ID_BUS, R.NOM_RUTA, B.PLACA_BUS, B.MOD_BUS, T.NOM_TRA, T.APE_TRA, E.NOM_EMP
FROM BUSES B
INNER JOIN TRABAJADORES T ON B.TRABAJADOR_ID = T.ID_TRA
INNER JOIN EMPRESAS E ON B.EMP_ID = E.ID_EMP
INNER JOIN RUTAS R ON B.RUTA_ID = R.ID_RUTA
ORDER BY B.ID_BUS ASC;

CREATE VIEW EMPRESAS_HABILITADAS
AS
SELECT * FROM EMPRESAS 
WHERE EST_EMP = 1;

CREATE VIEW EMPRESAS_DESHABILITADAS
AS
SELECT * FROM EMPRESAS 
WHERE EST_EMP = 0;








