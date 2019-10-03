## Fortran

Fortran is an old but still very useful computer language. Because many earth system models are written using Fortran and they are not likely to be re-written using more modern languages such as Python or Julia in the short run, mastering Fortran becomes necessary to enable any possible model development work. The book [Introduction to Computer Programming Using Fortran 95](http://www.docs.is.ed.ac.uk/skills/documents/3570/3570.pdf) provides a good resource for learning basic Fortran syntaxs. The book [Introduction to Modern Fortran for the Earth System Sciences](https://link.springer.com/book/10.1007/978-3-642-37009-0) can be used to enhance Fortran programming capabilities in areas including NetCDF, Makefile compilation, parallel computing, and etc. I have gone through all the questions in the first book and would like to share my answers here for any possible discussion. Research students and staffs can log into Eddie (`ssh uun@eddie3.ecdf.ed.ac.uk`) to test these codes. I will go through the second book in the near future and do some notes and comments here.

### Compile a Fortran program with gfortran
To compile a Fortran program, `gfortran my_prog.f90 -o my_prog` or `gfortran -o my_prog my_prog.f90` is enough in most time, where `-o` means output executable file.

When it invloves module compilation, two ways can be used.
1. First compile the module file using `gfortran -c my_module.f90`, where `-c` means compile only. This will generate two files named `my_module.o` and `my_module.mod`. Then compile the main program using `gfortran -o my_prog my_prog.f90 my_module.o`.
2. Put the codes of `my_module.f90` and `my_prog.f90` in one file but keep those from `my_module.f90` first. Compile the combined file using `gfortran -o my_module_prog my_module_prog.f90` or `gfortran my_module_prog.f90 -o my_module_prog`.
3. Later check Chapter 5 of [Introduction to Modern Fortran for the Earth System Sciences](https://link.springer.com/book/10.1007/978-3-642-37009-0).

In Practical Exercise 5, I used both methods for Question 1 (Compiling Simple_Stats.f90 produced simple_stats.mod and Simple_Stats.o; compiling encapsulation.f90 with Simple_Stats.o produced encapsulation; compiling Simple_Stats_User.f90 with Simple_Stats.o produced Simple_Stats_User. Compiling Simple_Stats_User_Combined.f90 produced Simple_Stats_User_Combined) and method 2 for the remaining questions.

### Fortran Compilation using Makefile
[Following this](http://swcarpentry.github.io/make-novice/) and [this](https://github.com/seisman/how-to-write-makefile) ASAP.

### Parallel Computing with OpenMP
To be added...


