program encapsulation

use Simple_Stats

implicit none
real,dimension(:), allocatable :: x
integer :: n,i
open(unit=10,file="statsa")
read(unit=10,fmt=*) n
allocate(x(n))
do i=1,n,1
read(unit=10,fmt=*) x(i)
end do

write(*,*) x
write(*,*) mean(x)



end program encapsulation

