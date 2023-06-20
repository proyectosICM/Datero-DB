	-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-06-2023 a las 15:51:03
-- Versión del servidor: 8.0.33
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `daterodb`
--
CREATE DATABASE IF NOT EXISTS `daterodb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `daterodb`;

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `AGREGAR_BUSES`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `AGREGAR_BUSES` (IN `EST` BOOLEAN, IN `MODELO` VARCHAR(30), IN `PLACA` VARCHAR(30), IN `EMPRESA` INT, IN `RUTA` INT, IN `TRABAJADOR` INT)   BEGIN
	INSERT INTO BUSES(EST_BUS, MOD_BUS, PLACA_BUS, EMP_ID, RUTA_ID, TRABAJADOR_ID)
    VALUES(EST, MODELO, PLACA, EMPRESA, RUTA, TRABAJADOR);
END$$

DROP PROCEDURE IF EXISTS `AGREGAR_DISTRITOS`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `AGREGAR_DISTRITOS` (IN `NOM` VARCHAR(30), IN `EST` BOOLEAN)   BEGIN
 INSERT INTO DISTRITOS(NOM_DIS, EST_DIS)
 VALUES(NOM, EST);
END$$

DROP PROCEDURE IF EXISTS `AGREGAR_EMPRESAS`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `AGREGAR_EMPRESAS` (IN `NOM` VARCHAR(30), IN `EST` BOOLEAN)   BEGIN
	INSERT INTO EMPRESAS(NOM_EMP, EST_EMP)
    VALUES(NOM, EST);
END$$

DROP PROCEDURE IF EXISTS `AGREGAR_PARADEROS`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `AGREGAR_PARADEROS` (IN `EST` BOOLEAN, IN `NOM` VARCHAR(30), IN `DIS` INT)   BEGIN
	INSERT INTO PARADEROS(EST_PAR, NOM_PAR, DIS_ID) 
    VALUES (EST, NOM, DIS);
END$$

DROP PROCEDURE IF EXISTS `AGREGAR_ROLES`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `AGREGAR_ROLES` (IN `EST` BOOLEAN, IN `NOM` VARCHAR(30))   BEGIN
	INSERT  INTO ROLES(EST_ROL, NOM_ROL)
    VALUES(EST, NOM);
END$$

DROP PROCEDURE IF EXISTS `AGREGAR_RP`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `AGREGAR_RP` (IN `EST` BOOLEAN, IN `ORDEN` INT, IN `PARADERO` INT, IN `RUTA` INT)   BEGIN 
	INSERT INTO RP(EST_RP, ORDEN_RP, PAR_ID, RUTA_ID)
    VALUES(EST, ORDEN, PARADERO, RUTA);
END$$

DROP PROCEDURE IF EXISTS `AGREGAR_RUTAS`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `AGREGAR_RUTAS` (IN `NOM` VARCHAR(30), IN `EST` BOOLEAN, IN `EMPRESA` INT)   BEGIN
	INSERT INTO RUTAS (NOM_RUTA,EST_RUTA,EMP_ID) 
    VALUES(NOM, EST, EMPRESA);
END$$

DROP PROCEDURE IF EXISTS `AGREGAR_TRABAJADORES`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `AGREGAR_TRABAJADORES` (IN `NOM` VARCHAR(30), IN `APE` VARCHAR(30), IN `DNI` VARCHAR(30), IN `EST` BOOLEAN, IN `USUARIO` VARCHAR(30), IN `PASSW` VARCHAR(30), IN `ROL` INT, IN `EMPRESA` INT)   BEGIN
	INSERT INTO TRABAJADORES(NOM_TRA, APE_TRA, DNI_TRA, EST_TRA, USER_TRA, PASS_TRA, ROL_ID, EMPRESA_ID)
    VALUES(NOM, APE, DNI,EST, USUARIO, PASSW,ROL, EMPRESA);
END$$

DROP PROCEDURE IF EXISTS `BUSESXEMPD`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `BUSESXEMPD` (IN `EMPRESA` BIGINT)   BEGIN
	SELECT B.ID_BUS, R.ID_RUTA, R.NOM_RUTA, B.PLACA_BUS, B.MOD_BUS, T.ID_TRA, T.NOM_TRA, T.APE_TRA, B.EST_BUS , E.ID_EMP, E.NOM_EMP 
	FROM BUSES B 
	INNER JOIN RUTAS R ON B.RUTA_ID = R.ID_RUTA
	INNER JOIN TRABAJADORES T ON B.TRABAJADOR_ID = T.ID_TRA
    INNER JOIN EMPRESAS E ON E.ID_EMP = B.EMP_ID
	WHERE B.EMP_ID = EMPRESA AND B.EST_BUS = 0
	ORDER BY B.ID_BUS ASC;
END$$

DROP PROCEDURE IF EXISTS `BUSESXEMPH`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `BUSESXEMPH` (IN `ESTADO` BOOLEAN, IN `EMPRESA` BIGINT)   BEGIN
	SELECT B.ID_BUS, R.ID_RUTA, R.NOM_RUTA, B.PLACA_BUS, B.MOD_BUS, T.ID_TRA, T.NOM_TRA, T.APE_TRA, B.EST_BUS , E.ID_EMP, E.NOM_EMP 
	FROM BUSES B 
	INNER JOIN RUTAS R ON B.RUTA_ID = R.ID_RUTA
	INNER JOIN TRABAJADORES T ON B.TRABAJADOR_ID = T.ID_TRA
    INNER JOIN EMPRESAS E ON E.ID_EMP = B.EMP_ID
	WHERE B.EMP_ID = EMPRESA AND B.EST_BUS = ESTADO
	ORDER BY B.ID_BUS ASC;
END$$

DROP PROCEDURE IF EXISTS `BUSESXEMPT`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `BUSESXEMPT` (IN `EMPRESA` BIGINT)   BEGIN
	SELECT B.ID_BUS, R.ID_RUTA, R.NOM_RUTA, B.PLACA_BUS, B.MOD_BUS, T.ID_TRA, T.NOM_TRA, T.APE_TRA, B.EST_BUS , E.ID_EMP, E.NOM_EMP 
	FROM BUSES B 
	INNER JOIN RUTAS R ON B.RUTA_ID = R.ID_RUTA
	INNER JOIN TRABAJADORES T ON B.TRABAJADOR_ID = T.ID_TRA
    INNER JOIN EMPRESAS E ON E.ID_EMP = B.EMP_ID
	WHERE B.EMP_ID = EMPRESA
    ORDER BY B.ID_BUS ASC;
END$$

DROP PROCEDURE IF EXISTS `DISH`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `DISH` (IN `EST` BOOLEAN)   BEGIN
	SELECT * FROM DISTRITOS
	WHERE EST_DIS = EST;
END$$

DROP PROCEDURE IF EXISTS `EMPRESASH`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EMPRESASH` (IN `ESTADO` BOOLEAN)   BEGIN
	SELECT * FROM EMPRESAS 
	WHERE EST_EMP = ESTADO;
