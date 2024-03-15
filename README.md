# Análisis de datos con consultas SQL

Este proyecto tiene como objetivo realizar análisis de datos directamente desde la fuente de datos utilizando consultas SQL. La base de datos está estructurada para almacenar información específica de importaciones vehiculares. Todo el proceso de modelamiento de datos se realizó en un proyecto anterior compartido en Git, el cual se puede encontrar <a href="https://github.com/jcarlosmamanidelacruz/Postgresq-modelado-y-carga-de-datos" target="_blank"> Postgresq-modelado-y-carga-de-datos </a>.

**Preguntas Principales de Análisis:**

1.   ¿Cuál es el total de valor CIF de las importaciones por país en un año específico?
2.   ¿Cuál es el producto más importado en términos de cantidad y valor CIF?
3.   ¿Cuál es la tendencia mensual de las importaciones en términos de cantidad y valor CIF?
4.   ¿Cómo varía el valor CIF de las importaciones de vehículos por tipo de vehículo?
5.   ¿Cuál es el total de impuestos recaudados por tipo de impuesto en un año específico?
6.   ¿Cuál es la aduana que ha recaudado más ingresos en un año determinado?
7.   ¿Cómo se compara la cantidad de importaciones entre diferentes países en un año dado?

## Estructura del Proyecto:

**data/:** Carpeta que contiene el archivo de datos de importaciones vehiculares.<br>
**sql/:** Carpeta que contiene los archivos SQL.

   - **create_tables.sql:** Script para crear las tablas en la base de datos.
   - **querys.sql:** Script con las consultas para cada pregunta de análisis.

**README.md:** Documento que proporciona una descripción general del proyecto, las preguntas de análisis y la estructura del proyecto.

## Uso del Proyecto:

1. Clona este repositorio en tu máquina local.
2. Abre tu cliente de PostgreSQL o cualquier otro cliente de SQL que prefieras.
3. Utiliza el cliente para cargar el script **create_tables.sql** y crear las tablas en la base de datos. Por lo general, puedes abrir el archivo en el cliente y ejecutarlo directamente.
4. Una vez creadas las tablas, carga el archivo **querys.sql** en tu cliente de SQL.
5. Ejecuta las consultas SQL desde el archivo cargado para obtener los resultados de análisis.
6. Explora los resultados y realiza el análisis correspondiente.

------------



[![create-tables.png](https://i.postimg.cc/mgX2KN3K/create-tables.png)](https://postimg.cc/ts6jx6Mz)
