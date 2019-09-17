This repository will mainly contain notes that I further enhance my programming capabilities using Python and Shell. Meanwhile, it also contains good resources for absolutely beginners that I will also expplore over and over again.

### Software carpentry resources for absolutely beginners
1. [The Unix Shell](https://swcarpentry.github.io/shell-novice/)
2. [Extra Unix Shell Material](http://swcarpentry.github.io/shell-extras/)
2. [Version Control with Git](https://swcarpentry.github.io/git-novice/)
3. [Programming with Python](https://swcarpentry.github.io/python-novice-inflammation/), [Plotting and Programming in Python](http://swcarpentry.github.io/python-novice-gapminder/)
4. [Automation and Make](http://swcarpentry.github.io/make-novice/)

### Highly recommended resources that deserves a must go
1. [The Linux Command Line](http://billie66.github.io/TLCL/book/index.html)
2. [Python Data Science Handbook](https://jakevdp.github.io/PythonDataScienceHandbook/)

### Taking advantage of supercomputers such as Eddie
0. All computer related course at [UoE](https://www.wiki.ed.ac.uk/display/ResearchServices/Courses) and [EPCC](https://www.epcc.ed.ac.uk/online-learning)
1. [Introduction to Eddie](https://www.wiki.ed.ac.uk/display/ResearchServices/Introduction+to+Eddie)
2. [Using LOTUS in JASMIN](https://help.jasmin.ac.uk/article/110-lotus-overview)

### Other good resources
1. [Cartopy Plotting Galleries I](https://mp.weixin.qq.com/s/VLRAwsNNdX7Yvnxt-JVHFA)
2. [Cartopy Plotting Galleries II](https://stackoverflow.com/questions/55598249/showing-alaska-and-hawaii-in-cartopy-map)

### Excuting a script, either Shell or Python
Supposing you have the following two *hello world* scripts named *helloworld.sh* and *helloworld.py* written in Shell and Python, respectively, you have two ways of excuting them. For convenience the first method, namely `bash helloworld.sh` and `python helloworld.py`, is recommended as long as the `bash` and `python` interpreters are contained in `$PATH`.
```
echo "Hello World"
```
```
print("Hello World")
```
As an alternative, you can also add one line of code to the scripts shown above, make the scripts executable by `chmod u+x helloworld.sh` and `chmod u+x helloworld.py`, and run them directly by `./helloworld.sh` and `./helloworld.py`.
```
#!/bin/bash
echo "Hello World"
```
```
#!/exports/csce/datastore/geos/users/s1855106/miniconda/base/envs/geo/bin/python
print("Hello World")
```
The `#!` character sequence is, in fact, a special construct called a shebang. The shebang is used to tell the system the name of the interpreter that should be used to execute the script that follows. You can use `which bash` or `which python` to show the location of your interpreters. For each language, you might have several interpreters at the same time.

Then you can run them by typing `bash `
### Advanced topics of Python
1. **`sys.stdout.write()` vs. `print()`**. While `print(obj)` has become a function in Python 3.x, it calls `sys.stdout.write(obj+'\n')` for the most of the time. I personally regard `sys.stdout.write()` something like `printf()` function in C language. With `sys.stdout.write()` you can achieve more like [displaying progress](https://github.com/FeiYao-Edinburgh/Shell-Python-Advanced/blob/master/Scripts/sys_stdout_write.py).
2. Determine the location of a package by printing the package's \_\_file\_\_ attribute, e.g. `import minisom; print(minisom.__file__)`, then we can change the original codes if applicable.
3. In Python 3, taking quotient and remainder has become `//` and `%`. `/` will always return numbers with decimals.
4. `try/except/else/finally` in Python 3. This [link](https://www.cnblogs.com/windlazio/archive/2013/01/24/2874417.html) greatly explains the logical sequence of `try/except/else/finally`. We can also use `raise` statement to raise an error mandatorily so as to achieve some of the effects that we want. Note that `raise` must be followed by an `Exception` class, for convenience, we can just use `Exception`. See [my script](https://github.com/FeiYao-Edinburgh/Shell-Python-Advanced/blob/master/Scripts/try_except_else_finally_raise.py) for more details.
5. `with` in Python 3.

### Advanced topics of Shell
1. When you cannot terminate a process by `Ctrl-C`, you can use `Ctrl-Z` to stop the command first, then use `jobs` to obtain its jobspec, finally use `kill -9 %jobspec` to kill it.
2. Short-cuts in Terminal to make life easier: Ctrl-left/right arrows to move between words quickly. Middle mouse button for quick copy and paste.
3. Short-cuts in Vim to make life easier: Ctrl/Shift-left/right arrows to move between words quickly. Visual code, v+left/right/up/down arrows to select a part of contexts, or Shift-v to select the whole line, then d for cut or y for copy, finally p for paste.

Do in a later time: locals(), \*arg, \*\*kwarg, and etc. in [Python Tips](https://book.pythontips.com/en/latest/#); \_\_file\_\_, \_\_doc\_\_, \_self, and etc. in [Python module slides](https://github.com/FeiYao-Edinburgh/Shell-Python-Advanced/blob/master/Slides/Python%E7%BC%96%E7%A8%8B%E5%9F%BA%E7%A1%80%EF%BC%8820140317%EF%BC%89.pdf).

-Fei (12/9/2019 @Edinburgh)

