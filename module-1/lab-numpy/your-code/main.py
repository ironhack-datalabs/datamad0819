print("*************************************")
print("**         Ejercicio Numpy         **")
print("*************************************")
print("\n")

#1. Import the NUMPY package under the name np.
print("#1")

import numpy as np
print("import numpy as np")

print("\n")
#2. Print the NUMPY version and the configuration.
print("#2")

print(np.version.version)

print("\n")
#3. Generate a 2x3x5 3-dimensional array with random values. Assign the array to variable "a"
# Challenge: there are at least three easy ways that use numpy to generate random arrays. How many ways can you find?
print("#3")


a = np.random.random((2,3,5))

print("This are the three ways I found: \n np.random.random((2,3,5)) \n " +
"np.random.rand(2,3,5) \n np.random.randn(2,3,5)")

print("\n")
#4. Print a.
print("#4")

print(a)

print("\n")
#5. Create a 5x2x3 3-dimensional array with all values equaling 1.
#Assign the array to variable "b"
print("#5")

b = np.ones((5,2,3))

print("np.ones((5,2,3),dtype=np.int16)")

print("\n")
#6. Print b.
print("#6")

print(b)

print("\n")
#7. Do a and b have the same size? How do you prove that in Python code?
print("#7")

print("'a.size == b.size' is {}".format(a.size == b.size))

print("\n")
#8. Are you able to add a and b? Why or why not?
print("#8")

#print(a + b)
print("I can't add them because 'a.shape == b.shape' is {} so a ValueError raises".format((a.shape == b.shape)))

print("\n")
#9. Transpose b so that it has the same structure of a (i.e. become a 2x3x5 array). Assign the transposed array to varialbe "c".
print("#9")

c = np.transpose(b, (1, 2, 0))
print("np.transpose(b, (1, 2, 0))")

print("\n")
#10. Try to add a and c. Now it should work. Assign the sum to varialbe "d". But why does it work now?
print("#10")

d = a + c
print("Now it works, because data is structured the same way")

print("\n")
#11. Print a and d. Notice the difference and relation of the two array in terms of the values? Explain.
print("#11")

print(a)
print(d)
print("Because all the values in b were 1 all the values in c are 1, and so d values are a values plus 1")


print("\n")
#12. Multiply a and c. Assign the result to e.
print("#12")

e = a * c
print(e)

print("\n")
#13. Does e equal to a? Why or why not?
print("#13")

print("e equals a is {}".format(np.array_equal(e,a)))
print("because c is a Numpy array with all the values 1 (same as b), so id e = a * c, then e = a")

print("\n")
#14. Identify the max, min, and mean values in d. Assign those values to variables "d_max", "d_min", and "d_mean"
print("#14")

d_max = d.max()
d_min = d.min()
d_mean = d.mean()

print("d_max = {} \n d_min = {} \n d_mean = {}".format(d_max, d_min, d_mean))


print("\n")
#15. Now we want to label the values in d. First create an empty array "f" with the same shape (i.e. 2x3x5) as d using `np.empty`.
print("#15")

f = np.empty((2,3,5))
print("np.empty((2,3,5))")


print("\n")
"""
#16. Populate the values in f. For each value in d, if it's larger than d_min but smaller than d_mean, 
assign 25 to the corresponding value in f.
If a value in d is larger than d_mean but smaller than d_max, assign 75 to the corresponding value in f.
If a value equals to d_mean, assign 50 to the corresponding value in f.
Assign 0 to the corresponding value(s) in f for d_min in d.
Assign 100 to the corresponding value(s) in f for d_max in d.
In the end, f should have only the following values: 0, 25, 50, 75, and 100.
Note: you don't have to use Numpy in this question.
"""
print("#16")

for x,arr1 in enumerate(d):
        for y,arr2 in enumerate(arr1):
                for z,num in enumerate(arr2):
                        if num > d_min and num < d_mean:
                                f[x][y][z] = 25
                        elif num > d_mean and num < d_max:
                                f[x][y][z] = 75
                        elif num == d_mean:
                                f[x][y][z] = 50
                        elif num == d_min:
                                f[x][y][z] = 0
                        elif num == d_max:
                                f[x][y][z] = 100

print(f)

print("\n")
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
print("#17")

print(d)
print(f)
print("I have my expected f!")

print("\n")
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
print("#18")

f = f.astype(str)
print('f.astype(str)')

for x,arr1 in enumerate(d):
        for y,arr2 in enumerate(arr1):
                for z,num in enumerate(arr2):
                        if num > d_min and num < d_mean:
                                f[x][y][z] = "B"
                        elif num > d_mean and num < d_max:
                                f[x][y][z] = "D"
                        elif num == d_mean:
                                f[x][y][z] = "C"
                        elif num == d_min:
                                f[x][y][z] = "A"
                        elif num == d_max:
                                f[x][y][z] = "E"

print(f)

print("\n")
