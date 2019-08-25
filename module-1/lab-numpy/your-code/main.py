#1. Import the NUMPY package under the name np.

import numpy as np

#2. Print the NUMPY version and the configuration.
print('\nThis NumPy version is:')
print(np.version.version)
print('\nThis NumPy configuration is:')
np.show_config()

#3. Generate a 2x3x5 3-dimensional array with random values. Assign the array to variable "a"
# Challenge: there are at least three easy ways that use numpy to generate random arrays. How many ways can you find?
a = np.random.random((2,3,5))



#4. Print a.
print( '\n4.- Our array "a" is:\n' ,a,'\n')



#5. Create a 5x2x3 3-dimensional array with all values equaling 1.
#Assign the array to variable "b"
b = np.ones((5,2,3))



#6. Print b.

print( '6.- Our array "b" is:\n' ,b,'\n')


#7. Do a and b have the same size? How do you prove that in Python code?

def array_size_comparator(arr1,arr2):#Returns True if sime size, False if diffrent size

    return sum(arr1.shape) == sum(arr2.shape)
 
print("7.-Do a and b have the same size?",array_size_comparator(a,b))

#8. Are you able to add a and b? Why or why not?
'''
It is not possible beacuase even having the same size, their elements are distributed in diferent sized elements.
It is necessary to traspose them to be able to add.
'''

#9. Transpose b so that it has the same structure of a (i.e. become a 2x3x5 array). Assign the transposed array to varialbe "c".
c = b.transpose(1,2,0)


#10. Try to add a and c. Now it should work. Assign the sum to varialbe "d". But why does it work now?
d = a +c
print('\n10.-The value of "d" is:\n',d)

#11. Print a and d. Notice the difference and relation of the two array in terms of the values? Explain.

print('\nOur arrays "a" and "d" are :\n',a,'\n\n',d)
#The difference between a and d is that the elements of d are the elements of a+1.

#12. Multiply a and c. Assign the result to e.

e = np.multiply(a,c)

print('\nThe result of multiply "a" and "c" is: \n',e)

#13. Does e equal to a? Why or why not?

# e is not equal to a because although the have the same size and dimension, their values are different.


#14. Identify the max, min, and mean values in d. Assign those values to variables "d_max", "d_min", and "d_mean"
d_max = d.max()
d_min = d.min()
d_mean = d.mean()


#15. Now we want to label the values in d. First create an empty array "f" with the same shape (i.e. 2x3x5) as d using `np.empty`.
f = np.empty((2,3,5))



"""
#16. Populate the values in f. For each value in d, if it's larger than d_min but smaller than d_mean, assign 25 to the corresponding value in f.
If a value in d is larger than d_mean but smaller than d_max, assign 75 to the corresponding value in f.
If a value equals to d_mean, assign 50 to the corresponding value in f.
Assign 0 to the corresponding value(s) in f for d_min in d.
Assign 100 to the corresponding value(s) in f for d_max in d.
In the end, f should have only the following values: 0, 25, 50, 75, and 100.
Note: you don't have to use Numpy in this question.
"""
for array in range(d.shape[0]):
        for lst in range(d.shape[1]):
                for element in range(d.shape[2]):
                        if d[array][lst][element] == d_min:
                                f[array][lst][element] = 0

                        elif d[array][lst][element] > d_min and d[array][lst][element] < d_mean:
                                f[array][lst][element] = 25

                        elif d[array][lst][element] == d_mean:
                                f[array][lst][element] = 50

                        elif d[array][lst][element] > d_mean and d[array][lst][element] < d_max:
                                f[array][lst][element] = 75

                        elif d[array][lst][element] == d_max:
                                f[array][lst][element] = 100

                                
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
print('\n17.-The value of "d" is:\n',d)
print('\n17.-The value of "f" is:\n',f)
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
f = f.astype(str)

for array in range(f.shape[0]):
        for lst in range(f.shape[1]):
                for element in range(f.shape[2]):
                        if f[array][lst][element] == '0.0':
                                f[array][lst][element] = 'A'

                        elif f[array][lst][element] == '25.0':
                                f[array][lst][element] = 'B'

                        elif f[array][lst][element] == '50.0':
                                f[array][lst][element] = 'C'

                        elif f[array][lst][element] == '75.0' :
                                f[array][lst][element] = 'D'

                        elif f[array][lst][element] == '100.0':
                                f[array][lst][element] = 'E'

print('\n18.-The value of "f" is now:\n',f)