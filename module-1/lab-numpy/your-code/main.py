
#1. Import the NUMPY package under the name np.

import numpy as np

#2. Print the NUMPY version and the configuration.
print("\n\n=============================")
print("=        Ejercicio 2        =")
print("=============================")
print("\n\n")

print("La version de numpy es " + np.version.version)


#3. Generate a 2x3x5 3-dimensional array with random values. Assign the array to variable "a"
# Challenge: there are at least three easy ways that use numpy to generate random arrays. How many ways can you find?

a=np.random.random((2,3,5))

#4. Print a.
print("\n\n=============================")
print("=        Ejercicio 4        =")
print("=============================")
print("\n\n")
print(a)

#5. Create a 5x2x3 3-dimensional array with all values equaling 1.
#Assign the array to variable "b"

b=np.ones((5,2,3))

#6. Print b.

print("\n\n=============================")
print("=        Ejercicio 6        =")
print("=============================")
print("\n\n")
print(b)

#7. Do a and b have the same size? How do you prove that in Python code?
print("\n\n=============================")
print("=        Ejercicio 7        =")
print("=============================\n\n")

print("Tienen a y b el mismo tamano?")
print(a.shape==b.shape)


#8. Are you able to add a and b? Why or why not?
print("\n\n=============================")
print("=        Ejercicio 8        =")
print("=============================\n\n")

#c=a+b
print("a+b")
print("ERROR: operands could not be broadcast together with shapes (2,3,5) (5,2,3)")
print("Tienen tamanos distintos")
#9. Transpose b so that it has the same structure of a (i.e. become a 2x3x5 array). Assign the transposed array to varialbe "c".
print("\n\n=============================")
print("=        Ejercicio 9        =")
print("=============================\n\n")
c=np.transpose(b,(1,2,0))
print("La nueva forma de c(b) es "+str(c.shape))
#10. Try to add a and c. Now it should work. Assign the sum to varialbe "d". But why does it work now?



d=a+c



#11. Print a and d. Notice the difference and relation of the two array in terms of the values? Explain.
print("\n\n=============================")
print("=        Ejercicio 11       =")
print("=============================\n\n")
print("Array a")
print(a)
print("\n\nArray d")
print(d)
print("\nLos valores de d son 1 mas grandes que los d.")
print("\nLa diferencia visual esta en que de lo escribe en notacion cientifica.")
#12. Multiply a and c. Assign the result to e.
print("\n\n=============================")
print("=        Ejercicio 12       =")
print("=============================\n\n")
e=a*c
print("Array e")
print(e)


#13. Does e equal to a? Why or why not?
print("\n\n=============================")
print("=        Ejercicio 13       =")
print("=============================\n\n")
print("Does e equal to a?")
print((a==e).all())




#14. Identify the max, min, and mean values in d. Assign those values to variables "d_max", "d_min", and "d_mean"
print("\n\n=============================")
print("=        Ejercicio 14       =")
print("=============================\n\n")
d_max=np.amax(d)
print("El maximo de d es: "+ str(d_max))
d_min=np.amin(d)
print("El minimo de d es: "+ str(d_min))
d_mean=np.mean(d)
print("La media de d es: "+ str(d_mean))



#15. Now we want to label the values in d. First create an empty array "f" with the same shape (i.e. 2x3x5) as d using `np.empty`.
print("\n\n=============================")
print("=        Ejercicio 15       =")
print("=============================\n\n")
f=np.empty((2,3,5))
print(f)


"""
#16. Populate the values in f. For each value in d, if it's larger than d_min but smaller than d_mean, assign 25 to the corresponding value in f.
If a value in d is larger than d_mean but smaller than d_max, assign 75 to the corresponding value in f.
If a value equals to d_mean, assign 50 to the corresponding value in f.
Assign 0 to the corresponding value(s) in f for d_min in d.
Assign 100 to the corresponding value(s) in f for d_max in d.
In the end, f should have only the following values: 0, 25, 50, 75, and 100.
Note: you don't have to use Numpy in this question.
"""


def equivalen_Value(a, d_min, d_mean, d_max):
        if a==d_min:
                return 0
        elif a<d_mean:
                return 25
        elif a==d_mean:
                return 50
        elif a<d_max:
                return 75
        elif a==d_max:
                return 100


vfunc = np.vectorize(equivalen_Value)
f=vfunc(d,d_min, d_mean, d_max)


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
print("\n\n=============================")
print("=        Ejercicio 17       =")
print("=============================\n\n")


print("El maximo de d es: "+ str(d_max))
print("El minimo de d es: "+ str(d_min))
print("La media de d es: "+ str(d_mean))

print("Array d")
print(d)
print("\nArray f")
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



print("\n\n=============================")
print("=        Ejercicio 18       =")
print("=============================\n\n")

def equivalen_letter(a, d_min, d_mean, d_max):
        if a==d_min:
                return "A"
        elif a<d_mean:
                return "B"
        elif a==d_mean:
                return "C"
        elif a<d_max:
                return "D"
        elif a==d_max:
                return "E"


vfunc = np.vectorize(equivalen_letter)
g=vfunc(d,d_min, d_mean, d_max)

print("El maximo de d es: "+ str(d_max))
print("El minimo de d es: "+ str(d_min))
print("La media de d es: "+ str(d_mean))

print("Array d")
print(d)
print("\nArray g")
print(g)


