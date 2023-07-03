SELECT p.nombre as Ciudad, count(m.id_hogar) as "Cantidad de hogares"
	FROM enumi.miduvi m 
    	INNER JOIN enumi.parroquias p ON m.ciudad = p.idParroquia
    GROUP BY p.nombre
	ORDER BY count(m.id_hogar) DESC;

SELECT f.donde_obtiene_agua, count(m.id_hogar) as "Cantidad de hogares"
	FROM enumi.miduvi m
		INNER JOIN enumi.fuentes_agua f ON f.vi10 = m.vi10
	GROUP BY f.donde_obtiene_agua
	ORDER BY count(m.id_hogar) DESC;

SELECT p.nombre as Ciudad, count(DISTINCT idC_Salud) as "Cantidad de centros de salud", count(DISTINCT m.id_hogar) as "Cantidad de hogares"
	FROM enumi.parroquias p
		INNER JOIN enumi.centros_salud c ON c.Parroquia_idParroquia = p.idParroquia
		INNER JOIN enumi.miduvi m ON m.ciudad = p.idParroquia
	GROUP BY p.nombre
	ORDER BY count(DISTINCT idC_Salud) DESC;

SELECT c.nombre as Canton, count(DISTINCT idTerminal) as "Cantidad de Terminales Terrestres"
	FROM enumi.parroquias p
		INNER JOIN enumi.cantones c ON c.idCanton = p.Canton_idCanton
		INNER JOIN enumi.Terminales_Terrestres t ON t.Parroquia_idParroquia = p.idParroquia
		INNER JOIN enumi.miduvi m ON m.ciudad = p.idParroquia
	GROUP BY c.nombre;

SELECT pr.nombre as Provincia, count(DISTINCT idLugares_Turisticos) as "Cantidad de lugares de interés"
	FROM enumi.parroquias p
		INNER JOIN enumi.cantones c ON c.idCanton = p.Canton_idCanton
		INNER JOIN enumi.provincias pr ON c.Provincia_cod = pr.cod
		INNER JOIN enumi.lugares_turisticos l ON l.Parroquia_idParroquia = p.idParroquia
		INNER JOIN enumi.miduvi m ON m.ciudad = p.idParroquia
	GROUP BY pr.nombre
	ORDER BY count(DISTINCT idLugares_Turisticos) DESC;

SELECT pr.nombre as Provincia, count(DISTINCT idAeropuerto) as "Cantidad de aeropuertos"
	FROM enumi.parroquias p
		INNER JOIN enumi.cantones c ON c.idCanton = p.Canton_idCanton
		INNER JOIN enumi.provincias pr ON c.Provincia_cod = pr.cod
		INNER JOIN enumi.aeropuertos a ON a.Parroquia_idParroquia = p.idParroquia
		INNER JOIN enumi.miduvi m ON m.ciudad = p.idParroquia
	GROUP BY pr.nombre;

SELECT c.nombre as Canton, c.Poblacion as Poblacion, count(DISTINCT m.id_hogar) as "Cantidad de hogares", count(DISTINCT m.id_vivienda) as "Cantidad de viviendas"
	FROM enumi.parroquias p
		INNER JOIN enumi.cantones c ON c.idCanton = p.Canton_idCanton
		INNER JOIN enumi.miduvi m ON m.ciudad = p.idParroquia
	GROUP BY c.nombre
	ORDER BY c.Poblacion DESC;

SELECT p.nombre as Ciudad, count(m.id_hogar) as "Cantidad de hogares que tiene un espacio exclusivo para concinar y uno o más vehículos"
	FROM enumi.miduvi m 
    	INNER JOIN enumi.parroquias p ON m.ciudad = p.idParroquia
	WHERE m.vi07b = 1 AND m.vi1511 = 1
    GROUP BY p.nombre
	HAVING count(m.id_hogar) > 19
	ORDER BY count(m.id_hogar) DESC;