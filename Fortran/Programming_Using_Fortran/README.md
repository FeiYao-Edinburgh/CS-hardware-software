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

### Fortran Learning Notes (Python comparison and errata somewhere)
1. REALs are stored approxiamtely in Fortran. Therefore, to determine whether real number A equals or does not equal real number B, we should use `abs(A-B)<ϵ` instead of `A==B` or `A/=B`, where `ϵ` is set to a suitable small number.
2. Names in Fortran must start with letters and be less than 31 characters. Lower case letters are equivalent to upper case letters.
3. Scalar character constants can assume their length from the associated literal (LEN=\*) only if the attribute parameter is present (i.e. `character(len=*),parameter :: son='bart'`).
4. Continuation mark in Fortran: ampersand (&); Comment mark in Fortran: exclamation (!). Corresponding marks in Python are backslash (\\) and number sign (#).
5. // is used to concatenate two characters in Fortran while + or \* is used in Python.
6. Formatting is a means of converting coded values into characters which can be read on a screen (output) or typed in from a keyboard (input). Note that for An, padding rules are different for input and output and for Fw.d and Ew.d, only w takes effect in input. Check the PPT slide for more clear illustration of these rules. (***Still do not understand p.14 components...***)
7. Two occurrences of the delimiter inside a string produces one occurrence on output. Using apostophe and quotation is more convenient, comparing `"He said ""Fortran is interesting."""` is equavalent to `'He said "Fortran is interesting."'`.
8. Defining a string in Fortran is not that convenient since it is a necessity to speficy the length of the string but p.58 tells that we can use `len()` to obtain the length of the string.
9. Continuing 8, when displaying strings in screen, we can always use fmt='(a)' to avoid specifying the length of the string, say `write(unit=6,fmt='(a)',advance='no') 'Please type in your number: '`, where `advance='no'` make your type follow the string instead of appearing in a new line.
10. unit=0,5,6 are reserved for specific use, i.e., standard error, output, and input.
11. We can even use write() to modify the value of a string variable, see following:
```
! Code
program test
implicit none
character(len=len('hhhh'))::a='hhhh'
print*,a
write(a,fmt='(A)') 'haha' ! fmt='(A)' comes from 9. ! fmt=* can survive compiling but not running. it seems that * is more suitable for numbers.
print*,a
end program test
! Output
! hhhh
! haha
```
12. `read*,` and `print*`, can always be used instead of `read(*,*)` and `write(*,*)` to decrease typing work.
13. p.17 ***What is the difference between keywords Stop and Exit in Fortran?***
  - Stop will jump out of the whole program while exit is always used within a loop to jump out of it, refer to another example presented in p.46.
14. When addressing files, always use iostat keyword and close(unit=) timely.
15. Unlike Python, all the variables used in a Fortran program must be defined in its ***Specification Part***. All the actual work are then executed in its ***Execution Part***.
16. Fortran use /= to represent inequality while Python use !=.
17. semicolon (i.e. ;) can be used in both Fortran (p.19 END IF and p.30 SELECT CASE) and Python (a=1;b=2;c=3;) to seperate statement (i.e. multiple codes in single line).
18. p.27-28, errata, there should be blanks in both end if and else if but they are missing somewhere.
19. p.31, ***do not understand the advantage of naming select case and do not understannd what does"control cannot jump into a case construct" mean, say p.38 I have used nested case select for Question 9***
20. Fortran vs. Python: Exit ~ break; Cycle ~ continue
21. p.41, Fortran array is of column major order while Python is of row major order. The default lower bound of array in Fortran is 1 while it is 0 in Python numpy. Nevertheless, Fortran supports any lower and upper bounds (e.g. p.42)! Array subscripting and slice in Fortran is achieved by () while by [] in Python numpy.
22. p.42, subscript-triplets, Fortran include the end if possible while Python numpy does not.
23. p.44, ***it seems that Array Section Expressions lack a program for illustration...***
24. p.17 and p.50-51, iostat=ierr and STAT=ierr were used in reading a file and allocating/deallocating an array and ierr/=0 indicates failure.
25. p.53, Answer for Question 8 can be found in PPT slide.
26. p.54, errata, Question 9, Exercise 2, Question 7 ==> Exercise 1, Question 5.
27. It is a good programming practice to include a statement in every program unit that contains references to intrinsic procudures in order to help readers (e.g. `intrinsic :: sin, cos, sinh, len, len_trim`).
28. The use of INTENT attributes (i.e. in, out, and inout) is always recommended!
29. If a procedure changes the value of an argument then it is better for this procudure to be a subroutine rather than a function.
30. p.60, Subroutines or Functions? The five bullets list there just tell good habits of using functions! Specifically, set intent of input as in and output as out, do not alter variables accessed by host (global data) or use association, do not contain local variables with the attribute SAVE, do not perform any operation on external file, do not contain stop statement. It is recommended to alter input and output variables via subroutines (see 29). It is not recommended to use global data in neither functions or subroutines. SAVE attribute is at least strange for me and I choose not to use it. No thought on the last two statements up to now.
31. p.64, Question, ***what is interface block?***
32. It's always recommended to use internal functions, but it is also permissable to use external functions (i.e. defining functions outside the main program, then define it in the main program like defining variables (type is the function return type), e.g. real, external :: function name).
33. p.72, understanding, this allows theta to be used within the module, meanwhile, we can define another theta outside the module (e.g. in a main program) for use. height=2.9 is surely forbidden because height in the module is unaccessible but we can real::height=2.9.
34. Python use => for renaming module objects imported while Python use as (e.g. use Triangle_Operations, [only:] Space => Area vs. import numpy as np, note that Space and np are the names that you want to use).
35. Array definitions can be made by `integer, dimension(5) :: data` or `integer :: data(5)`, `integer, dimension(5,4) :: data` or `integer :: data(5,4)`, and etc.
36. [The maximum single-line length is limited to 132 characters in Fortran standard.](https://stackoverflow.com/questions/44990119/why-is-maximum-single-line-length-limited-to-132-characters-in-fortran-standard)
37. 

