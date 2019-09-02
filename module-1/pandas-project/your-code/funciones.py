def calendario(e):
#Funcion que recibe valores string y los pasa a mes de años.
    if e.find("Jan") != -1:
        return int(1)
    elif e.find("Feb") != -1:
        return int(2)
    elif e.find("Mar") != -1:
        return int(3)
    elif e.find("Apr") != -1:
        return int(4)
    elif e.find("May") != -1:
        return int(5)
    elif e.find("Jun") != -1:
        return int(6)
    elif e.find("Jul") != -1:
        return int(7)
    elif e.find("Aug") != -1:
        return int(8)
    elif e.find("Sep") != -1:
        return int(9)
    elif e.find("Oct") != -1:
        return int(10)
    elif e.find("Nov") != -1:
        return int(11)
    elif e.find("Dic") != -1:
        return int(12)
    


def estaciones(i):
#Funcion que recibe meses y te devuelve las estaciones.
    if i==1 or i==2 or i==12:
        return ("invierno")
    elif i==3 or i==4 or i==5:
        return("primavera")
    elif i==6 or i==7 or i==8:
        return("verano")
    else:
        return("otoño")

def limpiar(df):
#Funcion que remplaza los nombres de las columnas, eliminando espacios, valores en extremos.
   limpiar = []
   for col in df.columns:
       col = col.strip().lower()
       col = col.replace('.',' ')
       limpiar.append(col)
   df.columns = limpiar
   return df.columns


