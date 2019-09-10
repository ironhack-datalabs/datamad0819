import pandas as pd 
import numpy as np
import matplotlib.pyplot as plt
import random
from fpdf import FPDF
import os

url = os.path.dirname(os.path.abspath(__file__))

def open_data():
    name = "clean.csv"
    url_relative = url +  "/../dataset/output/"
    data = pd.read_csv(url_relative + name)
    return data


def description(pdf,string,lst):
    """da una pequeña descripcion del analisis en el pdf"""
    print("Limpiando el dataset para su futuro analisis.\n")
    pdf.input_subtitle("Limpieza de datos")
    pdf.input_subtitle("Comparación de restaurantes consumidos por " + string + " .")
    result = ", "
    a = (lambda lst: lst)
    lst = result.join(a(lst))
    pdf.input_line(string + " comparadas: {}.".format(lst))
    pdf.ln()


def compare_city(cities,pdf):
    """compara las ciudades por comida pedida"""
    data = open_data()
    description(pdf,"ciudades",cities)

    for city in cities:
        plt.hist(data[ (data.city == city )].city, alpha=1, label=city)
    
    url_image = url+'/../imgs/compare_cities.png'
    plt.savefig(url_image)
    pdf.image(url_image,w=175,h=140)
    


def compare_state(states,pdf):
    """ da el estado que mide mas comida rapida"""
    data = open_data()
    description(pdf,"ciudades",states)
 
    for state in states:
        plt.hist(data[(data.longNameProvince == state )].longNameProvince, alpha=1, label=state)

    url_image = url+'/../imgs/compare_states.png'
    plt.savefig(url_image)
    pdf.image(url_image,w=175,h=140)
    

def compare_restaurant(pdf,city = "New York"):
    """hace una comparacion entre restaurantes de pizza y hamburguesa por ciudad"""

    pdf.input_subtitle("Comparando restaurantes en la ciudad de " + city)

    data = open_data()
    filtered_city =  data[ (data.city == city  )]
   
    filtered_city_pizza = filtered_city[ (filtered_city.categories == 'italian'  )]
    filtered_city_american = filtered_city[ (filtered_city.categories == 'american'  )]

    plt.hist(filtered_city_pizza.categories, alpha=1, label='italian')
    plt.hist(filtered_city_american.categories, alpha=1, label='american')
    

    url_image = url+'/../imgs/compare_restaurant.png'
   
    plt.savefig(url_image)
    plt.show()
    pdf.image(url_image,w=175,h=140)






    
    


