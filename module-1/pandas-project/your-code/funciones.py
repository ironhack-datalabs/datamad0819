

#converts is fatal column to boolean data
#Categorizes Y to True and rest of values to False (n, f(1), #Value(1), unknown(94),)

def isfatal(string):
    string = str(string).strip().lower()
    if string == "y":
        return True
    else: 
        return False
    


#Categorize hour 
def cat_hour(hour):

    hour = str(hour).strip()
    hour = hour.replace("<","")
    hour = hour.replace(">","")
    
    if re.search("\d{2}[h,j,:]\d{2}",hour) and len(hour)<=5: #forma 13h30, 14:00, 12j30
        hour,minu = re.split("[jh:]",hour)
        h = int(hour)
        if h in [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24]:
            return h
        
    elif re.search("\d{2}[h]\d{2}[ \/tor-]+\d{2}[h]\d{2}",hour): #form 13h30 - 14h40, 13h30 to 14h40, 13h30 or 14h40
        hour = re.sub("[tor\/ -]+","-",hour).split("-")[0]
        hour,minu = re.split("[jh:]",hour)
        h = int(hour)
        if h in [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24]:
            return h
        
    elif text_in_var(["Early morning"],hour):
        return 15 #morning
    elif text_in_var(["mid morning", "mid-morning"],hour):
        return 15 #mid morning
    elif text_in_var(["midday", "lunch", "noon"],hour):
        return 13 #midday
    elif text_in_var(["afternoon"],hour):
        return 15 #afternoon
    elif text_in_var(["evening"],hour):
        return 18 #evening
    elif text_in_var(["sunset","sundown" ],hour):
        return 21 #nightfall
    elif text_in_var(["night", "dark"],hour):
        return 1 #night 
    return 25
    
def text_in_var(lists,var):
    for ele in lists: 
        if ele.lower() in var.lower(): 
            return True
    return False