END$$

DROP PROCEDURE IF EXISTS `LISTAR_PARADEROS_DE_RUTA_IDA`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_PARADEROS_DE_RUTA_IDA` (IN `RUTA` INT)   BEGIN
	SELECT RP.ORDEN_RP, R.NOM_RUTA, P.NOM_PAR, D.NOM_DIS
	FROM RP 
	INNER JOIN RUTAS R ON RP.RUTA_ID = R.ID_RUTA
	INNER JOIN PARADEROS P ON RP.PAR_ID = P.ID_PAR
	INNER JOIN DISTRITOS D ON P.DIS_ID = D.ID_DIS
	WHERE R.ID_RUTA = RUTA
	ORDER BY RP.ORDEN_RP ASC;
END$$

DROP PROCEDURE IF EXISTS `LISTAR_PARADEROS_DE_RUTA_VUELTA`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_PARADEROS_DE_RUTA_VUELTA` (IN `RUTA` INT)   BEGIN
	SELECT RP.ORDEN_RP, R.NOM_RUTA, P.NOM_PAR, D.NOM_DIS
	FROM RP 
	INNER JOIN RUTAS R ON RP.RUTA_ID = R.ID_RUTA
	INNER JOIN PARADEROS P ON RP.PAR_ID = P.ID_PAR
	INNER JOIN DISTRITOS D ON P.DIS_ID = D.ID_DIS
	WHERE R.ID_RUTA = RUTA
	ORDER BY RP.ORDEN_RP DESC;
