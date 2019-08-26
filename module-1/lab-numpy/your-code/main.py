
### Lab Completed
### Answers are made available to be read in terminal if code executed.

#1. Import the NUMPY package under the name np.

import numpy as np

#2. Print the NUMPY version and the configuration.

print('--->numpy version:', np.__version__)
print('--->configuration:')
np.show_config()

#3. Generate a 2x3x5 3-dimensional array with random values. Assign the array to variable "a"
# Challenge: there are at least three easy ways that use numpy to generate random arrays. How many ways can you find?

print('\n# GENERATING RANDOM MATRIX WITH:\n    a = np.random.rand(2,3,5)')
a = np.random.rand(2,3,5)
print(a)

print('\n# GENERATING RANDOM MATRIX WITH:\n    import random')
print('    a = np.array([[[random.random() for i in range(5)] for j in range(3)] for k in range(2)])')
import random
a = np.array([[[random.random() for i in range(5)] for j in range(3)] for k in range(2)])
print(a)

print('\n# GENERATING RANDOM MATRIX WITH:\n    a = np.random.random((2,3,5))')
a = np.random.random((2,3,5))

#4. Print a.

print(a)

#5. Create a 5x2x3 3-dimensional array with all values equaling 1.
#Assign the array to variable "b"

b = np.ones((5,2,3))

#6. Print b.

print('\n# Matrix b:')
print(b)

#7. Do a and b have the same size? How do you prove that in Python code?

print('\n# Do the matrices a and b have the same size?')
print(a.size == b.size)

#8. Are you able to add a and b? Why or why not?

print('\n# Are you able to add a and b? Why or why not?')

"""
'a+b' results in error:
Traceback (most recent call last):
  File "main.py", line 47, in <module>
    print(a+b)
ValueError: operands could not be broadcast together with shapes (2,3,5) (5,2,3) 
"""

print(' Matrices a and b may not be added because they have the same SIZE, but not the same SHAPE')
print(" i.e.: there isn't an element of a with the same indexes for every element of b and vice-versa.")

#9. Transpose b so that it has the same structure of a (i.e. become a 2x3x5 array). Assign the transposed array to varialbe "c".

c = b.reshape(2,3,5)
print('\n# Matrix c (the transposed of b):')
print(c)

#10. Try to add a and c. Now it should work. Assign the sum to varialbe "d". But why does it work now?

d = a+c
print('\n# Matrices a and c may be added because both have the same shape.\n')

#11. Print a and d. Notice the difference and relation of the two array in terms of the values? Explain.

print('# Matrix a:\n', a,'\n\n# Matrix d = a+c:\n',d)
print('\n The values of d are the values of a incremented by 1.\n')

#12. Multiply a and c. Assign the result to e.

print('# Matrix e = a*c:')
e = a*c
print(e)

#13. Does e equal to a? Why or why not?

print('\n# Does e == a?\n',np.array_equal(a,e))
print(" They are equal because 'a*c' multiplies every element of a by 1.\n")

#14. Identify the max, min, and mean values in d. Assign those values to variables "d_max", "d_min", and "d_mean"

d_max = np.max(d)
d_min = np.min(d)
d_mean = np.mean(d)

print('# Maximum value in matrix d:\n', d_max) 
print('# Minimum value in matrix d:\n', d_min) 
print('# Mean of all values in matrix d:\n', d_mean)

#15. Now we want to label the values in d. First create an empty array "f" with the same shape (i.e. 2x3x5) as d using `np.empty`.

f=np.empty_like(d)

"""
#16. Populate the values in f. For each value in d, if it's larger than d_min but smaller than d_mean, assign 25 to the corresponding value in f.
If a value in d is larger than d_mean but smaller than d_max, assign 75 to the corresponding value in f.
If a value equals to d_mean, assign 50 to the corresponding value in f.
Assign 0 to the corresponding value(s) in f for d_min in d.
Assign 100 to the corresponding value(s) in f for d_max in d.
In the end, f should have only the following values: 0, 25, 50, 75, and 100.
Note: you don't have to use Numpy in this question.
"""

print("\n# Assigning values 0, 25, 50, 75 and 100 to matrix f from d, based on the distribution of its values.")
f = np.array([[[0 if num == d_min else 50 if num == d_mean else 100 if num == d_max else 25 if (num>d_min and num<d_mean) else 75 if (num>d_mean and num<d_max) else '' for num in d[i][j] ]for j in range(len(d[i]))]for i in range(len(d))], dtype='float64')

'''
# Alternatively:
for i in range(d.shape[0]):
        for j in range(d.shape[1]):
                for k in range(d.shape[2]):
                        if d[i][j][k] == d_min:
                                f[i][j][k] = 0
                        if d[i][j][k] == d_mean:
                                f[i][j][k] = 50
                        if d[i][j][k] == d_max:
                                f[i][j][k] = 100
                        if d[i][j][k] > d_min and d[i][j][k] < d_mean:
                                f[i][j][k] = 25
                        if d[i][j][k] > d_mean and d[i][j][k] < d_max:
                                f[i][j][k] = 75
'''

"""
#17. Print d and f. Do you have your expected f?
For instance, if your d is:
array([[[1.85836099, 1.67064465, 1.62576044, 1.40243961, 1.88454931],
        [1.75354326, 1.69403643, 1.36729252, 1.61415071, 1.12104981],
        [1.72201435, 1.1862918 , 1.87078449, 1.7726778 , 1.88180042]],

       [[1.44747908, 1.31673383, 1.02000951, 1.52218947, 1.97066381],
        [1.79129243, 1.74983003, 1.96028037, 1.85166831, 1.65450881],
        [1.18068344, 1.9587381 , 1.00656599, 1.93402165, 1.73514584]]])

Your f should be:
array([[[ 75.,  75.,  75.,  25.,  75.],
        [ 75.,  75.,  25.,  25.,  25.],
        [ 75.,  25.,  75.,  75.,  75.]],

       [[ 25.,  25.,  25.,  25., 100.],
        [ 75.,  75.,  75.,  75.,  75.],
        [ 25.,  75.,   0.,  75.,  75.]]])
"""

print('\n# Matrix d:')
print(d)
print('\n# Matrix f:')
print(f)

"""
#18. Bonus question: instead of using numbers (i.e. 0, 25, 50, 75, and 100), how to use string values 
("A", "B", "C", "D", and "E") to label the array elements? You are expecting the result to be:
array([[[ 'D',  'D',  'D',  'B',  'D'],
        [ 'D',  'D',  'B',  'B',  'B'],
        [ 'D',  'B',  'D',  'D',  'D']],

       [[ 'B',  'B',  'B',  'B',  'E'],
        [ 'D',  'D',  'D',  'D',  'D'],
        [ 'B',  'D',   'A',  'D', 'D']]])
Again, you don't need Numpy in this question.
"""

# Assigning A to the highest value as in grades:

e = np.empty_like(d,str)
letter = {100.:'A',75.:'B',50.:'C',25.:'D',0.:'E'}
e = np.vectorize(lambda x: letter[x],[str])(f)

print('\n# Converting values of f to letters (A highest, E lowest):')
print(e)

'''
Alternativetely, with an iteration of elements:
for index in np.ndindex(f.shape):
        e[index] = letter[f[index]]
'''
