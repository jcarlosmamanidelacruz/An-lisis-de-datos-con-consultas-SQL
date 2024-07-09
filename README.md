# Análisis de datos con consultas SQL - PostgreSQL

Este proyecto tiene como objetivo realizar análisis de datos directamente desde la fuente de datos utilizando consultas SQL. La base de datos está estructurada para almacenar información específica de importaciones vehiculares. Todo el proceso de modelamiento de datos se realizó en un proyecto anterior compartido en Git, el cual se puede encontrar <a href="https://github.com/jcarlosmamanidelacruz/Postgresq-modelado-y-carga-de-datos" target="_blank"> Postgresq-modelado-y-carga-de-datos </a>.

### **Preguntas Principales de Análisis:**

1.   ¿Cuál es el total de valor del Costo, Seguro y Flete (CIF) de las importaciones por país en un año específico, , ordenado por el total de CIF en orden descendente?

2.   ¿Cuál es el valor total y el valor promedio de impuestos recaudados por años de las importaciones vehiculares?

3.   ¿Cuál es el total de impuestos recaudados por tipo de importador en un año específico?

4.   ¿Cuál es la aduana que ha recaudado más ingresos en un año determinado, ordenado por el total de ingresos en orden descendente?

5.   ¿Cuáles son las 5 aduanas con el mayor número de importaciones de BUSES en términos de cantidad de vehículos?

6.   ¿Cuál es el total de impuestos registrados para cada período de tiempo en un año determinado, ordenado por el total de impuestos de forma descendente?

7.   ¿Cuál es el total de impuestos registrados por año y cuánto fue en el año siguiente?

8.   ¿Cuál es el total de impuestos por país para la aduana que ha tenido el mayor cantidad de importaciones durante el año 2019, ordenado por el total de impuestos de forma descendente?

## Comandos SQL Utilizados en el Análisis

Para desarrollar y responder las preguntas de análisis planteadas en este proyecto, se han utilizado diversos comandos y técnicas SQL avanzadas. A continuación, se detallan algunos de los comandos más importantes empleados:

### SELECT

El comando SELECT se utiliza para seleccionar datos de una base de datos. Es uno de los comandos más fundamentales en SQL.

### GROUP BY

El comando GROUP BY se utiliza para agrupar filas que tienen los mismos valores en columnas especificadas en grupos.

### ORDER BY

El comando ORDER BY se utiliza para ordenar el conjunto de resultados de una consulta SQL por una o más columnas.

### JOINs (LEFT JOIN, INNER JOIN)

Los comandos JOIN se utilizan para combinar filas de dos o más tablas, basadas en una columna relacionada entre ellas. En este proyecto, se utilizaron LEFT JOIN e INNER JOIN para combinar tablas.

### EXTRACT

La función EXTRACT se utiliza para extraer subpartes de una fecha, como el año o el mes.

### WHERE

El comando WHERE se utiliza para filtrar registros que cumplen una condición especificada.

### SUBSTR

La función SUBSTR se utiliza para extraer una subcadena de una cadena.

### SUBCONSULTAS

Las subconsultas se utilizan para ejecutar una consulta dentro de otra consulta.

## Descripción de Tablas y Relaciones

#### 1. Tabla: importaciones_db.marca

**Descripción:** Contiene información sobre las marcas de los vehículos.

**Columnas:**
- **id_marca: **Identificador único de la marca (Clave primaria).
- **nombre_marca:** Nombre de la marca (Único).

**Relaciones:** Relacionada con importaciones_db.linea_modelo.

#### 2. Tabla: importaciones_db.tipo_combustible

**Descripción:** Contiene información sobre los tipos de combustible de los vehículos.

**Columnas:**

- **id_tipo_combustible:** Identificador único del tipo de combustible (Clave primaria).
- **nombre_tipo_combustible:** Nombre del tipo de combustible (Único).

**Relaciones:** Relacionada con importaciones_db.importacion.

#### 3. Tabla: importaciones_db.tipo_vehiculo

**Descripción:** Contiene información sobre los tipos de vehículos.

**Columnas:**
- **id_tipo_vehiculo:** Identificador único del tipo de vehículo (Clave primaria).
- **nombre_tipo_vehiculo:** Nombre del tipo de vehículo (Único).

**Relaciones:** Relacionada con importaciones_db.importacion.

#### 4. Tabla: importaciones_db.tipo_importador

**Descripción:** Contiene información sobre los tipos de importadores.
Columnas:
- **id_tipo_importador:** Identificador único del tipo de importador (Clave primaria).
- **nombre_tipo_importador:** Nombre del tipo de importador (Único).

**Relaciones:** Relacionada con importaciones_db.importacion.

#### 5. Tabla: importaciones_db.modelo_lanzamiento

