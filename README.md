This repository will contain notes that I further enhance my capabilities of writing Python and Shell scripts.

### Resources for absolutely beginners
1. [The Unix Shell](https://swcarpentry.github.io/shell-novice/)
2. [Version Control with Git](https://swcarpentry.github.io/git-novice/)
3. [Programming with Python](https://swcarpentry.github.io/python-novice-inflammation/), [Plotting and Programming in Python](http://swcarpentry.github.io/python-novice-gapminder/)
4. [Automation and Make](http://swcarpentry.github.io/make-novice/)

### Highly recommended resources that deserves a must go
1. [The Linux Command Line](http://billie66.github.io/TLCL/book/index.html)
2. [Python Data Science Handbook](https://jakevdp.github.io/PythonDataScienceHandbook/)

### Other good resources
1. [Cartopy Plotting Galleries](https://mp.weixin.qq.com/s/VLRAwsNNdX7Yvnxt-JVHFA)
2. [Cartopy Plotting Galleries](https://stackoverflow.com/questions/55598249/showing-alaska-and-hawaii-in-cartopy-map)

### Advanced topics of Shell and Python
Python: locals(), \*arg, \*\*kwarg, and etc. in [Python Tips](https://book.pythontips.com/en/latest/#); \_\_file\_\_, \_\_doc\_\_, \_self, and etc. in [Python module slides](https://github.com/FeiYao-Edinburgh/Shell-Python-Advanced/blob/master/Slides/Python%E7%BC%96%E7%A8%8B%E5%9F%BA%E7%A1%80%EF%BC%8820140317%EF%BC%89.pdf).

1. **`sys.stdout.write()` vs. `print()`**. While `print(obj)` has become a function in Python 3.x, it calls `sys.stdout.write(obj+'\n')` for the most of the time. I personally regard `sys.stdout.write()` something like `printf()` function in C language. With `sys.stdout.write()` you can achieve more like [displaying progress](https://github.com/FeiYao-Edinburgh/Shell-Python-Advanced/blob/master/Scripts/sys_stdout_write.py).
2. Determine the location of a package by printing the package's \_\_file\_\_ attribute, e.g. `import minisom; print(minisom.__file__)`, then we can change the original codes if applicable.
3. In Python 3, taking quotient and remainder has become `//` and `%`. `/` will always return numbers with decimals.
4. `try/except/else/finally` in Python. This [link](https://www.cnblogs.com/windlazio/archive/2013/01/24/2874417.html) greatly explains the logical sequence of `try/except/else/finally`. We can also use `raise` statement to raise an error mandatorily so as to achieve some of the effects that we want. Note that `raise` must be followed by an `Exception` class, for convenience, we can just use `Exception`. See [my script](https://github.com/FeiYao-Edinburgh/Shell-Python-Advanced/blob/master/Scripts/try_except_else_finally_raise.py) for more details.
5. `with`

