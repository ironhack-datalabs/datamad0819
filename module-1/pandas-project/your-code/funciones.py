# Función utilizada para agrupar los diferentes valores de la columna "Injury" en las mínimas categorías posibles

import re

def injury(text):
    if re.search('(No inj)\w+|(no inj)\w+|(No inu)\w+|(no inu)\w+|(No ijn)\w+|(no ijn)\w+', str(text)):
        return "No injury"
    elif re.search ('(Sever)\w+|(sever)\w+|(Ampu)\w+|(ampu)\w+|(lost)|(removed)', str(text)):
        return "Severed"
    elif re.search('(Bit)\w+|(bit)\w+|(bit)', str(text)):
        return 'Bitten'
    elif re.search('(No sh)\w+|(no sh)\w+|(hoax)|(Shark in)\w+|(shark in)\w+|(swordfish)|(Not a sh)\w+|(not a sh)\w+', str(text)):
        return 'No shark'
    elif re.search('(Inju)\w+|(inju)\w+|(Ser)\w+|(ser)\w+|(Inur)\w+|(inur)\w+', str(text)):
        return "Injured"
    elif re.search('(Lacer)\w+|(lacer)\w+|(Cut)|(cut)', str(text)):
        return "Injured"
    elif re.search('(Woun)\w+|(woun)\w+|(Scra)\w+|(scra)\w+', str(text)):
        return "Injured"
    elif re.search('(Gas)\w+|(gas)\w+|(Punc)\w+|(punc)\w+', str(text)):
        return "Injured"
    elif re.search('(Abra)\w+|(abra)\w+|(Brui)\w+|(brui)\w+|(Scav)\w+|(scav)\w+|(Brok)\w+|(brok)\w+', str(text)):
        return "Injured"
    elif re.search('(Nip)\w+|(nip)\w+|(Nip)|(Lef)\w+|(lef\w+)|(leg)|(Leg)|(Torn)|(Thigh)|(thigh)|(ankle)', str(text)):
        return "Injured"
    elif re.search('0|(Unk)\w+|(unk)\w+|(No de)\w+|(no de)\w+|(Surv)\w+|(surv)\w+|(nan)', str(text)):
        return "Unknown"
    elif re.search('(Non-f)\w+|(non-f)\w+|(PROVOKED)|(Repor)\w+|(Missing)|(Appa)\w+|(appa)\w+|(Recov)\w+|(recov)\w+', str(text)):
        return "Unknown"
    elif re.search('(Glov)\w+|(glov)\w+|(Bo)\w+|(bo)\w+', str(text)):
        return "No personal injury"
    else:
        return text