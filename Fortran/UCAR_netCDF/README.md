### Fortran Compilation with NetCDF
Simple programs using the [NetCDF-Fortran](https://www.unidata.ucar.edu/software/netcdf/docs-fortran/) can be downloaded from [here](https://www.unidata.ucar.edu/software/netcdf/examples/programs/). I have gone through all Fortran 90 program examples and made some more comments as follows and revisions (upload them to the NetCDF directory) for more discussion.

**1. Compilation tips.** When compiling, the computer might complain that `Fatal error: can't open module file 'netcdf.mod' for reading at <1>: no such file or directory`. In this case, we need to [tell the program the path of 'netcdf.mod'](https://www.unidata.ucar.edu/support/help/MailArchives/netcdf/msg09593.html) by using `-I` and `-l` parameters. They are further explained by searching the `gfortran` detailed help with `gfortran -v --help | less`.
```
  -l LIBNAME, --library LIBNAME
                              Search for library LIBNAME
  -I DIR                  add DIR to search list for .include directives
```
To locate the path of 'netcdf.mod', we can use `find` command like `find /usr/ -type f -name netcdf.mod`. After all of these, we can compile the program using `gfortran simple_xy_wr.f90 -o simple_xy_wr -I/usr/lib64/gfortran/modules/ -lnetcdff`.
