## Exercise-Answers-Fortran95

Fortran is an old but still very useful computer language. Because many earth system models are written using Fortran and they are not likely to be re-written using more modern languages such as Python or Julia in the short run, mastering Fortran becomes necessary to enable any possible model development work. The book [Introduction to Computer Programming Using Fortran 95](http://www.docs.is.ed.ac.uk/skills/documents/3570/3570.pdf) provides a good resource for learning Fortran syntaxs. The book [Introduction to Modern Fortran for the Earth System Sciences](https://link.springer.com/book/10.1007/978-3-642-37009-0) can be used to enhance Fortran programming capabilities in areas including NetCDF, Makefile compilation, parallel computing, and etc. I have gone through all the questions in the first book and would like to share my answers here for any possible discussion. Research students and staffs can log into Eddie (`ssh uun@eddie3.ecdf.ed.ac.uk`) to test these codes. I will go through the second book in the near future and do some notes and comments here.

### Compile a Fortran program with gfortran
To compile a Fortran program, `gfortran my_prog.f90 -o my_prog` or `gfortran -o my_prog my_prog.f90` is enough in most time, where `-o` means output executable file.

When it invloves module compilation, two ways can be used.
1. First compile the module file using `gfortran -c my_module.f90`, where `-c` means compile only. This will generate two files named `my_module.o` and `my_module.mod`. Then compile the main program using `gfortran -o my_prog my_prog.f90 my_module.o`.
2. Put the codes of `my_module.f90` and `my_prog.f90` in one file but keep those from `my_module.f90` first. Compile the combined file using `gfortran -o my_module_prog my_module_prog.f90` or `gfortran my_module_prog.f90 -o my_module_prog`.
3. Later check Chapter 5 of [Introduction to Modern Fortran for the Earth System Sciences](https://link.springer.com/book/10.1007/978-3-642-37009-0).

In Practical Exercise 5, I used both methods for Question 1 (Compiling Simple_Stats.f90 produced simple_stats.mod and Simple_Stats.o; compiling encapsulation.f90 with Simple_Stats.o produced encapsulation; compiling Simple_Stats_User.f90 with Simple_Stats.o produced Simple_Stats_User. Compiling Simple_Stats_User_Combined.f90 produced Simple_Stats_User_Combined) and method 2 for the remaining questions.

### Fortran Compilation with NetCDF
Simple programs using the [NetCDF-Fortran](https://www.unidata.ucar.edu/software/netcdf/docs-fortran/) can be downloaded from [here](https://www.unidata.ucar.edu/software/netcdf/examples/programs/). I have gone through all Fortran 90 program examples and made some more comments as follows and revisions (upload them to the NetCDF directory) for more discussion.

**1. Compilation tips.** When compiling, the computer might complain that `Fatal error: can't open module file 'netcdf.mod' for reading at <1>: no such file or directory`. In this case, we need to [tell the program the path of 'netcdf.mod'](https://www.unidata.ucar.edu/support/help/MailArchives/netcdf/msg09593.html) by using `-I` and `-l` parameters. They are further explained by searching the `gfortran` detailed help with `gfortran -v --help | less`.
```
  -l LIBNAME, --library LIBNAME
                              Search for library LIBNAME
  -I DIR                  add DIR to search list for .include directives
```
To locate the path of 'netcdf.mod', we can use `find` command like `find /usr/ -type f -name netcdf.mod`. After all of these, we can compile the program using `gfortran simple_xy_wr.f90 -o simple_xy_wr -I/usr/lib64/gfortran/modules/ -lnetcdff`.

**2. Array indexing, shape, and storing clarifications.** In standard, a mxn grid A is indexed by A(x,y) where x indicates row number and y indicates column number, hence the shape is mxn. A is stored by column-major format, namely A(1,1), A(2,1), A(3,1), ..., A(m,1), A(1,2), A(2,2), A(3,2), ..., A(m,2), ..., A(1,n), A(2,n), A(3,n), ..., A(m,n). **In NetCDF-Fortran, a mxn grid A is indexed by A(y,x) where y indicates column number and x indicates row number, hence the shape is nxm**. To make things easier, ***just look the array in NetCDF-Fortran by following the second -> first order in indexing and shape but bear in mind that the real array is still nxm shape and first -> second indexing***. To conclude, if we want to define a 6x12 grid, we define a 12x6 array data_out whose values can be copied from transpose(6x12 grid), we then define a NetCDF variable called data whose dimension is 12x6 (e.g. (/ y_dimid, x_dimid /) in simple_xy_wr.f90), we finally insert the data_out array into the variable data (i.e. ***the column-connetced values of data_out or the row-connected values of the 6x12 grid are inserted into the data variable row by row or the data variable array column by column (column is the first index indicating row in real array)***, because the first dimension of the data variable is column, which changes fastest and hence is the inner loop). In a later time, we read the NetCDF variable data back to an array data_in in Fortran, note that it is still 12x6 array with column first indexed (i.e. simple_xy_rd.f90). Nevertheless, if we use ncdump or xarray to read it becomes 6x12 grid with row first indexed as we wanted. (NB ***contents*** are principals and corresponding examples.) I suppose N-D array has the same logic as I saw that [one example](https://www.unidata.ucar.edu/software/netcdf/docs-fortran/f90-variables.html#f90-create-a-variable-nf90_def_var) in the NetCDF-Fortran official document defines a 3-D array (time x lat x lon) by using a reversed order for dimids, i.e. `(/ londimid, latdimid, timedimid /)`.

### Fortran Compilation using Makefile
[Following this](http://swcarpentry.github.io/make-novice/) and [this](https://thoughtbot.com/blog/the-magic-behind-configure-make-make-install) ASAP.

### Parallel Computing with OpenMP
To be added...


