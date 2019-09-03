#Example:
'''
eggs = (1,3,8,3,2)

my_listComprehension = [1/egg for egg in eggs]

print(my_listComprehension)'''
#Insert here the module/library import statements
import math

#1. Calculate the square number of the first 20 numbers. Use square as the name of the list.
# Remember to use list comprehensions and to print your results
square=[element**2 for element in range(1,21,1)]
print(square)
print()

#2. Calculate the first 50 power of two. Use power_of_two as the name of the list.
# Remember to use list comprehensions and to print your results
power_of_two=[element**2 for element in range(1,51,1)]
print(power_of_two)
print()

#3. Calculate the square root of the first 100 numbers. Use sqrt as the name of the list.
# You will probably need to install math library with pip and import it in this file.
# Remember to use list comprehensions and to print your results
square=[math.sqrt(element) for element in range(1,101,1)]
print(square)
print()

#4. Create this list [-10,-9,-8,-7,-6,-5,-4,-3,-2,-1,0]. Use my_list as the name of the list.
# Remember to use list comprehensions and to print your results
my_list=[element for element in range(-10,1,1)]
print(my_list)
print()

#5. Find the odd numbers from 1-100. Use odds as the name of the list.
# Remember to use list comprehensions and to print your results
my_list=[element for element in range(1,101,2)]
print(my_list)
print()

#6. Find all of the numbers from 1-1000 that are divisible by 7. Use divisible_by_seven as the name of the list.
# Remember to use list comprehensions and to print your results
divisible_by_seven=[element for element in range(7,1001,7)]
print(divisible_by_seven)
print()

#7. Remove all of the vowels in a string. Hint: make a list of the non-vowels. Use non_vowels as the name of the list.
# Remember to use list comprehensions and to print your results
# You can use the following test string but feel free to modify at your convenience
teststring = 'Find all of the words in a string that are monosyllabic'
vowels=["a","e","i","o","u"]
non_vowels=[element for element in teststring if element not in vowels]
print("".join(non_vowels))
print()

#8. Find the capital letters (and not white space) in the sentence 'The Quick Brown Fox Jumped Over The Lazy Dog'.
# Use capital_letters as the name of the list.
# Remember to use list comprehensions and to print your results
teststring = 'The Quick Brown Fox Jumped Over The Lazy Dog'
capital_letters=[element for element in teststring if element.isupper()]
print("".join(capital_letters))
print()
#9. Find all the consonants in the sentence 'The quick brown fox jumped over the lazy dog'.
# Use consonants as the name of the list.
# Remember to use list comprehensions and to print your results.
consonants = 'The quick brown fox jumped over the lazy dog'
vowels=["a","e","i","o","u"]
non_vowels=[element for element in consonants if element not in vowels]
print("".join(non_vowels))
print()

#10. Find the folders you have in your madrid-oct-2018 local repo. Use files as name of the list.
# You will probably need to import os library and some of its modules. You will need to make some online research.
# Remember to use list comprehensions and to print your results.
from os import listdir
from os.path import isfile, join

mypath="/home/peter/Escritorio/IronHack/05 - Ejercicios Curso/01 - Repositorio/datamad0819"
#files = [f for f in listdir(mypath) if isfile(join(mypath, f))==False]
files = [f for f in listdir(mypath)]
print(files)
print()

#11. Create 4 lists of 10 random numbers between 0 and 100 each. Use random_lists as the name of the list.
#You will probably need to import random module
# Remember to use list comprehensions and to print your results
import random
myRandomList1=[random.randrange(1,101,1) for e in range(1,101,1)]
myRandomList2=[random.randrange(1,101,1) for e in range(1,101,1)]
myRandomList3=[random.randrange(1,101,1) for e in range(1,101,1)]
myRandomList4=[random.randrange(1,101,1) for e in range(1,101,1)]

print(myRandomList1)
print()
print(myRandomList2)
print()
print(myRandomList3)
print()
print(myRandomList4)
print()

#12. Flatten the following list of lists. Use flatten_list as the name of the output.
# Remember to use list comprehensions and to print your results

list_of_lists = [[1,2,3],[4,5,6],[7,8,9]]
flatten_list=[e for a in list_of_lists for e in a]
print(flatten_list)
print()

