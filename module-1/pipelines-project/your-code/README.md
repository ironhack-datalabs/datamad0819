# Analisis de comida consumida.

Este proyecto totalmente academico consiste en analizar un dataset cualquiera de la página de kaggle. El elegido por mi es el siguiente: https://www.kaggle.com/datafiniti/pizza-restaurants-and-the-pizza-they-sell. Que trata de la comida de pizza consumida en EEEUU en mayo dee 2019 por ciudades y estados.

El objetivo principal de este proyecto es enriquecer el dataset con información externa . En mi caso he utilizado web scraping para completar información de la población total de cada estado y el indice de obesidad por estado. Además utilizando la bilioteca selenium de recoger de tripadvisor la puntuación por restaurante.

## Organización de carpetas

- dataset: lugar donde esta los dataset en formato .csv.
  - dataset/input-> El dataset sin limpiar.
  - dataset/ouput -> El dataset limpiado.
- functions: directorio donde estan las funciones
  - main: archivo principal que se ejecuta el programa a través de argumentos.
  - clear: archivo que limpia y añade columnas (la limpieza en este proyecto esta un poco secundario porque no es el objetivo principal)
  - analityc: archivo donde se analiza y se crea graficos con distinta información.
  - web_scraping: archivo donde estan las distintas funciones de web_scraping
  - tripadisor: archivo que a través de selenium recoge las puntuaciones (esta función esta comentada debido al excesivo tiempo que tarda en recoger las puntuaciones debido al tamaño del dataset)
  - pdf: clase donde se guarda el proceso del programa en un pdf.

## Iniciando el programa

Para iniciar el programa se hace a través de los siguientes argumentos:

- **python3 main -c**: inicia el proceso de limpiado y de añadir información al dataset. Este genera un pdf con los pasos seguidos.
- **python3 main -ac city1 -ac city2...**: realiza una comparación entre distintas ciudades para ver que ciudades piden mas comida. Genera un pdf con un gráfico de la compración.
- **python3 main -as state1 -as state2...**: realiza una comparación entre distintos estados para ver que estados piden mas comida. Genera un pdf con un gráfico de la compración.
  - **python3 main -at city**: realiza una comparación entre los distintos tipos de restaurantes.