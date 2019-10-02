This repository will mainly contain notes that I further enhance my programming capabilities using Python and Shell. Meanwhile, it also contains good resources for absolutely beginners that I will also expplore over and over again.

### Two ways of executing scripts.
Supposing you have the following two *hello world* scripts named *helloworld.sh* and *helloworld.py* written in Shell and Python, respectively, you have two ways of excuting them. For convenience the first method, namely `bash helloworld.sh` or `python helloworld.py`, is recommended as long as the paths of `bash` and `python` interpreters are contained in `$PATH`.
```
echo "Hello World"
```
```
print("Hello World")
```
As an alternative, you can also add one line of code to the first line of the scripts shown above, make the scripts executable by `chmod u+x helloworld.sh` and `chmod u+x helloworld.py`, and run them directly by `./helloworld.sh` and `./helloworld.py`.
```
#!/usr/bin/bash
echo "Hello World"
```
```
#!/exports/csce/datastore/geos/users/s1855106/miniconda/base/envs/geo/bin/python
print("Hello World")
```
The `#!` character sequence is, in fact, a special construct called a shebang. The shebang is used to tell the system the name of the interpreter that should be used to execute the script that follows. You can use `which bash` or `which python` to show the location of your interpreters. For each language, you might have several interpreters at the same time. For example you might also have another `bash` in `/bin/bash`.

