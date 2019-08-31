import re

def verNombres(col):
    """ indica si en un accidente ha habido mas de dos personas,
    Si ha habido mas de 2 personas la columna Sex obtiene un valor
    de people. """

    name,sex = col
    
    if re.search('[&0-9]',str(name)):
        return "people"
    
    return sex


dic = {
    "Jan": "01",
    "Feb": "02",
    "Mar":"03",
    "Apr":"04",
    "May":"05",
    "Jun":"06",
    "Jul":"07",
    "Aug":"08",
    "Sep": "09",
    "Oct":"10",
    "Nov":"11",
    "Dec":"12"
}

def updateDate(col):

    """ Transforma los meses escritos a números """
  
    #Si tiene un formato 18-Sep-16 lo transforma
    try:
        d,m,y = str(col).split("-")
        return  d +  "-" + dic[m] + "-" + y
    #si tiene un formato  Before 1903 lo devuelve tal cual
    except:
        return col

def createMonth(col):

    """ Transforma los meses escritos a números """
  
    #Si tiene un formato 18-Sep-16 lo transforma
    try:
        d,m,y = str(col).split("-")
        return  dic[m] 
    #si tiene un formato  Before 1903 lo devuelve tal cual
    except:
        return "UNKNOWN"