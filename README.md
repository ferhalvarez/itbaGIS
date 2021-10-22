# <p align="center">ITBA</p>
# <p align="center">Especialización en Ciencia de Datos</p>
# <p align="center">Análisis de Datos Científicos y Geográficos</p>
## <p align="center">Resultados Elecciones PASO 2021 - Provincia del Chaco</p>

### Integrantes:

* Alvarez, Fernado Hipólito
* San Jose, Mario Alejandro
* Solis, Juan Ignacio Pedro

### Metodología

Para el trabajo se utilizaron los resultados electorales de las PASO 2021 para la Provincia del Chaco obtenidos de la página [Resultados electorales PASO 2021]( https://www.argentina.gob.ar/elecciones/resultados-del-recuento-provisional-de-las-elecciones-paso) así como los circuitos en formato shape de la página [Circuitos Electorales Argentina](https://www.argentina.gob.ar/elecciones/resultados-del-recuento-provisional-de-las-elecciones-paso).

En primer lugar se decidió trabajar con los votos de las elecciones para diputados provinciales descartando en consecuencia los votos para diputados nacionales, en segundo lugar obtuvimos los votos positivos de todas las agrupaciones por circuito (así como los votos positivos totales por circuito) descartanto los votos blancos, nulos, recurridos, etc., en paralelo tambien obtuvimos el agregado de votos por agrupación en el total de la provincia para ordenar la base de mayor a menor cantidad de votos y así obtener las cuatro fuerzas más votadas. Acto seguido utilizamos las las mismas para filtrar nuestra base anterior quedandonos entonces con los votos por circuitos de tan solo cuatro fuerzas.
Todo lo anterior fue realizado con la herramienta de R con el script paso2021_ch_dp.R, en el mismo se encuentra cada paso explicado de forma similar.

Una vez realizado esto se pasó dicha base ya procesada junto con el shape de los circuitos a la herramienta QGIS donde mediante un join se les asigno a cada circuito sus correspondientes datos de la elección, luego de haber subido esta nueva base a PostgreSQL, realizamos a la misma (dentro de QGIS) la consulta que se encuentra en el archivo consult_gis.txt obteniendo como resultado final el porcentaje de votos obtenidos por cada fuerza por departamento.

Finalmente realizamos cuatro mapas coroplecticos pintado cada uno según el porcentaje obtenido por cada fuerza por circuito electoral, concluyendo el trabajo en el pdf "Paso 2021 Chaco.pdf.