END$$

DROP PROCEDURE IF EXISTS `PARADEROXRUTA`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PARADEROXRUTA` (IN `RUTA` INT)   BEGIN
SELECT RP.ID_RP, RP.ORDEN_RP,R.ID_RUTA,  R.NOM_RUTA, P.ID_PAR, P.NOM_PAR, D.ID_DIS, D.NOM_DIS, P.LATITUD, P.LONGITUD, RP.EST_RP
FROM RP
	INNER JOIN RUTAS R ON RP.RUTA_ID = R.ID_RUTA
	INNER JOIN PARADEROS P ON RP.PAR_ID = P.ID_PAR
	INNER JOIN DISTRITOS D ON P.DIS_ID = D.ID_DIS
	WHERE R.ID_RUTA = RUTA 
    ORDER BY P.LONGITUD ASC;
END$$

DROP PROCEDURE IF EXISTS `PARH`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PARH` (IN `EST` BOOLEAN)   BEGIN
	SELECT P.ID_PAR, P.NOM_PAR, D.ID_DIS, D.NOM_DIS, P.LONGITUD, P.LATITUD, P.EST_PAR FROM PARADEROS P
    INNER JOIN DISTRITOS D
	ON P.DIS_ID = D.ID_DIS
    WHERE P.EST_PAR = EST
    ORDER BY P.EST_PAR ASC;
END$$

DROP PROCEDURE IF EXISTS `ROLESXH`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ROLESXH` (IN `EST` INT)   BEGIN
	SELECT ID_ROL, NOM_ROL, EST_ROL
    FROM ROLES
    WHERE EST_ROL = EST
    ORDER BY ID_ROL ASC;
END$$

DROP PROCEDURE IF EXISTS `RUTASXEMPD`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `RUTASXEMPD` (IN `EMPRESA` INT)   BEGIN
	SELECT R.ID_RUTA, R.NOM_RUTA, E.NOM_EMP, R.EST_RUTA
    FROM RUTAS R
	INNER JOIN EMPRESAS E ON R.EMP_ID = E.ID_EMP
	WHERE R.EMP_ID = EMPRESA AND EST_RUTA = FALSE;
END$$

DROP PROCEDURE IF EXISTS `RUTASXEMPH`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `RUTASXEMPH` (IN `EMPRESA` INT)   BEGIN
	SELECT R.ID_RUTA, R.NOM_RUTA, E.NOM_EMP, R.EST_RUTA
    FROM RUTAS R
	INNER JOIN EMPRESAS E ON R.EMP_ID = E.ID_EMP
	WHERE R.EMP_ID = EMPRESA AND EST_RUTA = TRUE;
END$$

DROP PROCEDURE IF EXISTS `RUTASXEMPT`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `RUTASXEMPT` (IN `EMPRESA` INT)   BEGIN
	SELECT R.ID_RUTA, R.NOM_RUTA, E.NOM_EMP, R.EST_RUTA
    FROM RUTAS R
	INNER JOIN EMPRESAS E ON R.EMP_ID = E.ID_EMP
	WHERE R.EMP_ID = EMPRESA;
END$$

DROP PROCEDURE IF EXISTS `TRABAJADORXEMPD`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `TRABAJADORXEMPD` (IN `EMPRESA` INT)   BEGIN
	SELECT T.ID_TRA, T.NOM_TRA, T.APE_TRA,T.DNI_TRA , E.NOM_EMP, T.USER_TRA, T.PASS_TRA, R.ROL_ID
	FROM TRABAJADORES T
	INNER JOIN ROL R ON T.ROL_ID = U.ID_ROL
	INNER JOIN EMPRESAS E ON T.EMPRESA_ID = E.ID_EMP
	WHERE E.ID_EMP = EMPRESA AND U.EST_USU = FALSE;
END$$

DROP PROCEDURE IF EXISTS `TRABAJADORXEMPH`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `TRABAJADORXEMPH` (IN `ESTADO` BOOLEAN, IN `EMPRESA` INT)   BEGIN
	SELECT T.ID_TRA, T.NOM_TRA, T.APE_TRA,T.DNI_TRA , E.ID_EMP, E.NOM_EMP, T.USER_TRA, T.PASS_TRA, R.ID_ROL, R.NOM_ROL, T.EST_TRA
	FROM TRABAJADORES T
	INNER JOIN ROLES R ON R.ID_ROL = T.ROL_ID 
	INNER JOIN EMPRESAS E ON T.EMPRESA_ID = E.ID_EMP
	WHERE E.ID_EMP = EMPRESA AND T.EST_TRA = ESTADO
    ORDER BY T.ID_TRA ASC;
END$$

DROP PROCEDURE IF EXISTS `TRABAJADORXEMPR`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `TRABAJADORXEMPR` (IN `EMPRESA` INT, IN `ESTADO` BOOLEAN, IN `ROL` INT)   BEGIN
	SELECT T.ID_TRA, T.NOM_TRA, T.APE_TRA,T.DNI_TRA , E.ID_EMP, E.NOM_EMP, T.USER_TRA, T.PASS_TRA, R.ID_ROL, R.NOM_ROL, T.EST_TRA
	FROM TRABAJADORES T
	INNER JOIN ROLES R ON R.ID_ROL = T.ROL_ID 
	INNER JOIN EMPRESAS E ON T.EMPRESA_ID = E.ID_EMP
	WHERE E.ID_EMP = EMPRESA AND T.EST_TRA = ESTADO AND R.ID_ROL = ROL
	ORDER BY T.ID_TRA ASC;
END$$

DROP PROCEDURE IF EXISTS `TRABAJADORXEMPT`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `TRABAJADORXEMPT` (IN `EMPRESA` INT)   BEGIN
	SELECT T.ID_TRA, T.NOM_TRA, T.APE_TRA,T.DNI_TRA , E.ID_EMP, E.NOM_EMP, T.USER_TRA, T.PASS_TRA, R.ID_ROL, R.NOM_ROL, T.EST_TRA
	FROM TRABAJADORES T
	INNER JOIN ROLES R ON R.ID_ROL = T.ROL_ID 
	INNER JOIN EMPRESAS E ON T.EMPRESA_ID = E.ID_EMP
	WHERE E.ID_EMP = EMPRESA
	ORDER BY T.ID_TRA ASC;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `buses`
--

DROP TABLE IF EXISTS `buses`;
CREATE TABLE `buses` (
  `id_bus` bigint NOT NULL,
  `est_bus` bit(1) DEFAULT NULL,
  `latitud` decimal(20,15) DEFAULT NULL,
  `longitud` decimal(20,15) DEFAULT NULL,
  `mod_bus` varchar(255) DEFAULT NULL,
  `placa_bus` varchar(255) DEFAULT NULL,
  `emp_id` bigint NOT NULL,
  `ruta_id` bigint NOT NULL,
  `trabajador_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `buses`
