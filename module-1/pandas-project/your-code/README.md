# Limpieza y manipulación de datos con Pandas

## Pasos dados 

**Importación de los datos:**

El primer problema para el desarrollo del proyecto surgió al importar el fichero csv de la base de datos. Había que modificar el encoding del fichero para una correctura lectura. De ahí igualar el valor encoding a "ISO-8859-1"

**Limpieza y manipulación de los datos:**

Tras un primer análisis del tipo de datos que contiene la base, decidí enfocar la resolución del proyecto bajo la siguiente premisa: Estadísticamente los ataques de tiburones como causa de la muerte de una personason son irrisorios si se comparan con otro tipo de accidentes o sucesos (tráfico) o, por supuesto, enfermedades. Por lo tanto, me pareció interesante intentar analizar bajo qué circunstancias se producen esos ataques y sus consecuencias:

- ¿Responden a un mecanismo de defensa de los tiburones?
- ¿Son provocados por las "víctimas"?
- ¿Cuál es su grado de letalidad?
- ¿Qué tipo de heridas puede provocar un tiburón?

Con el objetivo de responder a estas preguntas uno de los primeros pasos, una vez importados los datos, fue la elección de las 
columnas con las que iba a trabajar, así como establecer una fecha a partir de la cual sustentar el análisis.

Aunque la base contiene datos que se remontan incluso a finales del siglo XIX, no consideré útil iniciar el análisis en esa fecha. Finalmente, opté por establecer el límite en la década de los 90 hasta la actualidad. Fue una decisión que adopté tras leer
que los propios responsables de la base alertan de que se tomen con cautela los datos anteriores por la inconsistencia, en algunos casos, de los mismos. No se puede comparar la capacidad para recopilar la información hoy en día con la de los años 50 o 1890.

Una vez fijado el límite de columnas y el temporal con el que quería trabajar, y una vez eliminados los conjuntos de datos que se situaban más allá de esos límites, comencé a hacer una limpieza pormenorizada de las celdas. En concreto, de la columna "Fatal", la que establece si un ataque se ha saldado con una muerte o no, y la de "Sex", relativa al sexo de las víctimas. Además, opté por agrupar en ocho categorías los múltiples datos almacenados en la columna "Injury", sobre el tipo de hersidas provocadas por los ataques de tiburones.

Las ocho categorías son: "Bitten", "Fatal", "Injured", "No injury", "No personal injury", "No shark", "Severed", "Unknown".

En la primera de ellas, "Bitten", he agrupado todas las mordeduras enumeradas en la base independientemente del miembro atacado (brazo, pierna) o cualquier otro detalle. La segunda, "Fatal", agrupa todos aquellos ataques que han supuesto la muerte de una persona. "Injured" recopila todas las heridas detalladas, incluye términos como arañazos, magulladuras, pinchazos, roturas... Por su parte, "No injury" recopila todos aquellos casos en los que no se tiene constancia de ningúna herida, mientras "No personal injury" agrupa los daños en objetos, por ejemplo, barcos. "No shark" condensa aquellos ataques que en un principio se achacaron a un tiburón pero luego se demostró que estuvieron protagonizados por otros animales, así como aquellos casos que no se han podido confirmar. "Severed" recopila los ataques en los que ha habido constancia de la amputación de algún miembro y "Unknown", aquellos en los que no se específica qué tipo de heridas produjo el ataque de un tiburón.

El agrupar toda esa información en ocho categorías ha sido lo más complicado, y aunque ese análisis y posterior distribución se ha hecho en varias fases, atendiendo lo máximo posible a la información aportada en cada caso, no se podría descartar algún error en la atribución de un suceso determinado a una categoría concreta.

**Análisis de los datos y algunas de las conclusiones que se pueden extraer:**

- El grado de supervivencia tras el ataque de un tiburón, en la mayoría de los supuestos, supera con creces el de muertes. En los ataques no provocados por la acción del hombre en los casi 30 años estudiados, se han registrado 233 muertes por 1707 casos en los que las víctimas han sobrevivido. También la proporción es muy alta en aquellos casos en los que la víctima provocó de alguna forma el ataque (166 supervivientes frente a cuatro muertes para el mismo periodo).
Las cifras solo se invierten en un supuesto, en el de los ataques ligados a un suceso previo, por ejemplo, el hundimiento de un barco. La proporación entonces es de 11 muertes por 8 casos en los que las víctimas consiguieron salvar la vida.
- El grueso de las heridas (862) se agurpan en la cateogría "Injured", es decir, cortes, roturas, arañazos, pinchazos. La segunda categoría más numerosa es la de los mordiscos (490), mientras que los casos de los que se tiene constancia y que han obligado a la amputación de un miembro suman 114.
- La evolución del acumulado de accidentes por año dibuja una línea ascendente, si bien la subida habría que analizarla con cautela. La mejora en la recopilación de la información podria ser una de las causas de ese incremento. Así, si en 1990 hubo constancia de 36 ataques, en 2016 fueron 81 los casos registrdos, si bien en años previos las cifras fueron mayores (111, 2015; 105, 2013; 103, 2011).
- Por último, también se podría concluir que la imprudencia por parte de bañistas, pescadores o surfistas, en definitiva, de cualquier persona que invade el habitat natural de un tiburón y provoca al animal, ha aumentado. Los ataques en los que medió la provocación de una persona (intentar tocar al animal, por ejemplo) han pasado de 1 en 1990, a 18 de 2009, 13 en 2014 u 8 en 2016, último año del que se tienen registros. No obstante, estas cifras, al igual que las del punto anterior hay que tomarlas con cautela, a los largo de estos años las herramientas para la recopilación de estos casos ha mejorado, y que haya menos supuestos hace 30 o 20 años, no quiere decir que no hubiese casos similares, tal vez que esa información no se pudo obtener. 

**Exportación de los datos:**
Una vez hecho el análisis y limpiado algunas de las columnas (faltarían otras, como la ligada a la actividad que estaba realizando la víctima cuando sufrió el ataque), los datos se han exportado a un nuevo fichero csv. 