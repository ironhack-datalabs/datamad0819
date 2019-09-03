#Example: 
"""
eggs = (1,3,8,3,2)
my_listComprehension = [1/egg for egg in eggs]
print(my_listComprehension)
"""

#Insert here the module/library import statements 
import math
import os 
import random 
import sys
import platform
import numpy as np

#1. Calculate the square number of the first 20 numbers. Use square as the name of the list.
# Remember to use list comprehensions and to print your results
square = [ele**2 for ele in range(20)]
print("1.- Square of first 20 numbers: {}".format(square))
#2. Calculate the first 50 power of two. Use power_of_two as the name of the list.
# Remember to use list comprehensions and to print your results
power_of_two = [2**e for e in range(50)]
print("2. First 50 power of two: {}".format(power_of_two))
#3. Calculate the square root of the first 100 numbers. Use sqrt as the name of the list.
# You will probably need to install math library with pip and import it in this file.  
# Remember to use list comprehensions and to print your results
sqrt = [math.sqrt(e) for e in range(100)]
print("3. First 100 numbers square root: {}".format(sqrt))
#4. Create this list [-10,-9,-8,-7,-6,-5,-4,-3,-2,-1,0]. Use my_list as the name of the list.
# Remember to use list comprehensions and to print your results
my_list = [e for e in range(-10,1,1)]
print("4.- My_List: {}".format(my_list))
#5. Find the odd numbers from 1-100. Use odds as the name of the list. 
# Remember to use list comprehensions and to print your results
odds = [e for e in range(1,100) if e%2!= 0]
print("5. Odd numbers from 1 to 100: {}".format(odds))
#6. Find all of the numbers from 1-1000 that are divisible by 7. Use divisible_by_seven as the name of the list.
# Remember to use list comprehensions and to print your results
divisible_by_seven = [e for e in range(1,1000) if e%7==0]
print("6. Numbers form 1-1000 divisible by 7: {}".format(divisible_by_seven))
#7. Remove all of the vowels in a string. Hint: make a list of the non-vowels. Use non_vowels as the name of the list.
# Remember to use list comprehensions and to print your results
# You can use the following test string but feel free to modify at your convenience
teststring = 'Find all of the words in a string that are monosyllabic'
teststring = "".join([c for c in teststring if c not in ["a","e","i","o","u"]])
print("7. Text without vowels: {}".format(teststring))
#8. Find the capital letters (and not white space) in the sentence 'The Quick Brown Fox Jumped Over The Lazy Dog'. 
# Use capital_letters as the name of the list.  
# Remember to use list comprehensions and to print your results
text = "The Quick Brown Fox Jumped Over The Lazy Dog"
capital_letters = [l for l in text if l.isupper()]
print("8. Capital letters of the text: {}".format(capital_letters))
#9. Find all the consonants in the sentence 'The quick brown fox jumped over the lazy dog'.
# Use consonants as the name of the list.
# Remember to use list comprehensions and to print your results.
text = "The quick brown fox jumped over the lazy dog"
consonants= [c for c in text if c not in ["a","e","i","o","u", " "]]
print("9. Only consonants: {}".format(consonants))
#10. Find the folders you have in your madrid-oct-2018 local repo. Use files as name of the list.  
# You will probably need to import os library and some of its modules. You will need to make some online research.
# Remember to use list comprehensions and to print your results.
files = os.listdir("../../")
print("10. List with files in datamad0820: {}".format(files))
#11. Create 4 lists of 10 random numbers between 0 and 100 each. Use random_lists as the name of the list. 
#You will probably need to import random module
# Remember to use list comprehensions and to print your results
random_lists = [[random.randint(0,100) for j in range(10)]for i in range(4)]
print("11. List with four lists with random numbers between 1 and 100: {}".format(random_lists))
#12. Flatten the following list of lists. Use flatten_list as the name of the output.
# Remember to use list comprehensions and to print your results
list_of_lists = [[1,2,3],[4,5,6],[7,8,9]]
flatten_list = [f for e in list_of_lists for f in e]
print("12. Flattend list: {}".format(flatten_list))
#13. Convert the numbers of the following nested list to floats. Use floats as the name of the list. 
# Remember to use list comprehensions and to print your results.
list_of_lists = [['40', '20', '10', '30'], ['20', '20', '20', '20', '20', '30', '20'], \
['30', '20', '30', '50', '10', '30', '20', '20', '20'], ['100', '100'], ['100', '100', '100', '100', '100'], \
['100', '100', '100', '100']]
floats = [float(f) for e in list_of_lists for f in e]
print("13. Converted to floats: {}".format(floats))
#14. Handle the exception thrown by the code below by using try and except blocks. 
print("14. ")
try:
    for i in ['a','b','c']:
        print(i**2)