**Descripción:** Contiene información sobre los modelos de lanzamiento de los vehículos.

**Columnas:**
- **id_modelo_lanzamiento:** Identificador único del modelo de lanzamiento (Clave primaria).
- **anio:** Año del modelo de lanzamiento (Único).

**Relaciones:** Relacionada con importaciones_db.linea_modelo.

#### 6. Tabla: importaciones_db.linea

**Descripción:** Contiene información sobre las líneas de vehículos.

**Columnas:**
- **id_linea:** Identificador único de la línea (Clave primaria).
- **nombre_linea:** Nombre de la línea (Único).

**Relaciones:** Relacionada con importaciones_db.linea_modelo

#### 7. Tabla: importaciones_db.pais_origen

**Descripción:** Contiene información sobre los países de origen de los vehículos.

**Columnas:**
- **id_pais_origen:** Identificador único del país de origen (Clave primaria).
- **nombre_pais_origen**: Nombre del país de origen (Único).

**Relaciones:** Relacionada con importaciones_db.pais_aduana.

#### 8. Tabla: importaciones_db.aduana_ingreso

**Descripción**: Contiene información sobre las aduanas de ingreso de los vehículos.

**Columnas:**
- **id_aduana_ingreso:** Identificador único de la aduana de ingreso (Clave primaria).
- **nombre_aduana_ingreso:** Nombre de la aduana de ingreso (Único).

**Relaciones:** Relacionada con importaciones_db.pais_aduana.

#### 9. Tabla: importaciones_db.pais_aduana

**Descripción:** Relaciona los países de origen con las aduanas de ingreso.

**Columnas:**
- **id_pais_id_aduana: Identificador único de la relación (Clave primaria).
- **id_pais_origen: Identificador del país de origen (Clave foránea).
- **id_aduana_ingreso: Identificador de la aduana de ingreso (Clave foránea).

**Relaciones:**
id_pais_origen referencia a importaciones_db.pais_origen(id_pais_origen).
id_aduana_ingreso referencia a importaciones_db.aduana_ingreso(id_aduana_ingreso).

#### 10. Tabla: importaciones_db.linea_modelo

**Descripción:** Relaciona las líneas de vehículos con los modelos de lanzamiento y las marcas.

**Columnas:**
- **id_linea_modelo:** Identificador único de la relación (Clave primaria).
- **id_linea:** Identificador de la línea (Clave foránea).
- **id_modelo_lanzamiento:** Identificador del modelo de lanzamiento (Clave foránea).
- **id_marca:** Identificador de la marca (Clave foránea).

**Relaciones:**
id_linea referencia a importaciones_db.linea(id_linea).
id_modelo_lanzamiento referencia a importaciones_db.modelo_lanzamiento(id_modelo_lanzamiento).
id_marca referencia a importaciones_db.marca(id_marca).

#### 11. Tabla: importaciones_db.importacion

**Descripción:** Contiene información sobre las importaciones de vehículos.

**Columnas:**
- **id_importacion:** Identificador único de la importación (Clave primaria).
- **id_pais_id_aduana:** Identificador de la relación país-aduana (Clave foránea).
- **id_linea_modelo:** Identificador de la relación línea-modelo (Clave foránea).
- **id_tipo_vehiculo:** Identificador del tipo de vehículo (Clave foránea).
- **id_tipo_combustible:** Identificador del tipo de combustible (Clave foránea).
- **id_tipo_importador:** Identificador del tipo de importador (Clave foránea).
- **fecha_importacion:** Fecha de la importación.
- **valor_cif:** Valor CIF de la importación.
- **impuesto:** Impuesto sobre la importación.
- **puertas:** Número de puertas del vehículo.
- **tonelaje:** Tonelaje del vehículo.
- **asientos:** Número de asientos del vehículo.

**Relaciones:**
id_pais_id_aduana referencia a importaciones_db.pais_aduana(id_pais_id_aduana).
id_linea_modelo referencia a importaciones_db.linea_modelo(id_linea_modelo).
id_tipo_vehiculo referencia a importaciones_db.tipo_vehiculo(id_tipo_vehiculo).
id_tipo_combustible referencia a importaciones_db.tipo_combustible(id_tipo_combustible).
id_tipo_importador referencia a importaciones_db.tipo_importador(id_tipo_importador).

## Modelo Relacional de Base de Datos OLTP

<img src="https://i.postimg.cc/DyN17wwF/modelo-fisico-oltp.png" alt="">

## Estructura del Proyecto:

**sql/:** Carpeta que contiene los archivos SQL.<br>

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

## Capturas de Pantalla

## Script SQL - Creación de Tablas

<img src="https://i.postimg.cc/mgX2KN3K/create-tables.png" alt="">

