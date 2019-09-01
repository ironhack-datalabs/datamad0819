
#Ataque de tiburones

Este proyecto trata sobre un analisis de datos sobre distintos ataques de tiburones ocurrido en distintas zonas del mundo y en distintas fechas para averiguar conclusiones sobre estos ataques.

El dataset del cual se va a realizar este estudio se encuentra en el siguiente [enlace](https://www.kaggle.com/teajay/global-shark-attacks/version/1). Este proyecto se desarrolla sobretodo en dos proyectos de jypiter. Uno destinado a la limpieza de datos y las decisiones tomadas. Y otro al analisis de datos,

##Columnas

- **Case number**: id del ataque. Este dato esta formado por la fecha y una letra indicando si es el primero o más del primer día. Ejemplo: 2016.09.18.c.
- **Date**: fecha con formato 'dd-mm-yy'(num-str-num).
- **Year**: año del ataque, en esta columna solo indica el año.
- **Type**: tipo de ataque.
- **Country**: pais del ataque.
- **Area**: estado/provincia del ataque.
- **Location**: zona/ciudad del ataque,
- **Activity**: actividad realizada la victima.
- **Name**: nombre de la victima. En caso de no conocer el nombre esta puesto su género.
- **Sex**: género de la victima.
- **Age**: edad de la victima.
- **Injury**: lesión de la victima.
- **Fatal (Y/N)**: indica si la victima ha fallecido.
- **Time**: indica la hora que ha ocurrido el ataque. (muy incompleta esta columna).
- **Species**: indica la especie del tiburón. (muy incompleta esta columna).
- **Investigator or Source**: fuente de investigación.
- **pdf**: nombre del pdf del ataque.
- **href formula**: enlace al pdf del ataque.	
- **href**:enlace.
- **Case Number1**: otro "id".    
- **Case Number2**: otro "id".     
- **original order**: order original de los ataques.
- **Unnamed: 22**: columna desconocida.
- **Unnamed: 23**: desconocida.



##Limpieza de datos

Este proceso de limpieza de datos se corresponde al fichero shark_clean.  En este apartado se explica los pasos que he realizado a la hora de realizar este analisis.
#### Estudio del dataset
1. Estudio sobre las columnas para tener un conocimiento básico de las columnas (analisis realizado en el apartado 'columnas').
#### Limpieza del dataset
1. Una vez analizado las columnas elimino las columnas que pienso son inecesaria para el analisis:
  
   - href formula.
   - href.
   - Case Number1.   
   - Case Number2.   
   - original order.
   - Unnamed: 22.
   - Unnamed: 23.


2. Analizar si hay columnas duplicadas y ver en que columnas hay valores nulos para tener una referencia de inicio para la limpieza de datos.
   1. Para las columnas con muchos valores nulos etiqueto los valore NaN como 'UNKNOWN' , ya que estas columnas requiere de mucho tiempo para completarlas:

      - Age.
      - Time.
      - Species.   

   2. Para las columnas con pocos valores nulos las analizo e intento darles contenido.
      - **Country**: tiene pocos datos Nan, y se debe a que el ataque se ha producido entre 1 o mas paises. Mi solución ha sido en definir esta columna como 'moreCountries'
       - **Injury**: tiene los datos Nan ya que los datos de la columna 'Fatal (Y/N)' tienen los datos como 'UNKNOWN', por lo tanto mi decisión ha sido transformar los datos Nan a 'UNKNOWN'.
      - **Fatal (Y/N)** :los datos Nan es información incompleta que se puede completar gracias a la columna 'Injury' ya que contiene una pequeña información sobre el ataque. Por lo tanto mi decisión ha sido completar esta información a mano. Limpio tambien caracteeres que estan mal puesto como ' N'.
     - **Investigator or Source** se puede rellenar gracias a la información proporcionadas de las columna 'pdf', sin embargo veo que es una información que no me es necesaria para el futuro analisis las he puesto como 'UNKNOWN'.

   3. Para las columnas con  valores  'medianos' nulos las analizo e intento darles contenido como en el anterior apartado:
      - **Area** & **Location**: se podria rellenar investigando mas desde el origen de la noticia, sin embargo, como la columba **country** esta sin nulos, he decidido poner los valores Nan como 'UNKNOWN'.
      -  **Sex** & **Name**: En la columna Sex he limpiado algunas etiqueetas incorrectas como 'M '. Al mismo tiempo con la etiqueta name me he dado cuenta que hay algunos valores Nan porque ha ocurrido a mas de una personas, para estos casos los he etiquetado con 'people'. Por otro lado la columna 'Name' solo me importaba para rellenar la columna 'Sex' por lo tanto la he eliminado.
      -  **Activity**: Esta columna tiene etiquetas distintas para el mismo fin, lo que he hecho es cambiar los valores por las actividades más usuales:
         - Fishing
         - Surfing
         - Swimming
         - Diving
         - Crossing
         - Floating
         - Bathing

##Analisis de datos

Para el analisis de datos he hecho una comparativa entre los datos  comparando los accidentes mortales con los que no a través de histogramas. Este proceso de analisis de datos se corresponde al fichero shark_  analytic.

## Trabajo Futuro
En este apartado explico el futuro trabajo que se puede hacer para realizar un analisis mucho mas profundo. 

En un primer lugar se puede sacar más información de la que hay en el dataset. En mi opinión hay muchas columnas que no se puede saber la información exacta, sin embargo, si que es verdad que se podria sacar bastante información gracias a las columnas 'investigator or Source' y 'pdf' ya que si se busca en Google existe una informaciión detallada sobre el accidente. 

En la columna Sex, yo he considerado el codigo 'people' para solucionar los accidentes con mas personas, sin embargo, se ha dejado algunas columnas como UNKNOWN las  cuales algunas columnas se pueden solucionar viendo el nombre de la peresona.