except TypeError as e: 
    print("Cannot operate with strings. Check input values.")
#15. Handle the exception thrown by the code below by using try and except blocks. 
#Then use a finally block to print 'All Done.'
# Check in provided resources the type of error you may use. 
print("15. ")
try:
    x = 5
    y = 0
    z = x/y
except ZeroDivisionError as e: 
    print("Cannot divide by 0. Check divisor.")
print("All Done")
#16. Handle the exception thrown by the code below by using try and except blocks. 
# Check in provided resources the type of error you may use. 
print("16. ")
try:
    abc=[10,20,20]
    print(abc[3])
except IndexError as e:
    print("Index out of range. Index should be in between 0 and {}".format(len(abc)-1))
#17. Handle at least two kind of different exceptions when dividing a couple of numbers provided by the user. 
# Hint: take a look on python input function. 
# Check in provided resources the type of error you may use. 
print("17. ")
value1 = input("First number: ")
value2 = input("Second number:")
try:
    res = int(value1)/int(value2)
except ZeroDivisionError as e:
    print("Hey dude you cannot divide by 0.")
except TypeError as e:
    print("Hey man, only numbers!")
except ValueError as e:
    print("Hey man, only numbers!")
except Exception as e: 
    print("Smth went wrong in exercise 17.")
#18. Handle the exception thrown by the code below by using try and except blocks. 
# Check in provided resources the type of error you may use. 
print("18. ")
try:
    f = open('testfile','r')
    f.write('Test write this')
except Exception as e: 
    print(Exception, e, "File cannot be found.")
#19. Handle the exceptions that can be thrown by the code below using try and except blocks. 
#Hint: the file could not exist and the data could not be convertable to int
print("19. ")
try: 
    fp = open('myfile.txt')
    line = f.readline()
    i = int(s.strip())
except Exception as e:
    print(Exception, e, "File could not be found or opened")
except ValueError as e: 
    print(ValueError, "Values could not be converted to int")
#20. The following function can only run on a Linux system. 
# The assert in this function will throw an exception if you call it on an operating system other than Linux. 
# Handle this exception using try and except blocks. 
# You will probably need to import sys 
print("20. ")
def linux_interaction():
        assert ('linux' in sys.platform), "Function can only run on Linux systems."
        print('Doing something.')

try: 
    linux_interaction()
except Exception as e:

    print(Exception, "This function works only in Linux, you are working with {}.".format(platform.system()))
# Bonus Questions:
# You will need to make some research on dictionary comprehension to solve the following questions
#21.  Write a function that asks for an integer and prints the square of it. 
# Hint: we need to continually keep checking until we get an integer.
# Use a while loop with a try,except, else block to account for incorrect inputs.
print("21. ")
while True: 
    value = input("Give me an integer: ")
    try:
        value = int(value) 
        break
    except ValueError as e:
        print(ValueError, "Input was not a integer")
        continue
    except Exception as e: 
        print("Dude, smth went wrong in exercise 21!")
        continue
print("Your input was correct. You gave me a {} of type {}".format(value,type(value)))
# 22. Find all of the numbers from 1-1000 that are divisible by any single digit besides 1 (2-9). 
# Use results as the name of the list 
results = [num for num in range(1,1000) if any(num%np.array(range(2,10))==0)]
print("22. Numbers divisible by any digit beside 1: {}".format(results))
# 23. Define a customised exception to handle not accepted values. 
# You have the following user inputs and the Num_of_sections can not be less than 2.
# Hint: Create a class derived from the pre-defined Exception class in Python
print("23. ")
class GonzalosException(Exception):
    pass
Total_Marks = int(input("Enter Total Marks Scored: ")) 
Num_of_Sections = int(input("Enter Num of Sections: "))
if Num_of_Sections <2: 
    raise GonzalosException("Dude, Num_of_Sections cannot be less than 2")

