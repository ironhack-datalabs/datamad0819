import re
import datetime

def cleanColumn(old,new,dataset,col):
    """ Limpia la columna Fatal """

    dataset_filter = dataset[(dataset[col] == old)]
    dataset.loc[dataset_filter.index, col] = new

    return dataset

sharks = ["tiger","white","mako","bull","tiger","raggedtooth",
"hammerhead","nurse","lemon","blacktip","sevengill"]

def catalogarSpecies(col):
    """ Cataloga los tibutones mas comunes"""
    col = str(col).lower()

    for shark in sharks:
        if shark in col:
            return shark
        
    return "UNKNOWN"




def verNombres(col):
    """ indica si en un accidente ha habido mas de dos personas,
    Si ha habido mas de 2 personas la columna Sex obtiene un valor
    de people. """

    name,sex = col
    
    if re.search('[&0-9]',str(name)):
        return "people"
    
    return sex

activities = ["fishing","surfing","swimming","diving","crossing","floating","bathing"]

def catalogarActivity(col):
    """ Cataloga con las actividades mas practicadas """
    col = str(col).lower()

    for act in activities:
        if act in col:
            return act
        
    return "UNKNOWN"


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
        #Si existe en la lista devuelvo la key
        aux = dic[m]
        return m

    #si tiene un formato  Before 1903 lo devuelve tal cual
    except:
        return "UNKNOWN"




def createSeason(col):
    """dada una fecha, determina la estación del año"""
    spring = range(80, 172)
    summer = range(172, 264)
    fall = range(264, 355)

    try:
        d,m,y = col[0].split("-")
        year = col[1]
        #lo transformo a tip datetime
        d = datetime.date(int(year), int(m), int(d))
        #te devuelve el total del dia de un año.
        #Ej: 15 de febreo corresponde al dia 46
        countDay = d.timetuple().tm_yday
        
        if countDay in spring:
            return "spring"
        elif countDay in summer:
            return "summer"
        elif countDay in fall:
            return "autumn"
        else:
            return "winter"

    #si tiene un formato  Before 1903 lo devuelve tal cual
    except:
        return "UNKNOWN"


range_age = ['0-10', '10-20', '20-30', '30-40', '40-50','60-70','70-80','80-90','90-100']


def calculateRangeAge(col):
    try:

        for age in range_age:
            min_age,max_age = age.split("-")

            if int(col) >= int(min_age) and int(col) <= int(max_age):
                return age
    except:
        return "UNKNOWN"
        
