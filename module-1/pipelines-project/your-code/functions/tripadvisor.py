import requests
from selenium import webdriver
from bs4 import BeautifulSoup
import time

def get_page(url):
    try:
        driver = webdriver.Firefox()
        driver.get(url)
        html = driver.page_source
    except:
        pass
    return driver
    

def find_restaurant(driver,name,city):
    
    time.sleep(2)
    print(name,city)
    name_restaurant = driver.find_element_by_id("mainSearch")
    name_restaurant.send_keys(name)
    
  
    name_state = driver.find_element_by_id("GEO_SCOPED_SEARCH_INPUT")
    name_state.send_keys(city)

    
    
    time.sleep(2)
    boton = driver.find_element_by_id("SEARCH_BUTTON")

    
    boton.click()

    time.sleep(3)
    name_restaurant.clear()
    name_state.clear()
    #driver.find_element_by_class_name('location-meta-block').click()

    html = driver.page_source
    #prw_rup prw_common_responsive_rating_and_review_count
    soup = BeautifulSoup(html,'html.parser')
  
    div = soup.find("div","prw_rup prw_common_responsive_rating_and_review_count")
    span = div.find("span")
   
    start = span.get("alt")
    start = start.split(" ")[0]
    

    return start
    


def get_start(col,driver=""):
    """funcion que haciendo web scraping devuelve
    la puntuacion del restaurante en tripadvisor"""
    try:
        restaurant = col[0]
        city = col[1]
        
        start = find_restaurant(driver,restaurant,city)
        print(restaurant,city,start)
        
        return start
    except:
        print("-1")
        return "-1"
    
