-- ¿Cuál es el total de valor del Costo, Seguro y Flete (CIF) de las importaciones por país en un año específico, , ordenado por el total de CIF en orden descendente?

	select tc.nombre_pais_origen, sum(valor_cif) valor_cif
	from importaciones_db.importacion ta
		left join importaciones_db.pais_aduana tb on ta.id_pais_id_aduana = tb.id_pais_id_aduana
		left join importaciones_db.pais_origen tc on tb.id_pais_origen = tc.id_pais_origen
	where extract('year' from fecha_importacion)  = 2019
	group by tc.nombre_pais_origen
	order by 2 desc;

-- ¿Cuál es el valor total y el valor promedio de impuestos recaudados por años de las importaciones vehiculares?

	select
		extract('year' from fecha_importacion) as año,
		sum(impuesto)::numeric(15, 3) total,
		avg(impuesto)::numeric(15, 3) promedio
	from importaciones_db.importacion ta
	group by extract('year' from fecha_importacion)
	order by 1 desc;

-- ¿Cuál es el total de impuestos recaudados por tipo de importador en un año específico?

	select
		tb.nombre_tipo_importador,
		sum(impuesto) total
	from importaciones_db.importacion ta
		left join importaciones_db.tipo_importador tb on ta.id_tipo_importador = tb.id_tipo_importador
	where extract('year' from fecha_importacion)  = 2019
	group by tb.nombre_tipo_importador
	order by 1;
	
-- ¿Cuál es la aduana que ha recaudado más ingresos en un año determinado, ordenado por el total de ingresos en orden descendente?

	select tc.nombre_aduana_ingreso, sum(valor_cif) valor_cif
	from importaciones_db.importacion ta
		left join importaciones_db.pais_aduana tb on ta.id_pais_id_aduana = tb.id_pais_id_aduana
		left join importaciones_db.aduana_ingreso tc on tb.id_aduana_ingreso = tc.id_aduana_ingreso
	where extract('year' from fecha_importacion)  = 2019
	group by tc.nombre_aduana_ingreso
	order by 2 desc;
	
-- ¿Cuáles son las 5 aduanas con el mayor número de importaciones de BUSES en términos de cantidad de vehículos?

	select tc.nombre_aduana_ingreso, count(*) cantidad_importaciones
	from importaciones_db.importacion ta
		left join importaciones_db.pais_aduana tb on ta.id_pais_id_aduana = tb.id_pais_id_aduana
		left join importaciones_db.aduana_ingreso tc on tb.id_aduana_ingreso = tc.id_aduana_ingreso
		left join importaciones_db.tipo_vehiculo td on ta.id_tipo_vehiculo = td.id_tipo_vehiculo
	where td.nombre_tipo_vehiculo = 'BUS'
	group by tc.nombre_aduana_ingreso
	order by 2 desc
	limit 5;
	
-- ¿Cuál es el total de impuestos registrados para cada período de tiempo en un año determinado, ordenado por el total de impuestos de forma descendente?

	select
		substr(fecha_importacion::varchar, 1, 7) as periodo,
		sum(impuesto) total
	from importaciones_db.importacion ta
	where extract('year' from fecha_importacion)  = 2017
	group by substr(fecha_importacion::varchar, 1, 7)
	order by 2 desc;

-- ¿Cuál es el total de impuestos registrados por año y cuánto fue en el año siguiente?

	select
		substr(fecha_importacion::varchar, 1, 4) as periodo,
		sum(impuesto) total,
		LEAD(SUM(impuesto), 1) OVER (ORDER BY substr(fecha_importacion::varchar, 1, 4)) AS importacion_siguiente_anio
	from importaciones_db.importacion ta
	group by substr(fecha_importacion::varchar, 1, 4)
	order by 2 desc;

-- ¿Cuál es el total de impuestos por país para la aduana que ha tenido el mayor cantidad de importaciones durante el año 2019, ordenado por el total de impuestos de forma descendente?

	select tc.nombre_pais_origen, td.nombre_aduana_ingreso, sum(impuesto) total
	from importaciones_db.importacion ta
		left join importaciones_db.pais_aduana tb on ta.id_pais_id_aduana = tb.id_pais_id_aduana
		left join importaciones_db.pais_origen tc on tb.id_pais_origen = tc.id_pais_origen
		left join importaciones_db.aduana_ingreso td on tb.id_aduana_ingreso = td.id_aduana_ingreso
	where extract('year' from fecha_importacion)  = 2019
	and tb.id_aduana_ingreso in (
		select tc.id_aduana_ingreso
		from importaciones_db.importacion ta, importaciones_db.pais_aduana tb, importaciones_db.aduana_ingreso tc
		where extract('year' from fecha_importacion)  = 2019
		and ta.id_pais_id_aduana = tb.id_pais_id_aduana
		and tb.id_aduana_ingreso = tc.id_aduana_ingreso
		group by tc.id_aduana_ingreso
		order by count(*) desc
		limit 1
	)
	group by tc.nombre_pais_origen, td.nombre_aduana_ingreso
	order by sum(impuesto) desc;
	