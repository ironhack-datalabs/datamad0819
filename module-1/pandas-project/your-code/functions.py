import requests
import re

def cleanTextInFatal(text):
    """
    devuelve "N" si text contiene N o N o f o F o # o devuelve "UNKNOWN" si contiene "unkn"
    """
    if "un" not in text and "n" in text or "N" in text or "f" in text or "F" in text or "#" in text:
        return "N"
    elif "unkn" in text or "UNK" in text:
        return "UNKNOWN"
    else:
        return "Y"



def cleanActivity(text,lista):
    """Limpia la columna activity categorizando """
    texto = text.upper()
    if text not in lista:
        return text
    else:
        texto = text.upper()
        if texto.find("DIVING")!=-1:
            return retornoScubaDiving(texto)
        if texto.find("SURF")!=-1:
            return retornoTiposSurf(texto)
        if texto.find("FISH")!=-1:
            return retornoTiposFish(texto)
        if texto.find("BOAT") !=-1 or texto.find("SAIL")!=-1 or texto.find("ROWING")!=-1:
            return "Sailing"
        if texto.find("BATH"):
            return "Bathing"
        if texto.find("WALK") !=-1 or texto.find("WADIN") !=-1 or texto.find("WALK") !=-1 or texto.find("TREADING") !=-1:
            return "Wading"

def retornoScubaDiving(text):
    if text.find("SCUB")!=-1:
        return "Scuba diving"
    else:
        return "Diving"

def retornoTiposSurf(text):
    if text.find("BODY")!=-1:
        return "Body surf"
    if text.find("WIND")!=-1:
        return "Windsurfing"
    if text.find("SKI")!=-1:
        return "Surf skiing"
    if text.find("FIS")!=-1:
        return "Surf fishing"
    else:
        return "Surfing"

def retornoTiposFish(text):
    if text.find("SPEAR")!=-1:
        return "Spearfishing"
    if text.find("SHARK")!=-1:
        return "Shark fishing"
    else:
        return "Fishing"    

def callChekcUrl(pdSerie):
    return pdSerie.apply(checkUrlValid)


def checkUrlValid(text):
    """analiza si un string contiene una url válida (404 no valida) y la devuelve si lo es, si no devuelve UNKNOWN"""
    r= requests.Response()
    try:
        
        r = requests.get(text)
        code = int(r.status_code)
        del r
        if code == 200:
            return text
        else:
            return "UNKNOWN"
    except:
            return "UNKNOWN" 



"""def cleanShark(text):
    listSpecies =["WHITE","TIGUER","BULL","WOBBEGONG","BLACKSTRIP","MAKO","BLUE","RAGGEDTOOTH","ZAMBESI","BRONZE WHALER"]
    t = text.upper
    if t.find("WHITE"):
        return "WHITE"
    elif t.find("TIGER"):
        return "TIGER"
    elif t.find "BULL"""

def getLength(text):
    """Busca en species patrones de longitud para inicializar una columna nueva"""
    t = str(text)
    t = t.replace("["," ")
    t = t.replace("]"," ")
    
    longitud = re.findall("([\d.]+)\s+(\S+)",t)
    if len(longitud)>0:
        return " ".join([ele[0]+ele[1] for ele in longitud])
    else:
        longitud = re.findall("([\d.]+('))",t)
        if len(longitud) != 0:
            return " ".join([ele[0] for ele in longitud])
        else:
            return("UNKNOWN")


        

