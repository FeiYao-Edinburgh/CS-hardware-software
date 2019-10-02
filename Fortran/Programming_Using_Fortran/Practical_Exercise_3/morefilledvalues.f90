program morefilledvalues

implicit none
real,dimension(:),allocatable :: p
integer :: upbnd,i,g,ierr

open(unit=10,file="statsa")
read(unit=10,fmt="(I5)") upbnd
allocate(p(1:upbnd),stat=ierr)

if (ierr/=0) then
print*,"p: allocation failed."
stop
else
do i=1,upbnd
read(unit=10,fmt="(f5.2)") p(i)
end do
end if

close(unit=10) ! Remember to close file. It's a good habit.

g=upbnd/5

do i=1,g
print*,p((i-1)*5+1:i*5)
end do
print*,p(i*5+1:upbnd)


if (allocated(p)) deallocate(p,stat=ierr) ! Deallocate the array timely.


end program morefilledvalues
