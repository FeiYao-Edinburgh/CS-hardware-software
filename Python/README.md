# Python

### Good resources to follow
1. [Programming with Python](https://swcarpentry.github.io/python-novice-inflammation/)
2. [Plotting and Programming in Python](http://swcarpentry.github.io/python-novice-gapminder/)
3. [Python Data Science Handbook (Highly Recommended for Scientists!)](https://jakevdp.github.io/PythonDataScienceHandbook/)
4. [Intermediate Python](https://book.pythontips.com/en/latest/#)
5. [Cartopy Plotting Galleries I](https://mp.weixin.qq.com/s/VLRAwsNNdX7Yvnxt-JVHFA)
6. [Cartopy Plotting Galleries II](https://stackoverflow.com/questions/55598249/showing-alaska-and-hawaii-in-cartopy-map)

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

### Careat when using Python
- When we assign a list (or an array) to another list (or anpother array), the interpreter in fact creates a pointer under the hood. Therefore, we must be VERY careful as chaging the values of the assigned list/array will also lead to value changes in the original list (array). To copy a real list/array, use `a=b.copy()` for list and `a=np.copy(b)`.
