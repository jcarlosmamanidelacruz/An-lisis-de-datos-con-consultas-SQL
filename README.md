# Análisis de datos con consultas SQL - PostgreSQL

Este proyecto tiene como objetivo realizar análisis de datos directamente desde la fuente de datos utilizando consultas SQL. La base de datos está estructurada para almacenar información específica de importaciones vehiculares. Todo el proceso de modelamiento de datos se realizó en un proyecto anterior compartido en Git, el cual se puede encontrar <a href="https://github.com/jcarlosmamanidelacruz/Postgresq-modelado-y-carga-de-datos" target="_blank"> Postgresq-modelado-y-carga-de-datos </a>.

**Preguntas Principales de Análisis:**

1.   ¿Cuál es el total de valor del Costo, Seguro y Flete (CIF) de las importaciones por país en un año específico, , ordenado por el total de CIF en orden descendente?
2.   ¿Cuál es el valor total y el valor promedio de impuestos recaudados por años de las importaciones vehiculares?
3.   ¿Cuál es el total de impuestos recaudados por tipo de importador en un año específico?
4.   ¿Cuál es la aduana que ha recaudado más ingresos en un año determinado, ordenado por el total de ingresos en orden descendente?
5.   ¿Cuáles son las 5 aduanas con el mayor número de importaciones de BUSES en términos de cantidad de vehículos?
6.   ¿Cuál es el total de impuestos registrados para cada período de tiempo en un año determinado, ordenado por el total de impuestos de forma descendente?
7.   ¿Cuál es el total de impuestos registrados por año y cuánto fue en el año siguiente?
8.   ¿Cuál es el total de impuestos por país para la aduana que ha tenido el mayor cantidad de importaciones durante el año 2019, ordenado por el total de impuestos de forma descendente?

## Estructura del Proyecto:

**data/:** Carpeta que contiene el archivo de datos de importaciones vehiculares.<br>
**sql/:** Carpeta que contiene los archivos SQL.

   - **create_tables.sql:** Script para crear las tablas en la base de datos.
   - **querys.sql:** Script con las consultas para cada pregunta de análisis.

**README.md:** Documento que proporciona una descripción general del proyecto, las preguntas de análisis y la estructura del proyecto.

## Instrucciones para Configurar y Cargar los Datos

1. Clona este repositorio en tu máquina local.
2. Abre tu cliente de PostgreSQL o cualquier otro cliente de SQL que prefieras.
3. Utiliza el cliente para cargar el script **create_tables.sql** y crear las tablas en la base de datos. Por lo general, puedes abrir el archivo en el cliente y ejecutarlo directamente.
4. Una vez creadas las tablas, carga el archivo **querys.sql** en tu cliente de SQL.
5. Ejecuta las consultas SQL desde el archivo cargado para obtener los resultados de análisis.
6. Explora los resultados y realiza el análisis correspondiente.

------------
## Capturas de Pantalla
------------

## Script SQL - Creación de Tablas

