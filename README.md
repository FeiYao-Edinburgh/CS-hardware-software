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
1. Python: locals(), \*arg, \*\*kwarg, sys.and etc. in [Python Tips](https://book.pythontips.com/en/latest/#)
2. Shell: du -h --max-depth=2 /home/

1. **`sys.stdout.write()` vs. `print()`**. While `print(obj)` has become a function in Python 3.x, it calls `sys.stdout.write(obj+'\n')` for the most of the time. I personally regards it more like `printf()` function in C language. With `sys.stdout.write()` you can achieve more like displaying progress as the following.
```
import time,sys
for i in range(1,100,1):
    sys.stdout.write("\r{0}{1:.2f}%".format("|"*i,i))
#     Or simple use sys.stdout.write(f"\r{i*'|'}{i:0.2f}%") for the above.
#     '\r' will send the cursor to the beginning of the line, where it can overwrite the existing text, which also means the later text should have more characters than the former ones.
    sys.stdout.flush() # For better effect.
    time.sleep(0.01)
# Output will like: |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||99.00%
```
