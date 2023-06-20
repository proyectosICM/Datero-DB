USE daterodb;

-- select @@lower_case_table_names;
--------------------------------------------------------
-- EMPRESAS --
CALL AGREGAR_EMPRESAS('SurfaceItn',1);
CALL AGREGAR_EMPRESAS('IMPORTPERIO',1);

-- RUTAS --
CALL AGREGAR_RUTAS('A023',1,1);
CALL AGREGAR_RUTAS('B054',1,1);
CALL AGREGAR_RUTAS('C323',1,1);
CALL AGREGAR_RUTAS('C32D',1,2);
CALL AGREGAR_RUTAS('D32T',1,2);
CALL AGREGAR_RUTAS('D354',1,2);

-- DISTRITOS --

CALL AGREGAR_DISTRITOS('SANTA ANITA',1);
CALL AGREGAR_DISTRITOS('ATE',1);
CALL AGREGAR_DISTRITOS('EL AGUSTINO',1);
CALL AGREGAR_DISTRITOS('LA VICTORIA',1);
CALL AGREGAR_DISTRITOS('CERCADO DE LIMA',1);
CALL AGREGAR_DISTRITOS('CALLAO',1);
CALL AGREGAR_DISTRITOS('HUAYCAN',1);
CALL AGREGAR_DISTRITOS('SAN JUAN DE LURIGANCHO',1);
CALL AGREGAR_DISTRITOS('RIMAC',1);
CALL AGREGAR_DISTRITOS('SAN MIGUEL',1);


-- PARADEROS --
CALL AGREGAR_PARADEROS(1,'Puente Santa Anita',1);
CALL AGREGAR_PARADEROS(1,'Perales',1);
CALL AGREGAR_PARADEROS(1,'Ovalo Santa Anita',1);
CALL AGREGAR_PARADEROS(1,'Mall de Santa Anita',1);
CALL AGREGAR_PARADEROS(1,'Andahuaylas',1);

-- RP --

CALL AGREGAR_RP(1, 1, 1, 3);
CALL AGREGAR_RP(1, 2, 4, 3);
CALL AGREGAR_RP(1, 3, 2, 3);
CALL AGREGAR_RP(1, 1, 1, 2);
CALL AGREGAR_RP(1, 2, 4, 2);
CALL AGREGAR_RP(1, 3, 3, 2);

-- ROLES --
CALL AGREGAR_ROLES(1,'ADMINISTRADOR');
CALL AGREGAR_ROLES(1,'CONDUCTOR');

-- TRABAJADORES --
CALL AGREGAR_TRABAJADORES('JUAN', 'TORRES', '78547689', 1,'ADMIN1','1212', 1, 1);
CALL AGREGAR_TRABAJADORES('ALEXIS', 'NOLASCO', '78547689', 1, 'ADMIN2','1212', 1, 1);
CALL AGREGAR_TRABAJADORES('MARCO', 'SUAREZ', '78547689', 1, 'ADMIN3','1212', 1, 1);
CALL AGREGAR_TRABAJADORES('RODRIGO', 'MARTINES', '78547689', 1, 'ADMIN4','1212', 1, 1);
CALL AGREGAR_TRABAJADORES('MARCO', 'SUAREZ', '78547689', 1, 'ADMIN5','1212', 1, 1);
CALL AGREGAR_TRABAJADORES('RODRIGO', 'MARTINES', '78547689', 1, 'ADMIN6','1212', 1, 2);
CALL AGREGAR_TRABAJADORES('MARCO', 'SUAREZ', '78547689', 1, 'ADMIN7','1212', 1, 2);
CALL AGREGAR_TRABAJADORES('RODRIGO', 'MARTINES', '78547689', 1, 'ADMIN8','1212', 1, 2);
CALL AGREGAR_TRABAJADORES('MARCO', 'SUAREZ', '78547689', 1, 'ADMIN9','1212', 1, 2);
CALL AGREGAR_TRABAJADORES('RODRIGO', 'MARTINES', '78547689', 1, 'ADMIN10','1212', 1, 2);


-- BUSES --

CALL AGREGAR_BUSES(1,'MERCEDES', 'A2C-105', 2, 2, 1);
CALL AGREGAR_BUSES(1,'MERCEDES', 'A2C-145', 2, 2, 1);
CALL AGREGAR_BUSES(1,'MERCEDES', 'A2C-265', 2, 2, 1);
CALL AGREGAR_BUSES(1,'MERCEDES', 'A3C-13L', 2, 2, 1);
CALL AGREGAR_BUSES(1,'MERCEDES', 'A4C-523', 2, 2, 1);

CALL AGREGAR_BUSES(1,'NISSAN', 'ABC-001', 1, 3, 1);
CALL AGREGAR_BUSES(1,'MERCEDES', 'ABC-1D5', 1, 3, 1);
CALL AGREGAR_BUSES(1,'MERCEDES', 'ABC-105', 1, 3, 1);
CALL AGREGAR_BUSES(1,'MERCEDES', 'ABC-145', 1, 3, 1);
CALL AGREGAR_BUSES(1,'MERCEDES', 'ABC-265', 1, 3, 1);
CALL AGREGAR_BUSES(1,'MERCEDES', 'ABC-13L', 1, 3, 1);
CALL AGREGAR_BUSES(1,'MERCEDES', 'ABC-523', 1, 3, 1);

CALL AGREGAR_BUSES(1,'MERCEDES', 'B2C-105', 1, 4, 1);
CALL AGREGAR_BUSES(1,'MERCEDES', 'B2C-145', 1, 4, 1);
CALL AGREGAR_BUSES(1,'MERCEDES', 'B2C-265', 1, 4, 1);
CALL AGREGAR_BUSES(1,'MERCEDES', 'B3C-13L', 1, 4, 1);
CALL AGREGAR_BUSES(1,'MERCEDES', 'B4C-523', 1, 4, 1);

--------------------------------------------------------
-- CONSULTAS AVANZADAS --
--------------------------------------------------------
--------------------------------------------------------
-- Insercion de datos en procedimientos alamcenados --


-- CALL EMPEST(1);
--------------------------------------------------------
-- CONSULTAS AVANZADAS --
--------------------------------------------------------


CALL LISTAR_PARADEROS_DE_RUTA_IDA(1);
CALL LISTAR_PARADEROS_DE_RUTA_VUELTA(1);

CALL BUSESXEMPT(1); 
CALL BUSESXEMPH(0,1); 
CALL BUSESXEMPD(1); 

CALL TRABAJADORXEMPT(1);
CALL TRABAJADORXEMPH(1,1);
CALL TRABAJADORXEMPR(1,1,2);

CALL RUTASXEMPT(1);
CALL RUTASXEMPH(1);
CALL RUTASXEMPD(1);

CALL DISH(1);

CALL ROLESXH(1);

CALL PARH(1);

CALL PARADEROXRUTA(1);

CALL EMPRESASH(1);