[![create-tables.png](https://i.postimg.cc/mgX2KN3K/create-tables.png)](https://postimg.cc/ts6jx6Mz)

## Modelo Relacional de Base de Datos OLTP

[![modelo-fisico-oltp.png](https://i.postimg.cc/DyN17wwF/modelo-fisico-oltp.png)](https://postimg.cc/mtQPwR96)

## Análisis de Datos y Capturas de Resultados

1.   ¿Cuál es el total de valor del Costo, Seguro y Flete (CIF) de las importaciones por país en un año específico, , ordenado por el total de CIF en orden descendente?

	select tc.nombre_pais_origen, sum(valor_cif) valor_cif
	from importaciones_db.importacion ta
		left join importaciones_db.pais_aduana tb on ta.id_pais_id_aduana = tb.id_pais_id_aduana
		left join importaciones_db.pais_origen tc on tb.id_pais_origen = tc.id_pais_origen
	where extract('year' from fecha_importacion)  = 2019
	group by tc.nombre_pais_origen
	order by 2 desc;

 [![consuta1.png](https://i.postimg.cc/LX3SYnwD/consuta1.png)](https://postimg.cc/G8tV6hcT)
 
2.   ¿Cuál es el valor total y el valor promedio de impuestos recaudados por años de las importaciones vehiculares?

	select
		extract('year' from fecha_importacion) as año,
		sum(impuesto)::numeric(15, 3) total,
		avg(impuesto)::numeric(15, 3) promedio
	from importaciones_db.importacion ta
	group by extract('year' from fecha_importacion)
	order by 1 desc;

 [![consuta2.png](https://i.postimg.cc/TY8SMRsY/consuta2.png)](https://postimg.cc/jCXvyrKG)
 
3.   ¿Cuál es el total de impuestos recaudados por tipo de importador en un año específico?
	
	select
		tb.nombre_tipo_importador,
		sum(impuesto) total
	from importaciones_db.importacion ta
		left join importaciones_db.tipo_importador tb on ta.id_tipo_importador = tb.id_tipo_importador
	where extract('year' from fecha_importacion)  = 2019
	group by tb.nombre_tipo_importador
	order by 1;
 
 [![consuta3.png](https://i.postimg.cc/3Jngj125/consuta3.png)](https://postimg.cc/yk3gsFfv)
 
4.   ¿Cuál es la aduana que ha recaudado más ingresos en un año determinado, ordenado por el total de ingresos en orden descendente?

 	select tc.nombre_aduana_ingreso, sum(valor_cif) valor_cif
	from importaciones_db.importacion ta
		left join importaciones_db.pais_aduana tb on ta.id_pais_id_aduana = tb.id_pais_id_aduana
		left join importaciones_db.aduana_ingreso tc on tb.id_aduana_ingreso = tc.id_aduana_ingreso
	where extract('year' from fecha_importacion)  = 2019
	group by tc.nombre_aduana_ingreso
	order by 2 desc;

[![consuta4.png](https://i.postimg.cc/4yXWydRz/consuta4.png)](https://postimg.cc/DJYrY7ZZ)

5.   ¿Cuáles son las 5 aduanas con el mayor número de importaciones de BUSES en términos de cantidad de vehículos?

	select tc.nombre_aduana_ingreso, count(*) cantidad_importaciones
	from importaciones_db.importacion ta
		left join importaciones_db.pais_aduana tb on ta.id_pais_id_aduana = tb.id_pais_id_aduana
		left join importaciones_db.aduana_ingreso tc on tb.id_aduana_ingreso = tc.id_aduana_ingreso
		left join importaciones_db.tipo_vehiculo td on ta.id_tipo_vehiculo = td.id_tipo_vehiculo
	where td.nombre_tipo_vehiculo = 'BUS'
	group by tc.nombre_aduana_ingreso
	order by 2 desc
	limit 5;

[![consuta5.png](https://i.postimg.cc/zXG1PDHb/consuta5.png)](https://postimg.cc/7bdc5kVw)

6.   ¿Cuál es el total de impuestos registrados para cada período de tiempo en un año determinado, ordenado por el total de impuestos de forma descendente?

	select
		substr(fecha_importacion::varchar, 1, 7) as periodo,
		sum(impuesto) total
	from importaciones_db.importacion ta
	where extract('year' from fecha_importacion)  = 2017
	group by substr(fecha_importacion::varchar, 1, 7)
	order by 2 desc;

 [![consuta6.png](https://i.postimg.cc/D01GRVjm/consuta6.png)](https://postimg.cc/n9cMQWtt)
 
7.   ¿Cuál es el total de impuestos registrados por año y cuánto fue en el año siguiente?

	select
		substr(fecha_importacion::varchar, 1, 4) as periodo,
		sum(impuesto) total,
		LEAD(SUM(impuesto), 1) OVER (ORDER BY substr(fecha_importacion::varchar, 1, 4)) AS importacion_siguiente_anio
	from importaciones_db.importacion ta
	group by substr(fecha_importacion::varchar, 1, 4)
	order by 2 desc;

 [![consuta7.png](https://i.postimg.cc/SRjSzc84/consuta7.png)](https://postimg.cc/T5MMzLCN)
 
8.   ¿Cuál es el total de impuestos por país para la aduana que ha tenido el mayor cantidad de importaciones durante el año 2019, ordenado por el total de impuestos de forma descendente?
	
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

[![consuta8.png](https://i.postimg.cc/MGcgRt3d/consuta8.png)](https://postimg.cc/cKSDG7Sn)
