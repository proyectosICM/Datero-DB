select * from rp;

SELECT rp.id_rp, r.nom_ruta, p.nom_par
FROM rp INNER JOIN rutas r
ON rp.ruta_id = r.id_ruta
INNER JOIN paraderos p 
ON rp.par_id = p.id_par
WHERE  rp.ruta_id = 1
ORDER BY rp.orden_rp;
 