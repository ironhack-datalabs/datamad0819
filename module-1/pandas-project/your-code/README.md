Explicar cómo hemos organizado las carpetas.


*Falta crear un funciones.py



Qué tipo de actividad estaban haciendo el mayor grupo de afectados?
Tipo de tiburón que más ataques produce
Horas de mayores ataques
Ataques fatales

sharks['Date'].fillna('Unknown', inplace = True)
sharks['Case Number'].fillna('Unknown', inplace = True)
sharks['original order'].fillna('Unknown', inplace = True)

#Cambiamos valors por unknown para hacer el análisis más claro


#HE TRANSFORMADO EN UNA LISTA LA COLUMNA DE ACTIVITY YA QUE EN ELLA VOY A CENTRAR MI ESTUDIO,HE CAMBIADO LOS VALORES QUE SON IGUALES PERO CON DISTINTO NOMBRE

activity=sharks['Activity'].tolist()

activity=[dic.get(n, n) for n in activity]

print(activity)


def counterTypes(tipo):
    counted = activity.count(tipo)
    print("ataque tiburon",i,counted)

for i in lista:
    counterTypes(i)

    #AQUI SE CUENTA LA VECES QUE SE HA PRODUCIDO CADA ACTIVIDAD, MOSTRANDO QUE LA ACTIVIDAD CON MAS ATAQUES DE TIBURONES CON DIFERENCIA ES EL SURFING


#REALIZO UN FILTRADO PARA VER SOLO LOS ATAQUES PRODUCIDOS MIENTRAS SE REALIZABA SURFING
filtered1 = sharks[(sharks['Activity']=='Surfing')]
display(filtered1)
display(filtered1.shape)


#FILTRACION DE LOS ATAQUES REALIZADOS MIENTRAS SE REALIZA SURFING EN ESTADOS UNIDOS YA QUE MI ESTUIDO SE CENTRA EN USA Y EN AUSTRALIA
filtered3 = sharks[(sharks['Activity']=='Surfing') & (sharks['Country']=='USA')] 

display(filtered3)
display(filtered3.shape)


#LO MISMO QUE LO ANTERIOR PERO CON AUTRALIA
filtered4 = sharks[(sharks['Activity']=='Surfing') & (sharks['Country']=='AUSTRALIA')] 

display(filtered4)
display(filtered4.shape)



#QUIERO VALORAR TODOS LOS ATAQUES COMO PROVOCADOS O NO POR LO QUE TENDRE QUE SUSTITUIR LOS VALORES QUE NO SEAN ESTOS
print(sharks['Type'].value_counts())



tipo=sharks['Type'].tolist()
dic = {'Invalid':'Unprovoked','Boat':'Unprovoked','Sea Disaster':'Unprovoked'}
tipo=[dic.get(n, n) for n in tipo]
print(tipo)





#A CONTINUACION REALIZO LAS FILTRACIONES CON PROVOCADOS O NO
filtered13 = sharks[(sharks['Activity']=='Surfing') & (sharks['Country']=='AUSTRALIA') & (sharks['Type']=='Unprovoked')] 

display(filtered13)
display(filtered13.shape)


filtered14 = sharks[(sharks['Activity']=='Surfing') & (sharks['Country']=='AUSTRALIA') & (sharks['Type']=='Provoked')] 

display(filtered14)
display(filtered14.shape)




#LOS ATAQUES DE TIBURONES EN AUTRALIA REALIZANDO SURFING NO POR UN 92 1 NO PROVOCADOS POR LO QUE A LA HORA DEL ATAQUE EL CULPABLE NO ES EL SER HUMANO CUANDO REALIZA SURFING EN AUSTRALIA





filtered20 = sharks[(sharks['Activity']=='Surfing') & (sharks['Country']=='USA') & (sharks['Type']=='Unprovoked')] 

display(filtered20)
display(filtered20.shape)




filtered22 = sharks[(sharks['Activity']=='Surfing') & (sharks['Country']=='USA') & (sharks['Type']=='Provoked')] 

display(filtered22)
display(filtered22.shape)



#LA MAYORIA DE LOS ATAQUES DE TIBURONES A PERSONAS REALIZANDO SURF SON NO PROVOCADOS POR UN 204 A 3 DURANTE LOS ULTIMOS 10 AÑOS

#LLEGAMOS A LA CONCLUSION DE QUE LA MAYORIA DE LOS ATAQUES NO SON PROVOCADOS EN LOS DOS PAISES,PERO TAMBIEN QUE HAY UN MAYOR ATQUE DE TIBURONES A PERSONAS REALIZANDO SURF EN USA



#HAY MAYOR NUMERO DE ATAQUES A SURFISTAS EN USA QUE EN AUSTRALIA


#QUIERO VALORAR SI ESTOS ATAQUES EN ESTOS DOS LUGARES SON MORTALES O NO
sharks['Fatal (Y/N)'].fillna('Unknown', inplace = True)
fatal=sharks['Fatal (Y/N)'].tolist()
dic2 = {'Invalid':'Unprovoked','Boat':'Unprovoked','Sea Disaster':'Unprovoked','UNKNOWN':'Unknown'}
fatal=[dic2.get(n, n) for n in fatal]
print(fatal)




filtered68 = sharks[(sharks['Activity']=='Surfing') & (sharks['Country']=='USA') & (sharks['Fatal (Y/N)']=='N')] 

display(filtered68)
display(filtered68.shape)






filtered99 = sharks[(sharks['Activity']=='Surfing') & (sharks['Country']=='USA') & (sharks['Fatal (Y/N)']=='Y')] 

display(filtered99)
display(filtered99.shape)



filtered6 = sharks[(sharks['Activity']=='Surfing') & (sharks['Country']=='AUSTRALIA') & (sharks['Fatal (Y/N)']=='N')]

display(filtered6)
display(filtered6.shape)





filtered00 = sharks[(sharks['Activity']=='Surfing') & (sharks['Country']=='AUSTRALIA') & (sharks['Fatal (Y/N)']=='Y')]

display(filtered00)
display(filtered00.shape)



#EN AMBOS PAISES LA MAYORIA DE LOS ATAQUES SON NO MORTALES,PERO PODEMOS OBSERVAR QUE AUSTRALIA AUN TENIENDO MENOS ATAQUES DE TIVBURON A SURFISTAS TINEN UN MAYOR NUMERO DE ATAQUES MORTALES QUE USA POR UN 5 2



#MI CONCLUSIONES SON QUE EL DEPORTE CON MAS ATAQUES DE TIBURON ES EL SURF EN LOS ULTIMOS 10 AÑOS,CENTRANDOME EN USA Y AUSTRALIA,USA TIENE UN MAYOR NUMERO DE ATAUQES DE TIBURON PERO LOS ATAQUES EN AUSTRALIA PUEDEN LLEGAR A SER MAS MORTALES



sharks.to_csv('Notbabysharks.csv')