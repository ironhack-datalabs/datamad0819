def type_of_gender(sex):  #funcion para dar una definicion a los NaN
    if sex == 'M' or sex == 'F':
        return sex
    else:
        return 'not defined'
data['Sex'] = data['Sex'].apply(type_of_gender)º