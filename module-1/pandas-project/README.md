Pandas-project

El pandas-project del módulo 1 consiste en limpiar un Dataframe de datos recogidos en relación a los ataques de tiburón producidos alrededor del mundo y a lo largo de la historia, por lo que la cantidad de datos recopilados era muy grande (5992 filas x 24 columnas).
En este sentido lo mas importante ha sido filtrar los datos para elegir con cuál quedarnos y cuáles eran prescindibles.
Lo primero que hemos hecho ha sido una operación para renombrar algunas columnas para que nos fuese más sencillo trabajar con ellas:

	df = df.rename(columns={"Case Number.1": "Uno", "Case Number.2": "Dos", "href formula": "hformula"})  

Como se puede apreciar hemos cambiado el nombre de las columnas “Case Number.1”, “Case Number.2” y “href formula” a “Uno”, “Dos” y “hformula” respectivamente.
El siguiente paso ha sido comprobar si alguna columna tenías todos sus valores nulos, ya que, de este modo, serían completamente prescindibles. A través de la formula “isnull” de Pandas, hemos comprobado que las columnas “Unnamed: 22” y “Unnamed: 23” tenían todos sus valores nulos.
null_cols = df.isnull().sum()
null_cols[null_cols>0]
El siguiente paso ha sido eliminarlas: 
drop_cols = (null_cols[null_cols > 5000].index)
df = df.drop(drop_cols, axis=1)   

Otra de las comprobaciones que hemos hecho ha sido comparar las columnas “Case Number.1” con “Case Number.2” y “href formula” con “href” ya que ha simple vista parecían idénticas. Efectivamente tenían muchos valores en común por lo que hemos decidido eliminar las columnas “Case Number.2” y “href formula”

Siguiendo con la tarea del filtrado, hemos comprobado que no había filas idénticas, y efectivamente así ha sido:
before = len(df)
df = df.drop_duplicates()              
after = len(df)
print (before - after)
Con esta fórmula el resultado es cero, por lo que no hay coincidencias de filas repetidas.

La última operación de filtrado que hemos realizado ha sido eliminar las filas cuyo año de suceso nos parecía irrelevante por el numero de sucesos producidos durante ese periodo de tiempo. Es decir, hemos hecho una suma de los sucesos agrupados en años y hemos obtenido lo siguiente:
year = df["Year"].value_counts()
year
 
 

Vemos que la mayoría de los sucesos se han producido desde 1959 a la actualidad, por lo que vamos a eliminar las columnas de los sucesos que se han producido en años anteriores, ya que han sido muy poco numerosos y los datos de los años son muy dispersos (muy pocos datos, repartidos en un rango de años muy amplio). Además, decidimos eliminar las filas correspondientes al año cero, ya que se consideran erróneos y por lo tanto no confiables ni relevantes:

df2 = df.drop(df[(df.Year < 1959)].index)

El Dataframe resultante está compuesto por 3901 filas × 20 columnas.

El último paso es analizar los datos que hemos conservado. 
1.	pais = df["Country"].value_counts()
USA             1693
AUSTRALIA        668
SOUTH AFRICA     423
BRAZIL            95
BAHAMAS           81

2.	act = df["Activity"].value_counts()

Surfing         891
Swimming        467
Spearfishing    278
Fishing         219
Wading          122


3.	type = df["Type"].value_counts()

Unprovoked      2933
Provoked         368
Invalid          332
Boat             187
Sea Disaster      81

Conclusión:
Vemos que la mayoría de los ataques se han producido en USA (1693), seguido muy de lejos por Australia (668) y South Africa (423). Por otro lado vemos que la principal actividad relacionada con los ataques de tiburón es el surf (891), 467 de los casos han sido a gente que estaba nadando, resulta también llamativo que casi 500 casos tengan que ver con actividades relacionadas con la pesca.
Por último, vemos un dato que destaca en el tipo de ataques, ya que 2.933 casos han sido considerados como no provocados.
