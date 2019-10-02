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