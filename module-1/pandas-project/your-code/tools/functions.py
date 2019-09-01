

def findWords(text,keyWords):
    for word in keyWords.keys():
        print(text.lower())
        if word in text.lower().split(" "):
            keyWords[word]+=1
    return keyWords


def countWord(textList,wordlen=0,filter=0):
    '''Function that counts the number of occurrences of a word in a list of texts
    Params:
        textList: list of texts
        wordlen: minimum length of a word to be counted
        filter: minimum number of occurrences of a word to be checked
    Return: dictionaty {string(word):int(number of occurrences)}
    '''
    
    counter=dict()
    text=" ".join(str(elem) for elem in textList)
    
    text=text.lower()
    text.strip()
    while len(text)>=wordlen+1:
        word=text[:text.index(" ")]
        if len(word)>wordlen:
            num=text.count(word+" ")
            if num>=filter:
                counter[word]=num
        text=text.replace(word+" "," ")
        text=text.strip()+" "

    return counter


def categorizeText(text,categories, modificators):
    '''
    Check the text to categorize it according to the indications in the dictionary.
    params: 
        text: string which wants to be categorized.
        categories: dictionary. keys ar numerical values indicating the categories. Values are a list with identifying word os the category.
    Return: the highest category key that has a word of the list in the text.
    '''
    text=str(text).lower()
    aux=dict()
    
    for key in sorted(list(categories.keys()),reverse=True):
        aux[key]=categories[key]   
    for level in aux:
        for word in categories[level]:
            if word in text:
                for modif in modificators:
                    if modif+" "+word in text:
                        break
                    return level
    return "U"