# Pipelines-project

## Pasos dados:

### Importación de los datos: 

La base de datos escogida es un csv que reúne todos los atentados cometidos en el mundo desde 1970. La tabla en sí, aunque en los primeros registros faltan bastantes datos, ofrece una información exhaustiva de cada uno de los atentados. 

Además de datos básicos como la fecha y el lugar en el que se cometieron o el grupo que lo perpetró y el número de muertos, también aúna información como el tipo de arma o armas utilizadas, la forma en la que se reivindicó ese atentado, un breve resumen del mismo y una anotación con los motivos, si se conocen, detrás del suceso.

Por su parte, la API escogida es una desarrollada por el New York Times que permite extraer los comentarios de una noticia al hacer una consulta con una url sobre esa información.

### Limpieza y manipulación de los datos:

Mi objetivo inicial era intentar hacer un análisis de los términos utilizados en los comentarios escritos por los usuarios en las noticias ligadas a atentados cometidos en Nueva York desde 2001, incluido el 11-S. Por lo tanto, el cribado de datos incluyó eliminar columnas con información irrelevante para el análisis que había planteado y aquellas filas que no se correspondiensen con un atentado cometido en Nueva York.

El primer problema encontrado, cómo hallar una url de esas noticias. Segundo, no todas incluyen comentarios, bien por su antigüedad o por otros motivos.

Además, no supe cómo definir una función que hiciese múltiples solicitudes a la API en función de la página de comentarios que quisiese extraer. La API te dejaba incluir un parámetro para obtener el número total de comentarios en tandas de 25.

### Análisis de los datos:

Aunque finalmente extraje un comentario por aquellos atentados cuya noticia incluían comentarios y el número total, más allá de añadir esta nueva información al csv resultante no puede hacer ningún análisis con esta información concreta. Por ciudades de Estados Unidos, desde 1970, Nueva York, con 460 atentados, ha sido la ciudad estadounidense que ha registrado más sucesos de estas características, seguida de San Juan con 116 y de Los Ángeles con 109.

Del resto de datos puede concluir que a partir del 11-S en Nueva York y hasta 2017, se han cometido 35 atentados más en la ciudad. Si bien las cifras de fallecidos difieren de los 2.767 registrados en el 11-S a los 15 muertos entre el resto de atentados. El segundo más mortifero se registró el 31 de octubre de 2017, con ocho personas fallecidas. Una camioneta arrolló a varias personas.

### Otros problemas encontrados

No he sabido utilizar argparse para ejecutar una función desde la terminal. La función definida plantea al introducir un año devolver el número de atentados registrados ese año en Nueva York y el número de personas fallecidas. 