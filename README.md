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
 

