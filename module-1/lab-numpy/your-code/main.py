#1. Import the NUMPY package under the name np.

import numpy as np

#2. Print the NUMPY version and the configuration.

$ python3 -m pip show numpy 
Name: numpy
Version: 1.17.0
Summary: NumPy is the fundamental package for array computing with Python.
Home-page: https://www.numpy.org
Author: Travis E. Oliphant et al.
Author-email: None
License: BSD
Location: c:\users\david\appdata\local\programs\python\python37-32\lib\site-packages
Requires:
Required-by: pandas



#3. Generate a 2x3x5 3-dimensional array with random values. Assign the array to variable "a"
# Challenge: there are at least three easy ways that use numpy to generate random arrays. How many ways can you find?

a = np.random.random((2,3,5))


#4. Print a.

[[[0.55560201 0.09725896 0.27730659 0.91387179 0.91251196]
  [0.48958978 0.49038877 0.70675384 0.93762862 0.7953841 ]
  [0.24027796 0.55528132 0.59130435 0.06312534 0.09786939]]

 [[0.12397164 0.60802355 0.93612415 0.76362798 0.73784694]
  [0.34998824 0.08274676 0.66320567 0.98131649 0.90312513]
  [0.54342087 0.20041009 0.7879777  0.47362782 0.18967117]]]



#5. Create a 5x2x3 3-dimensional array with all values equaling 1.
#Assign the array to variable "b"

b = np.ones((5,2,3))

#6. Print b.

[[[1. 1. 1.]
  [1. 1. 1.]]

 [[1. 1. 1.]
  [1. 1. 1.]]

 [[1. 1. 1.]
  [1. 1. 1.]]

 [[1. 1. 1.]
  [1. 1. 1.]]

 [[1. 1. 1.]
  [1. 1. 1.]]]


#7. Do a and b have the same size? How do you prove that in Python code?

yes, they have the same size

print(np.size(a))
print(np.size(b))

30
30



#8. Are you able to add a and b? Why or why not?

no por que son diferentes estructuras:
    2x3x5
    5x2x3

no puedes sumar 2 con 3, ni 3 con 2....

#9. Transpose b so that it has the same structure of a (i.e. become a 2x3x5 array). Assign the transposed array to varialbe "c".

c = b.reshape((2,3,5))

[[[1. 1. 1. 1. 1.]
  [1. 1. 1. 1. 1.]
  [1. 1. 1. 1. 1.]]

 [[1. 1. 1. 1. 1.]
  [1. 1. 1. 1. 1.]
  [1. 1. 1. 1. 1.]]]

#10. Try to add a and c. Now it should work. Assign the sum to varialbe "d". But why does it work now?

d = a+c

[[[1.82834426 1.26882767 1.59578325 1.52703667 1.99051799]
  [1.60019604 1.25314029 1.73943784 1.08072443 1.36888319]
  [1.69642103 1.43222122 1.74472328 1.95162186 1.38130396]]

 [[1.00689839 1.95487914 1.27667381 1.26361482 1.35187384]
  [1.97802269 1.07030277 1.64546856 1.16771015 1.02269058]
  [1.24925427 1.18202927 1.76381643 1.61283477 1.79944171]]]

#11. Print a and d. Notice the difference and relation of the two array in terms of the values? Explain.

esto es a
[[[0.18882093 0.40925527 0.03136646 0.54150549 0.51946675]
  [0.0971368  0.19650232 0.17184274 0.41552614 0.41505873]
  [0.65785771 0.48683423 0.10799751 0.52120409 0.09752908]]

 [[0.76724713 0.86594726 0.06262684 0.41977421 0.69140718]
  [0.67509294 0.43336692 0.42379548 0.9275428  0.0527975 ]
  [0.71825616 0.92576718 0.69838882 0.48326942 0.15086695]]]
esto es d
[[[1.18882093 1.40925527 1.03136646 1.54150549 1.51946675]
  [1.0971368  1.19650232 1.17184274 1.41552614 1.41505873]
  [1.65785771 1.48683423 1.10799751 1.52120409 1.09752908]]

 [[1.76724713 1.86594726 1.06262684 1.41977421 1.69140718]
  [1.67509294 1.43336692 1.42379548 1.9275428  1.0527975 ]
  [1.71825616 1.92576718 1.69838882 1.48326942 1.15086695]]]


#12. Multiply a and c. Assign the result to e.

e = a*c

[[[0.98282868 0.45277999 0.63365108 0.39747626 0.09548012]
  [0.0634071  0.0341348  0.64839895 0.85151113 0.63212942]
  [0.28501485 0.1155929  0.13184335 0.27868903 0.62908472]]

 [[0.09861034 0.51543296 0.98469991 0.87962654 0.99194248]
  [0.27763786 0.74625129 0.93334596 0.15720312 0.5444069 ]
  [0.80734213 0.31326366 0.7839625  0.38158841 0.37930133]]]


#13. Does e equal to a? Why or why not?

print(a)
print(e)


[[[0.47552505 0.14193262 0.06787854 0.01579533 0.39900469]
  [0.82210666 0.56108753 0.75824019 0.79119477 0.37428686]
  [0.83332065 0.04616131 0.13699996 0.23191417 0.58496393]]

 [[0.13482994 0.69732647 0.59693326 0.5110235  0.46687715]
  [0.50287017 0.0571989  0.37290844 0.55289606 0.43141077]
  [0.61330529 0.65596495 0.27951478 0.37299299 0.92388978]]]

[[[0.47552505 0.14193262 0.06787854 0.01579533 0.39900469]
  [0.82210666 0.56108753 0.75824019 0.79119477 0.37428686]
  [0.83332065 0.04616131 0.13699996 0.23191417 0.58496393]]

 [[0.13482994 0.69732647 0.59693326 0.5110235  0.46687715]
  [0.50287017 0.0571989  0.37290844 0.55289606 0.43141077]
  [0.61330529 0.65596495 0.27951478 0.37299299 0.92388978]]]




#14. Identify the max, min, and mean values in d. Assign those values to variables "d_max", "d_min", and "d_mean"

print(np.max(d))
print(np.min(d))
print(np.mean(d))

1.959106557352182
1.0216684700527727
1.492687913793761


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