## Análisis de Datos y Capturas de Resultados

¿Cuál es el total de valor del Costo, Seguro y Flete (CIF) de las importaciones por país en un año específico, , ordenado por el total de CIF en orden descendente?

	select tc.nombre_pais_origen, sum(valor_cif) valor_cif
	from importaciones_db.importacion ta
		left join importaciones_db.pais_aduana tb on ta.id_pais_id_aduana = tb.id_pais_id_aduana
		left join importaciones_db.pais_origen tc on tb.id_pais_origen = tc.id_pais_origen
	where extract('year' from fecha_importacion)  = 2019
	group by tc.nombre_pais_origen
	order by 2 desc;

 [![consuta1.png](https://i.postimg.cc/LX3SYnwD/consuta1.png)](https://postimg.cc/G8tV6hcT)

¿Cuál es el valor total y el valor promedio de impuestos recaudados por años de las importaciones vehiculares?

	select
		extract('year' from fecha_importacion) as año,
		sum(impuesto)::numeric(15, 3) total,
		avg(impuesto)::numeric(15, 3) promedio
	from importaciones_db.importacion ta
	group by extract('year' from fecha_importacion)
	order by 1 desc;

<img src="https://i.postimg.cc/TY8SMRsY/consuta2.png" alt="">

¿Cuál es el total de impuestos recaudados por tipo de importador en un año específico?

	select
		tb.nombre_tipo_importador,
		sum(impuesto) total
	from importaciones_db.importacion ta
		left join importaciones_db.tipo_importador tb on ta.id_tipo_importador = tb.id_tipo_importador
	where extract('year' from fecha_importacion)  = 2019
	group by tb.nombre_tipo_importador
	order by 1;

<img src="https://i.postimg.cc/3Jngj125/consuta3.png" alt="">

¿Cuál es la aduana que ha recaudado más ingresos en un año determinado, ordenado por el total de ingresos en orden descendente?

 	select tc.nombre_aduana_ingreso, sum(valor_cif) valor_cif
	from importaciones_db.importacion ta
		left join importaciones_db.pais_aduana tb on ta.id_pais_id_aduana = tb.id_pais_id_aduana
		left join importaciones_db.aduana_ingreso tc on tb.id_aduana_ingreso = tc.id_aduana_ingreso
	where extract('year' from fecha_importacion)  = 2019
	group by tc.nombre_aduana_ingreso
	order by 2 desc;

<img src="https://i.postimg.cc/4yXWydRz/consuta4.png" alt="">

¿Cuáles son las 5 aduanas con el mayor número de importaciones de BUSES en términos de cantidad de vehículos?

	select tc.nombre_aduana_ingreso, count(*) cantidad_importaciones
	from importaciones_db.importacion ta
		left join importaciones_db.pais_aduana tb on ta.id_pais_id_aduana = tb.id_pais_id_aduana
		left join importaciones_db.aduana_ingreso tc on tb.id_aduana_ingreso = tc.id_aduana_ingreso
		left join importaciones_db.tipo_vehiculo td on ta.id_tipo_vehiculo = td.id_tipo_vehiculo
	where td.nombre_tipo_vehiculo = 'BUS'
	group by tc.nombre_aduana_ingreso
	order by 2 desc
	limit 5;

<img src="https://i.postimg.cc/zXG1PDHb/consuta5.png" alt="">

¿Cuál es el total de impuestos registrados para cada período de tiempo en un año determinado, ordenado por el total de impuestos de forma descendente?

	select
		substr(fecha_importacion::varchar, 1, 7) as periodo,
		sum(impuesto) total
	from importaciones_db.importacion ta
	where extract('year' from fecha_importacion)  = 2017
	group by substr(fecha_importacion::varchar, 1, 7)
	order by 2 desc;

<img src="https://i.postimg.cc/D01GRVjm/consuta6.png" alt="">

¿Cuál es el total de impuestos registrados por año y cuánto fue en el año siguiente?

	select
		substr(fecha_importacion::varchar, 1, 4) as periodo,
		sum(impuesto) total,
		LEAD(SUM(impuesto), 1) OVER (ORDER BY substr(fecha_importacion::varchar, 1, 4)) AS importacion_siguiente_anio
	from importaciones_db.importacion ta
	group by substr(fecha_importacion::varchar, 1, 4)
	order by 2 desc;

<img src="https://i.postimg.cc/SRjSzc84/consuta7.png" alt="">

 ¿Cuál es el total de impuestos por país para la aduana que ha tenido el mayor cantidad de importaciones durante el año 2019, ordenado por el total de impuestos de forma descendente?

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

<img src="https://i.postimg.cc/MGcgRt3d/consuta8.png" alt="">