#13. Convert the numbers of the following nested list to floats. Use floats as the name of the list.
# Remember to use list comprehensions and to print your results.

list_of_lists = [['40', '20', '10', '30'], ['20', '20', '20', '20', '20', '30', '20'], \
['30', '20', '30', '50', '10', '30', '20', '20', '20'], ['100', '100'], ['100', '100', '100', '100', '100'], \
['100', '100', '100', '100']]

floats=[float(a) for e in list_of_lists for a in e]
print(floats)
print()

#14. Handle the exception thrown by the code below by using try and except blocks.
try:
    for i in ['a','b','c']:
        print (i**2)
except:
    print("values given are not a number")
    print()

#15. Handle the exception thrown by the code below by using try and except blocks.
#Then use a finally block to print 'All Done.'
# Check in provided resources the type of error you may use.
try:
    x = 5
    y = 0
    z = x/y
except ZeroDivisionError:
    print("The denominator cannot be zero")
print("all done")
print()

#16. Handle the exception thrown by the code below by using try and except blocks.
# Check in provided resources the type of error you may use.
try:
    abc=[10,20,20]
    print(abc[3])
    print()
except IndexError:
    print("refered index does not exist in list")
    print()

#17. Handle at least two kind of different exceptions when dividing a couple of numbers provided by the user.
# Hint: take a look on python input function.
# Check in provided resources the type of error you may use.
numerator=input("Input the numerator: ")
denominator=input("Input the denominator: ")
try:
    print(float(numerator)/float(denominator))
    print()
except ZeroDivisionError:
    print("Error!, the denominator can't be zero")
    print()
except ValueError:
    print("Error!, one of the values is not a number")
    print()

#18. Handle the exception thrown by the code below by using try and except blocks.
# Check in provided resources the type of error you may use.
try:
    f = open('testfile','r')
    f.write('Test write this')
except FileNotFoundError:
    print("Error!, file was not found")
    print()

#19. Handle the exceptions that can be thrown by the code below using try and except blocks.
#Hint: the file could not exist and the data could not be convertable to int
try:
    fp = open('myfile.txt')
    line = f.readline()
  #  i = int(s.strip())
except FileNotFoundError:
    print("Error!, file was not found")
    print()
except ValueError:
    print("Error!, data can't be converted to a number")
    print()

#20. The following function can only run on a Linux system.
# The assert in this function will throw an exception if you call it on an operating system other than Linux.
# Handle this exception using try and except blocks.
# You will probably need to import sys

import sys
def linux_interaction():
    assert ('linux' in sys.platform), "Function can only run on Linux systems."
    print('Doing something.')
    print()
linux_interaction()

# Bonus Questions:

# You will need to make some research on dictionary comprehension to solve the following questions

#21.  Write a function that asks for an integer and prints the square of it.
# Hint: we need to continually keep checking until we get an integer.
# Use a while loop with a try,except, else block to account for incorrect inputs.
numberGiven=None
escape=False
while escape==False:
    try:
        numberGiven=input("please give me a number to square: ")
        print("square is {}".format(int(numberGiven)**2))
        print()
        escape=True
    except ValueError:
        print("Error! Input must be a number")
        print()

# 22. Find all of the numbers from 1-1000 that are divisible by any single digit besides 1 (2-9).
# Use results as the name of the list
results=[e for e in range(1,1001,1) if e%2==0 or e%3==0 or e%4==0 or e%5==0 or e%6==0 or e%7==0 or e%8==0 or e%9==0]
print(results)
print()

# 23. Define a customised exception to handle not accepted values.
# You have the following user inputs and the Num_of_sections can not be less than 2.
# Hint: Create a class derived from the pre-defined Exception class in Python
class NumSectionsError(Exception):
    def __init__(self, value):
        self.value = value

    def __str__(self):
        return(repr(self.value))

Total_Marks = int(input("Enter Total Marks Scored: "))
Num_of_Sections = int(input("Enter Num of Sections: "))

try:
    if Num_of_Sections > 2:
        print("Number of sections is correct")
    else:
        raise(NumSectionsError(Num_of_Sections))

# Value of Exception is stored in error
except NumSectionsError as error:
    print("Number of sections has to be an integer number higher than 2")
