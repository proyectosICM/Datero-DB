use daterodb;

select * from rp;

SELECT rp.id_rp, r.nom_ruta, p.nom_par
FROM rp INNER JOIN rutas r
ON rp.ruta_id = r.id_ruta
INNER JOIN paraderos p 
ON rp.par_id = p.id_par
WHERE  rp.ruta_id = 1
ORDER BY rp.orden_rp;

SELECT rp.id_rp, r.nom_ruta, p.nom_par
FROM rp INNER JOIN rutas r
ON rp.ruta_id = r.id_ruta
INNER JOIN paraderos p 
ON rp.par_id = p.id_par
WHERE  rp.ruta_id = 2
ORDER BY rp.orden_rp;
 
 DELIMITER //
 CREATE PROCEDURE verRutas(IN rt INT)
 BEGIN
	SELECT rp.id_rp, r.nom_ruta, p.nom_par
	FROM rp INNER JOIN rutas r
	ON rp.ruta_id = r.id_ruta
	INNER JOIN paraderos p 
	ON rp.par_id = p.id_par
	WHERE  rp.ruta_id = rt
	ORDER BY rp.orden_rp;
 END //
 
 CALL verRutas(1);
 CALL verRutas(2);
 
 select * from buses;
 
 DELIMITER //
 CREATE PROCEDURE AgregarBuses(IN est INT, IN mode VARCHAR(30), IN placa VARCHAR(30), IN tra INT) 
 BEGIN
	INSERT INTO buses(est_bus, mod_bus, placa_bus, trabajador_id) VALUES(est, mode, placa, tra);
 END //
 
 CALL AgregarBuses(1, "NISSAN","ABC-001",1);
 
 SELECT b.id_bus,b.mod_bus, b.placa_bus,r.nom_ruta
 FROM buses b 
 INNER JOIN trabajadores t  ON b.trabajador_id = t.id_tra
 INNER JOIN rp ON b.rp_id = rp.id_rp
 INNER JOIN rutas r ON rp.ruta_id = r.id_ruta
 INNER JOIN empresas e ON t.id_emp = e.id_emp;
 
 SELECT * FROM trabajadores;
 
 select * from empresas
 
 
 
 
 
 
 
 
 