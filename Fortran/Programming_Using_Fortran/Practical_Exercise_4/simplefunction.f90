program simplefunction

implicit none
real :: a,b
real :: smallnumber=0.00000001
do
write(*,*) "Type in two numbers: "
read(*,*) a,b
if ((abs(a-0) .LE. smallnumber) .AND. (abs(b-0) .LE. smallnumber)) then
write(*,*) "0+0=0, exit"
exit
else
write(*,*) a," + ",b," = ",mysum(a,b)
end if


end do

contains
function mysum(x,y)
real, intent(in) :: x,y
real :: mysum
mysum=x+y
end function mysum


end program simplefunction

