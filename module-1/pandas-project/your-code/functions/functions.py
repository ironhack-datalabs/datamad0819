import re
from statistics import mean
import numpy as np


def age_fixer(text):
    ''' fixes the column 'age' by interpreting the different \
    entries into their corresponding (well-formated) ages'''
    text = str(text)
    text.strip()
    if re.match('month', text):
        return "1"
    if re.search('(\d{1,2})\s(.+)\s(\d{1,2})', text):
        return str(round(mean([int(s) for s in re.findall('(\d{1,2})', text)]), 0))
    if re.search('\d{1,2}', text):
        return re.findall('\d{1,2}', text)[0]
    if re.match('[Tt]een', text):
        return "16"
    if re.search('[aA]dult', text):
        return "40"
    if re.search('[Yy]oung', text):
        return "30"
    else:
        return np.NaN


def time_fixer(text):
    ''' fixes the column 'time' by classifying the different \
    entries in four time frames: morning, afternoon, evening and night'''
    text = str(text)
    text.strip()
    if re.match('\d{1,2}\D?\d\d', text):
        tot_str = re.match('(\d{1,2})\D?(\d\d)', text).group()
        sub_str = re.sub("[^0-9]", "", str(tot_str))
        for_str = ("{:0>4}".format(sub_str))[:2]
        hour = int(for_str)
        if hour >= 0 and hour <= 5:
            return "night"
        if hour > 5 and hour <= 11:
            return "morning"
        if hour > 11 and hour <= 17:
            return "afternoon"
        if hour > 17 and hour <= 23:
            return "evening"
    if re.search('[Nn]ight|[Dd]ark', text):
        return "night"
    if re.search('[Ee]vening|[Ss]unset|[Dd]usk', text):
        return "evening"
    if re.search('[Ll]unch|[Aa]fterno+n|[Dd]ay|[Nn]oon', text):
        return "afternoon"
    if re.search('A.?M|[Mm]orning|[Dd]awn', text):
        return "morning"
    else:
        return np.NaN


def month_maker(text):
    'returns the month number from a string with the month name'
    if re.search('[Jj]an', text):
        return '01'
    if re.search('[Ff]eb', text):
        return '02'
    if re.search('[Mm]ar', text):
        return '03'
    if re.search('[Aa]pr', text):
        return '04'
    if re.search('[Mm]ay', text):
        return '05'
    if re.search('[Jj]un', text):
        return '06'
    if re.search('[Jj]ul', text):
        return '07'
    if re.search('[Aa]ug', text):
        return '08'
    if re.search('[Ss]ep', text):
        return '09'
    if re.search('[Oo]ct', text):
        return '10'
    if re.search('[Nn]ov', text):
        return '11'
    if re.search('[Dd]ec', text):
        return '12'
    else:
        return 'unknown'


def country_fixer(text):
    text = text.strip().title()
    if text == 'Ceylon (Sri Lanka)':
        return 'Sri Lanka'
    if text == 'Egypt / Israel':
        return 'Egypt'
    if text == 'Iran / Iraq':
        return 'Iran'
    if text == 'Federated States Of Micronesia':
        return 'Micronesia'
    if text == 'Sudan?':
        return 'Sudan'
    if text == 'United Arab Emirates (Uae)':
        return 'United Arab Emirates'
    if text == 'Usa':
        return 'USA'
    else:
        return text


def area_fixer(text):
    text = re.sub(" {2,}", " ", text.strip().title())
    text = re.sub('[\(\)]', "", text)
    return text


def sex_fixer(text):
    text = text.strip()
    if text != "F" and text != "M":
        text = "unknown"
    return text
