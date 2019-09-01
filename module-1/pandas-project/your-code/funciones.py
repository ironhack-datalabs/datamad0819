import re

def fixYear(year):
    reg = re.findall('\\d{4}', year)
    if reg:
        return reg[0]
    return year

def fixYear(date,year):
    if year == 0:
        reg = re.findall('\\d{4}', year)
        if reg:
            return reg[0]
        return year
    else:
        return date