--

INSERT INTO `buses` (`id_bus`, `est_bus`, `latitud`, `longitud`, `mod_bus`, `placa_bus`, `emp_id`, `ruta_id`, `trabajador_id`) VALUES
(1, b'1', '-12.238879600000034', '-75.652729599999790', 'MERCEDES 2two', 'A222A', 1, 3, 1),
(2, b'1', '-12.991786200000030', '-75.992987999999830', 'MERCEDES', 'A2C-145', 2, 2, 1),
(3, b'1', NULL, NULL, 'MERCEDES', 'A2C-265', 2, 2, 1),
(4, b'1', NULL, NULL, 'MERCEDES', 'A3C-13L', 2, 2, 1),
(5, b'1', NULL, NULL, 'MERCEDES', 'A4C-523', 2, 2, 1),
(6, b'1', NULL, NULL, 'NISSAN', 'ABC-001', 1, 3, 1),
(7, b'1', NULL, NULL, 'MERCEDES', 'ABC-1D5', 1, 3, 3),
(8, b'1', NULL, NULL, 'MERCEDES', 'ABC-105', 1, 3, 1),
(9, b'1', NULL, NULL, 'MERCEDES', 'ABC-145', 1, 3, 1),
(10, b'1', NULL, NULL, 'MERCEDES', 'ABC-265', 1, 3, 1),
(11, b'1', NULL, NULL, 'MERCEDES', 'ABC-13L', 1, 2, 1),
(12, b'1', NULL, NULL, 'MERCEDES', 'ABC-523', 1, 3, 1),
(13, b'1', NULL, NULL, 'MERCEDES', 'B2C-105', 1, 4, 1),
(14, b'0', NULL, NULL, 'MERCEDES', 'B2C-145', 1, 4, 1),
(15, b'0', NULL, NULL, 'MERCEDES', 'B2C-265', 1, 4, 1),
(16, b'1', NULL, NULL, 'MERCEDES', 'B3C-13L', 1, 4, 1),
(17, b'1', NULL, NULL, 'MERCEDES', 'B4C-523', 1, 3, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `distritos`
--

DROP TABLE IF EXISTS `distritos`;
CREATE TABLE `distritos` (
  `id_dis` bigint NOT NULL,
  `est_dis` bit(1) DEFAULT NULL,
  `nom_dis` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `distritos`
--

INSERT INTO `distritos` (`id_dis`, `est_dis`, `nom_dis`) VALUES
(1, b'1', 'SANTA ANITA'),
(2, b'1', 'ATE'),
(3, b'1', 'EL AGUSTINO'),
(4, b'0', 'LA VICTORIA'),
(5, b'1', 'CERCADO DE LIMA'),
(6, b'1', 'CALLAO'),
(7, b'1', 'HUAYCAN'),
(8, b'1', 'SAN JUAN DE LURIGANCHO'),
(9, b'1', 'RIMAC'),
(10, b'1', 'BREÑA'),
(11, b'1', 'CHORRILLOS'),
(12, b'1', 'VILLA EL SALVADOR'),
(13, b'1', 'VILLA MARIA DEL TRIUNFO'),
(14, b'1', 'SAN MARTIN DE PORRES'),
(15, b'1', 'wqewqewq');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

DROP TABLE IF EXISTS `empresas`;
CREATE TABLE `empresas` (
  `id_emp` bigint NOT NULL,
  `est_emp` bit(1) DEFAULT NULL,
  `nom_emp` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `empresas`
--

INSERT INTO `empresas` (`id_emp`, `est_emp`, `nom_emp`) VALUES
(1, b'1', 'SurfaceIt22'),
(2, b'1', 'IMPORTPERIO'),
(3, b'0', 'El chino2'),
(4, b'0', 'Aviar'),
(5, b'0', 'Mirian SAC.'),
(6, b'0', 'El chino'),
(7, b'0', 'Alucard'),
(8, b'0', 'Mistian EIRL'),
(9, b'0', 'Misery'),
(10, b'1', 'wqewqewq'),
(11, NULL, NULL),
(12, NULL, NULL),
(13, NULL, NULL),
(14, NULL, NULL),
(15, NULL, NULL),
(16, NULL, NULL),
(17, b'1', 'El chino'),
(18, b'1', 'Martghas');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `empresas_deshabilitadas`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `empresas_deshabilitadas`;
CREATE TABLE `empresas_deshabilitadas` (
`id_emp` bigint
,`est_emp` bit(1)
,`nom_emp` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `empresas_habilitadas`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `empresas_habilitadas`;
CREATE TABLE `empresas_habilitadas` (
`id_emp` bigint
,`est_emp` bit(1)
,`nom_emp` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `listbusesd`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `listbusesd`;
CREATE TABLE `listbusesd` (
`ID_BUS` bigint
,`ID_RUTA` bigint
,`NOM_RUTA` varchar(255)
,`PLACA_BUS` varchar(255)
,`MOD_BUS` varchar(255)
,`NOM_TRA` varchar(255)
,`APE_TRA` varchar(255)
,`NOM_EMP` varchar(255)
,`LATITUD` decimal(20,15)
,`LONGITUD` decimal(20,15)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paraderos`
--

DROP TABLE IF EXISTS `paraderos`;
CREATE TABLE `paraderos` (
  `id_par` bigint NOT NULL,
  `est_par` bit(1) DEFAULT NULL,
  `latitud` decimal(20,15) DEFAULT NULL,
  `longitud` decimal(20,15) DEFAULT NULL,
  `nom_par` varchar(255) DEFAULT NULL,
  `dis_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `paraderos`
--

INSERT INTO `paraderos` (`id_par`, `est_par`, `latitud`, `longitud`, `nom_par`, `dis_id`) VALUES
(1, b'1', '-12.058200700000000', '-76.973094400000000', 'Puente Santa Anita', 1),
(2, b'1', '-12.047182300000000', '-76.980813500000000', 'Perales', 1),
(3, b'1', '-12.054920800000000', '-76.964846800000000', 'Ovalo Santa Anita ', 2),
(4, b'1', '-12.057490000000000', '-76.971446200000000', 'Mall de Santa Anita', 1),
(5, b'1', '-12.038809800000000', '-76.967004900000000', 'Mercado Andahuaylas', 1),
(6, b'1', '-12.065029900000000', '-77.015050200000000', 'Parque Cánepa', 4),
(7, b'1', '-12.073368000000000', '-77.015050200000000', 'La parada', 4),
(8, b'1', '-12.054831000000000', '-77.013148600000000', 'Estación Grau', 5),
(9, b'1', '-12.075558400000000', '-77.025812700000000', 'Metro av.Mexico 2', 6),
(10, b'1', '-76.964946200000000', '76.973094400000000', 'sada', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id_rol` bigint NOT NULL,
  `est_rol` bit(1) DEFAULT NULL,
  `nom_rol` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `est_rol`, `nom_rol`) VALUES
(1, b'1', 'GERENTE'),
(2, b'1', 'CONDUCTOR'),
(3, b'1', 'ADMINISTRADOR'),
(4, b'1', 'SISTEMAS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rp`
--

DROP TABLE IF EXISTS `rp`;
CREATE TABLE `rp` (
  `id_rp` bigint NOT NULL,
  `est_rp` bit(1) DEFAULT NULL,
  `orden_rp` int DEFAULT NULL,
  `par_id` bigint NOT NULL,
  `ruta_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `rp`
--

INSERT INTO `rp` (`id_rp`, `est_rp`, `orden_rp`, `par_id`, `ruta_id`) VALUES
(1, b'1', 1, 1, 3),
(2, b'1', 2, 4, 3),
(3, b'1', 3, 2, 3),
(4, b'1', 1, 1, 2),
(5, b'1', 2, 4, 2),
(6, b'1', 3, 3, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rtiempo`
--

DROP TABLE IF EXISTS `rtiempo`;
CREATE TABLE `rtiempo` (
  `id_rt` bigint NOT NULL,
  `tiempo` int DEFAULT NULL,
  `bus_id` bigint NOT NULL,
  `rp_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rutas`
--

DROP TABLE IF EXISTS `rutas`;
CREATE TABLE `rutas` (
  `id_ruta` bigint NOT NULL,
  `est_ruta` bit(1) DEFAULT NULL,
  `nom_ruta` varchar(255) DEFAULT NULL,
  `emp_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `rutas`
--

INSERT INTO `rutas` (`id_ruta`, `est_ruta`, `nom_ruta`, `emp_id`) VALUES
(2, b'1', 'A0232', 1),
(3, b'1', 'B054', 1),
(4, b'1', 'C323', 1),
(5, b'1', 'C32D', 2),
(6, b'1', 'D32T', 2),
(7, b'1', 'D354', 2),
(8, b'0', 'EDD', 1),
(9, b'0', 'Es', 1),
(10, b'1', 'Qwe1', 1),
(11, b'1', 'EDDa', 1),
(12, b'1', 'Empss222', 1),
(13, b'1', 'A222', 1),
(14, b'1', 'asdsad', 1),
(15, b'1', 'Morido', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajadores`
--

DROP TABLE IF EXISTS `trabajadores`;
CREATE TABLE `trabajadores` (
  `id_tra` bigint NOT NULL,
  `ape_tra` varchar(255) DEFAULT NULL,
  `dni_tra` varchar(255) DEFAULT NULL,
  `est_tra` bit(1) DEFAULT NULL,
  `nom_tra` varchar(255) DEFAULT NULL,
  `pass_tra` varchar(255) DEFAULT NULL,
  `user_tra` varchar(255) DEFAULT NULL,
  `empresa_id` bigint NOT NULL,
  `rol_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `trabajadores`
--

INSERT INTO `trabajadores` (`id_tra`, `ape_tra`, `dni_tra`, `est_tra`, `nom_tra`, `pass_tra`, `user_tra`, `empresa_id`, `rol_id`) VALUES
(1, 'TORRES', '78547689', b'1', 'JUAN2', '1212', 'ADMIN1', 1, 2),
(2, 'NOLASCO', '78547689', b'1', 'ALEXIS', '1212', 'ADMIN2', 1, 3),
(3, 'SUAREZ', '78547689', b'0', 'MARCO', '1212', 'ADMIN3', 1, 2),
(4, 'MARTINES', '78547689', b'0', 'RODRIGO', '1212', 'ADMIN4', 1, 1),
(5, 'SUAREZ', '78547689', b'1', 'MARCO', '1212', 'ADMIN5', 1, 1),
(6, 'MARTINES', '78547689', b'1', 'RODRIGO', '1212', 'ADMIN6', 2, 1),
(7, 'SUAREZ', '78547689', b'1', 'MARCO', '1212', 'ADMIN7', 2, 1),
(8, 'MARTINES', '78547689', b'1', 'RODRIGO', '1212', 'ADMIN8', 2, 1),
(9, 'SUAREZ', '78547689', b'1', 'MARCO', '1212', 'ADMIN9', 2, 1),
(10, 'MARTINES', '78547689', b'1', 'RODRIGO', '1212', 'ADMIN10', 2, 1),
(11, 'TORRES', '78547689', b'1', 'JUffgfdgfAN2', '1212', 'ADMIN1', 1, 2),
(12, 'Fuas2', '78547689', b'1', '', '4521', 'Assuu', 1, 2),
(13, 'wqewqe', '78545689', b'1', 'wsaqdwaqsdwq', '121212', 'wqewqe', 1, 2);

-- --------------------------------------------------------

--
-- Estructura para la vista de `empresas_deshabilitadas` exportada como una tabla
--
DROP TABLE IF EXISTS `empresas_deshabilitadas`;
CREATE TABLE`empresas_deshabilitadas`(
    `id_emp` bigint NOT NULL DEFAULT '0',
    `est_emp` bit(1) DEFAULT NULL,
    `nom_emp` varchar(255) COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
);

-- --------------------------------------------------------

--
-- Estructura para la vista de `empresas_habilitadas` exportada como una tabla
--
DROP TABLE IF EXISTS `empresas_habilitadas`;
CREATE TABLE`empresas_habilitadas`(
    `id_emp` bigint NOT NULL DEFAULT '0',
    `est_emp` bit(1) DEFAULT NULL,
    `nom_emp` varchar(255) COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
);

-- --------------------------------------------------------

--
-- Estructura para la vista de `listbusesd` exportada como una tabla
--
DROP TABLE IF EXISTS `listbusesd`;
CREATE TABLE`listbusesd`(
    `ID_BUS` bigint NOT NULL DEFAULT '0',
    `ID_RUTA` bigint NOT NULL DEFAULT '0',
    `NOM_RUTA` varchar(255) COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
    `PLACA_BUS` varchar(255) COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
    `MOD_BUS` varchar(255) COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
    `NOM_TRA` varchar(255) COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
    `APE_TRA` varchar(255) COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
    `NOM_EMP` varchar(255) COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
    `LATITUD` decimal(20,15) DEFAULT NULL,
    `LONGITUD` decimal(20,15) DEFAULT NULL
);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `buses`
--
ALTER TABLE `buses`
  ADD PRIMARY KEY (`id_bus`),
  ADD KEY `FKgp1401dyvayu7elkbvt0r3eh4` (`emp_id`),
  ADD KEY `FKg4urg67o6onhggqghcc2r5r4e` (`ruta_id`),
  ADD KEY `FKmetpxoife1certsto9745qs1f` (`trabajador_id`);

--
-- Indices de la tabla `distritos`
--
ALTER TABLE `distritos`
  ADD PRIMARY KEY (`id_dis`);

--
-- Indices de la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`id_emp`);

--
-- Indices de la tabla `paraderos`
--
ALTER TABLE `paraderos`
  ADD PRIMARY KEY (`id_par`),
  ADD KEY `FK7ne8qrbq530jo4riclbhbxc5r` (`dis_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `rp`
--
ALTER TABLE `rp`
  ADD PRIMARY KEY (`id_rp`),
  ADD KEY `FKhkukat3bp0h9di6h7brd1l8ay` (`par_id`),
  ADD KEY `FKf3aqbh7w6v55tygq75h7iv722` (`ruta_id`);

--
-- Indices de la tabla `rtiempo`
--
ALTER TABLE `rtiempo`
  ADD PRIMARY KEY (`id_rt`),
  ADD KEY `FK7se74wd7xniyll1887kr6tb21` (`bus_id`),
  ADD KEY `FKa4jp2qqactiyqydhyqffoj89o` (`rp_id`);

--
-- Indices de la tabla `rutas`
--
ALTER TABLE `rutas`
  ADD PRIMARY KEY (`id_ruta`),
  ADD KEY `FKrri4jherl259qwaa1forbgiby` (`emp_id`);

--
-- Indices de la tabla `trabajadores`
--
ALTER TABLE `trabajadores`
  ADD PRIMARY KEY (`id_tra`),
  ADD KEY `FKjjjbdr4kuhrdiq5houakgb0pe` (`empresa_id`),
  ADD KEY `FK72vpyuskuemi8sy0dipfdrdxe` (`rol_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `buses`
--
ALTER TABLE `buses`
  MODIFY `id_bus` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `distritos`
--
ALTER TABLE `distritos`
  MODIFY `id_dis` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `empresas`
--
ALTER TABLE `empresas`
  MODIFY `id_emp` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `paraderos`
--
ALTER TABLE `paraderos`
  MODIFY `id_par` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `rp`
--
ALTER TABLE `rp`
  MODIFY `id_rp` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `rtiempo`
--
ALTER TABLE `rtiempo`
  MODIFY `id_rt` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rutas`
--
ALTER TABLE `rutas`
  MODIFY `id_ruta` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `trabajadores`
--
ALTER TABLE `trabajadores`
  MODIFY `id_tra` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `buses`
--
ALTER TABLE `buses`
  ADD CONSTRAINT `FKg4urg67o6onhggqghcc2r5r4e` FOREIGN KEY (`ruta_id`) REFERENCES `rutas` (`id_ruta`),
  ADD CONSTRAINT `FKgp1401dyvayu7elkbvt0r3eh4` FOREIGN KEY (`emp_id`) REFERENCES `empresas` (`id_emp`),
  ADD CONSTRAINT `FKmetpxoife1certsto9745qs1f` FOREIGN KEY (`trabajador_id`) REFERENCES `trabajadores` (`id_tra`);

--
-- Filtros para la tabla `paraderos`
--
ALTER TABLE `paraderos`
  ADD CONSTRAINT `FK7ne8qrbq530jo4riclbhbxc5r` FOREIGN KEY (`dis_id`) REFERENCES `distritos` (`id_dis`);

--
-- Filtros para la tabla `rp`
--
ALTER TABLE `rp`
  ADD CONSTRAINT `FKf3aqbh7w6v55tygq75h7iv722` FOREIGN KEY (`ruta_id`) REFERENCES `rutas` (`id_ruta`),
  ADD CONSTRAINT `FKhkukat3bp0h9di6h7brd1l8ay` FOREIGN KEY (`par_id`) REFERENCES `paraderos` (`id_par`);

--
-- Filtros para la tabla `rtiempo`
--
ALTER TABLE `rtiempo`
  ADD CONSTRAINT `FK7se74wd7xniyll1887kr6tb21` FOREIGN KEY (`bus_id`) REFERENCES `buses` (`id_bus`),
  ADD CONSTRAINT `FKa4jp2qqactiyqydhyqffoj89o` FOREIGN KEY (`rp_id`) REFERENCES `rp` (`id_rp`);

--
-- Filtros para la tabla `rutas`
--
ALTER TABLE `rutas`
  ADD CONSTRAINT `FKrri4jherl259qwaa1forbgiby` FOREIGN KEY (`emp_id`) REFERENCES `empresas` (`id_emp`);

--
-- Filtros para la tabla `trabajadores`
--
ALTER TABLE `trabajadores`
  ADD CONSTRAINT `FK72vpyuskuemi8sy0dipfdrdxe` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id_rol`),
  ADD CONSTRAINT `FKjjjbdr4kuhrdiq5houakgb0pe` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id_emp`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
