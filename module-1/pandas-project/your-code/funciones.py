import re

def fixAge(text):
    text = str(text)
    if text == "Teen":
        return 16
    elif text == '20s':
        return 20
    else:
        return text

def fixYear2(year):
    reg = re.findall('\\d{4}', year)
    if reg:
        return reg[0]
    return year

def fixYear3(date,year):
    if year == 0:
        reg = re.findall('\\d{4}', year)
        if reg:
            return reg[0]
        return year
    else:
        return date
