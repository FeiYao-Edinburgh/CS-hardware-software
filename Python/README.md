# Python

Using [Jupyter Notebook provided by School of GeoSciences](https://www.geos.ed.ac.uk/notebook) to learn and practice.

### Good resources to follow
1. [Programming with Python](https://swcarpentry.github.io/python-novice-inflammation/)
2. [Plotting and Programming in Python](http://swcarpentry.github.io/python-novice-gapminder/)
3. [Python Data Science Handbook (Highly Recommended for Scientists!)](https://jakevdp.github.io/PythonDataScienceHandbook/)
4. [Intermediate Python](https://book.pythontips.com/en/latest/#) (\*arg and \*\*kwarg completed.)
5. [Cartopy Plotting Galleries I](https://mp.weixin.qq.com/s/VLRAwsNNdX7Yvnxt-JVHFA)
6. [Cartopy Plotting Galleries II](https://stackoverflow.com/questions/55598249/showing-alaska-and-hawaii-in-cartopy-map)
7. [NumPy for Matlab users](https://docs.scipy.org/doc/numpy/user/numpy-for-matlab-users.html) (regress ~~~ linalg.lstsqregress ~~~ )
8. [Data science with Python: 8 ways to do linear regression and measure their speed (also more reading on differences between linear and non-linear regression models, why R^2 cannot always be used for assess model's capabilities (residual plot is surely needed)...)](https://www.freecodecamp.org/news/data-science-with-python-8-ways-to-do-linear-regression-and-measure-their-speed-b5577d75f8b/)

### Running a Python script
Supposing your `helloworld.py` script has the following code.
```
print("Hello World")
```
You can easily run it by typing `python helloworld.py` as long as `python` interpreter is in your `$PATH`. Alternatively, you can add the following code to the first line of the script and run it as `chmod u+x helloworld.py; ./helloworld.py`.
```
#!/exports/csce/datastore/geos/users/s1855106/miniconda/base/envs/geo/bin/python
print("Hello World")
```
The `#!` character sequence is, in fact, a special construct called a shebang. The shebang is used to tell the system the name of the interpreter that should be used to execute the script that follows. You can use `which python` to show the location of your interpreters.

### Careats/tips when using Python
- When we assign a list (or an array) to another list (or anpother array), the interpreter in fact creates a pointer under the hood. Therefore, we must be VERY careful as chaging the values of the assigned list/array will also lead to value changes in the original list (array). To copy a real list/array, use `a=b.copy()` for list and `a=np.copy(b)`. **This problem also goes into slicing for array but not list, explained in p.46 in Python Data Science Handbook.**
- For VERY large ndarray computation, specifying `out` argument can significantly save memory use, said in p.57 in Python Data Science Handbook (currently does not matter for me since our linux servers have a relatively large size of memories).
- `axis=` keyword is always used when using numpy to do some calculations. `axis` actually specifies the dimension of the array that will be **collaspsed**, said in p.60 in Python Data Science Handbook.
- New Numpy functions mastered and will be used. `np.copy()`, `np.all()`, `np.any()`, `np.argmin()`, `np.argmax()`, `np.random.choice()`, `np.random.shuffle()`, ...
- assignment-type operators such as `+=`, `-=`, `*=`, and etc should be more used later.
- All of the arithmetic operators are simply convenient wrappers around specific functions (NaN-safe counterparts may exist) built into Numpy. When using functions, we can specify `out` keyword directly, of which proactice can save memory use significantly, see following:
```
x=np.arange(5)
y=np.empty(5)
np.multiply(x,10,out=y)
```
- Semicolon `;` is used in Python when you want to supress output of a command.
- Refer to p.40 of Python Data Science Handbook to distinguish the difference between `np.random.normal()` and `np.random.random()`. The former is to produce normal distribution while the latter is to produce uniformaly random distribution.
- `np.sum()` plus with boolean arrays is always used for counting purpose.
- Logical expressions applied on boolean arrays take single symbols such as `&`, `|`, and `~`.
- Numpy ndarray slicing can rely on simple indexing, boolean masking, and **fancy indexing**.
- [\*arg, \*\*kwarg, \*var, \*\*var](https://www.jianshu.com/p/be92113116c8) can be VERY helpful in Python coding. Use them as possible as I can.
- Repeatedly considering the combining indexing in p.80 in Python Data Science Handbook, especially boolean mask indexing that I previously used as granted. Broadcast are used under the hood!!! `np.where()` is essentially producing fancy indexing values.
- When doing Pandas selection, use `.loc` and `.iloc` as possible as I can. The corresponding methods for NetCDF files are `.sel` and `.isel`.
- Because Pandas is designed to work with NumPy, any NumPy ufunc will work on Pandas Series and DataFrame objects.
- Personally, arrays of objects are not recommended for use since operations on the data will be done on Python level rather than the compiled level, said in p. 121 - 122 in Python Data Science Handbook.
- While it is fine to do slicing for unsorted normal Series and DataFrame, it is necessary to sort the index of MultiIndex Series or DataFrame to perform desired slicing, see examples below.
```
import numpy as np
import pandas as pd
data = pd.DataFrame(np.random.rand(3,4),index=['a','c','b'],columns=['g','e','f','h'])
data['a':'c'] # equals data.loc['a':'c',:]
data.loc['a':'c','g':'f']
# Now for MultiIndex DataFrame/Series
index=pd.MultiIndex.from_product([['a','c','b'],[1,2]])
columns=pd.MultiIndex.from_product([['g','e','f'],[1,2]])
data=pd.DataFrame(np.random.random((6,6)),index=index, columns=columns) # np.random.random and np.random.rand is almost the same except the different number of arguments accepted, more details here: https://stackoverflow.com/questions/47231852/np-random-rand-vs-np-random-random.
# data['a':'c'] # UnsortedIndexError: 'Key length (1) was greater than MultiIndex lexsort depth (0)'
data = data.sort_index() # debug
data['a':'c'] # Now will be fine
idx=pd.IndexSlice # Great method for MultiIndex DataFrame. Not necessary for MultiIndex Series.
data.loc[idx[:,1],idx[:,2]]
```
- It becomes extremely easy to calculate data statistics within certain groups with the MultiIndex DataFrame, see example in p.141 in Python Data Science Handbook!
- 

### Possible Errata for Python Data Science Handbook
- p.64, According to Figure 2-4 and Rule 2, the one-dimentioanl array is stretched, or broadcat, across the second -> first dimention in order to match the shape of M.
- p.75, `(inches < 0.2)` -> `(inches < 0.1)`?
- 
