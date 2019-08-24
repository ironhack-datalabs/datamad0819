#1. Import the NUMPY package under the name np.

import numpy as np

#2. Print the NUMPY version and the configuration.

print("Numpy version:",np.version.version,"\n","Configuration",np.show_config())

#3. Generate a 2x3x5 3-dimensional array with random values. Assign the array to variable "a"
# Challenge: there are at least three easy ways that use numpy to generate random arrays. How many ways can you find?

a = np.random.random((2,3,5))
a2 = np.random.normal(size=(2,3,5))
a3 = np.random.uniform(size=(2,3,5))

#4. Print a.

print("First random array =",a)

#Two extra randoms array

print("\n","Second random array=",a2)

print("\n","Third random array=",a3)

#5. Create a 5x2x3 3-dimensional array with all values equaling 1.
#Assign the array to variable "b"

b = np.ones((5,2,3))

#6. Print b.

print(b)

#7. Do a and b have the same size? How do you prove that in Python code?

print(np.prod(np.shape(a))==np.prod(np.shape(b)))


#8. Are you able to add a and b? Why or why not?

print("No, you cannot because altough they have the same size the structures are not compatible.")

#9. Transpose b so that it has the same structure of a (i.e. become a 2x3x5 array). Assign the transposed array to varialbe "c".

c = np.reshape(b,(2,3,5))


print(c)

#10. Try to add a and c. Now it should work. Assign the sum to varialbe "d". But why does it work now?

d = a + c

print(d)

#11. Print a and d. Notice the difference and relation of the two array in terms of the values? Explain.

print(a)
print(d)

print("The difference and relation of the values in the two arrays is d[i] = a[i] + 1")

#12. Multiply a and c. Assign the result to e.

e = np.multiply(a,c)

print(e)

#13. Does e equal to a? Why or why not?

print("Yes, it does because we are multiplying every value by 1. a[i]*1 = a[i]")
print(a==e)

#14. Identify the max, min, and mean values in d. Assign those values to variables "d_max", "d_min", and "d_mean"

d_max = np.max(d)
d_min = np.min(d)
d_mean = np.mean(d)


print(d_max)
print(d_min)
print(d_mean)

#15. Now we want to label the values in d. First create an empty array "f" with the same shape (i.e. 2x3x5) as d using `np.empty`.

f = np.empty([2,3,5])

print(f)


# 16. Populate the values in f. For each value in d, if it's larger than d_min but smaller than d_mean, assign 25 to the corresponding value in f.
# If a value in d is larger than d_mean but smaller than d_max, assign 75 to the corresponding value in f.
# If a value equals to d_mean, assign 50 to the corresponding value in f.
# Assign 0 to the corresponding value(s) in f for d_min in d.
# Assign 100 to the corresponding value(s) in f for d_max in d.
# In the end, f should have only the following values: 0, 25, 50, 75, and 100.
# Note: you don't have to use Numpy in this question.

for z in range(len(f)):
        for y in range(len(f[z])):
                for x in range(len(f[z][y])):
                        if (d[z][y][x] > d_min and d[z][y][x]<d_mean):
                                f[z][y][x] = 25
                        elif (d[z][y][x] > d_mean and d[z][y][x]<d_max):
                                f[z][y][x] = 75
                        elif d[z][y][x] == d_mean:
                                f[z][y][x] = 50
                        elif d[z][y][x] == d_min:
                                f[z][y][x] = 0
                        elif d[z][y][x] == d_max:
                                f[z][y][x] = 100


#17. Print d and f. Do you have your expected f?


print("The matrxi D: ",d)
print("The matrix F: ",f)




#18. Bonus question: instead of using numbers (i.e. 0, 25, 50, 75, and 100), how to use string values 
# ("A", "B", "C", "D", and "E") to label the array elements? You are expecting the result to be:


new_f = np.select([f==0,f==25,f==50,f==75,f==100],["A", "B", "C", "D","E"])

print("New F: ",new_f)