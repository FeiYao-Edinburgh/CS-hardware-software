program filedvalues
    implicit none
    integer :: first
    real :: second
    character(len=6) :: filename='statsa'
    open(unit=10,file=filename)
    read(unit=10,fmt="(I5)") first
    read(unit=10,fmt="(F5.2)") second
    write(unit=6,fmt="(I5)") first
    write(unit=6,fmt="(F5.2)") second
    close(unit=10)
end program filedvalues
