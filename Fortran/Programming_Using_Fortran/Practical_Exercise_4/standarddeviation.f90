program standarddeviation

implicit none
real,dimension(:),allocatable::p
integer :: upbnd,i,k,ierr
character(len=6),dimension(2)::filenames
! Add a loop of files.
filenames=(/'statsa','statsb'/)

do k=1,2
print*,filenames(k)
open(unit=10,file=filenames(k))
read(unit=10,fmt="(I5)") upbnd
allocate(p(1:upbnd),stat=ierr)
if (ierr/=0) then
print*,"allocate memory for p failed."
cycle
end if
do i=1,upbnd
read(unit=10,fmt="(F5.2)") p(i)
end do
close(unit=10)
print*,deviation(p)
if (allocated(p)) deallocate(p,stat=ierr)
end do

contains
function deviation(array)
real,dimension(:),intent(in) :: array
real :: mean,deviation
mean=sum(array)/size(array)
deviation=sqrt(sum((array-mean)**2)/(size(array)-1))
end function deviation

end program standarddeviation
